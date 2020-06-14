Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 080DC1F8B69
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbgFOAAS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728035AbgFOAAS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:18 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 037D5F7F;
        Mon, 15 Jun 2020 02:00:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179212;
        bh=nWZqZrGUmNIL07aJD7gggwD7D8UvTY9SNxTAhkdnwCY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RsqaminfxS/SF3mS/XUNltIFssYEheuxpIwMmyfZnL5byVMBJKoKpdBtNntDoydZp
         aJTE9iNFpYzF7ofN6EVmL6ZZ+BbyAbWUskhioJDukFlq0eVujY964ljWIR9ncQlq41
         pUEnjmAW7J3II0c9shEyL1n2YTD2W+gqtq41jb7c=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 004/107] media: ti-vpe: cal: Index CSI-2 port starting at 0
Date:   Mon, 15 Jun 2020 02:58:01 +0300
Message-Id: <20200614235944.17716-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The datasheet numbers the CSI-2 PHYs (external to the CAL) starting from
1, but the PPI inputs to the CAL starting from 0. Update the numbering
scheme for csi2_port to match the datasheet, which also simplifies the
driver by removing the need to constantly subtract 1 from the value.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c      | 30 +++++------
 drivers/media/platform/ti-vpe/cal_regs.h | 64 ++++++++++++------------
 2 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 201ef3585a48..799c25f5aafd 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -472,7 +472,7 @@ static inline void set_field(u32 *valp, u32 field, u32 mask)
 static u32 cal_data_get_phy_max_lanes(struct cal_ctx *ctx)
 {
 	struct cal_dev *dev = ctx->dev;
-	u32 phy_id = ctx->csi2_port - 1;
+	u32 phy_id = ctx->csi2_port;
 
 	return dev->data->csi2_phy_core[phy_id].num_lanes;
 }
@@ -557,7 +557,7 @@ static struct regmap *cal_get_camerarx_regmap(struct cal_dev *dev)
 static void camerarx_phy_enable(struct cal_ctx *ctx)
 {
 	struct cal_csi2_phy *phy;
-	u32 phy_id = ctx->csi2_port - 1;
+	u32 phy_id = ctx->csi2_port;
 	u32 max_lanes;
 
 	phy = &ctx->dev->data->csi2_phy_core[phy_id];
@@ -574,7 +574,7 @@ static void camerarx_phy_enable(struct cal_ctx *ctx)
 static void camerarx_phy_disable(struct cal_ctx *ctx)
 {
 	struct cal_csi2_phy *phy;
-	u32 phy_id = ctx->csi2_port - 1;
+	u32 phy_id = ctx->csi2_port;
 
 	phy = &ctx->dev->data->csi2_phy_core[phy_id];
 	regmap_field_write(phy->fields[F_CTRLCLKEN], 0);
@@ -712,7 +712,7 @@ static void enable_irqs(struct cal_ctx *ctx)
 	set_field(&val, 1, CAL_HL_IRQ_MASK(ctx->csi2_port));
 	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(3), val);
 	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
-	reg_write(ctx->dev, CAL_CSI2_VC_IRQENABLE(1), 0xFF000000);
+	reg_write(ctx->dev, CAL_CSI2_VC_IRQENABLE(0), 0xFF000000);
 }
 
 static void disable_irqs(struct cal_ctx *ctx)
@@ -734,7 +734,7 @@ static void disable_irqs(struct cal_ctx *ctx)
 	set_field(&val, 1, CAL_HL_IRQ_MASK(ctx->csi2_port));
 	reg_write(ctx->dev, CAL_HL_IRQENABLE_CLR(3), val);
 	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
-	reg_write(ctx->dev, CAL_CSI2_VC_IRQENABLE(1), 0);
+	reg_write(ctx->dev, CAL_CSI2_VC_IRQENABLE(0), 0);
 }
 
 static void csi2_cio_power(struct cal_ctx *ctx, bool enable)
