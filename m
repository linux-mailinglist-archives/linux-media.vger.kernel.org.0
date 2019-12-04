Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 075EE112DFC
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 16:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbfLDPDn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 10:03:43 -0500
Received: from mx2.suse.de ([195.135.220.15]:38616 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727878AbfLDPDn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Dec 2019 10:03:43 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 4AE96AECA;
        Wed,  4 Dec 2019 15:03:40 +0000 (UTC)
Message-ID: <1575471809.30318.6.camel@suse.com>
Subject: Re: KASAN: use-after-free Read in si470x_int_in_callback (2)
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+9ca7a12fd736d93e0232@syzkaller.appspotmail.com>,
        andreyknvl@google.com, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Date:   Wed, 04 Dec 2019 16:03:29 +0100
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

JUST IN CASE
Final test before submission

#syz test: https://github.com/google/kasan.git 22be26f7

From ccc2a7baec5a5117216972b1c502c5a0b97de0c4 Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Wed, 4 Dec 2019 13:40:19 +0100
Subject: [PATCH] si470x: fixup error handling of the interrupt URB

The error handling of the interrupt URB is not correct
in every case and assumes that low level errors
are either transient or end with a disconnect.

Starting IO to a device is not necessarily a NOP in every error
case. So we need to terminate all IO in every case of probe
failure and disconnect with absolute certainty.
We also must not retry forever in an error case.
As this is unlikely in an actual device, we just give
up.

Reported-and-tested-by: syzbot+9ca7a12fd736d93e0232@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/radio/si470x/radio-si470x-usb.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/radio/si470x/radio-si470x-usb.c b/drivers/media/radio/si470x/radio-si470x-usb.c
index fedff68d8c49..1b974c2683a6 100644
--- a/drivers/media/radio/si470x/radio-si470x-usb.c
+++ b/drivers/media/radio/si470x/radio-si470x-usb.c
@@ -370,15 +370,12 @@ static void si470x_int_in_callback(struct urb *urb)
 	unsigned char tmpbuf[3];
 
 	if (urb->status) {
-		if (urb->status == -ENOENT ||
+		if (!(urb->status == -ENOENT ||
 				urb->status == -ECONNRESET ||
-				urb->status == -ESHUTDOWN) {
-			return;
-		} else {
+				urb->status == -ESHUTDOWN))
 			dev_warn(&radio->intf->dev,
 			 "non-zero urb status (%d)\n", urb->status);
-			goto resubmit; /* Maybe we can recover. */
-		}
+		return;
 	}
 
 	/* Sometimes the device returns len 0 packets */
@@ -463,6 +460,7 @@ static void si470x_int_in_callback(struct urb *urb)
 	/* Resubmit if we're still running. */
 	if (radio->int_in_running && radio->usbdev) {
 		retval = usb_submit_urb(radio->int_in_urb, GFP_ATOMIC);
+		printk(KERN_ERR"In resubmit code path with result %d\n", retval);
 		if (retval) {
 			dev_warn(&radio->intf->dev,
 			       "resubmitting urb failed (%d)", retval);
@@ -542,6 +540,8 @@ static int si470x_start_usb(struct si470x_device *radio)
 		radio->int_in_running = 0;
 	}
 	radio->status_rssi_auto_update = radio->int_in_running;
+	if (retval < 0)
+		return retval;
 
 	/* start radio */
 	retval = si470x_start(radio);
@@ -734,7 +734,8 @@ static int si470x_usb_driver_probe(struct usb_interface *intf,
 	/* start radio */
 	retval = si470x_start_usb(radio);
 	if (retval < 0)
-		goto err_buf;
+		/* the urb may be running even after an error */
+		goto err_all;
 
 	/* set initial frequency */
 	si470x_set_freq(radio, 87.5 * FREQ_MUL); /* available in all regions */
@@ -749,8 +750,7 @@ static int si470x_usb_driver_probe(struct usb_interface *intf,
 
 	return 0;
 err_all:
-	usb_kill_urb(radio->int_in_urb);
-err_buf:
+	usb_poison_urb(radio->int_in_urb);
 	kfree(radio->buffer);
 err_ctrl:
 	v4l2_ctrl_handler_free(&radio->hdl);
@@ -824,7 +824,7 @@ static void si470x_usb_driver_disconnect(struct usb_interface *intf)
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

