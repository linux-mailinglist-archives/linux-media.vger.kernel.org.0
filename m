Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69DABD2A8A
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 15:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388068AbfJJNMA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 09:12:00 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:48513 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387504AbfJJNL5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 09:11:57 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:bc04:8998:8ec1:1871])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IYESijV5zop0AIYEUiU36v; Thu, 10 Oct 2019 15:11:54 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, tfiga@chromium.org, jonas@kwiboo.se,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 2/8] v4l2-mem2mem: support held capture buffers
Date:   Thu, 10 Oct 2019 15:11:46 +0200
Message-Id: <20191010131152.68984-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl>
References: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDfZsdP8Bvplzj9CDblZjIi5D9n20zQHLWkR0+QzhQv0APoECiXDGOQIMb7MlTBmw8l+n0Al6dvd0Ah5ByzSQfFoZoQdPhsi3a5mQjtBD32IUHL22MsZ
 ii0OmEjKK7NFVZePJBv6yoiWbDE2K39Q3AzTm6iCm1knE/gZFg+wUU03oKOpBFjgI4/LViDu+X3y1l78wD4nsN9y10hZnfRBgigJAILVreiR4kpdeEneeTep
 NQg+YqAJQrEM+MqyM63ptT5kcYUMdc8upS3+Qqq2dsxr7Q7nDP4NYLZ19TQXLougFzxj3cVTvvPQwOy7EAS+Cv8UXXHxXKJ3pYq4IxLDjXxb7O6lth5Fj98d
 5zToObDHCKi8aLHJ92LWslft2A1Bx6mcvy4fqtdopst51rOv4lYR6RjyXgm6I00J//x5Wct1ADo1W3PO8tIAA+KUpo45Jy2EfJBAdiA1lySNjtKfCy/RMSNU
 KRVaGnhbDq/rKCG3
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check for held buffers that are ready to be returned to vb2 in
__v4l2_m2m_try_queue(). This avoids drivers having to handle this
case.

Add v4l2_m2m_buf_done_and_job_finish() to correctly return source
and destination buffers and mark the job as finished while taking
a held destination buffer into account (i.e. that buffer won't be
returned). This has to be done while job_spinlock is held to avoid
race conditions.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 128 ++++++++++++++++++-------
 include/media/v4l2-mem2mem.h           |  33 ++++++-
 2 files changed, 127 insertions(+), 34 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 19937dd3c6f6..3a8a2ebaf5e3 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -285,6 +285,7 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m_dev *m2m_dev,
 				 struct v4l2_m2m_ctx *m2m_ctx)
 {
 	unsigned long flags_job, flags_out, flags_cap;
+	struct vb2_v4l2_buffer *dst, *src;
 
 	dprintk("Trying to schedule a job for m2m_ctx: %p\n", m2m_ctx);
 
@@ -307,20 +308,30 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m_dev *m2m_dev,
 		goto job_unlock;
 	}
 
