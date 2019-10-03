Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E77CBCAEE7
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 21:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732710AbfJCTJH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 15:09:07 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45088 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732289AbfJCTJH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 15:09:07 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5087928FEA6
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
Subject: [PATCH v2 2/4] media: hantro: mpeg2_dec: Re-use common register macros
Date:   Thu,  3 Oct 2019 16:08:31 -0300
Message-Id: <20191003190833.29046-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191003190833.29046-1-ezequiel@collabora.com>
References: <20191003190833.29046-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MPEG-2 decoder register macros can be re-used from hantro_g1_regs.h,
and the re-definitions removed.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 .../media/hantro/hantro_g1_mpeg2_dec.c        | 186 ++++++------------
 drivers/staging/media/hantro/hantro_g1_regs.h |  58 +++---
 2 files changed, 96 insertions(+), 148 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index f3bf67d8a289..663bf05459a9 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -10,60 +10,9 @@
 #include <media/v4l2-mem2mem.h>
 #include "hantro.h"
 #include "hantro_hw.h"
+#include "hantro_g1_regs.h"
 
-#define G1_SWREG(nr)			((nr) * 4)
-
-#define G1_REG_RLC_VLC_BASE		G1_SWREG(12)
-#define G1_REG_DEC_OUT_BASE		G1_SWREG(13)
-#define G1_REG_REFER0_BASE		G1_SWREG(14)
-#define G1_REG_REFER1_BASE		G1_SWREG(15)
-#define G1_REG_REFER2_BASE		G1_SWREG(16)
-#define G1_REG_REFER3_BASE		G1_SWREG(17)
-#define G1_REG_QTABLE_BASE		G1_SWREG(40)
-#define G1_REG_DEC_E(v)			((v) ? BIT(0) : 0)
-
-#define G1_REG_DEC_AXI_RD_ID(v)		(((v) << 24) & GENMASK(31, 24))
-#define G1_REG_DEC_TIMEOUT_E(v)		((v) ? BIT(23) : 0)
-#define G1_REG_DEC_STRSWAP32_E(v)	((v) ? BIT(22) : 0)
-#define G1_REG_DEC_STRENDIAN_E(v)	((v) ? BIT(21) : 0)
-#define G1_REG_DEC_INSWAP32_E(v)	((v) ? BIT(20) : 0)
-#define G1_REG_DEC_OUTSWAP32_E(v)	((v) ? BIT(19) : 0)
-#define G1_REG_DEC_DATA_DISC_E(v)	((v) ? BIT(18) : 0)
-#define G1_REG_DEC_LATENCY(v)		(((v) << 11) & GENMASK(16, 11))
-#define G1_REG_DEC_CLK_GATE_E(v)	((v) ? BIT(10) : 0)
-#define G1_REG_DEC_IN_ENDIAN(v)		((v) ? BIT(9) : 0)
-#define G1_REG_DEC_OUT_ENDIAN(v)	((v) ? BIT(8) : 0)
-#define G1_REG_DEC_ADV_PRE_DIS(v)	((v) ? BIT(6) : 0)
-#define G1_REG_DEC_SCMD_DIS(v)		((v) ? BIT(5) : 0)
-#define G1_REG_DEC_MAX_BURST(v)		(((v) << 0) & GENMASK(4, 0))
-
-#define G1_REG_DEC_MODE(v)		(((v) << 28) & GENMASK(31, 28))
-#define G1_REG_RLC_MODE_E(v)		((v) ? BIT(27) : 0)
-#define G1_REG_PIC_INTERLACE_E(v)	((v) ? BIT(23) : 0)
-#define G1_REG_PIC_FIELDMODE_E(v)	((v) ? BIT(22) : 0)
-#define G1_REG_PIC_B_E(v)		((v) ? BIT(21) : 0)
-#define G1_REG_PIC_INTER_E(v)		((v) ? BIT(20) : 0)
-#define G1_REG_PIC_TOPFIELD_E(v)	((v) ? BIT(19) : 0)
-#define G1_REG_FWD_INTERLACE_E(v)	((v) ? BIT(18) : 0)
-#define G1_REG_FILTERING_DIS(v)		((v) ? BIT(14) : 0)
-#define G1_REG_WRITE_MVS_E(v)		((v) ? BIT(12) : 0)
-#define G1_REG_DEC_AXI_WR_ID(v)		(((v) << 0) & GENMASK(7, 0))
-
-#define G1_REG_PIC_MB_WIDTH(v)		(((v) << 23) & GENMASK(31, 23))
-#define G1_REG_PIC_MB_HEIGHT_P(v)	(((v) << 11) & GENMASK(18, 11))
-#define G1_REG_ALT_SCAN_E(v)		((v) ? BIT(6) : 0)
-#define G1_REG_TOPFIELDFIRST_E(v)	((v) ? BIT(5) : 0)
-
-#define G1_REG_STRM_START_BIT(v)	(((v) << 26) & GENMASK(31, 26))
-#define G1_REG_QSCALE_TYPE(v)		((v) ? BIT(24) : 0)
-#define G1_REG_CON_MV_E(v)		((v) ? BIT(4) : 0)
-#define G1_REG_INTRA_DC_PREC(v)		(((v) << 2) & GENMASK(3, 2))
-#define G1_REG_INTRA_VLC_TAB(v)		((v) ? BIT(1) : 0)
-#define G1_REG_FRAME_PRED_DCT(v)	((v) ? BIT(0) : 0)
-
-#define G1_REG_INIT_QP(v)		(((v) << 25) & GENMASK(30, 25))
-#define G1_REG_STREAM_LEN(v)		(((v) << 0) & GENMASK(23, 0))
-
+/* These bits seem undocumented. */
 #define G1_REG_ALT_SCAN_FLAG_E(v)	((v) ? BIT(19) : 0)
 #define G1_REG_FCODE_FWD_HOR(v)		(((v) << 15) & GENMASK(18, 15))
 #define G1_REG_FCODE_FWD_VER(v)		(((v) << 11) & GENMASK(14, 11))
