Return-Path: <linux-media+bounces-20811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FD69BBC22
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 18:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 271D2284900
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 17:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA701CACC9;
	Mon,  4 Nov 2024 17:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gzgb67FV";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="WtL8islv"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-45.smtp-out.eu-west-1.amazonses.com (a7-45.smtp-out.eu-west-1.amazonses.com [54.240.7.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCB51419A9;
	Mon,  4 Nov 2024 17:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730741791; cv=none; b=M+Blk5ZkdcETXwCTrVS92s54x4uJb4yoDbmPQr6VCfH2ynhiadkYGRcJLBvJuoyp7Q5+aa94rtGdZJlgsiYXyQQfl6+DQatoQWb/QSrNDx/ETa7XL/uvvM4G7rWEvLa08hXiiEE2zTguqfpqqwpP6TeI1vF98s85SyBmDgkh+48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730741791; c=relaxed/simple;
	bh=RyA2c+9+Ddlewu7wtM9PZ1eedZb6cSZNDDfJq8urag8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E5IoJcOWpdI/ElVbZ5tZUgLeMvK1WJURMjHoURST61kn0PzUczHxI/xdlJ6wjVp0p9KagvSnwzz3KRYGAqCgIZCpZ/XD1rxmpWfG2GX6pxRQYmHnw4VOyH+icWwD7zxNmrbUAbd8XFwD5UeOPKa+wsq/knpGL0Pl1AA804iGNLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gzgb67FV; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=WtL8islv; arc=none smtp.client-ip=54.240.7.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bc7lryepznv65m6r2ewkpoafjt4fiq42; d=collabora.com; t=1730741788;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=RyA2c+9+Ddlewu7wtM9PZ1eedZb6cSZNDDfJq8urag8=;
	b=gzgb67FVYudZ0393+7RTCfMZNKguJFOVwsHFoi3Cz9bQuEnT8AwbjuJv8aylMwcZ
	/kKKW+XRjazoSUgptqPkAxqcVGqdAhjMFwE/yYUl+J31yz3BYrROe5VVFfa7/T/3YWe
	z8VZ4BE7BU8UNNh902rG/XwfgGNepwcIhkIMltmp2OFDOyvx/7R0bRKJR5PzjNRTl5l
	SNc2WvHYHyegAHL7BBKa/c3wkUEWowHsaMNWHcJmNpdMnB9gjBZNmJC4zv6Yi4+m41H
	Od/SACfekzPBZKom49tWPpbgiSWUufYZQo3qgvCcJVZWtUKMt0zdvqxlIXcz9831xBm
	VXyBnmJyWw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1730741788;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=RyA2c+9+Ddlewu7wtM9PZ1eedZb6cSZNDDfJq8urag8=;
	b=WtL8islvmY0B4clAngyfA2qZkL2k1awviwdkBdm7wsVipXN7BILzdVZhtsyrzXcQ
	wdQMlkWwQ/9WdZjczmBugd3Tlg/mZS0SE68QrQLl+BnKOf0PHnAlaG+5yRBVhQRgQWn
	sNTInxcu2XgX/II52B/AfN8oUtibQQqof58oO1N4=
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, 
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH 1/2] media: verisilicon: Store reference frames pixels format
Date: Mon, 4 Nov 2024 17:36:27 +0000
Message-ID: <01020192f83fdd04-16f415e6-64f6-44f2-8f79-7676d301d4ab-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241104173623.1058335-1-benjamin.gaignard@collabora.com>
References: <20241104173623.1058335-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.11.04-54.240.7.45

Hantro decoder always produce tiled pixels formats but
when the post-processor is used the destination pixels
format is a non tiled pixels format. This led to compute
wrong reference frame size and offsets.
Getting and saving the correct tiled pixels format for 8
and 10 bit stream solve the computation issues.

