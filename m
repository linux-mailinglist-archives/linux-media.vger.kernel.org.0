Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D857113DBF0
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2020 14:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgAPNac (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jan 2020 08:30:32 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36482 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgAPNab (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jan 2020 08:30:31 -0500
Received: by mail-wr1-f65.google.com with SMTP id z3so19177056wru.3
        for <linux-media@vger.kernel.org>; Thu, 16 Jan 2020 05:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XJn3I1WlgT9+Tx+iEjfyYvI1RbkbtewFYhNZjpUf2a4=;
        b=iWkmqg/+xVBR9eEyVHl4tESETPOnNS/rInLMkO3h7gQ/a3fBVlGUP+Yvc6OmbAMqgD
         Nr84egpACCoaBSUOfeJy4VRaZBjQzWPfFe6zPvwEOwJ9D/5nwBn99V8HP0P1R2rglKJ2
         Xq+yXiYWQ4IhmUWWBKKe3kNqSsvm7/Y1AmzrJpj8f1CFKf7qiRKoOroteQo+aqbtZj0U
         k9DTDlswzS0wBPV/kkE/PR9KP13NdWWaMKjdXfJ1tP1BX30NFQB0Y6O22nC69oHwqBTK
         VNeuwRCqBvu7UZy0ni52+7A6sly82ITv2AHBs/x20vBrBcWUUxI65AwXqXgicDDEf5sf
         AdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XJn3I1WlgT9+Tx+iEjfyYvI1RbkbtewFYhNZjpUf2a4=;
        b=j9RDYobWMSfeZWJzPEhlRJhz9aBH0GRThY5ipvtUKqAepWF8++MmbNx9InzxaFWzCD
         XKQl6YfEektbBTUKC63kQrvl8BQrkfrXJQwATw7QnN8PWrH6qZJIF6DSok0NWPdZp3Bc
         CAYKA8VbARrvrM31FT3y1DYRNkmkW84bTE4MFkm3botp9lQa0WzIKGIoH+VI/6qpRCPf
         9Fu92ox2/YolieIYtc0bIMBIHHFX/PgZBVA4JPZCd7J0R6kPdEZi8uinMc4fZzFqkD3R
         ZIpwK6YgraiyyPwXb9YKlofKpoa+rMqrCa6tH0wZokt4s2yzuyuNOS+QTiaEJBbLxXO5
         g/hA==
X-Gm-Message-State: APjAAAVAiEK4v+QbER1GOGggYx8aPndVaBfd4UYDEtnLyenVdEi+l9nU
        qVqp8fdmz4eFbqSo14/Og+l9QQ==
X-Google-Smtp-Source: APXvYqyOHG4Pc1aqf8IJIccuL8z6hg/6UmiFl+l+ebha9hdCCQW4p7JLTo1X6q34y6HY2g2bKlIMqg==
X-Received: by 2002:adf:fe12:: with SMTP id n18mr3288982wrr.158.1579181428853;
        Thu, 16 Jan 2020 05:30:28 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id e16sm29256898wrs.73.2020.01.16.05.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 05:30:27 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] media: v4l2-mem2mem: handle draining, stopped and next-buf-is-last states
Date:   Thu, 16 Jan 2020 14:30:22 +0100
Message-Id: <20200116133025.1903-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200116133025.1903-1-narmstrong@baylibre.com>
References: <20200116133025.1903-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since the draining and stop phase of the HW decoder mem2mem bahaviour is
now clearly defined, we can move handling of the following states to the
common v4l2-mem2mem core code:
- draining
- stopped
- next-buf-is-last

By introducing the following v4l2-mem2mem APIS:
- v4l2_m2m_encoder_cmd/v4l2_m2m_ioctl_encoder_cmd to handle start/stop command
- v4l2_m2m_decoder_cmd/v4l2_m2m_ioctl_decoder_cmd to handle start/stop command
- v4l2_m2m_start_streaming to handle start of streaming of the de/encoder queue
- v4l2_m2m_stop_streaming to handle stop of streaming of the de/encoder queue
- v4l2_m2m_last_buffer_done to maek the current dest buffer as the last one

And inline helpers:
- v4l2_m2m_mark_stopped to mark the de/encoding process as stopped
- v4l2_m2m_clear_state to clear the de/encoding state
- v4l2_m2m_dst_buf_is_last to detect the current dequeud dst_buf is the last
- v4l2_m2m_has_stopped to detect the de/encoding stopped state
- v4l2_m2m_is_last_draining_src_buf to detect the currect source buffer should
 be the last processing before stopping the de/encoding process

The special next-buf-is-last when min_buffers != 1 case is also handled
in v4l2_m2m_qbuf() by reusing the other introduced APIs.

This state management has been stolen from the vicodec implementation,
and is no-op for drivers not calling the v4l2_m2m_encoder_cmd or
v4l2_m2m_decoder_cmd and v4l2_m2m_start_streaming/v4l2_m2m_stop_streaming.

The vicodec will be the first one to be converted as an example.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 172 ++++++++++++++++++++++++-
 include/media/v4l2-mem2mem.h           |  95 ++++++++++++++
 2 files changed, 265 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 1afd9c6ad908..f221d6c7a137 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -340,6 +340,11 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m_dev *m2m_dev,
 		m2m_ctx->new_frame = !dst->vb2_buf.copied_timestamp ||
 			dst->vb2_buf.timestamp != src->vb2_buf.timestamp;
 
+	if (m2m_ctx->has_stopped) {
+		dprintk("Device has stopped\n");
+		goto job_unlock;
+	}
+
 	if (m2m_dev->m2m_ops->job_ready
 		&& (!m2m_dev->m2m_ops->job_ready(m2m_ctx->priv))) {
 		dprintk("Driver not ready\n");
@@ -556,6 +561,99 @@ int v4l2_m2m_querybuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_querybuf);
 
+void v4l2_m2m_last_buffer_done(struct v4l2_m2m_ctx *m2m_ctx,
+			       struct vb2_v4l2_buffer *vbuf)
+{
+	vbuf->flags |= V4L2_BUF_FLAG_LAST;
+	vb2_buffer_done(&vbuf->vb2_buf, VB2_BUF_STATE_DONE);
+
+	v4l2_m2m_mark_stopped(m2m_ctx);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_last_buffer_done);
+
+static int v4l2_mark_last_buf(struct v4l2_m2m_ctx *m2m_ctx)
+{
+	struct vb2_v4l2_buffer *next_dst_buf;
+
+	if (m2m_ctx->is_draining)
+		return -EBUSY;
+
+	if (m2m_ctx->has_stopped)
+		return 0;
+
+	m2m_ctx->last_src_buf = v4l2_m2m_last_src_buf(m2m_ctx);
+	m2m_ctx->is_draining = true;
+
+	if (m2m_ctx->last_src_buf)
+		return 0;
+
+	next_dst_buf = v4l2_m2m_dst_buf_remove(m2m_ctx);
+	if (!next_dst_buf) {
+		m2m_ctx->next_buf_last = true;
+		return 0;
+	}
+
+	v4l2_m2m_last_buffer_done(m2m_ctx, next_dst_buf);
+
+	return 0;
+}
+
+void v4l2_m2m_start_streaming(struct v4l2_m2m_ctx *m2m_ctx, struct vb2_queue *q)
+{
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		m2m_ctx->last_src_buf = NULL;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_start_streaming);
+
+void v4l2_m2m_stop_streaming(struct v4l2_m2m_ctx *m2m_ctx, struct vb2_queue *q)
+{
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		if (m2m_ctx->is_draining) {
+			struct vb2_v4l2_buffer *next_dst_buf;
+
+			m2m_ctx->last_src_buf = NULL;
+			next_dst_buf = v4l2_m2m_dst_buf_remove(m2m_ctx);
+			if (!next_dst_buf)
+				m2m_ctx->next_buf_last = true;
+			else
+				v4l2_m2m_last_buffer_done(m2m_ctx,
+							  next_dst_buf);
+		}
+	} else {
+		v4l2_m2m_clear_state(m2m_ctx);
+	}
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_stop_streaming);
+
+static void v4l2_m2m_force_last_buf_done(struct v4l2_m2m_ctx *m2m_ctx,
+					 struct vb2_queue *q)
+{
+	struct vb2_buffer *vb;
+	struct vb2_v4l2_buffer *vbuf;
+	unsigned int i;
+
+	if (WARN_ON(q->is_output))
+		return;
+	if (list_empty(&q->queued_list))
+		return;
+
+	vb = list_first_entry(&q->queued_list, struct vb2_buffer, queued_entry);
+	for (i = 0; i < vb->num_planes; i++)
+		vb2_set_plane_payload(vb, i, 0);
+
+	/*
+	 * Since the buffer hasn't been queued to the ready queue,
+	 * mark is active and owned before marking it LAST and DONE
+	 */
+	vb->state = VB2_BUF_STATE_ACTIVE;
+	atomic_inc(&q->owned_by_drv_count);
+
+	vbuf = to_vb2_v4l2_buffer(vb);
+	vbuf->field = V4L2_FIELD_NONE;
+
+	v4l2_m2m_last_buffer_done(m2m_ctx, vbuf);
+}
+
 int v4l2_m2m_qbuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		  struct v4l2_buffer *buf)
 {
@@ -570,11 +668,25 @@ int v4l2_m2m_qbuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 			__func__);
 		return -EPERM;
 	}
