Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0BB3BC2AB
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 20:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhGESeM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 14:34:12 -0400
Received: from gofer.mess.org ([88.97.38.141]:38517 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229811AbhGESeM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Jul 2021 14:34:12 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5CD5FC6463; Mon,  5 Jul 2021 19:31:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1625509893; bh=3CQhAHBSbs+Le8jsuowOR2MPNUM9ASGmL3ITMqEh9jk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SUisFQJ2EE7WRTWXbo3kkc0kDb7nvGmMyNrWs0SZGK+VLNSP4Xg2gjGxvFNMuiVXU
         CkfVjAJvHJflLHNEXj+MlYHkZ/vOmrOSR5gF0aONoifb/xlfdnRHgwGzFJfnSNO1xC
         6ycMwKbVoByBRQzUzcSV5BeioT/uz0FilxDorRuTs3OtoPIHQG8Ak3NSett9l+X2Ni
         bln76PMvk5ANTjOVVjAyOONfl9Q6sx1maDbb00VuwLObMRpcZj0W2A1LeTZveOZksq
         G5sk1z4ReJoe3IVNmkSL8vJcP291nUHsMwExrUgRiR9vQsySy4Ppk5Z61Bv2EDQKjx
         5ivAXeD0gVBSQ==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 2/5] media: rc-loopback: use dev_dbg() rather than handrolled debug
Date:   Mon,  5 Jul 2021 19:31:29 +0100
Message-Id: <6543a93009d82ef136d942d5c87e626e22829cda.1625509803.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1625509803.git.sean@mess.org>
References: <cover.1625509803.git.sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/rc-loopback.c | 36 +++++++++++++---------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/media/rc/rc-loopback.c b/drivers/media/rc/rc-loopback.c
index 40ab66c850f2..5adfbb6989ee 100644
--- a/drivers/media/rc/rc-loopback.c
+++ b/drivers/media/rc/rc-loopback.c
@@ -16,12 +16,9 @@
 #include <media/rc-core.h>
 
 #define DRIVER_NAME	"rc-loopback"
-#define dprintk(x...)	if (debug) printk(KERN_INFO DRIVER_NAME ": " x)
 #define RXMASK_REGULAR	0x1
 #define RXMASK_LEARNING	0x2
 
-static bool debug;
-
 struct loopback_dev {
 	struct rc_dev *dev;
 	u32 txmask;
@@ -41,11 +38,11 @@ static int loop_set_tx_mask(struct rc_dev *dev, u32 mask)
 	struct loopback_dev *lodev = dev->priv;
 
 	if ((mask & (RXMASK_REGULAR | RXMASK_LEARNING)) != mask) {
-		dprintk("invalid tx mask: %u\n", mask);
+		dev_dbg(&dev->dev, "invalid tx mask: %u\n", mask);
 		return 2;
 	}
 
-	dprintk("setting tx mask: %u\n", mask);
+	dev_dbg(&dev->dev, "setting tx mask: %u\n", mask);
 	lodev->txmask = mask;
 	return 0;
 }
@@ -54,7 +51,7 @@ static int loop_set_tx_carrier(struct rc_dev *dev, u32 carrier)
 {
 	struct loopback_dev *lodev = dev->priv;
 
-	dprintk("setting tx carrier: %u\n", carrier);
+	dev_dbg(&dev->dev, "setting tx carrier: %u\n", carrier);
 	lodev->txcarrier = carrier;
 	return 0;
 }
@@ -64,11 +61,11 @@ static int loop_set_tx_duty_cycle(struct rc_dev *dev, u32 duty_cycle)
 	struct loopback_dev *lodev = dev->priv;
 
 	if (duty_cycle < 1 || duty_cycle > 99) {
-		dprintk("invalid duty cycle: %u\n", duty_cycle);
+		dev_dbg(&dev->dev, "invalid duty cycle: %u\n", duty_cycle);
 		return -EINVAL;
 	}
 
-	dprintk("setting duty cycle: %u\n", duty_cycle);
+	dev_dbg(&dev->dev, "setting duty cycle: %u\n", duty_cycle);
 	lodev->txduty = duty_cycle;
 	return 0;
 }
