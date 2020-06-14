Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA0DE1F8BD2
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbgFOACS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:02:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728281AbgFOACR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:02:17 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90322217B;
        Mon, 15 Jun 2020 02:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179261;
        bh=dV5Mxg0PhNATkvhkgIrlGsPH1yhHmFiv2vPlzxmOBHI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eKorISVlW9YsM5FNpAomrbBpSf7SeaZu3u2oIIEXc+P3UTvxlFN8Y5+xCgCfhnKbe
         sj3yTACqizgzwZSpaYvbBor03WwIYc+i34fsQ07K02ztfu3icWt7ZNXBP26lAXPKvp
         si6rzQFPqV9OmTHNB8JlvQ2iJCumpV7viy5kswPo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 106/107] media: ti-vpe: cal: Simplify the context API
Date:   Mon, 15 Jun 2020 02:59:43 +0300
Message-Id: <20200614235944.17716-107-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
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
---
 drivers/media/platform/ti-vpe/cal-video.c | 21 +++------
 drivers/media/platform/ti-vpe/cal.c       | 54 +++++++++++++----------
 drivers/media/platform/ti-vpe/cal.h       | 11 ++---
 3 files changed, 41 insertions(+), 45 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 0b4e5b11474d..0f8702bd77db 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -519,16 +519,11 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
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
@@ -540,9 +535,8 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return 0;
 
 err:
-	cal_ctx_wr_dma_disable(ctx);
-	cal_ctx_disable_irqs(ctx);
-	ctx->dma.state = CAL_DMA_STOPPED;
+	cal_ctx_stop(ctx);
+	pm_runtime_put_sync(ctx->cal->dev);
 
 	cal_release_buffers(ctx, VB2_BUF_STATE_QUEUED);
 	return ret;
@@ -552,14 +546,13 @@ static void cal_stop_streaming(struct vb2_queue *vq)
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
index 520f9e8ec917..f97c213f716f 100644
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
index 26b5eb20fd57..036b944c3862 100644
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

