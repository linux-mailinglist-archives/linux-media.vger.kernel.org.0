Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9780765EDD6
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 14:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233789AbjAENud (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 08:50:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234323AbjAENts (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 08:49:48 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D12125BA03
        for <linux-media@vger.kernel.org>; Thu,  5 Jan 2023 05:47:58 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQai-0003Qq-03; Thu, 05 Jan 2023 14:47:32 +0100
Received: from [2a0a:edc0:0:900:1d::48] (helo=litschi)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQah-0040Lb-5q; Thu, 05 Jan 2023 14:47:31 +0100
Received: from mtr by litschi with local (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQaf-000FVP-LQ; Thu, 05 Jan 2023 14:47:29 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 6/8] media: imx-pxp: make data_path_ctrl0 platform dependent
Date:   Thu,  5 Jan 2023 14:47:27 +0100
Message-Id: <20230105134729.59542-7-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230105134729.59542-1-m.tretter@pengutronix.de>
References: <20230105134729.59542-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
 drivers/media/platform/nxp/imx-pxp.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 1d649b9cadad..4e182f80a36b 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -19,6 +19,7 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 
@@ -191,6 +192,11 @@ static struct pxp_fmt *find_format(struct v4l2_format *f)
 	return &formats[k];
 }
 
+struct pxp_ctx;
+struct pxp_pdata {
+	u32 (*data_path_ctrl0)(struct pxp_ctx *ctx);
+};
+
 struct pxp_dev {
 	struct v4l2_device	v4l2_dev;
 	struct video_device	vfd;
@@ -199,6 +205,7 @@ struct pxp_dev {
 	void __iomem		*mmio;
 
 	u32			hw_version;
+	const struct pxp_pdata	*pdata;
 
 	atomic_t		num_inst;
 	struct mutex		dev_mutex;
@@ -726,7 +733,7 @@ static void pxp_setup_csc(struct pxp_ctx *ctx)
 	}
 }
 
-static u32 pxp_data_path_ctrl0(struct pxp_ctx *ctx)
+static u32 pxp_imx6ull_data_path_ctrl0(struct pxp_ctx *ctx)
 {
 	u32 ctrl0;
 
@@ -756,6 +763,16 @@ static u32 pxp_data_path_ctrl0(struct pxp_ctx *ctx)
 	return ctrl0;
 }
 
+static u32 pxp_data_path_ctrl0(struct pxp_ctx *ctx)
+{
+	struct pxp_dev *dev = ctx->dev;
+
+	if (dev->pdata && dev->pdata->data_path_ctrl0)
+		return dev->pdata->data_path_ctrl0(ctx);
+
+	return pxp_imx6ull_data_path_ctrl0(ctx);
+}
+
 static void pxp_set_data_path(struct pxp_ctx *ctx)
 {
 	struct pxp_dev *dev = ctx->dev;
@@ -1711,6 +1728,8 @@ static int pxp_probe(struct platform_device *pdev)
 	if (!dev)
 		return -ENOMEM;
 
+	dev->pdata = of_device_get_match_data(&pdev->dev);
+
 	dev->clk = devm_clk_get(&pdev->dev, "axi");
 	if (IS_ERR(dev->clk)) {
 		ret = PTR_ERR(dev->clk);
@@ -1811,8 +1830,12 @@ static int pxp_remove(struct platform_device *pdev)
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

