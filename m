Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED9B63B454D
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 16:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbhFYOOj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 10:14:39 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58498 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbhFYOOe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 10:14:34 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:42b6:51ca:7d52:50ad])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8F9231F4474C;
        Fri, 25 Jun 2021 15:12:11 +0100 (BST)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil@xs4all.nl, ezequiel@collabora.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk,
        jernej.skrabec@gmail.com, nicolas@ndufresne.ca, cphealy@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v4 5/9] media: hantro: hevc: Allow to produce 10-bit frames
Date:   Fri, 25 Jun 2021 16:11:39 +0200
Message-Id: <20210625141143.577998-6-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625141143.577998-1-benjamin.gaignard@collabora.com>
References: <20210625141143.577998-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If Hantro driver receive an 10-bit encoded bitstream allow it
to produce 10-bit frames.
Check that we are not try to produce 10-bit frames from a 8-bit
encoded bitstream.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 4:
 - Make sure that 10 bits output format (i.e. P010) is only enumerated
   when encoded input stream is 10 bits.

 .../staging/media/hantro/hantro_g2_hevc_dec.c | 18 ++++++++---
 drivers/staging/media/hantro/hantro_hevc.c    |  2 +-
 drivers/staging/media/hantro/hantro_v4l2.c    | 31 +++++++++++++++++++
 drivers/staging/media/hantro/imx8m_vpu_hw.c   |  4 +++
 4 files changed, 50 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
index 907e453ac9b2..3b273f31e9ce 100644
--- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
@@ -143,6 +143,16 @@ static bool is_8bit_dst_format(struct hantro_ctx *ctx)
 	}
 }
 
+static int get_dst_format(struct hantro_ctx *ctx)
+{
+	switch (ctx->vpu_dst_fmt->fourcc) {
+	case V4L2_PIX_FMT_P010:
+		return 0x1;
+	default:
+		return 0x0;
+	}
+}
+
 static void set_params(struct hantro_ctx *ctx)
 {
 	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
@@ -158,8 +168,8 @@ static void set_params(struct hantro_ctx *ctx)
 	hantro_reg_write(vpu, &g2_bit_depth_y_minus8, sps->bit_depth_luma_minus8);
 	hantro_reg_write(vpu, &g2_bit_depth_c_minus8, sps->bit_depth_chroma_minus8);
 
-	hantro_reg_write(vpu, &g2_output_8_bits, 1);
-	hantro_reg_write(vpu, &g2_output_format, 0);
+	hantro_reg_write(vpu, &g2_output_8_bits, is_8bit_dst_format(ctx));
+	hantro_reg_write(vpu, &g2_output_format, get_dst_format(ctx));
 
 	hantro_reg_write(vpu, &g2_hdr_skip_length, ctrls->hevc_hdr_skip_length);
 
@@ -540,7 +550,7 @@ static size_t hantro_hevc_output_chroma_offset(struct hantro_ctx *ctx)
 	int bytes_per_pixel = is_8bit_dst_format(ctx) ? 1 : 2;
 
 	return sps->pic_width_in_luma_samples *
-		sps->pic_height_in_luma_samples * bytes_per_pixel;
+	       sps->pic_height_in_luma_samples * bytes_per_pixel;
 }
 
 static void set_buffers(struct hantro_ctx *ctx)
@@ -627,7 +637,7 @@ int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
 	/* Compress buffers */
 	hantro_reg_write(vpu, &g2_ref_compress_bypass, 0);
 
-	/* use NV12 as output format */
+	/* Use raster-scan as output format */
 	hantro_reg_write(vpu, &g2_out_rs_e, 1);
 
 	/* Bus width and max burst */
diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
index 3d6606ff3340..4e816ea73018 100644
--- a/drivers/staging/media/hantro/hantro_hevc.c
+++ b/drivers/staging/media/hantro/hantro_hevc.c
@@ -25,7 +25,7 @@
 
 #define UNUSED_REF	-1
 
-#define G2_ALIGN		16
+#define G2_ALIGN	16
 
 #define CBS_SIZE	16	/* compression table size in bytes */
 #define CBS_LUMA 	8	/* luminance CBS is composed of 1 8x8 coded block */
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index bcb0bdff4a9a..d5fe808d858b 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -141,6 +141,34 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 	return 0;
 }
 
+static bool hantro_hevc_check_possible_formats(struct hantro_ctx *ctx,
+					       const struct hantro_fmt *fmt)
+{
+	const struct v4l2_ctrl_hevc_sps *sps;
+
+	/*
+	 * For HEVC check if the format is allowed given the luma depth
+	 * because the hardware can only produce 10 bits output frames
+	 * from 10 bits inputs streams.
+	 * It possible to produce 8 bits output frames from 10 bits inputs
+	 * streams.
+	 */
+	if (ctx->vpu_src_fmt->fourcc != V4L2_PIX_FMT_HEVC_SLICE)
+		return true;
+
+	sps = hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_HEVC_SPS);
+	if (!sps)
+		return false;
+
+	if (sps->bit_depth_luma_minus8 == 2)
+		return true;
+
+	if (fmt->fourcc == V4L2_PIX_FMT_P010)
+		return false;
+
+	return true;
+}
+
 static int vidioc_enum_fmt(struct file *file, void *priv,
 			   struct v4l2_fmtdesc *f, bool capture)
 
@@ -168,6 +196,9 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 
 		if (skip_mode_none == mode_none)
 			continue;
+		if (capture &&
+		    !hantro_hevc_check_possible_formats(ctx, &formats[i]))
+			continue;
 		if (j == f->index) {
 			fmt = &formats[i];
 			f->pixelformat = fmt->fourcc;
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index ab6ac620f0d0..65bcf46740d7 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -135,6 +135,10 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.codec_mode = HANTRO_MODE_NONE,
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_P010,
+		.codec_mode = HANTRO_MODE_NONE,
+	},
 	{
 		.fourcc = V4L2_PIX_FMT_HEVC_SLICE,
 		.codec_mode = HANTRO_MODE_HEVC_DEC,
-- 
2.25.1