@@ -72,11 +21,6 @@
 #define G1_REG_MV_ACCURACY_FWD(v)	((v) ? BIT(2) : 0)
 #define G1_REG_MV_ACCURACY_BWD(v)	((v) ? BIT(1) : 0)
 
-#define G1_REG_STARTMB_X(v)		(((v) << 23) & GENMASK(31, 23))
-#define G1_REG_STARTMB_Y(v)		(((v) << 15) & GENMASK(22, 15))
-
-#define G1_REG_APF_THRESHOLD(v)		(((v) << 0) & GENMASK(13, 0))
-
 #define PICT_TOP_FIELD     1
 #define PICT_BOTTOM_FIELD  2
 #define PICT_FRAME         3
@@ -92,7 +36,7 @@ hantro_g1_mpeg2_dec_set_quantization(struct hantro_dev *vpu,
 	hantro_mpeg2_dec_copy_qtable(ctx->mpeg2_dec.qtable.cpu,
 				     quantization);
 	vdpu_write_relaxed(vpu, ctx->mpeg2_dec.qtable.dma,
-			   G1_REG_QTABLE_BASE);
+			   G1_REG_ADDR_QTABLE);
 }
 
 static void
@@ -118,7 +62,7 @@ hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
 
 	/* Source bitstream buffer */
 	addr = vb2_dma_contig_plane_dma_addr(src_buf, 0);
-	vdpu_write_relaxed(vpu, addr, G1_REG_RLC_VLC_BASE);
+	vdpu_write_relaxed(vpu, addr, G1_REG_ADDR_STR);
 
 	/* Destination frame buffer */
 	addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
@@ -126,7 +70,7 @@ hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
 
 	if (picture->picture_structure == PICT_BOTTOM_FIELD)
 		addr += ALIGN(ctx->dst_fmt.width, 16);
-	vdpu_write_relaxed(vpu, addr, G1_REG_DEC_OUT_BASE);
+	vdpu_write_relaxed(vpu, addr, G1_REG_ADDR_DST);
 
 	if (!forward_addr)
 		forward_addr = current_addr;
