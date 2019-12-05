Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03D111142A0
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 15:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729784AbfLEOZd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 09:25:33 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49432 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729769AbfLEOZc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 09:25:32 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id CCEBC292248
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v4 4/4] media: hantro: Support color conversion via post-processing
Date:   Thu,  5 Dec 2019 11:24:43 -0300
Message-Id: <20191205142443.1298-5-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191205142443.1298-1-ezequiel@collabora.com>
References: <20191205142443.1298-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Hantro G1 decoder is able to enable a post-processor
on the decoding pipeline, which can be used to perform
scaling and color conversion.

The post-processor is integrated to the decoder, and it's
possible to use it in a way that is completely transparent
to the user.

This commit enables color conversion via post-processing,
which means the driver now exposes YUV packed, in addition to NV12.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/staging/media/hantro/Makefile         |   1 +
 drivers/staging/media/hantro/hantro.h         |  66 +++++++-
 drivers/staging/media/hantro/hantro_drv.c     |   7 +-
 .../staging/media/hantro/hantro_g1_h264_dec.c |   2 +-
 .../media/hantro/hantro_g1_mpeg2_dec.c        |   2 +-
 drivers/staging/media/hantro/hantro_g1_regs.h |  53 +++++++
 .../staging/media/hantro/hantro_g1_vp8_dec.c  |   2 +-
 drivers/staging/media/hantro/hantro_hw.h      |  13 ++
 .../staging/media/hantro/hantro_postproc.c    | 142 ++++++++++++++++++
 drivers/staging/media/hantro/hantro_v4l2.c    |  56 ++++++-
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |  10 ++
 11 files changed, 343 insertions(+), 11 deletions(-)
 create mode 100644 drivers/staging/media/hantro/hantro_postproc.c

diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
index 5d6b0383d280..496b30c3c396 100644
--- a/drivers/staging/media/hantro/Makefile
+++ b/drivers/staging/media/hantro/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_VIDEO_HANTRO) += hantro-vpu.o
 hantro-vpu-y += \
 		hantro_drv.o \
 		hantro_v4l2.o \
+		hantro_postproc.o \
 		hantro_h1_jpeg_enc.o \
 		hantro_g1_h264_dec.o \
 		hantro_g1_mpeg2_dec.o \
diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index deb90ae37859..b0faa43b3f79 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -60,6 +60,8 @@ struct hantro_irq {
  * @num_enc_fmts:		Number of encoder formats.
  * @dec_fmts:			Decoder formats.
  * @num_dec_fmts:		Number of decoder formats.
+ * @postproc_fmts:		Post-processor formats.
+ * @num_postproc_fmts:		Number of post-processor formats.
  * @codec:			Supported codecs
  * @codec_ops:			Codec ops.
  * @init:			Initialize hardware.
@@ -70,6 +72,7 @@ struct hantro_irq {
  * @num_clocks:			number of clocks in the array
  * @reg_names:			array of register range names
  * @num_regs:			number of register range names in the array
+ * @postproc_regs:		&struct hantro_postproc_regs pointer
  */
 struct hantro_variant {
 	unsigned int enc_offset;
@@ -78,6 +81,8 @@ struct hantro_variant {
 	unsigned int num_enc_fmts;
 	const struct hantro_fmt *dec_fmts;
 	unsigned int num_dec_fmts;
+	const struct hantro_fmt *postproc_fmts;
+	unsigned int num_postproc_fmts;
 	unsigned int codec;
 	const struct hantro_codec_ops *codec_ops;
 	int (*init)(struct hantro_dev *vpu);
@@ -88,6 +93,7 @@ struct hantro_variant {
 	int num_clocks;
 	const char * const *reg_names;
 	int num_regs;
+	const struct hantro_postproc_regs *postproc_regs;
 };
 
 /**
@@ -213,6 +219,7 @@ struct hantro_dev {
  *			context, and it's called right before
  *			calling v4l2_m2m_job_finish.
  * @codec_ops:		Set of operations related to codec mode.
+ * @postproc:		Post-processing context.
  * @jpeg_enc:		JPEG-encoding context.
  * @mpeg2_dec:		MPEG-2-decoding context.
  * @vp8_dec:		VP8-decoding context.
@@ -237,6 +244,7 @@ struct hantro_ctx {
 			  unsigned int bytesused);
 
 	const struct hantro_codec_ops *codec_ops;
+	struct hantro_postproc_ctx postproc;
 
 	/* Specific for particular codec modes. */
 	union {
@@ -274,6 +282,23 @@ struct hantro_reg {
 	u32 mask;
 };
 
+struct hantro_postproc_regs {
+	struct hantro_reg pipeline_en;
+	struct hantro_reg max_burst;
+	struct hantro_reg clk_gate;
+	struct hantro_reg out_swap32;
+	struct hantro_reg out_endian;
+	struct hantro_reg out_luma_base;
+	struct hantro_reg input_width;
+	struct hantro_reg input_height;
+	struct hantro_reg output_width;
+	struct hantro_reg output_height;
+	struct hantro_reg input_fmt;
+	struct hantro_reg output_fmt;
+	struct hantro_reg orig_width;
+	struct hantro_reg display_width;
+};
+
 /* Logging helpers */
 
 /**
@@ -352,16 +377,30 @@ static inline u32 vdpu_read(struct hantro_dev *vpu, u32 reg)
 	return val;
 }
 
-static inline void hantro_reg_write(struct hantro_dev *vpu,
-				    const struct hantro_reg *reg,
-				    u32 val)
+static inline u32 vdpu_read_mask(struct hantro_dev *vpu,
+				 const struct hantro_reg *reg,
+				 u32 val)
 {
 	u32 v;
 
 	v = vdpu_read(vpu, reg->base);
 	v &= ~(reg->mask << reg->shift);
 	v |= ((val & reg->mask) << reg->shift);
-	vdpu_write_relaxed(vpu, v, reg->base);
+	return v;
+}
+
+static inline void hantro_reg_write(struct hantro_dev *vpu,
+				    const struct hantro_reg *reg,
+				    u32 val)
+{
+	vdpu_write_relaxed(vpu, vdpu_read_mask(vpu, reg, val), reg->base);
+}
+
+static inline void hantro_reg_write_s(struct hantro_dev *vpu,
+				      const struct hantro_reg *reg,
+				      u32 val)
+{
+	vdpu_write(vpu, vdpu_read_mask(vpu, reg, val), reg->base);
 }
 
 bool hantro_is_encoder_ctx(const struct hantro_ctx *ctx);
@@ -381,4 +420,23 @@ hantro_get_dst_buf(struct hantro_ctx *ctx)
 	return v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 }
 
+static inline bool
+hantro_needs_postproc(struct hantro_ctx *ctx, const struct hantro_fmt *fmt)
+{
+	return fmt->fourcc != V4L2_PIX_FMT_NV12;
+}
+
+static inline dma_addr_t
+hantro_get_dec_buf_addr(struct hantro_ctx *ctx, struct vb2_buffer *vb)
+{
+	if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
+		return ctx->postproc.dec_q[vb->index].dma;
+	return vb2_dma_contig_plane_dma_addr(vb, 0);
+}
+
+void hantro_postproc_disable(struct hantro_ctx *ctx);
+void hantro_postproc_enable(struct hantro_ctx *ctx);
+void hantro_postproc_free(struct hantro_ctx *ctx);
+int hantro_postproc_alloc(struct hantro_ctx *ctx);
+
 #endif /* HANTRO_H_ */
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 974ac0a11dd1..97c615a2f057 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -53,7 +53,7 @@ dma_addr_t hantro_get_ref(struct hantro_ctx *ctx, u64 ts)
 	if (index < 0)
 		return 0;
 	buf = vb2_get_buffer(q, index);
-	return vb2_dma_contig_plane_dma_addr(buf, 0);
+	return hantro_get_dec_buf_addr(ctx, buf);
 }
 
 static int
@@ -159,6 +159,11 @@ void hantro_start_prepare_run(struct hantro_ctx *ctx)
 	src_buf = hantro_get_src_buf(ctx);
 	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
 				&ctx->ctrl_handler);
+
+	if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
+		hantro_postproc_enable(ctx);
+	else
+		hantro_postproc_disable(ctx);
 }
 
 void hantro_end_prepare_run(struct hantro_ctx *ctx)
diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 887dc5210447..424c648ce9fc 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -244,7 +244,7 @@ static void set_buffers(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, src_dma, G1_REG_ADDR_STR);
 
 	/* Destination (decoded frame) buffer. */
-	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+	dst_dma = hantro_get_dec_buf_addr(ctx, &dst_buf->vb2_buf);
 	/* Adjust dma addr to start at second line for bottom field */
 	if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
 		offset = ALIGN(ctx->src_fmt.width, MB_DIM);
diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index d6dde70f20b4..24041849384a 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -121,7 +121,7 @@ hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
 	vdpu_write_relaxed(vpu, addr, G1_REG_RLC_VLC_BASE);
 
 	/* Destination frame buffer */
-	addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
+	addr = hantro_get_dec_buf_addr(ctx, dst_buf);
 	current_addr = addr;
 
 	if (picture->picture_structure == PICT_BOTTOM_FIELD)
diff --git a/drivers/staging/media/hantro/hantro_g1_regs.h b/drivers/staging/media/hantro/hantro_g1_regs.h
index 5c0ea7994336..c1756e3d5391 100644
--- a/drivers/staging/media/hantro/hantro_g1_regs.h
+++ b/drivers/staging/media/hantro/hantro_g1_regs.h
@@ -9,6 +9,8 @@
 #ifndef HANTRO_G1_REGS_H_
 #define HANTRO_G1_REGS_H_
 
+#define G1_SWREG(nr)                 ((nr) * 4)
+
 /* Decoder registers. */
 #define G1_REG_INTERRUPT				0x004
 #define     G1_REG_INTERRUPT_DEC_PIC_INF		BIT(24)
@@ -298,4 +300,55 @@
 #define     G1_REG_REF_BUF_CTRL2_APF_THRESHOLD(x)	(((x) & 0x3fff) << 0)
 #define G1_REG_SOFT_RESET				0x194
 
+/* Post-processor registers. */
+#define G1_REG_PP_INTERRUPT		G1_SWREG(60)
+#define    G1_REG_PP_READY_IRQ		BIT(12)
+#define    G1_REG_PP_IRQ		BIT(8)
+#define    G1_REG_PP_IRQ_DIS		BIT(4)
+#define    G1_REG_PP_PIPELINE_EN	BIT(1)
+#define    G1_REG_PP_EXTERNAL_TRIGGER	BIT(0)
+#define G1_REG_PP_DEV_CONFIG		G1_SWREG(61)
+#define     G1_REG_PP_AXI_RD_ID(v)	(((v) << 24) & GENMASK(31, 24))
+#define     G1_REG_PP_AXI_WR_ID(v)	(((v) << 16) & GENMASK(23, 16))
+#define     G1_REG_PP_INSWAP32_E(v)	((v) ? BIT(10) : 0)
+#define     G1_REG_PP_DATA_DISC_E(v)	((v) ? BIT(9) : 0)
+#define     G1_REG_PP_CLK_GATE_E(v)	((v) ? BIT(8) : 0)
+#define     G1_REG_PP_IN_ENDIAN(v)	((v) ? BIT(7) : 0)
+#define     G1_REG_PP_OUT_ENDIAN(v)	((v) ? BIT(6) : 0)
+#define     G1_REG_PP_OUTSWAP32_E(v)	((v) ? BIT(5) : 0)
+#define     G1_REG_PP_MAX_BURST(v)	(((v) << 0) & GENMASK(4, 0))
+#define G1_REG_PP_IN_LUMA_BASE		G1_SWREG(63)
+#define G1_REG_PP_IN_CB_BASE		G1_SWREG(64)
+#define G1_REG_PP_IN_CR_BASE		G1_SWREG(65)
+#define G1_REG_PP_OUT_LUMA_BASE		G1_SWREG(66)
+#define G1_REG_PP_OUT_CHROMA_BASE	G1_SWREG(67)
+#define G1_REG_PP_CONTRAST_ADJUST	G1_SWREG(68)
+#define G1_REG_PP_COLOR_CONVERSION	G1_SWREG(69)
+#define G1_REG_PP_COLOR_CONVERSION0	G1_SWREG(70)
+#define G1_REG_PP_COLOR_CONVERSION1	G1_SWREG(71)
+#define G1_REG_PP_INPUT_SIZE		G1_SWREG(72)
+#define    G1_REG_PP_INPUT_SIZE_HEIGHT(v) (((v) << 9) & GENMASK(16, 9))
+#define    G1_REG_PP_INPUT_SIZE_WIDTH(v)  (((v) << 0) & GENMASK(8, 0))
+#define G1_REG_PP_SCALING0		G1_SWREG(79)
+#define     G1_REG_PP_PADD_R(v)	(((v) << 23) & GENMASK(27, 23))
+#define     G1_REG_PP_PADD_G(v)	(((v) << 18) & GENMASK(22, 18))
+#define     G1_REG_PP_RANGEMAP_Y(v) ((v) ? BIT(31) : 0)
+#define     G1_REG_PP_RANGEMAP_C(v) ((v) ? BIT(30) : 0)
+#define     G1_REG_PP_YCBCR_RANGE(v) ((v) ? BIT(29) : 0)
+#define     G1_REG_PP_RGB_16(v) ((v) ? BIT(28) : 0)
+#define G1_REG_PP_SCALING1		G1_SWREG(80)
+#define     G1_REG_PP_PADD_B(v)	(((v) << 18) & GENMASK(22, 18))
+#define G1_REG_PP_MASK_R		G1_SWREG(82)
+#define G1_REG_PP_MASK_G		G1_SWREG(83)
+#define G1_REG_PP_MASK_B		G1_SWREG(84)
+#define G1_REG_PP_CONTROL		G1_SWREG(85)
+#define     G1_REG_PP_CONTROL_IN_FMT(v)	(((v) << 29) & GENMASK(31, 29))
+#define     G1_REG_PP_CONTROL_OUT_FMT(v) (((v) << 26) & GENMASK(28, 26))
+#define     G1_REG_PP_CONTROL_OUT_HEIGHT(v) (((v) << 15) & GENMASK(25, 15))
+#define     G1_REG_PP_CONTROL_OUT_WIDTH(v) (((v) << 4) & GENMASK(14, 4))
+#define G1_REG_PP_MASK1_ORIG_WIDTH	G1_SWREG(88)
+#define     G1_REG_PP_ORIG_WIDTH(v)	(((v) << 23) & GENMASK(31, 23))
+#define G1_REG_PP_DISPLAY_WIDTH		G1_SWREG(92)
+#define G1_REG_PP_FUSE			G1_SWREG(99)
+
 #endif /* HANTRO_G1_REGS_H_ */
diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
index a2333d35305d..a5cdf150cd16 100644
--- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
@@ -422,7 +422,7 @@ static void cfg_buffers(struct hantro_ctx *ctx,
 	}
 	vdpu_write_relaxed(vpu, reg, G1_REG_FWD_PIC(0));
 
-	dst_dma = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
+	dst_dma = hantro_get_dec_buf_addr(ctx, &vb2_dst->vb2_buf);
 	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
 }
 
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 71de44bdb1e4..2398d4c1f207 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -28,11 +28,13 @@ struct hantro_variant;
  * @cpu:	CPU pointer to the buffer.
  * @dma:	DMA address of the buffer.
  * @size:	Size of the buffer.
+ * @attrs:	Attributes of the DMA mapping.
  */
 struct hantro_aux_buf {
 	void *cpu;
 	dma_addr_t dma;
 	size_t size;
+	unsigned long attrs;
 };
 
 /**
@@ -106,6 +108,15 @@ struct hantro_vp8_dec_hw_ctx {
 	struct hantro_aux_buf prob_tbl;
 };
 
+/**
+ * struct hantro_postproc_ctx
+ *
+ * @dec_q:		References buffers, in decoder format.
+ */
+struct hantro_postproc_ctx {
+	struct hantro_aux_buf dec_q[VB2_MAX_FRAME];
+};
+
 /**
  * struct hantro_codec_ops - codec mode specific operations
  *
@@ -141,6 +152,8 @@ extern const struct hantro_variant rk3399_vpu_variant;
 extern const struct hantro_variant rk3328_vpu_variant;
 extern const struct hantro_variant rk3288_vpu_variant;
 
+extern const struct hantro_postproc_regs hantro_g1_postproc_regs;
+
 extern const u32 hantro_vp8_dec_mc_filter[8][6];
 
 void hantro_watchdog(struct work_struct *work);
diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
new file mode 100644
index 000000000000..b55730011d0c
--- /dev/null
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hantro G1 post-processor support
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/types.h>
+
+#include "hantro.h"
+#include "hantro_hw.h"
+#include "hantro_g1_regs.h"
+
+#define HANTRO_PP_REG_WRITE(vpu, reg_name, val) \
+{ \
+	hantro_reg_write((vpu), \
+			 &((vpu)->variant->postproc_regs->reg_name), \
+			 (val)); \
+}
+
+#define HANTRO_PP_REG_WRITE_S(vpu, reg_name, val) \
+{ \
+	hantro_reg_write_s((vpu), \
+			   &((vpu)->variant->postproc_regs->reg_name), \
+			   (val)); \
+}
+
+#define VPU_PP_IN_YUYV			0x0
+#define VPU_PP_IN_NV12			0x1
+#define VPU_PP_IN_YUV420		0x2
+#define VPU_PP_IN_YUV240_TILED		0x5
+#define VPU_PP_OUT_RGB			0x0
+#define VPU_PP_OUT_YUYV			0x3
+
+const struct hantro_postproc_regs hantro_g1_postproc_regs = {
+	.pipeline_en = {G1_REG_PP_INTERRUPT, 1, 0x1},
+	.max_burst = {G1_REG_PP_DEV_CONFIG, 0, 0x1f},
+	.clk_gate = {G1_REG_PP_DEV_CONFIG, 1, 0x1},
+	.out_swap32 = {G1_REG_PP_DEV_CONFIG, 5, 0x1},
+	.out_endian = {G1_REG_PP_DEV_CONFIG, 6, 0x1},
+	.out_luma_base = {G1_REG_PP_OUT_LUMA_BASE, 0, 0xffffffff},
+	.input_width = {G1_REG_PP_INPUT_SIZE, 0, 0x1ff},
+	.input_height = {G1_REG_PP_INPUT_SIZE, 9, 0x1ff},
+	.output_width = {G1_REG_PP_CONTROL, 4, 0x7ff},
+	.output_height = {G1_REG_PP_CONTROL, 15, 0x7ff},
+	.input_fmt = {G1_REG_PP_CONTROL, 29, 0x7},
+	.output_fmt = {G1_REG_PP_CONTROL, 26, 0x7},
+	.orig_width = {G1_REG_PP_MASK1_ORIG_WIDTH, 23, 0x1ff},
+	.display_width = {G1_REG_PP_DISPLAY_WIDTH, 0, 0xfff},
+};
+
+void hantro_postproc_enable(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct vb2_v4l2_buffer *dst_buf;
+	u32 src_pp_fmt, dst_pp_fmt;
+	dma_addr_t dst_dma;
+
+	/* Turn on pipeline mode. Must be done first. */
+	HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x1);
+
+	src_pp_fmt = VPU_PP_IN_NV12;
+
+	switch (ctx->vpu_dst_fmt->fourcc) {
+	case V4L2_PIX_FMT_YUYV:
+		dst_pp_fmt = VPU_PP_OUT_YUYV;
+		break;
+	default:
+		WARN(1, "output format %d not supported by the post-processor, this wasn't expected.",
+		     ctx->vpu_dst_fmt->fourcc);
+		dst_pp_fmt = 0;
+		break;
+	}
+
+	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+
+	HANTRO_PP_REG_WRITE(vpu, clk_gate, 0x1);
+	HANTRO_PP_REG_WRITE(vpu, out_endian, 0x1);
+	HANTRO_PP_REG_WRITE(vpu, out_swap32, 0x1);
+	HANTRO_PP_REG_WRITE(vpu, max_burst, 16);
+	HANTRO_PP_REG_WRITE(vpu, out_luma_base, dst_dma);
+	HANTRO_PP_REG_WRITE(vpu, input_width, MB_WIDTH(ctx->dst_fmt.width));
+	HANTRO_PP_REG_WRITE(vpu, input_height, MB_HEIGHT(ctx->dst_fmt.height));
+	HANTRO_PP_REG_WRITE(vpu, input_fmt, src_pp_fmt);
+	HANTRO_PP_REG_WRITE(vpu, output_fmt, dst_pp_fmt);
+	HANTRO_PP_REG_WRITE(vpu, output_width, ctx->dst_fmt.width);
+	HANTRO_PP_REG_WRITE(vpu, output_height, ctx->dst_fmt.height);
+	HANTRO_PP_REG_WRITE(vpu, orig_width, MB_WIDTH(ctx->dst_fmt.width));
+	HANTRO_PP_REG_WRITE(vpu, display_width, ctx->dst_fmt.width);
+}
+
+void hantro_postproc_free(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	unsigned int i;
+
+	for (i = 0; i < VB2_MAX_FRAME; ++i) {
+		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
+
+		if (priv->cpu) {
+			dma_free_attrs(vpu->dev, priv->size, priv->cpu,
+				       priv->dma, priv->attrs);
+			priv->cpu = NULL;
+		}
+	}
+}
+
+int hantro_postproc_alloc(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+	struct vb2_queue *cap_queue = &m2m_ctx->cap_q_ctx.q;
+	unsigned int num_buffers = cap_queue->num_buffers;
+	unsigned int i, buf_size;
+
+	buf_size = ctx->dst_fmt.plane_fmt[0].sizeimage;
+
+	for (i = 0; i < num_buffers; ++i) {
+		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
+
+		/*
+		 * The buffers on this queue are meant as intermediate
+		 * buffers for the decoder, so no mapping is needed.
+		 */
+		priv->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
+		priv->cpu = dma_alloc_attrs(vpu->dev, buf_size, &priv->dma,
+					    GFP_KERNEL, priv->attrs);
+		if (!priv->cpu)
+			return -ENOMEM;
+		priv->size = buf_size;
+	}
+	return 0;
+}
+
+void hantro_postproc_disable(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x0);
+}
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index af27edd58a0b..85af1b96fd34 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -46,6 +46,19 @@ hantro_get_formats(const struct hantro_ctx *ctx, unsigned int *num_fmts)
 	return formats;
 }
 