Fluster VP9 score increase to 166/305 (vs 145/305).
HEVC score is still 141/147.


Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro.h   |  2 ++
 .../media/platform/verisilicon/hantro_g2.c    |  2 +-
 .../platform/verisilicon/hantro_postproc.c    | 28 ++++++-------------
 .../media/platform/verisilicon/hantro_v4l2.c  | 21 ++++++++++++++
 4 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 811260dc3c77..14fc6a3e2878 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -227,6 +227,7 @@ struct hantro_dev {
  * @src_fmt:		V4L2 pixel format of active source format.
  * @vpu_dst_fmt:	Descriptor of active destination format.
  * @dst_fmt:		V4L2 pixel format of active destination format.
+ * @ref_fmt:		V4L2 pixel format of the reference frames format.
  *
  * @ctrl_handler:	Control handler used to register controls.
  * @jpeg_quality:	User-specified JPEG compression quality.
@@ -255,6 +256,7 @@ struct hantro_ctx {
 	struct v4l2_pix_format_mplane src_fmt;
 	const struct hantro_fmt *vpu_dst_fmt;
 	struct v4l2_pix_format_mplane dst_fmt;
+	struct v4l2_pix_format_mplane ref_fmt;
 
 	struct v4l2_ctrl_handler ctrl_handler;
 	int jpeg_quality;
diff --git a/drivers/media/platform/verisilicon/hantro_g2.c b/drivers/media/platform/verisilicon/hantro_g2.c
index b880a6849d58..5d33d745d346 100644
--- a/drivers/media/platform/verisilicon/hantro_g2.c
+++ b/drivers/media/platform/verisilicon/hantro_g2.c
@@ -47,7 +47,7 @@ irqreturn_t hantro_g2_irq(int irq, void *dev_id)
 
 size_t hantro_g2_chroma_offset(struct hantro_ctx *ctx)
 {
-	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
+	return ctx->ref_fmt.plane_fmt[0].bytesperline *	ctx->ref_fmt.height;
 }
 
 size_t hantro_g2_motion_vectors_offset(struct hantro_ctx *ctx)
diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index 41e93176300b..4ba29682dbd6 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -194,31 +194,21 @@ void hantro_postproc_free(struct hantro_ctx *ctx)
 
 static unsigned int hantro_postproc_buffer_size(struct hantro_ctx *ctx)
 {
-	struct v4l2_pix_format_mplane pix_mp;
-	const struct hantro_fmt *fmt;
 	unsigned int buf_size;
 
-	/* this should always pick native format */
-	fmt = hantro_get_default_fmt(ctx, false, ctx->bit_depth, HANTRO_AUTO_POSTPROC);
-	if (!fmt)
-		return 0;
-
-	v4l2_fill_pixfmt_mp(&pix_mp, fmt->fourcc, ctx->src_fmt.width,
-			    ctx->src_fmt.height);
-
-	buf_size = pix_mp.plane_fmt[0].sizeimage;
+	buf_size = ctx->ref_fmt.plane_fmt[0].sizeimage;
 	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE)
-		buf_size += hantro_h264_mv_size(pix_mp.width,
-						pix_mp.height);
+		buf_size += hantro_h264_mv_size(ctx->ref_fmt.width,
+						ctx->ref_fmt.height);
 	else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME)
-		buf_size += hantro_vp9_mv_size(pix_mp.width,
-					       pix_mp.height);
+		buf_size += hantro_vp9_mv_size(ctx->ref_fmt.width,
+					       ctx->ref_fmt.height);
 	else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE)
-		buf_size += hantro_hevc_mv_size(pix_mp.width,
-						pix_mp.height);
+		buf_size += hantro_hevc_mv_size(ctx->ref_fmt.width,
+						ctx->ref_fmt.height);
 	else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_AV1_FRAME)
-		buf_size += hantro_av1_mv_size(pix_mp.width,
-					       pix_mp.height);
+		buf_size += hantro_av1_mv_size(ctx->ref_fmt.width,
+					       ctx->ref_fmt.height);
 
 	return buf_size;
 }
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index df6f2536263b..a9a54f177405 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -126,6 +126,24 @@ hantro_find_format(const struct hantro_ctx *ctx, u32 fourcc)
 	return NULL;
 }
 
+static int
+hantro_set_reference_frames_format(struct hantro_ctx *ctx)
+{
+	const struct hantro_fmt *fmt;
+	int dst_bit_depth = hantro_get_format_depth(ctx->vpu_dst_fmt->fourcc);
+
+	fmt = hantro_get_default_fmt(ctx, false, dst_bit_depth, HANTRO_AUTO_POSTPROC);
+	if (!fmt)
+		return -EINVAL;
+
+	ctx->ref_fmt.width = ctx->src_fmt.width;
+	ctx->ref_fmt.height = ctx->src_fmt.height;
+
+	v4l2_apply_frmsize_constraints(&ctx->ref_fmt.width, &ctx->ref_fmt.height, &fmt->frmsize);
+	return v4l2_fill_pixfmt_mp(&ctx->ref_fmt, fmt->fourcc,
+				   ctx->ref_fmt.width, ctx->ref_fmt.height);
+}
+
 const struct hantro_fmt *
 hantro_get_default_fmt(const struct hantro_ctx *ctx, bool bitstream,
 		       int bit_depth, bool need_postproc)
@@ -591,6 +609,9 @@ static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 
 	ctx->vpu_dst_fmt = hantro_find_format(ctx, pix_mp->pixelformat);
 	ctx->dst_fmt = *pix_mp;
+	ret = hantro_set_reference_frames_format(ctx);
+	if (ret)
+		return ret;
 
 	/*
 	 * Current raw format might have become invalid with newly
-- 
2.43.0


