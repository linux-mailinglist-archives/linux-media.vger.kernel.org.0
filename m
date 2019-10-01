Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5C6BC41B0
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 22:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbfJAUTM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 16:19:12 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:49210 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725851AbfJAUTM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 16:19:12 -0400
Received: (qmail 8144 invoked by uid 2102); 1 Oct 2019 16:19:11 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 1 Oct 2019 16:19:11 -0400
Date:   Tue, 1 Oct 2019 16:19:11 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
cc:     linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH 2/2] media: usbvision: Fix races among open, close, and
 disconnect
Message-ID: <Pine.LNX.4.44L0.1910011614160.1991-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Visual inspection of the usbvision driver shows that it suffers from
three races between its open, close, and disconnect handlers.  In
particular, the driver is careful to update its usbvision->user and
usbvision->remove_pending flags while holding the private mutex, but:

	usbvision_v4l2_close() and usbvision_radio_close() don't hold
	the mutex while they check the value of
	usbvision->remove_pending;

	usbvision_disconnect() doesn't hold the mutex while checking
	the value of usbvision->user; and

	also, usbvision_v4l2_open() and usbvision_radio_open() don't
	check whether the device has been unplugged before allowing
	the user to open the device files.

Each of these can potentially lead to usbvision_release() being called
twice and use-after-free errors.

This patch fixes the races by reading the flags while the mutex is
still held and checking for pending removes before allowing an open to
succeed.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: <stable@vger.kernel.org>

---

[as1920]


 drivers/media/usb/usbvision/usbvision-video.c |   21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

Index: usb-devel/drivers/media/usb/usbvision/usbvision-video.c
===================================================================
--- usb-devel.orig/drivers/media/usb/usbvision/usbvision-video.c
+++ usb-devel/drivers/media/usb/usbvision/usbvision-video.c
@@ -314,6 +314,10 @@ static int usbvision_v4l2_open(struct fi
 	if (mutex_lock_interruptible(&usbvision->v4l2_lock))
 		return -ERESTARTSYS;
 
+	if (usbvision->remove_pending) {
+		err_code = -ENODEV;
+		goto unlock;
+	}
 	if (usbvision->user) {
 		err_code = -EBUSY;
 	} else {
@@ -377,6 +381,7 @@ unlock:
 static int usbvision_v4l2_close(struct file *file)
 {
 	struct usb_usbvision *usbvision = video_drvdata(file);
+	int r;
 
 	PDEBUG(DBG_IO, "close");
 
@@ -391,9 +396,10 @@ static int usbvision_v4l2_close(struct f
 	usbvision_scratch_free(usbvision);
 
 	usbvision->user--;
+	r = usbvision->remove_pending;
 	mutex_unlock(&usbvision->v4l2_lock);
 
-	if (usbvision->remove_pending) {
+	if (r) {
 		printk(KERN_INFO "%s: Final disconnect\n", __func__);
 		usbvision_release(usbvision);
 		return 0;
@@ -1076,6 +1082,11 @@ static int usbvision_radio_open(struct f
 
 	if (mutex_lock_interruptible(&usbvision->v4l2_lock))
 		return -ERESTARTSYS;
+
+	if (usbvision->remove_pending) {
+		err_code = -ENODEV;
+		goto out;
+	}
 	err_code = v4l2_fh_open(file);
 	if (err_code)
 		goto out;
@@ -1108,6 +1119,7 @@ out:
 static int usbvision_radio_close(struct file *file)
 {
 	struct usb_usbvision *usbvision = video_drvdata(file);
+	int r;
 
 	PDEBUG(DBG_IO, "");
 
@@ -1121,9 +1133,10 @@ static int usbvision_radio_close(struct
 	usbvision_audio_off(usbvision);
 	usbvision->radio = 0;
 	usbvision->user--;
+	r = usbvision->remove_pending;
 	mutex_unlock(&usbvision->v4l2_lock);
 
-	if (usbvision->remove_pending) {
+	if (r) {
 		printk(KERN_INFO "%s: Final disconnect\n", __func__);
 		v4l2_fh_release(file);
 		usbvision_release(usbvision);
@@ -1555,6 +1568,7 @@ err_usb:
 static void usbvision_disconnect(struct usb_interface *intf)
 {
 	struct usb_usbvision *usbvision = to_usbvision(usb_get_intfdata(intf));
+	int u;
 
 	PDEBUG(DBG_PROBE, "");
 
@@ -1571,13 +1585,14 @@ static void usbvision_disconnect(struct
 	v4l2_device_disconnect(&usbvision->v4l2_dev);
 	usbvision_i2c_unregister(usbvision);
 	usbvision->remove_pending = 1;	/* Now all ISO data will be ignored */
+	u = usbvision->user;
 
 	usb_put_dev(usbvision->dev);
 	usbvision->dev = NULL;	/* USB device is no more */
 
 	mutex_unlock(&usbvision->v4l2_lock);
 
-	if (usbvision->user) {
+	if (u) {
 		printk(KERN_INFO "%s: In use, disconnect pending\n",
 		       __func__);
 		wake_up_interruptible(&usbvision->wait_frame);

