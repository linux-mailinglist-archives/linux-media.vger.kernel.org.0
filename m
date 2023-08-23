Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E90D785A62
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 16:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236368AbjHWOYP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 10:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236367AbjHWOYP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 10:24:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB61EE76
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 07:24:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 58F7066392
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 14:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A61C433C7;
        Wed, 23 Aug 2023 14:24:05 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 3/3] media: v4l2-mem2mem.h: move codec bits to v4l2-mem2mem-codec.h
Date:   Wed, 23 Aug 2023 16:23:59 +0200
Message-Id: <20230823142359.602411-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230823142359.602411-1-hverkuil-cisco@xs4all.nl>
References: <20230823142359.602411-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the codec-specific parts to v4l2-mem2mem-codec.h now
that all codec drivers include this new header.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 include/media/v4l2-mem2mem-codec.h | 172 +++++++++++++++++++++++++++++
 include/media/v4l2-mem2mem.h       | 171 ----------------------------
 2 files changed, 172 insertions(+), 171 deletions(-)

diff --git a/include/media/v4l2-mem2mem-codec.h b/include/media/v4l2-mem2mem-codec.h
index 6e3d75fd4017..9508e3a2efaf 100644
--- a/include/media/v4l2-mem2mem-codec.h
+++ b/include/media/v4l2-mem2mem-codec.h
@@ -12,4 +12,176 @@
 
 #include <media/v4l2-mem2mem.h>
 
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
+/**
+ * v4l2_m2m_clear_state() - clear encoding/decoding state
+ *
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ */
+static inline void
+v4l2_m2m_clear_state(struct v4l2_m2m_ctx *m2m_ctx)
+{
+	m2m_ctx->next_buf_last = false;
+	m2m_ctx->is_draining = false;
+	m2m_ctx->has_stopped = false;
+}
+
+/**
+ * v4l2_m2m_mark_stopped() - set current encoding/decoding state as stopped
+ *
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ */
+static inline void
+v4l2_m2m_mark_stopped(struct v4l2_m2m_ctx *m2m_ctx)
+{
+	m2m_ctx->next_buf_last = false;
+	m2m_ctx->is_draining = false;
+	m2m_ctx->has_stopped = true;
+}
+
+/**
+ * v4l2_m2m_dst_buf_is_last() - return the current encoding/decoding session
+ * draining management state of next queued capture buffer
+ *
+ * This last capture buffer should be tagged with V4L2_BUF_FLAG_LAST to notify
+ * the end of the capture session.
+ *
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ */
+static inline bool
+v4l2_m2m_dst_buf_is_last(struct v4l2_m2m_ctx *m2m_ctx)
+{
+	return m2m_ctx->is_draining && m2m_ctx->next_buf_last;
+}
+
+/**
+ * v4l2_m2m_has_stopped() - return the current encoding/decoding session
+ * stopped state
+ *
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ */
+static inline bool
+v4l2_m2m_has_stopped(struct v4l2_m2m_ctx *m2m_ctx)
+{
+	return m2m_ctx->has_stopped;
+}
+
+/**
+ * v4l2_m2m_is_last_draining_src_buf() - return the output buffer draining
+ * state in the current encoding/decoding session
+ *
+ * This will identify the last output buffer queued before a session stop
+ * was required, leading to an actual encoding/decoding session stop state
+ * in the encoding/decoding process after being processed.
+ *
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ * @vbuf: pointer to struct &v4l2_buffer
+ */
+static inline bool
+v4l2_m2m_is_last_draining_src_buf(struct v4l2_m2m_ctx *m2m_ctx,
+				  struct vb2_v4l2_buffer *vbuf)
+{
+	return m2m_ctx->is_draining && vbuf == m2m_ctx->last_src_buf;
+}
+
+/**
+ * v4l2_m2m_last_buffer_done() - marks the buffer with LAST flag and DONE
+ *
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ * @vbuf: pointer to struct &v4l2_buffer
+ */
+void v4l2_m2m_last_buffer_done(struct v4l2_m2m_ctx *m2m_ctx,
+			       struct vb2_v4l2_buffer *vbuf);
+
+/**
+ * v4l2_m2m_update_start_streaming_state() - update the encoding/decoding
+ * session state when a start of streaming of a video queue is requested
+ *
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ * @q: queue
+ */
+void v4l2_m2m_update_start_streaming_state(struct v4l2_m2m_ctx *m2m_ctx,
+					   struct vb2_queue *q);
+
+/**
+ * v4l2_m2m_update_stop_streaming_state() -  update the encoding/decoding
+ * session state when a stop of streaming of a video queue is requested
+ *
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ * @q: queue
+ */
+void v4l2_m2m_update_stop_streaming_state(struct v4l2_m2m_ctx *m2m_ctx,
+					  struct vb2_queue *q);
+
+/**
+ * v4l2_m2m_encoder_cmd() - execute an encoder command
+ *
+ * @file: pointer to struct &file
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ * @ec: pointer to the encoder command
+ */
+int v4l2_m2m_encoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
+			 struct v4l2_encoder_cmd *ec);
+
+/**
+ * v4l2_m2m_decoder_cmd() - execute a decoder command
+ *
+ * @file: pointer to struct &file
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ * @dc: pointer to the decoder command
+ */
+int v4l2_m2m_decoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
+			 struct v4l2_decoder_cmd *dc);
+
+static inline void v4l2_m2m_set_src_buffered(struct v4l2_m2m_ctx *m2m_ctx,
+					     bool buffered)
+{
+	m2m_ctx->out_q_ctx.buffered = buffered;
+}
+
+static inline void v4l2_m2m_set_dst_buffered(struct v4l2_m2m_ctx *m2m_ctx,
+					     bool buffered)
+{
+	m2m_ctx->cap_q_ctx.buffered = buffered;
+}
+
+int v4l2_m2m_ioctl_encoder_cmd(struct file *file, void *fh,
+			       struct v4l2_encoder_cmd *ec);
+int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *fh,
+			       struct v4l2_decoder_cmd *dc);
+int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *fh,
+				   struct v4l2_encoder_cmd *ec);
+int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
+				   struct v4l2_decoder_cmd *dc);
+int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh,
+					     struct v4l2_decoder_cmd *dc);
+int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
+					 struct v4l2_decoder_cmd *dc);
+
 #endif /* _MEDIA_V4L2_MEM2MEM_CODEC_H */
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index cebadec49666..f99703f4b43f 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -190,119 +190,12 @@ void v4l2_m2m_try_schedule(struct v4l2_m2m_ctx *m2m_ctx);
 void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
 			 struct v4l2_m2m_ctx *m2m_ctx);
 
