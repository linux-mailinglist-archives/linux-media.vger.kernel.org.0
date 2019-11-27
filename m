Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2B910B526
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2019 19:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbfK0SHO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Nov 2019 13:07:14 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:38486 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726593AbfK0SHO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Nov 2019 13:07:14 -0500
Received: (qmail 2901 invoked by uid 2102); 27 Nov 2019 13:07:13 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 27 Nov 2019 13:07:13 -0500
Date:   Wed, 27 Nov 2019 13:07:13 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+9ca7a12fd736d93e0232@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <hverkuil@xs4all.nl>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <mchehab@kernel.org>,
        <oneukum@suse.com>, <syzkaller-bugs@googlegroups.com>
Subject: Re: KASAN: use-after-free Read in si470x_int_in_callback (2)
In-Reply-To: <0000000000001dec4905985682c9@google.com>
Message-ID: <Pine.LNX.4.44L0.1911271304410.1319-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 27 Nov 2019, syzbot wrote:

> Hello,
> 
> syzbot has tested the proposed patch but the reproducer still triggered  
> crash:
> INFO: rcu detected stall in dummy_timer
> 
> radio-si470x 5-1:0.0: non-zero urb status (-71)
> radio-si470x 3-1:0.0: non-zero urb status (-71)
> rcu: INFO: rcu_sched self-detected stall on CPU
> rcu: 	1-....: (8213 ticks this GP) idle=4f6/1/0x4000000000000004  

Almost the same as Oliver's patch, but this one stops when the 
interrupt-IN URB gets an unrecognized error status.

Alan Stern

#syz test: https://github.com/google/kasan.git 22be26f7

Index: usb-devel/drivers/media/radio/si470x/radio-si470x-usb.c
===================================================================
--- usb-devel.orig/drivers/media/radio/si470x/radio-si470x-usb.c
+++ usb-devel/drivers/media/radio/si470x/radio-si470x-usb.c
@@ -370,15 +370,14 @@ static void si470x_int_in_callback(struc
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
-			 "non-zero urb status (%d)\n", urb->status);
-			goto resubmit; /* Maybe we can recover. */
-		}
+					"unrecognized urb status (%d)\n",
+					urb->status);
+		radio->int_in_running = 0;
+		return;
 	}
 
 	/* Sometimes the device returns len 0 packets */
@@ -542,6 +541,8 @@ static int si470x_start_usb(struct si470
 		radio->int_in_running = 0;
 	}
 	radio->status_rssi_auto_update = radio->int_in_running;
+	if (retval < 0)
+		return retval;
 
 	/* start radio */
 	retval = si470x_start(radio);
@@ -734,7 +735,8 @@ static int si470x_usb_driver_probe(struc
 	/* start radio */
 	retval = si470x_start_usb(radio);
 	if (retval < 0)
-		goto err_buf;
+		/* the urb may be running even after an error */
+		goto err_all;
 
 	/* set initial frequency */
 	si470x_set_freq(radio, 87.5 * FREQ_MUL); /* available in all regions */
@@ -749,7 +751,7 @@ static int si470x_usb_driver_probe(struc
 
 	return 0;
 err_all:
-	usb_kill_urb(radio->int_in_urb);
+	usb_poison_urb(radio->int_in_urb);
 err_buf:
 	kfree(radio->buffer);
 err_ctrl:
@@ -824,7 +826,7 @@ static void si470x_usb_driver_disconnect
 	mutex_lock(&radio->lock);
 	v4l2_device_disconnect(&radio->v4l2_dev);
 	video_unregister_device(&radio->videodev);
-	usb_kill_urb(radio->int_in_urb);
+	usb_poison_urb(radio->int_in_urb);
 	usb_set_intfdata(intf, NULL);
 	mutex_unlock(&radio->lock);
 	v4l2_device_put(&radio->v4l2_dev);

