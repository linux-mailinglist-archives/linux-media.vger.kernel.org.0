Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC6643915
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732482AbfFMPLW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:11:22 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54566 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732424AbfFMPLW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 11:11:22 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 15F33281A15
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        ZhiChao Yu <zhichao.yu@rock-chips.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 2/2] media: hantro: Add support for VP8 decoding on rk3288
Date:   Thu, 13 Jun 2019 12:10:40 -0300
Message-Id: <20190613151040.8971-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613151040.8971-1-ezequiel@collabora.com>
References: <20190613151040.8971-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: ZhiChao Yu <zhichao.yu@rock-chips.com>

Introduce VP8 decoding support in RK3288.

Signed-off-by: ZhiChao Yu <zhichao.yu@rock-chips.com>
Signed-off-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/Makefile         |   4 +-
 drivers/staging/media/hantro/hantro.h         |   5 +
 drivers/staging/media/hantro/hantro_drv.c     |   6 +
 .../staging/media/hantro/hantro_g1_vp8_dec.c  | 548 ++++++++++++++++++
 drivers/staging/media/hantro/hantro_hw.h      |  17 +
 drivers/staging/media/hantro/hantro_v4l2.c    |   1 +
 drivers/staging/media/hantro/hantro_vp8.c     | 188 ++++++
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |  22 +-
 8 files changed, 789 insertions(+), 2 deletions(-)
 create mode 100644 drivers/staging/media/hantro/hantro_g1_vp8_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_vp8.c

diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
index 1584acdbf4a3..a627aee77f75 100644
--- a/drivers/staging/media/hantro/Makefile
+++ b/drivers/staging/media/hantro/Makefile
@@ -5,10 +5,12 @@ hantro-vpu-y += \
 		hantro_v4l2.o \
 		hantro_h1_jpeg_enc.o \
 		hantro_g1_mpeg2_dec.o \
+		hantro_g1_vp8_dec.o \
 		rk3399_vpu_hw_jpeg_enc.o \
 		rk3399_vpu_hw_mpeg2_dec.o \
 		hantro_jpeg.o \
-		hantro_mpeg2.o
+		hantro_mpeg2.o \
+		hantro_vp8.o
 
 hantro-vpu-$(CONFIG_VIDEO_HANTRO_ROCKCHIP) += \
 		rk3288_vpu_hw.o \
diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 62dcca9ff19c..f903e82c7760 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -40,6 +40,7 @@ struct hantro_codec_ops;
 #define HANTRO_ENCODERS		0x0000ffff
 
 #define HANTRO_MPEG2_DECODER	BIT(16)
+#define HANTRO_VP8_DECODER	BIT(17)
 #define HANTRO_DECODERS		0xffff0000
 
 /**
@@ -97,11 +98,13 @@ struct hantro_variant {
  * @HANTRO_MODE_NONE:  No operating mode. Used for RAW video formats.
  * @HANTRO_MODE_JPEG_ENC: JPEG encoder.
  * @HANTRO_MODE_MPEG2_DEC: MPEG-2 decoder.
+ * @HANTRO_MODE_VP8_DEC: VP8 decoder.
  */
 enum hantro_codec_mode {
 	HANTRO_MODE_NONE = -1,
 	HANTRO_MODE_JPEG_ENC,
 	HANTRO_MODE_MPEG2_DEC,
+	HANTRO_MODE_VP8_DEC,
 };
 
 /*
@@ -215,6 +218,7 @@ struct hantro_dev {
  * @codec_ops:		Set of operations related to codec mode.
  * @jpeg_enc:		JPEG-encoding context.
  * @mpeg2_dec:		MPEG-2-decoding context.
+ * @vp8_dec:		VP8-decoding context.
  */
 struct hantro_ctx {
 	struct hantro_dev *dev;
@@ -241,6 +245,7 @@ struct hantro_ctx {
 	union {
 		struct hantro_jpeg_enc_hw_ctx jpeg_enc;
 		struct hantro_mpeg2_dec_hw_ctx mpeg2_dec;
+		struct hantro_vp8_dec_hw_ctx vp8_dec;
 	};
 };
 
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 1d3af881d088..ab0aa7408a7d 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -282,6 +282,12 @@ static struct hantro_ctrl controls[] = {
 		.cfg = {
 			.elem_size = sizeof(struct v4l2_ctrl_mpeg2_quantization),
 		},
+	}, {
+		.id = V4L2_CID_MPEG_VIDEO_VP8_FRAME_HDR,
+		.codec = HANTRO_VP8_DECODER,
+		.cfg = {
+			.elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header),
+		},
 	},
 };
 
diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
new file mode 100644
index 000000000000..b6e1bcf4c071
--- /dev/null
+++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
@@ -0,0 +1,548 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hantro VP8 codec driver
+ *
+ * Copyright (C) 2019 Rockchip Electronics Co., Ltd.
+ *	ZhiChao Yu <zhichao.yu@rock-chips.com>
+ *
+ * Copyright (C) 2019 Google, Inc.
+ *	Tomasz Figa <tfiga@chromium.org>
+ */
+
+#include <media/v4l2-mem2mem.h>
+#include <media/vp8-ctrls.h>
+
+#include "hantro_hw.h"
+#include "hantro.h"
+#include "hantro_g1_regs.h"
+
+#define DEC_8190_ALIGN_MASK	0x07U
+
+struct vp8_dec_reg {
+	u32 base;
+	u32 shift;
+	u32 mask;
+};
+
+/* dct partition base address regs */
+static const struct vp8_dec_reg vp8_dec_dct_base[8] = {
+	{ G1_REG_ADDR_STR, 0, 0xffffffff },
+	{ G1_REG_ADDR_REF(8), 0, 0xffffffff },
+	{ G1_REG_ADDR_REF(9), 0, 0xffffffff },
+	{ G1_REG_ADDR_REF(10), 0, 0xffffffff },
+	{ G1_REG_ADDR_REF(11), 0, 0xffffffff },
+	{ G1_REG_ADDR_REF(12), 0, 0xffffffff },
+	{ G1_REG_ADDR_REF(14), 0, 0xffffffff },
+	{ G1_REG_ADDR_REF(15), 0, 0xffffffff },
+};
+
+/* loop filter level regs */
+static const struct vp8_dec_reg vp8_dec_lf_level[4] = {
+	{ G1_REG_REF_PIC(2), 18, 0x3f },
+	{ G1_REG_REF_PIC(2), 12, 0x3f },
+	{ G1_REG_REF_PIC(2), 6, 0x3f },
+	{ G1_REG_REF_PIC(2), 0, 0x3f },
+};
+
+/* macroblock loop filter level adjustment regs */
+static const struct vp8_dec_reg vp8_dec_mb_adj[4] = {
+	{ G1_REG_REF_PIC(0), 21, 0x7f },
+	{ G1_REG_REF_PIC(0), 14, 0x7f },
+	{ G1_REG_REF_PIC(0), 7, 0x7f },
+	{ G1_REG_REF_PIC(0), 0, 0x7f },
+};
+
+/* reference frame adjustment regs */
+static const struct vp8_dec_reg vp8_dec_ref_adj[4] = {
+	{ G1_REG_REF_PIC(1), 21, 0x7f },
+	{ G1_REG_REF_PIC(1), 14, 0x7f },
+	{ G1_REG_REF_PIC(1), 7, 0x7f },
+	{ G1_REG_REF_PIC(1), 0, 0x7f },
+};
+
+/* quantizer regs */
+static const struct vp8_dec_reg vp8_dec_quant[4] = {
+	{ G1_REG_REF_PIC(3), 11, 0x7ff },
+	{ G1_REG_REF_PIC(3), 0, 0x7ff },
+	{ G1_REG_BD_REF_PIC(4), 11, 0x7ff },
+	{ G1_REG_BD_REF_PIC(4), 0, 0x7ff },
+};
+
+/* quantizer delta regs */
+static const struct vp8_dec_reg vp8_dec_quant_delta[5] = {
+	{ G1_REG_REF_PIC(3), 27, 0x1f },
+	{ G1_REG_REF_PIC(3), 22, 0x1f },
+	{ G1_REG_BD_REF_PIC(4), 27, 0x1f },
+	{ G1_REG_BD_REF_PIC(4), 22, 0x1f },
+	{ G1_REG_BD_P_REF_PIC, 27, 0x1f },
+};
+
+/* dct partition start bits regs */
+static const struct vp8_dec_reg vp8_dec_dct_start_bits[8] = {
+	{ G1_REG_DEC_CTRL2, 26, 0x3f }, { G1_REG_DEC_CTRL4, 26, 0x3f },
+	{ G1_REG_DEC_CTRL4, 20, 0x3f }, { G1_REG_DEC_CTRL7, 24, 0x3f },
+	{ G1_REG_DEC_CTRL7, 18, 0x3f }, { G1_REG_DEC_CTRL7, 12, 0x3f },
+	{ G1_REG_DEC_CTRL7, 6, 0x3f },  { G1_REG_DEC_CTRL7, 0, 0x3f },
+};
+
+/* precision filter tap regs */
+static const struct vp8_dec_reg vp8_dec_pred_bc_tap[8][4] = {
+	{
+		{ G1_REG_PRED_FLT, 22, 0x3ff },
+		{ G1_REG_PRED_FLT, 12, 0x3ff },
+		{ G1_REG_PRED_FLT, 2, 0x3ff },
+		{ G1_REG_REF_PIC(4), 22, 0x3ff },
+	},
+	{
+		{ G1_REG_REF_PIC(4), 12, 0x3ff },
+		{ G1_REG_REF_PIC(4), 2, 0x3ff },
+		{ G1_REG_REF_PIC(5), 22, 0x3ff },
+		{ G1_REG_REF_PIC(5), 12, 0x3ff },
+	},
+	{
+		{ G1_REG_REF_PIC(5), 2, 0x3ff },
+		{ G1_REG_REF_PIC(6), 22, 0x3ff },
+		{ G1_REG_REF_PIC(6), 12, 0x3ff },
+		{ G1_REG_REF_PIC(6), 2, 0x3ff },
+	},
+	{
+		{ G1_REG_REF_PIC(7), 22, 0x3ff },
+		{ G1_REG_REF_PIC(7), 12, 0x3ff },
+		{ G1_REG_REF_PIC(7), 2, 0x3ff },
+		{ G1_REG_LT_REF, 22, 0x3ff },
+	},
+	{
+		{ G1_REG_LT_REF, 12, 0x3ff },
+		{ G1_REG_LT_REF, 2, 0x3ff },
+		{ G1_REG_VALID_REF, 22, 0x3ff },
+		{ G1_REG_VALID_REF, 12, 0x3ff },
+	},
+	{
+		{ G1_REG_VALID_REF, 2, 0x3ff },
+		{ G1_REG_BD_REF_PIC(0), 22, 0x3ff },
+		{ G1_REG_BD_REF_PIC(0), 12, 0x3ff },
+		{ G1_REG_BD_REF_PIC(0), 2, 0x3ff },
+	},
+	{
+		{ G1_REG_BD_REF_PIC(1), 22, 0x3ff },
+		{ G1_REG_BD_REF_PIC(1), 12, 0x3ff },
+		{ G1_REG_BD_REF_PIC(1), 2, 0x3ff },
+		{ G1_REG_BD_REF_PIC(2), 22, 0x3ff },
+	},
+	{
+		{ G1_REG_BD_REF_PIC(2), 12, 0x3ff },
+		{ G1_REG_BD_REF_PIC(2), 2, 0x3ff },
+		{ G1_REG_BD_REF_PIC(3), 22, 0x3ff },
+		{ G1_REG_BD_REF_PIC(3), 12, 0x3ff },
+	},
+};
+
+/*
+ * filter taps taken to 7-bit precision,
+ * reference RFC6386#Page-16, filters[8][6]
+ */
+static const u32 vp8_dec_mc_filter[8][6] = {
+	{ 0, 0, 128, 0, 0, 0 },
+	{ 0, -6, 123, 12, -1, 0 },
+	{ 2, -11, 108, 36, -8, 1 },
+	{ 0, -9, 93, 50, -6, 0 },
+	{ 3, -16, 77, 77, -16, 3 },
+	{ 0, -6, 50, 93, -9, 0 },
+	{ 1, -8, 36, 108, -11, 2 },
+	{ 0, -1, 12, 123, -6, 0 }
+};
+
+static inline void vp8_dec_reg_write(struct hantro_dev *vpu,
+				     const struct vp8_dec_reg *reg, u32 val)
+{
+	u32 v;
+
+	v = vdpu_read(vpu, reg->base);
+	v &= ~(reg->mask << reg->shift);
+	v |= ((val & reg->mask) << reg->shift);
+	vdpu_write_relaxed(vpu, v, reg->base);
+}
+
+/*
+ * set loop filters
+ */
+static void cfg_lf(struct hantro_ctx *ctx,
+		   const struct v4l2_ctrl_vp8_frame_header *hdr)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	u32 reg;
+	int i;
+
+	if (!(hdr->segment_header.flags & V4L2_VP8_SEGMNT_HDR_FLAG_ENABLED)) {
+		vp8_dec_reg_write(vpu, &vp8_dec_lf_level[0], hdr->lf_header.level);
+	} else if (hdr->segment_header.segment_feature_mode) {
+		/* absolute mode */
+		for (i = 0; i < 4; i++)
+			vp8_dec_reg_write(vpu, &vp8_dec_lf_level[i],
+					hdr->segment_header.lf_update[i]);
+	} else {
+		/* delta mode */
+		for (i = 0; i < 4; i++)
+			vp8_dec_reg_write(vpu, &vp8_dec_lf_level[i],
+					clamp(hdr->lf_header.level
+					+ hdr->segment_header.lf_update[i], 0, 63));
+	}
+
+	reg = G1_REG_REF_PIC_FILT_SHARPNESS(hdr->lf_header.sharpness_level);
+	if (hdr->lf_header.type)
+		reg |= G1_REG_REF_PIC_FILT_TYPE_E;
+	vdpu_write_relaxed(vpu, reg, G1_REG_REF_PIC(0));
+
+	if (hdr->lf_header.flags & V4L2_VP8_LF_HDR_ADJ_ENABLE) {
+		for (i = 0; i < 4; i++) {
+			vp8_dec_reg_write(vpu, &vp8_dec_mb_adj[i],
+				hdr->lf_header.mb_mode_delta_magnitude[i]);
+			vp8_dec_reg_write(vpu, &vp8_dec_ref_adj[i],
+				hdr->lf_header.ref_frm_delta_magnitude[i]);
+		}
+	}
+}
+
+/*
+ * set quantization parameters
+ */
+static void cfg_qp(struct hantro_ctx *ctx,
+				  const struct v4l2_ctrl_vp8_frame_header *hdr)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	int i;
+
+	if (!(hdr->segment_header.flags & V4L2_VP8_SEGMNT_HDR_FLAG_ENABLED)) {
+		vp8_dec_reg_write(vpu, &vp8_dec_quant[0], hdr->quant_header.y_ac_qi);
+	} else if (hdr->segment_header.segment_feature_mode) {
+		/* absolute mode */
+		for (i = 0; i < 4; i++)
+			vp8_dec_reg_write(vpu, &vp8_dec_quant[i],
+					hdr->segment_header.quant_update[i]);
+	} else {
+		/* delta mode */
+		for (i = 0; i < 4; i++)
+			vp8_dec_reg_write(vpu, &vp8_dec_quant[i],
+					clamp(hdr->quant_header.y_ac_qi
+					+ hdr->segment_header.quant_update[i],
+					0, 127));
+	}
+
+	vp8_dec_reg_write(vpu, &vp8_dec_quant_delta[0], hdr->quant_header.y_dc_delta);
+	vp8_dec_reg_write(vpu, &vp8_dec_quant_delta[1], hdr->quant_header.y2_dc_delta);
+	vp8_dec_reg_write(vpu, &vp8_dec_quant_delta[2], hdr->quant_header.y2_ac_delta);
+	vp8_dec_reg_write(vpu, &vp8_dec_quant_delta[3], hdr->quant_header.uv_dc_delta);
+	vp8_dec_reg_write(vpu, &vp8_dec_quant_delta[4], hdr->quant_header.uv_ac_delta);
+}
+
+/*
+ * set control partition and dct partition regs
+ *
+ * VP8 frame stream data layout:
+ *
+ *	                     first_part_size          parttion_sizes[0]
+ *                              ^                     ^
+ * src_dma                      |                     |
+ * ^                   +--------+------+        +-----+-----+
+ * |                   | control part  |        |           |
+ * +--------+----------------+------------------+-----------+-----+-----------+
+ * | tag 3B | extra 7B | hdr | mb_data | dct sz | dct part0 | ... | dct partn |
+ * +--------+-----------------------------------+-----------+-----+-----------+
+ *                           |         |        |                             |
+ *                           v         +----+---+                             v
+ *                           mb_start       |                       src_dma_end
+ *                                          v
+ *                                       dct size part
+ *                                      (num_dct-1)*3B
+ * Note:
+ *   1. only key frame has extra 7 bytes
+ *   2. all offsets are base on src_dma
+ *   3. number of dct parts is 1, 2, 4 or 8
+ *   4. the addresses set to vpu must be 64bits alignment
+ */
+static void cfg_parts(struct hantro_ctx *ctx,
+		      const struct v4l2_ctrl_vp8_frame_header *hdr)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct vb2_v4l2_buffer *vb2_src;
+	u32 first_part_offset = VP8_FRAME_IS_KEY_FRAME(hdr) ? 10 : 3;
+	u32 dct_part_total_len = 0;
+	u32 dct_size_part_size = 0;
+	u32 dct_part_offset = 0;
+	u32 mb_offset_bytes = 0;
+	u32 mb_offset_bits = 0;
+	u32 mb_start_bits = 0;
+	struct vp8_dec_reg reg;
+	dma_addr_t src_dma;
+	u32 mb_size = 0;
+	u32 count = 0;
+	u32 i;
+
+	vb2_src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	src_dma = vb2_dma_contig_plane_dma_addr(&vb2_src->vb2_buf, 0);
+
+	/*
+	 * Calculate control partition mb data info
+	 * @macroblock_bit_offset:	bits offset of mb data from first
+	 *				part start pos
+	 * @mb_offset_bits:		bits offset of mb data from src_dma
+	 *				base addr
+	 * @mb_offset_byte:		bytes offset of mb data from src_dma
+	 *				base addr
+	 * @mb_start_bits:		bits offset of mb data from mb data
+	 *				64bits alignment addr
+	 */
+	mb_offset_bits = first_part_offset * 8
+		+ hdr->macroblock_bit_offset + 8;
+	mb_offset_bytes = mb_offset_bits / 8;
+	mb_start_bits = mb_offset_bits
+		- (mb_offset_bytes & (~DEC_8190_ALIGN_MASK)) * 8;
+	mb_size = hdr->first_part_size
+		- (mb_offset_bytes - first_part_offset)
+		+ (mb_offset_bytes & DEC_8190_ALIGN_MASK);
+
+	/* mb data aligned base addr */
+	vdpu_write_relaxed(vpu, (mb_offset_bytes & (~DEC_8190_ALIGN_MASK))
+				+ src_dma, G1_REG_ADDR_REF(13));
+
+	/* mb data start bits */
+	reg.base = G1_REG_DEC_CTRL2;
+	reg.mask = 0x3f;
+	reg.shift = 18;
+	vp8_dec_reg_write(vpu, &reg, mb_start_bits);
+
+	/* mb aligned data length */
+	reg.base = G1_REG_DEC_CTRL6;
+	reg.mask = 0x3fffff;
+	reg.shift = 0;
+	vp8_dec_reg_write(vpu, &reg, mb_size + 1);
+
+	/*
+	 * Calculate dct partition info
+	 * @dct_size_part_size: Containing sizes of dct part, every dct part
+	 *			has 3 bytes to store its size, except the last
+	 *			dct part
+	 * @dct_part_offset:	bytes offset of dct parts from src_dma base addr
+	 * @dct_part_total_len: total size of all dct parts
+	 */
+	dct_size_part_size = (hdr->num_dct_parts - 1) * 3;
+	dct_part_offset = first_part_offset + hdr->first_part_size;
+	for (i = 0; i < hdr->num_dct_parts; i++)
+		dct_part_total_len += hdr->dct_part_sizes[i];
+	dct_part_total_len += dct_size_part_size;
+	dct_part_total_len += (dct_part_offset & DEC_8190_ALIGN_MASK);
+
+	/* number of dct partitions */
+	reg.base = G1_REG_DEC_CTRL6;
+	reg.mask = 0xf;
+	reg.shift = 24;
+	vp8_dec_reg_write(vpu, &reg, hdr->num_dct_parts - 1);
+
+	/* dct partition length */
+	vdpu_write_relaxed(vpu,
+			G1_REG_DEC_CTRL3_STREAM_LEN(dct_part_total_len),
+			G1_REG_DEC_CTRL3);
+
+	/* dct partitions base address */
+	for (i = 0; i < hdr->num_dct_parts; i++) {
+		u32 byte_offset = dct_part_offset + dct_size_part_size + count;
+		u32 base_addr = byte_offset + src_dma;
+
+		vp8_dec_reg_write(vpu, &vp8_dec_dct_base[i],
+				base_addr & (~DEC_8190_ALIGN_MASK));
+
+		vp8_dec_reg_write(vpu, &vp8_dec_dct_start_bits[i],
+				(byte_offset & DEC_8190_ALIGN_MASK) * 8);
+
+		count += hdr->dct_part_sizes[i];
+	}
+}
+
+/*
+ * prediction filter taps
+ * normal 6-tap filters
+ */
+static void cfg_tap(struct hantro_ctx *ctx,
+		    const struct v4l2_ctrl_vp8_frame_header *hdr)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct vp8_dec_reg reg;
+	u32 val = 0;
+	int i, j;
+
+	reg.base = G1_REG_BD_REF_PIC(3);
+	reg.mask = 0xf;
+
+	if ((hdr->version & 0x03) != 0)
+		return; /* Tap filter not used. */
+
+	for (i = 0; i < 8; i++) {
+		val = (vp8_dec_mc_filter[i][0] << 2) | vp8_dec_mc_filter[i][5];
+
+		for (j = 0; j < 4; j++)
+			vp8_dec_reg_write(vpu, &vp8_dec_pred_bc_tap[i][j],
+					vp8_dec_mc_filter[i][j + 1]);
+
+		switch (i) {
+		case 2:
+			reg.shift = 8;
+			break;
+		case 4:
+			reg.shift = 4;
+			break;
+		case 6:
+			reg.shift = 0;
+			break;
+		default:
+			continue;
+		}
+
+		vp8_dec_reg_write(vpu, &reg, val);
+	}
+}
+
+/* set reference frame */
+static void cfg_ref(struct hantro_ctx *ctx,
+		    const struct v4l2_ctrl_vp8_frame_header *hdr)
+{
+	struct vb2_queue *cap_q = &ctx->fh.m2m_ctx->cap_q_ctx.q;
+	struct hantro_dev *vpu = ctx->dev;
+	struct vb2_v4l2_buffer *vb2_dst;
+	u32 reg;
+
+	vb2_dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+
+	/* set last frame address */
+	reg = hantro_get_ref(cap_q, hdr->last_frame_ts);
+	if (!reg)
+		reg = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
+	vdpu_write_relaxed(vpu, reg, G1_REG_ADDR_REF(0));
+
+	/* set golden reference frame buffer address */
+	reg = hantro_get_ref(cap_q, hdr->golden_frame_ts);
+	WARN_ON(!reg && hdr->golden_frame_ts);
+	if (!reg)
+		reg = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
+	if (hdr->sign_bias_golden)
+		reg |= G1_REG_ADDR_REF_TOPC_E;
+	vdpu_write_relaxed(vpu, reg, G1_REG_ADDR_REF(4));
+
+	/* set alternate reference frame buffer address */
+	reg = hantro_get_ref(cap_q, hdr->alt_frame_ts);
+	WARN_ON(!reg && hdr->alt_frame_ts);
+	if (!reg)
+		reg = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
+	if (hdr->sign_bias_alternate)
+		reg |= G1_REG_ADDR_REF_TOPC_E;
+	vdpu_write_relaxed(vpu, reg, G1_REG_ADDR_REF(5));
+}
+
+static void cfg_buffers(struct hantro_ctx *ctx,
+			const struct v4l2_ctrl_vp8_frame_header *hdr)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct vb2_v4l2_buffer *vb2_dst;
+	u32 reg;
+
+	vb2_dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+
+	/* set probability table buffer address */
+	vdpu_write_relaxed(vpu, ctx->vp8_dec.prob_tbl.dma,
+			   G1_REG_ADDR_QTABLE);
+
+	/* set segment map address */
+	reg = G1_REG_FWD_PIC1_SEGMENT_BASE(ctx->vp8_dec.segment_map.dma);
+	if (hdr->segment_header.flags & V4L2_VP8_SEGMNT_HDR_FLAG_ENABLED) {
+		reg |= G1_REG_FWD_PIC1_SEGMENT_E;
+		if (hdr->segment_header.flags & V4L2_VP8_SEGMNT_HDR_FLAG_UPDATE_MAP)
+			reg |= G1_REG_FWD_PIC1_SEGMENT_UPD_E;
+	}
+	vdpu_write_relaxed(vpu, reg, G1_REG_FWD_PIC(0));
+
+	/* set output frame buffer address */
+	vdpu_write_relaxed(vpu,
+			   vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0),
+			   G1_REG_ADDR_DST);
+}
+
+void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
+{
+	const struct v4l2_ctrl_vp8_frame_header *hdr;
+	struct hantro_dev *vpu = ctx->dev;
+	size_t height = ctx->dst_fmt.height;
+	size_t width = ctx->dst_fmt.width;
+	struct vb2_v4l2_buffer *vb2_src;
+	u32 mb_width, mb_height;
+	u32 reg;
+
+	vb2_src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	v4l2_ctrl_request_setup(vb2_src->vb2_buf.req_obj.req,
+				&ctx->ctrl_handler);
+
+	hdr = hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_VP8_FRAME_HDR);
+	if (WARN_ON(!hdr))
+		return;
+
+	/* reset segment_map buffer in keyframe */
+	if (VP8_FRAME_IS_KEY_FRAME(hdr) && ctx->vp8_dec.segment_map.cpu)
+		memset(ctx->vp8_dec.segment_map.cpu, 0,
+		       ctx->vp8_dec.segment_map.size);
+
+	hantro_vp8_prob_update(ctx, hdr);
+
+	reg = G1_REG_CONFIG_DEC_TIMEOUT_E |
+	      G1_REG_CONFIG_DEC_STRENDIAN_E |
+	      G1_REG_CONFIG_DEC_INSWAP32_E |
+	      G1_REG_CONFIG_DEC_STRSWAP32_E |
+	      G1_REG_CONFIG_DEC_OUTSWAP32_E |
+	      G1_REG_CONFIG_DEC_CLK_GATE_E |
+	      G1_REG_CONFIG_DEC_IN_ENDIAN |
+	      G1_REG_CONFIG_DEC_OUT_ENDIAN |
+	      G1_REG_CONFIG_DEC_MAX_BURST(16);
+	vdpu_write_relaxed(vpu, reg, G1_REG_CONFIG);
+
+	reg = G1_REG_DEC_CTRL0_DEC_MODE(10);
+	if (!VP8_FRAME_IS_KEY_FRAME(hdr))
+		reg |= G1_REG_DEC_CTRL0_PIC_INTER_E;
+	if (!(hdr->flags & V4L2_VP8_FRAME_HDR_FLAG_MB_NO_SKIP_COEFF))
+		reg |= G1_REG_DEC_CTRL0_SKIP_MODE;
+	if (hdr->lf_header.level == 0)
+		reg |= G1_REG_DEC_CTRL0_FILTERING_DIS;
+	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
+
+	/* frame dimensions */
+	mb_width = DIV_ROUND_UP(width, 16);
+	mb_height = DIV_ROUND_UP(height, 16);
+	reg = G1_REG_DEC_CTRL1_PIC_MB_WIDTH(mb_width) |
+	      G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(mb_height) |
+	      G1_REG_DEC_CTRL1_PIC_MB_W_EXT(mb_width >> 9) |
+	      G1_REG_DEC_CTRL1_PIC_MB_H_EXT(mb_height >> 8);
+	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL1);
+
+	/* bool decode info */
+	reg = G1_REG_DEC_CTRL2_BOOLEAN_RANGE(hdr->coder_state.range)
+		| G1_REG_DEC_CTRL2_BOOLEAN_VALUE(hdr->coder_state.value);
+	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL2);
+
+	reg = 0;
+	if (hdr->version != 3)
+		reg |= G1_REG_DEC_CTRL4_VC1_HEIGHT_EXT;
+	if (hdr->version & 0x3)
+		reg |= G1_REG_DEC_CTRL4_BILIN_MC_E;
+	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL4);
+
+	cfg_lf(ctx, hdr);
+	cfg_qp(ctx, hdr);
+	cfg_parts(ctx, hdr);
+	cfg_tap(ctx, hdr);
+	cfg_ref(ctx, hdr);
+	cfg_buffers(ctx, hdr);
+
+	/* Controls no longer in-use, we can complete them */
+	v4l2_ctrl_request_complete(vb2_src->vb2_buf.req_obj.req,
+				   &ctx->ctrl_handler);
+
+	schedule_delayed_work(&vpu->watchdog_work, msecs_to_jiffies(2000));
+
+	vdpu_write(vpu, G1_REG_INTERRUPT_DEC_E, G1_REG_INTERRUPT);
+}
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 3c361c2e9b88..7849852affde 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -12,6 +12,7 @@
 #include <linux/interrupt.h>
 #include <linux/v4l2-controls.h>
 #include <media/mpeg2-ctrls.h>
