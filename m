Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B111D28C392
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 22:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731829AbgJLU7Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 16:59:16 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49956 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731734AbgJLU7D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 16:59:03 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 88D491F44C50
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 13/18] media: hantro: add VC8000D postproc support
Date:   Mon, 12 Oct 2020 23:59:52 +0300
Message-Id: <20201012205957.889185-14-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012205957.889185-1-adrian.ratiu@collabora.com>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VC8000D decodes only to 4x4 tiled NV12 format and the attached PP
can be used to de-tile its output. This can bo done in two modes:

1. Pipeline mode, using the same decoder "done" irq
2. External mode, with a separate irq and input setup.

This adds the relevant postprocessor fields and support for pipeline
mode de-tiling.

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 .../staging/media/hantro/hantro_postproc.c    | 58 ++++++++++++++++---
 drivers/staging/media/hantro/hantro_regmap.c  | 41 +++++++++++++
 drivers/staging/media/hantro/hantro_regmap.h  |  8 +++
 3 files changed, 98 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
index 6d1705a60d36..a6b3e243dc39 100644
--- a/drivers/staging/media/hantro/hantro_postproc.c
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -20,22 +20,35 @@
 #define VPU_PP_OUT_RGB			0x0
 #define VPU_PP_OUT_YUYV			0x3
 
