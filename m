Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B058CCE642
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 16:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbfJGO7Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 10:59:16 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44340 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728445AbfJGO7Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 10:59:16 -0400
Received: by mail-wr1-f68.google.com with SMTP id z9so15670840wrl.11
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 07:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8fIssW4mnIoLP7UNPstKG0W3FsVYVYQQobX0+nmf6zk=;
        b=K8gWZ9CB+Nl4ndqmhl+Z0xPbOMXnVpyZe2kYogwovk3pUeV4n1v4wO8e8hdeEPV8vl
         jaH/ubHviasFuvKDH2PlN/OT5lZavF9fHtH0VFUHBrteoYn8K5JzL4r/zDoy2vodp3Qp
         nlVGi/OkKcyzNZz33YZDbyFOSHVpEPkdMQ0ppbvpuU3hr8v5duiJOFb//nZsJlXWVE3L
         ohzIeHUAw6xL8Mdc1vxovpXTjGakpfEgosA/XISDRabSqLdqj5NyP+YX7FcH1Z7c0jpL
         Mk0NeYaHnD+C4vMprZ4uY2JN3gP8wTAR7dVdi3dxhZdGuk+DtqBwghST6yxqTSfH1NGG
         UHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8fIssW4mnIoLP7UNPstKG0W3FsVYVYQQobX0+nmf6zk=;
        b=pTyBy+NBvBUV7nLPmE9Ss6PuLUnuvzfn4tqyj/IwOyBh0LzXREHxUFsXzdkzU6fLio
         Wb5Tt9wlzIB3ECRNJszAn4WADGSpFpiV2DpzcBrRtTFbsYOUtAU3yKC6hvv4pK3OzJrk
         RmuWXhlvsEpGulvtaVV4SHZ3Y7xgqjGMq64+ttrGFePtgDwOfWJ5Nq1B4M+Q580JCaSU
         +hAvwOTPv6QgeYNgxmpZmCJlGOiV5Qe6aU/Eit4o1iAPzIhF/djfJEoIXtsTttC73yMF
         r1wOH5y2yEJKIkGg/sqqYeFt7fs3WY+AV8zsHP+KHowhRIyBvxLlyh+5neOoPEa7rsWH
         Da2w==
X-Gm-Message-State: APjAAAXFfHscLtBoCo34kOd/uCjkaNNN6a6DBV4rUX5nTlki369SZxpC
        OTXSO9vqu4GQa2sWsCbFcwngFA==
X-Google-Smtp-Source: APXvYqxaO1KlPK+TkXo3qYiWqjVzvUQDCORmR7eHW17gOZJtB4p/Rg08e6Bfp2HCgARYT0qzK+20+g==
X-Received: by 2002:a5d:61c1:: with SMTP id q1mr9028285wrv.235.1570460352333;
        Mon, 07 Oct 2019 07:59:12 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id d4sm19348985wrq.22.2019.10.07.07.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 07:59:11 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Subject: [PATCH 1/2] media: meson: vdec: bring up to compliance
Date:   Mon,  7 Oct 2019 16:59:08 +0200
Message-Id: <20191007145909.29979-2-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007145909.29979-1-mjourdan@baylibre.com>
References: <20191007145909.29979-1-mjourdan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add all the necessary bits to pass v4l2-compliance in stateful decoding
mode.

Mostly includes tracking the state of the decoder, allowing the OUTPUT
queue to stream while the CAPTURE queue is inactive, handling resolution
change events, draining with V4L2_DEC_CMD_STOP, copying more metadata
from the src buffers to the dst buffers, etc.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 drivers/staging/media/meson/vdec/esparser.c   | 34 ++------
 drivers/staging/media/meson/vdec/vdec.c       | 70 ++++++++++-----
 drivers/staging/media/meson/vdec/vdec.h       | 14 ++-
 .../staging/media/meson/vdec/vdec_helpers.c   | 85 +++++++++----------
 .../staging/media/meson/vdec/vdec_helpers.h   |  6 +-
 .../staging/media/meson/vdec/vdec_platform.c  |  6 ++
 6 files changed, 120 insertions(+), 95 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index 95102a4bdc62..a083d67be405 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -180,29 +180,25 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 	int ret;
 	struct vb2_buffer *vb = &vbuf->vb2_buf;
 	struct amvdec_core *core = sess->core;
