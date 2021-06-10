Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952A13A2FAD
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 17:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbhFJPrS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 11:47:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58026 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbhFJPq6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 11:46:58 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:cb4:bb8b:23cb:d0d0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F2BA31F43E59;
        Thu, 10 Jun 2021 16:44:58 +0100 (BST)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil@xs4all.nl, ezequiel@collabora.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk, jernej.skrabec@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 6/8] media: hantro: enumerate scaled output formats
Date:   Thu, 10 Jun 2021 17:44:40 +0200
Message-Id: <20210610154442.806107-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610154442.806107-1-benjamin.gaignard@collabora.com>
References: <20210610154442.806107-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When enumerating the output formats take care of the hardware scaling
capabilities.
For a given input size G2 hardware block is capable of down scale the
output by 2, 4 or 8 factor. When decoding 4K streams that to be could
helpful to save memory bandwidth.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/staging/media/hantro/hantro.h         |  4 ++
 .../staging/media/hantro/hantro_g2_hevc_dec.c | 46 ++++++++++++++++++-
 drivers/staging/media/hantro/hantro_g2_regs.h |  6 +++
 drivers/staging/media/hantro/hantro_hw.h      |  1 +
 drivers/staging/media/hantro/hantro_v4l2.c    | 10 ++--
 drivers/staging/media/hantro/imx8m_vpu_hw.c   |  1 +
 6 files changed, 63 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 6a21d1e95b34..ca9038b0384a 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -71,6 +71,9 @@ struct hantro_irq {
  * @reg_names:			array of register range names
  * @num_regs:			number of register range names in the array
  * @postproc_regs:		&struct hantro_postproc_regs pointer
+ * @scaling:			Set possible scaled output formats.
+ *				Returns zero if OK, a negative value in error cases.
+ *				Optional.
  */
 struct hantro_variant {
 	unsigned int enc_offset;
@@ -92,6 +95,7 @@ struct hantro_variant {
 	const char * const *reg_names;
 	int num_regs;
 	const struct hantro_postproc_regs *postproc_regs;
+	int (*scaling)(struct hantro_ctx *ctx, struct v4l2_frmsizeenum *fsize);
 };
 
 /**
diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
index 6a961dbc189f..b3c6e1e50f49 100644
--- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
@@ -396,6 +396,17 @@ static void set_ref_pic_list(struct hantro_ctx *ctx)
 	}
 }
 
+static int down_scale_factor(struct hantro_ctx *ctx)
+{
+	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
+	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
+
+	if (sps->pic_width_in_luma_samples == ctx->dst_fmt.width)
+		return 0;
+
+	return DIV_ROUND_CLOSEST(sps->pic_width_in_luma_samples, ctx->dst_fmt.width);
+}
+
 static int set_ref(struct hantro_ctx *ctx)
 {
 	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
@@ -409,6 +420,7 @@ static int set_ref(struct hantro_ctx *ctx)
 	size_t mv_offset = hantro_hevc_motion_vectors_offset(sps);
 	size_t compress_luma_offset = hantro_hevc_luma_compress_offset(sps);
 	size_t compress_chroma_offset = hantro_hevc_chroma_compress_offset(sps);
+	int down_scale = down_scale_factor(ctx);
 	u32 max_ref_frames;
 	u16 dpb_longterm_e;
 	static const struct hantro_reg cur_poc[] = {
@@ -521,8 +533,18 @@ static int set_ref(struct hantro_ctx *ctx)
 	hantro_write_addr(vpu, G2_REG_CHR_REF(i), chroma_addr);
 	hantro_write_addr(vpu, G2_REG_DMV_REF(i++), mv_addr);
 
-	hantro_write_addr(vpu, G2_ADDR_DST, luma_addr);
-	hantro_write_addr(vpu, G2_ADDR_DST_CHR, chroma_addr);
+	if (down_scale) {
+		chroma_addr = luma_addr + (cr_offset >> down_scale);
+		hantro_reg_write(vpu, &g2_down_scale_e, 1);
+		hantro_reg_write(vpu, &g2_down_scale_y, down_scale >> 2);
+		hantro_reg_write(vpu, &g2_down_scale_x, down_scale >> 2);
+		hantro_write_addr(vpu, G2_DS_DST, luma_addr);
+		hantro_write_addr(vpu, G2_DS_DST_CHR, chroma_addr);
+	} else {
+		hantro_write_addr(vpu, G2_ADDR_DST, luma_addr);
+		hantro_write_addr(vpu, G2_ADDR_DST_CHR, chroma_addr);
+	}
+
 	hantro_write_addr(vpu, G2_ADDR_DST_MV, mv_addr);
 	hantro_write_addr(vpu, G2_COMP_ADDR_DST, compress_luma_addr);
 	hantro_write_addr(vpu, G2_COMP_CHR, compress_chroma_addr);
@@ -603,6 +625,26 @@ static void hantro_g2_check_idle(struct hantro_dev *vpu)
 	}
 }
 
+int hantro_g2_hevc_dec_scaling(struct hantro_ctx *ctx,
+			       struct v4l2_frmsizeenum *fsize)
+{
+	/**
+	 * G2 scaler can scale down by 0, 2, 4 or 8
+	 * use fsize->index has power of 2 diviser
+	 **/
+	if (fsize->index > 3)
+		return -EINVAL;
+
+	if (!ctx->src_fmt.width || !ctx->src_fmt.height)
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+	fsize->discrete.width = ctx->src_fmt.width >> fsize->index;
+	fsize->discrete.height = ctx->src_fmt.height >> fsize->index;
+
+	return 0;
+}
+
 int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
diff --git a/drivers/staging/media/hantro/hantro_g2_regs.h b/drivers/staging/media/hantro/hantro_g2_regs.h
index 941e5482d27b..54f3d78ce46e 100644
--- a/drivers/staging/media/hantro/hantro_g2_regs.h
+++ b/drivers/staging/media/hantro/hantro_g2_regs.h
@@ -174,6 +174,10 @@
 #define g2_buswidth		G2_DEC_REG(58, 8,  0x7)
 #define g2_max_burst		G2_DEC_REG(58, 0,  0xff)
 
+#define g2_down_scale_e	G2_DEC_REG(184, 7, 0x1)
+#define g2_down_scale_y	G2_DEC_REG(184, 2, 0x3)
+#define g2_down_scale_x	G2_DEC_REG(184, 0, 0x3)
+
 #define G2_REG_CONFIG				G2_SWREG(58)
 #define G2_REG_CONFIG_DEC_CLK_GATE_E		BIT(16)
 #define G2_REG_CONFIG_DEC_CLK_GATE_IDLE_E	BIT(17)
@@ -193,6 +197,8 @@
 #define G2_TILE_FILTER		(G2_SWREG(179))
 #define G2_TILE_SAO		(G2_SWREG(181))
 #define G2_TILE_BSD		(G2_SWREG(183))
+#define G2_DS_DST		(G2_SWREG(186))
+#define G2_DS_DST_CHR		(G2_SWREG(188))
 #define G2_COMP_ADDR_DST	(G2_SWREG(190))
 #define G2_COMP_ADDR_REF(i)	(G2_SWREG(192) + ((i) * 0x8))
 #define G2_COMP_CHR		(G2_SWREG(224))
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index c5374cd74d66..2edb890f10af 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -241,6 +241,7 @@ int hantro_hevc_dec_init(struct hantro_ctx *ctx);
 void hantro_hevc_dec_exit(struct hantro_ctx *ctx);
 int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx);
 void hantro_g2_hevc_dec_done(struct hantro_ctx *ctx);
