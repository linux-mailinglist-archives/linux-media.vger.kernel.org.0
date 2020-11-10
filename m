Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 795F12AD22D
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 10:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgKJJQE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 04:16:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgKJJQE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 04:16:04 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2258EC0613CF
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 01:16:04 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id EB923C6389; Tue, 10 Nov 2020 09:15:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1604999757; bh=tDnE0GizgWhHBHXSTNsrdayXMk2UGr+MnzFQqwiAo9A=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KQVWnnw5+R8DQxEGKXFG96hqFSPAWiXpIJ6znsCMa9a9x8avvRQFlbLxeB4al5Ndn
         F+q4dPskc/rsoYknhE6efwG0O97nGyZAaTz0T3hqO5yTF/wrWDxMK0T+ePY/AX3Uqf
         94SrqeKaBqxIlaMub3Ef1gMdSjbgjYHH1N3riEox+UkPq7mthU4+Z+L4dpwFqo5Q3Q
         gYw090XfJZRic4w5G0ajdHDsLsLTzUdGi0hVzmIFA95/kfIIBP5AC5A0YdubUdlLf2
         df9FAX7rbLVU5mIsUfu92qEew0INB+FWR0NcyQ6l3CZFzAxTYEbEq8Q06gjYFh0dj9
         FI9UuLZw859Zw==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] media: sunxi-cir: allow timeout to be set at runtime
Date:   Tue, 10 Nov 2020 09:15:57 +0000
Message-Id: <20201110091557.25680-2-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110091557.25680-1-sean@mess.org>
References: <20201110091557.25680-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This allows the timeout to be set with the LIRC_SET_REC_TIMEOUT ioctl.

The timeout was hardcoded at just over 20ms, but returned 120ms when
queried with the LIRC_GET_REC_TIMEOUT ioctl.

This also ensures the idle threshold is set correctly with a base clock
other than 8000000Mhz.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/sunxi-cir.c | 46 +++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 4afc5895bee74..3c25db25e55c6 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -73,10 +73,6 @@
 #define SUNXI_IR_BASE_CLK     8000000
 /* Noise threshold in samples  */
 #define SUNXI_IR_RXNOISE      1
-/* Idle Threshold in samples */
-#define SUNXI_IR_RXIDLE       20
-/* Time after which device stops sending data in ms */
-#define SUNXI_IR_TIMEOUT      120
 
 /**
  * struct sunxi_ir_quirks - Differences between SoC variants.
@@ -146,6 +142,39 @@ static irqreturn_t sunxi_ir_irq(int irqno, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/* Convert idle threshold to usec */
+static unsigned int sunxi_ithr_to_usec(unsigned int base_clk, unsigned int ithr)
+{
+	return (USEC_PER_SEC * (ithr + 1)) / (base_clk / (128 * 64));
+}
+
+/* Convert usec to idle threshold */
+static unsigned int sunxi_usec_to_ithr(unsigned int base_clk, unsigned int usec)
+{
+	return ((base_clk / (128 * 64)) * usec) / USEC_PER_SEC;
+}
+
+static int sunxi_ir_set_timeout(struct rc_dev *rc_dev, unsigned int timeout)
+{
+	struct sunxi_ir *ir = rc_dev->priv;
+	unsigned int base_clk = clk_get_rate(ir->clk);
+	unsigned long flags;
+
+	unsigned int ithr = sunxi_usec_to_ithr(base_clk, timeout);
+
+	dev_dbg(rc_dev->dev.parent, "setting idle threshold to %u\n", ithr);
+
+	spin_lock_irqsave(&ir->ir_lock, flags);
+	/* Set noise threshold and idle threshold */
+	writel(REG_CIR_NTHR(SUNXI_IR_RXNOISE) | REG_CIR_ITHR(ithr),
+	       ir->base + SUNXI_IR_CIR_REG);
+	spin_unlock_irqrestore(&ir->ir_lock, flags);
+
+	rc_dev->timeout = sunxi_ithr_to_usec(base_clk, ithr);
+
+	return 0;
+}
+
 static int sunxi_ir_probe(struct platform_device *pdev)
 {
 	int ret = 0;
@@ -242,9 +271,11 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	ir->rc->map_name = ir->map_name ?: RC_MAP_EMPTY;
 	ir->rc->dev.parent = dev;
 	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
-	/* Frequency after IR internal divider with sample period in ns */
+	/* Frequency after IR internal divider with sample period in us */
 	ir->rc->rx_resolution = (USEC_PER_SEC / (b_clk_freq / 64));
-	ir->rc->timeout = MS_TO_US(SUNXI_IR_TIMEOUT);
+	ir->rc->min_timeout = sunxi_ithr_to_usec(b_clk_freq, 0);
+	ir->rc->max_timeout = sunxi_ithr_to_usec(b_clk_freq, 255);
+	ir->rc->s_timeout = sunxi_ir_set_timeout;
 	ir->rc->driver_name = SUNXI_IR_DEV;
 
 	ret = rc_register_device(ir->rc);
@@ -272,8 +303,7 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	writel(REG_CTL_MD, ir->base+SUNXI_IR_CTL_REG);
 
 	/* Set noise threshold and idle threshold */
-	writel(REG_CIR_NTHR(SUNXI_IR_RXNOISE)|REG_CIR_ITHR(SUNXI_IR_RXIDLE),
-	       ir->base + SUNXI_IR_CIR_REG);
+	sunxi_ir_set_timeout(ir->rc, IR_DEFAULT_TIMEOUT);
 
 	/* Invert Input Signal */
 	writel(REG_RXCTL_RPPI, ir->base + SUNXI_IR_RXCTL_REG);
-- 
2.28.0

