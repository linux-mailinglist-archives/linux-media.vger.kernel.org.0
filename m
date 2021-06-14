Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9C83A65BA
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236031AbhFNLmD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236606AbhFNLjU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:39:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E02C0610CB
        for <linux-media@vger.kernel.org>; Mon, 14 Jun 2021 04:32:07 -0700 (PDT)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B91D5E91;
        Mon, 14 Jun 2021 13:24:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669846;
        bh=bDjz4AckSzjvDbOZE+NR0ay3JdkOn+EJ5zXKHZ7gHLM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RGncdL3dvES8XTLpbsZqJ0HJtsBNhGNRVnQE8TvG7BfgNFg6DI/0U+j4LHDmQVUFe
         QNYMMiT8oxisqFJxCrH5wui8RmXIkFHGaLNH/iMRyKYnPJ74r9h1k5E/X9+Tjzx6JP
         do7boeGV1hYOgzt2nFjwpXQNinsNnELsAQLFmhxc=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 11/35] media: ti-vpe: cal: rename cal_ctx->index to dma_ctx
Date:   Mon, 14 Jun 2021 14:23:21 +0300
Message-Id: <20210614112345.2032435-12-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename cal_ctx->index to dma_ctx to clarify that the field refers to the
DMA context number.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-video.c |  4 +--
 drivers/media/platform/ti-vpe/cal.c       | 38 +++++++++++------------
 drivers/media/platform/ti-vpe/cal.h       |  8 ++---
 3 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index f17524579102..cdbfdca8570f 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -899,7 +899,7 @@ int cal_ctx_v4l2_register(struct cal_ctx *ctx)
 				    MEDIA_LNK_FL_ENABLED);
 	if (ret) {
 		ctx_err(ctx, "Failed to create media link for context %u\n",
-			ctx->index);
+			ctx->dma_ctx);
 		video_unregister_device(vfd);
 		return ret;
 	}
@@ -951,7 +951,7 @@ int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 			 | (cal_mc_api ? V4L2_CAP_IO_MC : 0);
 	vfd->v4l2_dev = &ctx->cal->v4l2_dev;
 	vfd->queue = q;
-	snprintf(vfd->name, sizeof(vfd->name), "CAL output %u", ctx->index);
+	snprintf(vfd->name, sizeof(vfd->name), "CAL output %u", ctx->dma_ctx);
 	vfd->release = video_device_release_empty;
 	vfd->ioctl_ops = cal_mc_api ? &cal_ioctl_mc_ops : &cal_ioctl_video_ops;
 	vfd->lock = &ctx->mutex;
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 3e3bd3dbe444..22aa266ffdc6 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -372,7 +372,7 @@ static void cal_ctx_wr_dma_config(struct cal_ctx *ctx)
 	unsigned int stride = ctx->v_fmt.fmt.pix.bytesperline;
 	u32 val;
 
-	val = cal_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->index));
+	val = cal_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->dma_ctx));
 	cal_set_field(&val, ctx->cport, CAL_WR_DMA_CTRL_CPORT_MASK);
 	cal_set_field(&val, ctx->v_fmt.fmt.pix.height,
 		      CAL_WR_DMA_CTRL_YSIZE_MASK);
@@ -383,16 +383,16 @@ static void cal_ctx_wr_dma_config(struct cal_ctx *ctx)
 	cal_set_field(&val, CAL_WR_DMA_CTRL_PATTERN_LINEAR,
 		      CAL_WR_DMA_CTRL_PATTERN_MASK);
 	cal_set_field(&val, 1, CAL_WR_DMA_CTRL_STALL_RD_MASK);
-	cal_write(ctx->cal, CAL_WR_DMA_CTRL(ctx->index), val);
-	ctx_dbg(3, ctx, "CAL_WR_DMA_CTRL(%d) = 0x%08x\n", ctx->index,
-		cal_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->index)));
+	cal_write(ctx->cal, CAL_WR_DMA_CTRL(ctx->dma_ctx), val);
+	ctx_dbg(3, ctx, "CAL_WR_DMA_CTRL(%d) = 0x%08x\n", ctx->dma_ctx,
+		cal_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->dma_ctx)));
 