@@ -140,19 +84,19 @@ hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
 	     picture->top_field_first) ||
 	    (picture->picture_structure == PICT_BOTTOM_FIELD &&
 	     !picture->top_field_first)) {
-		vdpu_write_relaxed(vpu, forward_addr, G1_REG_REFER0_BASE);
-		vdpu_write_relaxed(vpu, forward_addr, G1_REG_REFER1_BASE);
+		vdpu_write_relaxed(vpu, forward_addr, G1_REG_ADDR_REF(0));
+		vdpu_write_relaxed(vpu, forward_addr, G1_REG_ADDR_REF(1));
 	} else if (picture->picture_structure == PICT_TOP_FIELD) {
-		vdpu_write_relaxed(vpu, forward_addr, G1_REG_REFER0_BASE);
-		vdpu_write_relaxed(vpu, current_addr, G1_REG_REFER1_BASE);
+		vdpu_write_relaxed(vpu, forward_addr, G1_REG_ADDR_REF(0));
+		vdpu_write_relaxed(vpu, current_addr, G1_REG_ADDR_REF(1));
 	} else if (picture->picture_structure == PICT_BOTTOM_FIELD) {
-		vdpu_write_relaxed(vpu, current_addr, G1_REG_REFER0_BASE);
-		vdpu_write_relaxed(vpu, forward_addr, G1_REG_REFER1_BASE);
+		vdpu_write_relaxed(vpu, current_addr, G1_REG_ADDR_REF(0));
+		vdpu_write_relaxed(vpu, forward_addr, G1_REG_ADDR_REF(1));
 	}
 
 	/* Set backward ref frame (top/bottom field) */
-	vdpu_write_relaxed(vpu, backward_addr, G1_REG_REFER2_BASE);
-	vdpu_write_relaxed(vpu, backward_addr, G1_REG_REFER3_BASE);
+	vdpu_write_relaxed(vpu, backward_addr, G1_REG_ADDR_REF(2));
+	vdpu_write_relaxed(vpu, backward_addr, G1_REG_ADDR_REF(3));
 }
 
 void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
@@ -175,52 +119,51 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 	sequence = &slice_params->sequence;
 	picture = &slice_params->picture;
 
