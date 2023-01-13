Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64ECF66936D
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 10:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240868AbjAMJ5Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 04:57:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240751AbjAMJ47 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 04:56:59 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF6526699C
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 01:54:13 -0800 (PST)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1pGGlH-0003cp-Mo; Fri, 13 Jan 2023 10:54:11 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 13 Jan 2023 10:54:09 +0100
Subject: [PATCH v2 03/16] media: imx-pxp: extract helper function to setup data path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230112-imx-pxp-v2-3-e2281da1db55@pengutronix.de>
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

The driver must configure the data path through the Pixel Pipeline.

Currently, the driver is using a fixed setup, but once there are
different pipeline configurations, it is helpful to have a dedicated
function for determining the register value for the data path.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v2: none
---
 drivers/media/platform/nxp/imx-pxp.c | 62 ++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 5b671c6e5cae..675fd00faaac 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -724,6 +724,47 @@ static void pxp_setup_csc(struct pxp_ctx *ctx)
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
@@ -910,26 +951,7 @@ static int pxp_start(struct pxp_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
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
