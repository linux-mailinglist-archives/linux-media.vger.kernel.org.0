Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21FFB32144E
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 11:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbhBVKoR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 05:44:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhBVKoP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 05:44:15 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E0BC061786
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 02:43:35 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7472CC648B; Mon, 22 Feb 2021 10:43:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1613990610; bh=kL2Ry70eFC5n24sjScMT1ZtpVn0wQjLJNyty4tmxStM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DE3V5VWNZzKb9tn6RcLGv4FKR5fe1B2+rvqTsSr0PR1HY3X8RLv07l1//bGI5yya3
         Cxb8e/GJ5U5ClbyykzYWuuCQtRNCLfazvxKR1WEP3lYjFgoxYRlRFYdKERvElx4WdG
         1fCVHnM/RlvM0+EPGRZlfIzBoaqkuXxvmevZ4sz/q/fpWawxZ7y/Zs/cu1soPHmPE2
         8dEpw7yCb2f4YmRqvt/LJ5YdA5wrGFs/CUAcSYjzVqsEYGp6FgRzADgEA3ezN9tYix
         FbfQTCzSPpWkvY8IOV1GPjW7mNgIQb/7CiXJYQgV3tsQC4ld6orn2zHbAykAE+OkZd
         E4lbqM8Sx+dMQ==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, Matthias Reichl <hias@horus.com>,
        =?UTF-8?q?Juan=20Jes=C3=BAs=20Garc=C3=ADa=20de=20Soria?= 
        <skandalfo@gmail.com>
Subject: [PATCH 5/6] media: ite-cir: move runtime information into driver data
Date:   Mon, 22 Feb 2021 10:43:28 +0000
Message-Id: <9e3b0ad402274bf52e31d955367812597095a612.1613989288.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1613989288.git.sean@mess.org>
References: <cover.1613989288.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The carrier, duty cycle etc are not device dependent, and they can be
changed at runtime. By moving them into the allocated struct, we can make
the device specific structures smaller, and we no longer need to copy
the struct.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ite-cir.c | 127 ++++++++++++++-----------------------
 drivers/media/rc/ite-cir.h |  32 ++++------
 2 files changed, 60 insertions(+), 99 deletions(-)

diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index 748788a43da5..cc0a70dcf93d 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -33,10 +33,10 @@
 
 /* module parameters */
 
