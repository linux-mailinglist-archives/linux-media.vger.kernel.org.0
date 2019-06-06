Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC806373DA
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 14:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbfFFMLl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 08:11:41 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:35795 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726040AbfFFMLi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 08:11:38 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YrExhzc7c3qlsYrF2hma9U; Thu, 06 Jun 2019 14:11:36 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 9/9] vicodec: improve handling of ENC_CMD_STOP/START
Date:   Thu,  6 Jun 2019 14:11:31 +0200
Message-Id: <20190606121131.37110-10-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606121131.37110-1-hverkuil-cisco@xs4all.nl>
References: <20190606121131.37110-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfF8IrJ5MbVPIR6gyWP7iAau3S6ZwUN5Ek0hxsRNg/O3trIAdxqRi0Nu4U0JbqlsDS30hoWrW+xtaYDDzGiHb5e1yZ4Lon6vV7IApIaa+FvVQ9ZwIkMIr
 WT8FFnl1NcYawcqA9n0SswVWRAWX3Ej/cf0fHkuRKIKpGPfFbenlfa2E6vbgrqqZIyfDltuH5b2mGSL6tlsjHnFfq8EHXNTs4WhdKjYKK0/+AXW/y05Q1qp1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Correctly handle stopping and restarting the encoder, keeping
track of the stop and drain states.

In addition it adds correct handling of corner cases, allowing
v4l2-compliance to pass.

Unfortunately, the code is getting to be quite complicated, so
we need to work on better codec support in v4l2-mem2mem.c to
simplify drivers.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/vicodec/vicodec-core.c | 150 ++++++++++++++----
 1 file changed, 122 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
