Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6244F1F8BC8
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbgFOACI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:02:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728044AbgFOACH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:02:07 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D8B12173;
        Mon, 15 Jun 2020 02:00:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179257;
        bh=ymWNbY3VPMiW/5x5tkboFaLJxel/CvLAiPeEDb2/BmU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jJJ0tJeu0Gh6G45zXqAZ9Guf2gnEDbHay50XmMVWlDtyYc/0cNPVSCAPp1Ey4gTkf
         Wcphj8V2Zob6fJngFgXuHK/uQc1/kTvD6pyoLXmdiwx2Fhy55K0/Uv4R+i4ByT3WDk
         9oPgQec1MpCd0BI7Sqcxm5WRmh9krMZeHZXogj2s=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 096/107] media: ti-vpe: cal: Stop write DMA without disabling PPI
Date:   Mon, 15 Jun 2020 02:59:33 +0300
Message-Id: <20200614235944.17716-97-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When stopping the stream, the driver needs to ensure that ongoing DMA
completes and that no new DMA is started. It does so using a feature of
the PPI that can be stopped on a frame boundary. The downside of this
mechanism is that the DMA can't be stopped independently of the source,
which prevents usage of multiple contexts for the same source (to handle
CSI-2 virtual channels or data types).

Rework the stream stop mechanism to stop the write DMA without disabling
the PPI first. The new mechanism relies on the combination of a state
machine in the driver and shadowing of the CAL_WR_DMA_CTRL_j.MODE field
in the hardware. When a stop is requested, the DMA start interrupt
handler will request the hardware to stop at the end of the current
frame by disabling the write DMA context in the shadowed register, and
flag that a stop is in progress. The next DMA end interrupt will then
report that the stop is complete.

This makes it possible to stop the PPI after stopping the DMA, and fold
the cal_camerarx_ppi_disable() call into cal_camerarx_stop().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c |   6 +-
 drivers/media/platform/ti-vpe/cal-video.c    |  26 +---
 drivers/media/platform/ti-vpe/cal.c          | 133 +++++++++++++------
 drivers/media/platform/ti-vpe/cal.h          |  14 +-
 4 files changed, 117 insertions(+), 62 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 2d0e9d8414e7..2e7a3bc716cf 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -251,13 +251,11 @@ static void cal_camerarx_disable_irqs(struct cal_camerarx *phy)
 
 static void cal_camerarx_ppi_enable(struct cal_camerarx *phy)
 {
-	cal_write(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
-		  CAL_CSI2_PPI_CTRL_FRAME_MASK);
 	cal_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
 			1, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
 }
 
-void cal_camerarx_ppi_disable(struct cal_camerarx *phy)
+static void cal_camerarx_ppi_disable(struct cal_camerarx *phy)
 {
 	cal_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
 			0, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
@@ -402,6 +400,8 @@ static void cal_camerarx_stop(struct cal_camerarx *phy)
 	unsigned int i;
 	int ret;
 
+	cal_camerarx_ppi_disable(phy);
+
 	cal_camerarx_disable_irqs(phy);
 
 	cal_camerarx_power(phy, false);
diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 627d816548b8..d3f805a512c0 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -9,7 +9,6 @@
  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
 
-#include <linux/delay.h>
 #include <linux/ioctl.h>
 #include <linux/pm_runtime.h>
 #include <linux/videodev2.h>
@@ -511,6 +510,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	addr = vb2_dma_contig_plane_dma_addr(&ctx->cur_frm->vb.vb2_buf, 0);
 	ctx->sequence = 0;
+	ctx->dma_state = CAL_DMA_RUNNING;
 
 	pm_runtime_get_sync(ctx->cal->dev);
 
@@ -530,6 +530,10 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return 0;
 
 err:
+	cal_ctx_wr_dma_disable(ctx);
+	cal_ctx_disable_irqs(ctx);
+	ctx->dma_state = CAL_DMA_STOPPED;
+
 	spin_lock_irqsave(&ctx->slock, flags);
 	vb2_buffer_done(&ctx->cur_frm->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
 	ctx->cur_frm = NULL;
@@ -547,26 +551,9 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
 	struct cal_dmaqueue *dma_q = &ctx->vidq;
 	struct cal_buffer *buf, *tmp;
-	unsigned long timeout;
 	unsigned long flags;
-	bool dma_act;
-
-	cal_camerarx_ppi_disable(ctx->phy);
-
-	/* wait for stream and dma to finish */
-	dma_act = true;
-	timeout = jiffies + msecs_to_jiffies(500);
-	while (dma_act && time_before(jiffies, timeout)) {
-		msleep(50);
-
-		spin_lock_irqsave(&ctx->slock, flags);
-		dma_act = ctx->dma_act;
-		spin_unlock_irqrestore(&ctx->slock, flags);
-	}
-
-	if (dma_act)
-		ctx_err(ctx, "failed to disable dma cleanly\n");
 
+	cal_ctx_wr_dma_stop(ctx);
 	cal_ctx_disable_irqs(ctx);
 
 	v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 0);
@@ -745,6 +732,7 @@ int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 	INIT_LIST_HEAD(&ctx->vidq.active);
 	spin_lock_init(&ctx->slock);
 	mutex_init(&ctx->mutex);
+	init_waitqueue_head(&ctx->dma_wait);
 
 	/* Initialize the vb2 queue. */
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 4b986d818cb9..09cad8046910 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -411,6 +411,45 @@ void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
 	cal_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->index), dmaaddr);
 }
 
