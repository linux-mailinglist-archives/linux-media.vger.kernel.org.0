Return-Path: <linux-media+bounces-39318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B78FB1F7D0
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D70E87A984D
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9231A76BC;
	Sun, 10 Aug 2025 01:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IMd/E2Pb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D7E188A0C
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789559; cv=none; b=SEuDNFMzhqU8NOrN1WgHcoJHr3V6Hucw7ZGjklEWPYYcDpAk5wPYj7HiXNwG7R+R0kg2xSB5rP1SHWuY3s081pR4YExCwQukEzK8Sh7ay/rVuu9Y5xA34uximpNmpuw9kqKlqr6vT64K/ROF224tePv6PP4JjxmAklStCajrNCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789559; c=relaxed/simple;
	bh=Eo4XCatFJGH1l4vmrEeeH++PoTrUVasMhcczb9rouV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GX1ApAu5kUfB2BVyQVzc70L30N9Iy/9yT8ilnhL60ByVq3ZgpQfTpcQAcQapjIvRjn5EZ+TSBkbl7utEkuBxgdUecrRDjAofqmOqXtPWaZSBsYv56GNQEDx52M5fIpEHtA4KuGtDUwUJ4KRZ6b80y18LdVL/Pi0NNgbDdGetNJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IMd/E2Pb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A93A499F;
	Sun, 10 Aug 2025 03:31:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789503;
	bh=Eo4XCatFJGH1l4vmrEeeH++PoTrUVasMhcczb9rouV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IMd/E2PbVBTF+oBl3Ffi6j4VxN61PEBmqytYZMqRV0MAtK8FMeJYkGHn7TUuOPfXk
	 Rvbxvp34tg0eHc9CvBoqH7Qd9i+XYv+BibP8FJOMijyx+RQMgCHh4AS5tE5fnCSjSs
	 mDd68xGQtguhRavDfdzxagfqayF+dNndME9HBUTs=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 44/76] media: mtk: vcodec: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:26 +0300
Message-ID: <20250810013100.29776-45-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

