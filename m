Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD8267DFEA
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 10:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbjA0JVi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 04:21:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbjA0JVg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 04:21:36 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445545BB0;
        Fri, 27 Jan 2023 01:21:35 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4623:efe7:8a8:33c2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 53DF06602E8E;
        Fri, 27 Jan 2023 09:21:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1674811293;
        bh=ZDhonQijDlK2AYULDGmykqxwQvpOLeaj4GP06FPs1lQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a1RoIR12Gi3H1o41BoP15l9NhOeSf+TZ0jBqVf5ofWGtobHhFHPifCFG6kgnBY2Yz
         4x5DqEdpqKe8E/yCahYscreMPLG9sxcbCzTYZjq+I9AsbBQNmrryq1/8FDlp/v05l4
         H+4NvkAi1l4YrjXl0qTCZgqKB0f2b47IgLdN7BLcwu2Md4QNRXg2M9liRMzzUkGcH9
         sVGQsMblbIU7ebxZeue63AyUxD7L1fbAxitYfcdg1mY4knfJdYe/Jf2zJJ6mnm0ajR
         hLiGT5C8Vb5HdJMHGeBvbgmN8Mzo81zoXwZ5HDQZ56KSZfvAiYZFbA2qlBwMkyKASy
         ezkM6hJvoQzuw==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.co.uk
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v5 1/2] media: verisilicon: Do not change context bit depth before validating the format
Date:   Fri, 27 Jan 2023 10:21:25 +0100
Message-Id: <20230127092126.318268-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127092126.318268-1-benjamin.gaignard@collabora.com>
References: <20230127092126.318268-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is needed to check if the proposed pixels format is valid before
updating context bit depth and other internal states.
Stop using ctx->bit_depth to check format depth match and return
result to the caller.

Fixes: dc39473d0340 ("media: hantro: imx8m: Enable 10bit decoding")
Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
version 5:
- Add Review and Fixes tags
 .../platform/verisilicon/hantro_postproc.c    |  2 +-
 .../media/platform/verisilicon/hantro_v4l2.c  | 53 +++++++++----------
 .../media/platform/verisilicon/hantro_v4l2.h  |  3 +-
 3 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index 09d8cf942689..6437423ccf3a 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -197,7 +197,7 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
 	unsigned int i, buf_size;
 
 	/* this should always pick native format */
-	fmt = hantro_get_default_fmt(ctx, false);
+	fmt = hantro_get_default_fmt(ctx, false, ctx->bit_depth);
 	if (!fmt)
 		return -EINVAL;
 	v4l2_fill_pixfmt_mp(&pix_mp, fmt->fourcc, ctx->src_fmt.width,
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 2c7a805289e7..2475bc05dee9 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -76,17 +76,16 @@ int hantro_get_format_depth(u32 fourcc)
 }
 
 static bool
-hantro_check_depth_match(const struct hantro_ctx *ctx,
-			 const struct hantro_fmt *fmt)
+hantro_check_depth_match(const struct hantro_fmt *fmt, int bit_depth)
 {
-	int fmt_depth, ctx_depth = 8;
+	int fmt_depth, depth = 8;
 
 	if (!fmt->match_depth && !fmt->postprocessed)
 		return true;
 
 	/* 0 means default depth, which is 8 */
-	if (ctx->bit_depth)
-		ctx_depth = ctx->bit_depth;
+	if (bit_depth)
+		depth = bit_depth;
 
 	fmt_depth = hantro_get_format_depth(fmt->fourcc);
 
@@ -95,9 +94,9 @@ hantro_check_depth_match(const struct hantro_ctx *ctx,
 	 * It may be possible to relax that on some HW.
 	 */
 	if (!fmt->match_depth)
-		return fmt_depth <= ctx_depth;
+		return fmt_depth <= depth;
 
-	return fmt_depth == ctx_depth;
+	return fmt_depth == depth;
 }
 
 static const struct hantro_fmt *
@@ -119,7 +118,7 @@ hantro_find_format(const struct hantro_ctx *ctx, u32 fourcc)
 }
 
 const struct hantro_fmt *
-hantro_get_default_fmt(const struct hantro_ctx *ctx, bool bitstream)
+hantro_get_default_fmt(const struct hantro_ctx *ctx, bool bitstream, int bit_depth)
 {
 	const struct hantro_fmt *formats;
 	unsigned int i, num_fmts;
@@ -128,7 +127,7 @@ hantro_get_default_fmt(const struct hantro_ctx *ctx, bool bitstream)
 	for (i = 0; i < num_fmts; i++) {
 		if (bitstream == (formats[i].codec_mode !=
 				  HANTRO_MODE_NONE) &&
-		    hantro_check_depth_match(ctx, &formats[i]))
+		    hantro_check_depth_match(&formats[i], bit_depth))
 			return &formats[i];
 	}
 	return NULL;
@@ -203,7 +202,7 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 
 		if (skip_mode_none == mode_none)
 			continue;
