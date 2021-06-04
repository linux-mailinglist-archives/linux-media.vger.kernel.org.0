Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C51B39B975
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 15:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbhFDNIo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 09:08:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35344 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbhFDNIm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 09:08:42 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:389:b21e:a7e4:8cad])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4166B1F438B6;
        Fri,  4 Jun 2021 14:06:54 +0100 (BST)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil@xs4all.nl, ezequiel@collabora.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH 5/8] media: hantro: hevc: Allow to produce 10-bit frames
Date:   Fri,  4 Jun 2021 15:06:16 +0200
Message-Id: <20210604130619.491200-6-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604130619.491200-1-benjamin.gaignard@collabora.com>
References: <20210604130619.491200-1-benjamin.gaignard@collabora.com>
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
 drivers/staging/media/hantro/hantro_drv.c      | 18 ++++++++++++++++++
 .../staging/media/hantro/hantro_g2_hevc_dec.c  | 18 ++++++++++++++----
 drivers/staging/media/hantro/hantro_hevc.c     |  2 +-
 drivers/staging/media/hantro/imx8m_vpu_hw.c    |  4 ++++
 4 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 43feb14bbbba..5e6609fa4143 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -243,6 +243,16 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	return vb2_queue_init(dst_vq);
 }
 
+static bool hantro_is_10bit_dst_format(struct hantro_ctx *ctx)
+{
+	switch (ctx->vpu_dst_fmt->fourcc) {
+	case V4L2_PIX_FMT_P010:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
 {
 	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
@@ -259,6 +269,10 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
 			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_MPEG_VIDEO_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
+		struct hantro_ctx *ctx;
+
+		ctx = container_of(ctrl->handler,
+				   struct hantro_ctx, ctrl_handler);
 
 		if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
 			/* Luma and chroma bit depth mismatch */
@@ -270,6 +284,10 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED)
 			/* No scaling support */
 			return -EINVAL;
+		if (sps->bit_depth_luma_minus8 == 0 &&
+		    hantro_is_10bit_dst_format(ctx)) {
+			return -EINVAL;
+		}
 	}
 	return 0;
 }
diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
index df147b69a31f..b171b28ec24c 100644
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
 
@@ -529,7 +539,7 @@ static size_t hantro_hevc_output_chroma_offset(struct hantro_ctx *ctx)
 	int bytes_per_pixel = is_8bit_dst_format(ctx) ? 1 : 2;
 
 	return sps->pic_width_in_luma_samples *
-		sps->pic_height_in_luma_samples * bytes_per_pixel;
+	       sps->pic_height_in_luma_samples * bytes_per_pixel;
 }
 
 static void set_buffers(struct hantro_ctx *ctx)
@@ -616,7 +626,7 @@ int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
 	/* Compress buffers */
 	hantro_reg_write(vpu, &g2_ref_compress_bypass, 0);
 
-	/* use NV12 as output format */
+	/* Use raster-scan as output format */
 	hantro_reg_write(vpu, &g2_out_rs_e, 1);
 
 	/* Bus width and max burst */
diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
index 1d44ea69c930..ae9827dd7086 100644
--- a/drivers/staging/media/hantro/hantro_hevc.c
+++ b/drivers/staging/media/hantro/hantro_hevc.c
@@ -25,7 +25,7 @@
 
 #define UNUSED_REF	-1
 
-#define G2_ALIGN		16
+#define G2_ALIGN	16
 
 size_t hantro_hevc_chroma_offset(const struct v4l2_ctrl_hevc_sps *sps)
 {
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index 7e9e24bb5057..b2e85512455b 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -136,6 +136,10 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
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

