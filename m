Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65EC8181FFA
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 18:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730737AbgCKRrh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 13:47:37 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33124 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730500AbgCKRrh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 13:47:37 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 04D2F291F30
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 6/6] hantro: Refactor for V4L2 API spec compliancy
Date:   Wed, 11 Mar 2020 14:43:00 -0300
Message-Id: <20200311174300.19407-7-ezequiel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200311174300.19407-1-ezequiel@collabora.com>
References: <20200311174300.19407-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Refactor how S_FMT and TRY_FMT are handled, and also make sure
internal initial format and format reset are done properly.

The latter is achieved by making sure the same hantro_{set,try}_fmt
helpers are called on all paths that set the format (which is
part of the driver state).

This commit removes the following v4l2-compliance warnings:

test VIDIOC_G_FMT: OK
	fail: v4l2-test-formats.cpp(711): Video Capture Multiplanar: TRY_FMT(G_FMT) != G_FMT
test VIDIOC_TRY_FMT: FAIL
	fail: v4l2-test-formats.cpp(1116): Video Capture Multiplanar: S_FMT(G_FMT) != G_FMT
test VIDIOC_S_FMT: FAIL

Reported-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro_v4l2.c | 70 ++++++++++++++--------
 1 file changed, 45 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 458b502ff01b..f28a94e2fa93 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -30,6 +30,11 @@
 #include "hantro_hw.h"
 #include "hantro_v4l2.h"
 
+static int hantro_set_fmt_out(struct hantro_ctx *ctx,
+			      struct v4l2_pix_format_mplane *pix_mp);
+static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
+			      struct v4l2_pix_format_mplane *pix_mp);
+
 static const struct hantro_fmt *
 hantro_get_formats(const struct hantro_ctx *ctx, unsigned int *num_fmts)
 {
@@ -227,12 +232,12 @@ static int vidioc_g_fmt_cap_mplane(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
-			  bool capture)
+static int hantro_try_fmt(const struct hantro_ctx *ctx,
+			  struct v4l2_pix_format_mplane *pix_mp,
+			  enum v4l2_buf_type type)
 {
-	struct hantro_ctx *ctx = fh_to_ctx(priv);
-	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
 	const struct hantro_fmt *fmt, *vpu_fmt;
+	bool capture = !V4L2_TYPE_IS_OUTPUT(type);
 	bool coded;
 
 	coded = capture == hantro_is_encoder_ctx(ctx);
@@ -246,7 +251,7 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
 	fmt = hantro_find_format(ctx, pix_mp->pixelformat);
 	if (!fmt) {
 		fmt = hantro_get_default_fmt(ctx, coded);
-		f->fmt.pix_mp.pixelformat = fmt->fourcc;
+		pix_mp->pixelformat = fmt->fourcc;
 	}
 
 	if (coded) {
@@ -294,13 +299,13 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
 static int vidioc_try_fmt_cap_mplane(struct file *file, void *priv,
 				     struct v4l2_format *f)
 {
-	return vidioc_try_fmt(file, priv, f, true);
+	return hantro_try_fmt(fh_to_ctx(priv), &f->fmt.pix_mp, f->type);
 }
 
 static int vidioc_try_fmt_out_mplane(struct file *file, void *priv,
 				     struct v4l2_format *f)
 {
-	return vidioc_try_fmt(file, priv, f, false);
+	return hantro_try_fmt(fh_to_ctx(priv), &f->fmt.pix_mp, f->type);
 }
 
 static void
@@ -334,11 +339,12 @@ hantro_reset_encoded_fmt(struct hantro_ctx *ctx)
 	}
 
 	hantro_reset_fmt(fmt, vpu_fmt);
-	fmt->num_planes = 1;
 	fmt->width = vpu_fmt->frmsize.min_width;
 	fmt->height = vpu_fmt->frmsize.min_height;
-	fmt->plane_fmt[0].sizeimage = vpu_fmt->header_size +
-				fmt->width * fmt->height * vpu_fmt->max_depth;
+	if (hantro_is_encoder_ctx(ctx))
+		hantro_set_fmt_cap(ctx, fmt);
+	else
+		hantro_set_fmt_out(ctx, fmt);
 }
 
 static void
@@ -360,9 +366,12 @@ hantro_reset_raw_fmt(struct hantro_ctx *ctx)
 	}
 
 	hantro_reset_fmt(raw_fmt, raw_vpu_fmt);
-	v4l2_fill_pixfmt_mp(raw_fmt, raw_vpu_fmt->fourcc,
-			    encoded_fmt->width,
-			    encoded_fmt->height);
+	raw_fmt->width = encoded_fmt->width;
+	raw_fmt->width = encoded_fmt->width;
+	if (hantro_is_encoder_ctx(ctx))
+		hantro_set_fmt_out(ctx, raw_fmt);
+	else
+		hantro_set_fmt_cap(ctx, raw_fmt);
 }
 
 void hantro_reset_fmts(struct hantro_ctx *ctx)
@@ -388,15 +397,15 @@ hantro_update_requires_request(struct hantro_ctx *ctx, u32 fourcc)
 	}
 }
 
-static int
-vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
+static int hantro_set_fmt_out(struct hantro_ctx *ctx,
+			      struct v4l2_pix_format_mplane *pix_mp)
 {
-	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct hantro_ctx *ctx = fh_to_ctx(priv);
-	struct vb2_queue *vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+	struct vb2_queue *vq;
 	int ret;
 
-	ret = vidioc_try_fmt_out_mplane(file, priv, f);
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
+			     V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	ret = hantro_try_fmt(ctx, pix_mp, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	if (ret)
 		return ret;
 
@@ -458,16 +467,15 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_s_fmt_cap_mplane(struct file *file, void *priv,
-				   struct v4l2_format *f)
+static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
+			      struct v4l2_pix_format_mplane *pix_mp)
 {
-	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct hantro_ctx *ctx = fh_to_ctx(priv);
 	struct vb2_queue *vq;
 	int ret;
 
 	/* Change not allowed if queue is busy. */
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
+			     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	if (vb2_is_busy(vq))
 		return -EBUSY;
 
@@ -488,7 +496,7 @@ static int vidioc_s_fmt_cap_mplane(struct file *file, void *priv,
 			return -EBUSY;
 	}
 
-	ret = vidioc_try_fmt_cap_mplane(file, priv, f);
+	ret = hantro_try_fmt(ctx, pix_mp, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	if (ret)
 		return ret;
 
@@ -522,6 +530,18 @@ static int vidioc_s_fmt_cap_mplane(struct file *file, void *priv,
 	return 0;
 }
 
+static int
+vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
+{
+	return hantro_set_fmt_out(fh_to_ctx(priv), &f->fmt.pix_mp);
+}
+
+static int
+vidioc_s_fmt_cap_mplane(struct file *file, void *priv, struct v4l2_format *f)
+{
+	return hantro_set_fmt_cap(fh_to_ctx(priv), &f->fmt.pix_mp);
+}
+
 const struct v4l2_ioctl_ops hantro_ioctl_ops = {
 	.vidioc_querycap = vidioc_querycap,
 	.vidioc_enum_framesizes = vidioc_enum_framesizes,
-- 
2.25.0

