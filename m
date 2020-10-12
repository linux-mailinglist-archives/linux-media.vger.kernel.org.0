Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D540828C39C
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 23:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731903AbgJLU7v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 16:59:51 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49978 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729361AbgJLU7G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 16:59:06 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id BC7871F44C2B
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
Subject: [PATCH 15/18] media: hantro: add user-selectable, platform-selectable H264 High10
Date:   Mon, 12 Oct 2020 23:59:54 +0300
Message-Id: <20201012205957.889185-16-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012205957.889185-1-adrian.ratiu@collabora.com>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VPU cores starting with VC8000D feature a separate decoding mode named
"high10", capable of decoding both 8bit and 10bit streams, alongside the
previous (still supported) "normal / classic" h264 decoding mode.

The new kernel module param h264_high10 can be used to switch modes,
otherwise the driver will use the platform configured default.

Currently only 8bit decoding is implemented in the high10 mode.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 drivers/staging/media/hantro/hantro.h         |   7 +
 drivers/staging/media/hantro/hantro_drv.c     |  10 ++
 .../staging/media/hantro/hantro_g1_h264_dec.c | 142 ++++++++++++++----
 drivers/staging/media/hantro/hantro_hw.h      |  21 ++-
 .../staging/media/hantro/hantro_postproc.c    |   3 +-
 drivers/staging/media/hantro/hantro_regmap.c  |  36 +++++
 drivers/staging/media/hantro/hantro_regmap.h  |  17 +++
 drivers/staging/media/hantro/hantro_v4l2.c    |   3 +-
 8 files changed, 203 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 05e59bc83b71..70aeb11b1149 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -71,6 +71,7 @@ struct hantro_irq {
  * @num_clocks:			number of clocks in the array
  * @reg_names:			array of register range names
  * @num_regs:			number of register range names in the array
+ * @has_h264_high10:		platform has support for high10 decoding mode
  */
 struct hantro_variant {
 	unsigned int enc_offset;
@@ -91,6 +92,8 @@ struct hantro_variant {
 	int num_clocks;
 	const char * const *reg_names;
 	int num_regs;
+
+	bool has_h264_high10;
 };
 
 /**
@@ -177,6 +180,8 @@ hantro_vdev_to_func(struct video_device *vdev)
  *			shared with interrupt handlers.
  * @variant:		Hardware variant-specific parameters.
  * @watchdog_work:	Delayed work for hardware timeout handling.
+ *
+ * @h264_hw_mode:	H264 mode: legacy, high10 supported.
  */
 struct hantro_dev {
 	struct v4l2_device v4l2_dev;
@@ -200,6 +205,8 @@ struct hantro_dev {
 	spinlock_t irqlock;
 	const struct hantro_variant *variant;
 	struct delayed_work watchdog_work;
+
+	enum hantro_h264_hw_mode h264_hw_mode;
 };
 
 /**
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index e225515d6985..afb4e201fa42 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -32,6 +32,10 @@
 
 #define DRIVER_NAME "hantro-vpu"
 
+static bool hantro_h264_high10 = true;
+module_param_named(h264_high10, hantro_h264_high10, bool, 0444);
+MODULE_PARM_DESC(h264_high10, "Enable High10 decoding mode");
+
 int hantro_debug;
 module_param_named(debug, hantro_debug, int, 0644);
 MODULE_PARM_DESC(debug,
@@ -824,6 +828,12 @@ static int hantro_probe(struct platform_device *pdev)
 		goto err_clk_unprepare;
 	}
 
+	/* Small quirk: check if H264 High10 mode can be used */
+	if (hantro_h264_high10 && vpu->variant->has_h264_high10)
+		vpu->h264_hw_mode = HANTRO_H264_HIGH10;
+	else
+		vpu->h264_hw_mode = HANTRO_H264_LEGACY;
+
 	pm_runtime_set_autosuspend_delay(vpu->dev, 100);
 	pm_runtime_use_autosuspend(vpu->dev);
 	pm_runtime_enable(vpu->dev);
diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index a04cb616d628..e64b59c84111 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -2,6 +2,8 @@
 /*
  * Rockchip RK3288 VPU codec driver
  *
+ * Copyright (c) 2020 Collabora, Ltd.
+ *
  * Copyright (c) 2014 Rockchip Electronics Co., Ltd.
  *	Hertz Wong <hertz.wong@rock-chips.com>
  *	Herman Chen <herman.chen@rock-chips.com>
@@ -10,6 +12,7 @@
  *	Tomasz Figa <tfiga@chromium.org>
  */
 
+#include <linux/moduleparam.h>
 #include <linux/types.h>
 #include <linux/sort.h>
 
@@ -20,6 +23,8 @@
 #include "hantro_v4l2.h"
 #include "hantro_regmap.h"
 
+/* TODO: remove this harcoded pixel size when adding 10bit streams */
+#define VC8KD_PIXEL_SIZE 8
 #define VC8KD_TIMEOUT 0x500000
 
 extern struct regmap_config hantro_regmap_dec;
@@ -30,7 +35,6 @@ static void set_params(struct hantro_ctx *ctx)
 	const struct v4l2_ctrl_h264_decode_params *dec_param = ctrls->decode;
 	const struct v4l2_ctrl_h264_sps *sps = ctrls->sps;
 	const struct v4l2_ctrl_h264_pps *pps = ctrls->pps;
-	struct vb2_v4l2_buffer *src_buf = hantro_get_src_buf(ctx);
 	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_regmap_fields_dec *fields = vpu->reg_fields_dec;
 	u32 width = MB_WIDTH(ctx->src_fmt.width);
@@ -40,8 +44,26 @@ static void set_params(struct hantro_ctx *ctx)
 	regmap_field_write(fields->dec_axi_wr_id, 0x0);
 
 	if (vpu->core_hw_dec_rev == HANTRO_VC8000_REV) {
-		/* stride should be computed in hantro_try_fmt() and set here */
-		stride = width * 4 * 16;
+		/*
+		 * TODO: For now we only support 8bit pixel depth even in high10
+		 * decoding mode, so this is why PIXEL_SIZE is always defined 8
+		 */
+		regmap_field_write(fields->dec_bit_depth_c_minus8,
+				   VC8KD_PIXEL_SIZE - 8);
+		regmap_field_write(fields->dec_bit_depth_y_minus8,
+				   VC8KD_PIXEL_SIZE - 8);
+
+		regmap_field_write(fields->dec_pic_height_4x4,
+				   ctx->src_fmt.height / 4);
+		regmap_field_write(fields->dec_pic_width_4x4,
+				   ctx->src_fmt.width / 4);
+
+		/*
+		 * This depends on tiled_stride_enable.
+		 * It's a weird math, we still don't know
+		 * what's the rationale.
+		 */
+		stride = width * MB_DIM * 4;
 		regmap_field_write(fields->dec_out_y_stride, stride);
 		regmap_field_write(fields->dec_out_c_stride, stride);
 
@@ -93,8 +115,6 @@ static void set_params(struct hantro_ctx *ctx)
 	regmap_field_write(fields->dec_start_code_e, 1);
 	regmap_field_write(fields->dec_init_qp,
 			   pps->pic_init_qp_minus26 + 26);
-	regmap_field_write(fields->dec_stream_len,
-			   vb2_get_plane_payload(&src_buf->vb2_buf, 0));
 
 	/* Decoder control register 4. */
 	reg = G1_REG_DEC_CTRL4_FRAMENUM_LEN(sps->log2_max_frame_num_minus4 + 4) |
@@ -111,8 +131,7 @@ static void set_params(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL4);
 
 	/* Decoder control register 5. */
-	reg = G1_REG_DEC_CTRL5_REFPIC_MK_LEN(dec_param->dec_ref_pic_marking_bit_size) |
-	      G1_REG_DEC_CTRL5_IDR_PIC_ID(dec_param->idr_pic_id);
+	reg = G1_REG_DEC_CTRL5_REFPIC_MK_LEN(dec_param->dec_ref_pic_marking_bit_size);
 	if (pps->flags & V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED)
 		reg |= G1_REG_DEC_CTRL5_CONST_INTRA_E;
 	if (pps->flags & V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT)
@@ -125,6 +144,8 @@ static void set_params(struct hantro_ctx *ctx)
 		reg |= G1_REG_DEC_CTRL5_IDR_PIC_E;
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL5);
 
+	regmap_field_write(fields->dec_idr_pic_id_h10, dec_param->idr_pic_id);
+
 	/* Decoder control register 6. */
 	reg = G1_REG_DEC_CTRL6_PPS_ID(pps->pic_parameter_set_id) |
 	      G1_REG_DEC_CTRL6_REFIDX0_ACTIVE(pps->num_ref_idx_l0_default_active_minus1 + 1) |
@@ -149,11 +170,46 @@ static void set_params(struct hantro_ctx *ctx)
 	regmap_field_write(fields->dec_apf_threshold, 8);
 }
 
+static size_t get_mv_offset(struct hantro_ctx *ctx)
+{
+	const struct hantro_h264_dec_ctrls *ctrls = &ctx->h264_dec.ctrls;
+	u32 bytes_per_mb = 384;
+	size_t mv_offset = 0;
+
+	/* DMV buffer for monochrome start directly after Y-plane */
+	if (ctrls->sps->profile_idc >= 100 &&
+	    ctrls->sps->chroma_format_idc == 0)
+		bytes_per_mb = 256;
+
+	mv_offset = bytes_per_mb * MB_WIDTH(ctx->src_fmt.width) *
+		MB_HEIGHT(ctx->src_fmt.height) * (VC8KD_PIXEL_SIZE / 8);
+
+	/*
+	 * Allocate 32 bytes for multicore status fields
+	 * locate it after picture and before direct MV.
+	 * TODO: This should be constrained to multicore?
+	 */
+	mv_offset += 32;
+
+	/*
+	 * DMV buffer is split in two for field encoded frames,
+	 * adjust offset for bottom field
+	 */
+	if (ctrls->decode->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD)
+		mv_offset += 32 * MB_WIDTH(ctx->src_fmt.width) *
+			MB_HEIGHT(ctx->src_fmt.height);
+
+	return mv_offset;
+}
+
 static void set_ref(struct hantro_ctx *ctx)
 {
 	struct v4l2_h264_dpb_entry *dpb = ctx->h264_dec.dpb;
 	const u8 *b0_reflist, *b1_reflist, *p_reflist;
 	struct hantro_dev *vpu = ctx->dev;
+	const struct hantro_h264_dec_ctrls *ctrls = &ctx->h264_dec.ctrls;
+	struct hantro_regmap_fields_dec *fields = vpu->reg_fields_dec;
+	bool do_high10 = (vpu->h264_hw_mode == HANTRO_H264_HIGH10);
 	u32 dpb_longterm = 0;
 	u32 dpb_valid = 0;
 	int reg_num;
@@ -200,7 +256,7 @@ static void set_ref(struct hantro_ctx *ctx)
 	p_reflist = ctx->h264_dec.reflists.p;
 
 	/*
-	 * Each G1_REG_BD_REF_PIC(x) register contains three entries
+	 * Each REG_BD_REF_PIC(x) register contains three entries
 	 * of each forward and backward picture list.
 	 */
 	reg_num = 0;
@@ -211,7 +267,7 @@ static void set_ref(struct hantro_ctx *ctx)
 		      G1_REG_BD_REF_PIC_BINIT_RLIST_B0(b1_reflist[i]) |
 		      G1_REG_BD_REF_PIC_BINIT_RLIST_B1(b1_reflist[i + 1]) |
 		      G1_REG_BD_REF_PIC_BINIT_RLIST_B2(b1_reflist[i + 2]);
-		vdpu_write_relaxed(vpu, reg, G1_REG_BD_REF_PIC(reg_num++));
+		vdpu_write_relaxed(vpu, reg, REG_BD_REF_PIC(reg_num++));
 	}
 
 	/*
@@ -219,14 +275,19 @@ static void set_ref(struct hantro_ctx *ctx)
 	 * of forward and backward reference picture lists and first 4 entries
 	 * of P forward picture list.
 	 */
-	reg = G1_REG_BD_P_REF_PIC_BINIT_RLIST_F15(b0_reflist[15]) |
-	      G1_REG_BD_P_REF_PIC_BINIT_RLIST_B15(b1_reflist[15]) |
-	      G1_REG_BD_P_REF_PIC_PINIT_RLIST_F0(p_reflist[0]) |
+	reg = G1_REG_BD_P_REF_PIC_PINIT_RLIST_F0(p_reflist[0]) |
 	      G1_REG_BD_P_REF_PIC_PINIT_RLIST_F1(p_reflist[1]) |
 	      G1_REG_BD_P_REF_PIC_PINIT_RLIST_F2(p_reflist[2]) |
 	      G1_REG_BD_P_REF_PIC_PINIT_RLIST_F3(p_reflist[3]);
 	vdpu_write_relaxed(vpu, reg, G1_REG_BD_P_REF_PIC);
 
+	/*
+	 * The last fw/bw refpic lists (index 15) have actually moved register
+	 * locations between decoder revisions, so set them using regmap fields
+	 */
+	regmap_field_write(fields->dec_init_rlist_f15, b0_reflist[15]);
+	regmap_field_write(fields->dec_init_rlist_b15, b1_reflist[15]);
+
 	/*
 	 * Each G1_REG_FWD_PIC(x) register contains six consecutive
 	 * entries of P forward picture list, starting from index 4.
@@ -246,6 +307,22 @@ static void set_ref(struct hantro_ctx *ctx)
 	for (i = 0; i < HANTRO_H264_DPB_SIZE; i++) {
 		dma_addr_t dma_addr = hantro_h264_get_ref_buf(ctx, i);
 		vdpu_write_relaxed(vpu, dma_addr, REG_ADDR_REF(i));
+
+		if (vpu->core_hw_dec_rev == HANTRO_VC8000_REV) {
+			if (ctrls->sps->profile_idc > 66) {
+				size_t mv_offset = get_mv_offset(ctx);
+
+				vdpu_write_relaxed(vpu, dma_addr + mv_offset,
+						   REG_DMV_REF(i));
+			}
+
+			if (do_high10) {
+				size_t chroma_offset = ctx->src_fmt.width *
+					ctx->src_fmt.height;
+				vdpu_write_relaxed(vpu, dma_addr + chroma_offset,
+						   REG_CHR_REF(i));
+			}
+		}
 	}
 }
 
@@ -255,15 +332,26 @@ static void set_buffers(struct hantro_ctx *ctx)
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_regmap_fields_dec *fields = vpu->reg_fields_dec;
+	bool do_high10 = (vpu->h264_hw_mode == HANTRO_H264_HIGH10);
 	dma_addr_t src_dma, dst_dma;
 	size_t offset = 0;
+	u32 src_len, src_buf_len;
 
 	src_buf = hantro_get_src_buf(ctx);
 	dst_buf = hantro_get_dst_buf(ctx);
 
 	/* Source (stream) buffer. */
 	src_dma = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
+	src_len = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
+
 	regmap_field_write(fields->dec_addr_str, src_dma);
+	regmap_field_write(fields->dec_stream_len, src_len);
+
+	if (do_high10) {
+		src_buf_len = vb2_plane_size(&src_buf->vb2_buf, 0);
+		regmap_field_write(fields->dec_strm_buffer_len, src_buf_len);
+		regmap_field_write(fields->dec_strm_start_offset, 0);
+	}
 
 	/* Destination (decoded frame) buffer. */
 	dst_dma = hantro_get_dec_buf_addr(ctx, &dst_buf->vb2_buf);
@@ -272,27 +360,18 @@ static void set_buffers(struct hantro_ctx *ctx)
 		offset = ALIGN(ctx->src_fmt.width, MB_DIM);
 	regmap_field_write(fields->dec_addr_dst, dst_dma + offset);
 
-	/* Higher profiles require DMV buffer appended to reference frames. */
-	if (ctrls->sps->profile_idc > 66 && ctrls->decode->nal_ref_idc) {
-		unsigned int bytes_per_mb = 384;
-
-		/* DMV buffer for monochrome start directly after Y-plane */
-		if (ctrls->sps->profile_idc >= 100 &&
-		    ctrls->sps->chroma_format_idc == 0)
-			bytes_per_mb = 256;
-		offset = bytes_per_mb * MB_WIDTH(ctx->src_fmt.width) *
-			 MB_HEIGHT(ctx->src_fmt.height);
+	if (do_high10) {
+		size_t chroma_offset = ctx->src_fmt.width * ctx->src_fmt.height;
 
-		/*
-		 * DMV buffer is split in two for field encoded frames,
-		 * adjust offset for bottom field
-		 */
-		if (ctrls->decode->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD)
-			offset += 32 * MB_WIDTH(ctx->src_fmt.width) *
-				  MB_HEIGHT(ctx->src_fmt.height);
-		regmap_field_write(fields->dec_addr_dir_mv, dst_dma + offset);
+		regmap_field_write(fields->dec_addr_dst_chr,
+				   dst_dma + chroma_offset);
 	}
 
+	/* Higher profiles require DMV buffer appended to reference frames. */
+	if (ctrls->sps->profile_idc > 66 && ctrls->decode->nal_ref_idc)
+		regmap_field_write(fields->dec_addr_dir_mv,
+				   dst_dma + get_mv_offset(ctx));
+
 	/* Auxiliary buffer prepared in hantro_g1_h264_dec_prepare_table(). */
 	regmap_field_write(fields->dec_addr_qtable, ctx->h264_dec.priv.dma);
 }
@@ -301,6 +380,7 @@ void hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_regmap_fields_dec *fields = vpu->reg_fields_dec;
+	bool do_high10 = (vpu->h264_hw_mode == HANTRO_H264_HIGH10);
 	int reg;
 
 	/* Prepare the H264 decoder context. */
@@ -332,6 +412,8 @@ void hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
 		regmap_field_write(fields->dec_buswidth, 2);
 		regmap_field_write(fields->dec_tab_swap, 3);
 		regmap_field_write(fields->dec_tiled_mode_lsb, 1);
+		regmap_field_write(fields->dec_ref_compress_bypass, 1);
+		regmap_field_write(fields->dec_mode, do_high10 ? 0xf : 0x0);
 		break;
 	}
 
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index e0039a15fe85..7a79d6c8e4e1 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -49,6 +49,11 @@ struct hantro_jpeg_enc_hw_ctx {
 	struct hantro_aux_buf bounce_buffer;
 };
 
+enum hantro_h264_hw_mode {
+	HANTRO_H264_LEGACY,
+	HANTRO_H264_HIGH10,
+};
+
 /* Max. number of entries in the DPB (HW limitation). */
 #define HANTRO_H264_DPB_SIZE		16
 
@@ -178,8 +183,11 @@ int hantro_h264_dec_init(struct hantro_ctx *ctx);
 void hantro_h264_dec_exit(struct hantro_ctx *ctx);
 
 static inline size_t
-hantro_h264_mv_size(unsigned int width, unsigned int height)
+hantro_h264_mv_size(unsigned int width, unsigned int height,
+		    enum hantro_h264_hw_mode hw_mode)
 {
+	unsigned int mv_bytes_per_mb;
+
 	/*
 	 * A decoded 8-bit 4:2:0 NV12 frame may need memory for up to
 	 * 448 bytes per macroblock with additional 32 bytes on
@@ -196,12 +204,17 @@ hantro_h264_mv_size(unsigned int width, unsigned int height)
 	 * +---------------------------+
 	 * | UV-plane  128 bytes x MBs |
 	 * +---------------------------+
-	 * | MV buffer  64 bytes x MBs |
-	 * +---------------------------+
 	 * | MC sync          32 bytes |
 	 * +---------------------------+
+	 * | MV buffer  64 bytes x MBs |
+	 * +---------------------------+
 	 */
-	return 64 * MB_WIDTH(width) * MB_WIDTH(height) + 32;
+	if (hw_mode == HANTRO_H264_LEGACY)
+		mv_bytes_per_mb = 64;
+	else
+		mv_bytes_per_mb = 80;
+
+	return mv_bytes_per_mb * MB_WIDTH(width) * MB_WIDTH(height) + 32;
 }
 
 void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
index 653bae37eed9..893f226ec301 100644
--- a/drivers/staging/media/hantro/hantro_postproc.c
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -156,7 +156,8 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
 
 	buf_size = ctx->dst_fmt.plane_fmt[0].sizeimage +
 		   hantro_h264_mv_size(ctx->dst_fmt.width,
-				       ctx->dst_fmt.height);
+				       ctx->dst_fmt.height,
+				       vpu->h264_hw_mode);
 
 	for (i = 0; i < num_buffers; ++i) {
 		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
diff --git a/drivers/staging/media/hantro/hantro_regmap.c b/drivers/staging/media/hantro/hantro_regmap.c
index b87fe809f2f7..62280b873859 100644
--- a/drivers/staging/media/hantro/hantro_regmap.c
+++ b/drivers/staging/media/hantro/hantro_regmap.c
@@ -42,6 +42,7 @@ struct hantro_field_dec {
 	struct reg_field cfg_dec_dirmv_swap;
 	struct reg_field cfg_dec_mode;
 	struct reg_field cfg_dec_buffer_empty_int_e;
+	struct reg_field cfg_dec_ref_compress_bypass;
 	struct reg_field cfg_dec_max_burst;
 	struct reg_field cfg_dec_buswidth;
 	struct reg_field cfg_dec_apf_threshold;
@@ -54,6 +55,7 @@ struct hantro_field_dec {
 	struct reg_field cfg_dec_scaling_list_e;
 	struct reg_field cfg_dec_addr_str;
 	struct reg_field cfg_dec_addr_dst;
+	struct reg_field cfg_dec_addr_dst_chr;
 	struct reg_field cfg_dec_ilace_mode;
 	struct reg_field cfg_dec_addr_qtable;
 	struct reg_field cfg_dec_max_cb_size;
@@ -61,6 +63,7 @@ struct hantro_field_dec {
 	struct reg_field cfg_dec_out_y_stride;
 	struct reg_field cfg_dec_out_c_stride;
 	struct reg_field cfg_dec_addr_dir_mv;
+	struct reg_field cfg_dec_idr_pic_id_h10;
 	struct reg_field cfg_dec_tiled_mode_lsb;
 	struct reg_field cfg_dec_clk_gate_e;
 	struct reg_field cfg_dec_tab_swap;
@@ -68,6 +71,14 @@ struct hantro_field_dec {
 	struct reg_field cfg_dec_ext_timeout_e;
 	struct reg_field cfg_dec_timeout_cycles;
 	struct reg_field cfg_dec_timeout_e;
+	struct reg_field cfg_dec_strm_start_offset;
+	struct reg_field cfg_dec_strm_buffer_len;
+	struct reg_field cfg_dec_bit_depth_y_minus8;
+	struct reg_field cfg_dec_bit_depth_c_minus8;
+	struct reg_field cfg_dec_init_rlist_b15;
+	struct reg_field cfg_dec_init_rlist_f15;
+	struct reg_field cfg_dec_pic_height_4x4;
+	struct reg_field cfg_dec_pic_width_4x4;
 
 	struct reg_field cfg_pp_pipeline_en;
 	struct reg_field cfg_pp_max_burst;
@@ -128,6 +139,9 @@ static const struct hantro_field_dec g1_field = {
 	.cfg_dec_ilace_mode =		REG_FIELD(SWREG(13), 1, 1),
 	.cfg_dec_addr_qtable =		REG_FIELD(SWREG(40), 0, 31),
 	.cfg_dec_addr_dir_mv =		REG_FIELD(SWREG(41), 0, 31),
+	.cfg_dec_idr_pic_id_h10 =	REG_FIELD(SWREG(8), 0, 15),
+	.cfg_dec_init_rlist_f15 =	REG_FIELD(SWREG(47), 0, 4),
+	.cfg_dec_init_rlist_b15 =	REG_FIELD(SWREG(47), 5, 9),
 	.cfg_pp_pipeline_en =		REG_FIELD(SWREG(60), 1, 1),
 	.cfg_pp_max_burst =		REG_FIELD(SWREG(61), 0, 4),
 	.cfg_pp_out_swap32 =		REG_FIELD(SWREG(61), 5, 5),
@@ -166,6 +180,7 @@ static const struct hantro_field_dec vc8000d_field = {
 	.cfg_dec_dirmv_swap =		REG_FIELD(SWREG(2), 20, 23),
 	.cfg_dec_mode =			REG_FIELD(SWREG(3), 27, 31),
 	.cfg_dec_buffer_empty_int_e =	REG_FIELD(SWREG(3), 2, 2),
+	.cfg_dec_ref_compress_bypass =	REG_FIELD(SWREG(3), 8, 8),
 	.cfg_dec_max_burst =		REG_FIELD(SWREG(58), 0, 7),
 	.cfg_dec_buswidth =		REG_FIELD(SWREG(58), 8, 10),
 	.cfg_dec_apf_threshold =	REG_FIELD(SWREG(55), 0, 15),
@@ -178,9 +193,11 @@ static const struct hantro_field_dec vc8000d_field = {
 	.cfg_dec_scaling_list_e =	REG_FIELD(SWREG(5), 24, 24),
 	.cfg_dec_addr_str =		REG_FIELD(SWREG(169), 0, 31),
 	.cfg_dec_addr_dst =		REG_FIELD(SWREG(65), 0, 31),
+	.cfg_dec_addr_dst_chr =		REG_FIELD(SWREG(99), 0, 31),
 	.cfg_dec_ilace_mode =		REG_FIELD(SWREG(65), 1, 1),
 	.cfg_dec_addr_qtable =		REG_FIELD(SWREG(175), 0, 31),
 	.cfg_dec_addr_dir_mv =		REG_FIELD(SWREG(133), 0, 31),
+	.cfg_dec_idr_pic_id_h10 =	REG_FIELD(SWREG(12), 16, 31),
 	.cfg_dec_max_cb_size =		REG_FIELD(SWREG(12), 10, 12),
 	.cfg_dec_min_cb_size =		REG_FIELD(SWREG(12), 13, 15),
 	.cfg_dec_out_y_stride =		REG_FIELD(SWREG(314), 16, 31),
@@ -189,6 +206,14 @@ static const struct hantro_field_dec vc8000d_field = {
 	.cfg_dec_ext_timeout_e =	REG_FIELD(SWREG(318), 31, 31),
 	.cfg_dec_timeout_cycles =	REG_FIELD(SWREG(319), 0, 30),
 	.cfg_dec_timeout_e =		REG_FIELD(SWREG(319), 31, 31),
+	.cfg_dec_strm_buffer_len =	REG_FIELD(SWREG(258), 0, 31),
+	.cfg_dec_strm_start_offset =	REG_FIELD(SWREG(259), 0, 31),
+	.cfg_dec_bit_depth_y_minus8 =	REG_FIELD(SWREG(8), 6, 7),
+	.cfg_dec_bit_depth_c_minus8 =	REG_FIELD(SWREG(8), 4, 5),
+	.cfg_dec_init_rlist_f15 =	REG_FIELD(SWREG(19), 0, 4),
+	.cfg_dec_init_rlist_b15 =	REG_FIELD(SWREG(19), 5, 9),
+	.cfg_dec_pic_height_4x4 =	REG_FIELD(SWREG(20), 0, 11),
+	.cfg_dec_pic_width_4x4 =	REG_FIELD(SWREG(20), 16, 27),
 	.cfg_pp_pipeline_en =		REG_FIELD(SWREG(320), 0, 0),
 	.cfg_pp_out_tile_e =		REG_FIELD(SWREG(320), 3, 3),
 	.cfg_pp_output_fmt =		REG_FIELD(SWREG(322), 18, 22),
@@ -245,6 +270,7 @@ static int hantro_regmap_fields_init_dec(struct hantro_dev *vpu,
 	INIT_DEC_FIELD(dec_dirmv_swap);
 	INIT_DEC_FIELD(dec_mode);
 	INIT_DEC_FIELD(dec_buffer_empty_int_e);
+	INIT_DEC_FIELD(dec_ref_compress_bypass);
 	INIT_DEC_FIELD(dec_max_burst);
 	INIT_DEC_FIELD(dec_buswidth);
 	INIT_DEC_FIELD(dec_apf_threshold);
@@ -257,6 +283,7 @@ static int hantro_regmap_fields_init_dec(struct hantro_dev *vpu,
 	INIT_DEC_FIELD(dec_scaling_list_e);
 	INIT_DEC_FIELD(dec_addr_str);
 	INIT_DEC_FIELD(dec_addr_dst);
+	INIT_DEC_FIELD(dec_addr_dst_chr);
 	INIT_DEC_FIELD(dec_ilace_mode);
 	INIT_DEC_FIELD(dec_addr_qtable);
 	INIT_DEC_FIELD(dec_max_cb_size);
@@ -264,6 +291,7 @@ static int hantro_regmap_fields_init_dec(struct hantro_dev *vpu,
 	INIT_DEC_FIELD(dec_out_y_stride);
 	INIT_DEC_FIELD(dec_out_c_stride);
 	INIT_DEC_FIELD(dec_addr_dir_mv);
+	INIT_DEC_FIELD(dec_idr_pic_id_h10);
 	INIT_DEC_FIELD(dec_tiled_mode_lsb);
 	INIT_DEC_FIELD(dec_clk_gate_e);
 	INIT_DEC_FIELD(dec_tab_swap);
@@ -271,6 +299,14 @@ static int hantro_regmap_fields_init_dec(struct hantro_dev *vpu,
 	INIT_DEC_FIELD(dec_ext_timeout_e);
 	INIT_DEC_FIELD(dec_timeout_cycles);
 	INIT_DEC_FIELD(dec_timeout_e);
+	INIT_DEC_FIELD(dec_strm_buffer_len);
+	INIT_DEC_FIELD(dec_strm_start_offset);
+	INIT_DEC_FIELD(dec_bit_depth_c_minus8);
+	INIT_DEC_FIELD(dec_bit_depth_y_minus8);
+	INIT_DEC_FIELD(dec_init_rlist_b15);
+	INIT_DEC_FIELD(dec_init_rlist_f15);
+	INIT_DEC_FIELD(dec_pic_height_4x4);
+	INIT_DEC_FIELD(dec_pic_width_4x4);
 
 	/* Post-processor */
 	INIT_DEC_FIELD(pp_pipeline_en);
diff --git a/drivers/staging/media/hantro/hantro_regmap.h b/drivers/staging/media/hantro/hantro_regmap.h
index 0a39bae83f85..083c4e92c4bd 100644
--- a/drivers/staging/media/hantro/hantro_regmap.h
+++ b/drivers/staging/media/hantro/hantro_regmap.h
@@ -17,9 +17,15 @@
 #define SWREG_ITER_G1(n, i)	(SWREG(n) + ((i) << 2))
 #define SWREG_ITER_VC8000(n, i)	(SWREG(n) + ((i) << 3))
 
+#define REG_CHR_REF(i)		(SWREG_ITER_VC8000(101, i))
+#define REG_DMV_REF(i)		(SWREG_ITER_VC8000(135, i))
+
 #define REG_ADDR_REF(i)		(vpu->core_hw_dec_rev == HANTRO_G1_REV ? \
 				 SWREG_ITER_G1(14, i) : \
 				 SWREG_ITER_VC8000(67, i))
+#define REG_BD_REF_PIC(i)	(vpu->core_hw_dec_rev == HANTRO_G1_REV ? \
+				 SWREG_ITER_G1(42, i) : \
+				 SWREG_ITER_VC8000(14, i))
 
 struct hantro_regmap_fields_dec {
 	/* Decoder */
@@ -32,6 +38,7 @@ struct hantro_regmap_fields_dec {
 	struct regmap_field *dec_dirmv_swap;
 	struct regmap_field *dec_mode;
 	struct regmap_field *dec_buffer_empty_int_e;
+	struct regmap_field *dec_ref_compress_bypass;
 	struct regmap_field *dec_buswidth;
 	struct regmap_field *dec_apf_threshold;
 	struct regmap_field *dec_stream_len;
@@ -43,6 +50,7 @@ struct hantro_regmap_fields_dec {
 	struct regmap_field *dec_scaling_list_e;
 	struct regmap_field *dec_addr_str;
 	struct regmap_field *dec_addr_dst;
+	struct regmap_field *dec_addr_dst_chr;
 	struct regmap_field *dec_ilace_mode;
 	struct regmap_field *dec_addr_qtable;
 	struct regmap_field *dec_max_cb_size;
@@ -50,6 +58,7 @@ struct hantro_regmap_fields_dec {
 	struct regmap_field *dec_out_y_stride;
 	struct regmap_field *dec_out_c_stride;
 	struct regmap_field *dec_addr_dir_mv;
+	struct regmap_field *dec_idr_pic_id_h10;
 	struct regmap_field *dec_tiled_mode_lsb;
 	struct regmap_field *dec_clk_gate_e;
 	struct regmap_field *dec_tab_swap;
@@ -57,6 +66,14 @@ struct hantro_regmap_fields_dec {
 	struct regmap_field *dec_ext_timeout_e;
 	struct regmap_field *dec_timeout_cycles;
 	struct regmap_field *dec_timeout_e;
+	struct regmap_field *dec_strm_buffer_len;
+	struct regmap_field *dec_strm_start_offset;
+	struct regmap_field *dec_bit_depth_y_minus8;
+	struct regmap_field *dec_bit_depth_c_minus8;
+	struct regmap_field *dec_init_rlist_b15;
+	struct regmap_field *dec_init_rlist_f15;
+	struct regmap_field *dec_pic_height_4x4;
+	struct regmap_field *dec_pic_width_4x4;
 
 	/* Post-processor */
 	struct regmap_field *pp_pipeline_en;
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index b668a82d40ad..dc811e256181 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -282,7 +282,8 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 		    !hantro_needs_postproc(ctx, fmt))
 			pix_mp->plane_fmt[0].sizeimage +=
 				hantro_h264_mv_size(pix_mp->width,
-						    pix_mp->height);
+						    pix_mp->height,
+						    ctx->dev->h264_hw_mode);
 	} else if (!pix_mp->plane_fmt[0].sizeimage) {
 		/*
 		 * For coded formats the application can specify
-- 
2.28.0

