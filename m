Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D67F1F8B8C
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbgFOAA4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728139AbgFOAA4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:56 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA5851250;
        Mon, 15 Jun 2020 02:00:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179227;
        bh=iLdhR02AF4F2wb4786zlNose5kd3486+KvJa7dGoB90=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wD2opWbfQwD8k4eCOFRnJALAJRTfWE80tVrkm29Cyka/sX63rU0zE1nr3rgbxqeLM
         NLp+1pxI+nJk5jWg7juSh79uAX6o36rRWqMDbEDRegw2uKr2KgWH7VVj/ZCNTmvYMq
         //oNJN+IYB60yESpgoMIaHY088uyX+udnERq7naM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 037/107] media: ti-vpe: cal: Rename cal_ctx.csi2_port to cal_ctx.index
Date:   Mon, 15 Jun 2020 02:58:34 +0300
Message-Id: <20200614235944.17716-38-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The csi2_port field of the cal_ctx structure holds the context index,
and is independent from the CSI-2 port (even if it currently has the
same numerical value). Rename it to index to avoid the ambiguity.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 50 ++++++++++++++---------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 6f33853ecdb2..8576a4321e25 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -61,11 +61,11 @@ MODULE_PARM_DESC(debug, "activates debug info");
 	dev_err(&(cal)->pdev->dev, fmt, ##arg)
 
 #define ctx_dbg(level, ctx, fmt, arg...)	\
-	cal_dbg(level, (ctx)->cal, "ctx%u: " fmt, (ctx)->csi2_port, ##arg)
+	cal_dbg(level, (ctx)->cal, "ctx%u: " fmt, (ctx)->index, ##arg)
 #define ctx_info(ctx, fmt, arg...)	\
-	cal_info((ctx)->cal, "ctx%u: " fmt, (ctx)->csi2_port, ##arg)
+	cal_info((ctx)->cal, "ctx%u: " fmt, (ctx)->index, ##arg)
 #define ctx_err(ctx, fmt, arg...)	\
-	cal_err((ctx)->cal, "ctx%u: " fmt, (ctx)->csi2_port, ##arg)
+	cal_err((ctx)->cal, "ctx%u: " fmt, (ctx)->index, ##arg)
 
 #define phy_dbg(level, phy, fmt, arg...)	\
 	cal_dbg(level, (phy)->cal, "phy%u: " fmt, (phy)->instance, ##arg)
@@ -324,7 +324,7 @@ struct cal_ctx {
 
 	unsigned int		sequence;
 	struct vb2_queue	vb_vidq;
-	unsigned int		csi2_port;
+	unsigned int		index;
 	unsigned int		cport;
 	unsigned int		virtual_channel;
 
@@ -1000,7 +1000,7 @@ static void cal_ctx_csi2_config(struct cal_ctx *ctx)
 {
 	u32 val;
 
-	val = reg_read(ctx->cal, CAL_CSI2_CTX0(ctx->csi2_port));
+	val = reg_read(ctx->cal, CAL_CSI2_CTX0(ctx->index));
 	set_field(&val, ctx->cport, CAL_CSI2_CTX_CPORT_MASK);
 	/*
 	 * DT type: MIPI CSI-2 Specs
@@ -1017,9 +1017,9 @@ static void cal_ctx_csi2_config(struct cal_ctx *ctx)
 	set_field(&val, CAL_CSI2_CTX_ATT_PIX, CAL_CSI2_CTX_ATT_MASK);
 	set_field(&val, CAL_CSI2_CTX_PACK_MODE_LINE,
 		  CAL_CSI2_CTX_PACK_MODE_MASK);
-	reg_write(ctx->cal, CAL_CSI2_CTX0(ctx->csi2_port), val);
-	ctx_dbg(3, ctx, "CAL_CSI2_CTX0(%d) = 0x%08x\n", ctx->csi2_port,
-		reg_read(ctx->cal, CAL_CSI2_CTX0(ctx->csi2_port)));
+	reg_write(ctx->cal, CAL_CSI2_CTX0(ctx->index), val);
+	ctx_dbg(3, ctx, "CAL_CSI2_CTX0(%d) = 0x%08x\n", ctx->index,
+		reg_read(ctx->cal, CAL_CSI2_CTX0(ctx->index)));
 }
 
 static void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
@@ -1061,16 +1061,16 @@ static void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
 		break;
 	}
 
-	val = reg_read(ctx->cal, CAL_PIX_PROC(ctx->csi2_port));
+	val = reg_read(ctx->cal, CAL_PIX_PROC(ctx->index));
 	set_field(&val, extract, CAL_PIX_PROC_EXTRACT_MASK);
 	set_field(&val, CAL_PIX_PROC_DPCMD_BYPASS, CAL_PIX_PROC_DPCMD_MASK);
 	set_field(&val, CAL_PIX_PROC_DPCME_BYPASS, CAL_PIX_PROC_DPCME_MASK);
 	set_field(&val, pack, CAL_PIX_PROC_PACK_MASK);
 	set_field(&val, ctx->cport, CAL_PIX_PROC_CPORT_MASK);
 	set_field(&val, 1, CAL_PIX_PROC_EN_MASK);
-	reg_write(ctx->cal, CAL_PIX_PROC(ctx->csi2_port), val);
-	ctx_dbg(3, ctx, "CAL_PIX_PROC(%d) = 0x%08x\n", ctx->csi2_port,
-		reg_read(ctx->cal, CAL_PIX_PROC(ctx->csi2_port)));
+	reg_write(ctx->cal, CAL_PIX_PROC(ctx->index), val);
+	ctx_dbg(3, ctx, "CAL_PIX_PROC(%d) = 0x%08x\n", ctx->index,
+		reg_read(ctx->cal, CAL_PIX_PROC(ctx->index)));
 }
 
 static void cal_ctx_wr_dma_config(struct cal_ctx *ctx,
@@ -1078,7 +1078,7 @@ static void cal_ctx_wr_dma_config(struct cal_ctx *ctx,
 {
 	u32 val;
 
-	val = reg_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->csi2_port));
+	val = reg_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->index));
 	set_field(&val, ctx->cport, CAL_WR_DMA_CTRL_CPORT_MASK);
 	set_field(&val, height, CAL_WR_DMA_CTRL_YSIZE_MASK);
 	set_field(&val, CAL_WR_DMA_CTRL_DTAG_PIX_DAT,
@@ -1088,22 +1088,22 @@ static void cal_ctx_wr_dma_config(struct cal_ctx *ctx,
 	set_field(&val, CAL_WR_DMA_CTRL_PATTERN_LINEAR,
 		  CAL_WR_DMA_CTRL_PATTERN_MASK);
 	set_field(&val, 1, CAL_WR_DMA_CTRL_STALL_RD_MASK);
-	reg_write(ctx->cal, CAL_WR_DMA_CTRL(ctx->csi2_port), val);
-	ctx_dbg(3, ctx, "CAL_WR_DMA_CTRL(%d) = 0x%08x\n", ctx->csi2_port,
-		reg_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->csi2_port)));
+	reg_write(ctx->cal, CAL_WR_DMA_CTRL(ctx->index), val);
+	ctx_dbg(3, ctx, "CAL_WR_DMA_CTRL(%d) = 0x%08x\n", ctx->index,
+		reg_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->index)));
 
 	/*
 	 * width/16 not sure but giving it a whirl.
 	 * zero does not work right
 	 */
 	reg_write_field(ctx->cal,
-			CAL_WR_DMA_OFST(ctx->csi2_port),
+			CAL_WR_DMA_OFST(ctx->index),
 			(width / 16),
 			CAL_WR_DMA_OFST_MASK);
-	ctx_dbg(3, ctx, "CAL_WR_DMA_OFST(%d) = 0x%08x\n", ctx->csi2_port,
-		reg_read(ctx->cal, CAL_WR_DMA_OFST(ctx->csi2_port)));
+	ctx_dbg(3, ctx, "CAL_WR_DMA_OFST(%d) = 0x%08x\n", ctx->index,
+		reg_read(ctx->cal, CAL_WR_DMA_OFST(ctx->index)));
 
-	val = reg_read(ctx->cal, CAL_WR_DMA_XSIZE(ctx->csi2_port));
+	val = reg_read(ctx->cal, CAL_WR_DMA_XSIZE(ctx->index));
 	/* 64 bit word means no skipping */
 	set_field(&val, 0, CAL_WR_DMA_XSIZE_XSKIP_MASK);
 	/*
@@ -1112,9 +1112,9 @@ static void cal_ctx_wr_dma_config(struct cal_ctx *ctx,
 	 * is detected automagically
 	 */
 	set_field(&val, (width / 8), CAL_WR_DMA_XSIZE_MASK);
-	reg_write(ctx->cal, CAL_WR_DMA_XSIZE(ctx->csi2_port), val);
-	ctx_dbg(3, ctx, "CAL_WR_DMA_XSIZE(%d) = 0x%08x\n", ctx->csi2_port,
-		reg_read(ctx->cal, CAL_WR_DMA_XSIZE(ctx->csi2_port)));
+	reg_write(ctx->cal, CAL_WR_DMA_XSIZE(ctx->index), val);
+	ctx_dbg(3, ctx, "CAL_WR_DMA_XSIZE(%d) = 0x%08x\n", ctx->index,
+		reg_read(ctx->cal, CAL_WR_DMA_XSIZE(ctx->index)));
 
 	val = reg_read(ctx->cal, CAL_CTRL);
 	set_field(&val, CAL_CTRL_BURSTSIZE_BURST128, CAL_CTRL_BURSTSIZE_MASK);
@@ -1129,7 +1129,7 @@ static void cal_ctx_wr_dma_config(struct cal_ctx *ctx,
 
 static void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
 {
-	reg_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->csi2_port), dmaaddr);
+	reg_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->index), dmaaddr);
 }
 
 /* ------------------------------------------------------------------
@@ -2205,7 +2205,7 @@ static struct cal_ctx *cal_create_instance(struct cal_dev *cal, int inst)
 	ctx->phy = cal->phy[inst];
 
 	/* Store the instance id */
-	ctx->csi2_port = inst;
+	ctx->index = inst;
 	ctx->cport = inst;
 
 	ret = of_cal_create_instance(ctx, inst);
-- 
Regards,

Laurent Pinchart