-	reg = G1_REG_DEC_AXI_RD_ID(0) |
-	      G1_REG_DEC_TIMEOUT_E(1) |
-	      G1_REG_DEC_STRSWAP32_E(1) |
-	      G1_REG_DEC_STRENDIAN_E(1) |
-	      G1_REG_DEC_INSWAP32_E(1) |
-	      G1_REG_DEC_OUTSWAP32_E(1) |
-	      G1_REG_DEC_DATA_DISC_E(0) |
-	      G1_REG_DEC_LATENCY(0) |
-	      G1_REG_DEC_CLK_GATE_E(1) |
-	      G1_REG_DEC_IN_ENDIAN(1) |
-	      G1_REG_DEC_OUT_ENDIAN(1) |
-	      G1_REG_DEC_ADV_PRE_DIS(0) |
-	      G1_REG_DEC_SCMD_DIS(0) |
-	      G1_REG_DEC_MAX_BURST(16);
-	vdpu_write_relaxed(vpu, reg, G1_SWREG(2));
-
-	reg = G1_REG_DEC_MODE(5) |
-	      G1_REG_RLC_MODE_E(0) |
-	      G1_REG_PIC_INTERLACE_E(!sequence->progressive_sequence) |
-	      G1_REG_PIC_FIELDMODE_E(picture->picture_structure != PICT_FRAME) |
-	      G1_REG_PIC_B_E(picture->picture_coding_type == V4L2_MPEG2_PICTURE_CODING_TYPE_B) |
-	      G1_REG_PIC_INTER_E(picture->picture_coding_type != V4L2_MPEG2_PICTURE_CODING_TYPE_I) |
-	      G1_REG_PIC_TOPFIELD_E(picture->picture_structure == PICT_TOP_FIELD) |
-	      G1_REG_FWD_INTERLACE_E(0) |
-	      G1_REG_FILTERING_DIS(1) |
-	      G1_REG_WRITE_MVS_E(0) |
-	      G1_REG_DEC_AXI_WR_ID(0);
-	vdpu_write_relaxed(vpu, reg, G1_SWREG(3));
-
-	reg = G1_REG_PIC_MB_WIDTH(MB_WIDTH(ctx->dst_fmt.width)) |
-	      G1_REG_PIC_MB_HEIGHT_P(MB_HEIGHT(ctx->dst_fmt.height)) |
-	      G1_REG_ALT_SCAN_E(picture->alternate_scan) |
-	      G1_REG_TOPFIELDFIRST_E(picture->top_field_first);
-	vdpu_write_relaxed(vpu, reg, G1_SWREG(4));
-
-	reg = G1_REG_STRM_START_BIT(slice_params->data_bit_offset) |
-	      G1_REG_QSCALE_TYPE(picture->q_scale_type) |
-	      G1_REG_CON_MV_E(picture->concealment_motion_vectors) |
-	      G1_REG_INTRA_DC_PREC(picture->intra_dc_precision) |
-	      G1_REG_INTRA_VLC_TAB(picture->intra_vlc_format) |
-	      G1_REG_FRAME_PRED_DCT(picture->frame_pred_frame_dct);
-	vdpu_write_relaxed(vpu, reg, G1_SWREG(5));
-
-	reg = G1_REG_INIT_QP(1) |
-	      G1_REG_STREAM_LEN(slice_params->bit_size >> 3);
-	vdpu_write_relaxed(vpu, reg, G1_SWREG(6));
+	reg = G1_REG_CONFIG_DEC_AXI_RD_ID(0) |
+	      G1_REG_CONFIG_DEC_TIMEOUT_E |
+	      G1_REG_CONFIG_DEC_STRSWAP32_E |
+	      G1_REG_CONFIG_DEC_STRENDIAN_E |
+	      G1_REG_CONFIG_DEC_INSWAP32_E |
+	      G1_REG_CONFIG_DEC_OUTSWAP32_E |
+	      G1_REG_CONFIG_DEC_LATENCY(0) |
+	      G1_REG_CONFIG_DEC_CLK_GATE_E |
+	      G1_REG_CONFIG_DEC_IN_ENDIAN |
+	      G1_REG_CONFIG_DEC_OUT_ENDIAN |
+	      G1_REG_CONFIG_DEC_MAX_BURST(16);
+	vdpu_write_relaxed(vpu, reg, G1_REG_CONFIG);
+
+	reg = G1_REG_DEC_CTRL0_DEC_MODE(5) |
+	      G1_REG_DEC_CTRL0_FILTERING_DIS |
+	      G1_REG_DEC_CTRL0_DEC_AXI_WR_ID(0);
+	G1_SWREG_SET_IF(reg, !sequence->progressive_sequence,
+			G1_REG_DEC_CTRL0_PIC_INTERLACE_E);
+	G1_SWREG_SET_IF(reg, picture->picture_coding_type == V4L2_MPEG2_PICTURE_CODING_TYPE_B,
+			G1_REG_DEC_CTRL0_PIC_B_E);
+	G1_SWREG_SET_IF(reg, picture->picture_coding_type != V4L2_MPEG2_PICTURE_CODING_TYPE_I,
+			G1_REG_DEC_CTRL0_PIC_INTER_E);
+	G1_SWREG_SET_IF(reg, picture->picture_structure == PICT_TOP_FIELD,
+			G1_REG_DEC_CTRL0_PIC_TOPFIELD_E);
+	G1_SWREG_SET_IF(reg, picture->picture_structure != PICT_FRAME,
+			G1_REG_DEC_CTRL0_PIC_FIELDMODE_E);
+	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
+
+	reg = G1_REG_DEC_CTRL1_PIC_MB_WIDTH(MB_WIDTH(ctx->dst_fmt.width)) |
+	      G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(MB_HEIGHT(ctx->dst_fmt.height));
+	G1_SWREG_SET_IF(reg, picture->alternate_scan, G1_REG_DEC_CTRL1_ALT_SCAN_E);
+	G1_SWREG_SET_IF(reg, picture->top_field_first, G1_REG_DEC_CTRL1_TOPFIELDFIRST_E);
+	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL1);
+
+	reg = G1_REG_DEC_CTRL2_STRM_START_BIT(slice_params->data_bit_offset) |
+	      G1_REG_DEC_CTRL2_INTRA_DC_PREC(picture->intra_dc_precision);
+	G1_SWREG_SET_IF(reg, picture->q_scale_type,G1_REG_DEC_CTRL2_QSCALE_TYPE);
+	G1_SWREG_SET_IF(reg, picture->concealment_motion_vectors, G1_REG_DEC_CTRL2_CON_MV_E);
+	G1_SWREG_SET_IF(reg, picture->intra_vlc_format, G1_REG_DEC_CTRL2_INTRA_VLC_TAB);
+	G1_SWREG_SET_IF(reg, picture->frame_pred_frame_dct, G1_REG_DEC_CTRL2_FRAME_PRED_DCT);
+	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL2);
+
+	reg = G1_REG_DEC_CTRL3_INIT_QP(1) |
+	      G1_REG_DEC_CTRL3_STREAM_LEN(slice_params->bit_size >> 3);
+	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL3);
 
 	reg = G1_REG_ALT_SCAN_FLAG_E(picture->alternate_scan) |
 	      G1_REG_FCODE_FWD_HOR(picture->f_code[0][0]) |
@@ -231,12 +174,12 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 	      G1_REG_MV_ACCURACY_BWD(1);
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(18));
 
