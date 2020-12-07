Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF7642D085B
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728700AbgLFX55 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:57:57 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60444 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728689AbgLFX55 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:57:57 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E006918C3;
        Mon,  7 Dec 2020 00:54:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607298849;
        bh=WCCgwHiKKSrFv9i7Pmt3bvIrB9NPFUtOzhb0DCF7LWc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vXsRoxno6aCJVj35Ab2wRcG0c1qL7H6R+N3SjTnIPfO0FNmOH56PDn35QpRfO54+i
         ywmzIrZtkoyOzCWLGD41dim3RxfGhDj2E7s7glUkhv9MIP/WrTI6W3K0DdC2tfsZ0G
         gOM49CnLI/5KmFEcnooJcuC+c8+au0wya/SpLNBY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v3 20/24] media: ti-vpe: cal: Group all DMA queue fields in struct cal_dmaqueue
Date:   Mon,  7 Dec 2020 01:53:49 +0200
Message-Id: <20201206235353.26968-21-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
References: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_dmaqueue structure only contains the list of queued buffers.
Move the other fields that are logically related to the DMA queue
(current and next buffer points, state, wait queue and lock) from
cal_ctx to cal_dmaqueue.

Take this as an opportunity to document the fields usage and to give
them more appropriate names. The 'active' field stored the list of all
queued buffers, not the active buffers, so rename it to 'queue'. The
'cur_frm' and 'next_frm' are respectively renamed to 'active' and
'pending' to better explain their purpose. The 'dma_state' and
'dma_wait' fields are stripped of their 'dma_' prefix as they're now
part of cal_dmaqueue. Finally, 'slock' is renamed to 'lock'.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 48 +++++++++++-----------
 drivers/media/platform/ti-vpe/cal.c       | 49 +++++++++++------------
 drivers/media/platform/ti-vpe/cal.h       | 44 ++++++++++++++------
 3 files changed, 79 insertions(+), 62 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index c80c4643d8ed..34dfe38dc960 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -470,13 +470,12 @@ static void cal_buffer_queue(struct vb2_buffer *vb)
 	struct cal_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct cal_buffer *buf = container_of(vb, struct cal_buffer,
 					      vb.vb2_buf);
-	struct cal_dmaqueue *vidq = &ctx->vidq;
 	unsigned long flags;
 
 	/* recheck locking */
