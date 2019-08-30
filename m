Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5D41A33E0
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 11:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728534AbfH3J0c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Aug 2019 05:26:32 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:47851 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728519AbfH3J0b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 05:26:31 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3dAmiY5dCDqPe3dAqiRKhc; Fri, 30 Aug 2019 11:26:29 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/3] cedrus: fix various format-related compliance issues
Date:   Fri, 30 Aug 2019 11:26:24 +0200
Message-Id: <20190830092624.18228-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190830092624.18228-1-hverkuil-cisco@xs4all.nl>
References: <20190830092624.18228-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCm4CquYJ1yGfYoC7gFcj3U9vCm+j2TjfqphsgmozpBw7v4MjrXSGrEPgOTJihHsllfxBbtLd7+uX+l8sNpAwAA9HMudjGUhfMtPwrGhbzAMCnrv0LH/
 GXuzQZDYRpPl4GrY+l/7WzRlKM7y4dwxIqn4gZZlPDQSOayUfjFgg9K3DYiSLdthNgmdKHs9fmtQq7X2CH3mmTX5MugDrRE74TptD/us1yDdanSnu051wvgI
 m3o5z2tYezX4GUrcXV6wK71YCVhUlypfIfWhfgRApDVcexznoZZfiAt99Yd+QWRVDvAv+wEfqB0sPiTf8O6hNArq5JdXNA3DYibAFVgqCkS4v42OJ/xrqiuJ
 cIl5+9pk
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Initialize the context on open() with valid capture and output
formats. It is good practice to always have valid formats internally.

This solves one vb2 warning in the kernel log where the sizeimage
value of the output format was 0 when requesting buffers, which is
not allowed.

It also simplifies the g_fmt ioctl implementations since they no longer
have to check if a valid format was ever set.

cedrus_prepare_format() now also validates sizeimage for the output
formats, ensuring userspace can't set it to 0 since that would cause
the same vb2 warning.

Finally remove the sizeimage == 0 check in cedrus_try_fmt_vid_out()
since cedrus_prepare_format() will now adjust this value.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c   | 10 +++++++
 .../staging/media/sunxi/cedrus/cedrus_video.c | 28 ++-----------------
 .../staging/media/sunxi/cedrus/cedrus_video.h |  1 +
 3 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 3439f6ad6338..0cf637c8a1e3 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -241,6 +241,16 @@ static int cedrus_open(struct file *file)
 		ret = PTR_ERR(ctx->fh.m2m_ctx);
 		goto err_ctrls;
 	}
+	ctx->dst_fmt.pixelformat = V4L2_PIX_FMT_SUNXI_TILED_NV12;
+	cedrus_prepare_format(&ctx->dst_fmt);
+	ctx->src_fmt.pixelformat = V4L2_PIX_FMT_MPEG2_SLICE;
+	/*
+	 * TILED_NV12 has more strict requirements, so copy the width and
+	 * height to src_fmt to ensure that is matches the dst_fmt resolution.
+	 */
+	ctx->src_fmt.width = ctx->dst_fmt.width;
+	ctx->src_fmt.height = ctx->dst_fmt.height;
+	cedrus_prepare_format(&ctx->src_fmt);
 
 	v4l2_fh_add(&ctx->fh);
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index d69c9bcdb8e2..3ec3a2db790c 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -86,7 +86,7 @@ static struct cedrus_format *cedrus_find_format(u32 pixelformat, u32 directions,
 	return &cedrus_formats[i];
 }
 
-static void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
+void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
 {
 	unsigned int width = pix_fmt->width;
 	unsigned int height = pix_fmt->height;
@@ -104,7 +104,8 @@ static void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
 	case V4L2_PIX_FMT_H264_SLICE:
 		/* Zero bytes per line for encoded source. */
 		bytesperline = 0;
-
+		/* Choose some minimum size since this can't be 0 */
+		sizeimage = max_t(u32, SZ_1K, sizeimage);
 		break;
 
 	case V4L2_PIX_FMT_SUNXI_TILED_NV12:
@@ -211,16 +212,7 @@ static int cedrus_g_fmt_vid_cap(struct file *file, void *priv,
 {
 	struct cedrus_ctx *ctx = cedrus_file2ctx(file);
 
-	/* Fall back to dummy default by lack of hardware configuration. */
-	if (!ctx->dst_fmt.width || !ctx->dst_fmt.height) {
-		f->fmt.pix.pixelformat = V4L2_PIX_FMT_SUNXI_TILED_NV12;
-		cedrus_prepare_format(&f->fmt.pix);
-
-		return 0;
-	}
-
 	f->fmt.pix = ctx->dst_fmt;
-
 	return 0;
 }
 
@@ -229,17 +221,7 @@ static int cedrus_g_fmt_vid_out(struct file *file, void *priv,
 {
 	struct cedrus_ctx *ctx = cedrus_file2ctx(file);
 
-	/* Fall back to dummy default by lack of hardware configuration. */
-	if (!ctx->dst_fmt.width || !ctx->dst_fmt.height) {
-		f->fmt.pix.pixelformat = V4L2_PIX_FMT_MPEG2_SLICE;
-		f->fmt.pix.sizeimage = SZ_1K;
-		cedrus_prepare_format(&f->fmt.pix);
-
-		return 0;
-	}
-
 	f->fmt.pix = ctx->src_fmt;
-
 	return 0;
 }
 
@@ -275,10 +257,6 @@ static int cedrus_try_fmt_vid_out(struct file *file, void *priv,
 	if (!fmt)
 		return -EINVAL;
 
-	/* Source image size has to be provided by userspace. */
-	if (pix_fmt->sizeimage == 0)
-		return -EINVAL;
-
 	pix_fmt->pixelformat = fmt->pixelformat;
 	cedrus_prepare_format(pix_fmt);
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.h b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
index 0e4f7a8cccf2..05050c0a0921 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
@@ -26,5 +26,6 @@ extern const struct v4l2_ioctl_ops cedrus_ioctl_ops;
 
 int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
 		      struct vb2_queue *dst_vq);
+void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt);
 
 #endif
-- 
2.23.0.rc1

