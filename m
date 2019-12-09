Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92E7F116CFD
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 13:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727715AbfLIMVD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 07:21:03 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36818 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727554AbfLIMUf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 07:20:35 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so14696914wma.1
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2019 04:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6O33bazV0D/HL/rWD7a2aB0z7qlA5D8z3BxegqrjqrE=;
        b=je6fVmXRkGD/74Y+pA+i03hMy1KTkQsEPQhLioisonmyOx3/E0sDKVzqli2AkTeHrK
         E24yQmRevOgDYd9d/ryyAsT6+CFiepOrx+eydMG2xSb2rRlYebSyrEwVo0lKY/nHT7NP
         JPe+YeUiQCDQw4ns/0ThAriILSYsb5eQk+Sp6IHVWSIOSGCsdMtGE2syB65Z1Gky+dOe
         vkTI7I0Ze1rUA/1MpZ5zgaJXKP8r0GcfUvuNL2J4FrPTzni7ZCXU++07heIisKn4P5b6
         mwpzqd7jhKRtOblHOpQWQAWpcTj5RZGNNUM0kEEQMaEx1Cd5XBf42Brim/8pjgxbx+/H
         HQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6O33bazV0D/HL/rWD7a2aB0z7qlA5D8z3BxegqrjqrE=;
        b=Q8tb00a2i3XF1baseWeveDkjJonmxkPlfAKrN5FLXFFur6GgxLieFh5mFYtBGZ6GL9
         8QGGnCTJIBCfG6uk9v8pao1bWuRNEFNHjAah8tGDUfny04qbTy049NpRBeYkkllqa4xD
         mMJsvDLB9hi0ccTp7hfA6PVhuSbNZDL1cUd9lx8d2yXj3nsbfpx1CCWh7WOxKLNMQXLB
         QbwpIwwMbKWlhopsZ0WS499nJsUC7xOGdOB3cdpZUvodz8BoD64IdKdwOVAo1LTGZU7h
         /rfVNnmzuRnK35niMjANpP84kJdaK2rlreMzvScrK8UuCN+S8sIeJsv4+tUNIsJTIPL0
         iBDg==
X-Gm-Message-State: APjAAAWjBEUGIertqM6kORSwBe7Uyb3FmG40T1beuVafLtiJbWy7S7pp
        t+n5O9FcucDIPE/XWqncrh8yCg==
X-Google-Smtp-Source: APXvYqyXwrxsrJO0WeI3S94iV7g79KWjCPyc6AbuoDXoWQM6mDl+tkUwi2U9Z3x5LoX167JEWAZx1w==
X-Received: by 2002:a1c:3d8a:: with SMTP id k132mr24396542wma.144.1575894032959;
        Mon, 09 Dec 2019 04:20:32 -0800 (PST)
