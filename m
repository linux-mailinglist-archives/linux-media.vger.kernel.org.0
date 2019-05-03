Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A77212CC5
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 13:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbfECLrc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 07:47:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46286 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727775AbfECLrb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 May 2019 07:47:31 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6D64F283630;
        Fri,  3 May 2019 12:47:28 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v5 10/15] rockchip/vpu: Prepare things to support decoders
Date:   Fri,  3 May 2019 13:47:14 +0200
Message-Id: <20190503114719.28784-11-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503114719.28784-1-boris.brezillon@collabora.com>
References: <20190503114719.28784-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code in rockchip_vpu_v4l2 was hardcoded for encoder support.
Modify it more generic to support the decoder case so that we can
re-use the same vb2/v4l2 ops for both devices.

Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes from v4:
* Fix s_fmt() implems WRT to format properties propagation
* s/fmt->pix/fmt->pix_mp/ in try_fmt() (Reported by Hans)

Changes from v3:
* None

Changes from v2:
* New patch
---
 .../staging/media/rockchip/vpu/rockchip_vpu.h |   6 +
 .../media/rockchip/vpu/rockchip_vpu_v4l2.c    | 551 ++++++++++--------
 2 files changed, 325 insertions(+), 232 deletions(-)

diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu.h b/drivers/staging/media/rockchip/vpu/rockchip_vpu.h
index aba257c663a7..0d24fd257a2b 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu.h
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu.h
@@ -262,4 +262,10 @@ static inline u32 vepu_read(struct rockchip_vpu_dev *vpu, u32 reg)
 	return val;
 }
 
+static inline bool
+rockchip_vpu_is_encoder_ctx(const struct rockchip_vpu_ctx *ctx)
+{
+	return true;
+}
+
 #endif /* ROCKCHIP_VPU_H_ */
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
index e30056dc6758..1ab558d6492d 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
@@ -31,14 +31,23 @@
 #include "rockchip_vpu_v4l2.h"
 
 static const struct rockchip_vpu_fmt *
-rockchip_vpu_find_format(struct rockchip_vpu_ctx *ctx, u32 fourcc)
+rockchip_vpu_get_formats(const struct rockchip_vpu_ctx *ctx,
+			 unsigned int *num_fmts)
 {
-	struct rockchip_vpu_dev *dev = ctx->dev;
 	const struct rockchip_vpu_fmt *formats;
-	unsigned int num_fmts, i;
 
-	formats = dev->variant->enc_fmts;
-	num_fmts = dev->variant->num_enc_fmts;
+	formats = ctx->dev->variant->enc_fmts;
+	*num_fmts = ctx->dev->variant->num_enc_fmts;
+
+	return formats;
+}
+
+static const struct rockchip_vpu_fmt *
+rockchip_vpu_find_format(const struct rockchip_vpu_fmt *formats,
+			 unsigned int num_fmts, u32 fourcc)
+{
+	unsigned int i;
+
 	for (i = 0; i < num_fmts; i++)
 		if (formats[i].fourcc == fourcc)
 			return &formats[i];
@@ -46,14 +55,11 @@ rockchip_vpu_find_format(struct rockchip_vpu_ctx *ctx, u32 fourcc)
 }
 
 static const struct rockchip_vpu_fmt *
