Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39CEC207C2B
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 21:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391321AbgFXT2u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 15:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391320AbgFXT2u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 15:28:50 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88E4C061573
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2020 12:28:49 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E607A2A0AA9
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH] media: Add V4L2_TYPE_IS_CAPTURE helper
Date:   Wed, 24 Jun 2020 16:28:00 -0300
Message-Id: <20200624192800.8167-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's all too easy to get confused by the V4L2_TYPE_IS_OUTPUT
macro, when it's used as !V4L2_TYPE_IS_OUTPUT.

Reduce the risk of confusion with macro to explicitly
check for the CAPTURE queue type case.

This change does not affect functionality, and it's
only intended to make the code more readable.

Suggested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c   | 4 ++--
 drivers/media/platform/exynos-gsc/gsc-core.c      | 2 +-
 drivers/media/platform/exynos-gsc/gsc-m2m.c       | 2 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c   | 2 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c      | 4 ++--
 drivers/media/platform/rcar_jpu.c                 | 2 +-
 drivers/media/platform/sti/hva/hva-v4l2.c         | 2 +-
 drivers/media/platform/ti-vpe/vpe.c               | 2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c | 6 +++---
 drivers/media/v4l2-core/v4l2-mem2mem.c            | 6 +++---
 drivers/staging/media/hantro/hantro_v4l2.c        | 2 +-
 drivers/staging/media/rkvdec/rkvdec.c             | 2 +-
 include/uapi/linux/videodev2.h                    | 2 ++
 13 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 559a229cac41..044d9d8fb690 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -94,7 +94,7 @@ static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
 	unsigned int bytesused;
 	unsigned int plane;
 
-	if (!V4L2_TYPE_IS_OUTPUT(b->type))
+	if (V4L2_TYPE_IS_CAPTURE(b->type))
 		return 0;
 
 	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
@@ -307,7 +307,7 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
 
 	/* Zero flags that we handle */
 	vbuf->flags = b->flags & ~V4L2_BUFFER_MASK_FLAGS;
