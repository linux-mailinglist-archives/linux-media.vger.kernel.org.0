Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2823BC2B1
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 20:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhGESeO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 14:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbhGESeO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jul 2021 14:34:14 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB07C061574
        for <linux-media@vger.kernel.org>; Mon,  5 Jul 2021 11:31:36 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id CDAEBC64B1; Mon,  5 Jul 2021 19:31:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1625509893; bh=WIkgReCHRgyh4aZeAjbDjoglXJnwphLIi5c0ma86+9k=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GoDPAEqGwHHx5Z11hYqfe5zzkl5Prkf4rcXyEBP3r9LThhyi2FGS2UsI26ms7077e
         v/KmCvSrbkDnm4sSSJ0z/UiP7GyawvqxAfIxppyAM77D3e55mBKCU/BQvePWGX5F+D
         wlfmYLBNKPmhxVMxSF3bKm0BiE7KDoaF5XqEuEESQw6quk1QqkOsWCZJZADlBusAAX
         ML1A1bmmGyNg6QqjLNWvFljYvsKFgX2Gkk2hgWIsHjlR/1U5JWzWGMWFjw+SqEc318
         4EQED4TkaQM6kYOTi82fZ6es7BLVagI8uCPEsi4OBJzUkoAfGJVVZg4QLXt3aOllsn
         QpG+2p5zNKHZw==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 5/5] media: rc: rename s_learning_mode() to s_wideband_receiver()
Date:   Mon,  5 Jul 2021 19:31:32 +0100
Message-Id: <40cb0597123ec81e77c74492b006ad8d9c388dd2.1625509803.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1625509803.git.sean@mess.org>
References: <cover.1625509803.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The s_learning_mode() function is called in response to the ioctl
LIRC_SET_WIDEBAND_RECEIVER, so rename it to s_wideband_receiver().

Learning mode is when both the wideband receiver is turned on and
carrier reports are enabled.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ene_ir.c      |  2 +-
 drivers/media/rc/lirc_dev.c    |  6 +++---
 drivers/media/rc/mceusb.c      |  2 +-
 drivers/media/rc/rc-loopback.c | 30 +++++++++++++++---------------
 include/media/rc-core.h        |  4 ++--
 5 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/media/rc/ene_ir.c b/drivers/media/rc/ene_ir.c
index 6049e5c95394..e09270916fbc 100644
--- a/drivers/media/rc/ene_ir.c
+++ b/drivers/media/rc/ene_ir.c
@@ -1052,7 +1052,7 @@ static int ene_probe(struct pnp_dev *pnp_dev, const struct pnp_device_id *id)
 	rdev->device_name = "ENE eHome Infrared Remote Receiver";
 
 	if (dev->hw_learning_and_tx_capable) {
-		rdev->s_learning_mode = ene_set_learning_mode;
+		rdev->s_wideband_receiver = ene_set_learning_mode;
 		init_completion(&dev->tx_complete);
 		rdev->tx_ir = ene_transmit;
 		rdev->s_tx_mask = ene_set_tx_mask;
diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index 116daf90c858..7f591ff5269d 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -412,7 +412,7 @@ static long lirc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			val |= LIRC_CAN_SET_REC_CARRIER |
 				LIRC_CAN_SET_REC_CARRIER_RANGE;
 
-		if (dev->s_learning_mode)
+		if (dev->s_wideband_receiver)
 			val |= LIRC_CAN_USE_WIDEBAND_RECEIVER;
 
 		if (dev->s_carrier_report)
@@ -519,10 +519,10 @@ static long lirc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		break;
 
 	case LIRC_SET_WIDEBAND_RECEIVER:
-		if (!dev->s_learning_mode)
+		if (!dev->s_wideband_receiver)
 			ret = -ENOTTY;
 		else
-			ret = dev->s_learning_mode(dev, !!val);
+			ret = dev->s_wideband_receiver(dev, !!val);
 		break;
 
 	case LIRC_SET_MEASURE_CARRIER_MODE:
diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index 5642595a057e..e03dd1f0144f 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -1630,7 +1630,7 @@ static struct rc_dev *mceusb_init_rc_dev(struct mceusb_dev *ir)
 		rc->tx_ir = mceusb_tx_ir;
 	}
 	if (ir->flags.rx2 > 0) {
-		rc->s_learning_mode = mceusb_set_rx_wideband;
+		rc->s_wideband_receiver = mceusb_set_rx_wideband;
 		rc->s_carrier_report = mceusb_set_rx_carrier_report;
 	}
 	rc->driver_name = DRIVER_NAME;
diff --git a/drivers/media/rc/rc-loopback.c b/drivers/media/rc/rc-loopback.c
index 40fca1226b09..6441879fcba1 100644
--- a/drivers/media/rc/rc-loopback.c
+++ b/drivers/media/rc/rc-loopback.c
@@ -15,9 +15,9 @@
 #include <linux/slab.h>
 #include <media/rc-core.h>
 