-rockchip_vpu_get_default_fmt(struct rockchip_vpu_ctx *ctx, bool bitstream)
+rockchip_vpu_get_default_fmt(const struct rockchip_vpu_fmt *formats,
+			     unsigned int num_fmts, bool bitstream)
 {
-	struct rockchip_vpu_dev *dev = ctx->dev;
-	const struct rockchip_vpu_fmt *formats;
-	unsigned int num_fmts, i;
+	unsigned int i;
 
-	formats = dev->variant->enc_fmts;
-	num_fmts = dev->variant->num_enc_fmts;
 	for (i = 0; i < num_fmts; i++) {
 		if (bitstream == (formats[i].codec_mode != RK_VPU_MODE_NONE))
 			return &formats[i];
@@ -78,7 +84,8 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	struct rockchip_vpu_ctx *ctx = fh_to_ctx(priv);
-	const struct rockchip_vpu_fmt *fmt;
+	const struct rockchip_vpu_fmt *formats, *fmt;
+	unsigned int num_fmts;
 
 	if (fsize->index != 0) {
 		vpu_debug(0, "invalid frame size index (expected 0, got %d)\n",
@@ -86,7 +93,8 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 		return -EINVAL;
 	}
 
-	fmt = rockchip_vpu_find_format(ctx, fsize->pixel_format);
+	formats = rockchip_vpu_get_formats(ctx, &num_fmts);
+	fmt = rockchip_vpu_find_format(formats, num_fmts, fsize->pixel_format);
 	if (!fmt) {
 		vpu_debug(0, "unsupported bitstream format (%08x)\n",
 			  fsize->pixel_format);
@@ -103,19 +111,32 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_cap_mplane(struct file *file, void *priv,
-					  struct v4l2_fmtdesc *f)
-{
-	struct rockchip_vpu_dev *dev = video_drvdata(file);
-	const struct rockchip_vpu_fmt *fmt;
-	const struct rockchip_vpu_fmt *formats;
-	int num_fmts, i, j = 0;
+static int vidioc_enum_fmt(struct file *file, void *priv,
+			   struct v4l2_fmtdesc *f, bool capture)
 
-	formats = dev->variant->enc_fmts;
-	num_fmts = dev->variant->num_enc_fmts;
+{
+	struct rockchip_vpu_ctx *ctx = fh_to_ctx(priv);
+	const struct rockchip_vpu_fmt *fmt, *formats;
+	unsigned int num_fmts, i, j = 0;
+	bool skip_mode_none;
+
+	/*
+	 * When dealing with an encoder:
+	 *  - on the capture side we want to filter out all MODE_NONE formats.
+	 *  - on the output side we want to filter out all formats that are
+	 *    not MODE_NONE.
+	 * When dealing with a decoder:
+	 *  - on the capture side we want to filter out all formats that are
+	 *    not MODE_NONE.
+	 *  - on the output side we want to filter out all MODE_NONE formats.
+	 */
+	skip_mode_none = capture == rockchip_vpu_is_encoder_ctx(ctx);
+
+	formats = rockchip_vpu_get_formats(ctx, &num_fmts);
 	for (i = 0; i < num_fmts; i++) {
-		/* Skip uncompressed formats */
-		if (formats[i].codec_mode == RK_VPU_MODE_NONE)
+		bool mode_none = formats[i].codec_mode == RK_VPU_MODE_NONE;
+
+		if (skip_mode_none == mode_none)
 			continue;
 		if (j == f->index) {
 			fmt = &formats[i];
@@ -127,27 +148,16 @@ static int vidioc_enum_fmt_vid_cap_mplane(struct file *file, void *priv,
 	return -EINVAL;
 }
 
+static int vidioc_enum_fmt_vid_cap_mplane(struct file *file, void *priv,
+					  struct v4l2_fmtdesc *f)
+{
+	return vidioc_enum_fmt(file, priv, f, true);
+}
+
 static int vidioc_enum_fmt_vid_out_mplane(struct file *file, void *priv,
 					  struct v4l2_fmtdesc *f)
 {
-	struct rockchip_vpu_dev *dev = video_drvdata(file);
-	const struct rockchip_vpu_fmt *formats;
-	const struct rockchip_vpu_fmt *fmt;
-	int num_fmts, i, j = 0;
-
-	formats = dev->variant->enc_fmts;
-	num_fmts = dev->variant->num_enc_fmts;
-	for (i = 0; i < num_fmts; i++) {
-		if (formats[i].codec_mode != RK_VPU_MODE_NONE)
-			continue;
-		if (j == f->index) {
-			fmt = &formats[i];
-			f->pixelformat = fmt->fourcc;
-			return 0;
-		}
-		++j;
-	}
-	return -EINVAL;
+	return vidioc_enum_fmt(file, priv, f, false);
 }
 
 static int vidioc_g_fmt_out_mplane(struct file *file, void *priv,
@@ -176,128 +186,149 @@ static int vidioc_g_fmt_cap_mplane(struct file *file, void *priv,
 	return 0;
 }
 
-static int
-vidioc_try_fmt_cap_mplane(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
+			  bool capture)
 {
 	struct rockchip_vpu_ctx *ctx = fh_to_ctx(priv);
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	const struct rockchip_vpu_fmt *fmt;
+	const struct rockchip_vpu_fmt *formats, *fmt, *vpu_fmt;
+	unsigned int num_fmts;
+	bool coded;
 
-	vpu_debug(4, "%c%c%c%c\n",
+	coded = capture == rockchip_vpu_is_encoder_ctx(ctx);
+
+	vpu_debug(4, "trying format %c%c%c%c\n",
 		  (pix_mp->pixelformat & 0x7f),
 		  (pix_mp->pixelformat >> 8) & 0x7f,
 		  (pix_mp->pixelformat >> 16) & 0x7f,
 		  (pix_mp->pixelformat >> 24) & 0x7f);
 
-	fmt = rockchip_vpu_find_format(ctx, pix_mp->pixelformat);
+	formats = rockchip_vpu_get_formats(ctx, &num_fmts);
+	fmt = rockchip_vpu_find_format(formats, num_fmts, pix_mp->pixelformat);
 	if (!fmt) {
-		fmt = rockchip_vpu_get_default_fmt(ctx, true);
-		f->fmt.pix.pixelformat = fmt->fourcc;
+		fmt = rockchip_vpu_get_default_fmt(formats, num_fmts, coded);
+		f->fmt.pix_mp.pixelformat = fmt->fourcc;
+	}
+
+	if (coded) {
+		pix_mp->num_planes = 1;
+		vpu_fmt = fmt;
+	} else if (rockchip_vpu_is_encoder_ctx(ctx)) {
+		vpu_fmt = ctx->vpu_dst_fmt;
+	} else {
+		vpu_fmt = ctx->vpu_src_fmt;
+		/*
+		 * Width/height on the CAPTURE end of a decoder are ignored and
+		 * replaced by the OUTPUT ones.
+		 */
+		pix_mp->width = ctx->src_fmt.width;
+		pix_mp->height = ctx->src_fmt.height;
 	}
 
-	pix_mp->num_planes = 1;
 	pix_mp->field = V4L2_FIELD_NONE;
 
 	v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->height,
-				       &fmt->frmsize);
+				       &vpu_fmt->frmsize);
 
-	/*
-	 * For compressed formats the application can specify
-	 * sizeimage. If the application passes a zero sizeimage,
-	 * let's default to the maximum frame size.
-	 */
-	if (!pix_mp->plane_fmt[0].sizeimage)
+	if (!coded) {
+		/* Fill remaining fields */
+		v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, pix_mp->width,
+				    pix_mp->height);
+	} else if (!pix_mp->plane_fmt[0].sizeimage) {
+		/*
+		 * For coded formats the application can specify
+		 * sizeimage. If the application passes a zero sizeimage,
+		 * let's default to the maximum frame size.
+		 */
 		pix_mp->plane_fmt[0].sizeimage = fmt->header_size +
 			pix_mp->width * pix_mp->height * fmt->max_depth;
-	memset(pix_mp->plane_fmt[0].reserved, 0,
-	       sizeof(pix_mp->plane_fmt[0].reserved));
+	}
+
 	return 0;
 }
 
-static int
-vidioc_try_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
+static int vidioc_try_fmt_cap_mplane(struct file *file, void *priv,
+				     struct v4l2_format *f)
 {
-	struct rockchip_vpu_ctx *ctx = fh_to_ctx(priv);
-	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	const struct rockchip_vpu_fmt *fmt;
-	int i;
-
-	vpu_debug(4, "%c%c%c%c\n",
-		  (pix_mp->pixelformat & 0x7f),
-		  (pix_mp->pixelformat >> 8) & 0x7f,
-		  (pix_mp->pixelformat >> 16) & 0x7f,
-		  (pix_mp->pixelformat >> 24) & 0x7f);
-
-	fmt = rockchip_vpu_find_format(ctx, pix_mp->pixelformat);
-	if (!fmt) {
-		fmt = rockchip_vpu_get_default_fmt(ctx, false);
-		f->fmt.pix.pixelformat = fmt->fourcc;
-	}
-
-	pix_mp->field = V4L2_FIELD_NONE;
-
-	v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->height,
-				       &ctx->vpu_dst_fmt->frmsize);
-
-	/* Fill remaining fields */
-	v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, pix_mp->width,
-			    pix_mp->height);
-
-	for (i = 0; i < pix_mp->num_planes; i++) {
-		memset(pix_mp->plane_fmt[i].reserved, 0,
-		       sizeof(pix_mp->plane_fmt[i].reserved));
-	}
-	return 0;
+	return vidioc_try_fmt(file, priv, f, true);
 }
 
-static void rockchip_vpu_reset_dst_fmt(struct rockchip_vpu_dev *vpu,
-				       struct rockchip_vpu_ctx *ctx)
+static int vidioc_try_fmt_out_mplane(struct file *file, void *priv,
+				     struct v4l2_format *f)
 {
-	struct v4l2_pix_format_mplane *fmt = &ctx->dst_fmt;
-
-	ctx->vpu_dst_fmt = rockchip_vpu_get_default_fmt(ctx, true);
+	return vidioc_try_fmt(file, priv, f, false);
+}
 
+static void
+rockchip_vpu_reset_fmt(struct v4l2_pix_format_mplane *fmt,
+		       const struct rockchip_vpu_fmt *vpu_fmt)
+{
 	memset(fmt, 0, sizeof(*fmt));
 
+	fmt->pixelformat = vpu_fmt->fourcc;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_JPEG,
+	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
+	fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+}
+
+static void
+rockchip_vpu_reset_encoded_fmt(struct rockchip_vpu_ctx *ctx)
+{
+	const struct rockchip_vpu_fmt *vpu_fmt, *formats;
+	struct v4l2_pix_format_mplane *fmt;
+	unsigned int num_fmts;
+
+	formats = rockchip_vpu_get_formats(ctx, &num_fmts);
+	vpu_fmt = rockchip_vpu_get_default_fmt(formats, num_fmts, true);
+
+	if (rockchip_vpu_is_encoder_ctx(ctx)) {
+		ctx->vpu_dst_fmt = vpu_fmt;
+		fmt = &ctx->dst_fmt;
+	} else {
+		ctx->vpu_src_fmt = vpu_fmt;
+		fmt = &ctx->src_fmt;
+	}
+
+	rockchip_vpu_reset_fmt(fmt, vpu_fmt);
 	fmt->num_planes = 1;
-	v4l2_apply_frmsize_constraints(&fmt->width, &fmt->height,
-				       &ctx->vpu_dst_fmt->frmsize);
-	fmt->pixelformat = ctx->vpu_dst_fmt->fourcc;
-	fmt->field = V4L2_FIELD_NONE;
-	fmt->colorspace = V4L2_COLORSPACE_JPEG,
-	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
-	fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
-	fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
-
-	fmt->plane_fmt[0].sizeimage = ctx->vpu_dst_fmt->header_size +
-		fmt->width * fmt->height * ctx->vpu_dst_fmt->max_depth;
+	fmt->width = vpu_fmt->frmsize.min_width;
+	fmt->height = vpu_fmt->frmsize.min_height;
+	fmt->plane_fmt[0].sizeimage = vpu_fmt->header_size +
+				fmt->width * fmt->height * vpu_fmt->max_depth;
 }
 
-static void rockchip_vpu_reset_src_fmt(struct rockchip_vpu_dev *vpu,
-				       struct rockchip_vpu_ctx *ctx)
+static void
+rockchip_vpu_reset_raw_fmt(struct rockchip_vpu_ctx *ctx)
 {
-	struct v4l2_pix_format_mplane *fmt = &ctx->src_fmt;
+	const struct rockchip_vpu_fmt *raw_vpu_fmt, *formats;
+	struct v4l2_pix_format_mplane *raw_fmt, *encoded_fmt;
+	unsigned int num_fmts;
 
-	ctx->vpu_src_fmt = rockchip_vpu_get_default_fmt(ctx, false);
+	formats = rockchip_vpu_get_formats(ctx, &num_fmts);
+	raw_vpu_fmt = rockchip_vpu_get_default_fmt(formats, num_fmts, false);
 
-	memset(fmt, 0, sizeof(*fmt));
+	if (rockchip_vpu_is_encoder_ctx(ctx)) {
+		ctx->vpu_src_fmt = raw_vpu_fmt;
+		raw_fmt = &ctx->src_fmt;
+		encoded_fmt = &ctx->dst_fmt;
+	} else {
+		ctx->vpu_dst_fmt = raw_vpu_fmt;
+		raw_fmt = &ctx->dst_fmt;
+		encoded_fmt = &ctx->src_fmt;
+	}
 
-	v4l2_apply_frmsize_constraints(&fmt->width, &fmt->height,
-				       &ctx->vpu_src_fmt->frmsize);
-	fmt->field = V4L2_FIELD_NONE;
-	fmt->colorspace = V4L2_COLORSPACE_JPEG,
-	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
-	fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
-	fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
-
-	v4l2_fill_pixfmt_mp(fmt, ctx->vpu_src_fmt->fourcc, fmt->width,
-			    fmt->height);
+	rockchip_vpu_reset_fmt(raw_fmt, raw_vpu_fmt);
+	v4l2_fill_pixfmt_mp(raw_fmt, raw_vpu_fmt->fourcc,
+			    encoded_fmt->width,
+			    encoded_fmt->height);
 }
 
 void rockchip_vpu_reset_fmts(struct rockchip_vpu_ctx *ctx)
 {
-	rockchip_vpu_reset_dst_fmt(ctx->dev, ctx);
-	rockchip_vpu_reset_src_fmt(ctx->dev, ctx);
+	rockchip_vpu_reset_encoded_fmt(ctx);
+	rockchip_vpu_reset_raw_fmt(ctx);
 }
 
 static int
@@ -305,81 +336,126 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
 	struct rockchip_vpu_ctx *ctx = fh_to_ctx(priv);
+	const struct rockchip_vpu_fmt *formats;
+	unsigned int num_fmts;
 	struct vb2_queue *vq;
 	int ret;
 
-	/* Change not allowed if queue is streaming. */
+	/* Change not allowed if queue is busy. */
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (vb2_is_streaming(vq))
+	if (vb2_is_busy(vq))
 		return -EBUSY;
 
+	if (!rockchip_vpu_is_encoder_ctx(ctx)) {
+		struct vb2_queue *peer_vq;
+
+		/*
+		 * Since format change on the OUTPUT queue will reset
+		 * the CAPTURE queue, we can't allow doing so
+		 * when the CAPTURE queue has buffers allocated.
+		 */
+		peer_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
+					  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+		if (vb2_is_busy(peer_vq))
+			return -EBUSY;
+	}
+
 	ret = vidioc_try_fmt_out_mplane(file, priv, f);
 	if (ret)
 		return ret;
 
-	ctx->vpu_src_fmt = rockchip_vpu_find_format(ctx, pix_mp->pixelformat);
+	formats = rockchip_vpu_get_formats(ctx, &num_fmts);
+	ctx->vpu_src_fmt = rockchip_vpu_find_format(formats, num_fmts,
+						    pix_mp->pixelformat);
 	ctx->src_fmt = *pix_mp;
 
-	/* Propagate to the CAPTURE format */
-	ctx->dst_fmt.colorspace = pix_mp->colorspace;
-	ctx->dst_fmt.ycbcr_enc = pix_mp->ycbcr_enc;
-	ctx->dst_fmt.xfer_func = pix_mp->xfer_func;
-	ctx->dst_fmt.quantization = pix_mp->quantization;
-	ctx->dst_fmt.width = pix_mp->width;
-	ctx->dst_fmt.height = pix_mp->height;
-
-	vpu_debug(0, "OUTPUT codec mode: %d\n", ctx->vpu_src_fmt->codec_mode);
-	vpu_debug(0, "fmt - w: %d, h: %d\n",
-		  pix_mp->width, pix_mp->height);
-	return 0;
-}
-
-static int
-vidioc_s_fmt_cap_mplane(struct file *file, void *priv, struct v4l2_format *f)
-{
-	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct rockchip_vpu_ctx *ctx = fh_to_ctx(priv);
-	struct rockchip_vpu_dev *vpu = ctx->dev;
-	struct vb2_queue *vq, *peer_vq;
-	int ret;
-
-	/* Change not allowed if queue is streaming. */
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (vb2_is_streaming(vq))
-		return -EBUSY;
-
-	/*
-	 * Since format change on the CAPTURE queue will reset
-	 * the OUTPUT queue, we can't allow doing so
-	 * when the OUTPUT queue has buffers allocated.
-	 */
-	peer_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
-				  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	if (vb2_is_busy(peer_vq) &&
-	    (pix_mp->pixelformat != ctx->dst_fmt.pixelformat ||
-	     pix_mp->height != ctx->dst_fmt.height ||
-	     pix_mp->width != ctx->dst_fmt.width))
-		return -EBUSY;
-
-	ret = vidioc_try_fmt_cap_mplane(file, priv, f);
-	if (ret)
-		return ret;
-
-	ctx->vpu_dst_fmt = rockchip_vpu_find_format(ctx, pix_mp->pixelformat);
-	ctx->dst_fmt = *pix_mp;
-
-	vpu_debug(0, "CAPTURE codec mode: %d\n", ctx->vpu_dst_fmt->codec_mode);
-	vpu_debug(0, "fmt - w: %d, h: %d\n",
-		  pix_mp->width, pix_mp->height);
-
 	/*
 	 * Current raw format might have become invalid with newly
 	 * selected codec, so reset it to default just to be safe and
 	 * keep internal driver state sane. User is mandated to set
 	 * the raw format again after we return, so we don't need
 	 * anything smarter.
+	 * Note that rockchip_vpu_reset_raw_fmt() also propagates size
+	 * changes to the raw format.
 	 */
-	rockchip_vpu_reset_src_fmt(vpu, ctx);
+	if (!rockchip_vpu_is_encoder_ctx(ctx))
+		rockchip_vpu_reset_raw_fmt(ctx);
+
+	/* Colorimetry information are always propagated. */
+	ctx->dst_fmt.colorspace = pix_mp->colorspace;
+	ctx->dst_fmt.ycbcr_enc = pix_mp->ycbcr_enc;
+	ctx->dst_fmt.xfer_func = pix_mp->xfer_func;
+	ctx->dst_fmt.quantization = pix_mp->quantization;
+
+	vpu_debug(0, "OUTPUT codec mode: %d\n", ctx->vpu_src_fmt->codec_mode);
+	vpu_debug(0, "fmt - w: %d, h: %d\n",
+		  pix_mp->width, pix_mp->height);
+	return 0;
+}
+
+static int vidioc_s_fmt_cap_mplane(struct file *file, void *priv,
+				   struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	struct rockchip_vpu_ctx *ctx = fh_to_ctx(priv);
+	const struct rockchip_vpu_fmt *formats;
+	struct vb2_queue *vq;
+	unsigned int num_fmts;
+	int ret;
+
+	/* Change not allowed if queue is busy. */
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+	if (vb2_is_busy(vq))
+		return -EBUSY;
+
+	if (rockchip_vpu_is_encoder_ctx(ctx)) {
+		struct vb2_queue *peer_vq;
+
+		/*
+		 * Since format change on the CAPTURE queue will reset
+		 * the OUTPUT queue, we can't allow doing so
+		 * when the OUTPUT queue has buffers allocated.
+		 */
+		peer_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
+					  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		if (vb2_is_busy(peer_vq) &&
+		    (pix_mp->pixelformat != ctx->dst_fmt.pixelformat ||
+		     pix_mp->height != ctx->dst_fmt.height ||
+		     pix_mp->width != ctx->dst_fmt.width))
+			return -EBUSY;
+	}
+
+	ret = vidioc_try_fmt_cap_mplane(file, priv, f);
+	if (ret)
+		return ret;
+
+	formats = rockchip_vpu_get_formats(ctx, &num_fmts);
+	ctx->vpu_dst_fmt = rockchip_vpu_find_format(formats, num_fmts,
+						    pix_mp->pixelformat);
+	ctx->dst_fmt = *pix_mp;
+
+	/*
+	 * Current raw format might have become invalid with newly
+	 * selected codec, so reset it to default just to be safe and
+	 * keep internal driver state sane. User is mandated to set
+	 * the raw format again after we return, so we don't need
+	 * anything smarter.
+	 * Note that rockchip_vpu_reset_raw_fmt() also propagates size
+	 * changes to the raw format.
+	 */
+	if (rockchip_vpu_is_encoder_ctx(ctx))
+		rockchip_vpu_reset_raw_fmt(ctx);
+
+	/* Colorimetry information are always propagated. */
+	ctx->src_fmt.colorspace = pix_mp->colorspace;
+	ctx->src_fmt.ycbcr_enc = pix_mp->ycbcr_enc;
+	ctx->src_fmt.xfer_func = pix_mp->xfer_func;
+	ctx->src_fmt.quantization = pix_mp->quantization;
+
+	vpu_debug(0, "CAPTURE codec mode: %d\n", ctx->vpu_dst_fmt->codec_mode);
+	vpu_debug(0, "fmt - w: %d, h: %d\n",
+		  pix_mp->width, pix_mp->height);
+
 	return 0;
 }
 
@@ -449,48 +525,37 @@ rockchip_vpu_queue_setup(struct vb2_queue *vq,
 	return 0;
 }
 
-static int rockchip_vpu_buf_prepare(struct vb2_buffer *vb)
+static int
+rockchip_vpu_buf_plane_check(struct vb2_buffer *vb,
+			     const struct rockchip_vpu_fmt *vpu_fmt,
+			     struct v4l2_pix_format_mplane *pixfmt)
 {
-	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
-	struct vb2_queue *vq = vb->vb2_queue;
-	struct rockchip_vpu_ctx *ctx = vb2_get_drv_priv(vq);
-	struct v4l2_pix_format_mplane *pixfmt;
 	unsigned int sz;
-	int ret = 0;
 	int i;
 
-	switch (vq->type) {
-	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		pixfmt = &ctx->dst_fmt;
-		break;
-	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		pixfmt = &ctx->src_fmt;
-
-		if (vbuf->field == V4L2_FIELD_ANY)
-			vbuf->field = V4L2_FIELD_NONE;
-		if (vbuf->field != V4L2_FIELD_NONE) {
-			vpu_debug(4, "field %d not supported\n",
-				  vbuf->field);
-			return -EINVAL;
-		}
-		break;
-	default:
-		vpu_err("invalid queue type: %d\n", vq->type);
-		return -EINVAL;
-	}
-
 	for (i = 0; i < pixfmt->num_planes; ++i) {
 		sz = pixfmt->plane_fmt[i].sizeimage;
 		vpu_debug(4, "plane %d size: %ld, sizeimage: %u\n",
 			  i, vb2_plane_size(vb, i), sz);
 		if (vb2_plane_size(vb, i) < sz) {
-			vpu_err("plane %d is too small\n", i);
-			ret = -EINVAL;
-			break;
+			vpu_err("plane %d is too small for output\n", i);
+			return -EINVAL;
 		}
 	}
+	return 0;
+}
 
-	return ret;
+static int rockchip_vpu_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct rockchip_vpu_ctx *ctx = vb2_get_drv_priv(vq);
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type))
+		return rockchip_vpu_buf_plane_check(vb, ctx->vpu_src_fmt,
+						    &ctx->src_fmt);
+
+	return rockchip_vpu_buf_plane_check(vb, ctx->vpu_dst_fmt,
+					    &ctx->dst_fmt);
 }
 
 static void rockchip_vpu_buf_queue(struct vb2_buffer *vb)
@@ -501,10 +566,17 @@ static void rockchip_vpu_buf_queue(struct vb2_buffer *vb)
 	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
 }
 