@@ -78,11 +75,11 @@ static int loop_set_rx_carrier_range(struct rc_dev *dev, u32 min, u32 max)
 	struct loopback_dev *lodev = dev->priv;
 
 	if (min < 1 || min > max) {
-		dprintk("invalid rx carrier range %u to %u\n", min, max);
+		dev_dbg(&dev->dev, "invalid rx carrier range %u to %u\n", min, max);
 		return -EINVAL;
 	}
 
-	dprintk("setting rx carrier range %u to %u\n", min, max);
+	dev_dbg(&dev->dev, "setting rx carrier range %u to %u\n", min, max);
 	lodev->rxcarriermin = min;
 	lodev->rxcarriermax = max;
 	return 0;
@@ -97,7 +94,7 @@ static int loop_tx_ir(struct rc_dev *dev, unsigned *txbuf, unsigned count)
 
 	if (lodev->txcarrier < lodev->rxcarriermin ||
 	    lodev->txcarrier > lodev->rxcarriermax) {
-		dprintk("ignoring tx, carrier out of range\n");
+		dev_dbg(&dev->dev, "ignoring tx, carrier out of range\n");
 		goto out;
 	}
 
@@ -107,7 +104,7 @@ static int loop_tx_ir(struct rc_dev *dev, unsigned *txbuf, unsigned count)
 		rxmask = RXMASK_REGULAR;
 
 	if (!(rxmask & lodev->txmask)) {
-		dprintk("ignoring tx, rx mask mismatch\n");
+		dev_dbg(&dev->dev, "ignoring tx, rx mask mismatch\n");
 		goto out;
 	}
 
@@ -134,7 +131,7 @@ static void loop_set_idle(struct rc_dev *dev, bool enable)
 	struct loopback_dev *lodev = dev->priv;
 
 	if (lodev->idle != enable) {
-		dprintk("%sing idle mode\n", enable ? "enter" : "exit");
+		dev_dbg(&dev->dev, "%sing idle mode\n", enable ? "enter" : "exit");
 		lodev->idle = enable;
 	}
 }
@@ -144,7 +141,7 @@ static int loop_set_learning_mode(struct rc_dev *dev, int enable)
 	struct loopback_dev *lodev = dev->priv;
 
 	if (lodev->learning != enable) {
-		dprintk("%sing learning mode\n", enable ? "enter" : "exit");
+		dev_dbg(&dev->dev, "%sing learning mode\n", enable ? "enter" : "exit");
 		lodev->learning = !!enable;
 	}
 
@@ -156,7 +153,7 @@ static int loop_set_carrier_report(struct rc_dev *dev, int enable)
 	struct loopback_dev *lodev = dev->priv;
 
 	if (lodev->carrierreport != enable) {
-		dprintk("%sabling carrier reports\n", enable ? "en" : "dis");
+		dev_dbg(&dev->dev, "%sabling carrier reports\n", enable ? "en" : "dis");
 		lodev->carrierreport = !!enable;
 	}
 
@@ -204,10 +201,8 @@ static int __init loop_init(void)
 	int ret;
 
 	rc = rc_allocate_device(RC_DRIVER_IR_RAW);
-	if (!rc) {
-		printk(KERN_ERR DRIVER_NAME ": rc_dev allocation failed\n");
+	if (!rc)
 		return -ENOMEM;
-	}
 
 	rc->device_name		= "rc-core loopback device";
 	rc->input_phys		= "rc-core/virtual";
@@ -245,7 +240,7 @@ static int __init loop_init(void)
 
 	ret = rc_register_device(rc);
 	if (ret < 0) {
-		printk(KERN_ERR DRIVER_NAME ": rc_dev registration failed\n");
+		dev_err(&rc->dev, "rc_dev registration failed\n");
 		rc_free_device(rc);
 		return ret;
 	}
@@ -262,9 +257,6 @@ static void __exit loop_exit(void)
 module_init(loop_init);
 module_exit(loop_exit);
 
-module_param(debug, bool, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(debug, "Enable debug messages");
-
 MODULE_DESCRIPTION("Loopback device for rc-core debugging");
 MODULE_AUTHOR("David Härdeman <david@hardeman.nu>");
 MODULE_LICENSE("GPL");
-- 
2.31.1

