Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED7D3BA919
	for <lists+linux-media@lfdr.de>; Sat,  3 Jul 2021 17:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbhGCPGd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Jul 2021 11:06:33 -0400
Received: from gofer.mess.org ([88.97.38.141]:41551 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229812AbhGCPG3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 3 Jul 2021 11:06:29 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id AEE44C64A8; Sat,  3 Jul 2021 16:03:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1625324634; bh=agUxeKr/3UVblc3++bCbt/yH1XmBlg4iNi8Mk/Oefog=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Zoq33wNkNDcH2tDU0rKJgVwQE4foeO8hmCAMlQ25SxynlbvUK68KuT3YHRYwKRMAD
         FSakhPS7+R2aDgWqEQHASYL+cwrtA7YB309Aauipt9oUAfR1fwsozlFkeNnyrkBzwi
         fAeEhl5PikhDJUSb3rmwbdE8YEgBHg8p6WH7AD1Q1eKbloB7SGpFdl10PQD0E+jEQt
         1cAUO016dfKQQWeSdaN6ICIeksyqVc2NgLEH7CDefbnNqmoDlKtvpicotxltFeCsFM
         YvGYJ8pWBKkt31Cl3G49f7yIlfbMKSOqiBoqK4IwbWB3ulO4YZgEDoHtqN5t4hTnqk
         5DFfhs/4Kv3TA==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 4/4] media: rc: rename s_learning_mode() to s_wideband_receiver()
Date:   Sat,  3 Jul 2021 16:03:54 +0100
Message-Id: <68efb9b4f0ef7eb086c4ed567c7dce8eef60290d.1625324530.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1625324530.git.sean@mess.org>
References: <cover.1625324530.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Learning mode is when both wideband receiver is turned on and the
carrier reports are enabled. This function should only enable the
wideband receiver.

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
index f1db8c46e1da..15410ac320f1 100644
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
@@ -37,9 +37,9 @@ static int loop_set_tx_mask(struct rc_dev *dev, u32 mask)
 {
 	struct loopback_dev *lodev = dev->priv;
 
-	if ((mask & (RXMASK_REGULAR | RXMASK_LEARNING)) != mask) {
+	if ((mask & (RXMASK_NARROWBAND | RXMASK_WIDEBAND)) != mask) {
 		dev_dbg(&dev->dev, "invalid tx mask: %u\n", mask);
-		return RXMASK_REGULAR | RXMASK_LEARNING;
+		return RXMASK_NARROWBAND | RXMASK_WIDEBAND;
 	}
 
 	dev_dbg(&dev->dev, "setting tx mask: %u\n", mask);
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
+	if (lodev->wideband != enable) {
 		dev_dbg(&dev->dev, "%sing learning mode\n", enable ? "enter" : "exit");
-		lodev->learning = !!enable;
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
index a1019c4ab5e8..b667b9a65926 100644
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

