Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269D841C9CE
	for <lists+linux-media@lfdr.de>; Wed, 29 Sep 2021 18:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345063AbhI2QLp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Sep 2021 12:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345474AbhI2QLd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Sep 2021 12:11:33 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2316C06129F;
        Wed, 29 Sep 2021 09:04:58 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id EB1D91F4469C
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v7 11/11] media: hantro: Support NV12 on the G2 core
Date:   Wed, 29 Sep 2021 18:04:39 +0200
Message-Id: <20210929160439.6601-12-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210929160439.6601-1-andrzej.p@collabora.com>
References: <20210929160439.6601-1-andrzej.p@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The G2 decoder block produces NV12 4x4 tiled format (NV12_4L4).
Enable the G2 post-processor block, in order to produce regular NV12.

The logic in hantro_postproc.c is leveraged to take care of allocating
the extra buffers and configure the post-processor, which is
significantly simpler than the one on the G1.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../staging/media/hantro/hantro_g2_vp9_dec.c  |  6 ++--
 drivers/staging/media/hantro/hantro_hw.h      |  1 +
 .../staging/media/hantro/hantro_postproc.c    | 31 +++++++++++++++++++
 drivers/staging/media/hantro/imx8m_vpu_hw.c   | 11 +++++++
 4 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
index 7f827b9f0133..1a26be72c878 100644
--- a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
@@ -152,7 +152,7 @@ static void config_output(struct hantro_ctx *ctx,
 	hantro_reg_write(ctx->dev, &g2_out_dis, 0);
 	hantro_reg_write(ctx->dev, &g2_output_format, 0);
 
-	luma_addr = vb2_dma_contig_plane_dma_addr(&dst->base.vb.vb2_buf, 0);
+	luma_addr = hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
 	hantro_write_addr(ctx->dev, G2_OUT_LUMA_ADDR, luma_addr);
 
 	chroma_addr = luma_addr + chroma_offset(ctx, dec_params);
@@ -191,7 +191,7 @@ static void config_ref(struct hantro_ctx *ctx,
 	hantro_reg_write(ctx->dev, &ref_reg->hor_scale, (refw << 14) / dst->vp9.width);
 	hantro_reg_write(ctx->dev, &ref_reg->ver_scale, (refh << 14) / dst->vp9.height);
 
-	luma_addr = vb2_dma_contig_plane_dma_addr(&buf->base.vb.vb2_buf, 0);
+	luma_addr = hantro_get_dec_buf_addr(ctx, &buf->base.vb.vb2_buf);
 	hantro_write_addr(ctx->dev, ref_reg->y_base, luma_addr);
 
 	chroma_addr = luma_addr + chroma_offset(ctx, dec_params);
@@ -236,7 +236,7 @@ static void config_ref_registers(struct hantro_ctx *ctx,
 	config_ref(ctx, dst, &ref_regs[1], dec_params, dec_params->golden_frame_ts);
 	config_ref(ctx, dst, &ref_regs[2], dec_params, dec_params->alt_frame_ts);
 
-	mv_addr = vb2_dma_contig_plane_dma_addr(&mv_ref->base.vb.vb2_buf, 0) +
+	mv_addr = hantro_get_dec_buf_addr(ctx, &mv_ref->base.vb.vb2_buf) +
 		  mv_offset(ctx, dec_params);
 	hantro_write_addr(ctx->dev, G2_REF_MV_ADDR(0), mv_addr);
 
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 2961d399fd60..3d4a5dc1e6d5 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -274,6 +274,7 @@ extern const struct hantro_variant rk3399_vpu_variant;
 extern const struct hantro_variant sama5d4_vdec_variant;
 
 extern const struct hantro_postproc_ops hantro_g1_postproc_ops;
+extern const struct hantro_postproc_ops hantro_g2_postproc_ops;
 
 extern const u32 hantro_vp8_dec_mc_filter[8][6];
 
diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
index 4549aec08feb..79a66d001738 100644
--- a/drivers/staging/media/hantro/hantro_postproc.c
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -11,6 +11,7 @@
 #include "hantro.h"
 #include "hantro_hw.h"
 #include "hantro_g1_regs.h"
+#include "hantro_g2_regs.h"
 
 #define HANTRO_PP_REG_WRITE(vpu, reg_name, val) \
 { \
@@ -99,6 +100,21 @@ static void hantro_postproc_g1_enable(struct hantro_ctx *ctx)
 	HANTRO_PP_REG_WRITE(vpu, display_width, ctx->dst_fmt.width);
 }
 
+static void hantro_postproc_g2_enable(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct vb2_v4l2_buffer *dst_buf;
+	size_t chroma_offset = ctx->dst_fmt.width * ctx->dst_fmt.height;
+	dma_addr_t dst_dma;
+
+	dst_buf = hantro_get_dst_buf(ctx);
+	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+
+	hantro_write_addr(vpu, G2_RS_OUT_LUMA_ADDR, dst_dma);
+	hantro_write_addr(vpu, G2_RS_OUT_CHROMA_ADDR, dst_dma + chroma_offset);
+	hantro_reg_write(vpu, &g2_out_rs_e, 1);
+}
+
 void hantro_postproc_free(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
@@ -127,6 +143,9 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
 	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE)
 		buf_size += hantro_h264_mv_size(ctx->dst_fmt.width,
 						ctx->dst_fmt.height);
+	else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME)
+		buf_size += hantro_vp9_mv_size(ctx->dst_fmt.width,
+					       ctx->dst_fmt.height);
 
 	for (i = 0; i < num_buffers; ++i) {
 		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
@@ -152,6 +171,13 @@ static void hantro_postproc_g1_disable(struct hantro_ctx *ctx)
 	HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x0);
 }
 
+static void hantro_postproc_g2_disable(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	hantro_reg_write(vpu, &g2_out_rs_e, 0);
+}
+
 void hantro_postproc_disable(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
@@ -172,3 +198,8 @@ const struct hantro_postproc_ops hantro_g1_postproc_ops = {
 	.enable = hantro_postproc_g1_enable,
 	.disable = hantro_postproc_g1_disable,
 };
+
+const struct hantro_postproc_ops hantro_g2_postproc_ops = {
+	.enable = hantro_postproc_g2_enable,
+	.disable = hantro_postproc_g2_disable,
+};
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index 455a107ffb02..1a43f6fceef9 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -132,6 +132,14 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
 	},
 };
 
+static const struct hantro_fmt imx8m_vpu_g2_postproc_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.codec_mode = HANTRO_MODE_NONE,
+		.postprocessed = true,
+	},
+};
+
 static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12_4L4,
@@ -301,6 +309,9 @@ const struct hantro_variant imx8mq_vpu_g2_variant = {
 	.dec_offset = 0x0,
 	.dec_fmts = imx8m_vpu_g2_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_g2_dec_fmts),
+	.postproc_fmts = imx8m_vpu_g2_postproc_fmts,
+	.num_postproc_fmts = ARRAY_SIZE(imx8m_vpu_g2_postproc_fmts),
+	.postproc_ops = &hantro_g2_postproc_ops,
 	.codec = HANTRO_HEVC_DECODER | HANTRO_VP9_DECODER,
 	.codec_ops = imx8mq_vpu_g2_codec_ops,
 	.init = imx8mq_vpu_hw_init,
-- 
2.17.1