-static int rockchip_vpu_start_streaming(struct vb2_queue *q, unsigned int count)
+static bool rockchip_vpu_vq_is_coded(struct vb2_queue *q)
+{
+	struct rockchip_vpu_ctx *ctx = vb2_get_drv_priv(q);
+
+	return rockchip_vpu_is_encoder_ctx(ctx) != V4L2_TYPE_IS_OUTPUT(q->type);
+}
+
+static int rockchip_vpu_start_streaming(struct vb2_queue *q,
+					unsigned int count)
 {
 	struct rockchip_vpu_ctx *ctx = vb2_get_drv_priv(q);
-	enum rockchip_vpu_codec_mode codec_mode;
 	int ret = 0;
 
 	if (V4L2_TYPE_IS_OUTPUT(q->type))
@@ -512,38 +584,33 @@ static int rockchip_vpu_start_streaming(struct vb2_queue *q, unsigned int count)
 	else
 		ctx->sequence_cap = 0;
 
-	/* Set codec_ops for the chosen destination format */
-	codec_mode = ctx->vpu_dst_fmt->codec_mode;
+	if (rockchip_vpu_vq_is_coded(q)) {
+		enum rockchip_vpu_codec_mode codec_mode;
 
-	vpu_debug(4, "Codec mode = %d\n", codec_mode);
-	ctx->codec_ops = &ctx->dev->variant->codec_ops[codec_mode];
+		if (V4L2_TYPE_IS_OUTPUT(q->type))
+			codec_mode = ctx->vpu_src_fmt->codec_mode;
+		else
+			codec_mode = ctx->vpu_dst_fmt->codec_mode;
 
-	if (!V4L2_TYPE_IS_OUTPUT(q->type))
+		vpu_debug(4, "Codec mode = %d\n", codec_mode);
+		ctx->codec_ops = &ctx->dev->variant->codec_ops[codec_mode];
 		if (ctx->codec_ops && ctx->codec_ops->init)
 			ret = ctx->codec_ops->init(ctx);
+	}
+
 	return ret;
 }
 
