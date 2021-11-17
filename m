Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5BD84546E5
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 14:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237452AbhKQNKD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 08:10:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237384AbhKQNJ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 08:09:58 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C60C061570;
        Wed, 17 Nov 2021 05:06:59 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 622681F45D07
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637154418; bh=u270ohJ7t6uCbX7fIMH88BVsQ8r478APACiXzxz20dw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WB3t/tzldWxoDzT1GV4ai4x6hhHSiXabCwqXUw+4ipXx3j92nhqTZpelnJhRkIkfB
         fCF1QvukWmFQoC4SUew/TFjhECccg6kHdOfvBhJwuLugztw5ReqKzK/oxsiT3izIjT
         9JPPxddCLMEIT2pBsn1tTpidWIYLWksP24dFpQBb3X/DUg3P81qHbnD9lt33lpWrQQ
         dyA9IB98BsDJeMHzDv1fVRhVjCgcONPoyqR6bOkA6VlygMf+BEoM0YavY0CnGXlA32
         qkxpcOMx6nE4W7wZ9W5Z2r6nrLn1KYvAlPZvrPuv33GoNK/kgXowAt+GUdMMbETTYe
         qJKFPUikMo2ag==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com, acourbot@chromium.org,
        andrew-ct.chen@mediatek.com, courbot@chromium.org,
        dafna3@gmail.com, eizan@chromium.org, houlong.wei@mediatek.com,
        hsinyi@chromium.org, hverkuil@xs4all.nl, irui.wang@mediatek.com,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        maoguang.meng@mediatek.com, matthias.bgg@gmail.com,
        mchehab@kernel.org, minghsiu.tsai@mediatek.com, tfiga@chromium.org,
        tiffany.lin@mediatek.com
Subject: [PATCH v2 5/7] media: mtk-vcodec: replace func vidioc_try_fmt with two funcs for out/cap
Date:   Wed, 17 Nov 2021 15:06:33 +0200
Message-Id: <20211117130635.11633-6-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
References: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function vidioc_try_fmt has a big 'if-else' for
the capture and output cases. There is hardly any code
outside of that condition. It is therefore better to split
that functions into two different functions, one for each case.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 149 +++++++++---------
 1 file changed, 72 insertions(+), 77 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index fb3cf804c96a..be28f2401839 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -263,87 +263,82 @@ static struct mtk_q_data *mtk_venc_get_q_data(struct mtk_vcodec_ctx *ctx,
 	return &ctx->q_data[MTK_Q_DATA_DST];
 }
 
+static void vidioc_try_fmt_cap(struct v4l2_format *f)
+{
+	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	f->fmt.pix_mp.num_planes = 1;
+	f->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
+	f->fmt.pix_mp.flags = 0;
+}
+
 /* V4L2 specification suggests the driver corrects the format struct if any of
  * the dimensions is unsupported
  */
-static int vidioc_try_fmt(struct mtk_vcodec_ctx *ctx, struct v4l2_format *f,
-			  const struct mtk_video_fmt *fmt)
+static int vidioc_try_fmt_out(struct mtk_vcodec_ctx *ctx, struct v4l2_format *f,
+			      const struct mtk_video_fmt *fmt)
 {
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
+	int tmp_w, tmp_h;
+	unsigned int max_width, max_height;
 
 	pix_fmt_mp->field = V4L2_FIELD_NONE;
 
-	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
-		pix_fmt_mp->num_planes = 1;
-		pix_fmt_mp->plane_fmt[0].bytesperline = 0;
-	} else if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
-		int tmp_w, tmp_h;
-		unsigned int max_width, max_height;
-
-		if (ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) {
-			max_width = MTK_VENC_4K_MAX_W;
-			max_height = MTK_VENC_4K_MAX_H;
-		} else {
-			max_width = MTK_VENC_HD_MAX_W;
-			max_height = MTK_VENC_HD_MAX_H;
-		}
+	if (ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) {
+		max_width = MTK_VENC_4K_MAX_W;
+		max_height = MTK_VENC_4K_MAX_H;
+	} else {
+		max_width = MTK_VENC_HD_MAX_W;
+		max_height = MTK_VENC_HD_MAX_H;
+	}
 
-		pix_fmt_mp->height = clamp(pix_fmt_mp->height,
-					MTK_VENC_MIN_H,
-					max_height);
-		pix_fmt_mp->width = clamp(pix_fmt_mp->width,
-					MTK_VENC_MIN_W,
-					max_width);
+	pix_fmt_mp->height = clamp(pix_fmt_mp->height, MTK_VENC_MIN_H, max_height);
+	pix_fmt_mp->width = clamp(pix_fmt_mp->width, MTK_VENC_MIN_W, max_width);
 