Received: from bender.baylibre.local (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id u18sm27066949wrt.26.2019.12.09.04.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 04:20:32 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Maxime Jourdan <mjourdan@baylibre.com>
Subject: [PATCH v3 2/4] media: vicodec: use v4l2-mem2mem draining, stopped and next-buf-is-last states handling
Date:   Mon,  9 Dec 2019 13:20:26 +0100
Message-Id: <20191209122028.13714-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191209122028.13714-1-narmstrong@baylibre.com>
References: <20191209122028.13714-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the previously introduced v4l2-mem2mem core APIs to handle the drainig,
stopped and next-buf-is-last states.

With these changes, the v4l2-compliance still passes with the following
commands :
# v4l2-ctl --stream-mmap --stream-out-mmap --stream-to-hdr out.comp --stream-from in.yuv
>>>><><><><><><><><><><><><><><><><>< 15.53 fps
 15.53 fps
><><><><><><><><><><><><>< 13.99 fps
 13.99 fps
><><><><><><><><><><><>< 13.52 fps
 13.52 fps
><><><><><><><><><><><><>< 13.41 fps
 13.41 fps
><><><><><><><><><><><><>< 13.21 fps
 13.21 fps
><><><><><><><><><><><>< 13.09 fps
 13.09 fps
><><><><><><><
STOP ENCODER
<<<
EOS EVENT

# v4l2-compliance --stream-from in.yuv -s
v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits
[...]
Total for vicodec device /dev/video0: 50, Succeeded: 50, Failed: 0, Warnings: 0

The full output is available at [1]

# v4l2-compliance -d1 --stream-from-hdr out.comp -s
v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits
[...]
Total for vicodec device /dev/video1: 50, Succeeded: 50, Failed: 0, Warnings: 0

The full output is available at [2]

No functional changes should be noticed.

[1] https://termbin.com/25nn
[2] https://termbin.com/dza4

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Suggested-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/platform/vicodec/vicodec-core.c | 154 +++++-------------
 1 file changed, 44 insertions(+), 110 deletions(-)

diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
index 82350097503e..5606dbd7cf4d 100644
--- a/drivers/media/platform/vicodec/vicodec-core.c
+++ b/drivers/media/platform/vicodec/vicodec-core.c
@@ -117,15 +117,10 @@ struct vicodec_ctx {
 	struct vicodec_dev	*dev;
 	bool			is_enc;
 	bool			is_stateless;
-	bool			is_draining;
-	bool			next_is_last;
-	bool			has_stopped;
 	spinlock_t		*lock;
 
 	struct v4l2_ctrl_handler hdl;
 
-	struct vb2_v4l2_buffer *last_src_buf;
-
 	/* Source and destination queue data */
 	struct vicodec_q_data   q_data[2];
 	struct v4l2_fwht_state	state;
@@ -431,11 +426,11 @@ static void device_run(void *priv)
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 
 	spin_lock(ctx->lock);
-	if (!ctx->comp_has_next_frame && src_buf == ctx->last_src_buf) {
+	if (!ctx->comp_has_next_frame &&
+	    v4l2_m2m_is_last_draining_src_buf(ctx->fh.m2m_ctx, src_buf)) {
 		dst_buf->flags |= V4L2_BUF_FLAG_LAST;
 		v4l2_event_queue_fh(&ctx->fh, &vicodec_eos_event);
-		ctx->is_draining = false;
-		ctx->has_stopped = true;
+		v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
 	}
 	if (ctx->is_enc || ctx->is_stateless) {
 		src_buf->sequence = q_src->sequence++;
@@ -586,8 +581,6 @@ static int job_ready(void *priv)
 	unsigned int max_to_copy;
 	unsigned int comp_frame_size;
 
-	if (ctx->has_stopped)
-		return 0;
 	if (ctx->source_changed)
 		return 0;
 	if (ctx->is_stateless || ctx->is_enc || ctx->comp_has_frame)
@@ -607,7 +600,8 @@ static int job_ready(void *priv)
 	if (ctx->header_size < sizeof(struct fwht_cframe_hdr)) {
 		state = get_next_header(ctx, &p, p_src + sz - p);
 		if (ctx->header_size < sizeof(struct fwht_cframe_hdr)) {
-			if (ctx->is_draining && src_buf == ctx->last_src_buf)
+			if (v4l2_m2m_is_last_draining_src_buf(ctx->fh.m2m_ctx,
+							      src_buf))
 				return 1;
 			job_remove_src_buf(ctx, state);
 			goto restart;
@@ -636,7 +630,8 @@ static int job_ready(void *priv)
 		p += copy;
 		ctx->comp_size += copy;
 		if (ctx->comp_size < max_to_copy) {
-			if (ctx->is_draining && src_buf == ctx->last_src_buf)
+			if (v4l2_m2m_is_last_draining_src_buf(ctx->fh.m2m_ctx,
+							      src_buf))
 				return 1;
 			job_remove_src_buf(ctx, state);
 			goto restart;
@@ -1219,41 +1214,6 @@ static int vidioc_s_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int vicodec_mark_last_buf(struct vicodec_ctx *ctx)
-{
-	struct vb2_v4l2_buffer *next_dst_buf;
-	int ret = 0;
-
-	spin_lock(ctx->lock);
-	if (ctx->is_draining) {
-		ret = -EBUSY;
-		goto unlock;
-	}
-	if (ctx->has_stopped)
-		goto unlock;
-
-	ctx->last_src_buf = v4l2_m2m_last_src_buf(ctx->fh.m2m_ctx);
-	ctx->is_draining = true;
-	if (ctx->last_src_buf)
-		goto unlock;
-
-	next_dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
-	if (!next_dst_buf) {
-		ctx->next_is_last = true;
-		goto unlock;
-	}
-
-	next_dst_buf->flags |= V4L2_BUF_FLAG_LAST;
-	vb2_buffer_done(&next_dst_buf->vb2_buf, VB2_BUF_STATE_DONE);
-	ctx->is_draining = false;
-	ctx->has_stopped = true;
-	v4l2_event_queue_fh(&ctx->fh, &vicodec_eos_event);
-
-unlock:
-	spin_unlock(ctx->lock);
-	return ret;
-}
-
 static int vicodec_encoder_cmd(struct file *file, void *fh,
 			    struct v4l2_encoder_cmd *ec)
 {
@@ -1268,18 +1228,15 @@ static int vicodec_encoder_cmd(struct file *file, void *fh,
 	    !vb2_is_streaming(&ctx->fh.m2m_ctx->out_q_ctx.q))
 		return 0;
 
-	if (ec->cmd == V4L2_ENC_CMD_STOP)
-		return vicodec_mark_last_buf(ctx);
-	ret = 0;
-	spin_lock(ctx->lock);
-	if (ctx->is_draining) {
-		ret = -EBUSY;
-	} else if (ctx->has_stopped) {
-		ctx->has_stopped = false;
+	ret = v4l2_m2m_ioctl_encoder_cmd(file, fh, ec);
+	if (ret < 0)
+		return ret;
+
+	if (ec->cmd == V4L2_ENC_CMD_START &&
+	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
 		vb2_clear_last_buffer_dequeued(&ctx->fh.m2m_ctx->cap_q_ctx.q);
-	}
-	spin_unlock(ctx->lock);
-	return ret;
+
+	return 0;
 }
 
 static int vicodec_decoder_cmd(struct file *file, void *fh,
@@ -1296,18 +1253,15 @@ static int vicodec_decoder_cmd(struct file *file, void *fh,
 	    !vb2_is_streaming(&ctx->fh.m2m_ctx->out_q_ctx.q))
 		return 0;
 
-	if (dc->cmd == V4L2_DEC_CMD_STOP)
-		return vicodec_mark_last_buf(ctx);
-	ret = 0;
-	spin_lock(ctx->lock);
-	if (ctx->is_draining) {
-		ret = -EBUSY;
-	} else if (ctx->has_stopped) {
-		ctx->has_stopped = false;
+	ret = v4l2_m2m_ioctl_decoder_cmd(file, fh, dc);
+	if (ret < 0)
+		return ret;
+
+	if (dc->cmd == V4L2_DEC_CMD_START &&
+	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
 		vb2_clear_last_buffer_dequeued(&ctx->fh.m2m_ctx->cap_q_ctx.q);
-	}
-	spin_unlock(ctx->lock);
-	return ret;
+
+	return 0;
 }
 
 static int vicodec_enum_framesizes(struct file *file, void *fh,
@@ -1480,23 +1434,21 @@ static void vicodec_buf_queue(struct vb2_buffer *vb)
 		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
 	};
 
-	if (vb2_is_streaming(vq_cap)) {
-		if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type) &&
-		    ctx->next_is_last) {
-			unsigned int i;
+	if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type) &&
+	    vb2_is_streaming(vb->vb2_queue) &&
+	    v4l2_m2m_dst_buf_is_last(ctx->fh.m2m_ctx)) {
+		unsigned int i;
 
-			for (i = 0; i < vb->num_planes; i++)
-				vb->planes[i].bytesused = 0;
-			vbuf->flags = V4L2_BUF_FLAG_LAST;
-			vbuf->field = V4L2_FIELD_NONE;
-			vbuf->sequence = get_q_data(ctx, vb->vb2_queue->type)->sequence++;
-			vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
-			ctx->is_draining = false;
-			ctx->has_stopped = true;
-			ctx->next_is_last = false;
-			v4l2_event_queue_fh(&ctx->fh, &vicodec_eos_event);
-			return;
-		}
+		for (i = 0; i < vb->num_planes; i++)
+			vb->planes[i].bytesused = 0;
+
+		vbuf->field = V4L2_FIELD_NONE;
+		vbuf->sequence =
+			get_q_data(ctx, vb->vb2_queue->type)->sequence++;
+
+		v4l2_m2m_last_buffer_done(ctx->fh.m2m_ctx, vbuf);
+		v4l2_event_queue_fh(&ctx->fh, &vicodec_eos_event);
+		return;
 	}
 
 	/* buf_queue handles only the first source change event */
@@ -1609,8 +1561,7 @@ static int vicodec_start_streaming(struct vb2_queue *q,
 	chroma_div = info->width_div * info->height_div;
 	q_data->sequence = 0;
 
-	if (V4L2_TYPE_IS_OUTPUT(q->type))
-		ctx->last_src_buf = NULL;
+	v4l2_m2m_start_streaming(ctx->fh.m2m_ctx, q);
 
 	state->gop_cnt = 0;
 
@@ -1689,29 +1640,12 @@ static void vicodec_stop_streaming(struct vb2_queue *q)
 
 	vicodec_return_bufs(q, VB2_BUF_STATE_ERROR);
 
-	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
-		if (ctx->is_draining) {
-			struct vb2_v4l2_buffer *next_dst_buf;
-
-			spin_lock(ctx->lock);
-			ctx->last_src_buf = NULL;
-			next_dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
-			if (!next_dst_buf) {
-				ctx->next_is_last = true;
-			} else {
-				next_dst_buf->flags |= V4L2_BUF_FLAG_LAST;
-				vb2_buffer_done(&next_dst_buf->vb2_buf, VB2_BUF_STATE_DONE);
-				ctx->is_draining = false;
-				ctx->has_stopped = true;
-				v4l2_event_queue_fh(&ctx->fh, &vicodec_eos_event);
-			}
-			spin_unlock(ctx->lock);
-		}
-	} else {
-		ctx->is_draining = false;
-		ctx->has_stopped = false;
-		ctx->next_is_last = false;
-	}
+	v4l2_m2m_stop_streaming(ctx->fh.m2m_ctx, q);
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type) &&
+	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
+		v4l2_event_queue_fh(&ctx->fh, &vicodec_eos_event);
+
 	if (!ctx->is_enc && V4L2_TYPE_IS_OUTPUT(q->type))
 		ctx->first_source_change_sent = false;
 
-- 
2.22.0