+static const struct hantro_fmt *
+hantro_get_postproc_formats(const struct hantro_ctx *ctx,
+			    unsigned int *num_fmts)
+{
+	if (hantro_is_encoder_ctx(ctx)) {
+		*num_fmts = 0;
+		return NULL;
+	}
+
+	*num_fmts = ctx->dev->variant->num_postproc_fmts;
+	return ctx->dev->variant->postproc_fmts;
+}
+
 static const struct hantro_fmt *
 hantro_find_format(const struct hantro_ctx *ctx, u32 fourcc)
 {
@@ -57,6 +70,10 @@ hantro_find_format(const struct hantro_ctx *ctx, u32 fourcc)
 		if (formats[i].fourcc == fourcc)
 			return &formats[i];
 
+	formats = hantro_get_postproc_formats(ctx, &num_fmts);
+	for (i = 0; i < num_fmts; i++)
+		if (formats[i].fourcc == fourcc)
+			return &formats[i];
 	return NULL;
 }
 
@@ -151,6 +168,24 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 		}
 		++j;
 	}
+
+	/*
+	 * Enumerate post-processed formats. As per the specification,
+	 * we enumerated these formats after natively decoded formats
+	 * as a hint for applications on what's the preferred fomat.
+	 */
+	if (!capture)
+		return -EINVAL;
+	formats = hantro_get_postproc_formats(ctx, &num_fmts);
+	for (i = 0; i < num_fmts; i++) {
+		if (j == f->index) {
+			fmt = &formats[i];
+			f->pixelformat = fmt->fourcc;
+			return 0;
+		}
+		++j;
+	}
+
 	return -EINVAL;
 }
 