-	reg = G1_REG_STARTMB_X(0) |
-	      G1_REG_STARTMB_Y(0);
-	vdpu_write_relaxed(vpu, reg, G1_SWREG(48));
+	reg = G1_REG_ERR_CONC_STARTMB_X(0) |
+	      G1_REG_ERR_CONC_STARTMB_Y(0);
+	vdpu_write_relaxed(vpu, reg, G1_REG_ERR_CONC);
 
-	reg = G1_REG_APF_THRESHOLD(8);
-	vdpu_write_relaxed(vpu, reg, G1_SWREG(55));
+	reg = G1_REG_REF_BUF_CTRL2_APF_THRESHOLD(8);
+	vdpu_write_relaxed(vpu, reg, G1_REG_REF_BUF_CTRL2);
 
 	hantro_g1_mpeg2_dec_set_quantization(vpu, ctx);
 
@@ -246,6 +189,5 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	hantro_finish_run(ctx);
 
-	reg = G1_REG_DEC_E(1);
-	vdpu_write(vpu, reg, G1_SWREG(1));
+	vdpu_write(vpu, G1_REG_INTERRUPT_DEC_E, G1_REG_INTERRUPT);
 }
diff --git a/drivers/staging/media/hantro/hantro_g1_regs.h b/drivers/staging/media/hantro/hantro_g1_regs.h
index 5c0ea7994336..84b93915a953 100644
--- a/drivers/staging/media/hantro/hantro_g1_regs.h
+++ b/drivers/staging/media/hantro/hantro_g1_regs.h
@@ -9,8 +9,14 @@
 #ifndef HANTRO_G1_REGS_H_
 #define HANTRO_G1_REGS_H_
 
+#define G1_SWREG(nr) ((nr) * 4)
+#define G1_SWREG_SET_IF(reg, cond, val) \
+	do \
+		reg |= (cond) ? (val) : 0x0; \
+	while (0)
+
 /* Decoder registers. */
-#define G1_REG_INTERRUPT				0x004
+#define G1_REG_INTERRUPT				G1_SWREG(1)
 #define     G1_REG_INTERRUPT_DEC_PIC_INF		BIT(24)
 #define     G1_REG_INTERRUPT_DEC_TIMEOUT		BIT(18)
 #define     G1_REG_INTERRUPT_DEC_SLICE_INT		BIT(17)
@@ -22,7 +28,7 @@
 #define     G1_REG_INTERRUPT_DEC_IRQ			BIT(8)
 #define     G1_REG_INTERRUPT_DEC_IRQ_DIS		BIT(4)
 #define     G1_REG_INTERRUPT_DEC_E			BIT(0)
-#define G1_REG_CONFIG					0x008
+#define G1_REG_CONFIG					G1_SWREG(2)
 #define     G1_REG_CONFIG_DEC_AXI_RD_ID(x)		(((x) & 0xff) << 24)
 #define     G1_REG_CONFIG_DEC_TIMEOUT_E			BIT(23)
 #define     G1_REG_CONFIG_DEC_STRSWAP32_E		BIT(22)
@@ -41,7 +47,7 @@
 #define     G1_REG_CONFIG_DEC_ADV_PRE_DIS		BIT(6)
 #define     G1_REG_CONFIG_DEC_SCMD_DIS			BIT(5)
 #define     G1_REG_CONFIG_DEC_MAX_BURST(x)		(((x) & 0x1f) << 0)
-#define G1_REG_DEC_CTRL0				0x00c
+#define G1_REG_DEC_CTRL0				G1_SWREG(3)
 #define     G1_REG_DEC_CTRL0_DEC_MODE(x)		(((x) & 0xf) << 28)
 #define     G1_REG_DEC_CTRL0_RLC_MODE_E			BIT(27)
 #define     G1_REG_DEC_CTRL0_SKIP_MODE			BIT(26)
@@ -66,7 +72,7 @@
 #define     G1_REG_DEC_CTRL0_PICORD_COUNT_E		BIT(9)
 #define     G1_REG_DEC_CTRL0_DEC_AHB_HLOCK_E		BIT(8)
 #define     G1_REG_DEC_CTRL0_DEC_AXI_WR_ID(x)		(((x) & 0xff) << 0)