-static void rockchip_vpu_stop_streaming(struct vb2_queue *q)
+static void
+rockchip_vpu_return_bufs(struct vb2_queue *q,
+			 struct vb2_v4l2_buffer *(*buf_remove)(struct v4l2_m2m_ctx *))
 {
 	struct rockchip_vpu_ctx *ctx = vb2_get_drv_priv(q);
 
-	if (!V4L2_TYPE_IS_OUTPUT(q->type))
-		if (ctx->codec_ops && ctx->codec_ops->exit)
-			ctx->codec_ops->exit(ctx);
-
-	/*
-	 * The mem2mem framework calls v4l2_m2m_cancel_job before
-	 * .stop_streaming, so there isn't any job running and
-	 * it is safe to return all the buffers.
-	 */
 	for (;;) {
 		struct vb2_v4l2_buffer *vbuf;
 
-		if (V4L2_TYPE_IS_OUTPUT(q->type))
-			vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-		else
-			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+		vbuf = buf_remove(ctx->fh.m2m_ctx);
 		if (!vbuf)
 			break;
 		v4l2_ctrl_request_complete(vbuf->vb2_buf.req_obj.req,
@@ -552,6 +619,26 @@ static void rockchip_vpu_stop_streaming(struct vb2_queue *q)
 	}
 }
 
+static void rockchip_vpu_stop_streaming(struct vb2_queue *q)
+{
+	struct rockchip_vpu_ctx *ctx = vb2_get_drv_priv(q);
+
+	if (rockchip_vpu_vq_is_coded(q)) {
+		if (ctx->codec_ops && ctx->codec_ops->exit)
+			ctx->codec_ops->exit(ctx);
+	}
+
+	/*
+	 * The mem2mem framework calls v4l2_m2m_cancel_job before
+	 * .stop_streaming, so there isn't any job running and
+	 * it is safe to return all the buffers.
+	 */
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		rockchip_vpu_return_bufs(q, v4l2_m2m_src_buf_remove);
+	else
+		rockchip_vpu_return_bufs(q, v4l2_m2m_dst_buf_remove);
+}
+
 static void rockchip_vpu_buf_request_complete(struct vb2_buffer *vb)
 {
 	struct rockchip_vpu_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
-- 
2.20.1