+int hantro_g2_hevc_dec_scaling(struct hantro_ctx *ctx, struct v4l2_frmsizeenum *fsize);
 int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx);
 dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, int poc);
 void hantro_hevc_ref_remove_unused(struct hantro_ctx *ctx);
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index bcb0bdff4a9a..566b645f661d 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -118,7 +118,7 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 	struct hantro_ctx *ctx = fh_to_ctx(priv);
 	const struct hantro_fmt *fmt;
 
-	if (fsize->index != 0) {
+	if (fsize->index != 0 && !ctx->dev->variant->scaling) {
 		vpu_debug(0, "invalid frame size index (expected 0, got %d)\n",
 			  fsize->index);
 		return -EINVAL;
@@ -131,9 +131,13 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 		return -EINVAL;
 	}
 
-	/* This only makes sense for coded formats */
-	if (fmt->codec_mode == HANTRO_MODE_NONE)
+	/* For non-coded formats check if scaling is possible */
+	if (fmt->codec_mode == HANTRO_MODE_NONE) {
+		if (ctx->dev->variant->scaling)
+			return ctx->dev->variant->scaling(ctx, fsize);
+
 		return -EINVAL;
+	}
 
 	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
 	fsize->stepwise = fmt->frmsize;
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index 65bcf46740d7..d3b760569b52 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -304,4 +304,5 @@ const struct hantro_variant imx8mq_vpu_g2_variant = {
 	.num_irqs = ARRAY_SIZE(imx8mq_g2_irqs),
 	.clk_names = imx8mq_clk_names,
 	.num_clocks = ARRAY_SIZE(imx8mq_clk_names),
+	.scaling = hantro_g2_hevc_dec_scaling,
 };
-- 
2.25.1