+
 	ret = vb2_qbuf(vq, vdev->v4l2_dev->mdev, buf);
-	if (!ret && !(buf->flags & V4L2_BUF_FLAG_IN_REQUEST))
+	if (ret)
+		return ret;
+
+	/*
+	 * If the capture queue is streaming, but streaming hasn't started
+	 * on the device, but was asked to stop, mark the previously queued
+	 * buffer as DONE with LAST flag since it won't be queued on the
+	 * device.
+	 */
+	if (!V4L2_TYPE_IS_OUTPUT(vq->type) &&
+	    vb2_is_streaming(vq) && !vb2_start_streaming_called(vq) &&
+	   (v4l2_m2m_has_stopped(m2m_ctx) || v4l2_m2m_dst_buf_is_last(m2m_ctx)))
+		v4l2_m2m_force_last_buf_done(m2m_ctx, vq);
+	else if (!(buf->flags & V4L2_BUF_FLAG_IN_REQUEST))
 		v4l2_m2m_try_schedule(m2m_ctx);
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_qbuf);
 
@@ -1225,6 +1337,62 @@ int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_decoder_cmd);
 
+int v4l2_m2m_encoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
+			 struct v4l2_encoder_cmd *ec)
+{
+	if (ec->cmd != V4L2_ENC_CMD_STOP && ec->cmd != V4L2_ENC_CMD_START)
+		return -EINVAL;
+
+	if (ec->cmd == V4L2_ENC_CMD_STOP)
+		return v4l2_mark_last_buf(m2m_ctx);
+
+	if (m2m_ctx->is_draining)
+		return -EBUSY;
+
+	if (m2m_ctx->has_stopped)
+		m2m_ctx->has_stopped = false;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_encoder_cmd);
+
+int v4l2_m2m_decoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
+			 struct v4l2_decoder_cmd *dc)
+{
+	if (dc->cmd != V4L2_DEC_CMD_STOP && dc->cmd != V4L2_DEC_CMD_START)
+		return -EINVAL;
+
+	if (dc->cmd == V4L2_DEC_CMD_STOP)
+		return v4l2_mark_last_buf(m2m_ctx);
+
+	if (m2m_ctx->is_draining)
+		return -EBUSY;
+
+	if (m2m_ctx->has_stopped)
+		m2m_ctx->has_stopped = false;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_decoder_cmd);
+
+int v4l2_m2m_ioctl_encoder_cmd(struct file *file, void *priv,
+			       struct v4l2_encoder_cmd *ec)
+{
+	struct v4l2_fh *fh = file->private_data;
+
+	return v4l2_m2m_encoder_cmd(file, fh->m2m_ctx, ec);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_encoder_cmd);
+
+int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *priv,
+			       struct v4l2_decoder_cmd *dc)
+{
+	struct v4l2_fh *fh = file->private_data;
+
+	return v4l2_m2m_decoder_cmd(file, fh->m2m_ctx, dc);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_decoder_cmd);
+
 int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh,
 					     struct v4l2_decoder_cmd *dc)
 {
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 1d85e24791e4..3476889af46c 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -80,6 +80,10 @@ struct v4l2_m2m_queue_ctx {
  *		for an existing frame. This is always true unless
  *		V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF is set, which
  *		indicates slicing support.
+ * @is_draining: indicates device is in draining phase
+ * @last_src_buf: indicate the last source buffer for draining
+ * @next_buf_last: next capture queud buffer will be tagged as last
+ * @has_stopped: indicate the device has been stopped
  * @m2m_dev: opaque pointer to the internal data to handle M2M context
  * @cap_q_ctx: Capture (output to memory) queue context
  * @out_q_ctx: Output (input from memory) queue context
@@ -98,6 +102,11 @@ struct v4l2_m2m_ctx {
 
 	bool				new_frame;
 
+	bool				is_draining;
+	struct vb2_v4l2_buffer		*last_src_buf;
+	bool				next_buf_last;
+	bool				has_stopped;
+
 	/* internal use only */
 	struct v4l2_m2m_dev		*m2m_dev;
 
@@ -215,6 +224,50 @@ v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
 	vb2_buffer_done(&buf->vb2_buf, state);
 }
 
+static inline void
+v4l2_m2m_clear_state(struct v4l2_m2m_ctx *m2m_ctx)
+{
+	m2m_ctx->next_buf_last = false;
+	m2m_ctx->is_draining = false;
+	m2m_ctx->has_stopped = false;
+}
+
+static inline void
+v4l2_m2m_mark_stopped(struct v4l2_m2m_ctx *m2m_ctx)
+{
+	m2m_ctx->next_buf_last = false;
+	m2m_ctx->is_draining = false;
+	m2m_ctx->has_stopped = true;
+}
+
+static inline bool
+v4l2_m2m_dst_buf_is_last(struct v4l2_m2m_ctx *m2m_ctx)
+{
+	return m2m_ctx->is_draining && m2m_ctx->next_buf_last;
+}
+
+static inline bool
+v4l2_m2m_has_stopped(struct v4l2_m2m_ctx *m2m_ctx)
+{
+	return m2m_ctx->has_stopped;
+}
+
+static inline bool
+v4l2_m2m_is_last_draining_src_buf(struct v4l2_m2m_ctx *m2m_ctx,
+				       struct vb2_v4l2_buffer *buf)
+{
+	return m2m_ctx->is_draining && buf == m2m_ctx->last_src_buf;
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
 /**
  * v4l2_m2m_reqbufs() - multi-queue-aware REQBUFS multiplexer
  *
@@ -312,6 +365,44 @@ int v4l2_m2m_streamon(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 int v4l2_m2m_streamoff(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		       enum v4l2_buf_type type);
 
+/**
+ * v4l2_m2m_start_streaming() - handle start of streaming of a video queue
+ *
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ * @q: queue
+ */
+void v4l2_m2m_start_streaming(struct v4l2_m2m_ctx *m2m_ctx,
+			      struct vb2_queue *q);
+
+/**
+ * v4l2_m2m_stop_streaming() - handle stop of streaming of a video queue
+ *
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ * @q: queue
+ */
+void v4l2_m2m_stop_streaming(struct v4l2_m2m_ctx *m2m_ctx,
+			     struct vb2_queue *q);
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
 /**
  * v4l2_m2m_poll() - poll replacement, for destination buffers only
  *
@@ -704,6 +795,10 @@ int v4l2_m2m_ioctl_streamon(struct file *file, void *fh,
 				enum v4l2_buf_type type);
 int v4l2_m2m_ioctl_streamoff(struct file *file, void *fh,
 				enum v4l2_buf_type type);
+int v4l2_m2m_ioctl_encoder_cmd(struct file *file, void *fh,
+			       struct v4l2_encoder_cmd *ec);
+int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *fh,
+			       struct v4l2_decoder_cmd *dc);
 int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *fh,
 				   struct v4l2_encoder_cmd *ec);
 int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
-- 
2.22.0