+#include <media/vp8-ctrls.h>
 #include <media/videobuf2-core.h>
 
 struct hantro_dev;
@@ -47,6 +48,16 @@ struct hantro_mpeg2_dec_hw_ctx {
 	struct hantro_aux_buf qtable;
 };
 
+/**
+ * struct hantro_vp8d_hw_ctx
+ * @segment_map:	Segment map buffer.
+ * @prob_tbl:		Probability table buffer.
+ */
+struct hantro_vp8_dec_hw_ctx {
+	struct hantro_aux_buf segment_map;
+	struct hantro_aux_buf prob_tbl;
+};
+
 /**
  * struct hantro_codec_ops - codec mode specific operations
  *
@@ -99,4 +110,10 @@ void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
 int hantro_mpeg2_dec_init(struct hantro_ctx *ctx);
 void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx);
 
+void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx);
+int hantro_vp8_dec_init(struct hantro_ctx *ctx);
+void hantro_vp8_dec_exit(struct hantro_ctx *ctx);
+void hantro_vp8_prob_update(struct hantro_ctx *ctx,
+			    const struct v4l2_ctrl_vp8_frame_header *hdr);
+
 #endif /* HANTRO_HW_H_ */
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index b4af8c659a98..507369c1d17d 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -344,6 +344,7 @@ hantro_update_requires_request(struct hantro_ctx *ctx, u32 fourcc)
 		ctx->fh.m2m_ctx->out_q_ctx.q.requires_requests = false;
 		break;
 	case V4L2_PIX_FMT_MPEG2_SLICE:
