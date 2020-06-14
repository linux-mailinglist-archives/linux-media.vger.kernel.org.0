Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5226E1F8B89
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbgFOAAw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728131AbgFOAAv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:51 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7041D2149;
        Mon, 15 Jun 2020 02:00:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179224;
        bh=rgpGnLhgsQ/76q4b9NOd4oecpCg89Z7OuBDQKjHk510=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k/KmfXFYWxKmh7NHCbAMSMa1WLqhf4kgfp9/XeJiR/66A8jzSAhvYGmy68kzL1npl
         +FI7vtRCq67dmmQvlUPhWkA5SnwOLl9ksI39qC4tp4hRuoc7nhHAq6sJvFSKBYeJxz
         Ce7Cs+i9XF73s+54B6ANdAWu/CSEp1RaONpblzyM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 033/107] media: ti-vpe: cal: Create consistent naming for CAMERARX functions
Date:   Mon, 15 Jun 2020 02:58:30 +0300
Message-Id: <20200614235944.17716-34-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename all functions related to CAMERARX with a cal_camerarx_ prefix,
and pass them a cal_camerarx pointer. This performs most of the
decoupling of the CAMERARX from the context.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 243 ++++++++++++++--------------
 1 file changed, 119 insertions(+), 124 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 30323d61d8e9..73254ebf8f9b 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -467,11 +467,9 @@ static inline void set_field(u32 *valp, u32 field, u32 mask)
 	*valp = val;
 }
 
-static u32 cal_data_get_phy_max_lanes(struct cal_ctx *ctx)
+static u32 cal_camerarx_max_lanes(struct cal_camerarx *phy)
 {
-	u32 phy_id = ctx->csi2_port;
-
-	return ctx->cal->data->camerarx[phy_id].num_lanes;
+	return phy->cal->data->camerarx[phy->instance].num_lanes;
 }
 
 static u32 cal_data_get_num_csi2_phy(struct cal_dev *cal)
@@ -547,15 +545,13 @@ static struct regmap *cal_get_camerarx_regmap(struct cal_dev *cal)
 /*
  * Control Module CAMERARX block access
  */
-static void camerarx_phy_enable(struct cal_ctx *ctx)
+static void cal_camerarx_enable(struct cal_camerarx *phy)
 {
-	u32 phy_id = ctx->csi2_port;
-	struct cal_camerarx *phy = ctx->cal->phy[phy_id];
 	u32 max_lanes;
 
 	regmap_field_write(phy->fields[F_CAMMODE], 0);
 	/* Always enable all lanes at the phy control level */
-	max_lanes = (1 << cal_data_get_phy_max_lanes(ctx)) - 1;
+	max_lanes = (1 << cal_camerarx_max_lanes(phy)) - 1;
 	regmap_field_write(phy->fields[F_LANEENABLE], max_lanes);
 	/* F_CSI_MODE is not present on every architecture */
 	if (phy->fields[F_CSI_MODE])
@@ -563,19 +559,16 @@ static void camerarx_phy_enable(struct cal_ctx *ctx)
 	regmap_field_write(phy->fields[F_CTRLCLKEN], 1);
 }
 
-static void camerarx_phy_disable(struct cal_ctx *ctx)
+static void cal_camerarx_disable(struct cal_camerarx *phy)
 {
-	u32 phy_id = ctx->csi2_port;
-	struct cal_camerarx *phy = ctx->cal->phy[phy_id];
-
 	regmap_field_write(phy->fields[F_CTRLCLKEN], 0);
 }
 
 /*
  * Camera Instance access block
  */
