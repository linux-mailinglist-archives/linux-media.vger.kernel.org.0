Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19EC512AC0C
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2019 13:02:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbfLZMCu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Dec 2019 07:02:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:41086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbfLZMCu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Dec 2019 07:02:50 -0500
Received: from localhost (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CE9562075E;
        Thu, 26 Dec 2019 12:02:46 +0000 (UTC)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Jun Nie <jun.nie@linaro.org>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 2/2] media: rc: ir-hix5hd2: add hi3796cv300-ir support
Date:   Thu, 26 Dec 2019 20:02:22 +0800
Message-Id: <20191226120222.14745-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191226120222.14745-1-shawn.guo@linaro.org>
References: <20191226120222.14745-1-shawn.guo@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IR device on Hi3796CV300 SoC is mostly same as hix5hd2, except the
following two things.

 - IR_CLK offset is 0x60 instead of 0x48.
 - It needs to set an extra bit in IR_ENABLE register to enable IR.

The following changes are made to deal with them.

 - Define a SoC specific data to accommodate IR_CLK offset and the flag
   telling requirement of extra enable bit.
 - Create function hix5hd2_ir_enable() to handle IR enabling. The original
   hix5hd2_ir_enable() is all about managing IR clock, so gets renamed
   to hix5hd2_ir_clk_enable().
 - Device table hix5hd2_ir_table[] gets moved forward, as it's being
   used by hix5hd2_ir_probe() now.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/media/rc/ir-hix5hd2.c | 79 +++++++++++++++++++++++++++--------
 1 file changed, 61 insertions(+), 18 deletions(-)

diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index 32ccefeff57d..d80cfa455c73 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -37,10 +37,13 @@
 #define INT_CLR_RCV		BIT(16)
 #define INT_CLR_RCVTIMEOUT	(BIT(16) | BIT(17))
 
-#define IR_CLK			0x48
 #define IR_CLK_ENABLE		BIT(4)
 #define IR_CLK_RESET		BIT(5)
 
+/* IR_ENABLE register bits */
+#define IR_ENABLE_EN		BIT(0)
+#define IR_ENABLE_EN_EXTRA	BIT(8)
+
 #define IR_CFG_WIDTH_MASK	0xffff
 #define IR_CFG_WIDTH_SHIFT	16
 #define IR_CFG_FORMAT_MASK	0x3
@@ -58,6 +61,23 @@
 
 #define IR_HIX5HD2_NAME		"hix5hd2-ir"
 