-#define G1_REG_DEC_CTRL1				0x010
+#define G1_REG_DEC_CTRL1				G1_SWREG(4)
 #define     G1_REG_DEC_CTRL1_PIC_MB_WIDTH(x)		(((x) & 0x1ff) << 23)
 #define     G1_REG_DEC_CTRL1_MB_WIDTH_OFF(x)		(((x) & 0xf) << 19)
 #define     G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(x)		(((x) & 0xff) << 11)
@@ -77,7 +83,7 @@
 #define     G1_REG_DEC_CTRL1_PIC_MB_W_EXT(x)		(((x) & 0x7) << 3)
 #define     G1_REG_DEC_CTRL1_PIC_MB_H_EXT(x)		(((x) & 0x7) << 0)
 #define     G1_REG_DEC_CTRL1_PIC_REFER_FLAG		BIT(0)
-#define G1_REG_DEC_CTRL2				0x014
+#define G1_REG_DEC_CTRL2				G1_SWREG(5)
 #define     G1_REG_DEC_CTRL2_STRM_START_BIT(x)		(((x) & 0x3f) << 26)
 #define     G1_REG_DEC_CTRL2_SYNC_MARKER_E		BIT(25)
 #define     G1_REG_DEC_CTRL2_TYPE1_QUANT_E		BIT(24)
@@ -120,13 +126,13 @@
 #define     G1_REG_DEC_CTRL2_BOOLEAN_RANGE(x)		(((x) & 0xff) << 0)
 #define     G1_REG_DEC_CTRL2_ALPHA_OFFSET(x)		(((x) & 0x1f) << 5)
 #define     G1_REG_DEC_CTRL2_BETA_OFFSET(x)		(((x) & 0x1f) << 0)
-#define G1_REG_DEC_CTRL3				0x018
+#define G1_REG_DEC_CTRL3				G1_SWREG(6)
 #define     G1_REG_DEC_CTRL3_START_CODE_E		BIT(31)
 #define     G1_REG_DEC_CTRL3_INIT_QP(x)			(((x) & 0x3f) << 25)
 #define     G1_REG_DEC_CTRL3_CH_8PIX_ILEAV_E		BIT(24)
 #define     G1_REG_DEC_CTRL3_STREAM_LEN_EXT(x)		(((x) & 0xff) << 24)
 #define     G1_REG_DEC_CTRL3_STREAM_LEN(x)		(((x) & 0xffffff) << 0)
-#define G1_REG_DEC_CTRL4				0x01c
+#define G1_REG_DEC_CTRL4				G1_SWREG(7)
 #define     G1_REG_DEC_CTRL4_CABAC_E			BIT(31)
 #define     G1_REG_DEC_CTRL4_BLACKWHITE_E		BIT(30)
 #define     G1_REG_DEC_CTRL4_DIR_8X8_INFER_E		BIT(29)
@@ -163,7 +169,7 @@
 #define     G1_REG_DEC_CTRL4_INIT_DC_MATCH0(x)		(((x) & 0x7) << 9)
 #define     G1_REG_DEC_CTRL4_INIT_DC_MATCH1(x)		(((x) & 0x7) << 6)
 #define     G1_REG_DEC_CTRL4_VP7_VERSION		BIT(5)
-#define G1_REG_DEC_CTRL5				0x020
+#define G1_REG_DEC_CTRL5				G1_SWREG(8)
 #define     G1_REG_DEC_CTRL5_CONST_INTRA_E		BIT(31)
 #define     G1_REG_DEC_CTRL5_FILT_CTRL_PRES		BIT(30)
 #define     G1_REG_DEC_CTRL5_RDPIC_CNT_PRES		BIT(29)
@@ -187,7 +193,7 @@
 #define     G1_REG_DEC_CTRL5_RV_BWD_SCALE(x)		(((x) & 0x3fff) << 0)
 #define     G1_REG_DEC_CTRL5_INIT_DC_COMP0(x)		(((x) & 0xffff) << 16)
 #define     G1_REG_DEC_CTRL5_INIT_DC_COMP1(x)		(((x) & 0xffff) << 0)
-#define G1_REG_DEC_CTRL6				0x024
+#define G1_REG_DEC_CTRL6				G1_SWREG(9)
 #define     G1_REG_DEC_CTRL6_PPS_ID(x)			(((x) & 0xff) << 24)
 #define     G1_REG_DEC_CTRL6_REFIDX1_ACTIVE(x)		(((x) & 0x1f) << 19)
 #define     G1_REG_DEC_CTRL6_REFIDX0_ACTIVE(x)		(((x) & 0x1f) << 14)