-static struct cal_camerarx *cc_create(struct cal_dev *cal,
-				      unsigned int instance)
+static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
+						unsigned int instance)
 {
 	struct platform_device *pdev = cal->pdev;
 	struct cal_camerarx *phy;
@@ -645,14 +638,14 @@ static void cal_get_hwinfo(struct cal_dev *cal)
  *		Core 0:  0x4845 B828 = 0x0000 0040
  *		Core 1:  0x4845 B928 = 0x0000 0040
  */
-static void i913_errata(struct cal_dev *cal, unsigned int port)
+static void cal_camerarx_i913_errata(struct cal_camerarx *phy)
 {
-	u32 reg10 = reg_read(cal->phy[port], CAL_CSI2_PHY_REG10);
+	u32 reg10 = reg_read(phy, CAL_CSI2_PHY_REG10);
 
 	set_field(&reg10, 1, CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK);
 
-	cal_dbg(1, cal, "CSI2_%d_REG10 = 0x%08x\n", port, reg10);
-	reg_write(cal->phy[port], CAL_CSI2_PHY_REG10, reg10);
+	phy_dbg(1, phy, "CSI2_%d_REG10 = 0x%08x\n", phy->instance, reg10);
+	reg_write(phy, CAL_CSI2_PHY_REG10, reg10);
 }
 
 static void cal_quickdump_regs(struct cal_dev *cal)
@@ -684,7 +677,7 @@ static void cal_quickdump_regs(struct cal_dev *cal)
 /*
  * Enable the expected IRQ sources
  */
-static void enable_irqs(struct cal_ctx *ctx)
+static void cal_camerarx_enable_irqs(struct cal_camerarx *phy)
 {
 	u32 val;
 
@@ -695,49 +688,49 @@ static void enable_irqs(struct cal_ctx *ctx)
 		CAL_CSI2_COMPLEXIO_IRQ_ECC_NO_CORRECTION_MASK;
 
 	/* Enable CIO error irqs */
-	reg_write(ctx->cal, CAL_HL_IRQENABLE_SET(0),
-		  CAL_HL_IRQ_CIO_MASK(ctx->csi2_port));
-	reg_write(ctx->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(ctx->csi2_port),
+	reg_write(phy->cal, CAL_HL_IRQENABLE_SET(0),
+		  CAL_HL_IRQ_CIO_MASK(phy->instance));
+	reg_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance),
 		  cio_err_mask);
 
 	/* Always enable OCPO error */
-	reg_write(ctx->cal, CAL_HL_IRQENABLE_SET(0), CAL_HL_IRQ_OCPO_ERR_MASK);
+	reg_write(phy->cal, CAL_HL_IRQENABLE_SET(0), CAL_HL_IRQ_OCPO_ERR_MASK);
 
 	/* Enable IRQ_WDMA_END 0/1 */
 	val = 0;
-	set_field(&val, 1, CAL_HL_IRQ_MASK(ctx->csi2_port));
-	reg_write(ctx->cal, CAL_HL_IRQENABLE_SET(1), val);
+	set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
+	reg_write(phy->cal, CAL_HL_IRQENABLE_SET(1), val);
 	/* Enable IRQ_WDMA_START 0/1 */
 	val = 0;
-	set_field(&val, 1, CAL_HL_IRQ_MASK(ctx->csi2_port));
-	reg_write(ctx->cal, CAL_HL_IRQENABLE_SET(2), val);
+	set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
+	reg_write(phy->cal, CAL_HL_IRQENABLE_SET(2), val);
 	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
-	reg_write(ctx->cal, CAL_CSI2_VC_IRQENABLE(0), 0xFF000000);
+	reg_write(phy->cal, CAL_CSI2_VC_IRQENABLE(0), 0xFF000000);
 }
 
-static void disable_irqs(struct cal_ctx *ctx)
+static void cal_camerarx_disable_irqs(struct cal_camerarx *phy)
 {
 	u32 val;
 
 	/* Disable CIO error irqs */
-	reg_write(ctx->cal, CAL_HL_IRQENABLE_CLR(0),
-		  CAL_HL_IRQ_CIO_MASK(ctx->csi2_port));
-	reg_write(ctx->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(ctx->csi2_port),
+	reg_write(phy->cal, CAL_HL_IRQENABLE_CLR(0),
+		  CAL_HL_IRQ_CIO_MASK(phy->instance));
+	reg_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance),
 		  0);
 
 	/* Disable IRQ_WDMA_END 0/1 */
 	val = 0;