-	cal_write_field(ctx->cal, CAL_WR_DMA_OFST(ctx->index),
+	cal_write_field(ctx->cal, CAL_WR_DMA_OFST(ctx->dma_ctx),
 			stride / 16, CAL_WR_DMA_OFST_MASK);
-	ctx_dbg(3, ctx, "CAL_WR_DMA_OFST(%d) = 0x%08x\n", ctx->index,
-		cal_read(ctx->cal, CAL_WR_DMA_OFST(ctx->index)));
+	ctx_dbg(3, ctx, "CAL_WR_DMA_OFST(%d) = 0x%08x\n", ctx->dma_ctx,
+		cal_read(ctx->cal, CAL_WR_DMA_OFST(ctx->dma_ctx)));
 
-	val = cal_read(ctx->cal, CAL_WR_DMA_XSIZE(ctx->index));
+	val = cal_read(ctx->cal, CAL_WR_DMA_XSIZE(ctx->dma_ctx));
 	/* 64 bit word means no skipping */
 	cal_set_field(&val, 0, CAL_WR_DMA_XSIZE_XSKIP_MASK);
 	/*
@@ -401,23 +401,23 @@ static void cal_ctx_wr_dma_config(struct cal_ctx *ctx)
 	 * written per line.
 	 */
 	cal_set_field(&val, stride / 8, CAL_WR_DMA_XSIZE_MASK);
-	cal_write(ctx->cal, CAL_WR_DMA_XSIZE(ctx->index), val);
-	ctx_dbg(3, ctx, "CAL_WR_DMA_XSIZE(%d) = 0x%08x\n", ctx->index,
-		cal_read(ctx->cal, CAL_WR_DMA_XSIZE(ctx->index)));
+	cal_write(ctx->cal, CAL_WR_DMA_XSIZE(ctx->dma_ctx), val);
+	ctx_dbg(3, ctx, "CAL_WR_DMA_XSIZE(%d) = 0x%08x\n", ctx->dma_ctx,
+		cal_read(ctx->cal, CAL_WR_DMA_XSIZE(ctx->dma_ctx)));
 }
 
 void cal_ctx_set_dma_addr(struct cal_ctx *ctx, dma_addr_t addr)
 {
-	cal_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->index), addr);
+	cal_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->dma_ctx), addr);
 }
 
 static void cal_ctx_wr_dma_disable(struct cal_ctx *ctx)
 {
-	u32 val = cal_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->index));
+	u32 val = cal_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->dma_ctx));
 
 	cal_set_field(&val, CAL_WR_DMA_CTRL_MODE_DIS,
 		      CAL_WR_DMA_CTRL_MODE_MASK);
-	cal_write(ctx->cal, CAL_WR_DMA_CTRL(ctx->index), val);
+	cal_write(ctx->cal, CAL_WR_DMA_CTRL(ctx->dma_ctx), val);
 }
 
 static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
@@ -453,9 +453,9 @@ void cal_ctx_start(struct cal_ctx *ctx)
 
 	/* Enable IRQ_WDMA_END and IRQ_WDMA_START. */
 	cal_write(ctx->cal, CAL_HL_IRQENABLE_SET(1),
-		  CAL_HL_IRQ_MASK(ctx->index));
+		  CAL_HL_IRQ_MASK(ctx->dma_ctx));
 	cal_write(ctx->cal, CAL_HL_IRQENABLE_SET(2),
-		  CAL_HL_IRQ_MASK(ctx->index));
+		  CAL_HL_IRQ_MASK(ctx->dma_ctx));
 }
 
 void cal_ctx_stop(struct cal_ctx *ctx)
@@ -479,9 +479,9 @@ void cal_ctx_stop(struct cal_ctx *ctx)
 
 	/* Disable IRQ_WDMA_END and IRQ_WDMA_START. */
 	cal_write(ctx->cal, CAL_HL_IRQENABLE_CLR(1),
-		  CAL_HL_IRQ_MASK(ctx->index));
+		  CAL_HL_IRQ_MASK(ctx->dma_ctx));
 	cal_write(ctx->cal, CAL_HL_IRQENABLE_CLR(2),
-		  CAL_HL_IRQ_MASK(ctx->index));
+		  CAL_HL_IRQ_MASK(ctx->dma_ctx));
 
 	ctx->dma.state = CAL_DMA_STOPPED;
 }
@@ -854,7 +854,7 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 
 	ctx->cal = cal;
 	ctx->phy = cal->phy[inst];
-	ctx->index = inst;
+	ctx->dma_ctx = inst;
 	ctx->csi2_ctx = inst;
 	ctx->cport = inst;
 	ctx->pix_proc = inst;
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 9475dc80559b..e4db2a905f68 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -217,7 +217,7 @@ struct cal_ctx {
 
 	unsigned int		sequence;
 	struct vb2_queue	vb_vidq;
-	u8			index;
+	u8			dma_ctx;
 	u8			cport;
 	u8			csi2_ctx;
 	u8			pix_proc;
@@ -238,11 +238,11 @@ extern bool cal_mc_api;
 	dev_err((cal)->dev, fmt, ##arg)
 
 #define ctx_dbg(level, ctx, fmt, arg...)				\
-	cal_dbg(level, (ctx)->cal, "ctx%u: " fmt, (ctx)->index, ##arg)
+	cal_dbg(level, (ctx)->cal, "ctx%u: " fmt, (ctx)->dma_ctx, ##arg)
 #define ctx_info(ctx, fmt, arg...)					\
-	cal_info((ctx)->cal, "ctx%u: " fmt, (ctx)->index, ##arg)
+	cal_info((ctx)->cal, "ctx%u: " fmt, (ctx)->dma_ctx, ##arg)
 #define ctx_err(ctx, fmt, arg...)					\
-	cal_err((ctx)->cal, "ctx%u: " fmt, (ctx)->index, ##arg)
+	cal_err((ctx)->cal, "ctx%u: " fmt, (ctx)->dma_ctx, ##arg)
 
 #define phy_dbg(level, phy, fmt, arg...)				\
 	cal_dbg(level, (phy)->cal, "phy%u: " fmt, (phy)->instance, ##arg)
-- 
2.25.1

