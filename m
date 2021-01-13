Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCCA32F4360
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 05:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbhAMEwp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 23:52:45 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:52431 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726375AbhAMEwl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 23:52:41 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 172991A97;
        Tue, 12 Jan 2021 23:51:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 12 Jan 2021 23:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=ih9mGv1qM3ePD
        xTUPxNck+dFubidDoXlLwxus9O0g8A=; b=ZH71xXh1CLDdwyw2g+diVyQEFEnj9
        v+96qoK/uoSsIwx8EqPV4kPKWuuJfBiilBz1EZP9raxjI71QtV3I6bXfqu/6n/mP
        QlI1PcKdVGuaofmQQyVud0c6Y3JR7vKx4vxk0XInfrOBgf5ubS5vcq/obz/2cuKU
        xOa6+/sPPlq9tuirvunhIZgfWaXae0EvzAfRLcS4vfpydQ+NsL5RrFhHjV68Ru7s
        Hpdjcgpn7unHb30CdOS/9J1F/1+AbcbcROn2S73y//nG/XqvwhChsoNFBc7mmGb/
        yiO1KDElL/2ZtO/HOOlnRmzRs58U1pj5c0iEEddqnOtPklUeCnb/OB6Yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=ih9mGv1qM3ePDxTUPxNck+dFubidDoXlLwxus9O0g8A=; b=pezWa+Os
        jNq2Y3IaG7C5PDSmWbrsPDnOidB/tXhOF+UcWKwThP7UTKJht5TMXbcvbH588+Bq
        pyEKkp5fLR9Bc3Bun0coJaK4jr6SJS/xVUvK0fJAtgRX3+rXRKXB1Lj6OnPOyRWr
        RQxDmsYidXP/hLAMWLSuThFZtYSwR5wUCr8Ul/9OSqNG3iJGDaA8dKNoufM3hdIX
        cSgIJUboDiNa+9Y2nlHAc9v8RGdLKJFSB3SzasPm9P/ae2J0dfJGr9Wl0jxWFTXh
        ZLuh6ZNqmGPJR2D/QGNBVeAEa3K5XL/5ojpSNngdSSt/nxIuNoJ0u0DiBE5p5Sav
        +UtXLIQLyEBBuw==
X-ME-Sender: <xms:Vnz-X_h8DzxloHXn6F7GyEMetiut8FUEjlSA-pg3mKUxDyrOBus8Tg>
    <xme:Vnz-X8AhdQnoXmzhnblll9bwSLIFGJwBgls7kgI4Yc-6wR6NCRO4wCXcfXBWjoG9T
    w79NhZ-ZPSGngIdXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
    rdhorhhg
X-ME-Proxy: <xmx:Vnz-X_E2ktfnc79LLkAO796pDK2-REkCkG7_jbWDrcF6Z2JU07wUuA>
    <xmx:Vnz-X8RWrQ_2GX-hcdNmfmQ35FYBTyrW3hbV2MalnP65cGMbwBYmVw>
    <xmx:Vnz-X8zNtZmXVCuSxIJXzdLo7UODurNjL7aF4SKDcnUh9YTEBTdeeg>
    <xmx:Vnz-XzkQtqrr9C4KExEjsPmjwF3yeOIOeYZrYyMf3xjHG3eGm_VFFw>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1975824005B;
        Tue, 12 Jan 2021 23:51:34 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>
Subject: [PATCH 3/4] media: sunxi-cir: Factor out hardware initialization
Date:   Tue, 12 Jan 2021 22:51:31 -0600
Message-Id: <20210113045132.31430-4-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113045132.31430-1-samuel@sholland.org>
References: <20210113045132.31430-1-samuel@sholland.org>
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

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/media/rc/sunxi-cir.c | 128 ++++++++++++++++++++---------------
 1 file changed, 74 insertions(+), 54 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 48be400421cd..ccb9d6b4225d 100644
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
+	sunxi_ir_hw_exit(&pdev->dev);
 	rc_unregister_device(ir->rc);
+
 	return 0;
 }
 
-- 
2.26.2

