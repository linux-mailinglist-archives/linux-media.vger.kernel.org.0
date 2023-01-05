Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F252265EDCA
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 14:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233426AbjAENtC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 08:49:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233752AbjAENrr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 08:47:47 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B23A4D727
        for <linux-media@vger.kernel.org>; Thu,  5 Jan 2023 05:47:34 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQai-0003SL-JY; Thu, 05 Jan 2023 14:47:32 +0100
Received: from [2a0a:edc0:0:900:1d::48] (helo=litschi)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQai-0040Lk-0m; Thu, 05 Jan 2023 14:47:32 +0100
Received: from mtr by litschi with local (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQaf-000FVJ-IA; Thu, 05 Jan 2023 14:47:29 +0100
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
Subject: [PATCH 4/8] media: imx-pxp: explicitly disable unused blocks
Date:   Thu,  5 Jan 2023 14:47:25 +0100
Message-Id: <20230105134729.59542-5-m.tretter@pengutronix.de>
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Various multiplexers in the pipeline are not used with the currently
configured data path. Disable all unused multiplexers by selecting the
"no output" (3) option.

The datasheet doesn't explicitly require this, but the PXP has been seen
to hang after processing a few hundreds of frames otherwise.

As at it, add documentation for the multiplexers that are actually
relevant for the data path.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/nxp/imx-pxp.c | 30 +++++++++++++++++-----------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index a957fee88829..6ffd07cda965 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -731,22 +731,28 @@ static u32 pxp_data_path_ctrl0(struct pxp_ctx *ctx)
 	u32 ctrl0;
 
 	ctrl0 = 0;
-	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(3);
+	/* Bypass Dithering x3CH */
 	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(1);
-	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(3);
+	/* Select Rotation */
 	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(0);
+	/* Select LUT */
 	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(0);
-	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(3);
+	/* Select MUX8 for LUT */
 	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(1);
+	/* Select CSC 2 */
 	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX8_SEL(0);
-	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(0);
-	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(0);
-	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(0);
-	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(3);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(3);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(3);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(3);
+	/* Bypass Rotation 2 */
 	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX3_SEL(0);
-	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(0);
-	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(0);
-	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(3);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(3);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(3);
 
 	return ctrl0;
 }
@@ -760,8 +766,8 @@ static void pxp_set_data_path(struct pxp_ctx *ctx)
 	ctrl0 = pxp_data_path_ctrl0(ctx);
 
 	ctrl1 = 0;
-	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(1);
-	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(1);
+	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(3);
+	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(3);
 
 	writel(ctrl0, dev->mmio + HW_PXP_DATA_PATH_CTRL0);
 	writel(ctrl1, dev->mmio + HW_PXP_DATA_PATH_CTRL1);
-- 
2.30.2