-	spin_lock_irqsave(&ctx->slock, flags);
-	list_add_tail(&buf->list, &vidq->active);
-	spin_unlock_irqrestore(&ctx->slock, flags);
+	spin_lock_irqsave(&ctx->dma.lock, flags);
+	list_add_tail(&buf->list, &ctx->dma.queue);
+	spin_unlock_irqrestore(&ctx->dma.lock, flags);
 }
 
 static void cal_release_buffers(struct cal_ctx *ctx,
@@ -484,42 +483,41 @@ static void cal_release_buffers(struct cal_ctx *ctx,
 {
 	struct cal_buffer *buf, *tmp;
 
-	/* Release all active buffers. */
-	spin_lock_irq(&ctx->slock);
+	/* Release all queued buffers. */
+	spin_lock_irq(&ctx->dma.lock);
 
-	list_for_each_entry_safe(buf, tmp, &ctx->vidq.active, list) {
+	list_for_each_entry_safe(buf, tmp, &ctx->dma.queue, list) {
 		list_del(&buf->list);
 		vb2_buffer_done(&buf->vb.vb2_buf, state);
 	}
 
-	if (ctx->next_frm != ctx->cur_frm)
-		vb2_buffer_done(&ctx->next_frm->vb.vb2_buf, state);
-	vb2_buffer_done(&ctx->cur_frm->vb.vb2_buf, state);
+	if (ctx->dma.pending != ctx->dma.active)
+		vb2_buffer_done(&ctx->dma.pending->vb.vb2_buf, state);
+	vb2_buffer_done(&ctx->dma.active->vb.vb2_buf, state);
 
-	ctx->cur_frm = NULL;
-	ctx->next_frm = NULL;
+	ctx->dma.active = NULL;
+	ctx->dma.pending = NULL;
 
-	spin_unlock_irq(&ctx->slock);
+	spin_unlock_irq(&ctx->dma.lock);
 }
 
 static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
-	struct cal_dmaqueue *dma_q = &ctx->vidq;
 	struct cal_buffer *buf;
 	unsigned long addr;
 	int ret;
 
-	spin_lock_irq(&ctx->slock);
-	buf = list_first_entry(&dma_q->active, struct cal_buffer, list);
-	ctx->cur_frm = buf;
-	ctx->next_frm = buf;
+	spin_lock_irq(&ctx->dma.lock);
+	buf = list_first_entry(&ctx->dma.queue, struct cal_buffer, list);
+	ctx->dma.active = buf;
+	ctx->dma.pending = buf;
 	list_del(&buf->list);
-	spin_unlock_irq(&ctx->slock);
+	spin_unlock_irq(&ctx->dma.lock);
 
-	addr = vb2_dma_contig_plane_dma_addr(&ctx->cur_frm->vb.vb2_buf, 0);
+	addr = vb2_dma_contig_plane_dma_addr(&ctx->dma.active->vb.vb2_buf, 0);
 	ctx->sequence = 0;
-	ctx->dma_state = CAL_DMA_RUNNING;
+	ctx->dma.state = CAL_DMA_RUNNING;
 
 	pm_runtime_get_sync(ctx->cal->dev);
 
@@ -541,7 +539,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 err:
 	cal_ctx_wr_dma_disable(ctx);
 	cal_ctx_disable_irqs(ctx);
-	ctx->dma_state = CAL_DMA_STOPPED;
+	ctx->dma.state = CAL_DMA_STOPPED;
 
 	cal_release_buffers(ctx, VB2_BUF_STATE_QUEUED);
 	return ret;
@@ -710,10 +708,10 @@ int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 	struct vb2_queue *q = &ctx->vb_vidq;
 	int ret;
 
-	INIT_LIST_HEAD(&ctx->vidq.active);
-	spin_lock_init(&ctx->slock);
+	INIT_LIST_HEAD(&ctx->dma.queue);
+	spin_lock_init(&ctx->dma.lock);
 	mutex_init(&ctx->mutex);
-	init_waitqueue_head(&ctx->dma_wait);
+	init_waitqueue_head(&ctx->dma.wait);
 
 	/* Initialize the vb2 queue. */
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 8f25e7a6f5e8..3e0a69bb7fe5 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -424,9 +424,9 @@ static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
 {
 	bool stopped;
 
-	spin_lock_irq(&ctx->slock);
-	stopped = ctx->dma_state == CAL_DMA_STOPPED;
-	spin_unlock_irq(&ctx->slock);
+	spin_lock_irq(&ctx->dma.lock);
+	stopped = ctx->dma.state == CAL_DMA_STOPPED;
+	spin_unlock_irq(&ctx->dma.lock);
 
 	return stopped;
 }
@@ -436,11 +436,11 @@ int cal_ctx_wr_dma_stop(struct cal_ctx *ctx)
 	long timeout;
 
 	/* Request DMA stop and wait until it completes. */
-	spin_lock_irq(&ctx->slock);
-	ctx->dma_state = CAL_DMA_STOP_REQUESTED;
-	spin_unlock_irq(&ctx->slock);
+	spin_lock_irq(&ctx->dma.lock);
+	ctx->dma.state = CAL_DMA_STOP_REQUESTED;
+	spin_unlock_irq(&ctx->dma.lock);
 
-	timeout = wait_event_timeout(ctx->dma_wait, cal_ctx_wr_dma_stopped(ctx),
+	timeout = wait_event_timeout(ctx->dma.wait, cal_ctx_wr_dma_stopped(ctx),
 				     msecs_to_jiffies(500));
 	if (!timeout) {
 		ctx_err(ctx, "failed to disable dma cleanly\n");
@@ -475,20 +475,18 @@ void cal_ctx_disable_irqs(struct cal_ctx *ctx)
 
 static inline void cal_irq_wdma_start(struct cal_ctx *ctx)
 {
-	struct cal_dmaqueue *dma_q = &ctx->vidq;
+	spin_lock(&ctx->dma.lock);
 
-	spin_lock(&ctx->slock);
-
-	if (ctx->dma_state == CAL_DMA_STOP_REQUESTED) {
+	if (ctx->dma.state == CAL_DMA_STOP_REQUESTED) {
 		/*
 		 * If a stop is requested, disable the write DMA context
 		 * immediately. The CAL_WR_DMA_CTRL_j.MODE field is shadowed,
 		 * the current frame will complete and the DMA will then stop.
 		 */
 		cal_ctx_wr_dma_disable(ctx);
-		ctx->dma_state = CAL_DMA_STOP_PENDING;
-	} else if (!list_empty(&dma_q->active) &&
-		   ctx->cur_frm == ctx->next_frm) {
+		ctx->dma.state = CAL_DMA_STOP_PENDING;
+	} else if (!list_empty(&ctx->dma.queue) &&
+		   ctx->dma.active == ctx->dma.pending) {
 		/*
 		 * Otherwise, if a new buffer is available, queue it to the
 		 * hardware.
@@ -496,36 +494,37 @@ static inline void cal_irq_wdma_start(struct cal_ctx *ctx)
 		struct cal_buffer *buf;
 		unsigned long addr;
 
-		buf = list_first_entry(&dma_q->active, struct cal_buffer, list);
+		buf = list_first_entry(&ctx->dma.queue, struct cal_buffer,
+				       list);
 		addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
 		cal_ctx_wr_dma_addr(ctx, addr);
 
-		ctx->next_frm = buf;
+		ctx->dma.pending = buf;
 		list_del(&buf->list);
 	}
 
-	spin_unlock(&ctx->slock);
+	spin_unlock(&ctx->dma.lock);
 }
 
 static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
 {
 	struct cal_buffer *buf = NULL;
 
-	spin_lock(&ctx->slock);
+	spin_lock(&ctx->dma.lock);
 
 	/* If the DMA context was stopping, it is now stopped. */
-	if (ctx->dma_state == CAL_DMA_STOP_PENDING) {
-		ctx->dma_state = CAL_DMA_STOPPED;
-		wake_up(&ctx->dma_wait);
+	if (ctx->dma.state == CAL_DMA_STOP_PENDING) {
+		ctx->dma.state = CAL_DMA_STOPPED;
+		wake_up(&ctx->dma.wait);
 	}
 
 	/* If a new buffer was queued, complete the current buffer. */
-	if (ctx->cur_frm != ctx->next_frm) {
-		buf = ctx->cur_frm;
-		ctx->cur_frm = ctx->next_frm;
+	if (ctx->dma.active != ctx->dma.pending) {
+		buf = ctx->dma.active;
+		ctx->dma.active = ctx->dma.pending;
 	}
 
-	spin_unlock(&ctx->slock);
+	spin_unlock(&ctx->dma.lock);
 
 	if (buf) {
 		buf->vb.vb2_buf.timestamp = ktime_get_ns();
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 5ee0e05c3305..9d3cbc13f915 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -82,8 +82,38 @@ struct cal_buffer {
 	struct list_head	list;
 };
 
+/**
+ * struct cal_dmaqueue - Queue of DMA buffers
+ * @active: Buffer being DMA'ed to for the current frame
+ */
 struct cal_dmaqueue {
-	struct list_head	active;
+	/**
+	 * Protects all fields in the cal_dmaqueue.
+	 */
+	spinlock_t		lock;
+
+	/**
+	 * Buffers queued to the driver and waiting for DMA processing.
+	 * Buffers are added to the list by the vb2 .buffer_queue() operation,
+	 * and move to @pending when they are scheduled for the next frame.
+	 */
+	struct list_head	queue;
+	/**
+	 * Buffer provided to the hardware to DMA the next frame. Will move to
+	 * @active at the end of the current frame.
+	 */
+	struct cal_buffer	*pending;
+	/**
+	 * Buffer being DMA'ed to for the current frame. Will be retired and
+	 * given back to vb2 at the end of the current frame if a @pending
+	 * buffer has been scheduled to replace it.
+	 */
+	struct cal_buffer	*active;
+
+	/** State of the DMA engine. */
+	enum cal_dma_state	state;
+	/** Wait queue to signal a @state transition to CAL_DMA_STOPPED. */
+	struct wait_queue_head	wait;
 };
 
 struct cal_camerarx_data {
@@ -174,10 +204,8 @@ struct cal_ctx {
 
 	/* v4l2_ioctl mutex */
 	struct mutex		mutex;
-	/* v4l2 buffers lock */
-	spinlock_t		slock;
 
-	struct cal_dmaqueue	vidq;
+	struct cal_dmaqueue	dma;
 
 	/* video capture */
 	const struct cal_format_info	*fmtinfo;
@@ -192,14 +220,6 @@ struct cal_ctx {
 	struct vb2_queue	vb_vidq;
 	unsigned int		index;
 	unsigned int		cport;
-
-	/* Pointer pointing to current v4l2_buffer */
-	struct cal_buffer	*cur_frm;
-	/* Pointer pointing to next v4l2_buffer */
-	struct cal_buffer	*next_frm;
-
-	enum cal_dma_state	dma_state;
-	struct wait_queue_head	dma_wait;
 };
 
 extern unsigned int cal_debug;
-- 
Regards,

Laurent Pinchart