index 91cd0c1dbede..7e7c1e80f29f 100644
--- a/drivers/media/platform/vicodec/vicodec-core.c
+++ b/drivers/media/platform/vicodec/vicodec-core.c
@@ -117,12 +117,14 @@ struct vicodec_ctx {
 	struct vicodec_dev	*dev;
 	bool			is_enc;
 	bool			is_stateless;
+	bool			is_draining;
+	bool			next_is_last;
+	bool			has_stopped;
 	spinlock_t		*lock;
 
 	struct v4l2_ctrl_handler hdl;
 
 	struct vb2_v4l2_buffer *last_src_buf;
-	struct vb2_v4l2_buffer *last_dst_buf;
 
 	/* Source and destination queue data */
 	struct vicodec_q_data   q_data[2];
@@ -139,6 +141,10 @@ struct vicodec_ctx {
 	bool			source_changed;
 };
 
+static const struct v4l2_event vicodec_eos_event = {
+	.type = V4L2_EVENT_EOS
+};
+
 static inline struct vicodec_ctx *file2ctx(struct file *file)
 {
 	return container_of(file->private_data, struct vicodec_ctx, fh);
@@ -402,9 +408,6 @@ static enum vb2_buffer_state get_next_header(struct vicodec_ctx *ctx,
 /* device_run() - prepares and starts the device */
 static void device_run(void *priv)
 {
-	static const struct v4l2_event eos_event = {
-		.type = V4L2_EVENT_EOS
-	};
 	struct vicodec_ctx *ctx = priv;
 	struct vicodec_dev *dev = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
@@ -427,12 +430,12 @@ static void device_run(void *priv)
 	dst_buf->flags &= ~V4L2_BUF_FLAG_LAST;
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 
-	ctx->last_dst_buf = dst_buf;
-
 	spin_lock(ctx->lock);
 	if (!ctx->comp_has_next_frame && src_buf == ctx->last_src_buf) {
 		dst_buf->flags |= V4L2_BUF_FLAG_LAST;
-		v4l2_event_queue_fh(&ctx->fh, &eos_event);
+		v4l2_event_queue_fh(&ctx->fh, &vicodec_eos_event);
+		ctx->is_draining = false;
+		ctx->has_stopped = true;
 	}
 	if (ctx->is_enc || ctx->is_stateless) {
 		src_buf->sequence = q_src->sequence++;
@@ -583,6 +586,8 @@ static int job_ready(void *priv)
 	unsigned int max_to_copy;
 	unsigned int comp_frame_size;
 
+	if (ctx->has_stopped)
+		return 0;
 	if (ctx->source_changed)
 		return 0;
 	if (ctx->is_stateless || ctx->is_enc || ctx->comp_has_frame)
@@ -602,6 +607,8 @@ static int job_ready(void *priv)
 	if (ctx->header_size < sizeof(struct fwht_cframe_hdr)) {
 		state = get_next_header(ctx, &p, p_src + sz - p);
 		if (ctx->header_size < sizeof(struct fwht_cframe_hdr)) {
+			if (ctx->is_draining && src_buf == ctx->last_src_buf)
+				return 1;
 			job_remove_src_buf(ctx, state);
 			goto restart;
 		}
@@ -629,6 +636,8 @@ static int job_ready(void *priv)
 		p += copy;
 		ctx->comp_size += copy;
 		if (ctx->comp_size < max_to_copy) {
+			if (ctx->is_draining && src_buf == ctx->last_src_buf)
+				return 1;
 			job_remove_src_buf(ctx, state);
 			goto restart;
 		}
@@ -670,7 +679,6 @@ static int job_ready(void *priv)
 			v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
 		update_capture_data_from_header(ctx);
-		ctx->first_source_change_sent = true;
 		v4l2_event_queue_fh(&ctx->fh, &rs_event);
 		set_last_buffer(dst_buf, src_buf, ctx);
 		ctx->source_changed = true;
@@ -717,7 +725,8 @@ static int enum_fmt(struct v4l2_fmtdesc *f, struct vicodec_ctx *ctx,
 		const struct v4l2_fwht_pixfmt_info *info =
 					get_q_data(ctx, f->type)->info;
 
-		if (!info || ctx->is_enc)
+		if (ctx->is_enc ||
+		    !vb2_is_streaming(&ctx->fh.m2m_ctx->cap_q_ctx.q))
 			info = v4l2_fwht_get_pixfmt(f->index);
 		else
 			info = v4l2_fwht_find_nth_fmt(info->width_div,
@@ -768,9 +777,6 @@ static int vidioc_g_fmt(struct vicodec_ctx *ctx, struct v4l2_format *f)
 	q_data = get_q_data(ctx, f->type);
 	info = q_data->info;
 
-	if (!info)
-		info = v4l2_fwht_get_pixfmt(0);
-
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
@@ -1210,19 +1216,39 @@ static int vidioc_s_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static void vicodec_mark_last_buf(struct vicodec_ctx *ctx)
+static int vicodec_mark_last_buf(struct vicodec_ctx *ctx)
 {
-	static const struct v4l2_event eos_event = {
-		.type = V4L2_EVENT_EOS
-	};
+	struct vb2_v4l2_buffer *next_dst_buf;
+	int ret = 0;
 
 	spin_lock(ctx->lock);
+	if (ctx->is_draining) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+	if (ctx->has_stopped)
+		goto unlock;
+
 	ctx->last_src_buf = v4l2_m2m_last_src_buf(ctx->fh.m2m_ctx);
-	if (!ctx->last_src_buf && ctx->last_dst_buf) {
-		ctx->last_dst_buf->flags |= V4L2_BUF_FLAG_LAST;
-		v4l2_event_queue_fh(&ctx->fh, &eos_event);
+	ctx->is_draining = true;
+	if (ctx->last_src_buf)
+		goto unlock;
+
+	next_dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+	if (!next_dst_buf) {
+		ctx->next_is_last = true;
+		goto unlock;
 	}
+
+	next_dst_buf->flags |= V4L2_BUF_FLAG_LAST;
+	vb2_buffer_done(&next_dst_buf->vb2_buf, VB2_BUF_STATE_DONE);
+	ctx->is_draining = false;
+	ctx->has_stopped = true;
+	v4l2_event_queue_fh(&ctx->fh, &vicodec_eos_event);
+
+unlock:
 	spin_unlock(ctx->lock);
+	return ret;
 }
 
 static int vicodec_encoder_cmd(struct file *file, void *fh,
@@ -1235,8 +1261,22 @@ static int vicodec_encoder_cmd(struct file *file, void *fh,
 	if (ret < 0)
 		return ret;
 
-	vicodec_mark_last_buf(ctx);
-	return 0;
+	if (!vb2_is_streaming(&ctx->fh.m2m_ctx->cap_q_ctx.q) ||
+	    !vb2_is_streaming(&ctx->fh.m2m_ctx->out_q_ctx.q))
+		return 0;
+
+	if (ec->cmd == V4L2_ENC_CMD_STOP)
+		return vicodec_mark_last_buf(ctx);
+	ret = 0;
+	spin_lock(ctx->lock);
+	if (ctx->is_draining) {
+		ret = -EBUSY;
+	} else if (ctx->has_stopped) {
+		ctx->has_stopped = false;
+		vb2_clear_last_buffer_dequeued(&ctx->fh.m2m_ctx->cap_q_ctx.q);
+	}
+	spin_unlock(ctx->lock);
+	return ret;
 }
 
 static int vicodec_decoder_cmd(struct file *file, void *fh,
@@ -1249,8 +1289,22 @@ static int vicodec_decoder_cmd(struct file *file, void *fh,
 	if (ret < 0)
 		return ret;
 
-	vicodec_mark_last_buf(ctx);
-	return 0;
+	if (!vb2_is_streaming(&ctx->fh.m2m_ctx->cap_q_ctx.q) ||
+	    !vb2_is_streaming(&ctx->fh.m2m_ctx->out_q_ctx.q))
+		return 0;
+
+	if (dc->cmd == V4L2_DEC_CMD_STOP)
+		return vicodec_mark_last_buf(ctx);
+	ret = 0;
+	spin_lock(ctx->lock);
+	if (ctx->is_draining) {
+		ret = -EBUSY;
+	} else if (ctx->has_stopped) {
+		ctx->has_stopped = false;
+		vb2_clear_last_buffer_dequeued(&ctx->fh.m2m_ctx->cap_q_ctx.q);
+	}
+	spin_unlock(ctx->lock);
+	return ret;
 }
 
 static int vicodec_enum_framesizes(struct file *file, void *fh,
@@ -1423,6 +1477,25 @@ static void vicodec_buf_queue(struct vb2_buffer *vb)
 		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
 	};
 
+	if (vb2_is_streaming(vq_cap)) {
+		if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type) &&
+		    ctx->next_is_last) {
+			unsigned int i;
+
+			for (i = 0; i < vb->num_planes; i++)
+				vb->planes[i].bytesused = 0;
+			vbuf->flags = V4L2_BUF_FLAG_LAST;
+			vbuf->field = V4L2_FIELD_NONE;
+			vbuf->sequence = get_q_data(ctx, vb->vb2_queue->type)->sequence++;
+			vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
+			ctx->is_draining = false;
+			ctx->has_stopped = true;
+			ctx->next_is_last = false;
+			v4l2_event_queue_fh(&ctx->fh, &vicodec_eos_event);
+			return;
+		}
+	}
+
 	/* buf_queue handles only the first source change event */
 	if (ctx->first_source_change_sent) {
 		v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
@@ -1530,16 +1603,11 @@ static int vicodec_start_streaming(struct vb2_queue *q,
 	unsigned int total_planes_size;
 	u8 *new_comp_frame = NULL;
 
-	if (!info)
-		return -EINVAL;
-
 	chroma_div = info->width_div * info->height_div;
 	q_data->sequence = 0;
 
 	if (V4L2_TYPE_IS_OUTPUT(q->type))
 		ctx->last_src_buf = NULL;
-	else
-		ctx->last_dst_buf = NULL;
 
 	state->gop_cnt = 0;
 
@@ -1615,6 +1683,32 @@ static void vicodec_stop_streaming(struct vb2_queue *q)
 
 	vicodec_return_bufs(q, VB2_BUF_STATE_ERROR);
 
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		if (ctx->is_draining) {
+			struct vb2_v4l2_buffer *next_dst_buf;
+
+			spin_lock(ctx->lock);
+			ctx->last_src_buf = NULL;
+			next_dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+			if (!next_dst_buf) {
+				ctx->next_is_last = true;
+			} else {
+				next_dst_buf->flags |= V4L2_BUF_FLAG_LAST;
+				vb2_buffer_done(&next_dst_buf->vb2_buf, VB2_BUF_STATE_DONE);
+				ctx->is_draining = false;
+				ctx->has_stopped = true;
+				v4l2_event_queue_fh(&ctx->fh, &vicodec_eos_event);
+			}
+			spin_unlock(ctx->lock);
+		}
+	} else {
+		ctx->is_draining = false;
+		ctx->has_stopped = false;
+		ctx->next_is_last = false;
+	}
+	if (!ctx->is_enc && V4L2_TYPE_IS_OUTPUT(q->type))
+		ctx->first_source_change_sent = false;
+
 	if ((!V4L2_TYPE_IS_OUTPUT(q->type) && !ctx->is_enc) ||
 	    (V4L2_TYPE_IS_OUTPUT(q->type) && ctx->is_enc)) {
 		if (!ctx->is_stateless)
-- 
2.20.1