@@ -894,7 +894,7 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
 	csi2_wait_stop_state(ctx);
 
 	ctx_dbg(1, ctx, "CSI2_%d_REG1 = 0x%08x (Bit(31,28) should be set!)\n",
-		(ctx->csi2_port - 1), reg_read(ctx->cc, CAL_CSI2_PHY_REG1));
+		ctx->csi2_port, reg_read(ctx->cc, CAL_CSI2_PHY_REG1));
 }
 
 static void csi2_phy_deinit(struct cal_ctx *ctx)
@@ -1139,7 +1139,7 @@ static void csi2_phy_config(struct cal_ctx *ctx)
 	set_field(&reg0, ths_term, CAL_CSI2_PHY_REG0_THS_TERM_MASK);
 	set_field(&reg0, ths_settle, CAL_CSI2_PHY_REG0_THS_SETTLE_MASK);
 
-	ctx_dbg(1, ctx, "CSI2_%d_REG0 = 0x%08x\n", (ctx->csi2_port - 1), reg0);
+	ctx_dbg(1, ctx, "CSI2_%d_REG0 = 0x%08x\n", ctx->csi2_port, reg0);
 	reg_write(ctx->cc, CAL_CSI2_PHY_REG0, reg0);
 
 	reg1 = reg_read(ctx->cc, CAL_CSI2_PHY_REG1);
@@ -1148,7 +1148,7 @@ static void csi2_phy_config(struct cal_ctx *ctx)
 	set_field(&reg1, TCLK_MISS, CAL_CSI2_PHY_REG1_CTRLCLK_DIV_FACTOR_MASK);
 	set_field(&reg1, TCLK_SETTLE, CAL_CSI2_PHY_REG1_TCLK_SETTLE_MASK);
 
-	ctx_dbg(1, ctx, "CSI2_%d_REG1 = 0x%08x\n", (ctx->csi2_port - 1), reg1);
+	ctx_dbg(1, ctx, "CSI2_%d_REG1 = 0x%08x\n", ctx->csi2_port, reg1);
 	reg_write(ctx->cc, CAL_CSI2_PHY_REG1, reg1);
 }
 
@@ -1217,7 +1217,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		if (irqst1 & CAL_HL_IRQ_OCPO_ERR_MASK)
 			dev_err_ratelimited(&dev->pdev->dev, "OCPO ERROR\n");
 