-	if (!vb->vb2_queue->copy_timestamp || !V4L2_TYPE_IS_OUTPUT(b->type)) {
+	if (!vb->vb2_queue->copy_timestamp || V4L2_TYPE_IS_CAPTURE(b->type)) {
 		/*
 		 * Non-COPY timestamps and non-OUTPUT queues will get
 		 * their timestamp and timestamp source flags from the
diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
index f6650b45bc3d..9f41c2e7097a 100644
--- a/drivers/media/platform/exynos-gsc/gsc-core.c
+++ b/drivers/media/platform/exynos-gsc/gsc-core.c
@@ -577,7 +577,7 @@ int gsc_try_selection(struct gsc_ctx *ctx, struct v4l2_selection *s)
 	v4l_bound_align_image(&tmp_w, min_w, max_w, mod_x,
 			      &tmp_h, min_h, max_h, mod_y, 0);
 
-	if (!V4L2_TYPE_IS_OUTPUT(s->type) &&
+	if (V4L2_TYPE_IS_CAPTURE(s->type) &&
 	    (ctx->gsc_ctrls.rotate->val == 90 ||
 	     ctx->gsc_ctrls.rotate->val == 270))
 		gsc_check_crop_change(tmp_h, tmp_w,
diff --git a/drivers/media/platform/exynos-gsc/gsc-m2m.c b/drivers/media/platform/exynos-gsc/gsc-m2m.c
index e2c162635f72..27a3c92c73bc 100644
--- a/drivers/media/platform/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/exynos-gsc/gsc-m2m.c
@@ -255,7 +255,7 @@ static int gsc_m2m_buf_prepare(struct vb2_buffer *vb)
 	if (IS_ERR(frame))
 		return PTR_ERR(frame);
 
-	if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
+	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type)) {
 		for (i = 0; i < frame->fmt->num_planes; i++)
 			vb2_set_plane_payload(vb, i, frame->payload[i]);
 	}
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index f82a81a3bdee..61fed1e35a00 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -731,7 +731,7 @@ static void mtk_jpeg_stop_streaming(struct vb2_queue *q)
 	 * subsampling. Update capture queue when the stream is off.
 	 */
 	if (ctx->state == MTK_JPEG_SOURCE_CHANGE &&
-	    !V4L2_TYPE_IS_OUTPUT(q->type)) {
+	    V4L2_TYPE_IS_CAPTURE(q->type)) {
 		struct mtk_jpeg_src_buf *src_buf;
 
 		vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
index 821f2cf325f0..baced27acf9b 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
@@ -193,7 +193,7 @@ static const struct mtk_mdp_fmt *mtk_mdp_try_fmt_mplane(struct mtk_mdp_ctx *ctx,
 
 	pix_mp->field = V4L2_FIELD_NONE;
 	pix_mp->pixelformat = fmt->pixelformat;
-	if (!V4L2_TYPE_IS_OUTPUT(f->type)) {
+	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
 		pix_mp->colorspace = ctx->colorspace;
 		pix_mp->xfer_func = ctx->xfer_func;
 		pix_mp->ycbcr_enc = ctx->ycbcr_enc;
@@ -327,7 +327,7 @@ static int mtk_mdp_try_crop(struct mtk_mdp_ctx *ctx, u32 type,
 	mtk_mdp_bound_align_image(&new_w, min_w, max_w, align_w,
 				  &new_h, min_h, max_h, align_h);
 
-	if (!V4L2_TYPE_IS_OUTPUT(type) &&
+	if (V4L2_TYPE_IS_CAPTURE(type) &&
 		(ctx->ctrls.rotate->val == 90 ||
 		ctx->ctrls.rotate->val == 270))
 		mtk_mdp_check_crop_change(new_h, new_w,
diff --git a/drivers/media/platform/rcar_jpu.c b/drivers/media/platform/rcar_jpu.c
index 5250a14324e9..9b99ff368698 100644
--- a/drivers/media/platform/rcar_jpu.c
+++ b/drivers/media/platform/rcar_jpu.c
@@ -1066,7 +1066,7 @@ static int jpu_buf_prepare(struct vb2_buffer *vb)
 		}
 
 		/* decoder capture queue */
-		if (!ctx->encoder && !V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
+		if (!ctx->encoder && V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type))
 			vb2_set_plane_payload(vb, i, size);
 	}
 
diff --git a/drivers/media/platform/sti/hva/hva-v4l2.c b/drivers/media/platform/sti/hva/hva-v4l2.c
index 197b99d8fd9c..bb34d6997d99 100644
--- a/drivers/media/platform/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/sti/hva/hva-v4l2.c
@@ -1087,7 +1087,7 @@ static void hva_stop_streaming(struct vb2_queue *vq)
 
 	if ((V4L2_TYPE_IS_OUTPUT(vq->type) &&
 	     vb2_is_streaming(&ctx->fh.m2m_ctx->cap_q_ctx.q)) ||
-	    (!V4L2_TYPE_IS_OUTPUT(vq->type) &&
+	    (V4L2_TYPE_IS_CAPTURE(vq->type) &&
 	     vb2_is_streaming(&ctx->fh.m2m_ctx->out_q_ctx.q))) {
 		dev_dbg(dev, "%s %s out=%d cap=%d\n",
 			ctx->name, to_type_str(vq->type),
diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index cff2fcd6d812..346f8212791c 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -1576,7 +1576,7 @@ static int vpe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 
 	*f = q_data->format;
 
-	if (!V4L2_TYPE_IS_OUTPUT(f->type)) {
+	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
 		struct vpe_q_data *s_q_data;
 		struct v4l2_pix_format_mplane *spix;
 
diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index e879290727ef..8941d73f6611 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -1442,7 +1442,7 @@ static void vicodec_buf_queue(struct vb2_buffer *vb)
 		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
 	};
 
-	if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type) &&
+	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) &&
 	    vb2_is_streaming(vb->vb2_queue) &&
 	    v4l2_m2m_dst_buf_is_last(ctx->fh.m2m_ctx)) {
 		unsigned int i;
@@ -1479,7 +1479,7 @@ static void vicodec_buf_queue(struct vb2_buffer *vb)
 	 * in the compressed stream
 	 */
 	if (ctx->is_stateless || ctx->is_enc ||
-	    !V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
+	    V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type)) {
 		v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
 		return;
 	}
@@ -1574,7 +1574,7 @@ static int vicodec_start_streaming(struct vb2_queue *q,
 	state->gop_cnt = 0;
 
 	if ((V4L2_TYPE_IS_OUTPUT(q->type) && !ctx->is_enc) ||
-	    (!V4L2_TYPE_IS_OUTPUT(q->type) && ctx->is_enc))
+	    (V4L2_TYPE_IS_CAPTURE(q->type) && ctx->is_enc))
 		return 0;
 
 	if (info->id == V4L2_PIX_FMT_FWHT ||
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 62ac9424c92a..95a8f2dc5341 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -556,7 +556,7 @@ int v4l2_m2m_querybuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 	ret = vb2_querybuf(vq, buf);
 
 	/* Adjust MMAP memory offsets for the CAPTURE queue */
-	if (buf->memory == V4L2_MEMORY_MMAP && !V4L2_TYPE_IS_OUTPUT(vq->type)) {
+	if (buf->memory == V4L2_MEMORY_MMAP && V4L2_TYPE_IS_CAPTURE(vq->type)) {
 		if (V4L2_TYPE_IS_MULTIPLANAR(vq->type)) {
 			for (i = 0; i < buf->length; ++i)
 				buf->m.planes[i].m.mem_offset
@@ -712,7 +712,7 @@ int v4l2_m2m_qbuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 	int ret;
 
 	vq = v4l2_m2m_get_vq(m2m_ctx, buf->type);
-	if (!V4L2_TYPE_IS_OUTPUT(vq->type) &&
+	if (V4L2_TYPE_IS_CAPTURE(vq->type) &&
 	    (buf->flags & V4L2_BUF_FLAG_REQUEST_FD)) {
 		dprintk("%s: requests cannot be used with capture buffers\n",
 			__func__);
@@ -729,7 +729,7 @@ int v4l2_m2m_qbuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 	 * buffer as DONE with LAST flag since it won't be queued on the
 	 * device.
 	 */
-	if (!V4L2_TYPE_IS_OUTPUT(vq->type) &&
+	if (V4L2_TYPE_IS_CAPTURE(vq->type) &&
 	    vb2_is_streaming(vq) && !vb2_start_streaming_called(vq) &&
 	   (v4l2_m2m_has_stopped(m2m_ctx) || v4l2_m2m_dst_buf_is_last(m2m_ctx)))
 		v4l2_m2m_force_last_buf_done(m2m_ctx, vq);
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index f28a94e2fa93..63859e8a0923 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -237,7 +237,7 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 			  enum v4l2_buf_type type)
 {
 	const struct hantro_fmt *fmt, *vpu_fmt;
-	bool capture = !V4L2_TYPE_IS_OUTPUT(type);
+	bool capture = V4L2_TYPE_IS_CAPTURE(type);
 	bool coded;
 
 	coded = capture == hantro_is_encoder_ctx(ctx);
diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 225eeca73356..fd68671f0286 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -489,7 +489,7 @@ static int rkvdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	const struct rkvdec_coded_fmt_desc *desc;
 	int ret;
 
-	if (!V4L2_TYPE_IS_OUTPUT(q->type))
+	if (V4L2_TYPE_IS_CAPTURE(q->type))
 		return 0;
 
 	desc = ctx->coded_fmt_desc;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 303805438814..c7b70ff53bc1 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -171,6 +171,8 @@ enum v4l2_buf_type {
 	 || (type) == V4L2_BUF_TYPE_SDR_OUTPUT			\
 	 || (type) == V4L2_BUF_TYPE_META_OUTPUT)
 
+#define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
+
 enum v4l2_tuner_type {
 	V4L2_TUNER_RADIO	     = 1,
 	V4L2_TUNER_ANALOG_TV	     = 2,
-- 
2.26.0.rc2