-	spin_lock_irqsave(&m2m_ctx->out_q_ctx.rdy_spinlock, flags_out);
-	if (list_empty(&m2m_ctx->out_q_ctx.rdy_queue)
-	    && !m2m_ctx->out_q_ctx.buffered) {
+	src = v4l2_m2m_next_src_buf(m2m_ctx);
+	dst = v4l2_m2m_next_dst_buf(m2m_ctx);
+	if (!src && !m2m_ctx->out_q_ctx.buffered) {
 		dprintk("No input buffers available\n");
-		goto out_unlock;
+		goto job_unlock;
 	}
-	spin_lock_irqsave(&m2m_ctx->cap_q_ctx.rdy_spinlock, flags_cap);
-	if (list_empty(&m2m_ctx->cap_q_ctx.rdy_queue)
-	    && !m2m_ctx->cap_q_ctx.buffered) {
+	if (!dst && !m2m_ctx->cap_q_ctx.buffered) {
 		dprintk("No output buffers available\n");
-		goto cap_unlock;
+		goto job_unlock;
+	}
+
+	if (src && dst &&
+	    dst->is_held && dst->vb2_buf.copied_timestamp &&
+	    dst->vb2_buf.timestamp != src->vb2_buf.timestamp) {
+		dst->is_held = false;
+		v4l2_m2m_dst_buf_remove(m2m_ctx);
+		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
+		dst = v4l2_m2m_next_dst_buf(m2m_ctx);
+
+		if (!dst && !m2m_ctx->cap_q_ctx.buffered) {
+			dprintk("No output buffers available after returning held buffer\n");
+			goto job_unlock;
+		}
 	}
-	spin_unlock_irqrestore(&m2m_ctx->cap_q_ctx.rdy_spinlock, flags_cap);
-	spin_unlock_irqrestore(&m2m_ctx->out_q_ctx.rdy_spinlock, flags_out);
 
 	if (m2m_dev->m2m_ops->job_ready
 		&& (!m2m_dev->m2m_ops->job_ready(m2m_ctx->priv))) {
@@ -331,13 +342,6 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m_dev *m2m_dev,
 	list_add_tail(&m2m_ctx->queue, &m2m_dev->job_queue);
 	m2m_ctx->job_flags |= TRANS_QUEUED;
 
-	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
-	return;
-
-cap_unlock:
-	spin_unlock_irqrestore(&m2m_ctx->cap_q_ctx.rdy_spinlock, flags_cap);
-out_unlock:
-	spin_unlock_irqrestore(&m2m_ctx->out_q_ctx.rdy_spinlock, flags_out);
 job_unlock:
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
 }
@@ -412,37 +416,97 @@ static void v4l2_m2m_cancel_job(struct v4l2_m2m_ctx *m2m_ctx)
 	}
 }
 
-void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
-			 struct v4l2_m2m_ctx *m2m_ctx)
+/*
+ * Schedule the next job, called from v4l2_m2m_job_finish() or
+ * v4l2_m2m_buf_done_and_job_finish().
+ */
+static void v4l2_m2m_schedule_next_job(struct v4l2_m2m_dev *m2m_dev,
+				       struct v4l2_m2m_ctx *m2m_ctx)
 {
-	unsigned long flags;
+	/*
+	 * This instance might have more buffers ready, but since we do not
+	 * allow more than one job on the job_queue per instance, each has
+	 * to be scheduled separately after the previous one finishes.
+	 */
+	__v4l2_m2m_try_queue(m2m_dev, m2m_ctx);
 
-	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
+	/*
+	 * We might be running in atomic context,
+	 * but the job must be run in non-atomic context.
+	 */
+	schedule_work(&m2m_dev->job_work);
+}
+
+/*
+ * Assumes job_spinlock is held, called from v4l2_m2m_job_finish() or
+ * v4l2_m2m_buf_done_and_job_finish().
+ */
+static bool _v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
+				 struct v4l2_m2m_ctx *m2m_ctx)
+{
 	if (!m2m_dev->curr_ctx || m2m_dev->curr_ctx != m2m_ctx) {
-		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 		dprintk("Called by an instance not currently running\n");
-		return;
+		return false;
 	}
 
 	list_del(&m2m_dev->curr_ctx->queue);
 	m2m_dev->curr_ctx->job_flags &= ~(TRANS_QUEUED | TRANS_RUNNING);
 	wake_up(&m2m_dev->curr_ctx->finished);
 	m2m_dev->curr_ctx = NULL;
+	return true;
+}
 
-	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
-
-	/* This instance might have more buffers ready, but since we do not
-	 * allow more than one job on the job_queue per instance, each has
-	 * to be scheduled separately after the previous one finishes. */
-	__v4l2_m2m_try_queue(m2m_dev, m2m_ctx);
+void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
+			 struct v4l2_m2m_ctx *m2m_ctx)
+{
+	unsigned long flags;
+	bool schedule_next;
 
-	/* We might be running in atomic context,
-	 * but the job must be run in non-atomic context.
+	/*
+	 * This function should not be used for drivers that support
+	 * holding capture buffers. Those should use
+	 * v4l2_m2m_buf_done_and_job_finish() instead.
 	 */
-	schedule_work(&m2m_dev->job_work);
+	WARN_ON(m2m_ctx->cap_q_ctx.q.subsystem_flags &
+		VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF);
+	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
+	schedule_next = _v4l2_m2m_job_finish(m2m_dev, m2m_ctx);
+	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
+
+	if (schedule_next)
+		v4l2_m2m_schedule_next_job(m2m_dev, m2m_ctx);
 }
 EXPORT_SYMBOL(v4l2_m2m_job_finish);
 
