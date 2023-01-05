Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A89D765EDC6
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 14:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233859AbjAENsY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 08:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233739AbjAENrr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 08:47:47 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66034BD6F
        for <linux-media@vger.kernel.org>; Thu,  5 Jan 2023 05:47:33 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQai-0003Qs-4c; Thu, 05 Jan 2023 14:47:32 +0100
Received: from [2a0a:edc0:0:900:1d::48] (helo=litschi)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQah-0040Le-FU; Thu, 05 Jan 2023 14:47:31 +0100
Received: from mtr by litschi with local (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQaf-000FVS-Mv; Thu, 05 Jan 2023 14:47:29 +0100
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
Subject: [PATCH 7/8] media: imx-pxp: add support for i.MX7D
Date:   Thu,  5 Jan 2023 14:47:28 +0100
Message-Id: <20230105134729.59542-8-m.tretter@pengutronix.de>
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

The i.MX7D needs a different data path configuration than the i.MX6ULL.
Configure the data path as close as possible to the data path on the
i.MX6ULL.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/nxp/imx-pxp.c | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 4e182f80a36b..04cc8df2a498 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -763,6 +763,37 @@ static u32 pxp_imx6ull_data_path_ctrl0(struct pxp_ctx *ctx)
 	return ctrl0;
 }
 
+static u32 pxp_imx7d_data_path_ctrl0(struct pxp_ctx *ctx)
+{
+	u32 ctrl0;
+
+	ctrl0 = 0;
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(3);
+	/* Select Rotation 0 */
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(3);
+	/* Select MUX11 for Rotation 0 */
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(1);
+	/* Bypass LUT */
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(1);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(3);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(3);
+	/* Select CSC 2 */
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX8_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(3);
+	/* Select Composite Alpha Blending/Color Key 0 for CSC 2 */
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(1);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(3);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(3);
+	/* Bypass Rotation 1 */
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX3_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(3);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(3);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(3);
+
+	return ctrl0;
+}
+
 static u32 pxp_data_path_ctrl0(struct pxp_ctx *ctx)
 {
 	struct pxp_dev *dev = ctx->dev;
@@ -1834,8 +1865,13 @@ static const struct pxp_pdata pxp_imx6ull_pdata = {
 	.data_path_ctrl0 = pxp_imx6ull_data_path_ctrl0,
 };
 
+static const struct pxp_pdata pxp_imx7d_pdata = {
+	.data_path_ctrl0 = pxp_imx7d_data_path_ctrl0,
+};
+
 static const struct of_device_id pxp_dt_ids[] = {
 	{ .compatible = "fsl,imx6ull-pxp", .data = &pxp_imx6ull_pdata },
+	{ .compatible = "fsl,imx7d-pxp", .data = &pxp_imx7d_pdata },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, pxp_dt_ids);
-- 
2.30.2

