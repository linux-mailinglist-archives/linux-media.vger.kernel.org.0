Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1440052B53E
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 11:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233545AbiERIyv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 04:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233495AbiERIyH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 04:54:07 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FAC413B8D5;
        Wed, 18 May 2022 01:54:00 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: benjamin.gaignard)
        with ESMTPSA id 557141F44BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1652864038;
        bh=JifAgMNLUTZbPqUGkfiNvKXoY8wZoQRTWULFSM0LprU=;
        h=From:To:Cc:Subject:Date:From;
        b=cToarhiglI2kF+yH1p6lzPuXjlsuv2gwG13DhdmxkQUvsa60eK2K66yWVhWKSP1W0
         nkDpNGlXB+iykBUInDP+9lRI5WAHyhydgHnDGAvCMrxHt5sgSL3UIfzMuFHKnwbHqF
         YC/MCpqF5w/zoNPQHnAowPbwXvrocx2M1fCePdRekR+7uCNrvI0SfHqMwkD4zG2fyR
         O7sKCaRcNikaACbLkJEKPvszSHr4RlmLKKHnvFZppnX+vgHaULf5O7yMg6sal9kAfJ
         vzSIC+Er93ndAI3Fh+6Rh3zrDjjLMSH+Gkt0vCDKfuU29LA+7KciqFnDtGpSRrbJRx
         S+Iml/YnsXSXw==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, heiko@sntech.de, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org
Cc:     kernel@pengutronix.de, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3] media: hantro: Be more accurate on pixel formats step_width constraints
Date:   Wed, 18 May 2022 10:53:49 +0200
Message-Id: <20220518085349.290701-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Hantro G2 decoder on IMX8MQ strides requirements aren't the same
for NV12_4L4 and NV12 pixel formats. The first one use a 4 bytes padding
while the last one needs 16 bytes.
To be sure to provide the correct stride in all cases we need:
- to relax the constraints on codec formats so set step_width to 4
- use capture queue format and not the output queue format when applying
  the pixel format constraints.
- put the correct step_width constraints on each pixel format.

Move HEVC SPS validation in hantro_hevc.c to be able to perform it
when setting sps control and when starting to decode the bitstream.
Add a new test in HEVC SPS validation function to check if resolution
is still matching the hardware constraints.

With this SAODBLK_A_MainConcept_4 and SAODBLK_B_MainConcept_4 conformance
tests files are correctly decoded with both NV12 and NV12_4L4 pixel formats.
These two files have a resolution of 1016x760.

Add defines for the various used resolutions.
For other variants than Hantro G2 on IMX8M keep the same step_width to avoid
regressions.

Fluster HEVC test score is now 128/147 vs 126/147 with the both pixel
formats as decoder output.
Fluster VP9 test score stay at 147/303.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 3:
- Add define for the various used resolutions.
- Reword commit message.

version 2:
- Add a HEVC SPS validation function to be used when
  setting the control and start decoding.
  I hope that is what Nicolas expects in his remark on v1.

 drivers/staging/media/hantro/hantro_drv.c     |  12 +-
 drivers/staging/media/hantro/hantro_hevc.c    |  28 +++++
 drivers/staging/media/hantro/hantro_hw.h      |  14 +++
 drivers/staging/media/hantro/hantro_v4l2.c    |   2 +-
 drivers/staging/media/hantro/imx8m_vpu_hw.c   |  80 ++++++++++----
 .../staging/media/hantro/rockchip_vpu_hw.c    | 104 ++++++++++++------
 .../staging/media/hantro/sama5d4_vdec_hw.c    |  40 +++++--
 drivers/staging/media/hantro/sunxi_vpu_hw.c   |  24 +++-
 8 files changed, 221 insertions(+), 83 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 377dcc1d19de..5aac3a090480 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -253,6 +253,11 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 
 static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
 {
+	struct hantro_ctx *ctx;
+
+	ctx = container_of(ctrl->handler,
+			   struct hantro_ctx, ctrl_handler);
+
 	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
 		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
 
@@ -268,12 +273,7 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 
-		if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
-			/* Luma and chroma bit depth mismatch */
-			return -EINVAL;
-		if (sps->bit_depth_luma_minus8 != 0)
-			/* Only 8-bit is supported */
-			return -EINVAL;
+		return hantro_hevc_validate_sps(ctx, sps);
 	} else if (ctrl->id == V4L2_CID_STATELESS_VP9_FRAME) {
 		const struct v4l2_ctrl_vp9_frame *dec_params = ctrl->p_new.p_vp9_frame;
 
diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
index 7fdec50dc853..6abef810b285 100644
--- a/drivers/staging/media/hantro/hantro_hevc.c
+++ b/drivers/staging/media/hantro/hantro_hevc.c
@@ -154,6 +154,30 @@ static int tile_buffer_reallocate(struct hantro_ctx *ctx)
 	return -ENOMEM;
 }
 