-	set_field(&val, 1, CAL_HL_IRQ_MASK(ctx->csi2_port));
-	reg_write(ctx->cal, CAL_HL_IRQENABLE_CLR(1), val);
+	set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
+	reg_write(phy->cal, CAL_HL_IRQENABLE_CLR(1), val);
 	/* Disable IRQ_WDMA_START 0/1 */
 	val = 0;
-	set_field(&val, 1, CAL_HL_IRQ_MASK(ctx->csi2_port));
-	reg_write(ctx->cal, CAL_HL_IRQENABLE_CLR(2), val);
+	set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
+	reg_write(phy->cal, CAL_HL_IRQENABLE_CLR(2), val);
 	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
-	reg_write(ctx->cal, CAL_CSI2_VC_IRQENABLE(0), 0);
+	reg_write(phy->cal, CAL_CSI2_VC_IRQENABLE(0), 0);
 }
 
-static void csi2_cio_power(struct cal_ctx *ctx, bool enable)
+static void cal_camerarx_power(struct cal_camerarx *phy, bool enable)
 {
 	u32 target_state;
 	unsigned int i;
@@ -745,14 +738,14 @@ static void csi2_cio_power(struct cal_ctx *ctx, bool enable)
 	target_state = enable ? CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON :
 		       CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF;
 
-	reg_write_field(ctx->cal, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+	reg_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
 			target_state, CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
 
 	for (i = 0; i < 10; i++) {
 		u32 current_state;
 
-		current_state = reg_read_field(ctx->cal,
-					       CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+		current_state = reg_read_field(phy->cal,
+					       CAL_CSI2_COMPLEXIO_CFG(phy->instance),
 					       CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_MASK);
 
 		if (current_state == target_state)
@@ -762,7 +755,7 @@ static void csi2_cio_power(struct cal_ctx *ctx, bool enable)
 	}
 
 	if (i == 10)
-		ctx_err(ctx, "Failed to power %s complexio\n",
+		phy_err(phy, "Failed to power %s complexio\n",
 			enable ? "up" : "down");
 }
 
@@ -773,49 +766,51 @@ static void csi2_cio_power(struct cal_ctx *ctx, bool enable)
 #define TCLK_MISS	1
 #define TCLK_SETTLE	14
 
-static void csi2_phy_config(struct cal_ctx *ctx)
+static void cal_camerarx_config(struct cal_camerarx *phy,
+				const struct cal_fmt *fmt)
 {
 	unsigned int reg0, reg1;
 	unsigned int ths_term, ths_settle;
 	unsigned int csi2_ddrclk_khz;
 	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 =
-			&ctx->phy->endpoint.bus.mipi_csi2;
+			&phy->endpoint.bus.mipi_csi2;
 	u32 num_lanes = mipi_csi2->num_data_lanes;
 
 	/* DPHY timing configuration */
 	/* CSI-2 is DDR and we only count used lanes. */
-	csi2_ddrclk_khz = ctx->phy->external_rate / 1000
-		/ (2 * num_lanes) * ctx->fmt->bpp;
-	ctx_dbg(1, ctx, "csi2_ddrclk_khz: %d\n", csi2_ddrclk_khz);
+	csi2_ddrclk_khz = phy->external_rate / 1000
+		/ (2 * num_lanes) * fmt->bpp;
+	phy_dbg(1, phy, "csi2_ddrclk_khz: %d\n", csi2_ddrclk_khz);
 
 	/* THS_TERM: Programmed value = floor(20 ns/DDRClk period) */
 	ths_term = 20 * csi2_ddrclk_khz / 1000000;
-	ctx_dbg(1, ctx, "ths_term: %d (0x%02x)\n", ths_term, ths_term);
+	phy_dbg(1, phy, "ths_term: %d (0x%02x)\n", ths_term, ths_term);
 
 	/* THS_SETTLE: Programmed value = floor(105 ns/DDRClk period) + 4 */
 	ths_settle = (105 * csi2_ddrclk_khz / 1000000) + 4;
-	ctx_dbg(1, ctx, "ths_settle: %d (0x%02x)\n", ths_settle, ths_settle);
+	phy_dbg(1, phy, "ths_settle: %d (0x%02x)\n", ths_settle, ths_settle);
 
-	reg0 = reg_read(ctx->phy, CAL_CSI2_PHY_REG0);
+	reg0 = reg_read(phy, CAL_CSI2_PHY_REG0);
 	set_field(&reg0, CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_DISABLE,
 		  CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_MASK);
 	set_field(&reg0, ths_term, CAL_CSI2_PHY_REG0_THS_TERM_MASK);
 	set_field(&reg0, ths_settle, CAL_CSI2_PHY_REG0_THS_SETTLE_MASK);
 
-	ctx_dbg(1, ctx, "CSI2_%d_REG0 = 0x%08x\n", ctx->csi2_port, reg0);
-	reg_write(ctx->phy, CAL_CSI2_PHY_REG0, reg0);
+	phy_dbg(1, phy, "CSI2_%d_REG0 = 0x%08x\n", phy->instance, reg0);
+	reg_write(phy, CAL_CSI2_PHY_REG0, reg0);
 
-	reg1 = reg_read(ctx->phy, CAL_CSI2_PHY_REG1);
+	reg1 = reg_read(phy, CAL_CSI2_PHY_REG1);
 	set_field(&reg1, TCLK_TERM, CAL_CSI2_PHY_REG1_TCLK_TERM_MASK);
 	set_field(&reg1, 0xb8, CAL_CSI2_PHY_REG1_DPHY_HS_SYNC_PATTERN_MASK);
 	set_field(&reg1, TCLK_MISS, CAL_CSI2_PHY_REG1_CTRLCLK_DIV_FACTOR_MASK);
 	set_field(&reg1, TCLK_SETTLE, CAL_CSI2_PHY_REG1_TCLK_SETTLE_MASK);
 
-	ctx_dbg(1, ctx, "CSI2_%d_REG1 = 0x%08x\n", ctx->csi2_port, reg1);
-	reg_write(ctx->phy, CAL_CSI2_PHY_REG1, reg1);
+	phy_dbg(1, phy, "CSI2_%d_REG1 = 0x%08x\n", phy->instance, reg1);
+	reg_write(phy, CAL_CSI2_PHY_REG1, reg1);
 }
 
-static void csi2_phy_init(struct cal_ctx *ctx)
+static void cal_camerarx_init(struct cal_camerarx *phy,
+			      const struct cal_fmt *fmt)
 {
 	u32 val;
 	u32 sscounter;
@@ -838,21 +833,21 @@ static void csi2_phy_init(struct cal_ctx *ctx)
 	 */
 
 	/* 1. Configure D-PHY mode and enable required lanes */
-	camerarx_phy_enable(ctx);
+	cal_camerarx_enable(phy);
 
 	/* 2. Reset complex IO - Do not wait for reset completion */
-	reg_write_field(ctx->cal, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+	reg_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
 			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_OPERATIONAL,
 			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
-	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x De-assert Complex IO Reset\n",
-		ctx->csi2_port,
-		reg_read(ctx->cal, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)));
+	phy_dbg(3, phy, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x De-assert Complex IO Reset\n",
+		phy->instance,
+		reg_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance)));
 
 	/* Dummy read to allow SCP reset to complete */
-	reg_read(ctx->phy, CAL_CSI2_PHY_REG0);
+	reg_read(phy, CAL_CSI2_PHY_REG0);
 
 	/* 3.A. Program Phy Timing Parameters */
-	csi2_phy_config(ctx);
+	cal_camerarx_config(phy, fmt);
 
 	/* 3.B. Program Stop States */
 	/*
@@ -863,67 +858,67 @@ static void csi2_phy_init(struct cal_ctx *ctx)
 	 * Stop-state-timeout must be more than 100us as per CSI2 spec, so we
 	 * calculate a timeout that's 100us (rounding up).
 	 */
-	sscounter = DIV_ROUND_UP(clk_get_rate(ctx->cal->fclk), 10000 *  16 * 4);
+	sscounter = DIV_ROUND_UP(clk_get_rate(phy->cal->fclk), 10000 *  16 * 4);
 
-	val = reg_read(ctx->cal, CAL_CSI2_TIMING(ctx->csi2_port));
+	val = reg_read(phy->cal, CAL_CSI2_TIMING(phy->instance));
 	set_field(&val, 1, CAL_CSI2_TIMING_STOP_STATE_X16_IO1_MASK);
 	set_field(&val, 1, CAL_CSI2_TIMING_STOP_STATE_X4_IO1_MASK);
 	set_field(&val, sscounter, CAL_CSI2_TIMING_STOP_STATE_COUNTER_IO1_MASK);
-	reg_write(ctx->cal, CAL_CSI2_TIMING(ctx->csi2_port), val);
-	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Stop States\n",
-		ctx->csi2_port,
-		reg_read(ctx->cal, CAL_CSI2_TIMING(ctx->csi2_port)));
+	reg_write(phy->cal, CAL_CSI2_TIMING(phy->instance), val);
+	phy_dbg(3, phy, "CAL_CSI2_TIMING(%d) = 0x%08x Stop States\n",
+		phy->instance,
+		reg_read(phy->cal, CAL_CSI2_TIMING(phy->instance)));
 
 	/* 4. Force FORCERXMODE */
