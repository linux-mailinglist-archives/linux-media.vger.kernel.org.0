Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 651FE2D085E
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbgLFX6Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:58:16 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60442 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728429AbgLFX6O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:58:14 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FFC81A47;
        Mon,  7 Dec 2020 00:54:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607298850;
        bh=BD+9Mj/ZZeBghVzDypGkYO8QW+8I6ZqzGxOcG7Ws0ns=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UUjiD+L+9XQBJvPqTS6wvP9RmolfsqaMC3OG02zSjMsYS944wFX1WekHotLDiaxLY
         ZERdWwK/pTcNx0N6BLlKQt9fXt4vzttwFsdHonWT2ZtCuuycffCNZJiVEv7+Dp3E1d
         11GqR/eBexQkBBAP64QHBwlaRjNG6jLlhmfLKOn4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v3 23/24] media: ti-vpe: cal: Simplify the context API
Date:   Mon,  7 Dec 2020 01:53:52 +0200
Message-Id: <20201206235353.26968-24-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
References: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rework the context API exposed to cal-video.c to simplify it. The
configuration and enable steps are all grouped in a single
cal_ctx_start() function, and the DMA stop and IRQ disable are similarly
groupd in cal_ctx_stop(). The cal_ctx_wr_dma_addr() function is renamed
to cal_ctx_set_dma_addr() for consistency with the cal_ctx_ prefix of
the start and stop functions.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 21 +++------
 drivers/media/platform/ti-vpe/cal.c       | 54 +++++++++++++----------
 drivers/media/platform/ti-vpe/cal.h       | 11 ++---
 3 files changed, 41 insertions(+), 45 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 511767dd69bd..779f1e1bc529 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -518,16 +518,11 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	spin_unlock_irq(&ctx->dma.lock);
 
 	addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
-	ctx->sequence = 0;
-	ctx->dma.state = CAL_DMA_RUNNING;
 
 	pm_runtime_get_sync(ctx->cal->dev);
 
-	cal_ctx_csi2_config(ctx);
-	cal_ctx_pix_proc_config(ctx);
-	cal_ctx_wr_dma_config(ctx);
-	cal_ctx_wr_dma_addr(ctx, addr);
-	cal_ctx_enable_irqs(ctx);
+	cal_ctx_set_dma_addr(ctx, addr);
+	cal_ctx_start(ctx);
 
 	ret = v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 1);
 	if (ret)
@@ -539,9 +534,8 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return 0;
 
 err:
-	cal_ctx_wr_dma_disable(ctx);
-	cal_ctx_disable_irqs(ctx);
-	ctx->dma.state = CAL_DMA_STOPPED;
+	cal_ctx_stop(ctx);
+	pm_runtime_put_sync(ctx->cal->dev);
 
 	cal_release_buffers(ctx, VB2_BUF_STATE_QUEUED);
 	return ret;
@@ -551,14 +545,13 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 {
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
 
-	cal_ctx_wr_dma_stop(ctx);
-	cal_ctx_disable_irqs(ctx);
+	cal_ctx_stop(ctx);
 
 	v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 0);
 
+	pm_runtime_put_sync(ctx->cal->dev);
+
 	cal_release_buffers(ctx, VB2_BUF_STATE_ERROR);
-
-	pm_runtime_put_sync(ctx->cal->dev);
 }
 
 static const struct vb2_ops cal_video_qops = {
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 3cf625262d32..293cbac905b3 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -280,7 +280,7 @@ void cal_quickdump_regs(struct cal_dev *cal)
  * ------------------------------------------------------------------
  */
 
-void cal_ctx_csi2_config(struct cal_ctx *ctx)
+static void cal_ctx_csi2_config(struct cal_ctx *ctx)
 {
 	u32 val;
 
@@ -305,7 +305,7 @@ void cal_ctx_csi2_config(struct cal_ctx *ctx)
 		cal_read(ctx->cal, CAL_CSI2_CTX0(ctx->index)));
 }
 
-void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
+static void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
 {
 	u32 val, extract, pack;
 
@@ -356,7 +356,7 @@ void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
 		cal_read(ctx->cal, CAL_PIX_PROC(ctx->index)));
 }
 
-void cal_ctx_wr_dma_config(struct cal_ctx *ctx)
+static void cal_ctx_wr_dma_config(struct cal_ctx *ctx)
 {
 	unsigned int stride = ctx->v_fmt.fmt.pix.bytesperline;
 	u32 val;
@@ -406,12 +406,12 @@ void cal_ctx_wr_dma_config(struct cal_ctx *ctx)
 	ctx_dbg(3, ctx, "CAL_CTRL = 0x%08x\n", cal_read(ctx->cal, CAL_CTRL));
 }
 
-void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, dma_addr_t addr)
+void cal_ctx_set_dma_addr(struct cal_ctx *ctx, dma_addr_t addr)
 {
 	cal_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->index), addr);
 }
 