+void cal_ctx_wr_dma_disable(struct cal_ctx *ctx)
+{
+	u32 val = cal_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->index));
+
+	cal_set_field(&val, CAL_WR_DMA_CTRL_MODE_DIS,
+		      CAL_WR_DMA_CTRL_MODE_MASK);
+	cal_write(ctx->cal, CAL_WR_DMA_CTRL(ctx->index), val);
+}
+
+static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
+{
+	bool stopped;
+
+	spin_lock_irq(&ctx->slock);
+	stopped = ctx->dma_state == CAL_DMA_STOPPED;
+	spin_unlock_irq(&ctx->slock);
+
+	return stopped;
+}
+
+int cal_ctx_wr_dma_stop(struct cal_ctx *ctx)
+{
+	long timeout;
+
+	/* Request DMA stop and wait until it completes. */
+	spin_lock_irq(&ctx->slock);
+	ctx->dma_state = CAL_DMA_STOP_REQUESTED;
+	spin_unlock_irq(&ctx->slock);
+
+	timeout = wait_event_timeout(ctx->dma_wait, cal_ctx_wr_dma_stopped(ctx),
+				     msecs_to_jiffies(500));
+	if (!timeout) {
+		ctx_err(ctx, "failed to disable dma cleanly\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 void cal_ctx_enable_irqs(struct cal_ctx *ctx)
 {
 	/* Enable IRQ_WDMA_END and IRQ_WDMA_START. */
@@ -434,35 +473,71 @@ void cal_ctx_disable_irqs(struct cal_ctx *ctx)
  * ------------------------------------------------------------------
  */
 
-static inline void cal_schedule_next_buffer(struct cal_ctx *ctx)
+static inline void cal_irq_wdma_start(struct cal_ctx *ctx)
 {
 	struct cal_dmaqueue *dma_q = &ctx->vidq;
-	struct cal_buffer *buf;
-	unsigned long addr;
 
-	buf = list_entry(dma_q->active.next, struct cal_buffer, list);
-	ctx->next_frm = buf;
-	list_del(&buf->list);
+	spin_lock(&ctx->slock);
 
-	addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
-	cal_ctx_wr_dma_addr(ctx, addr);
+	if (ctx->dma_state == CAL_DMA_STOP_REQUESTED) {
+		/*
+		 * If a stop is requested, disable the write DMA context
+		 * immediately. The CAL_WR_DMA_CTRL_j.MODE field is shadowed,
+		 * the current frame will complete and the DMA will then stop.
+		 */
+		cal_ctx_wr_dma_disable(ctx);
+		ctx->dma_state = CAL_DMA_STOP_PENDING;
+	} else if (!list_empty(&dma_q->active) &&
+		   ctx->cur_frm == ctx->next_frm) {
+		/*
+		 * Otherwise, if a new buffer is available, queue it to the
+		 * hardware.
+		 */
+		struct cal_buffer *buf;
+		unsigned long addr;
+
+		buf = list_entry(dma_q->active.next, struct cal_buffer, list);
+		addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
+		cal_ctx_wr_dma_addr(ctx, addr);
+
+		ctx->next_frm = buf;
+		list_del(&buf->list);
+	}
+
+	spin_unlock(&ctx->slock);
 }
 
-static inline void cal_process_buffer_complete(struct cal_ctx *ctx)
+static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
 {
-	ctx->cur_frm->vb.vb2_buf.timestamp = ktime_get_ns();
-	ctx->cur_frm->vb.field = ctx->v_fmt.fmt.pix.field;
-	ctx->cur_frm->vb.sequence = ctx->sequence++;
+	struct cal_buffer *buf = NULL;
 
-	vb2_buffer_done(&ctx->cur_frm->vb.vb2_buf, VB2_BUF_STATE_DONE);
-	ctx->cur_frm = ctx->next_frm;
+	spin_lock(&ctx->slock);
+
+	/* If the DMA context was stopping, it is now stopped. */
+	if (ctx->dma_state == CAL_DMA_STOP_PENDING) {
+		ctx->dma_state = CAL_DMA_STOPPED;
+		wake_up(&ctx->dma_wait);
+	}
+
+	/* If a new buffer was queued, complete the current buffer. */
+	if (ctx->cur_frm != ctx->next_frm) {
+		buf = ctx->cur_frm;
+		ctx->cur_frm = ctx->next_frm;
+	}
+
+	spin_unlock(&ctx->slock);
+
+	if (buf) {
+		buf->vb.vb2_buf.timestamp = ktime_get_ns();
+		buf->vb.field = ctx->v_fmt.fmt.pix.field;
+		buf->vb.sequence = ctx->sequence++;
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	}
 }
 
 static irqreturn_t cal_irq(int irq_cal, void *data)
 {
 	struct cal_dev *cal = data;
-	struct cal_ctx *ctx;
-	struct cal_dmaqueue *dma_q;
 	unsigned int i;
 	u32 status;
 
@@ -494,17 +569,8 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		cal_write(cal, CAL_HL_IRQSTATUS(1), status);
 
 		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
-			if (status & CAL_HL_IRQ_MASK(i)) {
-				ctx = cal->ctx[i];
-
-				spin_lock(&ctx->slock);
-				ctx->dma_act = false;
-
-				if (ctx->cur_frm != ctx->next_frm)
-					cal_process_buffer_complete(ctx);
-
-				spin_unlock(&ctx->slock);
-			}
+			if (status & CAL_HL_IRQ_MASK(i))
+				cal_irq_wdma_end(cal->ctx[i]);
 		}
 	}
 
@@ -515,17 +581,8 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		cal_write(cal, CAL_HL_IRQSTATUS(2), status);
 
 		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
-			if (status & CAL_HL_IRQ_MASK(i)) {
-				ctx = cal->ctx[i];
-				dma_q = &ctx->vidq;
-
-				spin_lock(&ctx->slock);
-				ctx->dma_act = true;
-				if (!list_empty(&dma_q->active) &&
-				    ctx->cur_frm == ctx->next_frm)
-					cal_schedule_next_buffer(ctx);
-				spin_unlock(&ctx->slock);
-			}
+			if (status & CAL_HL_IRQ_MASK(i))
+				cal_irq_wdma_start(cal->ctx[i]);
 		}
 	}
 
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 5cfdcaae4b16..7e4589c6dee2 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -17,6 +17,7 @@
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/videodev2.h>
+#include <linux/wait.h>
 
 #include <media/media-device.h>
 #include <media/v4l2-async.h>
@@ -60,6 +61,13 @@ enum cal_camerarx_field {
 	F_MAX_FIELDS,
 };
 
+enum cal_dma_state {
+	CAL_DMA_RUNNING,
+	CAL_DMA_STOP_REQUESTED,
+	CAL_DMA_STOP_PENDING,
+	CAL_DMA_STOPPED,
+};
+
 struct cal_format_info {
 	u32	fourcc;
 	u32	code;
@@ -190,7 +198,8 @@ struct cal_ctx {
 	/* Pointer pointing to next v4l2_buffer */
 	struct cal_buffer	*next_frm;
 
-	bool dma_act;
+	enum cal_dma_state	dma_state;
+	struct wait_queue_head	dma_wait;
 };
 
 extern unsigned int cal_debug;
@@ -262,7 +271,6 @@ const struct cal_format_info *cal_format_by_code(u32 code);
 void cal_quickdump_regs(struct cal_dev *cal);
 
 void cal_camerarx_disable(struct cal_camerarx *phy);
-void cal_camerarx_ppi_disable(struct cal_camerarx *phy);
 void cal_camerarx_i913_errata(struct cal_camerarx *phy);
 struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 					 unsigned int instance);
@@ -272,6 +280,8 @@ void cal_ctx_csi2_config(struct cal_ctx *ctx);
 void cal_ctx_pix_proc_config(struct cal_ctx *ctx);
 void cal_ctx_wr_dma_config(struct cal_ctx *ctx);
 void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr);
+void cal_ctx_wr_dma_disable(struct cal_ctx *ctx);
+int cal_ctx_wr_dma_stop(struct cal_ctx *ctx);
 void cal_ctx_enable_irqs(struct cal_ctx *ctx);
 void cal_ctx_disable_irqs(struct cal_ctx *ctx);
 
-- 
Regards,

Laurent Pinchart

