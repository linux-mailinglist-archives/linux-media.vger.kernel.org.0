Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610952B6BC1
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 18:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728400AbgKQRaS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 12:30:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgKQRaO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 12:30:14 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D48DC0613CF
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2020 09:30:14 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D9DEEC63A5; Tue, 17 Nov 2020 17:30:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1605634210; bh=MMDZoywFrNxZsk03LO9dzUpZrWc5treb8YZyekc2kB8=;
        h=From:To:Subject:Date:From;
        b=FsRi2okPgsbzk7idOoKYNUQVxX7tpMVewRmv15vyx2OlhCIoSCRUNTzcMISnHHbcG
         EllRrNouPb9Iz5od0IithLk8TR3RKE0zVUnW0Wu9Gc+xFcZ5A1gwz44HCjvd22OxhA
         QhmplaVUbs+k/9B28uEYS0SArkE1yf8qjmwST3036yHYg5/CIjMSFDAyStM5kea+NQ
         UPKXPq0wAtsGs8Lk2nkt7x2TEpkZ8QZIZXbEDgLRtNceVvN85N7PUevm3aNp/3lTpk
         IQOA4xlOBxmgM06YQ4R6pdVl6quimukUY/BNSXv0i+e3zyi1FLuSovsJ93zm7CiD/D
         /5Ikgfuxc5hPg==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] media: sunxi-cir: allow timeout to be set at runtime
Date:   Tue, 17 Nov 2020 17:30:10 +0000
Message-Id: <20201117173010.4912-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This allows the timeout to be set with the LIRC_SET_REC_TIMEOUT ioctl.

The timeout was hardcoded at just over 20ms, but returned 120ms when
queried with the LIRC_GET_REC_TIMEOUT ioctl.

This also ensures the idle threshold is set correctly with a base clock
other than 8Mhz.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Sean Young <sean@mess.org>
---
v2:

 - use DIV_ROUND_UP for calculating idle threshold
   idle threshold lower than requested can cause coding issues.
 - use DIV_ROUND_CLOSEST for calculating timeout from threshold
   means that reported timeout is more accurate.

 drivers/media/rc/sunxi-cir.c | 48 ++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 4afc5895bee7..8555c7798706 100644
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
@@ -146,6 +142,41 @@ static irqreturn_t sunxi_ir_irq(int irqno, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/* Convert idle threshold to usec */
+static unsigned int sunxi_ithr_to_usec(unsigned int base_clk, unsigned int ithr)
+{
+	return DIV_ROUND_CLOSEST(USEC_PER_SEC * (ithr + 1),
+				 base_clk / (128 * 64));
+}
+
+/* Convert usec to idle threshold */
+static unsigned int sunxi_usec_to_ithr(unsigned int base_clk, unsigned int usec)
+{
+	/* make sure we don't end up with a timeout less than requested */
+	return DIV_ROUND_UP((base_clk / (128 * 64)) * usec,  USEC_PER_SEC) - 1;
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
@@ -242,9 +273,11 @@ static int sunxi_ir_probe(struct platform_device *pdev)
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
@@ -272,8 +305,7 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	writel(REG_CTL_MD, ir->base+SUNXI_IR_CTL_REG);
 
 	/* Set noise threshold and idle threshold */
-	writel(REG_CIR_NTHR(SUNXI_IR_RXNOISE)|REG_CIR_ITHR(SUNXI_IR_RXIDLE),
-	       ir->base + SUNXI_IR_CIR_REG);
+	sunxi_ir_set_timeout(ir->rc, IR_DEFAULT_TIMEOUT);
 
 	/* Invert Input Signal */
 	writel(REG_RXCTL_RPPI, ir->base + SUNXI_IR_RXCTL_REG);
-- 
2.28.0

