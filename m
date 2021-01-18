Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4E92F99AC
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 07:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732265AbhARGDY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 01:03:24 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:42241 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732160AbhARGBt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 01:01:49 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id C0F1C1663;
        Mon, 18 Jan 2021 01:00:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 18 Jan 2021 01:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=RMuwNT1Hew4wW
        7Q7YQrXED8Io6dkZ7L7WBM/BZFkbh8=; b=lggIL5nJB4XOmsBwlpIkujOL0TJ/x
        Y+H3tdx2ckWc+z3ZNTqDiRZaoFg1FS2gDrPkfpiIdrK4wP8aVsCrSztYTdVv1Y5A
        JPV4g6twO8zzKklV8wYwWl2Kl7RnlZcB09TASNbBaqNrz42LqGPCg72KipekMsQY
        Ge5Cg0cA1M2UKDV8u1zar/Xy5/Esm3YPIj3Plw7rs0DIXwDOzfuSoTDylOzixiRT
        b3CcDsWYPKFNCcG5pCdGnB/DJD2l43EylswcSEijLcrmqYzunvXuZ2P+SXbYakDe
        gxRZepleMcy5UHIyvzDnmjnzkUp2QHuDuxZxq6AF+QzPs55EN5w/Hfdbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=RMuwNT1Hew4wW7Q7YQrXED8Io6dkZ7L7WBM/BZFkbh8=; b=qNX8XITK
        fpJB8p5DFMmFj+MvEECRgJpvaaklpMrGK1ygC+pVdUKlcqI394oRz8BW15pVXyAb
        TTvY1EMd7L1ys3Y+4xLjxdp/dZrM0QQJzav0WlLAq37A7Aik/YrChehF/y0hEJ0i
        S0XLXuoFGQfkrM4bgOud8YduD3OkKJ47fcCdReAqNA9jgSmFJ1xEPARX2FIdD6EX
        kuc1hMGNFasCw4UxUFjyxlpOYoMWppbLK4ZpILL2MUXuvjKXGP0kJg9K1wQsxRks
        EDmRvhlP1/o1agnpV1P60gCjyW4oHz3M73IB9OqukHTxm7os5XhbIVQh0x8u05eT
        u3k6lKYZAlOCKg==
X-ME-Sender: <xms:EyQFYCmFI39m9U0WS4CCXYp--oPH4G71qCaAaoTm0-QMC_igY4TBjw>
    <xme:EyQFYJ2khKMF5QrWNkRqSg2QANBjMRQgxKphnC0Lrz2BbQB5wZcJTLKgB-bGvSEbl
    H0keet_S7Z_sGfMOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdeklecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
    rdhorhhg
X-ME-Proxy: <xmx:EyQFYAp9e6keeBsfB7oKzIvotXgNWo3kCAa4iY-ivEaDzHLOe_i0RQ>
    <xmx:EyQFYGmlBlLV0CtpowdW63Fu4vq90rm1RFXqQWFoyvdpWcnIFCdyqQ>
    <xmx:EyQFYA2IgKwjkskboC1TQjWkpp75q_lTmMcRxQqxhM0N3aaGWHU8VQ>
    <xmx:EyQFYKqGEPFigKtlZa5rDH9aE27dpGkfa0T782yg6rcceSG7iNGI_g>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id CC33C1080063;
        Mon, 18 Jan 2021 01:00:50 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 3/4] media: sunxi-cir: Factor out hardware initialization
Date:   Mon, 18 Jan 2021 00:00:47 -0600
Message-Id: <20210118060048.22267-4-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118060048.22267-1-samuel@sholland.org>
References: <20210118060048.22267-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation for adding suspend/resume hooks, factor out the hardware
initialization from the driver probe/remove functions.

The timeout programmed during init is taken from the `struct rc_dev` so
it is maintained across an exit/init cycle.

This resolves some trivial issues with the probe function: throwing away
the error from clk_prepare_enable and using the wrong type for the
temporary register value.

It also fixes the order of the remove function to unregister the RC
device before turning off the hardware. This prevents userspace from
triggering register writes (via LIRC_SET_REC_TIMEOUT) while the hardware
is disabled.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/media/rc/sunxi-cir.c | 128 ++++++++++++++++++++---------------
 1 file changed, 74 insertions(+), 54 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 48be400421cd..2d099da8d3cc 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -169,10 +169,74 @@ static int sunxi_ir_set_timeout(struct rc_dev *rc_dev, unsigned int timeout)
 	return 0;
 }
 
