Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934F1215E96
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729916AbgGFSiH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729739AbgGFSiH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:07 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F1591942;
        Mon,  6 Jul 2020 20:37:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060671;
        bh=rgyAgaN8BgCH7bE74sxnjWJ+n9bsMso01bv46MIuF3I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m9ma2v2KdGi/oisuO+qVk1/OLk4o0BJ1f3rtzXrNiJg1cKEh4Omcw6bEEGWtPOXsy
         rjpMxGTn73eCX2NFFzMrBH+MRKzV40CRhQ3gsy5CEZNkQuTTCCb6/3zI+ex+xzocJ9
         B2zVpIgtdZ+5d38MJ7wN0SPS38Vcc/XbL2olwSnw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 038/108] media: ti-vpe: cal: Rename cal_ctx.csi2_port to cal_ctx.index
Date:   Mon,  6 Jul 2020 21:35:59 +0300
Message-Id: <20200706183709.12238-39-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 50 ++++++++++++++---------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index d452c3e950f0..ac23c41230fb 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -62,11 +62,11 @@ MODULE_PARM_DESC(debug, "activates debug info");
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
@@ -325,7 +325,7 @@ struct cal_ctx {
 
 	unsigned int		sequence;
 	struct vb2_queue	vb_vidq;
-	unsigned int		csi2_port;
+	unsigned int		index;
 	unsigned int		cport;
 	unsigned int		virtual_channel;
 
@@ -1001,7 +1001,7 @@ static void cal_ctx_csi2_config(struct cal_ctx *ctx)
 {
 	u32 val;
 
-	val = reg_read(ctx->cal, CAL_CSI2_CTX0(ctx->csi2_port));
+	val = reg_read(ctx->cal, CAL_CSI2_CTX0(ctx->index));
 	set_field(&val, ctx->cport, CAL_CSI2_CTX_CPORT_MASK);
 	/*
 	 * DT type: MIPI CSI-2 Specs
@@ -1018,9 +1018,9 @@ static void cal_ctx_csi2_config(struct cal_ctx *ctx)
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
@@ -1062,16 +1062,16 @@ static void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
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
@@ -1079,7 +1079,7 @@ static void cal_ctx_wr_dma_config(struct cal_ctx *ctx,
 {
 	u32 val;
 
-	val = reg_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->csi2_port));
+	val = reg_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->index));
 	set_field(&val, ctx->cport, CAL_WR_DMA_CTRL_CPORT_MASK);
 	set_field(&val, height, CAL_WR_DMA_CTRL_YSIZE_MASK);
 	set_field(&val, CAL_WR_DMA_CTRL_DTAG_PIX_DAT,
@@ -1089,22 +1089,22 @@ static void cal_ctx_wr_dma_config(struct cal_ctx *ctx,
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
@@ -1113,9 +1113,9 @@ static void cal_ctx_wr_dma_config(struct cal_ctx *ctx,
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
@@ -1130,7 +1130,7 @@ static void cal_ctx_wr_dma_config(struct cal_ctx *ctx,
 
 static void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
 {
-	reg_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->csi2_port), dmaaddr);
+	reg_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->index), dmaaddr);
 }
 
 /* ------------------------------------------------------------------
@@ -2211,7 +2211,7 @@ static struct cal_ctx *cal_create_instance(struct cal_dev *cal, int inst)
 	ctx->phy = cal->phy[inst];
 
 	/* Store the instance id */
-	ctx->csi2_port = inst;
+	ctx->index = inst;
 	ctx->cport = inst;
 
 	ret = of_cal_create_instance(ctx, inst);
-- 
Regards,

Laurent Pinchart