+#define VC8000D_PP_OUT_NV12		0x0
+
 void hantro_postproc_enable(struct hantro_ctx *ctx)
 {
 	struct hantro_regmap_fields_dec *fields = ctx->dev->reg_fields_dec;
 	struct vb2_v4l2_buffer *dst_buf;
-	u32 src_pp_fmt, dst_pp_fmt;
+	u32 src_pp_fmt, dst_pp_fmt, in_width, in_height;
 	dma_addr_t dst_dma;
 
 	/* Turn on pipeline mode. Must be done first. */
 	regmap_field_write(fields->pp_pipeline_en, 1);
 
+	/*
+	 * use NV12 as input format for pipeline mode as that's what decoder
+	 * outputs, on VC8000D it is 4x4 tiled NV12.
+	 */
 	src_pp_fmt = VPU_PP_IN_NV12;
 
 	switch (ctx->vpu_dst_fmt->fourcc) {
 	case V4L2_PIX_FMT_YUYV:
 		dst_pp_fmt = VPU_PP_OUT_YUYV;
 		break;
+	case V4L2_PIX_FMT_NV12:
+		/* src == dst == NV12 only makes sense to de-tile on VC8000D */
+		if (ctx->dev->core_hw_dec_rev == HANTRO_VC8000_REV) {
+			dst_pp_fmt = VC8000D_PP_OUT_NV12;
+			break;
+		}
+		fallthrough;
 	default:
 		WARN(1, "output format %d not supported by the post-processor, this wasn't expected.",
 		     ctx->vpu_dst_fmt->fourcc);
@@ -46,19 +59,46 @@ void hantro_postproc_enable(struct hantro_ctx *ctx)
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
 
-	regmap_field_write(fields->pp_clk_gate, 1);
-	regmap_field_write(fields->pp_out_endian, 1);
-	regmap_field_write(fields->pp_out_swap32, 1);
-	regmap_field_write(fields->pp_max_burst, 16);
+	switch (ctx->dev->core_hw_dec_rev) {
+	case HANTRO_G1_REV:
+		regmap_field_write(fields->pp_clk_gate, 1);
+		regmap_field_write(fields->pp_out_endian, 1);
+		regmap_field_write(fields->pp_out_swap32, 1);
+		regmap_field_write(fields->pp_max_burst, 16);
+		regmap_field_write(fields->pp_orig_width, MB_WIDTH(ctx->dst_fmt.width));
+		regmap_field_write(fields->pp_display_width, ctx->dst_fmt.width);
+		in_width = MB_WIDTH(ctx->src_fmt.width);
+		in_height = MB_WIDTH(ctx->src_fmt.height);
+		break;
+	case HANTRO_VC8000_REV:
+		/* on VC8000D the PP is used to de-tile decoder output */
+		regmap_field_write(fields->pp_out_tile_e, 0);
+
+		regmap_field_write(fields->pp_out_y_stride, ctx->dst_fmt.width);
+		regmap_field_write(fields->pp_out_c_stride, ctx->dst_fmt.width);
+
+		regmap_field_write(fields->pp_out_chroma_base, dst_dma +
+				   ctx->dst_fmt.width * ctx->dst_fmt.height);
+
+		/* VC8000D input resolution is a 2-pixels length. */
+		in_width = ctx->src_fmt.width / 2;
+		in_height = ctx->src_fmt.height / 2;
+
+		break;
+	default:
+		vpu_err("PP does not recognize HW revision: %x, disabling\n",
+			ctx->dev->core_hw_dec_rev);
+		hantro_postproc_disable(ctx);
+		return;
+	}
+
 	regmap_field_write(fields->pp_out_luma_base, dst_dma);
-	regmap_field_write(fields->pp_input_width, MB_WIDTH(ctx->dst_fmt.width));
-	regmap_field_write(fields->pp_input_height, MB_HEIGHT(ctx->dst_fmt.height));
+	regmap_field_write(fields->pp_input_width, in_width);
+	regmap_field_write(fields->pp_input_height, in_height);
 	regmap_field_write(fields->pp_input_fmt, src_pp_fmt);
 	regmap_field_write(fields->pp_output_fmt, dst_pp_fmt);
 	regmap_field_write(fields->pp_output_width, ctx->dst_fmt.width);
 	regmap_field_write(fields->pp_output_height, ctx->dst_fmt.height);
-	regmap_field_write(fields->pp_orig_width, MB_WIDTH(ctx->dst_fmt.width));
-	regmap_field_write(fields->pp_display_width, ctx->dst_fmt.width);
 }
 
 void hantro_postproc_free(struct hantro_ctx *ctx)
diff --git a/drivers/staging/media/hantro/hantro_regmap.c b/drivers/staging/media/hantro/hantro_regmap.c
index 0e74ba69034f..b87fe809f2f7 100644
--- a/drivers/staging/media/hantro/hantro_regmap.c
+++ b/drivers/staging/media/hantro/hantro_regmap.c
@@ -75,6 +75,10 @@ struct hantro_field_dec {
 	struct reg_field cfg_pp_out_swap32;
 	struct reg_field cfg_pp_out_endian;
 	struct reg_field cfg_pp_out_luma_base;
+	struct reg_field cfg_pp_out_chroma_base;
+	struct reg_field cfg_pp_in_luma_base;
+	struct reg_field cfg_pp_in_chroma_base;
+	struct reg_field cfg_pp_out_tile_e;
 	struct reg_field cfg_pp_input_width;
 	struct reg_field cfg_pp_input_height;
 	struct reg_field cfg_pp_output_width;
@@ -93,6 +97,10 @@ struct hantro_field_dec {
 	struct reg_field cfg_pp_scale_hratio;
 	struct reg_field cfg_pp_scale_inv_wratio;
 	struct reg_field cfg_pp_scale_inv_hratio;
+	struct reg_field cfg_pp_out_c_stride;
+	struct reg_field cfg_pp_out_y_stride;
+	struct reg_field cfg_pp_in_c_stride;
+	struct reg_field cfg_pp_in_y_stride;
 };
 
 struct hantro_field_enc {
@@ -181,6 +189,31 @@ static const struct hantro_field_dec vc8000d_field = {
 	.cfg_dec_ext_timeout_e =	REG_FIELD(SWREG(318), 31, 31),
 	.cfg_dec_timeout_cycles =	REG_FIELD(SWREG(319), 0, 30),
 	.cfg_dec_timeout_e =		REG_FIELD(SWREG(319), 31, 31),
+	.cfg_pp_pipeline_en =		REG_FIELD(SWREG(320), 0, 0),
+	.cfg_pp_out_tile_e =		REG_FIELD(SWREG(320), 3, 3),
+	.cfg_pp_output_fmt =		REG_FIELD(SWREG(322), 18, 22),
+	.cfg_pp_input_fmt =		REG_FIELD(SWREG(322), 27, 31),
+	.cfg_pp_out_luma_base =		REG_FIELD(SWREG(326), 0, 31),
+	.cfg_pp_out_chroma_base =	REG_FIELD(SWREG(328), 0, 31),
+	.cfg_pp_in_luma_base =		REG_FIELD(SWREG(339), 0, 31),
+	.cfg_pp_in_chroma_base =	REG_FIELD(SWREG(341), 0, 31),
+	.cfg_pp_input_height =		REG_FIELD(SWREG(331), 0, 15),
+	.cfg_pp_input_width =		REG_FIELD(SWREG(331), 16, 31),
+	.cfg_pp_output_height =		REG_FIELD(SWREG(332), 0, 15),
+	.cfg_pp_output_width =		REG_FIELD(SWREG(332), 16, 31),
+	.cfg_pp_crop_starty =		REG_FIELD(SWREG(330), 0, 12),
+	.cfg_pp_rotation_mode =		REG_FIELD(SWREG(330), 13, 14),
+	.cfg_pp_crop_startx =		REG_FIELD(SWREG(330), 16, 28),
+	.cfg_pp_vscale_mode =		REG_FIELD(SWREG(322), 23, 24),
+	.cfg_pp_hscale_mode =		REG_FIELD(SWREG(322), 25, 26),
+	.cfg_pp_scale_wratio =		REG_FIELD(SWREG(323), 0, 17),
+	.cfg_pp_scale_hratio =		REG_FIELD(SWREG(322), 0, 17),
+	.cfg_pp_scale_inv_wratio =	REG_FIELD(SWREG(324), 16, 31),
+	.cfg_pp_scale_inv_hratio =	REG_FIELD(SWREG(324), 0, 15),
+	.cfg_pp_out_c_stride =		REG_FIELD(SWREG(329), 0, 15),
+	.cfg_pp_out_y_stride =		REG_FIELD(SWREG(329), 16, 31),
+	.cfg_pp_in_c_stride =		REG_FIELD(SWREG(337), 0, 15),
+	.cfg_pp_in_y_stride =		REG_FIELD(SWREG(337), 16, 31),
 };
 
 #define INIT_FIELD_CFG(f, codec, conf) ({					\
@@ -246,6 +279,14 @@ static int hantro_regmap_fields_init_dec(struct hantro_dev *vpu,
 	INIT_DEC_FIELD(pp_out_swap32);
 	INIT_DEC_FIELD(pp_out_endian);
 	INIT_DEC_FIELD(pp_out_luma_base);
+	INIT_DEC_FIELD(pp_out_chroma_base);
+	INIT_DEC_FIELD(pp_out_tile_e);
+	INIT_DEC_FIELD(pp_out_c_stride);
+	INIT_DEC_FIELD(pp_out_y_stride);
+	INIT_DEC_FIELD(pp_in_c_stride);
+	INIT_DEC_FIELD(pp_in_y_stride);
+	INIT_DEC_FIELD(pp_in_luma_base);
+	INIT_DEC_FIELD(pp_in_chroma_base);
 	INIT_DEC_FIELD(pp_input_width);
 	INIT_DEC_FIELD(pp_input_height);
 	INIT_DEC_FIELD(pp_output_width);
diff --git a/drivers/staging/media/hantro/hantro_regmap.h b/drivers/staging/media/hantro/hantro_regmap.h
index 8ec0020f40c3..0a39bae83f85 100644
--- a/drivers/staging/media/hantro/hantro_regmap.h
+++ b/drivers/staging/media/hantro/hantro_regmap.h
@@ -65,6 +65,10 @@ struct hantro_regmap_fields_dec {
 	struct regmap_field *pp_out_swap32;
 	struct regmap_field *pp_out_endian;
 	struct regmap_field *pp_out_luma_base;
+	struct regmap_field *pp_out_chroma_base;
+	struct regmap_field *pp_in_luma_base;
+	struct regmap_field *pp_in_chroma_base;
+	struct regmap_field *pp_out_tile_e;
 	struct regmap_field *pp_input_width;
 	struct regmap_field *pp_input_height;
 	struct regmap_field *pp_output_width;
@@ -83,6 +87,10 @@ struct hantro_regmap_fields_dec {
 	struct regmap_field *pp_scale_hratio;
 	struct regmap_field *pp_scale_inv_wratio;
 	struct regmap_field *pp_scale_inv_hratio;
+	struct regmap_field *pp_out_y_stride;
+	struct regmap_field *pp_out_c_stride;
+	struct regmap_field *pp_in_y_stride;
+	struct regmap_field *pp_in_c_stride;
 };
 
 struct hantro_regmap_fields_enc {
-- 
2.28.0