-		for (i = 1; i <= 2; ++i) {
+		for (i = 0; i < 2; ++i) {
 			if (irqst1 & CAL_HL_IRQ_CIO_MASK(i)) {
 				u32 cio_stat = reg_read(dev,
 							CAL_CSI2_COMPLEXIO_IRQSTATUS(i));
@@ -1239,9 +1239,9 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		/* Clear Interrupt status */
 		reg_write(dev, CAL_HL_IRQSTATUS(2), irqst2);
 
-		for (i = 1; i <= 2; ++i) {
+		for (i = 0; i < 2; ++i) {
 			if (isportirqset(irqst2, i)) {
-				ctx = dev->ctx[i - 1];
+				ctx = dev->ctx[i];
 
 				spin_lock(&ctx->slock);
 				ctx->dma_act = false;
@@ -1262,9 +1262,9 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		/* Clear Interrupt status */
 		reg_write(dev, CAL_HL_IRQSTATUS(3), irqst3);
 
-		for (i = 1; i <= 2; ++i) {
+		for (i = 0; i < 2; ++i) {
 			if (isportirqset(irqst3, i)) {
-				ctx = dev->ctx[i - 1];
+				ctx = dev->ctx[i];
 				dma_q = &ctx->vidq;
 
 				spin_lock(&ctx->slock);
@@ -2221,8 +2221,8 @@ static struct cal_ctx *cal_create_instance(struct cal_dev *dev, int inst)
 	ctx->cc = dev->cc[inst];
 
 	/* Store the instance id */
-	ctx->csi2_port = inst + 1;
-	ctx->cport = inst + 1;
+	ctx->csi2_port = inst;
+	ctx->cport = inst;
 
 	ret = of_cal_create_instance(ctx, inst);
 	if (ret) {
diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
index ac54a2fe7bb6..56c8ccd0e75f 100644
--- a/drivers/media/platform/ti-vpe/cal_regs.h
+++ b/drivers/media/platform/ti-vpe/cal_regs.h
@@ -46,7 +46,7 @@
 #define CAL_HL_IRQSTATUS(m)		(0x24U + ((m-1) * 0x10U))
 #define CAL_HL_IRQENABLE_SET(m)		(0x28U + ((m-1) * 0x10U))
 #define CAL_HL_IRQENABLE_CLR(m)		(0x2cU + ((m-1) * 0x10U))
-#define CAL_PIX_PROC(m)			(0xc0U + ((m-1) * 0x4U))
+#define CAL_PIX_PROC(m)			(0xc0U + (m) * 0x4U)
 #define CAL_CTRL			0x100
 #define CAL_CTRL1			0x104
 #define CAL_LINE_NUMBER_EVT		0x108
@@ -62,34 +62,34 @@
 #define CAL_RD_DMA_INIT_ADDR		0x154
 #define CAL_RD_DMA_INIT_OFST		0x168
 #define CAL_RD_DMA_CTRL2		0x16c
-#define CAL_WR_DMA_CTRL(m)		(0x200U + ((m-1) * 0x10U))
-#define CAL_WR_DMA_ADDR(m)		(0x204U + ((m-1) * 0x10U))
-#define CAL_WR_DMA_OFST(m)		(0x208U + ((m-1) * 0x10U))
-#define CAL_WR_DMA_XSIZE(m)		(0x20cU + ((m-1) * 0x10U))
-#define CAL_CSI2_PPI_CTRL(m)		(0x300U + ((m-1) * 0x80U))
-#define CAL_CSI2_COMPLEXIO_CFG(m)	(0x304U + ((m-1) * 0x80U))
-#define CAL_CSI2_COMPLEXIO_IRQSTATUS(m)	(0x308U + ((m-1) * 0x80U))
-#define CAL_CSI2_SHORT_PACKET(m)	(0x30cU + ((m-1) * 0x80U))
-#define CAL_CSI2_COMPLEXIO_IRQENABLE(m)	(0x310U + ((m-1) * 0x80U))
-#define CAL_CSI2_TIMING(m)		(0x314U + ((m-1) * 0x80U))
-#define CAL_CSI2_VC_IRQENABLE(m)	(0x318U + ((m-1) * 0x80U))
-#define CAL_CSI2_VC_IRQSTATUS(m)	(0x328U + ((m-1) * 0x80U))
-#define CAL_CSI2_CTX0(m)		(0x330U + ((m-1) * 0x80U))
-#define CAL_CSI2_CTX1(m)		(0x334U + ((m-1) * 0x80U))
-#define CAL_CSI2_CTX2(m)		(0x338U + ((m-1) * 0x80U))
-#define CAL_CSI2_CTX3(m)		(0x33cU + ((m-1) * 0x80U))
-#define CAL_CSI2_CTX4(m)		(0x340U + ((m-1) * 0x80U))
-#define CAL_CSI2_CTX5(m)		(0x344U + ((m-1) * 0x80U))
-#define CAL_CSI2_CTX6(m)		(0x348U + ((m-1) * 0x80U))
-#define CAL_CSI2_CTX7(m)		(0x34cU + ((m-1) * 0x80U))
-#define CAL_CSI2_STATUS0(m)		(0x350U + ((m-1) * 0x80U))
-#define CAL_CSI2_STATUS1(m)		(0x354U + ((m-1) * 0x80U))
-#define CAL_CSI2_STATUS2(m)		(0x358U + ((m-1) * 0x80U))
-#define CAL_CSI2_STATUS3(m)		(0x35cU + ((m-1) * 0x80U))
-#define CAL_CSI2_STATUS4(m)		(0x360U + ((m-1) * 0x80U))
-#define CAL_CSI2_STATUS5(m)		(0x364U + ((m-1) * 0x80U))
-#define CAL_CSI2_STATUS6(m)		(0x368U + ((m-1) * 0x80U))
-#define CAL_CSI2_STATUS7(m)		(0x36cU + ((m-1) * 0x80U))
+#define CAL_WR_DMA_CTRL(m)		(0x200U + (m) * 0x10U)
+#define CAL_WR_DMA_ADDR(m)		(0x204U + (m) * 0x10U)
+#define CAL_WR_DMA_OFST(m)		(0x208U + (m) * 0x10U)
+#define CAL_WR_DMA_XSIZE(m)		(0x20cU + (m) * 0x10U)
+#define CAL_CSI2_PPI_CTRL(m)		(0x300U + (m) * 0x80U)
+#define CAL_CSI2_COMPLEXIO_CFG(m)	(0x304U + (m) * 0x80U)
+#define CAL_CSI2_COMPLEXIO_IRQSTATUS(m)	(0x308U + (m) * 0x80U)
+#define CAL_CSI2_SHORT_PACKET(m)	(0x30cU + (m) * 0x80U)
+#define CAL_CSI2_COMPLEXIO_IRQENABLE(m)	(0x310U + (m) * 0x80U)
+#define CAL_CSI2_TIMING(m)		(0x314U + (m) * 0x80U)
+#define CAL_CSI2_VC_IRQENABLE(m)	(0x318U + (m) * 0x80U)
+#define CAL_CSI2_VC_IRQSTATUS(m)	(0x328U + (m) * 0x80U)
+#define CAL_CSI2_CTX0(m)		(0x330U + (m) * 0x80U)
+#define CAL_CSI2_CTX1(m)		(0x334U + (m) * 0x80U)
+#define CAL_CSI2_CTX2(m)		(0x338U + (m) * 0x80U)
+#define CAL_CSI2_CTX3(m)		(0x33cU + (m) * 0x80U)
+#define CAL_CSI2_CTX4(m)		(0x340U + (m) * 0x80U)
+#define CAL_CSI2_CTX5(m)		(0x344U + (m) * 0x80U)
+#define CAL_CSI2_CTX6(m)		(0x348U + (m) * 0x80U)
+#define CAL_CSI2_CTX7(m)		(0x34cU + (m) * 0x80U)
+#define CAL_CSI2_STATUS0(m)		(0x350U + (m) * 0x80U)
+#define CAL_CSI2_STATUS1(m)		(0x354U + (m) * 0x80U)
+#define CAL_CSI2_STATUS2(m)		(0x358U + (m) * 0x80U)
+#define CAL_CSI2_STATUS3(m)		(0x35cU + (m) * 0x80U)
+#define CAL_CSI2_STATUS4(m)		(0x360U + (m) * 0x80U)
+#define CAL_CSI2_STATUS5(m)		(0x364U + (m) * 0x80U)
+#define CAL_CSI2_STATUS6(m)		(0x368U + (m) * 0x80U)
+#define CAL_CSI2_STATUS7(m)		(0x36cU + (m) * 0x80U)
 
 /* CAL CSI2 PHY register offsets */
 #define CAL_CSI2_PHY_REG0		0x000
@@ -141,12 +141,12 @@
 #define CAL_HL_IRQ_EOI_LINE_NUMBER_READ0		0
 #define CAL_HL_IRQ_EOI_LINE_NUMBER_EOI0			0
 
-#define CAL_HL_IRQ_MASK(m)			BIT((m) - 1)
+#define CAL_HL_IRQ_MASK(m)			BIT(m)
 
 #define CAL_HL_IRQ_OCPO_ERR_MASK		BIT(6)
 
-#define CAL_HL_IRQ_CIO_MASK(i)			BIT(16 + ((i) - 1) * 8)
-#define CAL_HL_IRQ_VC_MASK(i)			BIT(17 + ((i) - 1) * 8)
+#define CAL_HL_IRQ_CIO_MASK(i)			BIT(16 + (i) * 8)
+#define CAL_HL_IRQ_VC_MASK(i)			BIT(17 + (i) * 8)
 
 #define CAL_PIX_PROC_EN_MASK			BIT(0)
 #define CAL_PIX_PROC_EXTRACT_MASK		GENMASK(4, 1)
-- 
Regards,

Laurent Pinchart