+int hantro_hevc_validate_sps(struct hantro_ctx *ctx, const struct v4l2_ctrl_hevc_sps *sps)
+{
+	if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
+		/* Luma and chroma bit depth mismatch */
+		return -EINVAL;
+	if (sps->bit_depth_luma_minus8 != 0)
+		/* Only 8-bit is supported */
+		return -EINVAL;
+
+	/* for tile pixel format check if the width and height match
+	 * hardware constraints */
+	if (ctx->vpu_dst_fmt->fourcc == V4L2_PIX_FMT_NV12_4L4) {
+		if (ctx->dst_fmt.width !=
+		    ALIGN(sps->pic_width_in_luma_samples, ctx->vpu_dst_fmt->frmsize.step_width))
+			return -EINVAL;
+
+		if (ctx->dst_fmt.height !=
+		    ALIGN(sps->pic_height_in_luma_samples, ctx->vpu_dst_fmt->frmsize.step_height))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx)
 {
 	struct hantro_hevc_dec_hw_ctx *hevc_ctx = &ctx->hevc_dec;
@@ -177,6 +201,10 @@ int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx)
 	if (WARN_ON(!ctrls->sps))
 		return -EINVAL;
 
+	ret = hantro_hevc_validate_sps(ctx, ctrls->sps);
+	if (ret)
+		return ret;
+
 	ctrls->pps =
 		hantro_get_ctrl(ctx, V4L2_CID_STATELESS_HEVC_PPS);
 	if (WARN_ON(!ctrls->pps))
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 994547fe41b9..457eb8bb6dc2 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -18,9 +18,21 @@
 #define DEC_8190_ALIGN_MASK	0x07U
 
 #define MB_DIM			16
+#define TILE_MB_DIM		4
 #define MB_WIDTH(w)		DIV_ROUND_UP(w, MB_DIM)
 #define MB_HEIGHT(h)		DIV_ROUND_UP(h, MB_DIM)
 
+#define FMT_MIN_WIDTH		48
+#define FMT_MIN_HEIGHT		48
+#define FMT_HD_WIDTH		1280
+#define FMT_HD_HEIGHT		720
+#define FMT_FHD_WIDTH		1920
+#define FMT_FHD_HEIGHT		1088
+#define FMT_UHD_WIDTH		3840
+#define FMT_UHD_HEIGHT		2160
+#define FMT_4K_WIDTH		4096
+#define FMT_4K_HEIGHT		2304
+
 #define NUM_REF_PICTURES	(V4L2_HEVC_DPB_ENTRIES_NUM_MAX + 1)
 
 struct hantro_dev;
@@ -341,6 +353,8 @@ int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx);
 void hantro_hevc_ref_init(struct hantro_ctx *ctx);
 dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, s32 poc);
 int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc, dma_addr_t addr);