@@ -245,7 +280,7 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
 		 *
 		 * The H264 decoder needs extra space on the output buffers
 		 * to store motion vectors. This is needed for reference
-		 * frames.
+		 * frames and only if the format is non-post-processed NV12.
 		 *
 		 * Memory layout is as follow:
 		 *
@@ -259,7 +294,8 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
 		 * | MC sync          32 bytes |
 		 * +---------------------------+
 		 */
-		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE)
+		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE &&
+		    !hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
 			pix_mp->plane_fmt[0].sizeimage +=
 				64 * MB_WIDTH(pix_mp->width) *
 				     MB_WIDTH(pix_mp->height) + 32;
@@ -637,10 +673,23 @@ static int hantro_start_streaming(struct vb2_queue *q, unsigned int count)
 
 		vpu_debug(4, "Codec mode = %d\n", codec_mode);
 		ctx->codec_ops = &ctx->dev->variant->codec_ops[codec_mode];
-		if (ctx->codec_ops->init)
+		if (ctx->codec_ops->init) {
 			ret = ctx->codec_ops->init(ctx);
+			if (ret)
+				return ret;
+		}
+
+		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt)) {
+			ret = hantro_postproc_alloc(ctx);
+			if (ret)
+				goto err_codec_exit;
+		}
 	}
