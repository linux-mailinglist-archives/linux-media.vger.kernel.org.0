Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4D510C7C2
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2019 12:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfK1LKz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Nov 2019 06:10:55 -0500
Received: from mx2.suse.de ([195.135.220.15]:52730 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726582AbfK1LKz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Nov 2019 06:10:55 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D2AD6AD10;
        Thu, 28 Nov 2019 11:10:52 +0000 (UTC)
Message-ID: <1574939450.21204.7.camel@suse.com>
Subject: Re: KASAN: use-after-free Read in si470x_int_in_callback (2)
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+9ca7a12fd736d93e0232@syzkaller.appspotmail.com>,
        andreyknvl@google.com, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Date:   Thu, 28 Nov 2019 12:10:50 +0100
In-Reply-To: <000000000000f47f0b0595307ddc@google.com>
References: <000000000000f47f0b0595307ddc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Freitag, den 18.10.2019, 07:53 -0700 schrieb syzbot:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    22be26f7 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=102b65cf600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=387eccb7ac68ec5
> dashboard link: https://syzkaller.appspot.com/bug?extid=9ca7a12fd736d93e0232
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=143b9060e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15d3b94b600000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+9ca7a12fd736d93e0232@syzkaller.appspotmail.com

JUST FOR DEBUGGING

#syz test: https://github.com/google/kasan.git 22be26f7

From 6e4c324c34b2fead2bdd1bc1274bd2e978df2be5 Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Mon, 18 Nov 2019 14:41:51 +0100
Subject: [PATCH] si470x: prevent resubmission

Starting IO to a device is not necessarily a NOP in every error
case. So we need to terminate all IO in every case of probe
failure and disconnect with absolute certainty.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/radio/si470x/radio-si470x-usb.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/radio/si470x/radio-si470x-usb.c b/drivers/media/radio/si470x/radio-si470x-usb.c
index fedff68d8c49..3a3c539ee39a 100644
--- a/drivers/media/radio/si470x/radio-si470x-usb.c
+++ b/drivers/media/radio/si470x/radio-si470x-usb.c
@@ -373,6 +373,7 @@ static void si470x_int_in_callback(struct urb *urb)
 		if (urb->status == -ENOENT ||
 				urb->status == -ECONNRESET ||
 				urb->status == -ESHUTDOWN) {
+			printk(KERN_ERR"Int URB killed\n");
 			return;
 		} else {
 			dev_warn(&radio->intf->dev,
@@ -463,6 +464,7 @@ static void si470x_int_in_callback(struct urb *urb)
 	/* Resubmit if we're still running. */
 	if (radio->int_in_running && radio->usbdev) {
 		retval = usb_submit_urb(radio->int_in_urb, GFP_ATOMIC);
+		printk(KERN_ERR"In resubmit code path with result %d\n", retval);
 		if (retval) {
 			dev_warn(&radio->intf->dev,
 			       "resubmitting urb failed (%d)", retval);
@@ -542,6 +544,8 @@ static int si470x_start_usb(struct si470x_device *radio)
 		radio->int_in_running = 0;
 	}
 	radio->status_rssi_auto_update = radio->int_in_running;
+	if (retval < 0)
+		return retval;
 
 	/* start radio */
 	retval = si470x_start(radio);
@@ -734,7 +738,8 @@ static int si470x_usb_driver_probe(struct usb_interface *intf,
 	/* start radio */
 	retval = si470x_start_usb(radio);
 	if (retval < 0)
-		goto err_buf;
+		/* the urb may be running even after an error */
+		goto err_all;
 
 	/* set initial frequency */
 	si470x_set_freq(radio, 87.5 * FREQ_MUL); /* available in all regions */
@@ -749,7 +754,7 @@ static int si470x_usb_driver_probe(struct usb_interface *intf,
 
 	return 0;
 err_all:
-	usb_kill_urb(radio->int_in_urb);
+	usb_poison_urb(radio->int_in_urb);
 err_buf:
 	kfree(radio->buffer);
 err_ctrl:
@@ -824,7 +829,7 @@ static void si470x_usb_driver_disconnect(struct usb_interface *intf)
 	mutex_lock(&radio->lock);
 	v4l2_device_disconnect(&radio->v4l2_dev);
 	video_unregister_device(&radio->videodev);
-	usb_kill_urb(radio->int_in_urb);
+	usb_poison_urb(radio->int_in_urb);
 	usb_set_intfdata(intf, NULL);
 	mutex_unlock(&radio->lock);
 	v4l2_device_put(&radio->v4l2_dev);
-- 
2.16.4