-/**
- * v4l2_m2m_buf_done_and_job_finish() - return source/destination buffers with
- * state and inform the framework that a job has been finished and have it
- * clean up
- *
- * @m2m_dev: opaque pointer to the internal data to handle M2M context
- * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
- * @state: vb2 buffer state passed to v4l2_m2m_buf_done().
- *
- * Drivers that set V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF must use this
- * function instead of job_finish() to take held buffers into account. It is
- * optional for other drivers.
- *
- * This function removes the source buffer from the ready list and returns
- * it with the given state. The same is done for the destination buffer, unless
- * it is marked 'held'. In that case the buffer is kept on the ready list.
- *
- * After that the job is finished (see job_finish()).
- *
- * This allows for multiple output buffers to be used to fill in a single
- * capture buffer. This is typically used by stateless decoders where
- * multiple e.g. H.264 slices contribute to a single decoded frame.
- */
-void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
-				      struct v4l2_m2m_ctx *m2m_ctx,
-				      enum vb2_buffer_state state);
-
 static inline void
 v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
 {
 	vb2_buffer_done(&buf->vb2_buf, state);
 }
 
-/**
- * v4l2_m2m_clear_state() - clear encoding/decoding state
- *
- * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
- */
-static inline void
-v4l2_m2m_clear_state(struct v4l2_m2m_ctx *m2m_ctx)
-{
-	m2m_ctx->next_buf_last = false;
-	m2m_ctx->is_draining = false;
-	m2m_ctx->has_stopped = false;
-}
-
-/**
- * v4l2_m2m_mark_stopped() - set current encoding/decoding state as stopped
- *
- * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
- */
-static inline void
-v4l2_m2m_mark_stopped(struct v4l2_m2m_ctx *m2m_ctx)
-{
-	m2m_ctx->next_buf_last = false;
-	m2m_ctx->is_draining = false;
-	m2m_ctx->has_stopped = true;
-}
-
-/**
- * v4l2_m2m_dst_buf_is_last() - return the current encoding/decoding session
- * draining management state of next queued capture buffer
- *
- * This last capture buffer should be tagged with V4L2_BUF_FLAG_LAST to notify
- * the end of the capture session.
- *
- * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
- */
-static inline bool
-v4l2_m2m_dst_buf_is_last(struct v4l2_m2m_ctx *m2m_ctx)
-{
-	return m2m_ctx->is_draining && m2m_ctx->next_buf_last;
-}
-
-/**
- * v4l2_m2m_has_stopped() - return the current encoding/decoding session
- * stopped state
- *
- * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
- */
-static inline bool
-v4l2_m2m_has_stopped(struct v4l2_m2m_ctx *m2m_ctx)
-{
-	return m2m_ctx->has_stopped;
-}
-
-/**
- * v4l2_m2m_is_last_draining_src_buf() - return the output buffer draining
- * state in the current encoding/decoding session
- *
- * This will identify the last output buffer queued before a session stop
- * was required, leading to an actual encoding/decoding session stop state
- * in the encoding/decoding process after being processed.
- *
- * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
- * @vbuf: pointer to struct &v4l2_buffer
- */
-static inline bool
-v4l2_m2m_is_last_draining_src_buf(struct v4l2_m2m_ctx *m2m_ctx,
-				  struct vb2_v4l2_buffer *vbuf)
-{
-	return m2m_ctx->is_draining && vbuf == m2m_ctx->last_src_buf;
-}
-
-/**
- * v4l2_m2m_last_buffer_done() - marks the buffer with LAST flag and DONE
- *
- * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
- * @vbuf: pointer to struct &v4l2_buffer
- */
-void v4l2_m2m_last_buffer_done(struct v4l2_m2m_ctx *m2m_ctx,
-			       struct vb2_v4l2_buffer *vbuf);
-
 /**
  * v4l2_m2m_suspend() - stop new jobs from being run and wait for current job
  * to finish
@@ -422,46 +315,6 @@ int v4l2_m2m_streamon(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 int v4l2_m2m_streamoff(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		       enum v4l2_buf_type type);
 
-/**
- * v4l2_m2m_update_start_streaming_state() - update the encoding/decoding
- * session state when a start of streaming of a video queue is requested
- *
- * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
- * @q: queue
- */
-void v4l2_m2m_update_start_streaming_state(struct v4l2_m2m_ctx *m2m_ctx,
-					   struct vb2_queue *q);
-
-/**
- * v4l2_m2m_update_stop_streaming_state() -  update the encoding/decoding
- * session state when a stop of streaming of a video queue is requested
- *
- * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
- * @q: queue
- */
-void v4l2_m2m_update_stop_streaming_state(struct v4l2_m2m_ctx *m2m_ctx,
-					  struct vb2_queue *q);
-
-/**
- * v4l2_m2m_encoder_cmd() - execute an encoder command
- *
- * @file: pointer to struct &file
- * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
- * @ec: pointer to the encoder command
- */
-int v4l2_m2m_encoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
-			 struct v4l2_encoder_cmd *ec);
-
-/**
- * v4l2_m2m_decoder_cmd() - execute a decoder command
- *
- * @file: pointer to struct &file
- * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
- * @dc: pointer to the decoder command
- */
-int v4l2_m2m_decoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
-			 struct v4l2_decoder_cmd *dc);
-
 /**
  * v4l2_m2m_poll() - poll replacement, for destination buffers only
  *
@@ -551,18 +404,6 @@ struct v4l2_m2m_ctx *v4l2_m2m_ctx_init(struct v4l2_m2m_dev *m2m_dev,
 		void *drv_priv,
 		int (*queue_init)(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq));
 
-static inline void v4l2_m2m_set_src_buffered(struct v4l2_m2m_ctx *m2m_ctx,
-					     bool buffered)
-{
-	m2m_ctx->out_q_ctx.buffered = buffered;
-}
-
-static inline void v4l2_m2m_set_dst_buffered(struct v4l2_m2m_ctx *m2m_ctx,
-					     bool buffered)
-{
-	m2m_ctx->cap_q_ctx.buffered = buffered;
-}
-
 /**
  * v4l2_m2m_ctx_release() - release m2m context
  *
@@ -873,18 +714,6 @@ int v4l2_m2m_ioctl_streamon(struct file *file, void *fh,
 				enum v4l2_buf_type type);
 int v4l2_m2m_ioctl_streamoff(struct file *file, void *fh,
 				enum v4l2_buf_type type);
-int v4l2_m2m_ioctl_encoder_cmd(struct file *file, void *fh,
-			       struct v4l2_encoder_cmd *ec);
-int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *fh,
-			       struct v4l2_decoder_cmd *dc);
-int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *fh,
-				   struct v4l2_encoder_cmd *ec);
-int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
-				   struct v4l2_decoder_cmd *dc);
-int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh,
-					     struct v4l2_decoder_cmd *dc);
-int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
-					 struct v4l2_decoder_cmd *dc);
 int v4l2_m2m_fop_mmap(struct file *file, struct vm_area_struct *vma);
 __poll_t v4l2_m2m_fop_poll(struct file *file, poll_table *wait);
 
-- 
2.40.1