-		if (!hantro_check_depth_match(ctx, fmt))
+		if (!hantro_check_depth_match(fmt, ctx->bit_depth))
 			continue;
 		if (j == f->index) {
 			f->pixelformat = fmt->fourcc;
@@ -223,7 +222,7 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	for (i = 0; i < num_fmts; i++) {
 		fmt = &formats[i];
 
-		if (!hantro_check_depth_match(ctx, fmt))
+		if (!hantro_check_depth_match(fmt, ctx->bit_depth))
 			continue;
 		if (j == f->index) {
 			f->pixelformat = fmt->fourcc;
@@ -291,7 +290,7 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 
 	fmt = hantro_find_format(ctx, pix_mp->pixelformat);
 	if (!fmt) {
-		fmt = hantro_get_default_fmt(ctx, coded);
+		fmt = hantro_get_default_fmt(ctx, coded, 0);
 		pix_mp->pixelformat = fmt->fourcc;
 	}
 
@@ -379,15 +378,12 @@ hantro_reset_encoded_fmt(struct hantro_ctx *ctx)
 	const struct hantro_fmt *vpu_fmt;
 	struct v4l2_pix_format_mplane *fmt;
 
-	vpu_fmt = hantro_get_default_fmt(ctx, true);
+	vpu_fmt = hantro_get_default_fmt(ctx, true, 0);
 
-	if (ctx->is_encoder) {
-		ctx->vpu_dst_fmt = vpu_fmt;
+	if (ctx->is_encoder)
 		fmt = &ctx->dst_fmt;
-	} else {
-		ctx->vpu_src_fmt = vpu_fmt;
+	else
 		fmt = &ctx->src_fmt;
-	}
 
 	hantro_reset_fmt(fmt, vpu_fmt);
 	fmt->width = vpu_fmt->frmsize.min_width;
@@ -398,20 +394,21 @@ hantro_reset_encoded_fmt(struct hantro_ctx *ctx)
 		hantro_set_fmt_out(ctx, fmt);
 }
 
-static void
-hantro_reset_raw_fmt(struct hantro_ctx *ctx)
+int
+hantro_reset_raw_fmt(struct hantro_ctx *ctx, int bit_depth)
 {
 	const struct hantro_fmt *raw_vpu_fmt;
 	struct v4l2_pix_format_mplane *raw_fmt, *encoded_fmt;
 
-	raw_vpu_fmt = hantro_get_default_fmt(ctx, false);
+	raw_vpu_fmt = hantro_get_default_fmt(ctx, false, bit_depth);
+
+	if (!raw_vpu_fmt)
+		return -EINVAL;
 
 	if (ctx->is_encoder) {
-		ctx->vpu_src_fmt = raw_vpu_fmt;
 		raw_fmt = &ctx->src_fmt;
 		encoded_fmt = &ctx->dst_fmt;
 	} else {
-		ctx->vpu_dst_fmt = raw_vpu_fmt;
 		raw_fmt = &ctx->dst_fmt;
 		encoded_fmt = &ctx->src_fmt;
 	}
@@ -420,15 +417,15 @@ hantro_reset_raw_fmt(struct hantro_ctx *ctx)
 	raw_fmt->width = encoded_fmt->width;
 	raw_fmt->height = encoded_fmt->height;
 	if (ctx->is_encoder)
-		hantro_set_fmt_out(ctx, raw_fmt);
+		return hantro_set_fmt_out(ctx, raw_fmt);
 	else
-		hantro_set_fmt_cap(ctx, raw_fmt);
+		return hantro_set_fmt_cap(ctx, raw_fmt);
 }
 
 void hantro_reset_fmts(struct hantro_ctx *ctx)
 {
 	hantro_reset_encoded_fmt(ctx);
-	hantro_reset_raw_fmt(ctx);
+	hantro_reset_raw_fmt(ctx, 0);
 }
 
 static void
@@ -528,7 +525,7 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
 	 * changes to the raw format.
 	 */
 	if (!ctx->is_encoder)
-		hantro_reset_raw_fmt(ctx);
+		hantro_reset_raw_fmt(ctx, hantro_get_format_depth(pix_mp->pixelformat));
 
 	/* Colorimetry information are always propagated. */
 	ctx->dst_fmt.colorspace = pix_mp->colorspace;
@@ -591,7 +588,7 @@ static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 	 * changes to the raw format.
 	 */
 	if (ctx->is_encoder)
-		hantro_reset_raw_fmt(ctx);
+		hantro_reset_raw_fmt(ctx, 0);
 
 	/* Colorimetry information are always propagated. */
 	ctx->src_fmt.colorspace = pix_mp->colorspace;
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.h b/drivers/media/platform/verisilicon/hantro_v4l2.h
index 64f6f57e9d7a..9ea2fef57dcd 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.h
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.h
@@ -21,9 +21,10 @@
 extern const struct v4l2_ioctl_ops hantro_ioctl_ops;
 extern const struct vb2_ops hantro_queue_ops;
 
+int hantro_reset_raw_fmt(struct hantro_ctx *ctx, int bit_depth);
 void hantro_reset_fmts(struct hantro_ctx *ctx);
 int hantro_get_format_depth(u32 fourcc);
 const struct hantro_fmt *
-hantro_get_default_fmt(const struct hantro_ctx *ctx, bool bitstream);
+hantro_get_default_fmt(const struct hantro_ctx *ctx, bool bitstream, int bit_depth);
 
 #endif /* HANTRO_V4L2_H_ */
-- 
2.34.1