+int hantro_hevc_validate_sps(struct hantro_ctx *ctx, const struct v4l2_ctrl_hevc_sps *sps);
+
 
 static inline unsigned short hantro_vp9_num_sbs(unsigned short dimension)
 {
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 71a6279750bf..93d0dcf69f4a 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -260,7 +260,7 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 	} else if (ctx->is_encoder) {
 		vpu_fmt = ctx->vpu_dst_fmt;
 	} else {
-		vpu_fmt = ctx->vpu_src_fmt;
+		vpu_fmt = fmt;
 		/*
 		 * Width/height on the CAPTURE end of a decoder are ignored and
 		 * replaced by the OUTPUT ones.
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index 9802508bade2..77f574fdfa77 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -83,6 +83,14 @@ static const struct hantro_fmt imx8m_vpu_postproc_fmts[] = {
 		.fourcc = V4L2_PIX_FMT_YUYV,
 		.codec_mode = HANTRO_MODE_NONE,
 		.postprocessed = true,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_UHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
 	},
 };
 
@@ -90,17 +98,25 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.codec_mode = HANTRO_MODE_NONE,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_UHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
 		.codec_mode = HANTRO_MODE_MPEG2_DEC,
 		.max_depth = 2,
 		.frmsize = {
-			.min_width = 48,
-			.max_width = 1920,
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
 			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 1088,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -109,11 +125,11 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
 		.codec_mode = HANTRO_MODE_VP8_DEC,
 		.max_depth = 2,
 		.frmsize = {
-			.min_width = 48,
-			.max_width = 3840,
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_UHD_WIDTH,
 			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 2160,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -122,11 +138,11 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
 		.codec_mode = HANTRO_MODE_H264_DEC,
 		.max_depth = 2,
 		.frmsize = {
-			.min_width = 48,
-			.max_width = 3840,
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_UHD_WIDTH,
 			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 2160,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -137,6 +153,14 @@ static const struct hantro_fmt imx8m_vpu_g2_postproc_fmts[] = {
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.codec_mode = HANTRO_MODE_NONE,
 		.postprocessed = true,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_UHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
 	},
 };
 
@@ -144,18 +168,26 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12_4L4,
 		.codec_mode = HANTRO_MODE_NONE,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_UHD_WIDTH,
+			.step_width = TILE_MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
+			.step_height = TILE_MB_DIM,
+		},
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_HEVC_SLICE,
 		.codec_mode = HANTRO_MODE_HEVC_DEC,
 		.max_depth = 2,
 		.frmsize = {
-			.min_width = 48,
-			.max_width = 3840,
-			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 2160,
-			.step_height = MB_DIM,
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_UHD_WIDTH,
+			.step_width = TILE_MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
+			.step_height = TILE_MB_DIM,
 		},
 	},
 	{
@@ -163,12 +195,12 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
 		.codec_mode = HANTRO_MODE_VP9_DEC,
 		.max_depth = 2,
 		.frmsize = {
-			.min_width = 48,
-			.max_width = 3840,
-			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 2160,
-			.step_height = MB_DIM,
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_UHD_WIDTH,
+			.step_width = TILE_MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
+			.step_height = TILE_MB_DIM,
 		},
 	},
 };
diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
index fc96501f3bc8..098486b9ec27 100644
--- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
+++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
@@ -63,6 +63,14 @@ static const struct hantro_fmt rockchip_vpu1_postproc_fmts[] = {
 		.fourcc = V4L2_PIX_FMT_YUYV,
 		.codec_mode = HANTRO_MODE_NONE,
 		.postprocessed = true,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
 	},
 };
 
@@ -70,17 +78,25 @@ static const struct hantro_fmt rk3066_vpu_dec_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.codec_mode = HANTRO_MODE_NONE,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_H264_SLICE,
 		.codec_mode = HANTRO_MODE_H264_DEC,
 		.max_depth = 2,
 		.frmsize = {
-			.min_width = 48,
-			.max_width = 1920,
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
 			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 1088,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -89,11 +105,11 @@ static const struct hantro_fmt rk3066_vpu_dec_fmts[] = {
 		.codec_mode = HANTRO_MODE_MPEG2_DEC,
 		.max_depth = 2,
 		.frmsize = {
-			.min_width = 48,
-			.max_width = 1920,
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
 			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 1088,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -102,11 +118,11 @@ static const struct hantro_fmt rk3066_vpu_dec_fmts[] = {
 		.codec_mode = HANTRO_MODE_VP8_DEC,
 		.max_depth = 2,
 		.frmsize = {
-			.min_width = 48,
-			.max_width = 1920,
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
 			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 1088,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -116,17 +132,25 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.codec_mode = HANTRO_MODE_NONE,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_4K_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_4K_HEIGHT,
+			.step_height = MB_DIM,
+		},
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_H264_SLICE,
 		.codec_mode = HANTRO_MODE_H264_DEC,
 		.max_depth = 2,
 		.frmsize = {
-			.min_width = 48,
-			.max_width = 4096,
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_4K_WIDTH,
 			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 2304,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_4K_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -135,11 +159,11 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
 		.codec_mode = HANTRO_MODE_MPEG2_DEC,
 		.max_depth = 2,
 		.frmsize = {
-			.min_width = 48,
-			.max_width = 1920,
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
 			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 1088,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -148,11 +172,11 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
 		.codec_mode = HANTRO_MODE_VP8_DEC,
 		.max_depth = 2,
 		.frmsize = {
-			.min_width = 48,
-			.max_width = 3840,
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_UHD_WIDTH,
 			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 2160,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -162,17 +186,25 @@ static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.codec_mode = HANTRO_MODE_NONE,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_H264_SLICE,
 		.codec_mode = HANTRO_MODE_H264_DEC,
 		.max_depth = 2,
 		.frmsize = {
-			.min_width = 48,
-			.max_width = 1920,
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
 			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 1088,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -181,11 +213,11 @@ static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
 		.codec_mode = HANTRO_MODE_MPEG2_DEC,
 		.max_depth = 2,
 		.frmsize = {
-			.min_width = 48,
-			.max_width = 1920,
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
 			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 1088,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -194,11 +226,11 @@ static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
 		.codec_mode = HANTRO_MODE_VP8_DEC,
 		.max_depth = 2,
 		.frmsize = {
-			.min_width = 48,
-			.max_width = 3840,
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_UHD_WIDTH,
 			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 2160,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
diff --git a/drivers/staging/media/hantro/sama5d4_vdec_hw.c b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
index b2fc1c5613e1..b205e2db5b04 100644
--- a/drivers/staging/media/hantro/sama5d4_vdec_hw.c
+++ b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
@@ -16,6 +16,14 @@ static const struct hantro_fmt sama5d4_vdec_postproc_fmts[] = {
 		.fourcc = V4L2_PIX_FMT_YUYV,
 		.codec_mode = HANTRO_MODE_NONE,
 		.postprocessed = true,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_HD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_HD_HEIGHT,
+			.step_height = MB_DIM,
+		},
 	},
 };
 
@@ -23,17 +31,25 @@ static const struct hantro_fmt sama5d4_vdec_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.codec_mode = HANTRO_MODE_NONE,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_HD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_HD_HEIGHT,
+			.step_height = MB_DIM,
+		},
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
 		.codec_mode = HANTRO_MODE_MPEG2_DEC,
 		.max_depth = 2,
 		.frmsize = {
-			.min_width = 48,
-			.max_width = 1280,
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_HD_WIDTH,
 			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 720,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_HD_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -42,11 +58,11 @@ static const struct hantro_fmt sama5d4_vdec_fmts[] = {
 		.codec_mode = HANTRO_MODE_VP8_DEC,
 		.max_depth = 2,
 		.frmsize = {
-			.min_width = 48,
-			.max_width = 1280,
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_HD_WIDTH,
 			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 720,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_HD_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -55,11 +71,11 @@ static const struct hantro_fmt sama5d4_vdec_fmts[] = {
 		.codec_mode = HANTRO_MODE_H264_DEC,
 		.max_depth = 2,
 		.frmsize = {
-			.min_width = 48,
-			.max_width = 1280,
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_HD_WIDTH,
 			.step_width = MB_DIM,
-			.min_height = 48,
-			.max_height = 720,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_HD_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
diff --git a/drivers/staging/media/hantro/sunxi_vpu_hw.c b/drivers/staging/media/hantro/sunxi_vpu_hw.c
index c0edd5856a0c..fbeac81e59e1 100644
--- a/drivers/staging/media/hantro/sunxi_vpu_hw.c
+++ b/drivers/staging/media/hantro/sunxi_vpu_hw.c
@@ -14,6 +14,14 @@ static const struct hantro_fmt sunxi_vpu_postproc_fmts[] = {
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.codec_mode = HANTRO_MODE_NONE,
 		.postprocessed = true,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_UHD_WIDTH,
+			.step_width = 32,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
+			.step_height = 32,
+		},
 	},
 };
 
@@ -21,17 +29,25 @@ static const struct hantro_fmt sunxi_vpu_dec_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12_4L4,
 		.codec_mode = HANTRO_MODE_NONE,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_UHD_WIDTH,
+			.step_width = 32,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
+			.step_height = 32,
+		},
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_VP9_FRAME,
 		.codec_mode = HANTRO_MODE_VP9_DEC,
 		.max_depth = 2,
 		.frmsize = {
-			.min_width = 48,
-			.max_width = 3840,
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_UHD_WIDTH,
 			.step_width = 32,
-			.min_height = 48,
-			.max_height = 2160,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_UHD_HEIGHT,
 			.step_height = 32,
 		},
 	},
-- 
2.32.0

