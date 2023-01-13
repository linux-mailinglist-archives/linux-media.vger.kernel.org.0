Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A94B3669373
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 10:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241287AbjAMJ53 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 04:57:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239619AbjAMJ5A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 04:57:00 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF38567192
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 01:54:15 -0800 (PST)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1pGGlJ-0003cp-9F; Fri, 13 Jan 2023 10:54:13 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 13 Jan 2023 10:54:12 +0100
Subject: [PATCH v2 06/16] media: imx-pxp: make data_path_ctrl0 platform dependent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230112-imx-pxp-v2-6-e2281da1db55@pengutronix.de>
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

Unfortunately, the PXP_HW_VERSION register reports the PXP on the i.MX7D
and on the i.MX6ULL as version 3.0, although the PXP versions on these
SoCs have significant differences.

Use the compatible to configure the ctrl0 register as required dependent
on the platform.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog

v2:

- drop fallback for missing data_path_ctrl0
---
 drivers/media/platform/nxp/imx-pxp.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index bf3be989a552..c7f8a1808516 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -19,6 +19,7 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 
@@ -191,6 +192,12 @@ static struct pxp_fmt *find_format(struct v4l2_format *f)
 	return &formats[k];
 }
 
+struct pxp_ctx;
+
+struct pxp_pdata {
+	u32 (*data_path_ctrl0)(struct pxp_ctx *ctx);
+};
+
 struct pxp_dev {
 	struct v4l2_device	v4l2_dev;
 	struct video_device	vfd;
@@ -198,6 +205,8 @@ struct pxp_dev {
 	struct clk		*clk;
 	void __iomem		*mmio;
 
+	const struct pxp_pdata	*pdata;
+
 	atomic_t		num_inst;
 	struct mutex		dev_mutex;
 	spinlock_t		irqlock;
@@ -724,7 +733,7 @@ static void pxp_setup_csc(struct pxp_ctx *ctx)
 	}
 }
 
-static u32 pxp_data_path_ctrl0(struct pxp_ctx *ctx)
+static u32 pxp_imx6ull_data_path_ctrl0(struct pxp_ctx *ctx)
 {
 	u32 ctrl0;
 
@@ -760,7 +769,7 @@ static void pxp_set_data_path(struct pxp_ctx *ctx)
 	u32 ctrl0;
 	u32 ctrl1;
 
-	ctrl0 = pxp_data_path_ctrl0(ctx);
+	ctrl0 = dev->pdata->data_path_ctrl0(ctx);
 
 	ctrl1 = 0;
 	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(3);
@@ -1705,6 +1714,8 @@ static int pxp_probe(struct platform_device *pdev)
 	if (!dev)
 		return -ENOMEM;
 
+	dev->pdata = of_device_get_match_data(&pdev->dev);
+
 	dev->clk = devm_clk_get(&pdev->dev, "axi");
 	if (IS_ERR(dev->clk)) {
 		ret = PTR_ERR(dev->clk);
@@ -1804,8 +1815,12 @@ static int pxp_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct pxp_pdata pxp_imx6ull_pdata = {
+	.data_path_ctrl0 = pxp_imx6ull_data_path_ctrl0,
+};
+
 static const struct of_device_id pxp_dt_ids[] = {
-	{ .compatible = "fsl,imx6ull-pxp", .data = NULL },
+	{ .compatible = "fsl,imx6ull-pxp", .data = &pxp_imx6ull_pdata },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, pxp_dt_ids);

-- 
2.30.2