+	return ret;
 
+err_codec_exit:
+	if (ctx->codec_ops && ctx->codec_ops->exit)
+		ctx->codec_ops->exit(ctx);
 	return ret;
 }
 
@@ -667,6 +716,7 @@ static void hantro_stop_streaming(struct vb2_queue *q)
 	struct hantro_ctx *ctx = vb2_get_drv_priv(q);
 
 	if (hantro_vq_is_coded(q)) {
+		hantro_postproc_free(ctx);
 		if (ctx->codec_ops && ctx->codec_ops->exit)
 			ctx->codec_ops->exit(ctx);
 	}
diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
index f8db6fcaad73..2f914b37b9e5 100644
--- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
@@ -56,6 +56,13 @@ static const struct hantro_fmt rk3288_vpu_enc_fmts[] = {
 	},
 };
 
+static const struct hantro_fmt rk3288_vpu_postproc_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.codec_mode = HANTRO_MODE_NONE,
+	},
+};
+
 static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12,
@@ -215,6 +222,9 @@ const struct hantro_variant rk3288_vpu_variant = {
 	.dec_offset = 0x400,
 	.dec_fmts = rk3288_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(rk3288_vpu_dec_fmts),
+	.postproc_fmts = rk3288_vpu_postproc_fmts,
+	.num_postproc_fmts = ARRAY_SIZE(rk3288_vpu_postproc_fmts),
+	.postproc_regs = &hantro_g1_postproc_regs,
 	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
 		 HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
 	.codec_ops = rk3288_vpu_codec_ops,
-- 
2.22.0

