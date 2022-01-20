Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42CE949522F
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 17:16:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376908AbiATQQS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 11:16:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376950AbiATQQR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 11:16:17 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0466C06161C
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 08:16:16 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1018D101C5E; Thu, 20 Jan 2022 16:16:14 +0000 (UTC)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: rc-core: rename ir_raw_event_reset to ir_raw_event_overflow
Date:   Thu, 20 Jan 2022 16:16:13 +0000
Message-Id: <20220120161614.328202-1-sean@mess.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver report a reset event when the hardware reports and overflow.
There is no reason to have a generic "reset" event.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/pci/cx23885/cx23885-input.c | 2 +-
 drivers/media/rc/fintek-cir.c             | 2 +-
 drivers/media/rc/igorplugusb.c            | 2 +-
 drivers/media/rc/iguanair.c               | 2 +-
 drivers/media/rc/ir-hix5hd2.c             | 2 +-
 drivers/media/rc/ir-imon-decoder.c        | 2 +-
 drivers/media/rc/ir-jvc-decoder.c         | 2 +-
 drivers/media/rc/ir-mce_kbd-decoder.c     | 2 +-
 drivers/media/rc/ir-nec-decoder.c         | 2 +-
 drivers/media/rc/ir-rc5-decoder.c         | 2 +-
 drivers/media/rc/ir-rc6-decoder.c         | 2 +-
 drivers/media/rc/ir-rcmm-decoder.c        | 2 +-
 drivers/media/rc/ir-sanyo-decoder.c       | 4 ++--
 drivers/media/rc/ir-sharp-decoder.c       | 2 +-
 drivers/media/rc/ir-sony-decoder.c        | 2 +-
 drivers/media/rc/ir-xmp-decoder.c         | 2 +-
 drivers/media/rc/ite-cir.c                | 2 +-
 drivers/media/rc/lirc_dev.c               | 8 ++++----
 drivers/media/rc/nuvoton-cir.c            | 2 +-
 drivers/media/rc/rc-core-priv.h           | 2 +-
 drivers/media/rc/rc-ir-raw.c              | 2 --
 drivers/media/rc/st_rc.c                  | 2 +-
 drivers/media/rc/sunxi-cir.c              | 2 +-
 drivers/media/rc/winbond-cir.c            | 2 +-
 include/media/rc-core.h                   | 6 +++---
 25 files changed, 30 insertions(+), 32 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-input.c b/drivers/media/pci/cx23885/cx23885-input.c
index 19c34e5510ee..d2e84c6457e0 100644
--- a/drivers/media/pci/cx23885/cx23885-input.c
+++ b/drivers/media/pci/cx23885/cx23885-input.c
@@ -55,7 +55,7 @@ static void cx23885_input_process_measurements(struct cx23885_dev *dev,
 	} while (num != 0);
 
 	if (overrun)
-		ir_raw_event_reset(kernel_ir->rc);
+		ir_raw_event_overflow(kernel_ir->rc);
 	else if (handle)
 		ir_raw_event_handle(kernel_ir->rc);
 }
diff --git a/drivers/media/rc/fintek-cir.c b/drivers/media/rc/fintek-cir.c
index b0d580566e4e..3fb0968efd57 100644
--- a/drivers/media/rc/fintek-cir.c
+++ b/drivers/media/rc/fintek-cir.c
@@ -287,7 +287,7 @@ static void fintek_process_rx_ir_data(struct fintek_dev *fintek)
 			if (fintek->rem)
 				fintek->parser_state = PARSE_IRDATA;
 			else
-				ir_raw_event_reset(fintek->rdev);
+				ir_raw_event_overflow(fintek->rdev);
 			break;
 		case SUBCMD:
 			fintek->rem = fintek_cmdsize(fintek->cmd, sample);
