Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBB945A3002
	for <lists+linux-media@lfdr.de>; Fri, 26 Aug 2022 21:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238272AbiHZTbq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Aug 2022 15:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236442AbiHZTbn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Aug 2022 15:31:43 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 44BC8E01F3
        for <linux-media@vger.kernel.org>; Fri, 26 Aug 2022 12:31:41 -0700 (PDT)
Received: (qmail 48560 invoked by uid 1000); 26 Aug 2022 15:31:40 -0400
Date:   Fri, 26 Aug 2022 15:31:40 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Rondreis <linhaoguo86@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] media: mceusb: Use new usb_control_msg_*() routines
Message-ID: <YwkfnBFCSEVC6XZu@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Automatic kernel fuzzing led to a WARN about invalid pipe direction in
the mceusb driver:

------------[ cut here ]------------
usb 6-1: BOGUS control dir, pipe 80000380 doesn't match bRequestType 40
WARNING: CPU: 0 PID: 2465 at drivers/usb/core/urb.c:410
usb_submit_urb+0x1326/0x1820 drivers/usb/core/urb.c:410
Modules linked in:
CPU: 0 PID: 2465 Comm: kworker/0:2 Not tainted 5.19.0-rc4-00208-g69cb6c6556ad #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_submit_urb+0x1326/0x1820 drivers/usb/core/urb.c:410
Code: 7c 24 40 e8 ac 23 91 fd 48 8b 7c 24 40 e8 b2 70 1b ff 45 89 e8
44 89 f1 4c 89 e2 48 89 c6 48 c7 c7 a0 30 a9 86 e8 48 07 11 02 <0f> 0b
e9 1c f0 ff ff e8 7e 23 91 fd 0f b6 1d 63 22 83 05 31 ff 41
RSP: 0018:ffffc900032becf0 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffff8881100f3058 RCX: 0000000000000000
RDX: ffffc90004961000 RSI: ffff888114c6d580 RDI: fffff52000657d90
RBP: ffff888105ad90f0 R08: ffffffff812c3638 R09: 0000000000000000
R10: 0000000000000005 R11: ffffed1023504ef1 R12: ffff888105ad9000
R13: 0000000000000040 R14: 0000000080000380 R15: ffff88810ba96500
FS: 0000000000000000(0000) GS:ffff88811a800000(0000) knlGS:0000000000000000
CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffe810bda58 CR3: 000000010b720000 CR4: 0000000000350ef0
Call Trace:
<TASK>
usb_start_wait_urb+0x101/0x4c0 drivers/usb/core/message.c:58
usb_internal_control_msg drivers/usb/core/message.c:102 [inline]
usb_control_msg+0x31c/0x4a0 drivers/usb/core/message.c:153
mceusb_gen1_init drivers/media/rc/mceusb.c:1431 [inline]
mceusb_dev_probe+0x258e/0x33f0 drivers/media/rc/mceusb.c:1807


The reason for the warning is clear enough; the driver sends an
unusual read request on endpoint 0 but does not set the USB_DIR_IN bit
in the bRequestType field.

More importantly, the whole situation can be avoided and the driver
simplified by converting it over to the relatively new
usb_control_msg_recv() and usb_control_msg_send() routines.  That's
what this fix does.

Reported-and-tested-by: Rondreis <linhaoguo86@gmail.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/CAB7eexLLApHJwZfMQ=X-PtRhw0BgO+5KcSMS05FNUYejJXqtSA@mail.gmail.com/

---


[as1986]


 drivers/media/rc/mceusb.c |   35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

Index: usb-devel/drivers/media/rc/mceusb.c
===================================================================
--- usb-devel.orig/drivers/media/rc/mceusb.c
+++ usb-devel/drivers/media/rc/mceusb.c
@@ -1416,42 +1416,37 @@ static void mceusb_gen1_init(struct mceu
 {
 	int ret;
 	struct device *dev = ir->dev;
-	char *data;
-
-	data = kzalloc(USB_CTRL_MSG_SZ, GFP_KERNEL);
-	if (!data) {
-		dev_err(dev, "%s: memory allocation failed!", __func__);
-		return;
-	}
+	char data[USB_CTRL_MSG_SZ];
 
 	/*
 	 * This is a strange one. Windows issues a set address to the device
 	 * on the receive control pipe and expect a certain value pair back
 	 */
-	ret = usb_control_msg(ir->usbdev, usb_rcvctrlpipe(ir->usbdev, 0),
-			      USB_REQ_SET_ADDRESS, USB_TYPE_VENDOR, 0, 0,
-			      data, USB_CTRL_MSG_SZ, 3000);
+	ret = usb_control_msg_recv(ir->usbdev, 0, USB_REQ_SET_ADDRESS,
+				   USB_DIR_IN | USB_TYPE_VENDOR,
+				   0, 0, data, USB_CTRL_MSG_SZ, 3000,
+				   GFP_KERNEL);
 	dev_dbg(dev, "set address - ret = %d", ret);
 	dev_dbg(dev, "set address - data[0] = %d, data[1] = %d",
 						data[0], data[1]);
 
 	/* set feature: bit rate 38400 bps */
-	ret = usb_control_msg(ir->usbdev, usb_sndctrlpipe(ir->usbdev, 0),
-			      USB_REQ_SET_FEATURE, USB_TYPE_VENDOR,
-			      0xc04e, 0x0000, NULL, 0, 3000);
+	ret = usb_control_msg_send(ir->usbdev, 0,
+				   USB_REQ_SET_FEATURE, USB_TYPE_VENDOR,
+				   0xc04e, 0x0000, NULL, 0, 3000, GFP_KERNEL);
 
 	dev_dbg(dev, "set feature - ret = %d", ret);
 
 	/* bRequest 4: set char length to 8 bits */
-	ret = usb_control_msg(ir->usbdev, usb_sndctrlpipe(ir->usbdev, 0),
-			      4, USB_TYPE_VENDOR,
-			      0x0808, 0x0000, NULL, 0, 3000);
+	ret = usb_control_msg_send(ir->usbdev, 0,
+				   4, USB_TYPE_VENDOR,
+				   0x0808, 0x0000, NULL, 0, 3000, GFP_KERNEL);
 	dev_dbg(dev, "set char length - retB = %d", ret);
 
 	/* bRequest 2: set handshaking to use DTR/DSR */
-	ret = usb_control_msg(ir->usbdev, usb_sndctrlpipe(ir->usbdev, 0),
-			      2, USB_TYPE_VENDOR,
-			      0x0000, 0x0100, NULL, 0, 3000);
+	ret = usb_control_msg_send(ir->usbdev, 0,
+				   2, USB_TYPE_VENDOR,
+				   0x0000, 0x0100, NULL, 0, 3000, GFP_KERNEL);
 	dev_dbg(dev, "set handshake  - retC = %d", ret);
 
 	/* device resume */
@@ -1459,8 +1454,6 @@ static void mceusb_gen1_init(struct mceu
 
 	/* get hw/sw revision? */
 	mce_command_out(ir, GET_REVISION, sizeof(GET_REVISION));
-
-	kfree(data);
 }
 
 static void mceusb_gen2_init(struct mceusb_dev *ir)