While at modify mtk_vcodec_enc_get_chip_name() to accept a ctx instead
of a raw void *.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 36 +++++++++---------
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  | 37 +++++++++----------
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  7 +---
 3 files changed, 37 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 98838217b97d..d691bd533103 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -87,7 +87,7 @@ static int stateful_try_decoder_cmd(struct file *file, void *priv, struct v4l2_d
 
 static int stateful_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	struct vb2_queue *src_vq, *dst_vq;
 	int ret;
 
@@ -132,7 +132,7 @@ static int stateless_try_decoder_cmd(struct file *file, void *priv, struct v4l2_
 
 static int stateless_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	int ret;
 
 	ret = v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, cmd);
@@ -158,7 +158,7 @@ static int stateless_decoder_cmd(struct file *file, void *priv, struct v4l2_deco
 
 static int vidioc_try_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 
 	if (ctx->dev->vdec_pdata->uses_stateless_api)
 		return stateless_try_decoder_cmd(file, priv, cmd);
@@ -168,7 +168,7 @@ static int vidioc_try_decoder_cmd(struct file *file, void *priv, struct v4l2_dec
 
 static int vidioc_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 
 	if (ctx->dev->vdec_pdata->uses_stateless_api)
 		return stateless_decoder_cmd(file, priv, cmd);
@@ -233,7 +233,7 @@ void mtk_vcodec_dec_set_default_params(struct mtk_vcodec_dec_ctx *ctx)
 static int vidioc_vdec_qbuf(struct file *file, void *priv,
 			    struct v4l2_buffer *buf)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 
 	if (ctx->state == MTK_STATE_ABORT) {
 		mtk_v4l2_vdec_err(ctx, "[%d] Call on QBUF after unrecoverable error", ctx->id);
@@ -246,7 +246,7 @@ static int vidioc_vdec_qbuf(struct file *file, void *priv,
 static int vidioc_vdec_dqbuf(struct file *file, void *priv,
 			     struct v4l2_buffer *buf)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 
 	if (ctx->state == MTK_STATE_ABORT) {
 		mtk_v4l2_vdec_err(ctx, "[%d] Call on DQBUF after unrecoverable error", ctx->id);
@@ -259,7 +259,7 @@ static int vidioc_vdec_dqbuf(struct file *file, void *priv,
 static int vidioc_vdec_querycap(struct file *file, void *priv,
 				struct v4l2_capability *cap)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	struct device *dev = &ctx->dev->plat_dev->dev;
 
 	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
@@ -354,7 +354,7 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
 	const struct mtk_video_fmt *fmt;
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
 
 	fmt = mtk_vdec_find_format(f, dec_pdata);
@@ -372,7 +372,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 {
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
 	const struct mtk_video_fmt *fmt;
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
 
 	fmt = mtk_vdec_find_format(f, dec_pdata);
@@ -393,7 +393,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 static int vidioc_vdec_g_selection(struct file *file, void *priv,
 			struct v4l2_selection *s)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	struct mtk_q_data *q_data;
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -442,7 +442,7 @@ static int vidioc_vdec_g_selection(struct file *file, void *priv,
 static int vidioc_vdec_s_selection(struct file *file, void *priv,
 				struct v4l2_selection *s)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -464,7 +464,7 @@ static int vidioc_vdec_s_selection(struct file *file, void *priv,
 static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 			     struct v4l2_format *f)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	struct v4l2_pix_format_mplane *pix_mp;
 	struct mtk_q_data *q_data;
 	int ret = 0;
@@ -594,7 +594,7 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 				struct v4l2_frmsizeenum *fsize)
 {
 	int i = 0;
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
 
 	if (fsize->index != 0)
@@ -623,10 +623,10 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 	return -EINVAL;
 }
 
-static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, void *priv,
+static int vidioc_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
 			   bool output_queue)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
 	const struct mtk_video_fmt *fmt;
 	int i, j = 0;
@@ -660,19 +660,19 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, void *priv,
 static int vidioc_vdec_enum_fmt_vid_cap(struct file *file, void *priv,
 					struct v4l2_fmtdesc *f)
 {
-	return vidioc_enum_fmt(f, priv, false);
+	return vidioc_enum_fmt(file, f, false);
 }
 
 static int vidioc_vdec_enum_fmt_vid_out(struct file *file, void *priv,
 					struct v4l2_fmtdesc *f)
 {
-	return vidioc_enum_fmt(f, priv, true);
+	return vidioc_enum_fmt(file, f, true);
 }
 
 static int vidioc_vdec_g_fmt(struct file *file, void *priv,
 			     struct v4l2_format *f)
 {
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
 	struct vb2_queue *vq;
 	struct mtk_q_data *q_data;
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index a01dc25a7699..d815e962ab89 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -159,7 +159,7 @@ static int vidioc_enum_framesizes(struct file *file, void *fh,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	const struct mtk_video_fmt *fmt;
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(fh);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 
 	if (fsize->index != 0)
 		return -EINVAL;
@@ -183,7 +183,7 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 				   struct v4l2_fmtdesc *f)
 {
 	const struct mtk_vcodec_enc_pdata *pdata =
-		fh_to_enc_ctx(priv)->dev->venc_pdata;
+		file_to_enc_ctx(file)->dev->venc_pdata;
 
 	return vidioc_enum_fmt(f, pdata->capture_formats,
 			       pdata->num_capture_formats);
@@ -193,15 +193,14 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
 				   struct v4l2_fmtdesc *f)
 {
 	const struct mtk_vcodec_enc_pdata *pdata =
-		fh_to_enc_ctx(priv)->dev->venc_pdata;
+		file_to_enc_ctx(file)->dev->venc_pdata;
 
 	return vidioc_enum_fmt(f, pdata->output_formats,
 			       pdata->num_output_formats);
 }
 
-static int mtk_vcodec_enc_get_chip_name(void *priv)
+static int mtk_vcodec_enc_get_chip_name(struct mtk_vcodec_enc_ctx *ctx)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
 	struct device *dev = &ctx->dev->plat_dev->dev;
 
 	if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-enc"))
@@ -221,9 +220,9 @@ static int mtk_vcodec_enc_get_chip_name(void *priv)
 static int vidioc_venc_querycap(struct file *file, void *priv,
 				struct v4l2_capability *cap)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	struct device *dev = &ctx->dev->plat_dev->dev;
-	int platform_name = mtk_vcodec_enc_get_chip_name(priv);
+	int platform_name = mtk_vcodec_enc_get_chip_name(ctx);
 
 	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
 	snprintf(cap->card, sizeof(cap->card), "MT%d video encoder", platform_name);
@@ -234,7 +233,7 @@ static int vidioc_venc_querycap(struct file *file, void *priv,
 static int vidioc_venc_s_parm(struct file *file, void *priv,
 			      struct v4l2_streamparm *a)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	struct v4l2_fract *timeperframe = &a->parm.output.timeperframe;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -257,7 +256,7 @@ static int vidioc_venc_s_parm(struct file *file, void *priv,
 static int vidioc_venc_g_parm(struct file *file, void *priv,
 			      struct v4l2_streamparm *a)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return -EINVAL;
@@ -414,7 +413,7 @@ static void mtk_venc_set_param(struct mtk_vcodec_enc_ctx *ctx,
 static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 			     struct v4l2_format *f)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 	struct vb2_queue *vq;
 	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, f->type);
@@ -469,7 +468,7 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 			     struct v4l2_format *f)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 	struct vb2_queue *vq;
 	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, f->type);
@@ -524,7 +523,7 @@ static int vidioc_venc_g_fmt(struct file *file, void *priv,
 			     struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	struct vb2_queue *vq;
 	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, f->type);
 	int i;
@@ -557,7 +556,7 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 					 struct v4l2_format *f)
 {
 	const struct mtk_video_fmt *fmt;
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 
 	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
@@ -579,7 +578,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 					 struct v4l2_format *f)
 {
 	const struct mtk_video_fmt *fmt;
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 
 	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
@@ -600,7 +599,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 static int vidioc_venc_g_selection(struct file *file, void *priv,
 				     struct v4l2_selection *s)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, s->type);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -630,7 +629,7 @@ static int vidioc_venc_g_selection(struct file *file, void *priv,
 static int vidioc_venc_s_selection(struct file *file, void *priv,
 				     struct v4l2_selection *s)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, s->type);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -655,7 +654,7 @@ static int vidioc_venc_s_selection(struct file *file, void *priv,
 static int vidioc_venc_qbuf(struct file *file, void *priv,
 			    struct v4l2_buffer *buf)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 
 	if (ctx->state == MTK_STATE_ABORT) {
 		mtk_v4l2_venc_err(ctx, "[%d] Call on QBUF after unrecoverable error",
@@ -669,7 +668,7 @@ static int vidioc_venc_qbuf(struct file *file, void *priv,
 static int vidioc_venc_dqbuf(struct file *file, void *priv,
 			     struct v4l2_buffer *buf)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	int ret;
 
 	if (ctx->state == MTK_STATE_ABORT) {
@@ -707,7 +706,7 @@ static int vidioc_venc_dqbuf(struct file *file, void *priv,
 static int vidioc_encoder_cmd(struct file *file, void *priv,
 			      struct v4l2_encoder_cmd *cmd)
 {
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(priv);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 	struct vb2_queue *src_vq, *dst_vq;
 	int ret;
 
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index a4fe2f453d8f..5b304a551236 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -217,14 +217,9 @@ struct mtk_vcodec_enc_dev {
 	struct mtk_vcodec_dbgfs dbgfs;
 };
 
-static inline struct mtk_vcodec_enc_ctx *fh_to_enc_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct mtk_vcodec_enc_ctx, fh);
-}
-
 static inline struct mtk_vcodec_enc_ctx *file_to_enc_ctx(struct file *filp)
 {
-	return fh_to_enc_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct mtk_vcodec_enc_ctx, fh);
 }
 
 static inline struct mtk_vcodec_enc_ctx *ctrl_to_enc_ctx(struct v4l2_ctrl *ctrl)
-- 
Regards,

Laurent Pinchart