-	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
-	u32 num_dst_bufs = 0;
 	u32 payload_size = vb2_get_plane_payload(vb, 0);
 	dma_addr_t phy = vb2_dma_contig_plane_dma_addr(vb, 0);
 	u32 offset;
 	u32 pad_size;
 
-	if (codec_ops->num_pending_bufs)
-		num_dst_bufs = codec_ops->num_pending_bufs(sess);
-
-	num_dst_bufs += v4l2_m2m_num_dst_bufs_ready(sess->m2m_ctx);
-
-	if (esparser_vififo_get_free_space(sess) < payload_size ||
-	    atomic_read(&sess->esparser_queued_bufs) >= num_dst_bufs)
+	if (esparser_vififo_get_free_space(sess) < payload_size)
 		return -EAGAIN;
 
 	v4l2_m2m_src_buf_remove_by_buf(sess->m2m_ctx, vbuf);
 
 	offset = esparser_get_offset(sess);
 
-	amvdec_add_ts_reorder(sess, vb->timestamp, offset);
-	dev_dbg(core->dev, "esparser: ts = %llu pld_size = %u offset = %08X\n",
-		vb->timestamp, payload_size, offset);
+	amvdec_add_ts(sess, vb->timestamp, vbuf->timecode, offset, vbuf->flags);
+	dev_dbg(core->dev, "esparser: ts = %llu pld_size = %u offset = %08X flags = %08X\n",
+		vb->timestamp, payload_size, offset, vbuf->flags);
+
+	vbuf->flags = 0;
+	vbuf->field = V4L2_FIELD_NONE;
+	vbuf->sequence = sess->sequence_out++;
 
 	pad_size = esparser_pad_start_code(vb);
 	ret = esparser_write_data(core, phy, payload_size + pad_size);
@@ -216,19 +212,7 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 		return 0;
 	}
 
