Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD62932144F
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 11:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbhBVKoS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 05:44:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbhBVKoP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 05:44:15 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1925C061574
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 02:43:33 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 35AC1C6432; Mon, 22 Feb 2021 10:43:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1613990610; bh=L8TPc5y+zD8Q8ni4ePE75yRF0Am5IvV8O+oef3m9x6Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rI2oEWE4gMZlMhy5iKN3mV0mTzjhFBZz47c4ilAG07UORRF7ceyw32Cq+DZkanD0v
         PCVN3DMuyvctKgdNuId+pqTnSRTsJ1G8uYuDcf3SP7gHLb6NbnEZZrQOJJsrwOBbRF
         I+oy4skwTMgFPc9xLrm11IaoKktDec3TBJRwvLAXYGsE/DRHKegyBBMKtJ+fuqp1CX
         LlXBD8ET+v7m6x8MY4nFicgT4zP4uTcQrd0IpCBlpJL/RQvgVbMDochHQbtFGEOfLx
         msmac9zYbZy5ExudTw3diVXe76yi/j0QXAl5MpuUrsrf+54q4DSfk5hiYxYG0wFCU6
         pKHB5NM9jgMEw==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, Matthias Reichl <hias@horus.com>,
        =?UTF-8?q?Juan=20Jes=C3=BAs=20Garc=C3=ADa=20de=20Soria?= 
        <skandalfo@gmail.com>
Subject: [PATCH 3/6] media: ite-cir: use standard logging and reduce noise
Date:   Mon, 22 Feb 2021 10:43:26 +0000
Message-Id: <f07601a9d8681e2c0090379792ed44ed54b71818.1613989288.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1613989288.git.sean@mess.org>
References: <cover.1613989288.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove lots of superfluous debug messages which just log the function
name. Also, there is no need to announce the various parameters of the
device. This can be discovered via lirc ioctl if needed.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ite-cir.c | 171 +++++--------------------------------
 drivers/media/rc/ite-cir.h |  15 ----
 2 files changed, 22 insertions(+), 164 deletions(-)

diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index 397e317d9726..c5c7631849d0 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -33,11 +33,6 @@
 
 /* module parameters */
 
-/* debug level */
-static int debug;
-module_param(debug, int, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(debug, "Enable debugging output");
-
 /* low limit for RX carrier freq, Hz, 0 for no RX demodulation */
 static int rx_low_carrier_freq;
 module_param(rx_low_carrier_freq, int, S_IRUGO | S_IWUSR);
@@ -101,9 +96,7 @@ static u8 ite_get_carrier_freq_bits(unsigned int freq)
 			freq = ITE_LCF_MAX_CARRIER_FREQ;
 
 		/* convert to kHz and subtract the base freq */
-		freq =
-		    DIV_ROUND_CLOSEST(freq - ITE_LCF_MIN_CARRIER_FREQ,
-				      1000);
+		freq = DIV_ROUND_CLOSEST(freq - ITE_LCF_MIN_CARRIER_FREQ, 1000);
 
 		return (u8) freq;
 	}
@@ -175,8 +168,7 @@ static void ite_decode_bytes(struct ite_dev *dev, const u8 * data, int
 	next_one = find_next_bit_le(ldata, size, 0);
 	if (next_one > 0) {
 		ev.pulse = true;
-		ev.duration =
-		    ITE_BITS_TO_US(next_one, sample_period);
+		ev.duration = ITE_BITS_TO_US(next_one, sample_period);
 		ir_raw_event_store_with_filter(dev->rdev, &ev);
 	}
 
@@ -187,23 +179,18 @@ static void ite_decode_bytes(struct ite_dev *dev, const u8 * data, int
 		ir_raw_event_store_with_filter(dev->rdev, &ev);
 
 		if (next_zero < size) {
-			next_one =
-			    find_next_bit_le(ldata,
-						     size,
-						     next_zero + 1);
+			next_one = find_next_bit_le(ldata, size, next_zero + 1);
 			ev.pulse = true;
-			ev.duration =
-			    ITE_BITS_TO_US(next_one - next_zero,
-					   sample_period);
-			ir_raw_event_store_with_filter
-			    (dev->rdev, &ev);
+			ev.duration = ITE_BITS_TO_US(next_one - next_zero,
+						     sample_period);
+			ir_raw_event_store_with_filter(dev->rdev, &ev);
 		} else
 			next_one = size;
 	}
 
 	ir_raw_event_handle(dev->rdev);
 
-	ite_dbg_verbose("decoded %d bytes.", length);
+	dev_dbg(&dev->rdev->dev, "decoded %d bytes\n", length);
 }
 
 /* set all the rx/tx carrier parameters; this must be called with the device
@@ -215,8 +202,6 @@ static void ite_set_carrier_params(struct ite_dev *dev)
 	bool use_demodulator;
 	bool for_tx = dev->transmitting;
 
-	ite_dbg("%s called", __func__);
-
 	if (for_tx) {
 		/* we don't need no stinking calculations */
 		freq = dev->params.tx_carrier_freq;
