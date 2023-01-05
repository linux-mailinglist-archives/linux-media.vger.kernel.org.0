Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4FD65EE6C
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 15:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233768AbjAEOKh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 09:10:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234079AbjAENt1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 08:49:27 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CECF54FCE6
        for <linux-media@vger.kernel.org>; Thu,  5 Jan 2023 05:47:41 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQah-0003Qo-Vj; Thu, 05 Jan 2023 14:47:32 +0100
Received: from [2a0a:edc0:0:900:1d::48] (helo=litschi)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQag-0040LV-QY; Thu, 05 Jan 2023 14:47:30 +0100
Received: from mtr by litschi with local (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQaf-000FVG-GW; Thu, 05 Jan 2023 14:47:29 +0100
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
Subject: [PATCH 3/8] media: imx-pxp: extract helper function to setup data path
Date:   Thu,  5 Jan 2023 14:47:24 +0100
Message-Id: <20230105134729.59542-4-m.tretter@pengutronix.de>
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

The driver must configure the data path through the Pixel Pipeline.

Currently, the driver is using a fixed setup, but once there are
different pipeline configurations, it is helpful to have a dedicated
function for determining the register value for the data path.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/nxp/imx-pxp.c | 62 +++++++++++++++++++---------
 1 file changed, 42 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 05abe40558b0..a957fee88829 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -726,6 +726,47 @@ static void pxp_setup_csc(struct pxp_ctx *ctx)
 	}
 }
 
+static u32 pxp_data_path_ctrl0(struct pxp_ctx *ctx)
+{
+	u32 ctrl0;
+
+	ctrl0 = 0;
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(1);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(1);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX8_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX3_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(0);
+	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(0);
+
+	return ctrl0;
+}
+
+static void pxp_set_data_path(struct pxp_ctx *ctx)
+{
+	struct pxp_dev *dev = ctx->dev;
+	u32 ctrl0;
+	u32 ctrl1;
+
+	ctrl0 = pxp_data_path_ctrl0(ctx);
+
+	ctrl1 = 0;
+	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(1);
+	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(1);
+
+	writel(ctrl0, dev->mmio + HW_PXP_DATA_PATH_CTRL0);
+	writel(ctrl1, dev->mmio + HW_PXP_DATA_PATH_CTRL1);
+}
+
 static int pxp_start(struct pxp_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
 		     struct vb2_v4l2_buffer *out_vb)
 {
@@ -912,26 +953,7 @@ static int pxp_start(struct pxp_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
 	/* bypass LUT */
 	writel(BM_PXP_LUT_CTRL_BYPASS, dev->mmio + HW_PXP_LUT_CTRL);
 
-	writel(BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(0)|
-	       BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(1)|
-	       BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(0)|
-	       BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(0)|
-	       BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(0)|
-	       BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(0)|
-	       BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(1)|
-	       BF_PXP_DATA_PATH_CTRL0_MUX8_SEL(0)|
-	       BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(0)|
-	       BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(0)|
-	       BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(0)|
-	       BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(0)|
-	       BF_PXP_DATA_PATH_CTRL0_MUX3_SEL(0)|
-	       BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(0)|
-	       BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(0)|
-	       BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(0),
-	       dev->mmio + HW_PXP_DATA_PATH_CTRL0);
-	writel(BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(1) |
-	       BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(1),
-	       dev->mmio + HW_PXP_DATA_PATH_CTRL1);
+	pxp_set_data_path(ctx);
 
 	writel(0xffff, dev->mmio + HW_PXP_IRQ_MASK);
 
-- 
2.30.2

