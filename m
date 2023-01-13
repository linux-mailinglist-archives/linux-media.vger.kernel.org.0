Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0624D669389
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 10:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241008AbjAMJ5q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 04:57:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241135AbjAMJ5L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 04:57:11 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B651C6B5AF
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 01:54:21 -0800 (PST)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1pGGlO-0003cp-Ji; Fri, 13 Jan 2023 10:54:18 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 13 Jan 2023 10:54:22 +0100
Subject: [PATCH v2 16/16] media: imx-pxp: convert to regmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230112-imx-pxp-v2-16-e2281da1db55@pengutronix.de>
References: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
In-Reply-To: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.11.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace the readl and writel with regmap to ease debugging the registers
from userspace.

Suggested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog

v2:

- new patch
---
 drivers/media/platform/nxp/imx-pxp.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index b8a7e49cbc08..f2e9608a7d2d 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -21,6 +21,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 
@@ -176,6 +177,13 @@ enum {
 	V4L2_M2M_DST = 1,
 };
 
+static const struct regmap_config pxp_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = HW_PXP_VERSION,
+};
+
 static struct pxp_fmt *find_format(unsigned int pixelformat)
 {
 	struct pxp_fmt *fmt;
@@ -207,7 +215,7 @@ struct pxp_dev {
 #endif
 
 	struct clk		*clk;
-	void __iomem		*mmio;
+	struct regmap		*regmap;
 
 	const struct pxp_pdata	*pdata;
 
@@ -255,12 +263,16 @@ static struct pxp_q_data *get_q_data(struct pxp_ctx *ctx,
 
 static inline u32 pxp_read(struct pxp_dev *dev, u32 reg)
 {
-	return readl(dev->mmio + reg);
+	u32 value;
+
+	regmap_read(dev->regmap, reg, &value);
+
+	return value;
 }
 
 static inline void pxp_write(struct pxp_dev *dev, u32 reg, u32 value)
 {
-	writel(value, dev->mmio + reg);
+	regmap_write(dev->regmap, reg, value);
 }
 
 static u32 pxp_v4l2_pix_fmt_to_ps_format(u32 v4l2_pix_fmt)
@@ -1756,8 +1768,8 @@ static int pxp_soft_reset(struct pxp_dev *dev)
 
 	pxp_write(dev, HW_PXP_CTRL_SET, BM_PXP_CTRL_SFTRST);
 
-	ret = readl_poll_timeout(dev->mmio + HW_PXP_CTRL, val,
-				 val & BM_PXP_CTRL_CLKGATE, 0, 100);
+	ret = regmap_read_poll_timeout(dev->regmap, HW_PXP_CTRL, val,
+				       val & BM_PXP_CTRL_CLKGATE, 0, 100);
 	if (ret < 0)
 		return ret;
 
@@ -1774,6 +1786,7 @@ static int pxp_probe(struct platform_device *pdev)
 	int irq;
 	u32 hw_version;
 	int ret;
+	void __iomem *mmio;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
@@ -1788,9 +1801,11 @@ static int pxp_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	dev->mmio = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(dev->mmio))
-		return PTR_ERR(dev->mmio);
+	mmio = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mmio))
+		return PTR_ERR(mmio);
+	dev->regmap = devm_regmap_init_mmio(&pdev->dev, mmio,
+					    &pxp_regmap_config);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)

-- 
2.30.2