+void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
+				      struct v4l2_m2m_ctx *m2m_ctx,
+				      enum vb2_buffer_state state)
+{
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	bool schedule_next = false;
+	unsigned long flags;
+
+	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
+	src_buf = v4l2_m2m_src_buf_remove(m2m_ctx);
+	dst_buf = v4l2_m2m_next_dst_buf(m2m_ctx);
+
+	if (WARN_ON(!src_buf || !dst_buf))
+		goto unlock;
+	v4l2_m2m_buf_done(src_buf, state);
+	dst_buf->is_held = src_buf->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
+	if (!dst_buf->is_held) {
+		v4l2_m2m_dst_buf_remove(m2m_ctx);
+		v4l2_m2m_buf_done(dst_buf, state);
+	}
+	schedule_next = _v4l2_m2m_job_finish(m2m_dev, m2m_ctx);
+unlock:
+	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
+
+	if (schedule_next)
+		v4l2_m2m_schedule_next_job(m2m_dev, m2m_ctx);
+}
+EXPORT_SYMBOL(v4l2_m2m_buf_done_and_job_finish);
+
 int v4l2_m2m_reqbufs(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		     struct v4l2_requestbuffers *reqbufs)
 {
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 0b9c3a287061..229d9f5d4370 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -21,7 +21,8 @@
  *		callback.
  *		The job does NOT have to end before this callback returns
  *		(and it will be the usual case). When the job finishes,
- *		v4l2_m2m_job_finish() has to be called.
+ *		v4l2_m2m_job_finish() or v4l2_m2m_buf_done_and_job_finish()
+ *		has to be called.
  * @job_ready:	optional. Should return 0 if the driver does not have a job
  *		fully prepared to run yet (i.e. it will not be able to finish a
  *		transaction without sleeping). If not provided, it will be
@@ -33,7 +34,8 @@
  *		stop the device safely; e.g. in the next interrupt handler),
  *		even if the transaction would not have been finished by then.
  *		After the driver performs the necessary steps, it has to call
- *		v4l2_m2m_job_finish() (as if the transaction ended normally).
+ *		v4l2_m2m_job_finish() or v4l2_m2m_buf_done_and_job_finish() as
+ *		if the transaction ended normally.
  *		This function does not have to (and will usually not) wait
  *		until the device enters a state when it can be stopped.
  */
@@ -173,6 +175,33 @@ void v4l2_m2m_try_schedule(struct v4l2_m2m_ctx *m2m_ctx);
 void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
 			 struct v4l2_m2m_ctx *m2m_ctx);
 
+/**
+ * v4l2_m2m_buf_done_and_job_finish() - return source/destination buffers with
+ * state and inform the framework that a job has been finished and have it
+ * clean up
+ *
+ * @m2m_dev: opaque pointer to the internal data to handle M2M context
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ * @state: vb2 buffer state passed to v4l2_m2m_buf_done().
+ *
+ * Drivers that set V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF must use this
+ * function instead of job_finish() to take held buffers into account. It is
+ * optional for other drivers.
+ *
+ * This function removes the source buffer from the ready list and returns
+ * it with the given state. The same is done for the destination buffer, unless
+ * it is marked 'held'. In that case the buffer is kept on the ready list.
+ *
+ * After that the job is finished (see job_finish()).
+ *
+ * This allows for multiple output buffers to be used to fill in a single
+ * capture buffer. This is typically used by stateless decoders where
+ * multiple e.g. H.264 slices contribute to a single decoded frame.
+ */
+void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
+				      struct v4l2_m2m_ctx *m2m_ctx,
+				      enum vb2_buffer_state state);
+
 static inline void
 v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
 {
-- 
2.23.0