-		/* find next closer width align 16, heign align 32, size align
-		 * 64 rectangle
-		 */
-		tmp_w = pix_fmt_mp->width;
-		tmp_h = pix_fmt_mp->height;
-		v4l_bound_align_image(&pix_fmt_mp->width,
-					MTK_VENC_MIN_W,
-					max_width, 4,
-					&pix_fmt_mp->height,
-					MTK_VENC_MIN_H,
-					max_height, 5, 6);
-
-		if (pix_fmt_mp->width < tmp_w &&
-			(pix_fmt_mp->width + 16) <= max_width)
-			pix_fmt_mp->width += 16;
-		if (pix_fmt_mp->height < tmp_h &&
-			(pix_fmt_mp->height + 32) <= max_height)
-			pix_fmt_mp->height += 32;
-
-		mtk_v4l2_debug(0,
-			"before resize width=%d, height=%d, after resize width=%d, height=%d, sizeimage=%d %d",
-			tmp_w, tmp_h, pix_fmt_mp->width,
-			pix_fmt_mp->height,
-			pix_fmt_mp->plane_fmt[0].sizeimage,
-			pix_fmt_mp->plane_fmt[1].sizeimage);
-
-		pix_fmt_mp->num_planes = fmt->num_planes;
-		pix_fmt_mp->plane_fmt[0].sizeimage =
-				pix_fmt_mp->width * pix_fmt_mp->height +
-				((ALIGN(pix_fmt_mp->width, 16) * 2) * 16);
-		pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
-
-		if (pix_fmt_mp->num_planes == 2) {
-			pix_fmt_mp->plane_fmt[1].sizeimage =
-				(pix_fmt_mp->width * pix_fmt_mp->height) / 2 +
-				(ALIGN(pix_fmt_mp->width, 16) * 16);
-			pix_fmt_mp->plane_fmt[2].sizeimage = 0;
-			pix_fmt_mp->plane_fmt[1].bytesperline =
-							pix_fmt_mp->width;
-			pix_fmt_mp->plane_fmt[2].bytesperline = 0;
-		} else if (pix_fmt_mp->num_planes == 3) {
-			pix_fmt_mp->plane_fmt[1].sizeimage =
-			pix_fmt_mp->plane_fmt[2].sizeimage =
-				(pix_fmt_mp->width * pix_fmt_mp->height) / 4 +
-				((ALIGN(pix_fmt_mp->width, 16) / 2) * 16);
-			pix_fmt_mp->plane_fmt[1].bytesperline =
-				pix_fmt_mp->plane_fmt[2].bytesperline =
-				pix_fmt_mp->width / 2;
-		}
+	/* find next closer width align 16, heign align 32, size align
+	 * 64 rectangle
+	 */
+	tmp_w = pix_fmt_mp->width;
+	tmp_h = pix_fmt_mp->height;
+	v4l_bound_align_image(&pix_fmt_mp->width,
+			      MTK_VENC_MIN_W,
+			      max_width, 4,
+			      &pix_fmt_mp->height,
+			      MTK_VENC_MIN_H,
+			      max_height, 5, 6);
+
+	if (pix_fmt_mp->width < tmp_w && (pix_fmt_mp->width + 16) <= max_width)
+		pix_fmt_mp->width += 16;
+	if (pix_fmt_mp->height < tmp_h && (pix_fmt_mp->height + 32) <= max_height)
+		pix_fmt_mp->height += 32;
+
+	mtk_v4l2_debug(0, "before resize w=%d, h=%d, after resize w=%d, h=%d, sizeimage=%d %d",
+		       tmp_w, tmp_h, pix_fmt_mp->width,
+		       pix_fmt_mp->height,
+		       pix_fmt_mp->plane_fmt[0].sizeimage,
+		       pix_fmt_mp->plane_fmt[1].sizeimage);
+
+	pix_fmt_mp->num_planes = fmt->num_planes;
+	pix_fmt_mp->plane_fmt[0].sizeimage =
+			pix_fmt_mp->width * pix_fmt_mp->height +
+			((ALIGN(pix_fmt_mp->width, 16) * 2) * 16);
+	pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
+
+	if (pix_fmt_mp->num_planes == 2) {
+		pix_fmt_mp->plane_fmt[1].sizeimage =
+			(pix_fmt_mp->width * pix_fmt_mp->height) / 2 +
+			(ALIGN(pix_fmt_mp->width, 16) * 16);
+		pix_fmt_mp->plane_fmt[2].sizeimage = 0;
+		pix_fmt_mp->plane_fmt[1].bytesperline =
+						pix_fmt_mp->width;
+		pix_fmt_mp->plane_fmt[2].bytesperline = 0;
+	} else if (pix_fmt_mp->num_planes == 3) {
+		pix_fmt_mp->plane_fmt[1].sizeimage =
+		pix_fmt_mp->plane_fmt[2].sizeimage =
+			(pix_fmt_mp->width * pix_fmt_mp->height) / 4 +
+			((ALIGN(pix_fmt_mp->width, 16) / 2) * 16);
+		pix_fmt_mp->plane_fmt[1].bytesperline =
+			pix_fmt_mp->plane_fmt[2].bytesperline =
+			pix_fmt_mp->width / 2;
 	}
 
 	pix_fmt_mp->flags = 0;
@@ -432,9 +427,7 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 	}
 
 	q_data->fmt = fmt;
-	ret = vidioc_try_fmt(ctx, f, q_data->fmt);
-	if (ret)
-		return ret;
+	vidioc_try_fmt_cap(f);
 
 	q_data->coded_width = f->fmt.pix_mp.width;
 	q_data->coded_height = f->fmt.pix_mp.height;
@@ -494,7 +487,7 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 		f->fmt.pix.pixelformat = fmt->fourcc;
 	}
 
-	ret = vidioc_try_fmt(ctx, f, fmt);
+	ret = vidioc_try_fmt_out(ctx, f, fmt);
 	if (ret)
 		return ret;
 
@@ -572,7 +565,9 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 	f->fmt.pix_mp.quantization = ctx->quantization;
 	f->fmt.pix_mp.xfer_func = ctx->xfer_func;
 
-	return vidioc_try_fmt(ctx, f, fmt);
+	vidioc_try_fmt_cap(f);
+
+	return 0;
 }
 
 static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
@@ -594,7 +589,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 		f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
 	}
 
-	return vidioc_try_fmt(ctx, f, fmt);
+	return vidioc_try_fmt_out(ctx, f, fmt);
 }
 
 static int vidioc_venc_g_selection(struct file *file, void *priv,
-- 
2.17.1