+/* Need to set extra bit for enabling IR */
+#define HIX5HD2_FLAG_EXTRA_ENABLE	BIT(0)
+
+struct hix5hd2_soc_data {
+	u32 clk_reg;
+	u32 flags;
+};
+
+static const struct hix5hd2_soc_data hix5hd2_data = {
+	.clk_reg = 0x48,
+};
+
+static const struct hix5hd2_soc_data hi3796cv300_data = {
+	.clk_reg = 0x60,
+	.flags = HIX5HD2_FLAG_EXTRA_ENABLE,
+};
+
 struct hix5hd2_ir_priv {
 	int			irq;
 	void __iomem		*base;
@@ -66,15 +86,17 @@ struct hix5hd2_ir_priv {
 	struct regmap		*regmap;
 	struct clk		*clock;
 	unsigned long		rate;
+	const struct hix5hd2_soc_data *socdata;
 };
 
-static int hix5hd2_ir_enable(struct hix5hd2_ir_priv *dev, bool on)
+static int hix5hd2_ir_clk_enable(struct hix5hd2_ir_priv *dev, bool on)
 {
+	u32 clk_reg = dev->socdata->clk_reg;
 	u32 val;
 	int ret = 0;
 
 	if (dev->regmap) {
-		regmap_read(dev->regmap, IR_CLK, &val);
+		regmap_read(dev->regmap, clk_reg, &val);
 		if (on) {
 			val &= ~IR_CLK_RESET;
 			val |= IR_CLK_ENABLE;
@@ -82,7 +104,7 @@ static int hix5hd2_ir_enable(struct hix5hd2_ir_priv *dev, bool on)
 			val &= ~IR_CLK_ENABLE;
 			val |= IR_CLK_RESET;
 		}
-		regmap_write(dev->regmap, IR_CLK, val);
+		regmap_write(dev->regmap, clk_reg, val);
 	} else {
 		if (on)
 			ret = clk_prepare_enable(dev->clock);
@@ -92,12 +114,23 @@ static int hix5hd2_ir_enable(struct hix5hd2_ir_priv *dev, bool on)
 	return ret;
 }
 
+static inline void hix5hd2_ir_enable(struct hix5hd2_ir_priv *priv)
+{
+	u32 val = IR_ENABLE_EN;
+
+	if (priv->socdata->flags & HIX5HD2_FLAG_EXTRA_ENABLE)
+		val |= IR_ENABLE_EN_EXTRA;
+
+	writel_relaxed(val, priv->base + IR_ENABLE);
+}
+
 static int hix5hd2_ir_config(struct hix5hd2_ir_priv *priv)
 {
 	int timeout = 10000;
 	u32 val, rate;
 
-	writel_relaxed(0x01, priv->base + IR_ENABLE);
+	hix5hd2_ir_enable(priv);
+
 	while (readl_relaxed(priv->base + IR_BUSY)) {
 		if (timeout--) {
 			udelay(1);
@@ -128,13 +161,13 @@ static int hix5hd2_ir_open(struct rc_dev *rdev)
 	struct hix5hd2_ir_priv *priv = rdev->priv;
 	int ret;
 
-	ret = hix5hd2_ir_enable(priv, true);
+	ret = hix5hd2_ir_clk_enable(priv, true);
 	if (ret)
 		return ret;
 
 	ret = hix5hd2_ir_config(priv);
 	if (ret) {
-		hix5hd2_ir_enable(priv, false);
+		hix5hd2_ir_clk_enable(priv, false);
 		return ret;
 	}
 	return 0;
@@ -144,7 +177,7 @@ static void hix5hd2_ir_close(struct rc_dev *rdev)
 {
 	struct hix5hd2_ir_priv *priv = rdev->priv;
 
-	hix5hd2_ir_enable(priv, false);
+	hix5hd2_ir_clk_enable(priv, false);
 }
 
 static irqreturn_t hix5hd2_ir_rx_interrupt(int irq, void *data)
@@ -205,6 +238,13 @@ static irqreturn_t hix5hd2_ir_rx_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static const struct of_device_id hix5hd2_ir_table[] = {
+	{ .compatible = "hisilicon,hix5hd2-ir", &hix5hd2_data, },
+	{ .compatible = "hisilicon,hi3796cv300-ir", &hi3796cv300_data, },
+	{},
+};
+MODULE_DEVICE_TABLE(of, hix5hd2_ir_table);
+
 static int hix5hd2_ir_probe(struct platform_device *pdev)
 {
 	struct rc_dev *rdev;
@@ -212,6 +252,7 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct hix5hd2_ir_priv *priv;
 	struct device_node *node = pdev->dev.of_node;
+	const struct of_device_id *of_id;
 	const char *map_name;
 	int ret;
 
@@ -219,6 +260,13 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	of_id = of_match_device(hix5hd2_ir_table, dev);
+	if (!of_id) {
+		dev_err(dev, "Unable to initialize IR data\n");
+		return -ENODEV;
+	}
+	priv->socdata = of_id->data;
+
 	priv->regmap = syscon_regmap_lookup_by_phandle(node,
 						       "hisilicon,power-syscon");
 	if (IS_ERR(priv->regmap)) {
@@ -309,7 +357,7 @@ static int hix5hd2_ir_suspend(struct device *dev)
 	struct hix5hd2_ir_priv *priv = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(priv->clock);
-	hix5hd2_ir_enable(priv, false);
+	hix5hd2_ir_clk_enable(priv, false);
 
 	return 0;
 }
@@ -319,17 +367,18 @@ static int hix5hd2_ir_resume(struct device *dev)
 	struct hix5hd2_ir_priv *priv = dev_get_drvdata(dev);
 	int ret;
 
-	ret = hix5hd2_ir_enable(priv, true);
+	ret = hix5hd2_ir_clk_enable(priv, true);
 	if (ret)
 		return ret;
 
 	ret = clk_prepare_enable(priv->clock);
 	if (ret) {
-		hix5hd2_ir_enable(priv, false);
+		hix5hd2_ir_clk_enable(priv, false);
 		return ret;
 	}
 
-	writel_relaxed(0x01, priv->base + IR_ENABLE);
+	hix5hd2_ir_enable(priv);
+
 	writel_relaxed(0x00, priv->base + IR_INTM);
 	writel_relaxed(0xff, priv->base + IR_INTC);
 	writel_relaxed(0x01, priv->base + IR_START);
@@ -341,12 +390,6 @@ static int hix5hd2_ir_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(hix5hd2_ir_pm_ops, hix5hd2_ir_suspend,
 			 hix5hd2_ir_resume);
 
-static const struct of_device_id hix5hd2_ir_table[] = {
-	{ .compatible = "hisilicon,hix5hd2-ir", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, hix5hd2_ir_table);
-
 static struct platform_driver hix5hd2_ir_driver = {
 	.driver = {
 		.name = IR_HIX5HD2_NAME,
-- 
2.17.1