-/* override default sample period */
-static long sample_period;
+/* default sample period */
+static long sample_period = NSEC_PER_SEC / 115200;
 module_param(sample_period, long, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(sample_period, "Override carrier sample period, us");
+MODULE_PARM_DESC(sample_period, "sample period");
 
 /* override detected model id */
 static int model_number = -1;
@@ -134,7 +134,6 @@ static u8 ite_get_pulse_width_bits(unsigned int freq, int duty_cycle)
 static void ite_decode_bytes(struct ite_dev *dev, const u8 * data, int
 			     length)
 {
-	u32 sample_period;
 	unsigned long *ldata;
 	unsigned int next_one, next_zero, size;
 	struct ir_raw_event ev = {};
@@ -142,7 +141,6 @@ static void ite_decode_bytes(struct ite_dev *dev, const u8 * data, int
 	if (length == 0)
 		return;
 
-	sample_period = dev->params.sample_period;
 	ldata = (unsigned long *)data;
 	size = length << 3;
 	next_one = find_next_bit_le(ldata, size, 0);
@@ -184,12 +182,12 @@ static void ite_set_carrier_params(struct ite_dev *dev)
 
 	if (for_tx) {
 		/* we don't need no stinking calculations */
-		freq = dev->params.tx_carrier_freq;
+		freq = dev->tx_carrier_freq;
 		allowance = ITE_RXDCR_DEFAULT;
 		use_demodulator = false;
 	} else {
-		low_freq = dev->params.rx_low_carrier_freq;
-		high_freq = dev->params.rx_high_carrier_freq;
+		low_freq = dev->rx_low_carrier_freq;
+		high_freq = dev->rx_high_carrier_freq;
 
 		if (low_freq == 0) {
 			/* don't demodulate */
@@ -217,9 +215,9 @@ static void ite_set_carrier_params(struct ite_dev *dev)
 	}
 
 	/* set the carrier parameters in a device-dependent way */
-	dev->params.set_carrier_params(dev, ite_is_high_carrier_freq(freq),
+	dev->params->set_carrier_params(dev, ite_is_high_carrier_freq(freq),
 		 use_demodulator, ite_get_carrier_freq_bits(freq), allowance,
-		 ite_get_pulse_width_bits(freq, dev->params.tx_duty_cycle));
+		 ite_get_pulse_width_bits(freq, dev->tx_duty_cycle));
 }
 
 /* interrupt service routine for incoming and outgoing CIR data */
@@ -236,12 +234,12 @@ static irqreturn_t ite_cir_isr(int irq, void *data)
 	spin_lock_irqsave(&dev->lock, flags);
 
 	/* read the interrupt flags */
-	iflags = dev->params.get_irq_causes(dev);
+	iflags = dev->params->get_irq_causes(dev);
 
 	/* check for the receive interrupt */
 	if (iflags & (ITE_IRQ_RX_FIFO | ITE_IRQ_RX_FIFO_OVERRUN)) {
 		/* read the FIFO bytes */
-		rx_bytes = dev->params.get_rx_bytes(dev, rx_buf,
+		rx_bytes = dev->params->get_rx_bytes(dev, rx_buf,
 						    ITE_RX_FIFO_LEN);
 
 		dev_dbg(&dev->rdev->dev, "interrupt %d RX bytes\n", rx_bytes);
@@ -286,8 +284,8 @@ static int ite_set_rx_carrier_range(struct rc_dev *rcdev, u32 carrier_low, u32
 	struct ite_dev *dev = rcdev->priv;
 
 	spin_lock_irqsave(&dev->lock, flags);
-	dev->params.rx_low_carrier_freq = carrier_low;
-	dev->params.rx_high_carrier_freq = carrier_high;
+	dev->rx_low_carrier_freq = carrier_low;
+	dev->rx_high_carrier_freq = carrier_high;
 	ite_set_carrier_params(dev);
 	spin_unlock_irqrestore(&dev->lock, flags);
 
@@ -301,7 +299,7 @@ static int ite_set_tx_carrier(struct rc_dev *rcdev, u32 carrier)
 	struct ite_dev *dev = rcdev->priv;
 
 	spin_lock_irqsave(&dev->lock, flags);
-	dev->params.tx_carrier_freq = carrier;
+	dev->tx_carrier_freq = carrier;
 	ite_set_carrier_params(dev);
 	spin_unlock_irqrestore(&dev->lock, flags);
 
@@ -315,7 +313,7 @@ static int ite_set_tx_duty_cycle(struct rc_dev *rcdev, u32 duty_cycle)
 	struct ite_dev *dev = rcdev->priv;
 
 	spin_lock_irqsave(&dev->lock, flags);
-	dev->params.tx_duty_cycle = duty_cycle;
+	dev->tx_duty_cycle = duty_cycle;
 	ite_set_carrier_params(dev);
 	spin_unlock_irqrestore(&dev->lock, flags);
 
@@ -349,17 +347,17 @@ static int ite_tx_ir(struct rc_dev *rcdev, unsigned *txbuf, unsigned n)
 
 	/* calculate how much time we can send in one byte */
 	max_rle_us =
-	    (ITE_BAUDRATE_DIVISOR * dev->params.sample_period *
+	    (ITE_BAUDRATE_DIVISOR * sample_period *
 	     ITE_TX_MAX_RLE) / 1000;
 
 	/* disable the receiver */
-	dev->params.disable_rx(dev);
+	dev->params->disable_rx(dev);
 
 	/* this is where we'll begin filling in the FIFO, until it's full.
 	 * then we'll just activate the interrupt, wait for it to wake us up
 	 * again, disable it, continue filling the FIFO... until everything
 	 * has been pushed out */
-	fifo_avail = ITE_TX_FIFO_LEN - dev->params.get_tx_used_slots(dev);
+	fifo_avail = ITE_TX_FIFO_LEN - dev->params->get_tx_used_slots(dev);
 
 	while (n > 0 && dev->in_use) {
 		/* transmit the next sample */
@@ -402,30 +400,29 @@ static int ite_tx_ir(struct rc_dev *rcdev, unsigned *txbuf, unsigned n)
 			 * some other slot got freed
 			 */
 			if (fifo_avail <= 0)
-				fifo_avail = ITE_TX_FIFO_LEN - dev->params.get_tx_used_slots(dev);
+				fifo_avail = ITE_TX_FIFO_LEN - dev->params->get_tx_used_slots(dev);
 
 			/* if it's still full */
 			if (fifo_avail <= 0) {
 				/* enable the tx interrupt */
-				dev->params.
-				enable_tx_interrupt(dev);
+				dev->params->enable_tx_interrupt(dev);
 
 				/* drop the spinlock */
 				spin_unlock_irqrestore(&dev->lock, flags);
 
 				/* wait for the FIFO to empty enough */
-				wait_event_interruptible(dev->tx_queue, (fifo_avail = ITE_TX_FIFO_LEN - dev->params.get_tx_used_slots(dev)) >= 8);
+				wait_event_interruptible(dev->tx_queue,
+					(fifo_avail = ITE_TX_FIFO_LEN - dev->params->get_tx_used_slots(dev)) >= 8);
 
 				/* get the spinlock again */
 				spin_lock_irqsave(&dev->lock, flags);
 
 				/* disable the tx interrupt again. */
-				dev->params.
-				disable_tx_interrupt(dev);
+				dev->params->disable_tx_interrupt(dev);
 			}
 
 			/* now send the byte through the FIFO */
-			dev->params.put_tx_byte(dev, val);
+			dev->params->put_tx_byte(dev, val);
 			fifo_avail--;
 		}
 	}
@@ -433,7 +430,7 @@ static int ite_tx_ir(struct rc_dev *rcdev, unsigned *txbuf, unsigned n)
 	/* wait and don't return until the whole FIFO has been sent out;
 	 * otherwise we could configure the RX carrier params instead of the
 	 * TX ones while the transmission is still being performed! */
-	fifo_remaining = dev->params.get_tx_used_slots(dev);
+	fifo_remaining = dev->params->get_tx_used_slots(dev);
 	remaining_us = 0;
 	while (fifo_remaining > 0) {
 		fifo_remaining--;
@@ -460,7 +457,7 @@ static int ite_tx_ir(struct rc_dev *rcdev, unsigned *txbuf, unsigned n)
 
 	/* re-enable the receiver */
 	if (dev->in_use)
-		dev->params.enable_rx(dev);
+		dev->params->enable_rx(dev);
 
 	/* notify transmission end */
 	wake_up_interruptible(&dev->tx_ended);
@@ -478,7 +475,7 @@ static void ite_s_idle(struct rc_dev *rcdev, bool enable)
 
 	if (enable) {
 		spin_lock_irqsave(&dev->lock, flags);
-		dev->params.idle_rx(dev);
+		dev->params->idle_rx(dev);
 		spin_unlock_irqrestore(&dev->lock, flags);
 	}
 }
@@ -1178,7 +1175,7 @@ static int ite_open(struct rc_dev *rcdev)
 	dev->in_use = true;
 
 	/* enable the receiver */
-	dev->params.enable_rx(dev);
+	dev->params->enable_rx(dev);
 
 	spin_unlock_irqrestore(&dev->lock, flags);
 
@@ -1199,7 +1196,7 @@ static void ite_close(struct rc_dev *rcdev)
 	wait_event_interruptible(dev->tx_ended, !dev->transmitting);
 	spin_lock_irqsave(&dev->lock, flags);
 
-	dev->params.disable(dev);
+	dev->params->disable(dev);
 
 	spin_unlock_irqrestore(&dev->lock, flags);
 }
@@ -1210,12 +1207,6 @@ static const struct ite_dev_params ite_dev_descs[] = {
 	       .model = "ITE8704 CIR transceiver",
 	       .io_region_size = IT87_IOREG_LENGTH,
 	       .io_rsrc_no = 0,
-	       .hw_tx_capable = true,
-	       .sample_period = (u32) (1000000000ULL / 115200),
-	       .tx_carrier_freq = 38000,
-	       .tx_duty_cycle = 33,
-	       .rx_low_carrier_freq = 0,
-	       .rx_high_carrier_freq = 0,
 
 		/* operations */
 	       .get_irq_causes = it87_get_irq_causes,
@@ -1235,12 +1226,6 @@ static const struct ite_dev_params ite_dev_descs[] = {
 	       .model = "ITE8713 CIR transceiver",
 	       .io_region_size = IT87_IOREG_LENGTH,
 	       .io_rsrc_no = 0,
-	       .hw_tx_capable = true,
-	       .sample_period = (u32) (1000000000ULL / 115200),
-	       .tx_carrier_freq = 38000,
-	       .tx_duty_cycle = 33,
-	       .rx_low_carrier_freq = 0,
-	       .rx_high_carrier_freq = 0,
 
 		/* operations */
 	       .get_irq_causes = it87_get_irq_causes,
@@ -1260,12 +1245,6 @@ static const struct ite_dev_params ite_dev_descs[] = {
 	       .model = "ITE8708 CIR transceiver",
 	       .io_region_size = IT8708_IOREG_LENGTH,
 	       .io_rsrc_no = 0,
-	       .hw_tx_capable = true,
-	       .sample_period = (u32) (1000000000ULL / 115200),
-	       .tx_carrier_freq = 38000,
-	       .tx_duty_cycle = 33,
-	       .rx_low_carrier_freq = 0,
-	       .rx_high_carrier_freq = 0,
 
 		/* operations */
 	       .get_irq_causes = it8708_get_irq_causes,
@@ -1286,12 +1265,6 @@ static const struct ite_dev_params ite_dev_descs[] = {
 	       .model = "ITE8709 CIR transceiver",
 	       .io_region_size = IT8709_IOREG_LENGTH,
 	       .io_rsrc_no = 2,
-	       .hw_tx_capable = true,
-	       .sample_period = (u32) (1000000000ULL / 115200),
-	       .tx_carrier_freq = 38000,
-	       .tx_duty_cycle = 33,
-	       .rx_low_carrier_freq = 0,
-	       .rx_high_carrier_freq = 0,
 
 		/* operations */
 	       .get_irq_causes = it8709_get_irq_causes,
@@ -1384,14 +1357,12 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 	init_waitqueue_head(&itdev->tx_ended);
 
 	/* copy model-specific parameters */
-	itdev->params = *dev_desc;
-
-	/* apply any overrides */
-	if (sample_period > 0)
-		itdev->params.sample_period = sample_period;
+	itdev->params = dev_desc;
 
 	/* set up hardware initial state */
-	itdev->params.init_hardware(itdev);
+	itdev->tx_duty_cycle = 33;
+	itdev->tx_carrier_freq = ITE_DEFAULT_CARRIER_FREQ;
+	itdev->params->init_hardware(itdev);
 
 	/* set up ir-core props */
 	rdev->priv = itdev;
@@ -1403,20 +1374,16 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 	rdev->s_rx_carrier_range = ite_set_rx_carrier_range;
 	/* FIFO threshold is 17 bytes, so 17 * 8 samples minimum */
 	rdev->min_timeout = 17 * 8 * ITE_BAUDRATE_DIVISOR *
-			    itdev->params.sample_period / 1000;
+			    sample_period / 1000;
 	rdev->timeout = IR_DEFAULT_TIMEOUT;
 	rdev->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
-	rdev->rx_resolution = ITE_BAUDRATE_DIVISOR *
-				itdev->params.sample_period / 1000;
-	rdev->tx_resolution = ITE_BAUDRATE_DIVISOR *
-				itdev->params.sample_period / 1000;
-
-	/* set up transmitter related values if needed */
-	if (itdev->params.hw_tx_capable) {
-		rdev->tx_ir = ite_tx_ir;
-		rdev->s_tx_carrier = ite_set_tx_carrier;
-		rdev->s_tx_duty_cycle = ite_set_tx_duty_cycle;
-	}
+	rdev->rx_resolution = ITE_BAUDRATE_DIVISOR * sample_period / 1000;
+	rdev->tx_resolution = ITE_BAUDRATE_DIVISOR * sample_period / 1000;
+
+	/* set up transmitter related values */
+	rdev->tx_ir = ite_tx_ir;
+	rdev->s_tx_carrier = ite_set_tx_carrier;
+	rdev->s_tx_duty_cycle = ite_set_tx_duty_cycle;
 
 	rdev->device_name = dev_desc->model;
 	rdev->input_id.bustype = BUS_HOST;
@@ -1443,7 +1410,7 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 	return 0;
 
 exit_release_cir_addr:
-	release_region(itdev->cir_addr, itdev->params.io_region_size);
+	release_region(itdev->cir_addr, itdev->params->io_region_size);
 exit_unregister_device:
 	rc_unregister_device(rdev);
 	rdev = NULL;
@@ -1462,13 +1429,13 @@ static void ite_remove(struct pnp_dev *pdev)
 	spin_lock_irqsave(&dev->lock, flags);
 
 	/* disable hardware */
-	dev->params.disable(dev);
+	dev->params->disable(dev);
 
 	spin_unlock_irqrestore(&dev->lock, flags);
 
 	/* free resources */
 	free_irq(dev->cir_irq, dev);
-	release_region(dev->cir_addr, dev->params.io_region_size);
+	release_region(dev->cir_addr, dev->params->io_region_size);
 
 	rc_unregister_device(dev->rdev);
 
@@ -1486,7 +1453,7 @@ static int ite_suspend(struct pnp_dev *pdev, pm_message_t state)
 	spin_lock_irqsave(&dev->lock, flags);
 
 	/* disable all interrupts */
-	dev->params.disable(dev);
+	dev->params->disable(dev);
 
 	spin_unlock_irqrestore(&dev->lock, flags);
 
@@ -1501,9 +1468,9 @@ static int ite_resume(struct pnp_dev *pdev)
 	spin_lock_irqsave(&dev->lock, flags);
 
 	/* reinitialize hardware config registers */
-	dev->params.init_hardware(dev);
+	dev->params->init_hardware(dev);
 	/* enable the receiver */
-	dev->params.enable_rx(dev);
+	dev->params->enable_rx(dev);
 
 	spin_unlock_irqrestore(&dev->lock, flags);
 
@@ -1518,7 +1485,7 @@ static void ite_shutdown(struct pnp_dev *pdev)
 	spin_lock_irqsave(&dev->lock, flags);
 
 	/* disable all interrupts */
-	dev->params.disable(dev);
+	dev->params->disable(dev);
 
 	spin_unlock_irqrestore(&dev->lock, flags);
 }
diff --git a/drivers/media/rc/ite-cir.h b/drivers/media/rc/ite-cir.h
index 853001f67445..cb3dc4ca2b0a 100644
--- a/drivers/media/rc/ite-cir.h
+++ b/drivers/media/rc/ite-cir.h
@@ -31,24 +31,6 @@ struct ite_dev_params {
 	/* IR pnp I/O resource number */
 	int io_rsrc_no;
 
-	/* true if the hardware supports transmission */
-	bool hw_tx_capable;
-
-	/* base sampling period, in ns */
-	u32 sample_period;
-
-	/* rx low carrier frequency, in Hz, 0 means no demodulation */
-	unsigned int rx_low_carrier_freq;
-
-	/* tx high carrier frequency, in Hz, 0 means no demodulation */
-	unsigned int rx_high_carrier_freq;
-
-	/* tx carrier frequency, in Hz */
-	unsigned int tx_carrier_freq;
-
-	/* duty cycle, 0-100 */
-	int tx_duty_cycle;
-
 	/* hw-specific operation function pointers; most of these must be
 	 * called while holding the spin lock, except for the TX FIFO length
 	 * one */
@@ -104,12 +86,24 @@ struct ite_dev {
 	/* transmit support */
 	wait_queue_head_t tx_queue, tx_ended;
 
+	/* rx low carrier frequency, in Hz, 0 means no demodulation */
+	unsigned int rx_low_carrier_freq;
+
+	/* tx high carrier frequency, in Hz, 0 means no demodulation */
+	unsigned int rx_high_carrier_freq;
+
+	/* tx carrier frequency, in Hz */
+	unsigned int tx_carrier_freq;
+
+	/* duty cycle, 0-100 */
+	int tx_duty_cycle;
+
 	/* hardware I/O settings */
 	unsigned long cir_addr;
 	int cir_irq;
 
 	/* overridable copy of model parameters */
-	struct ite_dev_params params;
+	const struct ite_dev_params *params;
 };
 
 /* common values for all kinds of hardware */
-- 
2.29.2