-	reg_write_field(ctx->cal, CAL_CSI2_TIMING(ctx->csi2_port),
+	reg_write_field(phy->cal, CAL_CSI2_TIMING(phy->instance),
 			1, CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
-	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Force RXMODE\n",
-		ctx->csi2_port,
-		reg_read(ctx->cal, CAL_CSI2_TIMING(ctx->csi2_port)));
+	phy_dbg(3, phy, "CAL_CSI2_TIMING(%d) = 0x%08x Force RXMODE\n",
+		phy->instance,
+		reg_read(phy->cal, CAL_CSI2_TIMING(phy->instance)));
 
 	/* E. Power up the PHY using the complex IO */
-	csi2_cio_power(ctx, true);
+	cal_camerarx_power(phy, true);
 }
 
-static void csi2_wait_complexio_reset(struct cal_ctx *ctx)
+static void cal_camerarx_wait_reset(struct cal_camerarx *phy)
 {
 	unsigned long timeout;
 
 	timeout = jiffies + msecs_to_jiffies(750);
 	while (time_before(jiffies, timeout)) {
-		if (reg_read_field(ctx->cal,
-				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+		if (reg_read_field(phy->cal,
+				   CAL_CSI2_COMPLEXIO_CFG(phy->instance),
 				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
 		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
 			break;
 		usleep_range(500, 5000);
 	}
 
-	if (reg_read_field(ctx->cal, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+	if (reg_read_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
 			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) !=
 			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
-		ctx_err(ctx, "Timeout waiting for Complex IO reset done\n");
+		phy_err(phy, "Timeout waiting for Complex IO reset done\n");
 }
 
-static void csi2_wait_stop_state(struct cal_ctx *ctx)
+static void cal_camerarx_wait_stop_state(struct cal_camerarx *phy)
 {
 	unsigned long timeout;
 
 	timeout = jiffies + msecs_to_jiffies(750);
 	while (time_before(jiffies, timeout)) {
-		if (reg_read_field(ctx->cal,
-				   CAL_CSI2_TIMING(ctx->csi2_port),
+		if (reg_read_field(phy->cal,
+				   CAL_CSI2_TIMING(phy->instance),
 				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) == 0)
 			break;
 		usleep_range(500, 5000);
 	}
 
-	if (reg_read_field(ctx->cal, CAL_CSI2_TIMING(ctx->csi2_port),
+	if (reg_read_field(phy->cal, CAL_CSI2_TIMING(phy->instance),
 			   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) != 0)
-		ctx_err(ctx, "Timeout waiting for stop state\n");
+		phy_err(phy, "Timeout waiting for stop state\n");
 }
 
-static void csi2_wait_for_phy(struct cal_ctx *ctx)
+static void cal_camerarx_wait_ready(struct cal_camerarx *phy)
 {
 	/* Steps
 	 *  2. Wait for completion of reset
@@ -935,51 +930,51 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
 	 */
 
 	/* 2. Wait for reset completion */
-	csi2_wait_complexio_reset(ctx);
+	cal_camerarx_wait_reset(phy);
 
 	/* 4. G. Wait for all enabled lane to reach stop state */
-	csi2_wait_stop_state(ctx);
+	cal_camerarx_wait_stop_state(phy);
 
-	ctx_dbg(1, ctx, "CSI2_%d_REG1 = 0x%08x (Bit(31,28) should be set!)\n",
-		ctx->csi2_port, reg_read(ctx->phy, CAL_CSI2_PHY_REG1));
+	phy_dbg(1, phy, "CSI2_%d_REG1 = 0x%08x (Bit(31,28) should be set!)\n",
+		phy->instance, reg_read(phy, CAL_CSI2_PHY_REG1));
 }
 
-static void csi2_phy_deinit(struct cal_ctx *ctx)
+static void cal_camerarx_deinit(struct cal_camerarx *phy)
 {
 	unsigned int i;
 
-	csi2_cio_power(ctx, false);
+	cal_camerarx_power(phy, false);
 
 	/* Assert Comple IO Reset */
-	reg_write_field(ctx->cal, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+	reg_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
 			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL,
 			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
 
 	/* Wait for power down completion */
 	for (i = 0; i < 10; i++) {
-		if (reg_read_field(ctx->cal,
-				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+		if (reg_read_field(phy->cal,
+				   CAL_CSI2_COMPLEXIO_CFG(phy->instance),
 				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
 		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETONGOING)
 			break;
 		usleep_range(1000, 1100);
 	}
-	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO in Reset (%d) %s\n",
-		ctx->csi2_port,
-		reg_read(ctx->cal, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)), i,
+	phy_dbg(3, phy, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO in Reset (%d) %s\n",
+		phy->instance,
+		reg_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance)), i,
 		(i >= 10) ? "(timeout)" : "");
 
 	/* Disable the phy */
-	camerarx_phy_disable(ctx);
+	cal_camerarx_disable(phy);
 }
 
-static void csi2_lane_config(struct cal_ctx *ctx)
+static void cal_camerarx_lane_config(struct cal_camerarx *phy)
 {
-	u32 val = reg_read(ctx->cal, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port));
+	u32 val = reg_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance));
 	u32 lane_mask = CAL_CSI2_COMPLEXIO_CFG_CLOCK_POSITION_MASK;
 	u32 polarity_mask = CAL_CSI2_COMPLEXIO_CFG_CLOCK_POL_MASK;
 	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 =
-		&ctx->phy->endpoint.bus.mipi_csi2;
+		&phy->endpoint.bus.mipi_csi2;
 	int lane;
 
 	set_field(&val, mipi_csi2->clock_lane + 1, lane_mask);
@@ -996,21 +991,21 @@ static void csi2_lane_config(struct cal_ctx *ctx)
 			  polarity_mask);
 	}
 
-	reg_write(ctx->cal, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port), val);
-	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x\n",
-		ctx->csi2_port, val);
+	reg_write(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance), val);
+	phy_dbg(3, phy, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x\n",
+		phy->instance, val);
 }
 
-static void csi2_ppi_enable(struct cal_ctx *ctx)
+static void cal_camerarx_ppi_enable(struct cal_camerarx *phy)
 {
-	reg_write(ctx->cal, CAL_CSI2_PPI_CTRL(ctx->csi2_port), BIT(3));
-	reg_write_field(ctx->cal, CAL_CSI2_PPI_CTRL(ctx->csi2_port),
+	reg_write(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance), BIT(3));
+	reg_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
 			1, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
 }
 
-static void csi2_ppi_disable(struct cal_ctx *ctx)
+static void cal_camerarx_ppi_disable(struct cal_camerarx *phy)
 {
-	reg_write_field(ctx->cal, CAL_CSI2_PPI_CTRL(ctx->csi2_port),
+	reg_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
 			0, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
 }
 
@@ -1150,7 +1145,7 @@ static void cal_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
 	reg_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->csi2_port), dmaaddr);
 }
 
-static int cal_get_external_info(struct cal_camerarx *phy)
+static int cal_camerarx_get_external_info(struct cal_camerarx *phy)
 {
 	struct v4l2_ctrl *ctrl;
 
@@ -1672,7 +1667,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	addr = vb2_dma_contig_plane_dma_addr(&ctx->cur_frm->vb.vb2_buf, 0);
 	ctx->sequence = 0;
 
-	ret = cal_get_external_info(ctx->phy);
+	ret = cal_camerarx_get_external_info(ctx->phy);
 	if (ret < 0)
 		goto err;
 
@@ -1688,10 +1683,10 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	pix_proc_config(ctx);
 	cal_wr_dma_config(ctx, ctx->v_fmt.fmt.pix.bytesperline,
 			  ctx->v_fmt.fmt.pix.height);
-	csi2_lane_config(ctx);
+	cal_camerarx_lane_config(ctx->phy);
 
-	enable_irqs(ctx);
-	csi2_phy_init(ctx);
+	cal_camerarx_enable_irqs(ctx->phy);
+	cal_camerarx_init(ctx->phy, ctx->fmt);
 
 	ret = v4l2_subdev_call(ctx->phy->sensor, video, s_stream, 1);
 	if (ret) {
@@ -1701,9 +1696,9 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto err;
 	}
 
-	csi2_wait_for_phy(ctx);
+	cal_camerarx_wait_ready(ctx->phy);
 	cal_wr_dma_addr(ctx, addr);
-	csi2_ppi_enable(ctx);
+	cal_camerarx_ppi_enable(ctx->phy);
 
 	if (debug >= 4)
 		cal_quickdump_regs(ctx->cal);
@@ -1733,7 +1728,7 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	int ret;
 	bool dma_act;
 
-	csi2_ppi_disable(ctx);
+	cal_camerarx_ppi_disable(ctx->phy);
 
 	/* wait for stream and dma to finish */
 	dma_act = true;
@@ -1749,8 +1744,8 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	if (dma_act)
 		ctx_err(ctx, "failed to disable dma cleanly\n");
 
-	disable_irqs(ctx);
-	csi2_phy_deinit(ctx);
+	cal_camerarx_disable_irqs(ctx->phy);
+	cal_camerarx_deinit(ctx->phy);
 
 	if (v4l2_subdev_call(ctx->phy->sensor, video, s_stream, 0))
 		ctx_err(ctx, "stream off failed in subdev\n");
@@ -2324,12 +2319,12 @@ static int cal_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, cal);
 
-	cal->phy[0] = cc_create(cal, 0);
+	cal->phy[0] = cal_camerarx_create(cal, 0);
 	if (IS_ERR(cal->phy[0]))
 		return PTR_ERR(cal->phy[0]);
 
 	if (cal_data_get_num_csi2_phy(cal) > 1) {
-		cal->phy[1] = cc_create(cal, 1);
+		cal->phy[1] = cal_camerarx_create(cal, 1);
 		if (IS_ERR(cal->phy[1]))
 			return PTR_ERR(cal->phy[1]);
 	} else {
@@ -2394,7 +2389,7 @@ static int cal_remove(struct platform_device *pdev)
 		if (ctx) {
 			ctx_dbg(1, ctx, "unregistering %s\n",
 				video_device_node_name(&ctx->vdev));
-			camerarx_phy_disable(ctx);
+			cal_camerarx_disable(ctx->phy);
 			v4l2_async_notifier_unregister(&ctx->notifier);
 			v4l2_async_notifier_cleanup(&ctx->notifier);
 			v4l2_ctrl_handler_free(&ctx->ctrl_handler);
@@ -2420,8 +2415,8 @@ static int cal_runtime_resume(struct device *dev)
 		 * Apply errata on both port everytime we (re-)enable
 		 * the clock
 		 */
-		i913_errata(cal, 0);
-		i913_errata(cal, 1);
+		cal_camerarx_i913_errata(cal->phy[0]);
+		cal_camerarx_i913_errata(cal->phy[1]);
 	}
 
 	return 0;
-- 
Regards,

Laurent Pinchart