@@ -198,7 +204,7 @@
 #define     G1_REG_DEC_CTRL6_STREAM1_LEN(x)		(((x) & 0xffffff) << 0)
 #define     G1_REG_DEC_CTRL6_PIC_SLICE_AM(x)		(((x) & 0x1fff) << 0)
 #define     G1_REG_DEC_CTRL6_COEFFS_PART_AM(x)		(((x) & 0xf) << 24)
-#define G1_REG_FWD_PIC(i)				(0x028 + ((i) * 0x4))
+#define G1_REG_FWD_PIC(i)				(G1_SWREG(10) + ((i) * 0x4))
 #define     G1_REG_FWD_PIC_PINIT_RLIST_F5(x)		(((x) & 0x1f) << 25)
 #define     G1_REG_FWD_PIC_PINIT_RLIST_F4(x)		(((x) & 0x1f) << 20)
 #define     G1_REG_FWD_PIC_PINIT_RLIST_F3(x)		(((x) & 0x1f) << 15)
@@ -211,7 +217,7 @@
 #define     G1_REG_FWD_PIC1_SEGMENT_BASE(x)		((x) << 0)
 #define     G1_REG_FWD_PIC1_SEGMENT_UPD_E		BIT(1)
 #define     G1_REG_FWD_PIC1_SEGMENT_E			BIT(0)
-#define G1_REG_DEC_CTRL7				0x02c
+#define G1_REG_DEC_CTRL7				G1_SWREG(11)
 #define     G1_REG_DEC_CTRL7_PINIT_RLIST_F15(x)		(((x) & 0x1f) << 25)
 #define     G1_REG_DEC_CTRL7_PINIT_RLIST_F14(x)		(((x) & 0x1f) << 20)
 #define     G1_REG_DEC_CTRL7_PINIT_RLIST_F13(x)		(((x) & 0x1f) << 15)
@@ -226,12 +232,12 @@
 #define     G1_REG_DEC_CTRL7_DCT5_START_BIT(x)		(((x) & 0x3f) << 12)
 #define     G1_REG_DEC_CTRL7_DCT6_START_BIT(x)		(((x) & 0x3f) << 6)
 #define     G1_REG_DEC_CTRL7_DCT7_START_BIT(x)		(((x) & 0x3f) << 0)
-#define G1_REG_ADDR_STR					0x030
-#define G1_REG_ADDR_DST					0x034
-#define G1_REG_ADDR_REF(i)				(0x038 + ((i) * 0x4))
+#define G1_REG_ADDR_STR					G1_SWREG(12)
+#define G1_REG_ADDR_DST					G1_SWREG(13)
+#define G1_REG_ADDR_REF(i)				(G1_SWREG(14) + ((i) * 0x4))
 #define     G1_REG_ADDR_REF_FIELD_E			BIT(1)
 #define     G1_REG_ADDR_REF_TOPC_E			BIT(0)
-#define G1_REG_REF_PIC(i)				(0x078 + ((i) * 0x4))
+#define G1_REG_REF_PIC(i)				(G1_SWREG(30) + ((i) * 0x4))
 #define     G1_REG_REF_PIC_FILT_TYPE_E			BIT(31)
 #define     G1_REG_REF_PIC_FILT_SHARPNESS(x)		(((x) & 0x7) << 28)
 #define     G1_REG_REF_PIC_MB_ADJ_0(x)			(((x) & 0x7f) << 21)
@@ -248,11 +254,11 @@
 #define     G1_REG_REF_PIC_QUANT_DELTA_1(x)		(((x) & 0x1f) << 22)
 #define     G1_REG_REF_PIC_QUANT_0(x)			(((x) & 0x7ff) << 11)
 #define     G1_REG_REF_PIC_QUANT_1(x)			(((x) & 0x7ff) << 0)
-#define G1_REG_LT_REF					0x098
-#define G1_REG_VALID_REF				0x09c
-#define G1_REG_ADDR_QTABLE				0x0a0
-#define G1_REG_ADDR_DIR_MV				0x0a4
-#define G1_REG_BD_REF_PIC(i)				(0x0a8 + ((i) * 0x4))
+#define G1_REG_LT_REF					G1_SWREG(38)
+#define G1_REG_VALID_REF				G1_SWREG(39)
+#define G1_REG_ADDR_QTABLE				G1_SWREG(40)
+#define G1_REG_ADDR_DIR_MV				G1_SWREG(41)
+#define G1_REG_BD_REF_PIC(i)				(G1_SWREG(42) + ((i) * 0x4))
 #define     G1_REG_BD_REF_PIC_BINIT_RLIST_B2(x)		(((x) & 0x1f) << 25)
 #define     G1_REG_BD_REF_PIC_BINIT_RLIST_F2(x)		(((x) & 0x1f) << 20)
 #define     G1_REG_BD_REF_PIC_BINIT_RLIST_B1(x)		(((x) & 0x1f) << 15)