-	/* We need to wait until we parse the first keyframe.
-	 * All buffers prior to the first keyframe must be dropped.
-	 */
-	if (!sess->keyframe_found)
-		usleep_range(1000, 2000);
-
-	if (sess->keyframe_found)
-		atomic_inc(&sess->esparser_queued_bufs);
-	else
-		amvdec_remove_ts(sess, vb->timestamp);
-
-	vbuf->flags = 0;
-	vbuf->field = V4L2_FIELD_NONE;
+	atomic_inc(&sess->esparser_queued_bufs);
 	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 
 	return 0;
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 0a1a04fd5d13..0b571b3a1e33 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -166,7 +166,10 @@ static void process_num_buffers(struct vb2_queue *q,
 {
 	const struct amvdec_format *fmt_out = sess->fmt_out;
 	unsigned int buffers_total = q->num_buffers + *num_buffers;
+	u32 min_buf_capture = v4l2_ctrl_g_ctrl(sess->ctrl_min_buf_capture);
 
+	if (q->num_buffers + *num_buffers < min_buf_capture)
+		*num_buffers = min_buf_capture - q->num_buffers;
 	if (is_reqbufs && buffers_total < fmt_out->min_buffers)
 		*num_buffers = fmt_out->min_buffers - q->num_buffers;
 	if (buffers_total > fmt_out->max_buffers)
@@ -191,7 +194,8 @@ static int vdec_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
 	if (*num_planes) {
 		switch (q->type) {
 		case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-			if (*num_planes != 1 || sizes[0] < output_size)
+			if (*num_planes != 1 ||
+			    sizes[0] < sess->src_buffer_size)
 				return -EINVAL;
 			break;
 		case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
@@ -222,7 +226,7 @@ static int vdec_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
 
 	switch (q->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		sizes[0] = amvdec_get_output_size(sess);
+		sizes[0] = sess->src_buffer_size;
 		*num_planes = 1;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
@@ -248,6 +252,7 @@ static int vdec_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
 		return -EINVAL;
 	}
 
+	sess->changed_format = 1;
 	return 0;
 }
 
@@ -259,10 +264,11 @@ static void vdec_vb2_buf_queue(struct vb2_buffer *vb)
 
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
 
-	if (!sess->streamon_out || !sess->streamon_cap)
+	if (!sess->streamon_out)
 		return;
 
-	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	if (sess->streamon_cap &&
+	    vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
 	    vdec_codec_needs_recycle(sess))
 		vdec_queue_recycle(sess, vb);
 
@@ -287,16 +293,22 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	else
 		sess->streamon_cap = 1;
 
-	if (!sess->streamon_out || !sess->streamon_cap)
+	if (!sess->streamon_out)
 		return 0;
 
 	if (sess->status == STATUS_NEEDS_RESUME &&
-	    q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+	    q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	    sess->changed_format) {
 		codec_ops->resume(sess);
 		sess->status = STATUS_RUNNING;
 		return 0;
 	}
 
+	if (sess->status == STATUS_RUNNING ||
+	    sess->status == STATUS_NEEDS_RESUME ||
+	    sess->status == STATUS_INIT)
+		return 0;
+
 	sess->vififo_size = SIZE_VIFIFO;
 	sess->vififo_vaddr =
 		dma_alloc_coherent(sess->core->dev, sess->vififo_size,
@@ -321,13 +333,14 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 		goto vififo_free;
 
 	sess->sequence_cap = 0;
+	sess->sequence_out = 0;
 	if (vdec_codec_needs_recycle(sess))
 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
 
-	sess->status = STATUS_RUNNING;
+	sess->status = STATUS_INIT;
 	core->cur_sess = sess;
-
+	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
 vififo_free:
@@ -384,6 +397,7 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	struct vb2_v4l2_buffer *buf;
 
 	if (sess->status == STATUS_RUNNING ||
+	    sess->status == STATUS_INIT ||
 	    (sess->status == STATUS_NEEDS_RESUME &&
 	     (!sess->streamon_out || !sess->streamon_cap))) {
 		if (vdec_codec_needs_recycle(sess))
@@ -474,20 +488,33 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
 	struct v4l2_plane_pix_format *pfmt = pixmp->plane_fmt;
 	const struct amvdec_format *fmts = sess->core->platform->formats;
-	const struct amvdec_format *fmt_out;
+	const struct amvdec_format *fmt_out = NULL;
+	u32 output_size = 0;
 
 	memset(pfmt[0].reserved, 0, sizeof(pfmt[0].reserved));
 	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
 
-	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+	switch (f->type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt_out = find_format(fmts, size, pixmp->pixelformat);
 		if (!fmt_out) {
 			pixmp->pixelformat = V4L2_PIX_FMT_MPEG2;
 			fmt_out = find_format(fmts, size, pixmp->pixelformat);
 		}
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		fmt_out = sess->fmt_out;
+		break;
+	default:
+		return NULL;
+	}
+
+	pixmp->width  = clamp(pixmp->width,  (u32)256, fmt_out->max_width);
+	pixmp->height = clamp(pixmp->height, (u32)144, fmt_out->max_height);
+	output_size = get_output_size(pixmp->width, pixmp->height);
 
-		pfmt[0].sizeimage =
-			get_output_size(pixmp->width, pixmp->height);
+	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		pfmt[0].sizeimage = sess->src_buffer_size;
 		pfmt[0].bytesperline = 0;
 		pixmp->num_planes = 1;
 	} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
@@ -519,8 +546,6 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
 			pfmt[2].bytesperline = ALIGN(pixmp->width, 64) / 2;
 			pixmp->num_planes = 3;
 		}
-	} else {
-		return NULL;
 	}
 
 	pixmp->width  = clamp(pixmp->width,  (u32)256, fmt_out->max_width);
@@ -584,6 +609,8 @@ static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	orig_pixmp = *pixmp;
 
 	fmt_out = vdec_try_fmt_common(sess, num_formats, f);
+	if (!fmt_out)
+		return -EINVAL;
 
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		pixfmt_out = pixmp->pixelformat;
@@ -608,6 +635,7 @@ static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 		sess->ycbcr_enc = pixmp->ycbcr_enc;
 		sess->quantization = pixmp->quantization;
 		sess->xfer_func = pixmp->xfer_func;
+		sess->src_buffer_size = pixmp->plane_fmt[0].sizeimage;
 	}
 
 	memset(&format, 0, sizeof(format));
@@ -699,29 +727,28 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 	if (!(sess->streamon_out & sess->streamon_cap))
 		return 0;
 
-	/* Currently not handled since we do not support dynamic resolution
-	 * for MPEG2. We consider both queues streaming to mean that the
-	 * decoding session is started
-	 */
-	if (cmd->cmd == V4L2_DEC_CMD_START)
+	if (cmd->cmd == V4L2_DEC_CMD_START) {
+		sess->should_stop = 0;
 		return 0;
+	}
 
 	/* Should not happen */
 	if (cmd->cmd != V4L2_DEC_CMD_STOP)
 		return -EINVAL;
 
 	dev_dbg(dev, "Received V4L2_DEC_CMD_STOP\n");
-	sess->should_stop = 1;
 
-	vdec_wait_inactive(sess);
+	sess->should_stop = 1;
 
 	if (codec_ops->drain) {
+		vdec_wait_inactive(sess);
 		codec_ops->drain(sess);
 	} else if (codec_ops->eos_sequence) {
 		u32 len;
 		const u8 *data = codec_ops->eos_sequence(&len);
 
 		esparser_queue_eos(sess->core, data, len);
+		vdec_wait_inactive(sess);
 	}
 
 	return ret;
@@ -881,6 +908,7 @@ static int vdec_open(struct file *file)
 	sess->height = 720;
 	sess->pixelaspect.numerator = 1;
 	sess->pixelaspect.denominator = 1;
+	sess->src_buffer_size = SZ_1M;
 
 	INIT_LIST_HEAD(&sess->timestamps);
 	INIT_LIST_HEAD(&sess->bufs_recycle);
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index d811e7976519..163d6dddfad6 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -29,13 +29,19 @@ struct amvdec_buffer {
  * struct amvdec_timestamp - stores a src timestamp along with a VIFIFO offset
  *
  * @list: used to make lists out of this struct
- * @ts: timestamp
+ * @tc: timecode from the v4l2 buffer
+ * @ts: timestamp from the VB2 buffer
  * @offset: offset in the VIFIFO where the associated packet was written
+ * @flags: flags from the v4l2 buffer
+ * @used_count: times this timestamp was checked for a match with a dst buffer
  */
 struct amvdec_timestamp {
 	struct list_head list;
+	struct v4l2_timecode tc;
 	u64 ts;
 	u32 offset;
+	u32 flags;
+	u32 used_count;
 };
 
 struct amvdec_session;
@@ -164,6 +170,7 @@ struct amvdec_format {
 
 enum amvdec_status {
 	STATUS_STOPPED,
+	STATUS_INIT,
 	STATUS_RUNNING,
 	STATUS_NEEDS_RESUME,
 };
@@ -179,6 +186,7 @@ enum amvdec_status {
  * @ctrl_min_buf_capture: V4L2 control V4L2_CID_MIN_BUFFERS_FOR_CAPTURE
  * @fmt_out: vdec pixel format for the OUTPUT queue
  * @pixfmt_cap: V4L2 pixel format for the CAPTURE queue
+ * @src_buffer_size: size in bytes of the OUTPUT buffers' only plane
  * @width: current picture width
  * @height: current picture height
  * @colorspace: current colorspace
@@ -220,6 +228,7 @@ struct amvdec_session {
 
 	const struct amvdec_format *fmt_out;
 	u32 pixfmt_cap;
+	u32 src_buffer_size;
 
 	u32 width;
 	u32 height;
@@ -234,10 +243,11 @@ struct amvdec_session {
 	struct work_struct esparser_queue_work;
 
 	unsigned int streamon_cap, streamon_out;
-	unsigned int sequence_cap;
+	unsigned int sequence_cap, sequence_out;
 	unsigned int should_stop;
 	unsigned int keyframe_found;
 	unsigned int num_dst_bufs;
+	unsigned int changed_format;
 
 	u8 canvas_alloc[MAX_CANVAS];
 	u32 canvas_num;
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index f16948bdbf2f..ff4333074197 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -200,33 +200,23 @@ int amvdec_set_canvases(struct amvdec_session *sess,
 }
 EXPORT_SYMBOL_GPL(amvdec_set_canvases);
 
-void amvdec_add_ts_reorder(struct amvdec_session *sess, u64 ts, u32 offset)
+void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
+		   struct v4l2_timecode tc, u32 offset, u32 vbuf_flags)
 {
-	struct amvdec_timestamp *new_ts, *tmp;
+	struct amvdec_timestamp *new_ts;
 	unsigned long flags;
 
-	new_ts = kmalloc(sizeof(*new_ts), GFP_KERNEL);
+	new_ts = kzalloc(sizeof(*new_ts), GFP_KERNEL);
 	new_ts->ts = ts;
+	new_ts->tc = tc;
 	new_ts->offset = offset;
+	new_ts->flags = vbuf_flags;
 
 	spin_lock_irqsave(&sess->ts_spinlock, flags);
-
-	if (list_empty(&sess->timestamps))
-		goto add_tail;
-
-	list_for_each_entry(tmp, &sess->timestamps, list) {
-		if (ts <= tmp->ts) {
-			list_add_tail(&new_ts->list, &tmp->list);
-			goto unlock;
-		}
-	}
-
-add_tail:
 	list_add_tail(&new_ts->list, &sess->timestamps);
-unlock:
 	spin_unlock_irqrestore(&sess->ts_spinlock, flags);
 }
-EXPORT_SYMBOL_GPL(amvdec_add_ts_reorder);
+EXPORT_SYMBOL_GPL(amvdec_add_ts);
 
 void amvdec_remove_ts(struct amvdec_session *sess, u64 ts)
 {
@@ -251,8 +241,8 @@ EXPORT_SYMBOL_GPL(amvdec_remove_ts);
 
 static void dst_buf_done(struct amvdec_session *sess,
 			 struct vb2_v4l2_buffer *vbuf,
-			 u32 field,
-			 u64 timestamp)
+			 u32 field, u64 timestamp,
+			 struct v4l2_timecode timecode, u32 flags)
 {
 	struct device *dev = sess->core->dev_dec;
 	u32 output_size = amvdec_get_output_size(sess);
@@ -271,19 +261,23 @@ static void dst_buf_done(struct amvdec_session *sess,
 
 	vbuf->vb2_buf.timestamp = timestamp;
 	vbuf->sequence = sess->sequence_cap++;
+	vbuf->flags = flags;
+	vbuf->timecode = timecode;
 
 	if (sess->should_stop &&
-	    atomic_read(&sess->esparser_queued_bufs) <= 2) {
+	    atomic_read(&sess->esparser_queued_bufs) <= 1) {
 		const struct v4l2_event ev = { .type = V4L2_EVENT_EOS };
 
-		dev_dbg(dev, "Signaling EOS\n");
+		dev_dbg(dev, "Signaling EOS, sequence_cap = %u\n",
+			sess->sequence_cap - 1);
 		v4l2_event_queue_fh(&sess->fh, &ev);
 		vbuf->flags |= V4L2_BUF_FLAG_LAST;
 	} else if (sess->should_stop)
 		dev_dbg(dev, "should_stop, %u bufs remain\n",
 			atomic_read(&sess->esparser_queued_bufs));
 
-	dev_dbg(dev, "Buffer %u done\n", vbuf->vb2_buf.index);
+	dev_dbg(dev, "Buffer %u done, ts = %llu, flags = %08X\n",
+		vbuf->vb2_buf.index, timestamp, flags);
 	vbuf->field = field;
 	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 
@@ -297,7 +291,9 @@ void amvdec_dst_buf_done(struct amvdec_session *sess,
 	struct device *dev = sess->core->dev_dec;
 	struct amvdec_timestamp *tmp;
 	struct list_head *timestamps = &sess->timestamps;
+	struct v4l2_timecode timecode;
 	u64 timestamp;
+	u32 vbuf_flags;
 	unsigned long flags;
 
 	spin_lock_irqsave(&sess->ts_spinlock, flags);
@@ -312,11 +308,13 @@ void amvdec_dst_buf_done(struct amvdec_session *sess,
 
 	tmp = list_first_entry(timestamps, struct amvdec_timestamp, list);
 	timestamp = tmp->ts;
+	timecode = tmp->tc;
+	vbuf_flags = tmp->flags;
 	list_del(&tmp->list);
 	kfree(tmp);
 	spin_unlock_irqrestore(&sess->ts_spinlock, flags);
 
-	dst_buf_done(sess, vbuf, field, timestamp);
+	dst_buf_done(sess, vbuf, field, timestamp, timecode, vbuf_flags);
 	atomic_dec(&sess->esparser_queued_bufs);
 }
 EXPORT_SYMBOL_GPL(amvdec_dst_buf_done);
@@ -328,48 +326,43 @@ void amvdec_dst_buf_done_offset(struct amvdec_session *sess,
 	struct device *dev = sess->core->dev_dec;
 	struct amvdec_timestamp *match = NULL;
 	struct amvdec_timestamp *tmp, *n;
+	struct v4l2_timecode timecode = { 0 };
 	u64 timestamp = 0;
+	u32 vbuf_flags = 0;
 	unsigned long flags;
 
 	spin_lock_irqsave(&sess->ts_spinlock, flags);
 
 	/* Look for our vififo offset to get the corresponding timestamp. */
 	list_for_each_entry_safe(tmp, n, &sess->timestamps, list) {
-		s64 delta = (s64)offset - tmp->offset;
-
-		/* Offsets reported by codecs usually differ slightly,
-		 * so we need some wiggle room.
-		 * 4KiB being the minimum packet size, there is no risk here.
-		 */
-		if (delta > (-1 * (s32)SZ_4K) && delta < SZ_4K) {
-			match = tmp;
+		if (tmp->offset > offset) {
+			/*
+			 * Delete any record that remained unused for 32 match
+			 * checks
+			 */
+			if (tmp->used_count++ >= 32) {
+				list_del(&tmp->list);
+				kfree(tmp);
+			}
 			break;
 		}
 
-		if (!allow_drop)
-			continue;
-
-		/* Delete any timestamp entry that appears before our target
-		 * (not all src packets/timestamps lead to a frame)
-		 */
-		if (delta > 0 || delta < -1 * (s32)sess->vififo_size) {
-			atomic_dec(&sess->esparser_queued_bufs);
-			list_del(&tmp->list);
-			kfree(tmp);
-		}
+		match = tmp;
 	}
 
 	if (!match) {
-		dev_dbg(dev, "Buffer %u done but can't match offset (%08X)\n",
+		dev_err(dev, "Buffer %u done but can't match offset (%08X)\n",
 			vbuf->vb2_buf.index, offset);
 	} else {
 		timestamp = match->ts;
+		timecode = match->tc;
+		vbuf_flags = match->flags;
 		list_del(&match->list);
 		kfree(match);
 	}
 	spin_unlock_irqrestore(&sess->ts_spinlock, flags);
 
-	dst_buf_done(sess, vbuf, field, timestamp);
+	dst_buf_done(sess, vbuf, field, timestamp, timecode, vbuf_flags);
 	if (match)
 		atomic_dec(&sess->esparser_queued_bufs);
 }
@@ -420,7 +413,8 @@ void amvdec_src_change(struct amvdec_session *sess, u32 width,
 
 	v4l2_ctrl_s_ctrl(sess->ctrl_min_buf_capture, dpb_size);
 
-	/* Check if the capture queue is already configured well for our
+	/*
+	 * Check if the capture queue is already configured well for our
 	 * usecase. If so, keep decoding with it and do not send the event
 	 */
 	if (sess->width == width &&
@@ -430,6 +424,7 @@ void amvdec_src_change(struct amvdec_session *sess, u32 width,
 		return;
 	}
 
+	sess->changed_format = 0;
 	sess->width = width;
 	sess->height = height;
 	sess->status = STATUS_NEEDS_RESUME;
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
index a455a9ee1cc2..165e6293ffba 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.h
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
@@ -44,13 +44,15 @@ void amvdec_dst_buf_done_offset(struct amvdec_session *sess,
 				u32 offset, u32 field, bool allow_drop);
 
 /**
- * amvdec_add_ts_reorder() - Add a timestamp to the list in chronological order
+ * amvdec_add_ts() - Add a timestamp to the list
  *
  * @sess: current session
  * @ts: timestamp to add
  * @offset: offset in the VIFIFO where the associated packet was written
+ * @flags the vb2_v4l2_buffer flags
  */
-void amvdec_add_ts_reorder(struct amvdec_session *sess, u64 ts, u32 offset);
+void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
+		   struct v4l2_timecode tc, u32 offset, u32 flags);
 void amvdec_remove_ts(struct amvdec_session *sess, u64 ts);
 
 /**
diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
index 824dbc7f46f5..accad8f8929a 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.c
+++ b/drivers/staging/media/meson/vdec/vdec_platform.c
@@ -21,6 +21,7 @@ static const struct amvdec_format vdec_formats_gxbb[] = {
 		.codec_ops = &codec_mpeg12_ops,
 		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
 		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
+		.flags = V4L2_FMT_FLAG_COMPRESSED,
 	}, {
 		.pixfmt = V4L2_PIX_FMT_MPEG2,
 		.min_buffers = 8,
@@ -31,6 +32,7 @@ static const struct amvdec_format vdec_formats_gxbb[] = {
 		.codec_ops = &codec_mpeg12_ops,
 		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
 		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
+		.flags = V4L2_FMT_FLAG_COMPRESSED,
 	},
 };
 
@@ -45,6 +47,7 @@ static const struct amvdec_format vdec_formats_gxl[] = {
 		.codec_ops = &codec_mpeg12_ops,
 		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
 		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
+		.flags = V4L2_FMT_FLAG_COMPRESSED,
 	}, {
 		.pixfmt = V4L2_PIX_FMT_MPEG2,
 		.min_buffers = 8,
@@ -55,6 +58,7 @@ static const struct amvdec_format vdec_formats_gxl[] = {
 		.codec_ops = &codec_mpeg12_ops,
 		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
 		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
+		.flags = V4L2_FMT_FLAG_COMPRESSED,
 	},
 };
 
@@ -69,6 +73,7 @@ static const struct amvdec_format vdec_formats_gxm[] = {
 		.codec_ops = &codec_mpeg12_ops,
 		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
 		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
+		.flags = V4L2_FMT_FLAG_COMPRESSED,
 	}, {
 		.pixfmt = V4L2_PIX_FMT_MPEG2,
 		.min_buffers = 8,
@@ -79,6 +84,7 @@ static const struct amvdec_format vdec_formats_gxm[] = {
 		.codec_ops = &codec_mpeg12_ops,
 		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
 		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
+		.flags = V4L2_FMT_FLAG_COMPRESSED,
 	},
 };
 
-- 
2.23.0

