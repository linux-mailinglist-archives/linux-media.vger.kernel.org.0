Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00A321F8B7B
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbgFOAAg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbgFOAAf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:35 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13AE12140;
        Mon, 15 Jun 2020 02:00:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179220;
        bh=Yd4rfCsptrlxkH3s6xkiTaLOLz62WWyaeCUXxxsywlE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ovoEcX+DCDxZPVEgeSAnim1AiO28NiiTEw/if42j7GP1sIhdHOVyFMx3N7mGA8S4y
         JlNuUjCMO1hX5xCpxZm3JBxYg3vVWAhwiArlF98gZ5kBaV3weh7vs0f0rfb5ttYQ7t
         zjlfVblceuXf/pAhsV12qo8IK/8r3/vLM6+b//aA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 023/107] media: ti-vpe: cal: Move function to avoid forward declaration
Date:   Mon, 15 Jun 2020 02:58:20 +0300
Message-Id: <20200614235944.17716-24-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the csi2_phy_config() function to avoid its forward declaration. No
functional change is included.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 98 ++++++++++++++---------------
 1 file changed, 48 insertions(+), 50 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index c5bd9cd4f105..38a7c78e425e 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -740,7 +740,54 @@ static void csi2_cio_power(struct cal_ctx *ctx, bool enable)
 			enable ? "up" : "down");
 }
 
-static void csi2_phy_config(struct cal_ctx *ctx);
+/*
+ * TCLK values are OK at their reset values
+ */
+#define TCLK_TERM	0
+#define TCLK_MISS	1
+#define TCLK_SETTLE	14
+
+static void csi2_phy_config(struct cal_ctx *ctx)
+{
+	unsigned int reg0, reg1;
+	unsigned int ths_term, ths_settle;
+	unsigned int csi2_ddrclk_khz;
+	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 =
+			&ctx->endpoint.bus.mipi_csi2;
+	u32 num_lanes = mipi_csi2->num_data_lanes;
+
+	/* DPHY timing configuration */
+	/* CSI-2 is DDR and we only count used lanes. */
+	csi2_ddrclk_khz = ctx->external_rate / 1000
+		/ (2 * num_lanes) * ctx->fmt->bpp;
+	ctx_dbg(1, ctx, "csi2_ddrclk_khz: %d\n", csi2_ddrclk_khz);
+
+	/* THS_TERM: Programmed value = floor(20 ns/DDRClk period) */
+	ths_term = 20 * csi2_ddrclk_khz / 1000000;
+	ctx_dbg(1, ctx, "ths_term: %d (0x%02x)\n", ths_term, ths_term);
+
+	/* THS_SETTLE: Programmed value = floor(105 ns/DDRClk period) + 4 */
+	ths_settle = (105 * csi2_ddrclk_khz / 1000000) + 4;
+	ctx_dbg(1, ctx, "ths_settle: %d (0x%02x)\n", ths_settle, ths_settle);
+
+	reg0 = reg_read(ctx->cc, CAL_CSI2_PHY_REG0);
+	set_field(&reg0, CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_DISABLE,
+		  CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_MASK);
+	set_field(&reg0, ths_term, CAL_CSI2_PHY_REG0_THS_TERM_MASK);
+	set_field(&reg0, ths_settle, CAL_CSI2_PHY_REG0_THS_SETTLE_MASK);
+
+	ctx_dbg(1, ctx, "CSI2_%d_REG0 = 0x%08x\n", ctx->csi2_port, reg0);
+	reg_write(ctx->cc, CAL_CSI2_PHY_REG0, reg0);
+
+	reg1 = reg_read(ctx->cc, CAL_CSI2_PHY_REG1);
+	set_field(&reg1, TCLK_TERM, CAL_CSI2_PHY_REG1_TCLK_TERM_MASK);
+	set_field(&reg1, 0xb8, CAL_CSI2_PHY_REG1_DPHY_HS_SYNC_PATTERN_MASK);
+	set_field(&reg1, TCLK_MISS, CAL_CSI2_PHY_REG1_CTRLCLK_DIV_FACTOR_MASK);
+	set_field(&reg1, TCLK_SETTLE, CAL_CSI2_PHY_REG1_TCLK_SETTLE_MASK);
+
+	ctx_dbg(1, ctx, "CSI2_%d_REG1 = 0x%08x\n", ctx->csi2_port, reg1);
+	reg_write(ctx->cc, CAL_CSI2_PHY_REG1, reg1);
+}
 
 static void csi2_phy_init(struct cal_ctx *ctx)
 {
@@ -1077,55 +1124,6 @@ static void cal_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
 	reg_write(ctx->dev, CAL_WR_DMA_ADDR(ctx->csi2_port), dmaaddr);
 }
 
