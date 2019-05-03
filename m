Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2ED512CCD
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 13:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbfECLrg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 07:47:36 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46286 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727786AbfECLrd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 May 2019 07:47:33 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 67913283641;
        Fri,  3 May 2019 12:47:31 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v5 15/15] rockchip/vpu: Add support for MPEG-2 decoding on RK3288
Date:   Fri,  3 May 2019 13:47:19 +0200
Message-Id: <20190503114719.28784-16-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503114719.28784-1-boris.brezillon@collabora.com>
References: <20190503114719.28784-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonas Karlman <jonas@kwiboo.se>

Add necessary bits to support MPEG2 decoding on RK3288.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes from v4:
* Stop including rockchip_vpu_common.h

Changes from v3:
* Coding style improvements (Jonas)
* Use ALIGN() instead of div+shift (Jonas)

Changes from v2:
* New patch
---
 drivers/staging/media/rockchip/vpu/Makefile   |   1 +
 .../media/rockchip/vpu/rk3288_vpu_hw.c        |  59 +++-
 .../rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c    | 261 ++++++++++++++++++
 .../media/rockchip/vpu/rk3288_vpu_regs.h      |   1 +
 .../media/rockchip/vpu/rockchip_vpu_hw.h      |   1 +
 5 files changed, 322 insertions(+), 1 deletion(-)
 create mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c

diff --git a/drivers/staging/media/rockchip/vpu/Makefile b/drivers/staging/media/rockchip/vpu/Makefile
index fdf25c5d4b7e..d5b833a15653 100644
--- a/drivers/staging/media/rockchip/vpu/Makefile
+++ b/drivers/staging/media/rockchip/vpu/Makefile
@@ -5,6 +5,7 @@ rockchip-vpu-y += \
 		rockchip_vpu_v4l2.o \
 		rk3288_vpu_hw.o \
 		rk3288_vpu_hw_jpeg_enc.o \
+		rk3288_vpu_hw_mpeg2_dec.o \
 		rk3399_vpu_hw.o \
 		rk3399_vpu_hw_jpeg_enc.o \
 		rk3399_vpu_hw_mpeg2_dec.o \
diff --git a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c b/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c
index da19f1cad957..003143c77d37 100644
--- a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c
+++ b/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c
@@ -55,6 +55,26 @@ static const struct rockchip_vpu_fmt rk3288_vpu_enc_fmts[] = {
 	},
 };
 
+static const struct rockchip_vpu_fmt rk3288_vpu_dec_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.codec_mode = RK_VPU_MODE_NONE,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
+		.codec_mode = RK_VPU_MODE_MPEG2_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 48,
+			.max_width = 1920,
+			.step_width = MPEG2_MB_DIM,
+			.min_height = 48,
+			.max_height = 1088,
+			.step_height = MPEG2_MB_DIM,
+		},
+	},
+};
+
 static irqreturn_t rk3288_vepu_irq(int irq, void *dev_id)
 {
 	struct rockchip_vpu_dev *vpu = dev_id;
@@ -74,6 +94,24 @@ static irqreturn_t rk3288_vepu_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t rk3288_vdpu_irq(int irq, void *dev_id)
+{
+	struct rockchip_vpu_dev *vpu = dev_id;
+	enum vb2_buffer_state state;
+	u32 status;
+
+	status = vdpu_read(vpu, VDPU_REG_INTERRUPT);
+	state = (status & VDPU_REG_INTERRUPT_DEC_RDY_INT) ?
+		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+
+	vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);
+	vdpu_write(vpu, VDPU_REG_CONFIG_DEC_CLK_GATE_E, VDPU_REG_CONFIG);
+
+	rockchip_vpu_irq_done(vpu, 0, state);
+
+	return IRQ_HANDLED;
+}
+
 static int rk3288_vpu_hw_init(struct rockchip_vpu_dev *vpu)
 {
 	/* Bump ACLK to max. possible freq. to improve performance. */
@@ -90,6 +128,15 @@ static void rk3288_vpu_enc_reset(struct rockchip_vpu_ctx *ctx)
 	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
 }
 