+	case V4L2_PIX_FMT_VP8_FRAME:
 		ctx->fh.m2m_ctx->out_q_ctx.q.requires_requests = true;
 		break;
 	default:
diff --git a/drivers/staging/media/hantro/hantro_vp8.c b/drivers/staging/media/hantro/hantro_vp8.c
new file mode 100644
index 000000000000..be445a89d860
--- /dev/null
+++ b/drivers/staging/media/hantro/hantro_vp8.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hantro VPU codec driver
+ *
+ * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
+ */
+
+#include "hantro.h"
+
+/*
+ * probs table with packed
+ */
+struct vp8_prob_tbl_packed {
+	u8 prob_mb_skip_false;
+	u8 prob_intra;
+	u8 prob_ref_last;
+	u8 prob_ref_golden;
+	u8 prob_segment[3];
+	u8 padding0;
+
+	u8 prob_luma_16x16_pred_mode[4];
+	u8 prob_chroma_pred_mode[3];
+	u8 padding1;
+
+	/* mv prob */
+	u8 prob_mv_context[2][19];
+	u8 padding2[2];
+
+	/* coeff probs */
+	u8 prob_coeffs[4][8][3][11];
+	u8 padding3[96];
+};
+
+void hantro_vp8_prob_update(struct hantro_ctx *ctx,
+			    const struct v4l2_ctrl_vp8_frame_header *hdr)
+{
+	const struct v4l2_vp8_entropy_header *entropy_hdr = &hdr->entropy_header;
+	u32 i, j, k;
+	u8 *dst;
+
+	/* first probs */
+	dst = ctx->vp8_dec.prob_tbl.cpu;
+
+	dst[0] = hdr->prob_skip_false;
+	dst[1] = hdr->prob_intra;
+	dst[2] = hdr->prob_last;
+	dst[3] = hdr->prob_gf;
+	dst[4] = hdr->segment_header.segment_probs[0];
+	dst[5] = hdr->segment_header.segment_probs[1];
+	dst[6] = hdr->segment_header.segment_probs[2];
+	dst[7] = 0;
+
+	dst += 8;
+	dst[0] = entropy_hdr->y_mode_probs[0];
+	dst[1] = entropy_hdr->y_mode_probs[1];
+	dst[2] = entropy_hdr->y_mode_probs[2];
+	dst[3] = entropy_hdr->y_mode_probs[3];
+	dst[4] = entropy_hdr->uv_mode_probs[0];
+	dst[5] = entropy_hdr->uv_mode_probs[1];
+	dst[6] = entropy_hdr->uv_mode_probs[2];
+	dst[7] = 0; /*unused */
+
+	/* mv probs */
+	dst += 8;
+	dst[0] = entropy_hdr->mv_probs[0][0]; /* is short */
+	dst[1] = entropy_hdr->mv_probs[1][0];
+	dst[2] = entropy_hdr->mv_probs[0][1]; /* sign */
+	dst[3] = entropy_hdr->mv_probs[1][1];
+	dst[4] = entropy_hdr->mv_probs[0][8 + 9];
+	dst[5] = entropy_hdr->mv_probs[0][9 + 9];
+	dst[6] = entropy_hdr->mv_probs[1][8 + 9];
+	dst[7] = entropy_hdr->mv_probs[1][9 + 9];
+	dst += 8;
+	for (i = 0; i < 2; ++i) {
+		for (j = 0; j < 8; j += 4) {
+			dst[0] = entropy_hdr->mv_probs[i][j + 9 + 0];
+			dst[1] = entropy_hdr->mv_probs[i][j + 9 + 1];
+			dst[2] = entropy_hdr->mv_probs[i][j + 9 + 2];
+			dst[3] = entropy_hdr->mv_probs[i][j + 9 + 3];
+			dst += 4;
+		}
+	}
+	for (i = 0; i < 2; ++i) {
+		dst[0] = entropy_hdr->mv_probs[i][0 + 2];
+		dst[1] = entropy_hdr->mv_probs[i][1 + 2];
+		dst[2] = entropy_hdr->mv_probs[i][2 + 2];
+		dst[3] = entropy_hdr->mv_probs[i][3 + 2];
+		dst[4] = entropy_hdr->mv_probs[i][4 + 2];
+		dst[5] = entropy_hdr->mv_probs[i][5 + 2];
+		dst[6] = entropy_hdr->mv_probs[i][6 + 2];
+		dst[7] = 0;	/*unused */
+		dst += 8;
+	}
+
+	/* coeff probs (header part) */
+	dst = ctx->vp8_dec.prob_tbl.cpu;
+	dst += (8 * 7);
+	for (i = 0; i < 4; ++i) {
+		for (j = 0; j < 8; ++j) {
+			for (k = 0; k < 3; ++k) {
+				dst[0] = entropy_hdr->coeff_probs[i][j][k][0];
+				dst[1] = entropy_hdr->coeff_probs[i][j][k][1];
+				dst[2] = entropy_hdr->coeff_probs[i][j][k][2];
+				dst[3] = entropy_hdr->coeff_probs[i][j][k][3];
+				dst += 4;
+			}
+		}
+	}
+
+	/* coeff probs (footer part) */
+	dst = ctx->vp8_dec.prob_tbl.cpu;
+	dst += (8 * 55);
+	for (i = 0; i < 4; ++i) {
+		for (j = 0; j < 8; ++j) {
+			for (k = 0; k < 3; ++k) {
+				dst[0] = entropy_hdr->coeff_probs[i][j][k][4];
+				dst[1] = entropy_hdr->coeff_probs[i][j][k][5];
+				dst[2] = entropy_hdr->coeff_probs[i][j][k][6];
+				dst[3] = entropy_hdr->coeff_probs[i][j][k][7];
+				dst[4] = entropy_hdr->coeff_probs[i][j][k][8];
+				dst[5] = entropy_hdr->coeff_probs[i][j][k][9];
+				dst[6] = entropy_hdr->coeff_probs[i][j][k][10];
+				dst[7] = 0;	/*unused */
+				dst += 8;
+			}
+		}
+	}
+}
+
+int hantro_vp8_dec_init(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_aux_buf *aux_buf;
+	unsigned int mb_width, mb_height;
+	size_t segment_map_size;
+	int ret;
+
+	/* segment map table size calculation */
+	mb_width = DIV_ROUND_UP(ctx->dst_fmt.width, 16);
+	mb_height = DIV_ROUND_UP(ctx->dst_fmt.height, 16);
+	segment_map_size = round_up(DIV_ROUND_UP(mb_width * mb_height, 4), 64);
+
+	/*
+	 * In context init the dma buffer for segment map must be allocated.
+	 * And the data in segment map buffer must be set to all zero.
+	 */
+	aux_buf = &ctx->vp8_dec.segment_map;
+	aux_buf->size = segment_map_size;
+	aux_buf->cpu = dma_alloc_coherent(vpu->dev, aux_buf->size,
+					  &aux_buf->dma, GFP_KERNEL);
+	if (!aux_buf->cpu)
+		return -ENOMEM;
+
+	memset(aux_buf->cpu, 0, aux_buf->size);
+
+	/*
+	 * Allocate probability table buffer,
+	 * total 1208 bytes, 4K page is far enough.
+	 */
+	aux_buf = &ctx->vp8_dec.prob_tbl;
+	aux_buf->size = sizeof(struct vp8_prob_tbl_packed);
+	aux_buf->cpu = dma_alloc_coherent(vpu->dev, aux_buf->size,
+					  &aux_buf->dma, GFP_KERNEL);
+	if (!aux_buf->cpu) {
+		ret = -ENOMEM;
+		goto err_free_seg_map;
+	}
+
+	return 0;
+
+err_free_seg_map:
+	dma_free_coherent(vpu->dev, ctx->vp8_dec.segment_map.size,
+			  ctx->vp8_dec.segment_map.cpu,
+			  ctx->vp8_dec.segment_map.dma);
+
+	return ret;
+}
+
+void hantro_vp8_dec_exit(struct hantro_ctx *ctx)
+{
+	struct hantro_vp8_dec_hw_ctx *vp8_dec = &ctx->vp8_dec;
+	struct hantro_dev *vpu = ctx->dev;
+
+	dma_free_coherent(vpu->dev, vp8_dec->segment_map.size,
+			  vp8_dec->segment_map.cpu, vp8_dec->segment_map.dma);
+	dma_free_coherent(vpu->dev, vp8_dec->prob_tbl.size,
+			  vp8_dec->prob_tbl.cpu, vp8_dec->prob_tbl.dma);
+}
diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
index bcacc4f51093..470e803e25a6 100644
--- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
@@ -74,6 +74,19 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
 			.step_height = MPEG2_MB_DIM,
 		},
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_VP8_FRAME,
+		.codec_mode = HANTRO_MODE_VP8_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 48,
+			.max_width = 3840,
+			.step_width = 16,
+			.min_height = 48,
+			.max_height = 2160,
+			.step_height = 16,
+		},
+	},
 };
 
 static irqreturn_t rk3288_vepu_irq(int irq, void *dev_id)
@@ -155,6 +168,12 @@ static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
 		.init = hantro_mpeg2_dec_init,
 		.exit = hantro_mpeg2_dec_exit,
 	},
+	[HANTRO_MODE_VP8_DEC] = {
+		.run = hantro_g1_vp8_dec_run,
+		.reset = rk3288_vpu_dec_reset,
+		.init = hantro_vp8_dec_init,
+		.exit = hantro_vp8_dec_exit,
+	},
 };
 
 /*
@@ -177,7 +196,8 @@ const struct hantro_variant rk3288_vpu_variant = {
 	.dec_offset = 0x400,
 	.dec_fmts = rk3288_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(rk3288_vpu_dec_fmts),
-	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER,
+	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
+		 HANTRO_VP8_DECODER,
 	.codec_ops = rk3288_vpu_codec_ops,
 	.irqs = rk3288_irqs,
 	.num_irqs = ARRAY_SIZE(rk3288_irqs),
-- 
2.20.1