-/*
- * TCLK values are OK at their reset values
- */
-#define TCLK_TERM	0
-#define TCLK_MISS	1
-#define TCLK_SETTLE	14
-
-static void csi2_phy_config(struct cal_ctx *ctx)
-{
-	unsigned int reg0, reg1;
-	unsigned int ths_term, ths_settle;
-	unsigned int csi2_ddrclk_khz;
-	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 =
-			&ctx->endpoint.bus.mipi_csi2;
-	u32 num_lanes = mipi_csi2->num_data_lanes;
-
-	/* DPHY timing configuration */
-	/* CSI-2 is DDR and we only count used lanes. */
-	csi2_ddrclk_khz = ctx->external_rate / 1000
-		/ (2 * num_lanes) * ctx->fmt->bpp;
-	ctx_dbg(1, ctx, "csi2_ddrclk_khz: %d\n", csi2_ddrclk_khz);
-
-	/* THS_TERM: Programmed value = floor(20 ns/DDRClk period) */
-	ths_term = 20 * csi2_ddrclk_khz / 1000000;
-	ctx_dbg(1, ctx, "ths_term: %d (0x%02x)\n", ths_term, ths_term);
-
-	/* THS_SETTLE: Programmed value = floor(105 ns/DDRClk period) + 4 */
-	ths_settle = (105 * csi2_ddrclk_khz / 1000000) + 4;
-	ctx_dbg(1, ctx, "ths_settle: %d (0x%02x)\n", ths_settle, ths_settle);
-
-	reg0 = reg_read(ctx->cc, CAL_CSI2_PHY_REG0);
-	set_field(&reg0, CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_DISABLE,
-		  CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_MASK);
-	set_field(&reg0, ths_term, CAL_CSI2_PHY_REG0_THS_TERM_MASK);
-	set_field(&reg0, ths_settle, CAL_CSI2_PHY_REG0_THS_SETTLE_MASK);
-
-	ctx_dbg(1, ctx, "CSI2_%d_REG0 = 0x%08x\n", ctx->csi2_port, reg0);
-	reg_write(ctx->cc, CAL_CSI2_PHY_REG0, reg0);
-
-	reg1 = reg_read(ctx->cc, CAL_CSI2_PHY_REG1);
-	set_field(&reg1, TCLK_TERM, CAL_CSI2_PHY_REG1_TCLK_TERM_MASK);
-	set_field(&reg1, 0xb8, CAL_CSI2_PHY_REG1_DPHY_HS_SYNC_PATTERN_MASK);
-	set_field(&reg1, TCLK_MISS, CAL_CSI2_PHY_REG1_CTRLCLK_DIV_FACTOR_MASK);
-	set_field(&reg1, TCLK_SETTLE, CAL_CSI2_PHY_REG1_TCLK_SETTLE_MASK);
-
-	ctx_dbg(1, ctx, "CSI2_%d_REG1 = 0x%08x\n", ctx->csi2_port, reg1);
-	reg_write(ctx->cc, CAL_CSI2_PHY_REG1, reg1);
-}
-
 static int cal_get_external_info(struct cal_ctx *ctx)
 {
 	struct v4l2_ctrl *ctrl;
-- 
Regards,

Laurent Pinchart