@@ -269,7 +275,7 @@
 #define     G1_REG_BD_REF_PIC_QUANT_DELTA_3(x)		(((x) & 0x1f) << 22)
 #define     G1_REG_BD_REF_PIC_QUANT_2(x)		(((x) & 0x7ff) << 11)
 #define     G1_REG_BD_REF_PIC_QUANT_3(x)		(((x) & 0x7ff) << 0)
-#define G1_REG_BD_P_REF_PIC				0x0bc
+#define G1_REG_BD_P_REF_PIC				G1_SWREG(47)
 #define     G1_REG_BD_P_REF_PIC_QUANT_DELTA_4(x)	(((x) & 0x1f) << 27)
 #define     G1_REG_BD_P_REF_PIC_PINIT_RLIST_F3(x)	(((x) & 0x1f) << 25)
 #define     G1_REG_BD_P_REF_PIC_PINIT_RLIST_F2(x)	(((x) & 0x1f) << 20)
@@ -277,25 +283,25 @@
 #define     G1_REG_BD_P_REF_PIC_PINIT_RLIST_F0(x)	(((x) & 0x1f) << 10)
 #define     G1_REG_BD_P_REF_PIC_BINIT_RLIST_B15(x)	(((x) & 0x1f) << 5)
 #define     G1_REG_BD_P_REF_PIC_BINIT_RLIST_F15(x)	(((x) & 0x1f) << 0)
-#define G1_REG_ERR_CONC					0x0c0
+#define G1_REG_ERR_CONC					G1_SWREG(48)
 #define     G1_REG_ERR_CONC_STARTMB_X(x)		(((x) & 0x1ff) << 23)
 #define     G1_REG_ERR_CONC_STARTMB_Y(x)		(((x) & 0xff) << 15)
-#define G1_REG_PRED_FLT					0x0c4
+#define G1_REG_PRED_FLT					G1_SWREG(49)
 #define     G1_REG_PRED_FLT_PRED_BC_TAP_0_0(x)		(((x) & 0x3ff) << 22)
 #define     G1_REG_PRED_FLT_PRED_BC_TAP_0_1(x)		(((x) & 0x3ff) << 12)
 #define     G1_REG_PRED_FLT_PRED_BC_TAP_0_2(x)		(((x) & 0x3ff) << 2)
-#define G1_REG_REF_BUF_CTRL				0x0cc
+#define G1_REG_REF_BUF_CTRL				G1_SWREG(51)
 #define     G1_REG_REF_BUF_CTRL_REFBU_E			BIT(31)
 #define     G1_REG_REF_BUF_CTRL_REFBU_THR(x)		(((x) & 0xfff) << 19)
 #define     G1_REG_REF_BUF_CTRL_REFBU_PICID(x)		(((x) & 0x1f) << 14)
 #define     G1_REG_REF_BUF_CTRL_REFBU_EVAL_E		BIT(13)
 #define     G1_REG_REF_BUF_CTRL_REFBU_FPARMOD_E		BIT(12)
 #define     G1_REG_REF_BUF_CTRL_REFBU_Y_OFFSET(x)	(((x) & 0x1ff) << 0)
-#define G1_REG_REF_BUF_CTRL2				0x0dc
+#define G1_REG_REF_BUF_CTRL2				G1_SWREG(55)
 #define     G1_REG_REF_BUF_CTRL2_REFBU2_BUF_E		BIT(31)
 #define     G1_REG_REF_BUF_CTRL2_REFBU2_THR(x)		(((x) & 0xfff) << 19)
 #define     G1_REG_REF_BUF_CTRL2_REFBU2_PICID(x)	(((x) & 0x1f) << 14)
 #define     G1_REG_REF_BUF_CTRL2_APF_THRESHOLD(x)	(((x) & 0x3fff) << 0)
-#define G1_REG_SOFT_RESET				0x194
+#define G1_REG_SOFT_RESET				G1_SWREG(101)
 
 #endif /* HANTRO_G1_REGS_H_ */
-- 
2.22.0