-void cal_ctx_wr_dma_disable(struct cal_ctx *ctx)
+static void cal_ctx_wr_dma_disable(struct cal_ctx *ctx)
 {
 	u32 val = cal_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->index));
 
@@ -431,11 +431,31 @@ static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
 	return stopped;
 }
 
-int cal_ctx_wr_dma_stop(struct cal_ctx *ctx)
+void cal_ctx_start(struct cal_ctx *ctx)
+{
+	ctx->sequence = 0;
+	ctx->dma.state = CAL_DMA_RUNNING;
+
+	/* Configure the CSI-2, pixel processing and write DMA contexts. */
+	cal_ctx_csi2_config(ctx);
+	cal_ctx_pix_proc_config(ctx);
+	cal_ctx_wr_dma_config(ctx);
+
+	/* Enable IRQ_WDMA_END and IRQ_WDMA_START. */
+	cal_write(ctx->cal, CAL_HL_IRQENABLE_SET(1),
+		  CAL_HL_IRQ_MASK(ctx->index));
+	cal_write(ctx->cal, CAL_HL_IRQENABLE_SET(2),
+		  CAL_HL_IRQ_MASK(ctx->index));
+}
+
+void cal_ctx_stop(struct cal_ctx *ctx)
 {
 	long timeout;
 
-	/* Request DMA stop and wait until it completes. */
+	/*
+	 * Request DMA stop and wait until it completes. If completion times
+	 * out, forcefully disable the DMA.
+	 */
 	spin_lock_irq(&ctx->dma.lock);
 	ctx->dma.state = CAL_DMA_STOP_REQUESTED;
 	spin_unlock_irq(&ctx->dma.lock);
@@ -444,28 +464,16 @@ int cal_ctx_wr_dma_stop(struct cal_ctx *ctx)
 				     msecs_to_jiffies(500));
 	if (!timeout) {
 		ctx_err(ctx, "failed to disable dma cleanly\n");
-		return -ETIMEDOUT;
+		cal_ctx_wr_dma_disable(ctx);
 	}
 
-	return 0;
-}
-
-void cal_ctx_enable_irqs(struct cal_ctx *ctx)
-{
-	/* Enable IRQ_WDMA_END and IRQ_WDMA_START. */
-	cal_write(ctx->cal, CAL_HL_IRQENABLE_SET(1),
-		  CAL_HL_IRQ_MASK(ctx->index));
-	cal_write(ctx->cal, CAL_HL_IRQENABLE_SET(2),
-		  CAL_HL_IRQ_MASK(ctx->index));
-}
-
-void cal_ctx_disable_irqs(struct cal_ctx *ctx)
-{
 	/* Disable IRQ_WDMA_END and IRQ_WDMA_START. */
 	cal_write(ctx->cal, CAL_HL_IRQENABLE_CLR(1),
 		  CAL_HL_IRQ_MASK(ctx->index));
 	cal_write(ctx->cal, CAL_HL_IRQENABLE_CLR(2),
 		  CAL_HL_IRQ_MASK(ctx->index));
+
+	ctx->dma.state = CAL_DMA_STOPPED;
 }
 
 /* ------------------------------------------------------------------
@@ -496,7 +504,7 @@ static inline void cal_irq_wdma_start(struct cal_ctx *ctx)
 		buf = list_first_entry(&ctx->dma.queue, struct cal_buffer,
 				       list);
 		addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
-		cal_ctx_wr_dma_addr(ctx, addr);
+		cal_ctx_set_dma_addr(ctx, addr);
 
 		ctx->dma.pending = buf;
 		list_del(&buf->list);
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 26916f72fd60..60f5f7480b17 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -296,14 +296,9 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 					 unsigned int instance);
 void cal_camerarx_destroy(struct cal_camerarx *phy);
 
-void cal_ctx_csi2_config(struct cal_ctx *ctx);
-void cal_ctx_pix_proc_config(struct cal_ctx *ctx);
-void cal_ctx_wr_dma_config(struct cal_ctx *ctx);
-void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, dma_addr_t addr);
-void cal_ctx_wr_dma_disable(struct cal_ctx *ctx);
-int cal_ctx_wr_dma_stop(struct cal_ctx *ctx);
-void cal_ctx_enable_irqs(struct cal_ctx *ctx);
-void cal_ctx_disable_irqs(struct cal_ctx *ctx);
+void cal_ctx_set_dma_addr(struct cal_ctx *ctx, dma_addr_t addr);
+void cal_ctx_start(struct cal_ctx *ctx);
+void cal_ctx_stop(struct cal_ctx *ctx);
 
 int cal_ctx_v4l2_register(struct cal_ctx *ctx);
 void cal_ctx_v4l2_unregister(struct cal_ctx *ctx);
-- 
Regards,

Laurent Pinchart