diff --git a/drivers/media/rc/igorplugusb.c b/drivers/media/rc/igorplugusb.c
index 3e9988ee785f..b40dbf500186 100644
--- a/drivers/media/rc/igorplugusb.c
+++ b/drivers/media/rc/igorplugusb.c
@@ -67,7 +67,7 @@ static void igorplugusb_irdata(struct igorplugusb *ir, unsigned len)
 		if (overflow > 0) {
 			dev_warn(ir->dev, "receive overflow, at least %u lost",
 								overflow);
-			ir_raw_event_reset(ir->rc);
+			ir_raw_event_overflow(ir->rc);
 		}
 
 		do {
diff --git a/drivers/media/rc/iguanair.c b/drivers/media/rc/iguanair.c
index f8d080e41f4c..c9cb8277723f 100644
--- a/drivers/media/rc/iguanair.c
+++ b/drivers/media/rc/iguanair.c
@@ -109,7 +109,7 @@ static void process_ir_data(struct iguanair *ir, unsigned len)
 			break;
 		case CMD_RX_OVERFLOW:
 			dev_warn(ir->dev, "receive overflow\n");
-			ir_raw_event_reset(ir->rc);
+			ir_raw_event_overflow(ir->rc);
 			break;
 		default:
 			dev_warn(ir->dev, "control code %02x received\n",
diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index e0be6471afe5..4ff954b11dc7 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -194,7 +194,7 @@ static irqreturn_t hix5hd2_ir_rx_interrupt(int irq, void *data)
 		 * IR_INTS availably since logic would not clear
 		 * fifo when overflow, drv do the job
 		 */
-		ir_raw_event_reset(priv->rdev);
+		ir_raw_event_overflow(priv->rdev);
 		symb_num = readl_relaxed(priv->base + IR_DATAH);
 		for (i = 0; i < symb_num; i++)
 			readl_relaxed(priv->base + IR_DATAL);
diff --git a/drivers/media/rc/ir-imon-decoder.c b/drivers/media/rc/ir-imon-decoder.c
index 41dbbef27fa6..dc68f64e7b51 100644
--- a/drivers/media/rc/ir-imon-decoder.c
+++ b/drivers/media/rc/ir-imon-decoder.c
@@ -95,7 +95,7 @@ static int ir_imon_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	struct imon_dec *data = &dev->raw->imon;
 
 	if (!is_timing_event(ev)) {
-		if (ev.reset)
+		if (ev.overflow)
 			data->state = STATE_INACTIVE;
 		return 0;
 	}
diff --git a/drivers/media/rc/ir-jvc-decoder.c b/drivers/media/rc/ir-jvc-decoder.c
index 470f2e1fd507..8b10954d2b6b 100644
--- a/drivers/media/rc/ir-jvc-decoder.c
+++ b/drivers/media/rc/ir-jvc-decoder.c
@@ -40,7 +40,7 @@ static int ir_jvc_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	struct jvc_dec *data = &dev->raw->jvc;
 
 	if (!is_timing_event(ev)) {
-		if (ev.reset)
+		if (ev.overflow)
 			data->state = STATE_INACTIVE;
 		return 0;
 	}
diff --git a/drivers/media/rc/ir-mce_kbd-decoder.c b/drivers/media/rc/ir-mce_kbd-decoder.c
index 1524dc0fc566..66e8feb9a569 100644
--- a/drivers/media/rc/ir-mce_kbd-decoder.c
+++ b/drivers/media/rc/ir-mce_kbd-decoder.c
@@ -221,7 +221,7 @@ static int ir_mce_kbd_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	struct lirc_scancode lsc = {};
 
 	if (!is_timing_event(ev)) {
-		if (ev.reset)
+		if (ev.overflow)
 			data->state = STATE_INACTIVE;
 		return 0;
 	}
diff --git a/drivers/media/rc/ir-nec-decoder.c b/drivers/media/rc/ir-nec-decoder.c
index b4c3e4baf34d..37b99432ad0d 100644
--- a/drivers/media/rc/ir-nec-decoder.c
+++ b/drivers/media/rc/ir-nec-decoder.c
@@ -44,7 +44,7 @@ static int ir_nec_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	u8 address, not_address, command, not_command;
 
 	if (!is_timing_event(ev)) {
-		if (ev.reset)
+		if (ev.overflow)
 			data->state = STATE_INACTIVE;
 		return 0;
 	}
diff --git a/drivers/media/rc/ir-rc5-decoder.c b/drivers/media/rc/ir-rc5-decoder.c
index d58b6226afeb..82d7f6ad2338 100644
--- a/drivers/media/rc/ir-rc5-decoder.c
+++ b/drivers/media/rc/ir-rc5-decoder.c
@@ -45,7 +45,7 @@ static int ir_rc5_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	enum rc_proto protocol;
 
 	if (!is_timing_event(ev)) {
-		if (ev.reset)
+		if (ev.overflow)
 			data->state = STATE_INACTIVE;
 		return 0;
 	}
diff --git a/drivers/media/rc/ir-rc6-decoder.c b/drivers/media/rc/ir-rc6-decoder.c
index 0657ad5eef48..3b2c8bab3e73 100644
--- a/drivers/media/rc/ir-rc6-decoder.c
+++ b/drivers/media/rc/ir-rc6-decoder.c
@@ -85,7 +85,7 @@ static int ir_rc6_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	enum rc_proto protocol;
 
 	if (!is_timing_event(ev)) {
-		if (ev.reset)
+		if (ev.overflow)
 			data->state = STATE_INACTIVE;
 		return 0;
 	}
diff --git a/drivers/media/rc/ir-rcmm-decoder.c b/drivers/media/rc/ir-rcmm-decoder.c
index fd9ec69a3718..a8a34436fe85 100644
--- a/drivers/media/rc/ir-rcmm-decoder.c
+++ b/drivers/media/rc/ir-rcmm-decoder.c
@@ -69,7 +69,7 @@ static int ir_rcmm_decode(struct rc_dev *dev, struct ir_raw_event ev)
 		return 0;
 
 	if (!is_timing_event(ev)) {
-		if (ev.reset)
+		if (ev.overflow)
 			data->state = STATE_INACTIVE;
 		return 0;
 	}
diff --git a/drivers/media/rc/ir-sanyo-decoder.c b/drivers/media/rc/ir-sanyo-decoder.c
index bfc181be1044..2bc98c342882 100644
--- a/drivers/media/rc/ir-sanyo-decoder.c
+++ b/drivers/media/rc/ir-sanyo-decoder.c
@@ -51,8 +51,8 @@ static int ir_sanyo_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	u8 command, not_command;
 
 	if (!is_timing_event(ev)) {
-		if (ev.reset) {
-			dev_dbg(&dev->dev, "SANYO event reset received. reset to state 0\n");
+		if (ev.overflow) {
+			dev_dbg(&dev->dev, "SANYO event overflow received. reset to state 0\n");
 			data->state = STATE_INACTIVE;
 		}
 		return 0;
diff --git a/drivers/media/rc/ir-sharp-decoder.c b/drivers/media/rc/ir-sharp-decoder.c
index d09c38c07dbd..3d8488c39c56 100644
--- a/drivers/media/rc/ir-sharp-decoder.c
+++ b/drivers/media/rc/ir-sharp-decoder.c
@@ -41,7 +41,7 @@ static int ir_sharp_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	u32 msg, echo, address, command, scancode;
 
 	if (!is_timing_event(ev)) {
-		if (ev.reset)
+		if (ev.overflow)
 			data->state = STATE_INACTIVE;
 		return 0;
 	}
diff --git a/drivers/media/rc/ir-sony-decoder.c b/drivers/media/rc/ir-sony-decoder.c
index d760d52abaa2..bb25867ecb5e 100644
--- a/drivers/media/rc/ir-sony-decoder.c
+++ b/drivers/media/rc/ir-sony-decoder.c
@@ -39,7 +39,7 @@ static int ir_sony_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	u8 device, subdevice, function;
 
 	if (!is_timing_event(ev)) {
-		if (ev.reset)
+		if (ev.overflow)
 			data->state = STATE_INACTIVE;
 		return 0;
 	}
diff --git a/drivers/media/rc/ir-xmp-decoder.c b/drivers/media/rc/ir-xmp-decoder.c
index ff94f48bda32..dc36b68739cb 100644
--- a/drivers/media/rc/ir-xmp-decoder.c
+++ b/drivers/media/rc/ir-xmp-decoder.c
@@ -37,7 +37,7 @@ static int ir_xmp_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	struct xmp_dec *data = &dev->raw->xmp;
 
 	if (!is_timing_event(ev)) {
-		if (ev.reset)
+		if (ev.overflow)
 			data->state = STATE_INACTIVE;
 		return 0;
 	}
diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index 4f77d4ebacdc..fcfadd7ea31c 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -238,7 +238,7 @@ static irqreturn_t ite_cir_isr(int irq, void *data)
 	/* Check for RX overflow */
 	if (iflags & ITE_IRQ_RX_FIFO_OVERRUN) {
 		dev_warn(&dev->rdev->dev, "receive overflow\n");
-		ir_raw_event_reset(dev->rdev);
+		ir_raw_event_overflow(dev->rdev);
 	}
 
 	/* check for the receive interrupt */
diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index a080291c4b06..fa4671fc92be 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -41,17 +41,17 @@ void lirc_raw_event(struct rc_dev *dev, struct ir_raw_event ev)
 	struct lirc_fh *fh;
 	int sample;
 
-	/* Packet start */
-	if (ev.reset) {
+	/* Receiver overflow, data missing */
+	if (ev.overflow) {
 		/*
 		 * Userspace expects a long space event before the start of
 		 * the signal to use as a sync.  This may be done with repeat
-		 * packets and normal samples.  But if a reset has been sent
+		 * packets and normal samples.  But if an overflow has been sent
 		 * then we assume that a long time has passed, so we send a
 		 * space with the maximum time value.
 		 */
 		sample = LIRC_SPACE(LIRC_VALUE_MASK);
-		dev_dbg(&dev->dev, "delivering reset sync space to lirc_dev\n");
+		dev_dbg(&dev->dev, "delivering overflow space to lirc_dev\n");
 
 	/* Carrier reports */
 	} else if (ev.carrier_report) {
diff --git a/drivers/media/rc/nuvoton-cir.c b/drivers/media/rc/nuvoton-cir.c
index 8a37f083fe3d..2214d41ef579 100644
--- a/drivers/media/rc/nuvoton-cir.c
+++ b/drivers/media/rc/nuvoton-cir.c
@@ -742,7 +742,7 @@ static void nvt_handle_rx_fifo_overrun(struct nvt_dev *nvt)
 
 	nvt->pkts = 0;
 	nvt_clear_cir_fifo(nvt);
-	ir_raw_event_reset(nvt->rdev);
+	ir_raw_event_overflow(nvt->rdev);
 }
 
 /* copy data from hardware rx fifo into driver buffer */
diff --git a/drivers/media/rc/rc-core-priv.h b/drivers/media/rc/rc-core-priv.h
index 62f032dffd33..ef1e95e1af7f 100644
--- a/drivers/media/rc/rc-core-priv.h
+++ b/drivers/media/rc/rc-core-priv.h
@@ -190,7 +190,7 @@ static inline void decrease_duration(struct ir_raw_event *ev, unsigned duration)
 /* Returns true if event is normal pulse/space event */
 static inline bool is_timing_event(struct ir_raw_event ev)
 {
-	return !ev.carrier_report && !ev.reset;
+	return !ev.carrier_report && !ev.overflow;
 }
 
 #define TO_STR(is_pulse)		((is_pulse) ? "pulse" : "space")
diff --git a/drivers/media/rc/rc-ir-raw.c b/drivers/media/rc/rc-ir-raw.c
index c65bba4ec473..16e33d7eaaa2 100644
--- a/drivers/media/rc/rc-ir-raw.c
+++ b/drivers/media/rc/rc-ir-raw.c
@@ -35,8 +35,6 @@ static int ir_raw_event_thread(void *data)
 				    !is_transition(&ev, &raw->prev_ev))
 					dev_warn_once(&dev->dev, "two consecutive events of type %s",
 						      TO_STR(ev.pulse));
-				if (raw->prev_ev.reset && ev.pulse == 0)
-					dev_warn_once(&dev->dev, "timing event after reset should be pulse");
 			}
 			list_for_each_entry(handler, &ir_raw_handler_list, list)
 				if (dev->enabled_protocols &
diff --git a/drivers/media/rc/st_rc.c b/drivers/media/rc/st_rc.c
index 4e419dbbacd3..19e987a048cc 100644
--- a/drivers/media/rc/st_rc.c
+++ b/drivers/media/rc/st_rc.c
@@ -111,7 +111,7 @@ static irqreturn_t st_rc_rx_interrupt(int irq, void *data)
 		int_status = readl(dev->rx_base + IRB_RX_INT_STATUS);
 		if (unlikely(int_status & IRB_RX_OVERRUN_INT)) {
 			/* discard the entire collection in case of errors!  */
-			ir_raw_event_reset(dev->rdev);
+			ir_raw_event_overflow(dev->rdev);
 			dev_info(dev->dev, "IR RX overrun\n");
 			writel(IRB_RX_OVERRUN_INT,
 					dev->rx_base + IRB_RX_INT_CLEAR);
diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 391a591c1b75..b631a81e58bb 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -126,7 +126,7 @@ static irqreturn_t sunxi_ir_irq(int irqno, void *dev_id)
 	}
 
 	if (status & REG_RXSTA_ROI) {
-		ir_raw_event_reset(ir->rc);
+		ir_raw_event_overflow(ir->rc);
 	} else if (status & REG_RXSTA_RPE) {
 		ir_raw_event_set_idle(ir->rc, true);
 		ir_raw_event_handle(ir->rc);
diff --git a/drivers/media/rc/winbond-cir.c b/drivers/media/rc/winbond-cir.c
index 94efb035d21b..25884a79985c 100644
--- a/drivers/media/rc/winbond-cir.c
+++ b/drivers/media/rc/winbond-cir.c
@@ -470,7 +470,7 @@ wbcir_irq_handler(int irqno, void *cookie)
 		/* RX overflow? (read clears bit) */
 		if (inb(data->sbase + WBCIR_REG_SP3_LSR) & WBCIR_RX_OVERRUN) {
 			data->rxstate = WBCIR_RXSTATE_ERROR;
-			ir_raw_event_reset(data->dev);
+			ir_raw_event_overflow(data->dev);
 		}
 
 		/* TX underflow? */
diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index 33b3f7fcf92e..803349599c27 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -298,7 +298,7 @@ struct ir_raw_event {
 	u8                      duty_cycle;
 
 	unsigned                pulse:1;
-	unsigned                reset:1;
+	unsigned                overflow:1;
 	unsigned                timeout:1;
 	unsigned                carrier_report:1;
 };
@@ -321,9 +321,9 @@ int ir_raw_encode_scancode(enum rc_proto protocol, u32 scancode,
 			   struct ir_raw_event *events, unsigned int max);
 int ir_raw_encode_carrier(enum rc_proto protocol);
 
-static inline void ir_raw_event_reset(struct rc_dev *dev)
+static inline void ir_raw_event_overflow(struct rc_dev *dev)
 {
-	ir_raw_event_store(dev, &((struct ir_raw_event) { .reset = true }));
+	ir_raw_event_store(dev, &((struct ir_raw_event) { .overflow = true }));
 	dev->idle = true;
 	ir_raw_event_handle(dev);
 }
-- 
2.34.1

