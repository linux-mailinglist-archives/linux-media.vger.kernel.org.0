Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C9C3B4551
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 16:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbhFYOOo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 10:14:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58548 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231831AbhFYOOi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 10:14:38 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:42b6:51ca:7d52:50ad])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 243821F4474E;
        Fri, 25 Jun 2021 15:12:15 +0100 (BST)
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
Subject: [PATCH v4 7/9] media: hantro: enumerate scaled output formats
Date:   Fri, 25 Jun 2021 16:11:41 +0200
Message-Id: <20210625141143.577998-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625141143.577998-1-benjamin.gaignard@collabora.com>
References: <20210625141143.577998-1-benjamin.gaignard@collabora.com>
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
version 4:
 - rename ops scaling to enum_framesizes
 
 drivers/staging/media/hantro/hantro.h         |  4 ++
 .../staging/media/hantro/hantro_g2_hevc_dec.c | 46 ++++++++++++++++++-
 drivers/staging/media/hantro/hantro_g2_regs.h |  6 +++
 drivers/staging/media/hantro/hantro_hw.h      |  2 +
 drivers/staging/media/hantro/hantro_v4l2.c    | 10 ++--
 drivers/staging/media/hantro/imx8m_vpu_hw.c   |  8 +++-
 6 files changed, 70 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 6b9a3a96d584..b12bcaa7233e 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -54,10 +54,14 @@ struct hantro_irq {
  *
  * @init:			Initialize hardware.
  * @runtime_resume:		reenable hardware after power gating
+ * @enum_framesizes:		Enumerate possible scaled output formats.
+ *				Returns zero if OK, a negative value in error cases.
+ *				Optional.
  */
 struct hantro_variant_ops {
 	int (*init)(struct hantro_dev *vpu);
 	int (*runtime_resume)(struct hantro_dev *vpu);
+	int (*enum_framesizes)(struct hantro_ctx *ctx, struct v4l2_frmsizeenum *fsize);
 };
 
 /**
diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
index 3b273f31e9ce..90de74aa6b13 100644
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
 
+int hantro_g2_dec_enum_framesizes(struct hantro_ctx *ctx,
+				  struct v4l2_frmsizeenum *fsize)
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
index 460e86efa7a4..d8126f8178f5 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -243,6 +243,8 @@ int hantro_hevc_dec_init(struct hantro_ctx *ctx);
 void hantro_hevc_dec_exit(struct hantro_ctx *ctx);
 int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx);
 void hantro_g2_hevc_dec_done(struct hantro_ctx *ctx);
+int hantro_g2_dec_enum_framesizes(struct hantro_ctx *ctx,
+				  struct v4l2_frmsizeenum *fsize);
 int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx);
 dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, int poc);
 void hantro_hevc_ref_remove_unused(struct hantro_ctx *ctx);
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index d5fe808d858b..9e9caf08a5b6 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -118,7 +118,7 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 	struct hantro_ctx *ctx = fh_to_ctx(priv);
 	const struct hantro_fmt *fmt;
 
-	if (fsize->index != 0) {
+	if (fsize->index != 0 && !ctx->dev->variant->ops->enum_framesizes) {
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
+		if (ctx->dev->variant->ops->enum_framesizes)
+			return ctx->dev->variant->ops->enum_framesizes(ctx, fsize);
+
 		return -EINVAL;
+	}
 
 	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
 	fsize->stepwise = fmt->frmsize;
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index 2e8cf32efb79..f40ee3590729 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -280,6 +280,12 @@ static struct hantro_variant_ops imx8mq_vpu_variant_ops = {
 	.runtime_resume = imx8mq_runtime_resume,
 };
 
+static struct hantro_variant_ops imx8mq_vpu_g2_variant_ops = {
+	.init = imx8mq_vpu_hw_init,
+	.runtime_resume = imx8mq_runtime_resume,
+	.enum_framesizes = hantro_g2_dec_enum_framesizes,
+};
+
 const struct hantro_variant imx8mq_vpu_variant = {
 	.dec_fmts = imx8m_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
@@ -306,5 +312,5 @@ const struct hantro_variant imx8mq_vpu_g2_variant = {
 	.num_irqs = ARRAY_SIZE(imx8mq_g2_irqs),
 	.clk_names = imx8mq_clk_names,
 	.num_clocks = ARRAY_SIZE(imx8mq_clk_names),
-	.ops = &imx8mq_vpu_variant_ops,
+	.ops = &imx8mq_vpu_g2_variant_ops,
 };
-- 
2.25.1

