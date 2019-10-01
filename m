Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 437AFC41AC
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 22:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbfJAUSz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 16:18:55 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:49192 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726068AbfJAUSz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 16:18:55 -0400
Received: (qmail 8138 invoked by uid 2102); 1 Oct 2019 16:18:54 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 1 Oct 2019 16:18:54 -0400
Date:   Tue, 1 Oct 2019 16:18:54 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
cc:     linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH 1/2] media: usbvision: Fix invalid accesses after device
 disconnect
Message-ID: <Pine.LNX.4.44L0.1910011611300.1991-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The syzbot fuzzer found two invalid-access bugs in the usbvision
driver.  These bugs occur when userspace keeps the device file open
after the device has been disconnected and usbvision_disconnect() has
set usbvision->dev to NULL:

	When the device file is closed, usbvision_radio_close() tries
	to issue a usb_set_interface() call, passing the NULL pointer
	as its first argument.

	If userspace performs a querycap ioctl call, vidioc_querycap()
	calls usb_make_path() with the same NULL pointer.

This patch fixes the problems by making the appropriate tests
beforehand.  Note that vidioc_querycap() is protected by
usbvision->v4l2_lock, acquired in a higher layer of the V4L2
subsystem.

Reported-and-tested-by: syzbot+7fa38a608b1075dfd634@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: <stable@vger.kernel.org>

---

[as1919]

 drivers/media/usb/usbvision/usbvision-video.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

Index: usb-devel/drivers/media/usb/usbvision/usbvision-video.c
===================================================================
--- usb-devel.orig/drivers/media/usb/usbvision/usbvision-video.c
+++ usb-devel/drivers/media/usb/usbvision/usbvision-video.c
@@ -453,6 +453,9 @@ static int vidioc_querycap(struct file *
 {
 	struct usb_usbvision *usbvision = video_drvdata(file);
 
+	if (!usbvision->dev)
+		return -ENODEV;
+
 	strscpy(vc->driver, "USBVision", sizeof(vc->driver));
 	strscpy(vc->card,
 		usbvision_device_data[usbvision->dev_model].model_string,
@@ -1111,7 +1114,8 @@ static int usbvision_radio_close(struct
 	mutex_lock(&usbvision->v4l2_lock);
 	/* Set packet size to 0 */
 	usbvision->iface_alt = 0;
-	usb_set_interface(usbvision->dev, usbvision->iface,
+	if (usbvision->dev)
+		usb_set_interface(usbvision->dev, usbvision->iface,
 				    usbvision->iface_alt);
 
 	usbvision_audio_off(usbvision);

