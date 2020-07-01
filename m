Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69A1F210BF0
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 15:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730859AbgGANQc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 09:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729296AbgGANQa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 09:16:30 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2341EC03E979;
        Wed,  1 Jul 2020 06:16:30 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 606ED2A56A6
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 3/6] hantro: Rework how encoder and decoder are identified
Date:   Wed,  1 Jul 2020 10:16:04 -0300
Message-Id: <20200701131607.121988-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200701131607.121988-1-ezequiel@collabora.com>
References: <20200701131607.121988-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

So far we've been using the .buf_finish hook to distinguish
decoder from encoder. This is unnecessarily obfuscated.

Moreover, we want to move the buf_finish, so use a cleaner
scheme to distinguish the driver decoder/encoder type.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
v2:
* Get rid of the helper and simply use the flag,
  as pointed out by Robin and Philipp.
---
 drivers/staging/media/hantro/hantro.h      |  6 ++---
 drivers/staging/media/hantro/hantro_drv.c  |  9 +++----
 drivers/staging/media/hantro/hantro_v4l2.c | 28 +++++++++++-----------
 3 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 3005207fc6fb..2284e23d8500 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -199,6 +199,7 @@ struct hantro_dev {
  *
  * @dev:		VPU driver data to which the context belongs.
  * @fh:			V4L2 file handler.
+ * @is_encoder:		Decoder or encoder context?
  *
  * @sequence_cap:       Sequence counter for capture queue
  * @sequence_out:       Sequence counter for output queue
@@ -223,6 +224,7 @@ struct hantro_dev {
 struct hantro_ctx {
 	struct hantro_dev *dev;
 	struct v4l2_fh fh;
+	bool is_encoder;
 
 	u32 sequence_cap;
 	u32 sequence_out;
@@ -399,8 +401,6 @@ static inline void hantro_reg_write_s(struct hantro_dev *vpu,
 	vdpu_write(vpu, vdpu_read_mask(vpu, reg, val), reg->base);
 }
 
-bool hantro_is_encoder_ctx(const struct hantro_ctx *ctx);
-
 void *hantro_get_ctrl(struct hantro_ctx *ctx, u32 id);
 dma_addr_t hantro_get_ref(struct hantro_ctx *ctx, u64 ts);
 
@@ -420,7 +420,7 @@ static inline bool
 hantro_needs_postproc(const struct hantro_ctx *ctx,
 		      const struct hantro_fmt *fmt)
 {
-	return !hantro_is_encoder_ctx(ctx) && fmt->fourcc != V4L2_PIX_FMT_NV12;
+	return !ctx->is_encoder && fmt->fourcc != V4L2_PIX_FMT_NV12;
 }
 
 static inline dma_addr_t
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 0db8ad455160..9145d02e5d3c 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -195,11 +195,6 @@ static void device_run(void *priv)
 	hantro_job_finish(ctx->dev, ctx, 0, VB2_BUF_STATE_ERROR);
 }
 
-bool hantro_is_encoder_ctx(const struct hantro_ctx *ctx)
-{
-	return ctx->buf_finish == hantro_enc_buf_finish;
-}
-
 static struct v4l2_m2m_ops vpu_m2m_ops = {
 	.device_run = device_run,
 };
@@ -240,7 +235,7 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	 *
 	 * For the DMA destination buffer, we use a bounce buffer.
 	 */
-	if (hantro_is_encoder_ctx(ctx)) {
+	if (ctx->is_encoder) {
 		dst_vq->mem_ops = &vb2_vmalloc_memops;
 	} else {
 		dst_vq->bidirectional = true;
@@ -420,8 +415,10 @@ static int hantro_open(struct file *filp)
 	if (func->id == MEDIA_ENT_F_PROC_VIDEO_ENCODER) {
 		allowed_codecs = vpu->variant->codec & HANTRO_ENCODERS;
 		ctx->buf_finish = hantro_enc_buf_finish;
+		ctx->is_encoder = true;
 	} else if (func->id == MEDIA_ENT_F_PROC_VIDEO_DECODER) {
 		allowed_codecs = vpu->variant->codec & HANTRO_DECODERS;
+		ctx->is_encoder = false;
 	} else {
 		ret = -ENODEV;
 		goto err_ctx_free;
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index f28a94e2fa93..785d59331d7c 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -40,7 +40,7 @@ hantro_get_formats(const struct hantro_ctx *ctx, unsigned int *num_fmts)
 {
 	const struct hantro_fmt *formats;
 
-	if (hantro_is_encoder_ctx(ctx)) {
+	if (ctx->is_encoder) {
 		formats = ctx->dev->variant->enc_fmts;
 		*num_fmts = ctx->dev->variant->num_enc_fmts;
 	} else {
@@ -55,7 +55,7 @@ static const struct hantro_fmt *
 hantro_get_postproc_formats(const struct hantro_ctx *ctx,
 			    unsigned int *num_fmts)
 {
-	if (hantro_is_encoder_ctx(ctx)) {
+	if (ctx->is_encoder) {
 		*num_fmts = 0;
 		return NULL;
 	}
@@ -158,7 +158,7 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	 *    not MODE_NONE.
 	 *  - on the output side we want to filter out all MODE_NONE formats.
 	 */
-	skip_mode_none = capture == hantro_is_encoder_ctx(ctx);
+	skip_mode_none = capture == ctx->is_encoder;
 
 	formats = hantro_get_formats(ctx, &num_fmts);
 	for (i = 0; i < num_fmts; i++) {
@@ -240,7 +240,7 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 	bool capture = !V4L2_TYPE_IS_OUTPUT(type);
 	bool coded;
 
-	coded = capture == hantro_is_encoder_ctx(ctx);
+	coded = capture == ctx->is_encoder;
 
 	vpu_debug(4, "trying format %c%c%c%c\n",
 		  (pix_mp->pixelformat & 0x7f),
@@ -257,7 +257,7 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 	if (coded) {
 		pix_mp->num_planes = 1;
 		vpu_fmt = fmt;
-	} else if (hantro_is_encoder_ctx(ctx)) {
+	} else if (ctx->is_encoder) {
 		vpu_fmt = ctx->vpu_dst_fmt;
 	} else {
 		vpu_fmt = ctx->vpu_src_fmt;
@@ -330,7 +330,7 @@ hantro_reset_encoded_fmt(struct hantro_ctx *ctx)
 
 	vpu_fmt = hantro_get_default_fmt(ctx, true);
 
-	if (hantro_is_encoder_ctx(ctx)) {
+	if (ctx->is_encoder) {
 		ctx->vpu_dst_fmt = vpu_fmt;
 		fmt = &ctx->dst_fmt;
 	} else {
@@ -341,7 +341,7 @@ hantro_reset_encoded_fmt(struct hantro_ctx *ctx)
 	hantro_reset_fmt(fmt, vpu_fmt);
 	fmt->width = vpu_fmt->frmsize.min_width;
 	fmt->height = vpu_fmt->frmsize.min_height;
-	if (hantro_is_encoder_ctx(ctx))
+	if (ctx->is_encoder)
 		hantro_set_fmt_cap(ctx, fmt);
 	else
 		hantro_set_fmt_out(ctx, fmt);
@@ -355,7 +355,7 @@ hantro_reset_raw_fmt(struct hantro_ctx *ctx)
 
 	raw_vpu_fmt = hantro_get_default_fmt(ctx, false);
 
-	if (hantro_is_encoder_ctx(ctx)) {
+	if (ctx->is_encoder) {
 		ctx->vpu_src_fmt = raw_vpu_fmt;
 		raw_fmt = &ctx->src_fmt;
 		encoded_fmt = &ctx->dst_fmt;
@@ -368,7 +368,7 @@ hantro_reset_raw_fmt(struct hantro_ctx *ctx)
 	hantro_reset_fmt(raw_fmt, raw_vpu_fmt);
 	raw_fmt->width = encoded_fmt->width;
 	raw_fmt->width = encoded_fmt->width;
-	if (hantro_is_encoder_ctx(ctx))
+	if (ctx->is_encoder)
 		hantro_set_fmt_out(ctx, raw_fmt);
 	else
 		hantro_set_fmt_cap(ctx, raw_fmt);
@@ -409,7 +409,7 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
 	if (ret)
 		return ret;
 
-	if (!hantro_is_encoder_ctx(ctx)) {
+	if (!ctx->is_encoder) {
 		struct vb2_queue *peer_vq;
 
 		/*
@@ -450,7 +450,7 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
 	 * Note that hantro_reset_raw_fmt() also propagates size
 	 * changes to the raw format.
 	 */
-	if (!hantro_is_encoder_ctx(ctx))
+	if (!ctx->is_encoder)
 		hantro_reset_raw_fmt(ctx);
 
 	/* Colorimetry information are always propagated. */
@@ -479,7 +479,7 @@ static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 	if (vb2_is_busy(vq))
 		return -EBUSY;
 
-	if (hantro_is_encoder_ctx(ctx)) {
+	if (ctx->is_encoder) {
 		struct vb2_queue *peer_vq;
 
 		/*
@@ -512,7 +512,7 @@ static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 	 * Note that hantro_reset_raw_fmt() also propagates size
 	 * changes to the raw format.
 	 */
-	if (hantro_is_encoder_ctx(ctx))
+	if (ctx->is_encoder)
 		hantro_reset_raw_fmt(ctx);
 
 	/* Colorimetry information are always propagated. */
@@ -655,7 +655,7 @@ static bool hantro_vq_is_coded(struct vb2_queue *q)
 {
 	struct hantro_ctx *ctx = vb2_get_drv_priv(q);
 
-	return hantro_is_encoder_ctx(ctx) != V4L2_TYPE_IS_OUTPUT(q->type);
+	return ctx->is_encoder != V4L2_TYPE_IS_OUTPUT(q->type);
 }
 
 static int hantro_start_streaming(struct vb2_queue *q, unsigned int count)
-- 
2.26.0.rc2