-#define DRIVER_NAME	"rc-loopback"
-#define RXMASK_REGULAR	0x1
-#define RXMASK_LEARNING	0x2
+#define DRIVER_NAME		"rc-loopback"
+#define RXMASK_NARROWBAND	0x1
+#define RXMASK_WIDEBAND		0x2
 
 struct loopback_dev {
 	struct rc_dev *dev;
@@ -25,7 +25,7 @@ struct loopback_dev {
 	u32 txcarrier;
 	u32 txduty;
 	bool idle;
-	bool learning;
+	bool wideband;
 	bool carrierreport;
 	u32 rxcarriermin;
 	u32 rxcarriermax;
@@ -37,7 +37,7 @@ static int loop_set_tx_mask(struct rc_dev *dev, u32 mask)
 {
 	struct loopback_dev *lodev = dev->priv;
 
-	if ((mask & (RXMASK_REGULAR | RXMASK_LEARNING)) != mask) {
+	if ((mask & (RXMASK_NARROWBAND | RXMASK_WIDEBAND)) != mask) {
 		dev_dbg(&dev->dev, "invalid tx mask: %u\n", mask);
 		return 2;
 	}
@@ -98,10 +98,10 @@ static int loop_tx_ir(struct rc_dev *dev, unsigned *txbuf, unsigned count)
 		goto out;
 	}
 
-	if (lodev->learning)
-		rxmask = RXMASK_LEARNING;
+	if (lodev->wideband)
+		rxmask = RXMASK_WIDEBAND;
 	else
-		rxmask = RXMASK_REGULAR;
+		rxmask = RXMASK_NARROWBAND;
 
 	if (!(rxmask & lodev->txmask)) {
 		dev_dbg(&dev->dev, "ignoring tx, rx mask mismatch\n");
@@ -144,13 +144,13 @@ static void loop_set_idle(struct rc_dev *dev, bool enable)
 	}
 }
 
-static int loop_set_learning_mode(struct rc_dev *dev, int enable)
+static int loop_set_wideband_receiver(struct rc_dev *dev, int enable)
 {
 	struct loopback_dev *lodev = dev->priv;
 
-	if (lodev->learning != enable) {
-		dev_dbg(&dev->dev, "%sing learning mode\n", enable ? "enter" : "exit");
-		lodev->learning = !!enable;
+	if (lodev->wideband != enable) {
+		dev_dbg(&dev->dev, "using %sband receiver\n", enable ? "wide" : "narrow");
+		lodev->wideband = !!enable;
 	}
 
 	return 0;
@@ -233,17 +233,17 @@ static int __init loop_init(void)
 	rc->s_rx_carrier_range	= loop_set_rx_carrier_range;
 	rc->tx_ir		= loop_tx_ir;
 	rc->s_idle		= loop_set_idle;
-	rc->s_learning_mode	= loop_set_learning_mode;
+	rc->s_wideband_receiver	= loop_set_wideband_receiver;
 	rc->s_carrier_report	= loop_set_carrier_report;
 	rc->s_wakeup_filter	= loop_set_wakeup_filter;
 
-	loopdev.txmask		= RXMASK_REGULAR;
+	loopdev.txmask		= RXMASK_NARROWBAND;
 	loopdev.txcarrier	= 36000;
 	loopdev.txduty		= 50;
 	loopdev.rxcarriermin	= 1;
 	loopdev.rxcarriermax	= ~0;
 	loopdev.idle		= true;
-	loopdev.learning	= false;
+	loopdev.wideband	= false;
 	loopdev.carrierreport	= false;
 
 	ret = rc_register_device(rc);
diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index 64b43d76f7f0..8c5b7978e1d9 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -151,7 +151,7 @@ struct lirc_fh {
  * @tx_ir: transmit IR
  * @s_idle: enable/disable hardware idle mode, upon which,
  *	device doesn't interrupt host until it sees IR pulses
- * @s_learning_mode: enable wide band receiver used for learning
+ * @s_wideband_receiver: enable wide band receiver used for learning
  * @s_carrier_report: enable carrier reports
  * @s_filter: set the scancode filter
  * @s_wakeup_filter: set the wakeup scancode filter. If the mask is zero
@@ -218,7 +218,7 @@ struct rc_dev {
 	int				(*s_rx_carrier_range)(struct rc_dev *dev, u32 min, u32 max);
 	int				(*tx_ir)(struct rc_dev *dev, unsigned *txbuf, unsigned n);
 	void				(*s_idle)(struct rc_dev *dev, bool enable);
-	int				(*s_learning_mode)(struct rc_dev *dev, int enable);
+	int				(*s_wideband_receiver)(struct rc_dev *dev, int enable);
 	int				(*s_carrier_report) (struct rc_dev *dev, int enable);
 	int				(*s_filter)(struct rc_dev *dev,
 						    struct rc_scancode_filter *filter);
-- 
2.31.1