+static int sunxi_ir_hw_init(struct device *dev)
+{
+	struct sunxi_ir *ir = dev_get_drvdata(dev);
+	u32 tmp;
+	int ret;
+
+	ret = reset_control_deassert(ir->rst);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(ir->apb_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable apb clk\n");
+		goto exit_assert_reset;
+	}
+
+	ret = clk_prepare_enable(ir->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable ir clk\n");
+		goto exit_disable_apb_clk;
+	}
+
+	/* Enable CIR Mode */
+	writel(REG_CTL_MD, ir->base + SUNXI_IR_CTL_REG);
+
+	/* Set noise threshold and idle threshold */
+	sunxi_ir_set_timeout(ir->rc, ir->rc->timeout);
+
+	/* Invert Input Signal */
+	writel(REG_RXCTL_RPPI, ir->base + SUNXI_IR_RXCTL_REG);
+
+	/* Clear All Rx Interrupt Status */
+	writel(REG_RXSTA_CLEARALL, ir->base + SUNXI_IR_RXSTA_REG);
+
+	/*
+	 * Enable IRQ on overflow, packet end, FIFO available with trigger
+	 * level
+	 */
+	writel(REG_RXINT_ROI_EN | REG_RXINT_RPEI_EN |
+	       REG_RXINT_RAI_EN | REG_RXINT_RAL(ir->fifo_size / 2 - 1),
+	       ir->base + SUNXI_IR_RXINT_REG);
+
+	/* Enable IR Module */
+	tmp = readl(ir->base + SUNXI_IR_CTL_REG);
+	writel(tmp | REG_CTL_GEN | REG_CTL_RXEN, ir->base + SUNXI_IR_CTL_REG);
+
+	return 0;
+
+exit_disable_apb_clk:
+	clk_disable_unprepare(ir->apb_clk);
+exit_assert_reset:
+	reset_control_assert(ir->rst);
+
+	return ret;
+}
+
+static void sunxi_ir_hw_exit(struct device *dev)
+{
+	struct sunxi_ir *ir = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(ir->clk);
+	clk_disable_unprepare(ir->apb_clk);
+	reset_control_assert(ir->rst);
+}
+
 static int sunxi_ir_probe(struct platform_device *pdev)
 {
 	int ret = 0;
-	unsigned long tmp = 0;
 
 	struct device *dev = &pdev->dev;
 	struct device_node *dn = dev->of_node;
@@ -213,43 +277,26 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 		ir->rst = devm_reset_control_get_exclusive(dev, NULL);
 		if (IS_ERR(ir->rst))
 			return PTR_ERR(ir->rst);
-		ret = reset_control_deassert(ir->rst);
-		if (ret)
-			return ret;
 	}
 
 	ret = clk_set_rate(ir->clk, b_clk_freq);
 	if (ret) {
 		dev_err(dev, "set ir base clock failed!\n");
-		goto exit_reset_assert;
+		return ret;
 	}
 	dev_dbg(dev, "set base clock frequency to %d Hz.\n", b_clk_freq);
 
-	if (clk_prepare_enable(ir->apb_clk)) {
-		dev_err(dev, "try to enable apb_ir_clk failed\n");
-		ret = -EINVAL;
-		goto exit_reset_assert;
-	}
-
-	if (clk_prepare_enable(ir->clk)) {
-		dev_err(dev, "try to enable ir_clk failed\n");
-		ret = -EINVAL;
-		goto exit_clkdisable_apb_clk;
-	}
-
 	/* IO */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ir->base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(ir->base)) {
-		ret = PTR_ERR(ir->base);
-		goto exit_clkdisable_clk;
+		return PTR_ERR(ir->base);
 	}
 
 	ir->rc = rc_allocate_device(RC_DRIVER_IR_RAW);
 	if (!ir->rc) {
 		dev_err(dev, "failed to allocate device\n");
-		ret = -ENOMEM;
-		goto exit_clkdisable_clk;
+		return -ENOMEM;
 	}
 
 	ir->rc->priv = ir;
@@ -265,6 +312,7 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	/* Frequency after IR internal divider with sample period in us */
 	ir->rc->rx_resolution = (USEC_PER_SEC / (b_clk_freq / 64));
+	ir->rc->timeout = IR_DEFAULT_TIMEOUT;
 	ir->rc->min_timeout = sunxi_ithr_to_usec(b_clk_freq, 0);
 	ir->rc->max_timeout = sunxi_ithr_to_usec(b_clk_freq, 255);
 	ir->rc->s_timeout = sunxi_ir_set_timeout;
@@ -291,41 +339,15 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 		goto exit_free_dev;
 	}
 
-	/* Enable CIR Mode */
-	writel(REG_CTL_MD, ir->base+SUNXI_IR_CTL_REG);
-
-	/* Set noise threshold and idle threshold */
-	sunxi_ir_set_timeout(ir->rc, IR_DEFAULT_TIMEOUT);
-
-	/* Invert Input Signal */
-	writel(REG_RXCTL_RPPI, ir->base + SUNXI_IR_RXCTL_REG);
-
-	/* Clear All Rx Interrupt Status */
-	writel(REG_RXSTA_CLEARALL, ir->base + SUNXI_IR_RXSTA_REG);
-
-	/*
-	 * Enable IRQ on overflow, packet end, FIFO available with trigger
-	 * level
-	 */
-	writel(REG_RXINT_ROI_EN | REG_RXINT_RPEI_EN |
-	       REG_RXINT_RAI_EN | REG_RXINT_RAL(ir->fifo_size / 2 - 1),
-	       ir->base + SUNXI_IR_RXINT_REG);
-
-	/* Enable IR Module */
-	tmp = readl(ir->base + SUNXI_IR_CTL_REG);
-	writel(tmp | REG_CTL_GEN | REG_CTL_RXEN, ir->base + SUNXI_IR_CTL_REG);
+	ret = sunxi_ir_hw_init(dev);
+	if (ret)
+		goto exit_free_dev;
 
 	dev_info(dev, "initialized sunXi IR driver\n");
 	return 0;
 
 exit_free_dev:
 	rc_free_device(ir->rc);
-exit_clkdisable_clk:
-	clk_disable_unprepare(ir->clk);
-exit_clkdisable_apb_clk:
-	clk_disable_unprepare(ir->apb_clk);
-exit_reset_assert:
-	reset_control_assert(ir->rst);
 
 	return ret;
 }
@@ -334,11 +356,9 @@ static int sunxi_ir_remove(struct platform_device *pdev)
 {
 	struct sunxi_ir *ir = platform_get_drvdata(pdev);
 
-	clk_disable_unprepare(ir->clk);
-	clk_disable_unprepare(ir->apb_clk);
-	reset_control_assert(ir->rst);
-
 	rc_unregister_device(ir->rc);
+	sunxi_ir_hw_exit(&pdev->dev);
+
 	return 0;
 }
 
-- 
2.26.2