@@ -228,8 +213,7 @@ static void ite_set_carrier_params(struct ite_dev *dev)
 
 		if (low_freq == 0) {
 			/* don't demodulate */
-			freq =
-			ITE_DEFAULT_CARRIER_FREQ;
+			freq = ITE_DEFAULT_CARRIER_FREQ;
 			allowance = ITE_RXDCR_DEFAULT;
 			use_demodulator = false;
 		} else {
@@ -268,8 +252,6 @@ static irqreturn_t ite_cir_isr(int irq, void *data)
 	int rx_bytes;
 	int iflags;
 
-	ite_dbg_verbose("%s firing", __func__);
-
 	/* grab the spinlock */
 	spin_lock_irqsave(&dev->lock, flags);
 
@@ -279,32 +261,29 @@ static irqreturn_t ite_cir_isr(int irq, void *data)
 	/* check for the receive interrupt */
 	if (iflags & (ITE_IRQ_RX_FIFO | ITE_IRQ_RX_FIFO_OVERRUN)) {
 		/* read the FIFO bytes */
-		rx_bytes =
-			dev->params.get_rx_bytes(dev, rx_buf,
-					     ITE_RX_FIFO_LEN);
+		rx_bytes = dev->params.get_rx_bytes(dev, rx_buf,
+						    ITE_RX_FIFO_LEN);
+
+		dev_dbg(&dev->rdev->dev, "interrupt %d RX bytes\n", rx_bytes);
 
 		if (rx_bytes > 0) {
 			/* drop the spinlock, since the ir-core layer
 			 * may call us back again through
 			 * ite_s_idle() */
-			spin_unlock_irqrestore(&dev->
-									 lock,
-									 flags);
+			spin_unlock_irqrestore(&dev->lock, flags);
 
 			/* decode the data we've just received */
-			ite_decode_bytes(dev, rx_buf,
-								   rx_bytes);
+			ite_decode_bytes(dev, rx_buf, rx_bytes);
 
 			/* reacquire the spinlock */
-			spin_lock_irqsave(&dev->lock,
-								    flags);
+			spin_lock_irqsave(&dev->lock, flags);
 
 			/* mark the interrupt as serviced */
 			ret = IRQ_RETVAL(IRQ_HANDLED);
 		}
 	} else if (iflags & ITE_IRQ_TX_FIFO) {
 		/* FIFO space available interrupt */
-		ite_dbg_verbose("got interrupt for TX FIFO");
+		dev_dbg(&dev->rdev->dev, "interrupt TX FIFO\n");
 
 		/* wake any sleeping transmitter */
 		wake_up_interruptible(&dev->tx_queue);
@@ -316,8 +295,6 @@ static irqreturn_t ite_cir_isr(int irq, void *data)
 	/* drop the spinlock */
 	spin_unlock_irqrestore(&dev->lock, flags);
 
-	ite_dbg_verbose("%s done returning %d", __func__, (int)ret);
-
 	return ret;
 }
 
@@ -379,8 +356,6 @@ static int ite_tx_ir(struct rc_dev *rcdev, unsigned *txbuf, unsigned n)
 	u8 last_sent[ITE_TX_FIFO_LEN];
 	u8 val;
 
-	ite_dbg("%s called", __func__);
-
 	/* clear the array just in case */
 	memset(last_sent, 0, sizeof(last_sent));
 
@@ -404,8 +379,7 @@ static int ite_tx_ir(struct rc_dev *rcdev, unsigned *txbuf, unsigned n)
 	 * then we'll just activate the interrupt, wait for it to wake us up
 	 * again, disable it, continue filling the FIFO... until everything
 	 * has been pushed out */
-	fifo_avail =
-	    ITE_TX_FIFO_LEN - dev->params.get_tx_used_slots(dev);
+	fifo_avail = ITE_TX_FIFO_LEN - dev->params.get_tx_used_slots(dev);
 
 	while (n > 0 && dev->in_use) {
 		/* transmit the next sample */
@@ -413,10 +387,8 @@ static int ite_tx_ir(struct rc_dev *rcdev, unsigned *txbuf, unsigned n)
 		remaining_us = *(txbuf++);
 		n--;
 
-		ite_dbg("%s: %ld",
-				      ((is_pulse) ? "pulse" : "space"),
-				      (long int)
-				      remaining_us);
+		dev_dbg(&dev->rdev->dev, "%s: %d\n",
+			is_pulse ? "pulse" : "space", remaining_us);
 
 		/* repeat while the pulse is non-zero length */
 		while (remaining_us > 0 && dev->in_use) {
@@ -524,8 +496,6 @@ static void ite_s_idle(struct rc_dev *rcdev, bool enable)
 	unsigned long flags;
 	struct ite_dev *dev = rcdev->priv;
 
-	ite_dbg("%s called", __func__);
-
 	if (enable) {
 		spin_lock_irqsave(&dev->lock, flags);
 		dev->params.idle_rx(dev);
@@ -544,8 +514,6 @@ static int it87_get_irq_causes(struct ite_dev *dev)
 	u8 iflags;
 	int ret = 0;
 
-	ite_dbg("%s called", __func__);
-
 	/* read the interrupt flags */
 	iflags = inb(dev->cir_addr + IT87_IIR) & IT87_II;
 
@@ -572,8 +540,6 @@ static void it87_set_carrier_params(struct ite_dev *dev, bool high_freq,
 {
 	u8 val;
 
-	ite_dbg("%s called", __func__);
-
 	/* program the RCR register */
 	val = inb(dev->cir_addr + IT87_RCR)
 		& ~(IT87_HCFS | IT87_RXEND | IT87_RXDCR);
@@ -599,8 +565,6 @@ static int it87_get_rx_bytes(struct ite_dev *dev, u8 * buf, int buf_size)
 {
 	int fifo, read = 0;
 
-	ite_dbg("%s called", __func__);
-
 	/* read how many bytes are still in the FIFO */
 	fifo = inb(dev->cir_addr + IT87_RSR) & IT87_RXFBC;
 
@@ -619,8 +583,6 @@ static int it87_get_rx_bytes(struct ite_dev *dev, u8 * buf, int buf_size)
  * empty; let's expect this won't be a problem */
 static int it87_get_tx_used_slots(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	return inb(dev->cir_addr + IT87_TSR) & IT87_TXFBC;
 }
 
@@ -634,8 +596,6 @@ static void it87_put_tx_byte(struct ite_dev *dev, u8 value)
   pulse is detected; this must be called with the device spinlock held */
 static void it87_idle_rx(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* disable streaming by clearing RXACT writing it as 1 */
 	outb(inb(dev->cir_addr + IT87_RCR) | IT87_RXACT,
 		dev->cir_addr + IT87_RCR);
@@ -648,8 +608,6 @@ static void it87_idle_rx(struct ite_dev *dev)
 /* disable the receiver; this must be called with the device spinlock held */
 static void it87_disable_rx(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* disable the receiver interrupts */
 	outb(inb(dev->cir_addr + IT87_IER) & ~(IT87_RDAIE | IT87_RFOIE),
 		dev->cir_addr + IT87_IER);
@@ -666,8 +624,6 @@ static void it87_disable_rx(struct ite_dev *dev)
 /* enable the receiver; this must be called with the device spinlock held */
 static void it87_enable_rx(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* enable the receiver by setting RXEN */
 	outb(inb(dev->cir_addr + IT87_RCR) | IT87_RXEN,
 		dev->cir_addr + IT87_RCR);
@@ -684,8 +640,6 @@ static void it87_enable_rx(struct ite_dev *dev)
  * spinlock held */
 static void it87_disable_tx_interrupt(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* disable the transmitter interrupts */
 	outb(inb(dev->cir_addr + IT87_IER) & ~IT87_TLDLIE,
 		dev->cir_addr + IT87_IER);
@@ -695,8 +649,6 @@ static void it87_disable_tx_interrupt(struct ite_dev *dev)
  * spinlock held */
 static void it87_enable_tx_interrupt(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* enable the transmitter interrupts and master enable flag */
 	outb(inb(dev->cir_addr + IT87_IER) | IT87_TLDLIE | IT87_IEC,
 		dev->cir_addr + IT87_IER);
@@ -705,8 +657,6 @@ static void it87_enable_tx_interrupt(struct ite_dev *dev)
 /* disable the device; this must be called with the device spinlock held */
 static void it87_disable(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* clear out all interrupt enable flags */
 	outb(inb(dev->cir_addr + IT87_IER) &
 		~(IT87_IEC | IT87_RFOIE | IT87_RDAIE | IT87_TLDLIE),
@@ -723,8 +673,6 @@ static void it87_disable(struct ite_dev *dev)
 /* initialize the hardware */
 static void it87_init_hardware(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* enable just the baud rate divisor register,
 	disabling all the interrupts at the same time */
 	outb((inb(dev->cir_addr + IT87_IER) &
@@ -761,8 +709,6 @@ static int it8708_get_irq_causes(struct ite_dev *dev)
 	u8 iflags;
 	int ret = 0;
 
-	ite_dbg("%s called", __func__);
-
 	/* read the interrupt flags */
 	iflags = inb(dev->cir_addr + IT8708_C0IIR);
 
@@ -784,8 +730,6 @@ static void it8708_set_carrier_params(struct ite_dev *dev, bool high_freq,
 {
 	u8 val;
 
-	ite_dbg("%s called", __func__);
-
 	/* program the C0CFR register, with HRAE=1 */
 	outb(inb(dev->cir_addr + IT8708_BANKSEL) | IT8708_HRAE,
 		dev->cir_addr + IT8708_BANKSEL);
@@ -824,8 +768,6 @@ static int it8708_get_rx_bytes(struct ite_dev *dev, u8 * buf, int buf_size)
 {
 	int fifo, read = 0;
 
-	ite_dbg("%s called", __func__);
-
 	/* read how many bytes are still in the FIFO */
 	fifo = inb(dev->cir_addr + IT8708_C0RFSR) & IT85_RXFBC;
 
@@ -844,8 +786,6 @@ static int it8708_get_rx_bytes(struct ite_dev *dev, u8 * buf, int buf_size)
  * empty; let's expect this won't be a problem */
 static int it8708_get_tx_used_slots(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	return inb(dev->cir_addr + IT8708_C0TFSR) & IT85_TXFBC;
 }
 
@@ -859,8 +799,6 @@ static void it8708_put_tx_byte(struct ite_dev *dev, u8 value)
   pulse is detected; this must be called with the device spinlock held */
 static void it8708_idle_rx(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* disable streaming by clearing RXACT writing it as 1 */
 	outb(inb(dev->cir_addr + IT8708_C0RCR) | IT85_RXACT,
 		dev->cir_addr + IT8708_C0RCR);
@@ -873,8 +811,6 @@ static void it8708_idle_rx(struct ite_dev *dev)
 /* disable the receiver; this must be called with the device spinlock held */
 static void it8708_disable_rx(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* disable the receiver interrupts */
 	outb(inb(dev->cir_addr + IT8708_C0IER) &
 		~(IT85_RDAIE | IT85_RFOIE),
@@ -892,8 +828,6 @@ static void it8708_disable_rx(struct ite_dev *dev)
 /* enable the receiver; this must be called with the device spinlock held */
 static void it8708_enable_rx(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* enable the receiver by setting RXEN */
 	outb(inb(dev->cir_addr + IT8708_C0RCR) | IT85_RXEN,
 		dev->cir_addr + IT8708_C0RCR);
@@ -911,8 +845,6 @@ static void it8708_enable_rx(struct ite_dev *dev)
  * spinlock held */
 static void it8708_disable_tx_interrupt(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* disable the transmitter interrupts */
 	outb(inb(dev->cir_addr + IT8708_C0IER) & ~IT85_TLDLIE,
 		dev->cir_addr + IT8708_C0IER);
@@ -922,8 +854,6 @@ static void it8708_disable_tx_interrupt(struct ite_dev *dev)
  * spinlock held */
 static void it8708_enable_tx_interrupt(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* enable the transmitter interrupts and master enable flag */
 	outb(inb(dev->cir_addr + IT8708_C0IER)
 		|IT85_TLDLIE | IT85_IEC,
@@ -933,8 +863,6 @@ static void it8708_enable_tx_interrupt(struct ite_dev *dev)
 /* disable the device; this must be called with the device spinlock held */
 static void it8708_disable(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* clear out all interrupt enable flags */
 	outb(inb(dev->cir_addr + IT8708_C0IER) &
 		~(IT85_IEC | IT85_RFOIE | IT85_RDAIE | IT85_TLDLIE),
@@ -951,8 +879,6 @@ static void it8708_disable(struct ite_dev *dev)
 /* initialize the hardware */
 static void it8708_init_hardware(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* disable all the interrupts */
 	outb(inb(dev->cir_addr + IT8708_C0IER) &
 		~(IT85_IEC | IT85_RFOIE | IT85_RDAIE | IT85_TLDLIE),
@@ -1058,8 +984,6 @@ static int it8709_get_irq_causes(struct ite_dev *dev)
 	u8 iflags;
 	int ret = 0;
 
-	ite_dbg("%s called", __func__);
-
 	/* read the interrupt flags */
 	iflags = it8709_rm(dev, IT8709_IIR);
 
@@ -1081,8 +1005,6 @@ static void it8709_set_carrier_params(struct ite_dev *dev, bool high_freq,
 {
 	u8 val;
 
-	ite_dbg("%s called", __func__);
-
 	val = (it8709_rr(dev, IT85_C0CFR)
 		     &~(IT85_HCFS | IT85_CFQ)) |
 	    carrier_freq_bits;
@@ -1115,8 +1037,6 @@ static int it8709_get_rx_bytes(struct ite_dev *dev, u8 * buf, int buf_size)
 {
 	int fifo, read = 0;
 
-	ite_dbg("%s called", __func__);
-
 	/* read how many bytes are still in the FIFO */
 	fifo = it8709_rm(dev, IT8709_RFSR) & IT85_RXFBC;
 
@@ -1140,8 +1060,6 @@ static int it8709_get_rx_bytes(struct ite_dev *dev, u8 * buf, int buf_size)
  * empty; let's expect this won't be a problem */
 static int it8709_get_tx_used_slots(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	return it8709_rr(dev, IT85_C0TFSR) & IT85_TXFBC;
 }
 
@@ -1155,8 +1073,6 @@ static void it8709_put_tx_byte(struct ite_dev *dev, u8 value)
   pulse is detected; this must be called with the device spinlock held */
 static void it8709_idle_rx(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* disable streaming by clearing RXACT writing it as 1 */
 	it8709_wr(dev, it8709_rr(dev, IT85_C0RCR) | IT85_RXACT,
 			    IT85_C0RCR);
@@ -1169,8 +1085,6 @@ static void it8709_idle_rx(struct ite_dev *dev)
 /* disable the receiver; this must be called with the device spinlock held */
 static void it8709_disable_rx(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* disable the receiver interrupts */
 	it8709_wr(dev, it8709_rr(dev, IT85_C0IER) &
 			    ~(IT85_RDAIE | IT85_RFOIE),
@@ -1188,8 +1102,6 @@ static void it8709_disable_rx(struct ite_dev *dev)
 /* enable the receiver; this must be called with the device spinlock held */
 static void it8709_enable_rx(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* enable the receiver by setting RXEN */
 	it8709_wr(dev, it8709_rr(dev, IT85_C0RCR) | IT85_RXEN,
 			    IT85_C0RCR);
@@ -1207,8 +1119,6 @@ static void it8709_enable_rx(struct ite_dev *dev)
  * spinlock held */
 static void it8709_disable_tx_interrupt(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* disable the transmitter interrupts */
 	it8709_wr(dev, it8709_rr(dev, IT85_C0IER) & ~IT85_TLDLIE,
 			    IT85_C0IER);
@@ -1218,8 +1128,6 @@ static void it8709_disable_tx_interrupt(struct ite_dev *dev)
  * spinlock held */
 static void it8709_enable_tx_interrupt(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* enable the transmitter interrupts and master enable flag */
 	it8709_wr(dev, it8709_rr(dev, IT85_C0IER)
 			    |IT85_TLDLIE | IT85_IEC,
@@ -1229,8 +1137,6 @@ static void it8709_enable_tx_interrupt(struct ite_dev *dev)
 /* disable the device; this must be called with the device spinlock held */
 static void it8709_disable(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* clear out all interrupt enable flags */
 	it8709_wr(dev, it8709_rr(dev, IT85_C0IER) &
 			~(IT85_IEC | IT85_RFOIE | IT85_RDAIE | IT85_TLDLIE),
@@ -1247,8 +1153,6 @@ static void it8709_disable(struct ite_dev *dev)
 /* initialize the hardware */
 static void it8709_init_hardware(struct ite_dev *dev)
 {
-	ite_dbg("%s called", __func__);
-
 	/* disable all the interrupts */
 	it8709_wr(dev, it8709_rr(dev, IT85_C0IER) &
 			~(IT85_IEC | IT85_RFOIE | IT85_RDAIE | IT85_TLDLIE),
@@ -1290,8 +1194,6 @@ static int ite_open(struct rc_dev *rcdev)
 	struct ite_dev *dev = rcdev->priv;
 	unsigned long flags;
 
-	ite_dbg("%s called", __func__);
-
 	spin_lock_irqsave(&dev->lock, flags);
 	dev->in_use = true;
 
@@ -1309,8 +1211,6 @@ static void ite_close(struct rc_dev *rcdev)
 	struct ite_dev *dev = rcdev->priv;
 	unsigned long flags;
 
-	ite_dbg("%s called", __func__);
-
 	spin_lock_irqsave(&dev->lock, flags);
 	dev->in_use = false;
 
@@ -1449,8 +1349,6 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 	int model_no;
 	int io_rsrc_no;
 
-	ite_dbg("%s called", __func__);
-
 	itdev = kzalloc(sizeof(struct ite_dev), GFP_KERNEL);
 	if (!itdev)
 		return ret;
@@ -1465,16 +1363,15 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 
 	/* get the model number */
 	model_no = (int)dev_id->driver_data;
-	ite_pr(KERN_NOTICE, "Auto-detected model: %s\n",
+	dev_dbg(&pdev->dev, "Auto-detected model: %s\n",
 		ite_dev_descs[model_no].model);
 
 	if (model_number >= 0 && model_number < ARRAY_SIZE(ite_dev_descs)) {
 		model_no = model_number;
-		ite_pr(KERN_NOTICE, "The model has been fixed by a module parameter.");
+		dev_info(&pdev->dev, "model has been forced to: %s",
+			 ite_dev_descs[model_no].model);
 	}
 
-	ite_pr(KERN_NOTICE, "Using model: %s\n", ite_dev_descs[model_no].model);
-
 	/* get the description for the device */
 	dev_desc = &ite_dev_descs[model_no];
 	io_rsrc_no = dev_desc->io_rsrc_no;
@@ -1525,20 +1422,6 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 	if (rx_high_carrier_freq > 0)
 		itdev->params.rx_high_carrier_freq = rx_high_carrier_freq;
 
-	/* print out parameters */
-	ite_pr(KERN_NOTICE, "TX-capable: %d\n", (int)
-			 itdev->params.hw_tx_capable);
-	ite_pr(KERN_NOTICE, "Sample period (ns): %ld\n", (long)
-		     itdev->params.sample_period);
-	ite_pr(KERN_NOTICE, "TX carrier frequency (Hz): %d\n", (int)
-		     itdev->params.tx_carrier_freq);
-	ite_pr(KERN_NOTICE, "TX duty cycle (%%): %d\n", (int)
-		     itdev->params.tx_duty_cycle);
-	ite_pr(KERN_NOTICE, "RX low carrier frequency (Hz): %d\n", (int)
-		     itdev->params.rx_low_carrier_freq);
-	ite_pr(KERN_NOTICE, "RX high carrier frequency (Hz): %d\n", (int)
-		     itdev->params.rx_high_carrier_freq);
-
 	/* set up hardware initial state */
 	itdev->params.init_hardware(itdev);
 
@@ -1589,8 +1472,6 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 			ITE_DRIVER_NAME, (void *)itdev))
 		goto exit_release_cir_addr;
 
-	ite_pr(KERN_NOTICE, "driver has been successfully loaded\n");
-
 	return 0;
 
 exit_release_cir_addr:
@@ -1610,8 +1491,6 @@ static void ite_remove(struct pnp_dev *pdev)
 	struct ite_dev *dev = pnp_get_drvdata(pdev);
 	unsigned long flags;
 
-	ite_dbg("%s called", __func__);
-
 	spin_lock_irqsave(&dev->lock, flags);
 
 	/* disable hardware */
@@ -1633,8 +1512,6 @@ static int ite_suspend(struct pnp_dev *pdev, pm_message_t state)
 	struct ite_dev *dev = pnp_get_drvdata(pdev);
 	unsigned long flags;
 
-	ite_dbg("%s called", __func__);
-
 	/* wait for any transmission to end */
 	wait_event_interruptible(dev->tx_ended, !dev->transmitting);
 
@@ -1653,8 +1530,6 @@ static int ite_resume(struct pnp_dev *pdev)
 	struct ite_dev *dev = pnp_get_drvdata(pdev);
 	unsigned long flags;
 
-	ite_dbg("%s called", __func__);
-
 	spin_lock_irqsave(&dev->lock, flags);
 
 	/* reinitialize hardware config registers */
@@ -1672,8 +1547,6 @@ static void ite_shutdown(struct pnp_dev *pdev)
 	struct ite_dev *dev = pnp_get_drvdata(pdev);
 	unsigned long flags;
 
-	ite_dbg("%s called", __func__);
-
 	spin_lock_irqsave(&dev->lock, flags);
 
 	/* disable all interrupts */
diff --git a/drivers/media/rc/ite-cir.h b/drivers/media/rc/ite-cir.h
index dfdc26ba976c..853001f67445 100644
--- a/drivers/media/rc/ite-cir.h
+++ b/drivers/media/rc/ite-cir.h
@@ -8,21 +8,6 @@
 /* platform driver name to register */
 #define ITE_DRIVER_NAME "ite-cir"
 
-/* logging macros */
-#define ite_pr(level, text, ...) \
-	printk(level KBUILD_MODNAME ": " text, ## __VA_ARGS__)
-#define ite_dbg(text, ...) do { \
-	if (debug) \
-		printk(KERN_DEBUG \
-			KBUILD_MODNAME ": " text "\n" , ## __VA_ARGS__); \
-} while (0)
-
-#define ite_dbg_verbose(text, ...) do {\
-	if (debug > 1) \
-		printk(KERN_DEBUG \
-			KBUILD_MODNAME ": " text "\n" , ## __VA_ARGS__); \
-} while (0)
-
 /* FIFO sizes */
 #define ITE_TX_FIFO_LEN 32
 #define ITE_RX_FIFO_LEN 32
-- 
2.29.2