+static void rk3288_vpu_dec_reset(struct rockchip_vpu_ctx *ctx)
+{
+	struct rockchip_vpu_dev *vpu = ctx->dev;
+
+	vdpu_write(vpu, VDPU_REG_INTERRUPT_DEC_IRQ_DIS, VDPU_REG_INTERRUPT);
+	vdpu_write(vpu, VDPU_REG_CONFIG_DEC_CLK_GATE_E, VDPU_REG_CONFIG);
+	vdpu_write(vpu, 1, VDPU_REG_SOFT_RESET);
+}
+
 /*
  * Supported codec ops.
  */
@@ -101,6 +148,12 @@ static const struct rockchip_vpu_codec_ops rk3288_vpu_codec_ops[] = {
 		.init = rockchip_vpu_jpeg_enc_init,
 		.exit = rockchip_vpu_jpeg_enc_exit,
 	},
+	[RK_VPU_MODE_MPEG2_DEC] = {
+		.run = rk3288_vpu_mpeg2_dec_run,
+		.reset = rk3288_vpu_dec_reset,
+		.init = rockchip_vpu_mpeg2_dec_init,
+		.exit = rockchip_vpu_mpeg2_dec_exit,
+	},
 };
 
 /*
@@ -111,9 +164,13 @@ const struct rockchip_vpu_variant rk3288_vpu_variant = {
 	.enc_offset = 0x0,
 	.enc_fmts = rk3288_vpu_enc_fmts,
 	.num_enc_fmts = ARRAY_SIZE(rk3288_vpu_enc_fmts),
+	.dec_offset = 0x400,
+	.dec_fmts = rk3288_vpu_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(rk3288_vpu_dec_fmts),
+	.codec = RK_VPU_JPEG_ENCODER | RK_VPU_MPEG2_DECODER,
 	.codec_ops = rk3288_vpu_codec_ops,
-	.codec = RK_VPU_JPEG_ENCODER,
 	.vepu_irq = rk3288_vepu_irq,
+	.vdpu_irq = rk3288_vdpu_irq,
 	.init = rk3288_vpu_hw_init,
 	.clk_names = {"aclk", "hclk"},
 	.num_clocks = 2
diff --git a/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c b/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c
new file mode 100644
index 000000000000..e9eee47fcea1
--- /dev/null
+++ b/drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip VPU codec driver
+ *
+ * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
+ */
+
+#include <asm/unaligned.h>
+#include <linux/bitfield.h>
+#include <media/v4l2-mem2mem.h>
+#include "rockchip_vpu.h"
+#include "rockchip_vpu_hw.h"
+
+#define VDPU_SWREG(nr)			((nr) * 4)
+
+#define VDPU_REG_RLC_VLC_BASE		VDPU_SWREG(12)
+#define VDPU_REG_DEC_OUT_BASE		VDPU_SWREG(13)
+#define VDPU_REG_REFER0_BASE		VDPU_SWREG(14)
+#define VDPU_REG_REFER1_BASE		VDPU_SWREG(15)
+#define VDPU_REG_REFER2_BASE		VDPU_SWREG(16)
+#define VDPU_REG_REFER3_BASE		VDPU_SWREG(17)
+#define VDPU_REG_QTABLE_BASE		VDPU_SWREG(40)
+#define VDPU_REG_DEC_E(v)		((v) ? BIT(0) : 0)
+
+#define VDPU_REG_DEC_AXI_RD_ID(v)	(((v) << 24) & GENMASK(31, 24))
+#define VDPU_REG_DEC_TIMEOUT_E(v)	((v) ? BIT(23) : 0)
+#define VDPU_REG_DEC_STRSWAP32_E(v)	((v) ? BIT(22) : 0)
+#define VDPU_REG_DEC_STRENDIAN_E(v)	((v) ? BIT(21) : 0)
+#define VDPU_REG_DEC_INSWAP32_E(v)	((v) ? BIT(20) : 0)
+#define VDPU_REG_DEC_OUTSWAP32_E(v)	((v) ? BIT(19) : 0)
+#define VDPU_REG_DEC_DATA_DISC_E(v)	((v) ? BIT(18) : 0)
+#define VDPU_REG_DEC_LATENCY(v)		(((v) << 11) & GENMASK(16, 11))
+#define VDPU_REG_DEC_CLK_GATE_E(v)	((v) ? BIT(10) : 0)
+#define VDPU_REG_DEC_IN_ENDIAN(v)	((v) ? BIT(9) : 0)
+#define VDPU_REG_DEC_OUT_ENDIAN(v)	((v) ? BIT(8) : 0)
+#define VDPU_REG_DEC_ADV_PRE_DIS(v)	((v) ? BIT(6) : 0)
+#define VDPU_REG_DEC_SCMD_DIS(v)	((v) ? BIT(5) : 0)
+#define VDPU_REG_DEC_MAX_BURST(v)	(((v) << 0) & GENMASK(4, 0))
+
+#define VDPU_REG_DEC_MODE(v)		(((v) << 28) & GENMASK(31, 28))
+#define VDPU_REG_RLC_MODE_E(v)		((v) ? BIT(27) : 0)
+#define VDPU_REG_PIC_INTERLACE_E(v)	((v) ? BIT(23) : 0)
+#define VDPU_REG_PIC_FIELDMODE_E(v)	((v) ? BIT(22) : 0)
+#define VDPU_REG_PIC_B_E(v)		((v) ? BIT(21) : 0)
+#define VDPU_REG_PIC_INTER_E(v)		((v) ? BIT(20) : 0)
+#define VDPU_REG_PIC_TOPFIELD_E(v)	((v) ? BIT(19) : 0)
+#define VDPU_REG_FWD_INTERLACE_E(v)	((v) ? BIT(18) : 0)
+#define VDPU_REG_FILTERING_DIS(v)	((v) ? BIT(14) : 0)
+#define VDPU_REG_WRITE_MVS_E(v)		((v) ? BIT(12) : 0)
+#define VDPU_REG_DEC_AXI_WR_ID(v)	(((v) << 0) & GENMASK(7, 0))
+
+#define VDPU_REG_PIC_MB_WIDTH(v)	(((v) << 23) & GENMASK(31, 23))
+#define VDPU_REG_PIC_MB_HEIGHT_P(v)	(((v) << 11) & GENMASK(18, 11))
+#define VDPU_REG_ALT_SCAN_E(v)		((v) ? BIT(6) : 0)
+#define VDPU_REG_TOPFIELDFIRST_E(v)	((v) ? BIT(5) : 0)
+
+#define VDPU_REG_STRM_START_BIT(v)	(((v) << 26) & GENMASK(31, 26))
+#define VDPU_REG_QSCALE_TYPE(v)		((v) ? BIT(24) : 0)
+#define VDPU_REG_CON_MV_E(v)		((v) ? BIT(4) : 0)
+#define VDPU_REG_INTRA_DC_PREC(v)	(((v) << 2) & GENMASK(3, 2))
+#define VDPU_REG_INTRA_VLC_TAB(v)	((v) ? BIT(1) : 0)
+#define VDPU_REG_FRAME_PRED_DCT(v)	((v) ? BIT(0) : 0)
+
+#define VDPU_REG_INIT_QP(v)		(((v) << 25) & GENMASK(30, 25))
+#define VDPU_REG_STREAM_LEN(v)		(((v) << 0) & GENMASK(23, 0))
+
+#define VDPU_REG_ALT_SCAN_FLAG_E(v)	((v) ? BIT(19) : 0)
+#define VDPU_REG_FCODE_FWD_HOR(v)	(((v) << 15) & GENMASK(18, 15))
+#define VDPU_REG_FCODE_FWD_VER(v)	(((v) << 11) & GENMASK(14, 11))
+#define VDPU_REG_FCODE_BWD_HOR(v)	(((v) << 7) & GENMASK(10, 7))
+#define VDPU_REG_FCODE_BWD_VER(v)	(((v) << 3) & GENMASK(6, 3))
+#define VDPU_REG_MV_ACCURACY_FWD(v)	((v) ? BIT(2) : 0)
+#define VDPU_REG_MV_ACCURACY_BWD(v)	((v) ? BIT(1) : 0)
+
+#define VDPU_REG_STARTMB_X(v)		(((v) << 23) & GENMASK(31, 23))
+#define VDPU_REG_STARTMB_Y(v)		(((v) << 15) & GENMASK(22, 15))
+
+#define VDPU_REG_APF_THRESHOLD(v)	(((v) << 0) & GENMASK(13, 0))
+
+#define PICT_TOP_FIELD     1
+#define PICT_BOTTOM_FIELD  2
+#define PICT_FRAME         3
+
+static void
+rk3288_vpu_mpeg2_dec_set_quantization(struct rockchip_vpu_dev *vpu,
+				      struct rockchip_vpu_ctx *ctx)
+{
+	struct v4l2_ctrl_mpeg2_quantization *quantization;
+
+	quantization = rockchip_vpu_get_ctrl(ctx,
+				V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION);
+	rockchip_vpu_mpeg2_dec_copy_qtable(ctx->mpeg2_dec.qtable.cpu,
+					   quantization);
+	vdpu_write_relaxed(vpu, ctx->mpeg2_dec.qtable.dma,
+			   VDPU_REG_QTABLE_BASE);
+}
+
+static void
+rk3288_vpu_mpeg2_dec_set_buffers(struct rockchip_vpu_dev *vpu,
+				 struct rockchip_vpu_ctx *ctx,
+				 struct vb2_buffer *src_buf,
+				 struct vb2_buffer *dst_buf,
+				 const struct v4l2_mpeg2_sequence *sequence,
+				 const struct v4l2_mpeg2_picture *picture,
+				 const struct v4l2_ctrl_mpeg2_slice_params *slice_params)
+{
+	dma_addr_t forward_addr = 0, backward_addr = 0;
+	dma_addr_t current_addr, addr;
+	struct vb2_queue *vq;
+
+	vq = v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
+
+	switch (picture->picture_coding_type) {
+	case V4L2_MPEG2_PICTURE_CODING_TYPE_B:
+		backward_addr = rockchip_vpu_get_ref(vq,
+						slice_params->backward_ref_ts);
+		/* fall-through */
+	case V4L2_MPEG2_PICTURE_CODING_TYPE_P:
+		forward_addr = rockchip_vpu_get_ref(vq,
+						slice_params->forward_ref_ts);
+	}
+
+	/* Source bitstream buffer */
+	addr = vb2_dma_contig_plane_dma_addr(src_buf, 0);
+	vdpu_write_relaxed(vpu, addr, VDPU_REG_RLC_VLC_BASE);
+
+	/* Destination frame buffer */
+	addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
+	current_addr = addr;
+
+	if (picture->picture_structure == PICT_BOTTOM_FIELD)
+		addr += ALIGN(ctx->dst_fmt.width, 16);
+	vdpu_write_relaxed(vpu, addr, VDPU_REG_DEC_OUT_BASE);
+
+	if (!forward_addr)
+		forward_addr = current_addr;
+	if (!backward_addr)
+		backward_addr = current_addr;
+
+	/* Set forward ref frame (top/bottom field) */
+	if (picture->picture_structure == PICT_FRAME ||
+	    picture->picture_coding_type == V4L2_MPEG2_PICTURE_CODING_TYPE_B ||
+	    (picture->picture_structure == PICT_TOP_FIELD &&
+	     picture->top_field_first) ||
+	    (picture->picture_structure == PICT_BOTTOM_FIELD &&
+	     !picture->top_field_first)) {
+		vdpu_write_relaxed(vpu, forward_addr, VDPU_REG_REFER0_BASE);
+		vdpu_write_relaxed(vpu, forward_addr, VDPU_REG_REFER1_BASE);
+	} else if (picture->picture_structure == PICT_TOP_FIELD) {
+		vdpu_write_relaxed(vpu, forward_addr, VDPU_REG_REFER0_BASE);
+		vdpu_write_relaxed(vpu, current_addr, VDPU_REG_REFER1_BASE);
+	} else if (picture->picture_structure == PICT_BOTTOM_FIELD) {
+		vdpu_write_relaxed(vpu, current_addr, VDPU_REG_REFER0_BASE);
+		vdpu_write_relaxed(vpu, forward_addr, VDPU_REG_REFER1_BASE);
+	}
+
+	/* Set backward ref frame (top/bottom field) */
+	vdpu_write_relaxed(vpu, backward_addr, VDPU_REG_REFER2_BASE);
+	vdpu_write_relaxed(vpu, backward_addr, VDPU_REG_REFER3_BASE);
+}
+
+void rk3288_vpu_mpeg2_dec_run(struct rockchip_vpu_ctx *ctx)
+{
+	struct rockchip_vpu_dev *vpu = ctx->dev;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
+	const struct v4l2_mpeg2_sequence *sequence;
+	const struct v4l2_mpeg2_picture *picture;
+	u32 reg;
+
+	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+
+	/* Apply request controls if any */
+	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
+				&ctx->ctrl_handler);
+
+	slice_params = rockchip_vpu_get_ctrl(ctx,
+				V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
+	sequence = &slice_params->sequence;
+	picture = &slice_params->picture;
+
+	reg = VDPU_REG_DEC_AXI_RD_ID(0) |
+	      VDPU_REG_DEC_TIMEOUT_E(1) |
+	      VDPU_REG_DEC_STRSWAP32_E(1) |
+	      VDPU_REG_DEC_STRENDIAN_E(1) |
+	      VDPU_REG_DEC_INSWAP32_E(1) |
+	      VDPU_REG_DEC_OUTSWAP32_E(1) |
+	      VDPU_REG_DEC_DATA_DISC_E(0) |
+	      VDPU_REG_DEC_LATENCY(0) |
+	      VDPU_REG_DEC_CLK_GATE_E(1) |
+	      VDPU_REG_DEC_IN_ENDIAN(1) |
+	      VDPU_REG_DEC_OUT_ENDIAN(1) |
+	      VDPU_REG_DEC_ADV_PRE_DIS(0) |
+	      VDPU_REG_DEC_SCMD_DIS(0) |
+	      VDPU_REG_DEC_MAX_BURST(16);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(2));
+
+	reg = VDPU_REG_DEC_MODE(5) |
+	      VDPU_REG_RLC_MODE_E(0) |
+	      VDPU_REG_PIC_INTERLACE_E(!sequence->progressive_sequence) |
+	      VDPU_REG_PIC_FIELDMODE_E(picture->picture_structure != PICT_FRAME) |
+	      VDPU_REG_PIC_B_E(picture->picture_coding_type == V4L2_MPEG2_PICTURE_CODING_TYPE_B) |
+	      VDPU_REG_PIC_INTER_E(picture->picture_coding_type != V4L2_MPEG2_PICTURE_CODING_TYPE_I) |
+	      VDPU_REG_PIC_TOPFIELD_E(picture->picture_structure == PICT_TOP_FIELD) |
+	      VDPU_REG_FWD_INTERLACE_E(0) |
+	      VDPU_REG_FILTERING_DIS(1) |
+	      VDPU_REG_WRITE_MVS_E(0) |
+	      VDPU_REG_DEC_AXI_WR_ID(0);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(3));
+
+	reg = VDPU_REG_PIC_MB_WIDTH(MPEG2_MB_WIDTH(ctx->dst_fmt.width)) |
+	      VDPU_REG_PIC_MB_HEIGHT_P(MPEG2_MB_HEIGHT(ctx->dst_fmt.height)) |
+	      VDPU_REG_ALT_SCAN_E(picture->alternate_scan) |
+	      VDPU_REG_TOPFIELDFIRST_E(picture->top_field_first);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(4));
+
+	reg = VDPU_REG_STRM_START_BIT(slice_params->data_bit_offset) |
+	      VDPU_REG_QSCALE_TYPE(picture->q_scale_type) |
+	      VDPU_REG_CON_MV_E(picture->concealment_motion_vectors) |
+	      VDPU_REG_INTRA_DC_PREC(picture->intra_dc_precision) |
+	      VDPU_REG_INTRA_VLC_TAB(picture->intra_vlc_format) |
+	      VDPU_REG_FRAME_PRED_DCT(picture->frame_pred_frame_dct);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(5));
+
+	reg = VDPU_REG_INIT_QP(1) |
+	      VDPU_REG_STREAM_LEN(slice_params->bit_size >> 3);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(6));
+
+	reg = VDPU_REG_ALT_SCAN_FLAG_E(picture->alternate_scan) |
+	      VDPU_REG_FCODE_FWD_HOR(picture->f_code[0][0]) |
+	      VDPU_REG_FCODE_FWD_VER(picture->f_code[0][1]) |
+	      VDPU_REG_FCODE_BWD_HOR(picture->f_code[1][0]) |
+	      VDPU_REG_FCODE_BWD_VER(picture->f_code[1][1]) |
+	      VDPU_REG_MV_ACCURACY_FWD(1) |
+	      VDPU_REG_MV_ACCURACY_BWD(1);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(18));
+
+	reg = VDPU_REG_STARTMB_X(0) |
+	      VDPU_REG_STARTMB_Y(0);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(48));
+
+	reg = VDPU_REG_APF_THRESHOLD(8);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(55));
+
+	rk3288_vpu_mpeg2_dec_set_quantization(vpu, ctx);
+
+	rk3288_vpu_mpeg2_dec_set_buffers(vpu, ctx, &src_buf->vb2_buf,
+					 &dst_buf->vb2_buf,
+					 sequence, picture, slice_params);
+
+	/* Controls no longer in-use, we can complete them */
+	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
+				   &ctx->ctrl_handler);
+
+	/* Kick the watchdog and start decoding */
+	schedule_delayed_work(&vpu->watchdog_work, msecs_to_jiffies(2000));
+
+	reg = VDPU_REG_DEC_E(1);
+	vdpu_write(vpu, reg, VDPU_SWREG(1));
+}
diff --git a/drivers/staging/media/rockchip/vpu/rk3288_vpu_regs.h b/drivers/staging/media/rockchip/vpu/rk3288_vpu_regs.h
index 9d0b9bdf3297..c9631b713804 100644
--- a/drivers/staging/media/rockchip/vpu/rk3288_vpu_regs.h
+++ b/drivers/staging/media/rockchip/vpu/rk3288_vpu_regs.h
@@ -438,5 +438,6 @@
 #define     VDPU_REG_REF_BUF_CTRL2_REFBU2_THR(x)	(((x) & 0xfff) << 19)
 #define     VDPU_REG_REF_BUF_CTRL2_REFBU2_PICID(x)	(((x) & 0x1f) << 14)
 #define     VDPU_REG_REF_BUF_CTRL2_APF_THRESHOLD(x)	(((x) & 0x3fff) << 0)
+#define VDPU_REG_SOFT_RESET			0x194
 
 #endif /* RK3288_VPU_REGS_H_ */
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h b/drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h
index 4268c3a8b924..6cecb528f994 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h
@@ -92,6 +92,7 @@ void rk3399_vpu_jpeg_enc_run(struct rockchip_vpu_ctx *ctx);
 int rockchip_vpu_jpeg_enc_init(struct rockchip_vpu_ctx *ctx);
 void rockchip_vpu_jpeg_enc_exit(struct rockchip_vpu_ctx *ctx);
 
+void rk3288_vpu_mpeg2_dec_run(struct rockchip_vpu_ctx *ctx);
 void rk3399_vpu_mpeg2_dec_run(struct rockchip_vpu_ctx *ctx);
 void rockchip_vpu_mpeg2_dec_copy_qtable(u8 *qtable,
 	const struct v4l2_ctrl_mpeg2_quantization *ctrl);
-- 
2.20.1

