Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7902C65C499
	for <lists+linux-media@lfdr.de>; Tue,  3 Jan 2023 18:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238478AbjACRFK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 12:05:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238413AbjACREb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 12:04:31 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8FAF13F1F;
        Tue,  3 Jan 2023 09:01:27 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:abfa:cf23:1e4e:2b14])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 3FEFE6602CFD;
        Tue,  3 Jan 2023 17:01:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1672765274;
        bh=UOFp27yvre1aq3ziZvO40L0q48EL0n336rPS+9ycxeY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=feScdFmFQa5uCJ120BngBRUi3Ql/CR40UWLBWUIk2Hl1v2rBjmftz7qzLquCsO7pG
         fT7TK/zYEqnojnuRaUZQWb4GKESURb/1DKXlVQWN1c8ppyyzko7Jc6zG3ZDUMLQsNt
         /qSUE0qrPyV2r1trpZH9kZWS0zNEqXKqWwijeOnI0IsPsdBmFltCJRDnqAJREkQ5Uk
         bffeLw0+J5WRFpVQNGd6+4LMh7/osiTg9ofWVBKnA3cOfs5rQNXCIx/N7f3RcBrwHI
         j7PgZOjPek0urVymPNjVQqxDWyhPiuUPnmfqiU4aMPHSoanNCOFlHzYjm50Ajgn07w
         +4Nh9UjEOE6aQ==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        daniel.almeida@collabora.com, nicolas.dufresne@collabora.co.uk
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 10/13] media: verisilicon: Add Rockchip AV1 decoder
Date:   Tue,  3 Jan 2023 18:00:55 +0100
Message-Id: <20230103170058.810597-11-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103170058.810597-1-benjamin.gaignard@collabora.com>
References: <20230103170058.810597-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement AV1 stateless decoder for rockchip VPU981.
It decode 8 and 10 bits AV1 bitstreams.
AV1 scaling feature is done by the postprocessor.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/Makefile   |    1 +
 .../media/platform/verisilicon/hantro_hw.h    |   65 +-
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 2065 +++++++++++++++++
 .../verisilicon/rockchip_vpu981_regs.h        |  477 ++++
 4 files changed, 2606 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
 create mode 100644 drivers/media/platform/verisilicon/rockchip_vpu981_regs.h

diff --git a/drivers/media/platform/verisilicon/Makefile b/drivers/media/platform/verisilicon/Makefile
index d2b2679c00eb..c9a9806ab8c5 100644
--- a/drivers/media/platform/verisilicon/Makefile
+++ b/drivers/media/platform/verisilicon/Makefile
@@ -18,6 +18,7 @@ hantro-vpu-y += \
 		rockchip_vpu2_hw_h264_dec.o \
 		rockchip_vpu2_hw_mpeg2_dec.o \
 		rockchip_vpu2_hw_vp8_dec.o \
+		rockchip_vpu981_hw_av1_dec.o \
 		rockchip_av1_entropymode.o \
 		hantro_jpeg.o \
 		hantro_h264.o \
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index e395aeeae2f4..6b2e813c95c8 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -37,6 +37,8 @@
 
 #define NUM_REF_PICTURES	(V4L2_HEVC_DPB_ENTRIES_NUM_MAX + 1)
 
+#define AV1_MAX_FRAME_BUF_COUNT	(V4L2_AV1_TOTAL_REFS_PER_FRAME + 1)
+
 struct hantro_dev;
 struct hantro_ctx;
 struct hantro_buf;
@@ -250,23 +252,82 @@ struct hantro_vp9_dec_hw_ctx {
 };
 
 /**
- * hantro_av1_dec_hw_ctx
+ * struct hantro_av1_dec_ctrls
+ * @sequence:		AV1 Sequence
+ * @tile_group_entry:	AV1 Tile Group entry
+ * @frame:		AV1 Frame Header OBU
+ * @film_grain:		AV1 Film Grain
+ */
+struct hantro_av1_dec_ctrls {
+	const struct v4l2_ctrl_av1_sequence *sequence;
+	const struct v4l2_ctrl_av1_tile_group_entry *tile_group_entry;
+	const struct v4l2_ctrl_av1_frame *frame;
+	const struct v4l2_ctrl_av1_film_grain *film_grain;
+};
+
+struct hantro_av1_frame_ref {
+	int width;
+	int height;
+	int mi_cols;
+	int mi_rows;
+	u64 timestamp;
+	enum v4l2_av1_frame_type frame_type;
+	bool used;
+	u32 order_hint;
+	u32 order_hints[V4L2_AV1_TOTAL_REFS_PER_FRAME];
+	int gm_mode;
+	struct vb2_v4l2_buffer *vb2_ref;
+};
+
+/**
+ * struct hantro_av1_dec_hw_ctx
+ * @db_data_col:	db tile col data buffer
+ * @db_ctrl_col:	db tile col ctrl buffer
+ * @cdef_col:		cdef tile col buffer
+ * @sr_col:		sr tile col buffer
+ * @lr_col:		lr tile col buffer
+ * @global_model:	global model buffer
+ * @tile_info:		tile info buffer
+ * @segment:		segmentation info buffer
+ * @prob_tbl:		probability table
+ * @prob_tbl_out:	probability table output
+ * @tile_buf:		tile buffer
+ * @ctrls:		V4L2 controls attached to a run
+ * @frame_refs:		reference frames info slots
+ * @ref_frame_sign_bias: array of sign bias
+ * @num_tile_cols_allocated: number of allocated tiles
  * @cdfs:		current probabilities structure
  * @cdfs_ndvc:		current mv probabilities structure
  * @default_cdfs:	default probabilities structure
  * @default_cdfs_ndvc:	default mv probabilties structure
  * @cdfs_last:		stored probabilities structures
  * @cdfs_last_ndvc:	stored mv probabilities structures
+ * @current_frame_index: index of the current in frame_refs array
  */
 struct hantro_av1_dec_hw_ctx {
+	struct hantro_aux_buf db_data_col;
+	struct hantro_aux_buf db_ctrl_col;
+	struct hantro_aux_buf cdef_col;
+	struct hantro_aux_buf sr_col;
+	struct hantro_aux_buf lr_col;
+	struct hantro_aux_buf global_model;
+	struct hantro_aux_buf tile_info;
+	struct hantro_aux_buf segment;
+	struct hantro_aux_buf prob_tbl;
+	struct hantro_aux_buf prob_tbl_out;
+	struct hantro_aux_buf tile_buf;
+	struct hantro_av1_dec_ctrls ctrls;
+	struct hantro_av1_frame_ref frame_refs[AV1_MAX_FRAME_BUF_COUNT];
+	uint32_t ref_frame_sign_bias[V4L2_AV1_TOTAL_REFS_PER_FRAME];
+	unsigned int num_tile_cols_allocated;
 	struct av1cdfs *cdfs;
 	struct mvcdfs  *cdfs_ndvc;
 	struct av1cdfs default_cdfs;
 	struct mvcdfs  default_cdfs_ndvc;
 	struct av1cdfs cdfs_last[NUM_REF_FRAMES];
 	struct mvcdfs  cdfs_last_ndvc[NUM_REF_FRAMES];
+	int current_frame_index;
 };
-
 /**
  * struct hantro_postproc_ctx
  *
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
new file mode 100644
index 000000000000..fc22955a65ab
--- /dev/null
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -0,0 +1,2065 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, Collabora
+ *
+ * Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
+ */
+
+#include <media/v4l2-mem2mem.h>
+#include "hantro.h"
+#include "hantro_v4l2.h"
+#include "rockchip_vpu981_regs.h"
+
+#define AV1_DEC_MODE		17
+#define GM_GLOBAL_MODELS_PER_FRAME	7
+#define GLOBAL_MODEL_TOTAL_SIZE	(6 * 4 + 4 * 2)
+#define GLOBAL_MODEL_SIZE	ALIGN(GM_GLOBAL_MODELS_PER_FRAME * GLOBAL_MODEL_TOTAL_SIZE, 2048)
+#define AV1_MAX_TILES		128
+#define AV1_TILE_INFO_SIZE	(AV1_MAX_TILES * 16)
+#define AV1DEC_MAX_PIC_BUFFERS	24
+#define AV1_REF_SCALE_SHIFT	14
+#define AV1_INVALID_IDX		-1
+#define MAX_FRAME_DISTANCE	31
+#define AV1_PRIMARY_REF_NONE	7
+#define AV1_TILE_SIZE		ALIGN(32 * 128, 4096)
+/*
+ * These 3 values aren't defined enum v4l2_av1_segment_feature because
+ * they are not part of the specification
+ */
+#define V4L2_AV1_SEG_LVL_ALT_LF_Y_H	2
+#define V4L2_AV1_SEG_LVL_ALT_LF_U	3
+#define V4L2_AV1_SEG_LVL_ALT_LF_V	4
+
+#define SUPERRES_SCALE_BITS 3
+#define SCALE_NUMERATOR 8
+#define SUPERRES_SCALE_DENOMINATOR_MIN (SCALE_NUMERATOR + 1)
+
+#define RS_SUBPEL_BITS 6
+#define RS_SUBPEL_MASK ((1 << RS_SUBPEL_BITS) - 1)
+#define RS_SCALE_SUBPEL_BITS 14
+#define RS_SCALE_SUBPEL_MASK ((1 << RS_SCALE_SUBPEL_BITS) - 1)
+#define RS_SCALE_EXTRA_BITS (RS_SCALE_SUBPEL_BITS - RS_SUBPEL_BITS)
+#define RS_SCALE_EXTRA_OFF (1 << (RS_SCALE_EXTRA_BITS - 1))
+
+#define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
+
+#define LST_BUF_IDX (V4L2_AV1_REF_LAST_FRAME - V4L2_AV1_REF_LAST_FRAME)
+#define LST2_BUF_IDX (V4L2_AV1_REF_LAST2_FRAME - V4L2_AV1_REF_LAST_FRAME)
+#define LST3_BUF_IDX (V4L2_AV1_REF_LAST3_FRAME - V4L2_AV1_REF_LAST_FRAME)
+#define GLD_BUF_IDX (V4L2_AV1_REF_GOLDEN_FRAME - V4L2_AV1_REF_LAST_FRAME)
+#define BWD_BUF_IDX (V4L2_AV1_REF_BWDREF_FRAME - V4L2_AV1_REF_LAST_FRAME)
+#define ALT2_BUF_IDX (V4L2_AV1_REF_ALTREF2_FRAME - V4L2_AV1_REF_LAST_FRAME)
+#define ALT_BUF_IDX (V4L2_AV1_REF_ALTREF_FRAME - V4L2_AV1_REF_LAST_FRAME)
+
+#define DIV_LUT_PREC_BITS 14
+#define DIV_LUT_BITS 8
+#define DIV_LUT_NUM BIT(DIV_LUT_BITS)
+#define WARP_PARAM_REDUCE_BITS 6
+#define WARPEDMODEL_PREC_BITS 16
+
+#define AV1_DIV_ROUND_UP_POW2(value, n)			\
+({							\
+	typeof(n) _n  = n;				\
+	typeof(value) _value = value;			\
+	(_value + (BIT(_n) >> 1)) >> _n;		\
+})
+
+#define AV1_DIV_ROUND_UP_POW2_SIGNED(value, n)				\
+({									\
+	typeof(n) _n_  = n;						\
+	typeof(value) _value_ = value;					\
+	(((_value_) < 0) ? -AV1_DIV_ROUND_UP_POW2(-(_value_), (_n_))	\
+		: AV1_DIV_ROUND_UP_POW2((_value_), (_n_)));		\
+})
+
+struct rockchip_av1_film_grain {
+	uint8_t scaling_lut_y[256];
+	uint8_t scaling_lut_cb[256];
+	uint8_t scaling_lut_cr[256];
+	int16_t cropped_luma_grain_block[4096];
+	int16_t cropped_chroma_grain_block[1024 * 2];
+};
+
+static const short div_lut[DIV_LUT_NUM + 1] = {
+	16384, 16320, 16257, 16194, 16132, 16070, 16009, 15948, 15888, 15828, 15768,
+	15709, 15650, 15592, 15534, 15477, 15420, 15364, 15308, 15252, 15197, 15142,
+	15087, 15033, 14980, 14926, 14873, 14821, 14769, 14717, 14665, 14614, 14564,
+	14513, 14463, 14413, 14364, 14315, 14266, 14218, 14170, 14122, 14075, 14028,
+	13981, 13935, 13888, 13843, 13797, 13752, 13707, 13662, 13618, 13574, 13530,
+	13487, 13443, 13400, 13358, 13315, 13273, 13231, 13190, 13148, 13107, 13066,
+	13026, 12985, 12945, 12906, 12866, 12827, 12788, 12749, 12710, 12672, 12633,
+	12596, 12558, 12520, 12483, 12446, 12409, 12373, 12336, 12300, 12264, 12228,
+	12193, 12157, 12122, 12087, 12053, 12018, 11984, 11950, 11916, 11882, 11848,
+	11815, 11782, 11749, 11716, 11683, 11651, 11619, 11586, 11555, 11523, 11491,
+	11460, 11429, 11398, 11367, 11336, 11305, 11275, 11245, 11215, 11185, 11155,
+	11125, 11096, 11067, 11038, 11009, 10980, 10951, 10923, 10894, 10866, 10838,
+	10810, 10782, 10755, 10727, 10700, 10673, 10645, 10618, 10592, 10565, 10538,
+	10512, 10486, 10460, 10434, 10408, 10382, 10356, 10331, 10305, 10280, 10255,
+	10230, 10205, 10180, 10156, 10131, 10107, 10082, 10058, 10034, 10010, 9986,
+	9963,  9939,  9916,  9892,  9869,  9846,  9823,  9800,  9777,  9754,  9732,
+	9709,  9687,  9664,  9642,  9620,  9598,  9576,  9554,  9533,  9511,  9489,
+	9468,  9447,  9425,  9404,  9383,  9362,  9341,  9321,  9300,  9279,  9259,
+	9239,  9218,  9198,  9178,  9158,  9138,  9118,  9098,  9079,  9059,  9039,
+	9020,  9001,  8981,  8962,  8943,  8924,  8905,  8886,  8867,  8849,  8830,
+	8812,  8793,  8775,  8756,  8738,  8720,  8702,  8684,  8666,  8648,  8630,
+	8613,  8595,  8577,  8560,  8542,  8525,  8508,  8490,  8473,  8456,  8439,
+	8422,  8405,  8389,  8372,  8355,  8339,  8322,  8306,  8289,  8273,  8257,
+	8240,  8224,  8208,  8192,
+};
+
+static int rockchip_vpu981_get_frame_index(struct hantro_ctx *ctx, int ref)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	u64 timestamp;
+	int i, idx = frame->ref_frame_idx[ref];
+
+	if (idx >= AV1_MAX_FRAME_BUF_COUNT || idx < 0)
+		return AV1_INVALID_IDX;
+
+	timestamp = frame->reference_frame_ts[idx];
+	for (i = 0; i < AV1_MAX_FRAME_BUF_COUNT; i++) {
+		if (!av1_dec->frame_refs[i].used)
+			continue;
+		if (av1_dec->frame_refs[i].timestamp == timestamp)
+			return i;
+	}
+
+	return AV1_INVALID_IDX;
+}
+
+static int rockchip_vpu981_get_order_hint(struct hantro_ctx *ctx, int ref)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	int idx = rockchip_vpu981_get_frame_index(ctx, ref);
+
+	if (idx != AV1_INVALID_IDX)
+		return av1_dec->frame_refs[idx].order_hint;
+
+	return 0;
+}
+
+static int rockchip_vpu981_av1_dec_frame_ref(struct hantro_ctx *ctx,
+					     u64 timestamp)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	int i;
+
+	for (i = 0; i < AV1_MAX_FRAME_BUF_COUNT; i++) {
+		if (!av1_dec->frame_refs[i].used) {
+			int j;
+
+			av1_dec->frame_refs[i].width =
+			    frame->frame_width_minus_1 + 1;
+			av1_dec->frame_refs[i].height =
+			    frame->frame_height_minus_1 + 1;
+			av1_dec->frame_refs[i].mi_cols =
+			    DIV_ROUND_UP(frame->frame_width_minus_1 + 1, 8);
+			av1_dec->frame_refs[i].mi_rows =
+			    DIV_ROUND_UP(frame->frame_height_minus_1 + 1, 8);
+			av1_dec->frame_refs[i].timestamp = timestamp;
+			av1_dec->frame_refs[i].frame_type = frame->frame_type;
+			av1_dec->frame_refs[i].order_hint = frame->order_hint;
+			av1_dec->frame_refs[i].gm_mode =
+				frame->global_motion.type[V4L2_AV1_REF_LAST_FRAME + i];
+			if (!av1_dec->frame_refs[i].vb2_ref)
+				av1_dec->frame_refs[i].vb2_ref = hantro_get_dst_buf(ctx);
+
+			for (j = 0; j < V4L2_AV1_TOTAL_REFS_PER_FRAME; j++)
+				av1_dec->frame_refs[i].order_hints[j] = frame->order_hints[j];
+
+			av1_dec->frame_refs[i].used = true;
+			av1_dec->current_frame_index = i;
+			return i;
+		}
+	}
+
+	return AV1_INVALID_IDX;
+}
+
+static void rockchip_vpu981_av1_dec_frame_unref(struct hantro_ctx *ctx, int idx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+
+	if (idx < 0)
+		return;
+
+	av1_dec->frame_refs[idx].used = false;
+}
+
+static void rockchip_vpu981_av1_dec_clean_refs(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+
+	int ref, idx;
+
+	for (idx = 0; idx < AV1_MAX_FRAME_BUF_COUNT; idx++) {
+		u64 timestamp = av1_dec->frame_refs[idx].timestamp;
+		bool used = false;
+
+		if (!av1_dec->frame_refs[idx].used)
+			continue;
+
+		for (ref = 0; ref < V4L2_AV1_TOTAL_REFS_PER_FRAME; ref++) {
+			if (ctrls->frame->reference_frame_ts[ref] == timestamp)
+				used = true;
+		}
+
+		if (!used)
+			rockchip_vpu981_av1_dec_frame_unref(ctx, idx);
+	}
+}
+
+static size_t rockchip_vpu981_av1_dec_luma_size(struct hantro_ctx *ctx)
+{
+	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
+}
+
+static size_t rockchip_vpu981_av1_dec_chroma_size(struct hantro_ctx *ctx)
+{
+	size_t cr_offset = rockchip_vpu981_av1_dec_luma_size(ctx);
+
+	return ALIGN((cr_offset * 3) / 2, 64);
+}
+
+void rockchip_vpu981_av1_dec_tiles_free(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+
+	if (av1_dec->db_data_col.cpu)
+		dma_free_coherent(vpu->dev, av1_dec->db_data_col.size,
+				  av1_dec->db_data_col.cpu,
+				  av1_dec->db_data_col.dma);
+	av1_dec->db_data_col.cpu = NULL;
+
+	if (av1_dec->db_ctrl_col.cpu)
+		dma_free_coherent(vpu->dev, av1_dec->db_ctrl_col.size,
+				  av1_dec->db_ctrl_col.cpu,
+				  av1_dec->db_ctrl_col.dma);
+	av1_dec->db_ctrl_col.cpu = NULL;
+
+	if (av1_dec->cdef_col.cpu)
+		dma_free_coherent(vpu->dev, av1_dec->cdef_col.size,
+				  av1_dec->cdef_col.cpu, av1_dec->cdef_col.dma);
+	av1_dec->cdef_col.cpu = NULL;
+
+	if (av1_dec->sr_col.cpu)
+		dma_free_coherent(vpu->dev, av1_dec->sr_col.size,
+				  av1_dec->sr_col.cpu, av1_dec->sr_col.dma);
+	av1_dec->sr_col.cpu = NULL;
+
+	if (av1_dec->lr_col.cpu)
+		dma_free_coherent(vpu->dev, av1_dec->lr_col.size,
+				  av1_dec->lr_col.cpu, av1_dec->lr_col.dma);
+	av1_dec->lr_col.cpu = NULL;
+}
+
+static int rockchip_vpu981_av1_dec_tiles_reallocate(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	unsigned int num_tile_cols = 1 << ctrls->tile_group_entry->tile_col;
+	unsigned int height = ALIGN(ctrls->frame->frame_height_minus_1 + 1, 64);
+	unsigned int height_in_sb = height / 64;
+	unsigned int stripe_num = ((height + 8) + 63) / 64;
+	size_t size;
+
+	if (av1_dec->db_data_col.size >=
+	    ALIGN(height * 12 * ctx->bit_depth / 8, 128) * num_tile_cols)
+		return 0;
+
+	rockchip_vpu981_av1_dec_tiles_free(ctx);
+
+	size = ALIGN(height * 12 * ctx->bit_depth / 8, 128) * num_tile_cols;
+	av1_dec->db_data_col.cpu = dma_alloc_coherent(vpu->dev, size,
+						      &av1_dec->db_data_col.dma,
+						      GFP_KERNEL);
+	if (!av1_dec->db_data_col.cpu)
+		goto buffer_allocation_error;
+	av1_dec->db_data_col.size = size;
+
+	size = ALIGN(height * 2 * 16 / 4, 128) * num_tile_cols;
+	av1_dec->db_ctrl_col.cpu = dma_alloc_coherent(vpu->dev, size,
+						      &av1_dec->db_ctrl_col.dma,
+						      GFP_KERNEL);
+	if (!av1_dec->db_ctrl_col.cpu)
+		goto buffer_allocation_error;
+	av1_dec->db_ctrl_col.size = size;
+
+	size = ALIGN(height_in_sb * 44 * ctx->bit_depth * 16 / 8, 128) * num_tile_cols;
+	av1_dec->cdef_col.cpu = dma_alloc_coherent(vpu->dev, size,
+						   &av1_dec->cdef_col.dma,
+						   GFP_KERNEL);
+	if (!av1_dec->cdef_col.cpu)
+		goto buffer_allocation_error;
+	av1_dec->cdef_col.size = size;
+
+	size = ALIGN(height_in_sb * (3040 + 1280), 128) * num_tile_cols;
+	av1_dec->sr_col.cpu = dma_alloc_coherent(vpu->dev, size,
+						 &av1_dec->sr_col.dma,
+						 GFP_KERNEL);
+	if (!av1_dec->sr_col.cpu)
+		goto buffer_allocation_error;
+	av1_dec->sr_col.size = size;
+
+	size = ALIGN(stripe_num * 1536 * ctx->bit_depth / 8, 128) * num_tile_cols;
+	av1_dec->lr_col.cpu = dma_alloc_coherent(vpu->dev, size,
+						 &av1_dec->lr_col.dma,
+						 GFP_KERNEL);
+	if (!av1_dec->lr_col.cpu)
+		goto buffer_allocation_error;
+	av1_dec->lr_col.size = size;
+
+	av1_dec->num_tile_cols_allocated = num_tile_cols;
+	return 0;
+
+buffer_allocation_error:
+	rockchip_vpu981_av1_dec_tiles_free(ctx);
+	return -ENOMEM;
+}
+
+void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+
+	if (av1_dec->global_model.cpu)
+		dma_free_coherent(vpu->dev, av1_dec->global_model.size,
+				  av1_dec->global_model.cpu,
+				  av1_dec->global_model.dma);
+	av1_dec->global_model.cpu = NULL;
+
+	if (av1_dec->tile_info.cpu)
+		dma_free_coherent(vpu->dev, av1_dec->tile_info.size,
+				  av1_dec->tile_info.cpu,
+				  av1_dec->tile_info.dma);
+	av1_dec->tile_info.cpu = NULL;
+
+	if (av1_dec->prob_tbl.cpu)
+		dma_free_coherent(vpu->dev, av1_dec->prob_tbl.size,
+				  av1_dec->prob_tbl.cpu, av1_dec->prob_tbl.dma);
+	av1_dec->prob_tbl.cpu = NULL;
+
+	if (av1_dec->prob_tbl_out.cpu)
+		dma_free_coherent(vpu->dev, av1_dec->prob_tbl_out.size,
+				  av1_dec->prob_tbl_out.cpu,
+				  av1_dec->prob_tbl_out.dma);
+	av1_dec->prob_tbl_out.cpu = NULL;
+
+	if (av1_dec->tile_buf.cpu)
+		dma_free_coherent(vpu->dev, av1_dec->tile_buf.size,
+				  av1_dec->tile_buf.cpu, av1_dec->tile_buf.dma);
+	av1_dec->tile_buf.cpu = NULL;
+
+	rockchip_vpu981_av1_dec_tiles_free(ctx);
+}
+
+int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+
+	memset(av1_dec, 0, sizeof(*av1_dec));
+
+	av1_dec->global_model.cpu = dma_alloc_coherent(vpu->dev, GLOBAL_MODEL_SIZE,
+						       &av1_dec->global_model.dma,
+						       GFP_KERNEL);
+	if (!av1_dec->global_model.cpu)
+		return -ENOMEM;
+	av1_dec->global_model.size = GLOBAL_MODEL_SIZE;
+
+	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_MAX_TILES,
+						    &av1_dec->tile_info.dma,
+						    GFP_KERNEL);
+	if (!av1_dec->tile_info.cpu)
+		return -ENOMEM;
+	av1_dec->tile_info.size = AV1_MAX_TILES;
+
+	av1_dec->prob_tbl.cpu = dma_alloc_coherent(vpu->dev,
+						   ALIGN(sizeof(struct av1cdfs), 2048),
+						   &av1_dec->prob_tbl.dma,
+						   GFP_KERNEL);
+	if (!av1_dec->prob_tbl.cpu)
+		return -ENOMEM;
+	av1_dec->prob_tbl.size = ALIGN(sizeof(struct av1cdfs), 2048);
+
+	av1_dec->prob_tbl_out.cpu = dma_alloc_coherent(vpu->dev,
+						       ALIGN(sizeof(struct av1cdfs), 2048),
+						       &av1_dec->prob_tbl_out.dma,
+						       GFP_KERNEL);
+	if (!av1_dec->prob_tbl_out.cpu)
+		return -ENOMEM;
+	av1_dec->prob_tbl_out.size = ALIGN(sizeof(struct av1cdfs), 2048);
+	av1_dec->cdfs = &av1_dec->default_cdfs;
+	av1_dec->cdfs_ndvc = &av1_dec->default_cdfs_ndvc;
+
+	rockchip_av1_set_default_cdfs(av1_dec->cdfs, av1_dec->cdfs_ndvc);
+
+	av1_dec->tile_buf.cpu = dma_alloc_coherent(vpu->dev,
+						   AV1_TILE_SIZE,
+						   &av1_dec->tile_buf.dma,
+						   GFP_KERNEL);
+	if (!av1_dec->tile_buf.cpu)
+		return -ENOMEM;
+	av1_dec->tile_buf.size = AV1_TILE_SIZE;
+
+	return 0;
+}
+
+static int rockchip_vpu981_av1_dec_prepare_run(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+
+	ctrls->sequence = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_SEQUENCE);
+	if (WARN_ON(!ctrls->sequence))
+		return -EINVAL;
+
+	ctrls->tile_group_entry =
+	    hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY);
+	if (WARN_ON(!ctrls->tile_group_entry))
+		return -EINVAL;
+
+	ctrls->frame = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_FRAME);
+	if (WARN_ON(!ctrls->frame))
+		return -EINVAL;
+
+	ctrls->film_grain =
+	    hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_FILM_GRAIN);
+
+	return rockchip_vpu981_av1_dec_tiles_reallocate(ctx);
+}
+
+static inline int rockchip_vpu981_av1_dec_get_msb(u32 n)
+{
+	if (n == 0)
+		return 0;
+	return 31 ^ __builtin_clz(n);
+}
+
+static short rockchip_vpu981_av1_dec_resolve_divisor_32(u32 d, short *shift)
+{
+	int f;
+	uint64_t e;
+
+	*shift = rockchip_vpu981_av1_dec_get_msb(d);
+	/* e is obtained from D after resetting the most significant 1 bit. */
+	e = d - ((u32)1 << *shift);
+	/* Get the most significant DIV_LUT_BITS (8) bits of e into f */
+	if (*shift > DIV_LUT_BITS)
+		f = AV1_DIV_ROUND_UP_POW2(e, *shift - DIV_LUT_BITS);
+	else
+		f = e << (DIV_LUT_BITS - *shift);
+	if (f > DIV_LUT_NUM)
+		return -1;
+	*shift += DIV_LUT_PREC_BITS;
+	/* Use f as lookup into the precomputed table of multipliers */
+	return div_lut[f];
+}
+
+static void rockchip_vpu981_av1_dec_get_shear_params(const uint32_t *params,
+	int64_t *alpha, int64_t *beta, int64_t *gamma, int64_t *delta)
+{
+	const int *mat = params;
+	short shift;
+	short y;
+	long long gv, dv;
+
+	if (mat[2] <= 0)
+		return;
+
+	*alpha = clamp_val(mat[2] - (1 << WARPEDMODEL_PREC_BITS), S16_MIN, S16_MAX);
+	*beta = clamp_val(mat[3], S16_MIN, S16_MAX);
+
+	y = rockchip_vpu981_av1_dec_resolve_divisor_32(abs(mat[2]), &shift) * (mat[2] < 0 ? -1 : 1);
+
+	gv = ((long long)mat[4] * (1 << WARPEDMODEL_PREC_BITS)) * y;
+
+	*gamma = clamp_val((int)AV1_DIV_ROUND_UP_POW2_SIGNED(gv, shift), S16_MIN, S16_MAX);
+
+	dv = ((long long)mat[3] * mat[4]) * y;
+	*delta = clamp_val(
+		mat[5] -
+		(int)AV1_DIV_ROUND_UP_POW2_SIGNED(dv, shift) - (1 << WARPEDMODEL_PREC_BITS),
+		S16_MIN, S16_MAX);
+
+	*alpha = AV1_DIV_ROUND_UP_POW2_SIGNED(*alpha, WARP_PARAM_REDUCE_BITS)
+		 * (1 << WARP_PARAM_REDUCE_BITS);
+	*beta = AV1_DIV_ROUND_UP_POW2_SIGNED(*beta, WARP_PARAM_REDUCE_BITS)
+		* (1 << WARP_PARAM_REDUCE_BITS);
+	*gamma = AV1_DIV_ROUND_UP_POW2_SIGNED(*gamma, WARP_PARAM_REDUCE_BITS)
+		 * (1 << WARP_PARAM_REDUCE_BITS);
+	*delta = AV1_DIV_ROUND_UP_POW2_SIGNED(*delta, WARP_PARAM_REDUCE_BITS)
+		* (1 << WARP_PARAM_REDUCE_BITS);
+}
+
+static void rockchip_vpu981_av1_dec_set_global_model(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	const struct v4l2_av1_global_motion *gm = &frame->global_motion;
+	uint8_t *dst = av1_dec->global_model.cpu;
+	struct hantro_dev *vpu = ctx->dev;
+	int ref_frame, i;
+
+	memset(dst, 0, GLOBAL_MODEL_SIZE);
+	for (ref_frame = 0; ref_frame < V4L2_AV1_REFS_PER_FRAME; ++ref_frame) {
+		int64_t alpha = 0, beta = 0, gamma = 0, delta = 0;
+
+		for (i = 0; i < 6; ++i) {
+			if (i == 2)
+				*(int32_t *)dst =
+					gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][3];
+			else if (i == 3)
+				*(int32_t *)dst =
+					gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][2];
+			else
+				*(int32_t *)dst =
+					gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][i];
+			dst += 4;
+		}
+
+		if (gm->type[V4L2_AV1_REF_LAST_FRAME + ref_frame] <= V4L2_AV1_WARP_MODEL_AFFINE)
+			rockchip_vpu981_av1_dec_get_shear_params(
+					&gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][0],
+					&alpha, &beta, &gamma, &delta);
+
+		*(int16_t *)dst = alpha;
+		dst += 2;
+		*(int16_t *)dst = beta;
+		dst += 2;
+		*(int16_t *)dst = gamma;
+		dst += 2;
+		*(int16_t *)dst = delta;
+		dst += 2;
+	}
+
+	hantro_write_addr(vpu, AV1_GLOBAL_MODEL, av1_dec->global_model.dma);
+}
+
+static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	struct v4l2_av1_tile_info tile_info = ctrls->frame->tile_info;
+	const struct v4l2_ctrl_av1_tile_group_entry *group_entry =
+	    ctrls->tile_group_entry;
+	int context_update_y =
+	    tile_info.context_update_tile_id / tile_info.tile_cols;
+	int context_update_x =
+	    tile_info.context_update_tile_id % tile_info.tile_cols;
+	int context_update_tile_id =
+	    context_update_x * tile_info.tile_rows + context_update_y;
+	uint8_t *dst = av1_dec->tile_info.cpu;
+	struct hantro_dev *vpu = ctx->dev;
+	int tile0, tile1;
+
+	memset(dst, 0, av1_dec->tile_info.size);
+
+	for (tile0 = 0; tile0 < tile_info.tile_cols; tile0++) {
+		for (tile1 = 0; tile1 < tile_info.tile_rows; tile1++) {
+			int tile_id = tile1 * tile_info.tile_cols + tile0;
+			uint32_t start, end;
+			uint32_t y0 =
+			    tile_info.height_in_sbs_minus_1[tile1] + 1;
+			uint32_t x0 = tile_info.width_in_sbs_minus_1[tile0] + 1;
+
+			// tile size in SB units (width,height)
+			*dst++ = x0;
+			*dst++ = 0;
+			*dst++ = 0;
+			*dst++ = 0;
+			*dst++ = y0;
+			*dst++ = 0;
+			*dst++ = 0;
+			*dst++ = 0;
+
+			// tile start position
+			start = group_entry[tile_id].tile_offset - group_entry[0].tile_offset;
+			*dst++ = start & 255;
+			*dst++ = (start >> 8) & 255;
+			*dst++ = (start >> 16) & 255;
+			*dst++ = (start >> 24) & 255;
+
+			// # of bytes in tile data
+			end = start + group_entry[tile_id].tile_size;
+			*dst++ = end & 255;
+			*dst++ = (end >> 8) & 255;
+			*dst++ = (end >> 16) & 255;
+			*dst++ = (end >> 24) & 255;
+		}
+	}
+
+	hantro_reg_write(vpu, &av1_multicore_expect_context_update,
+			 !!(context_update_x == 0));
+	hantro_reg_write(vpu, &av1_tile_enable, !!((tile_info.tile_cols > 1)
+						   || (tile_info.tile_rows > 1)));
+	hantro_reg_write(vpu, &av1_num_tile_cols_8k, tile_info.tile_cols);
+	hantro_reg_write(vpu, &av1_num_tile_rows_8k, tile_info.tile_rows);
+	hantro_reg_write(vpu, &av1_context_update_tile_id,
+			 context_update_tile_id);
+	hantro_reg_write(vpu, &av1_tile_transpose, 1);
+	if (context_update_tile_id) {
+		hantro_reg_write(vpu, &av1_dec_tile_size_mag,
+				 tile_info.tile_size_bytes);
+	} else
+		hantro_reg_write(vpu, &av1_dec_tile_size_mag, 3);
+
+	hantro_write_addr(vpu, AV1_TILE_BASE, av1_dec->tile_info.dma);
+}
+
+static int rockchip_vpu981_av1_dec_get_relative_dist(struct hantro_ctx *ctx,
+						     int a, int b)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	int bits = ctrls->sequence->order_hint_bits - 1;
+	int diff, m;
+
+	if (!ctrls->sequence->order_hint_bits)
+		return 0;
+
+	diff = a - b;
+	m = 1 << bits;
+	diff = (diff & (m - 1)) - (diff & m);
+
+	return diff;
+}
+
+static void rockchip_vpu981_av1_dec_set_frame_sign_bias(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	const struct v4l2_ctrl_av1_sequence *sequence = ctrls->sequence;
+	int i;
+
+	if (!sequence->order_hint_bits || IS_INTRA(frame->frame_type)) {
+		for (i = 0; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++)
+			av1_dec->ref_frame_sign_bias[i] = 0;
+
+		return;
+	}
+	// Identify the nearest forward and backward references.
+	for (i = 0; i < V4L2_AV1_TOTAL_REFS_PER_FRAME - 1; i++) {
+		if (rockchip_vpu981_get_frame_index(ctx, i) >= 0) {
+			int rel_off =
+			    rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+								      rockchip_vpu981_get_order_hint
+								      (ctx, i),
+								      frame->order_hint);
+			av1_dec->ref_frame_sign_bias[i + 1] = (rel_off <= 0) ? 0 : 1;
+		}
+	}
+}
+
+static bool
+rockchip_vpu981_av1_dec_set_ref(struct hantro_ctx *ctx, int ref, int idx,
+				int width, int height)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_decoded_buffer *dst;
+	dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
+	size_t cr_offset = rockchip_vpu981_av1_dec_luma_size(ctx);
+	size_t mv_offset = rockchip_vpu981_av1_dec_chroma_size(ctx);
+	int cur_width = frame->frame_width_minus_1 + 1;
+	int cur_height = frame->frame_height_minus_1 + 1;
+	int scale_width =
+	    ((width << AV1_REF_SCALE_SHIFT) + cur_width / 2) / cur_width;
+	int scale_height =
+	    ((height << AV1_REF_SCALE_SHIFT) + cur_height / 2) / cur_height;
+
+	switch (ref) {
+	case 0:
+		hantro_reg_write(vpu, &av1_ref0_height, height);
+		hantro_reg_write(vpu, &av1_ref0_width, width);
+		hantro_reg_write(vpu, &av1_ref0_ver_scale, scale_width);
+		hantro_reg_write(vpu, &av1_ref0_hor_scale, scale_height);
+		break;
+	case 1:
+		hantro_reg_write(vpu, &av1_ref1_height, height);
+		hantro_reg_write(vpu, &av1_ref1_width, width);
+		hantro_reg_write(vpu, &av1_ref1_ver_scale, scale_width);
+		hantro_reg_write(vpu, &av1_ref1_hor_scale, scale_height);
+		break;
+	case 2:
+		hantro_reg_write(vpu, &av1_ref2_height, height);
+		hantro_reg_write(vpu, &av1_ref2_width, width);
+		hantro_reg_write(vpu, &av1_ref2_ver_scale, scale_width);
+		hantro_reg_write(vpu, &av1_ref2_hor_scale, scale_height);
+		break;
+	case 3:
+		hantro_reg_write(vpu, &av1_ref3_height, height);
+		hantro_reg_write(vpu, &av1_ref3_width, width);
+		hantro_reg_write(vpu, &av1_ref3_ver_scale, scale_width);
+		hantro_reg_write(vpu, &av1_ref3_hor_scale, scale_height);
+		break;
+	case 4:
+		hantro_reg_write(vpu, &av1_ref4_height, height);
+		hantro_reg_write(vpu, &av1_ref4_width, width);
+		hantro_reg_write(vpu, &av1_ref4_ver_scale, scale_width);
+		hantro_reg_write(vpu, &av1_ref4_hor_scale, scale_height);
+		break;
+	case 5:
+		hantro_reg_write(vpu, &av1_ref5_height, height);
+		hantro_reg_write(vpu, &av1_ref5_width, width);
+		hantro_reg_write(vpu, &av1_ref5_ver_scale, scale_width);
+		hantro_reg_write(vpu, &av1_ref5_hor_scale, scale_height);
+		break;
+	case 6:
+		hantro_reg_write(vpu, &av1_ref6_height, height);
+		hantro_reg_write(vpu, &av1_ref6_width, width);
+		hantro_reg_write(vpu, &av1_ref6_ver_scale, scale_width);
+		hantro_reg_write(vpu, &av1_ref6_hor_scale, scale_height);
+		break;
+	default:
+		pr_warn("AV1 invalid reference frame index\n");
+	}
+
+	dst = vb2_to_hantro_decoded_buf(&av1_dec->frame_refs[idx].vb2_ref->vb2_buf);
+	luma_addr = hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
+	chroma_addr = luma_addr + cr_offset;
+	mv_addr = luma_addr + mv_offset;
+
+	hantro_write_addr(vpu, AV1_REFERENCE_Y(ref), luma_addr);
+	hantro_write_addr(vpu, AV1_REFERENCE_CB(ref), chroma_addr);
+	hantro_write_addr(vpu, AV1_REFERENCE_MV(ref), mv_addr);
+
+	return (scale_width != (1 << AV1_REF_SCALE_SHIFT))
+		|| (scale_height != (1 << AV1_REF_SCALE_SHIFT));
+}
+
+static void rockchip_vpu981_av1_dec_set_sign_bias(struct hantro_ctx *ctx,
+						  int ref, int val)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	switch (ref) {
+	case 0:
+		hantro_reg_write(vpu, &av1_ref0_sign_bias, val);
+		break;
+	case 1:
+		hantro_reg_write(vpu, &av1_ref1_sign_bias, val);
+		break;
+	case 2:
+		hantro_reg_write(vpu, &av1_ref2_sign_bias, val);
+		break;
+	case 3:
+		hantro_reg_write(vpu, &av1_ref3_sign_bias, val);
+		break;
+	case 4:
+		hantro_reg_write(vpu, &av1_ref4_sign_bias, val);
+		break;
+	case 5:
+		hantro_reg_write(vpu, &av1_ref5_sign_bias, val);
+		break;
+	case 6:
+		hantro_reg_write(vpu, &av1_ref6_sign_bias, val);
+		break;
+	default:
+		pr_warn("AV1 invalid sign bias index\n");
+		break;
+	}
+}
+
+static void rockchip_vpu981_av1_dec_set_segmentation(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	const struct v4l2_av1_segmentation *seg = &frame->segmentation;
+	uint32_t segval[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX] = { 0 };
+	struct hantro_dev *vpu = ctx->dev;
+	uint8_t segsign = 0, preskip_segid = 0, last_active_seg = 0, i, j;
+
+	if (!!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED)
+	    && (frame->primary_ref_frame < V4L2_AV1_REFS_PER_FRAME)) {
+		int idx = rockchip_vpu981_get_frame_index(ctx, frame->primary_ref_frame);
+
+		if (idx >= 0) {
+			dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
+			size_t cr_offset = rockchip_vpu981_av1_dec_luma_size(ctx);
+			size_t mv_offset = rockchip_vpu981_av1_dec_chroma_size(ctx);
+
+			luma_addr =
+				hantro_get_dec_buf_addr(ctx,
+							&av1_dec->frame_refs[idx].vb2_ref->vb2_buf);
+			chroma_addr = luma_addr + cr_offset;
+			mv_addr = luma_addr + mv_offset;
+
+			hantro_write_addr(vpu, AV1_SEGMENTATION, mv_addr);
+			hantro_reg_write(vpu, &av1_use_temporal3_mvs, 1);
+		}
+	}
+
+	hantro_reg_write(vpu, &av1_segment_temp_upd_e,
+			 !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_TEMPORAL_UPDATE));
+	hantro_reg_write(vpu, &av1_segment_upd_e,
+			 !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP));
+	hantro_reg_write(vpu, &av1_segment_e,
+			 !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED));
+
+	hantro_reg_write(vpu, &av1_error_resilient,
+			 !!(frame->flags & V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE));
+
+	if (IS_INTRA(frame->frame_type)
+	    || !!(frame->flags & V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE)) {
+		hantro_reg_write(vpu, &av1_use_temporal3_mvs, 0);
+	}
+
+	if (!!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED)) {
+		int s;
+
+		for (s = 0; s < V4L2_AV1_MAX_SEGMENTS; s++) {
+			if (seg->feature_enabled[s] &
+			    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_Q)) {
+				segval[s][V4L2_AV1_SEG_LVL_ALT_Q] =
+				    clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_Q]),
+					  0, 255);
+				segsign |=
+					(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_Q] < 0) << s;
+			}
+
+			if (seg->feature_enabled[s] &
+			    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_LF_Y_V))
+				segval[s][V4L2_AV1_SEG_LVL_ALT_LF_Y_V] =
+					clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]),
+					      -63, 63);
+
+			if (seg->feature_enabled[s] &
+			    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_LF_Y_H))
+				segval[s][V4L2_AV1_SEG_LVL_ALT_LF_Y_H] =
+				    clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]),
+					  -63, 63);
+
+			if (seg->feature_enabled[s] &
+			    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_LF_U))
+				segval[s][V4L2_AV1_SEG_LVL_ALT_LF_U] =
+				    clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_LF_U]),
+					  -63, 63);
+
+			if (seg->feature_enabled[s] &
+			    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_LF_V))
+				segval[s][V4L2_AV1_SEG_LVL_ALT_LF_V] =
+				    clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_LF_V]),
+					  -63, 63);
+
+			if (frame->frame_type && seg->feature_enabled[s] &
+			    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_REF_FRAME))
+				segval[s][V4L2_AV1_SEG_LVL_REF_FRAME]++;
+
+			if (seg->feature_enabled[s] &
+			    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_REF_SKIP))
+				segval[s][V4L2_AV1_SEG_LVL_REF_SKIP] = 1;
+
+			if (seg->feature_enabled[s] &
+			    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_REF_GLOBALMV))
+				segval[s][V4L2_AV1_SEG_LVL_REF_GLOBALMV] = 1;
+		}
+	}
+
+	for (i = 0; i < V4L2_AV1_MAX_SEGMENTS; i++) {
+		for (j = 0; j < V4L2_AV1_SEG_LVL_MAX; j++) {
+			if (seg->feature_enabled[i]
+			    & V4L2_AV1_SEGMENT_FEATURE_ENABLED(j)) {
+				preskip_segid |= (j >= V4L2_AV1_SEG_LVL_REF_FRAME);
+				last_active_seg = max(i, last_active_seg);
+			}
+		}
+	}
+
+	hantro_reg_write(vpu, &av1_last_active_seg, last_active_seg);
+	hantro_reg_write(vpu, &av1_preskip_segid, preskip_segid);
+
+	hantro_reg_write(vpu, &av1_seg_quant_sign, segsign);
+
+	/* Write QP, filter level, ref frame and skip for every segment */
+	hantro_reg_write(vpu, &av1_quant_seg0,
+			 segval[0][V4L2_AV1_SEG_LVL_ALT_Q]);
+	hantro_reg_write(vpu, &av1_filt_level_delta0_seg0,
+			 segval[0][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
+	hantro_reg_write(vpu, &av1_filt_level_delta1_seg0,
+			 segval[0][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
+	hantro_reg_write(vpu, &av1_filt_level_delta2_seg0,
+			 segval[0][V4L2_AV1_SEG_LVL_ALT_LF_U]);
+	hantro_reg_write(vpu, &av1_filt_level_delta3_seg0,
+			 segval[0][V4L2_AV1_SEG_LVL_ALT_LF_V]);
+	hantro_reg_write(vpu, &av1_refpic_seg0,
+			 segval[0][V4L2_AV1_SEG_LVL_REF_FRAME]);
+	hantro_reg_write(vpu, &av1_skip_seg0,
+			 segval[0][V4L2_AV1_SEG_LVL_REF_SKIP]);
+	hantro_reg_write(vpu, &av1_global_mv_seg0,
+			 segval[0][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
+
+	hantro_reg_write(vpu, &av1_quant_seg1,
+			 segval[1][V4L2_AV1_SEG_LVL_ALT_Q]);
+	hantro_reg_write(vpu, &av1_filt_level_delta0_seg1,
+			 segval[1][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
+	hantro_reg_write(vpu, &av1_filt_level_delta1_seg1,
+			 segval[1][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
+	hantro_reg_write(vpu, &av1_filt_level_delta2_seg1,
+			 segval[1][V4L2_AV1_SEG_LVL_ALT_LF_U]);
+	hantro_reg_write(vpu, &av1_filt_level_delta3_seg1,
+			 segval[1][V4L2_AV1_SEG_LVL_ALT_LF_V]);
+	hantro_reg_write(vpu, &av1_refpic_seg1,
+			 segval[1][V4L2_AV1_SEG_LVL_REF_FRAME]);
+	hantro_reg_write(vpu, &av1_skip_seg1,
+			 segval[1][V4L2_AV1_SEG_LVL_REF_SKIP]);
+	hantro_reg_write(vpu, &av1_global_mv_seg1,
+			 segval[1][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
+
+	hantro_reg_write(vpu, &av1_quant_seg2,
+			 segval[2][V4L2_AV1_SEG_LVL_ALT_Q]);
+	hantro_reg_write(vpu, &av1_filt_level_delta0_seg2,
+			 segval[2][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
+	hantro_reg_write(vpu, &av1_filt_level_delta1_seg2,
+			 segval[2][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
+	hantro_reg_write(vpu, &av1_filt_level_delta2_seg2,
+			 segval[2][V4L2_AV1_SEG_LVL_ALT_LF_U]);
+	hantro_reg_write(vpu, &av1_filt_level_delta3_seg2,
+			 segval[2][V4L2_AV1_SEG_LVL_ALT_LF_V]);
+	hantro_reg_write(vpu, &av1_refpic_seg2,
+			 segval[2][V4L2_AV1_SEG_LVL_REF_FRAME]);
+	hantro_reg_write(vpu, &av1_skip_seg2,
+			 segval[2][V4L2_AV1_SEG_LVL_REF_SKIP]);
+	hantro_reg_write(vpu, &av1_global_mv_seg2,
+			 segval[2][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
+
+	hantro_reg_write(vpu, &av1_quant_seg3,
+			 segval[3][V4L2_AV1_SEG_LVL_ALT_Q]);
+	hantro_reg_write(vpu, &av1_filt_level_delta0_seg3,
+			 segval[3][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
+	hantro_reg_write(vpu, &av1_filt_level_delta1_seg3,
+			 segval[3][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
+	hantro_reg_write(vpu, &av1_filt_level_delta2_seg3,
+			 segval[3][V4L2_AV1_SEG_LVL_ALT_LF_U]);
+	hantro_reg_write(vpu, &av1_filt_level_delta3_seg3,
+			 segval[3][V4L2_AV1_SEG_LVL_ALT_LF_V]);
+	hantro_reg_write(vpu, &av1_refpic_seg3,
+			 segval[3][V4L2_AV1_SEG_LVL_REF_FRAME]);
+	hantro_reg_write(vpu, &av1_skip_seg3,
+			 segval[3][V4L2_AV1_SEG_LVL_REF_SKIP]);
+	hantro_reg_write(vpu, &av1_global_mv_seg3,
+			 segval[3][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
+
+	hantro_reg_write(vpu, &av1_quant_seg4,
+			 segval[4][V4L2_AV1_SEG_LVL_ALT_Q]);
+	hantro_reg_write(vpu, &av1_filt_level_delta0_seg4,
+			 segval[4][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
+	hantro_reg_write(vpu, &av1_filt_level_delta1_seg4,
+			 segval[4][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
+	hantro_reg_write(vpu, &av1_filt_level_delta2_seg4,
+			 segval[4][V4L2_AV1_SEG_LVL_ALT_LF_U]);
+	hantro_reg_write(vpu, &av1_filt_level_delta3_seg4,
+			 segval[4][V4L2_AV1_SEG_LVL_ALT_LF_V]);
+	hantro_reg_write(vpu, &av1_refpic_seg4,
+			 segval[4][V4L2_AV1_SEG_LVL_REF_FRAME]);
+	hantro_reg_write(vpu, &av1_skip_seg4,
+			 segval[4][V4L2_AV1_SEG_LVL_REF_SKIP]);
+	hantro_reg_write(vpu, &av1_global_mv_seg4,
+			 segval[4][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
+
+	hantro_reg_write(vpu, &av1_quant_seg5,
+			 segval[5][V4L2_AV1_SEG_LVL_ALT_Q]);
+	hantro_reg_write(vpu, &av1_filt_level_delta0_seg5,
+			 segval[5][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
+	hantro_reg_write(vpu, &av1_filt_level_delta1_seg5,
+			 segval[5][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
+	hantro_reg_write(vpu, &av1_filt_level_delta2_seg5,
+			 segval[5][V4L2_AV1_SEG_LVL_ALT_LF_U]);
+	hantro_reg_write(vpu, &av1_filt_level_delta3_seg5,
+			 segval[5][V4L2_AV1_SEG_LVL_ALT_LF_V]);
+	hantro_reg_write(vpu, &av1_refpic_seg5,
+			 segval[5][V4L2_AV1_SEG_LVL_REF_FRAME]);
+	hantro_reg_write(vpu, &av1_skip_seg5,
+			 segval[5][V4L2_AV1_SEG_LVL_REF_SKIP]);
+	hantro_reg_write(vpu, &av1_global_mv_seg5,
+			 segval[5][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
+
+	hantro_reg_write(vpu, &av1_quant_seg6,
+			 segval[6][V4L2_AV1_SEG_LVL_ALT_Q]);
+	hantro_reg_write(vpu, &av1_filt_level_delta0_seg6,
+			 segval[6][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
+	hantro_reg_write(vpu, &av1_filt_level_delta1_seg6,
+			 segval[6][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
+	hantro_reg_write(vpu, &av1_filt_level_delta2_seg6,
+			 segval[6][V4L2_AV1_SEG_LVL_ALT_LF_U]);
+	hantro_reg_write(vpu, &av1_filt_level_delta3_seg6,
+			 segval[6][V4L2_AV1_SEG_LVL_ALT_LF_V]);
+	hantro_reg_write(vpu, &av1_refpic_seg6,
+			 segval[6][V4L2_AV1_SEG_LVL_REF_FRAME]);
+	hantro_reg_write(vpu, &av1_skip_seg6,
+			 segval[6][V4L2_AV1_SEG_LVL_REF_SKIP]);
+	hantro_reg_write(vpu, &av1_global_mv_seg6,
+			 segval[6][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
+
+	hantro_reg_write(vpu, &av1_quant_seg7,
+			 segval[7][V4L2_AV1_SEG_LVL_ALT_Q]);
+	hantro_reg_write(vpu, &av1_filt_level_delta0_seg7,
+			 segval[7][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
+	hantro_reg_write(vpu, &av1_filt_level_delta1_seg7,
+			 segval[7][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
+	hantro_reg_write(vpu, &av1_filt_level_delta2_seg7,
+			 segval[7][V4L2_AV1_SEG_LVL_ALT_LF_U]);
+	hantro_reg_write(vpu, &av1_filt_level_delta3_seg7,
+			 segval[7][V4L2_AV1_SEG_LVL_ALT_LF_V]);
+	hantro_reg_write(vpu, &av1_refpic_seg7,
+			 segval[7][V4L2_AV1_SEG_LVL_REF_FRAME]);
+	hantro_reg_write(vpu, &av1_skip_seg7,
+			 segval[7][V4L2_AV1_SEG_LVL_REF_SKIP]);
+	hantro_reg_write(vpu, &av1_global_mv_seg7,
+			 segval[7][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
+}
+
+static bool rockchip_vpu981_av1_dec_is_lossless(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	const struct v4l2_av1_segmentation *segmentation = &frame->segmentation;
+	const struct v4l2_av1_quantization *quantization = &frame->quantization;
+	int i;
+
+	for (i = 0; i < V4L2_AV1_MAX_SEGMENTS; i++) {
+		int qindex = quantization->base_q_idx;
+
+		if (segmentation->feature_enabled[i] &
+		    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_Q)) {
+			qindex += segmentation->feature_data[i][V4L2_AV1_SEG_LVL_ALT_Q];
+		}
+		qindex = clamp(qindex, 0, 255);
+
+		if (qindex
+		    || quantization->delta_q_y_dc
+		    || quantization->delta_q_u_dc
+		    || quantization->delta_q_u_ac
+		    || quantization->delta_q_v_dc || quantization->delta_q_v_ac)
+			return false;
+	}
+	return true;
+}
+
+static void rockchip_vpu981_av1_dec_set_loopfilter(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	const struct v4l2_av1_loop_filter *loop_filter = &frame->loop_filter;
+	bool filtering_dis = (loop_filter->level[0] == 0)
+			     && (loop_filter->level[1] == 0);
+	struct hantro_dev *vpu = ctx->dev;
+
+	hantro_reg_write(vpu, &av1_filtering_dis, filtering_dis);
+	hantro_reg_write(vpu, &av1_filt_level_base_gt32, loop_filter->level[0] > 32);
+	hantro_reg_write(vpu, &av1_filt_sharpness, loop_filter->sharpness);
+
+	hantro_reg_write(vpu, &av1_filt_level0, loop_filter->level[0]);
+	hantro_reg_write(vpu, &av1_filt_level1, loop_filter->level[1]);
+	hantro_reg_write(vpu, &av1_filt_level2, loop_filter->level[2]);
+	hantro_reg_write(vpu, &av1_filt_level3, loop_filter->level[3]);
+
+	if (loop_filter->flags & V4L2_AV1_LOOP_FILTER_FLAG_DELTA_ENABLED
+	    && !rockchip_vpu981_av1_dec_is_lossless(ctx)
+	    && !(frame->flags & V4L2_AV1_FRAME_FLAG_ALLOW_INTRABC)) {
+		hantro_reg_write(vpu, &av1_filt_ref_adj_0,
+				 loop_filter->ref_deltas[0]);
+		hantro_reg_write(vpu, &av1_filt_ref_adj_1,
+				 loop_filter->ref_deltas[1]);
+		hantro_reg_write(vpu, &av1_filt_ref_adj_2,
+				 loop_filter->ref_deltas[2]);
+		hantro_reg_write(vpu, &av1_filt_ref_adj_3,
+				 loop_filter->ref_deltas[3]);
+		hantro_reg_write(vpu, &av1_filt_ref_adj_4,
+				 loop_filter->ref_deltas[4]);
+		hantro_reg_write(vpu, &av1_filt_ref_adj_5,
+				 loop_filter->ref_deltas[5]);
+		hantro_reg_write(vpu, &av1_filt_ref_adj_6,
+				 loop_filter->ref_deltas[6]);
+		hantro_reg_write(vpu, &av1_filt_ref_adj_7,
+				 loop_filter->ref_deltas[7]);
+		hantro_reg_write(vpu, &av1_filt_mb_adj_0,
+				 loop_filter->mode_deltas[0]);
+		hantro_reg_write(vpu, &av1_filt_mb_adj_1,
+				 loop_filter->mode_deltas[1]);
+	} else {
+		hantro_reg_write(vpu, &av1_filt_ref_adj_0, 0);
+		hantro_reg_write(vpu, &av1_filt_ref_adj_1, 0);
+		hantro_reg_write(vpu, &av1_filt_ref_adj_2, 0);
+		hantro_reg_write(vpu, &av1_filt_ref_adj_3, 0);
+		hantro_reg_write(vpu, &av1_filt_ref_adj_4, 0);
+		hantro_reg_write(vpu, &av1_filt_ref_adj_5, 0);
+		hantro_reg_write(vpu, &av1_filt_ref_adj_6, 0);
+		hantro_reg_write(vpu, &av1_filt_ref_adj_7, 0);
+		hantro_reg_write(vpu, &av1_filt_mb_adj_0, 0);
+		hantro_reg_write(vpu, &av1_filt_mb_adj_1, 0);
+	}
+
+	hantro_write_addr(vpu, AV1_DB_DATA_COL, av1_dec->db_data_col.dma);
+	hantro_write_addr(vpu, AV1_DB_CTRL_COL, av1_dec->db_ctrl_col.dma);
+}
+
+static void rockchip_vpu981_av1_dec_update_prob(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	bool frame_is_intra = IS_INTRA(frame->frame_type);
+	struct av1cdfs *out_cdfs = (struct av1cdfs *)av1_dec->prob_tbl_out.cpu;
+	int i;
+
+	if (frame->flags & V4L2_AV1_FRAME_FLAG_DISABLE_FRAME_END_UPDATE_CDF)
+		return;
+
+	for (i = 0; i < NUM_REF_FRAMES; i++) {
+		if (frame->refresh_frame_flags & (1 << i)) {
+			struct mvcdfs stored_mv_cdf;
+
+			rockchip_av1_get_cdfs(ctx, i);
+			stored_mv_cdf = av1_dec->cdfs->mv_cdf;
+			*av1_dec->cdfs = *out_cdfs;
+			if (frame_is_intra) {
+				av1_dec->cdfs->mv_cdf = stored_mv_cdf;
+				*av1_dec->cdfs_ndvc = out_cdfs->mv_cdf;
+			}
+			rockchip_av1_store_cdfs(ctx,
+						frame->refresh_frame_flags);
+			break;
+		}
+	}
+}
+
+void rockchip_vpu981_av1_dec_done(struct hantro_ctx *ctx)
+{
+	rockchip_vpu981_av1_dec_update_prob(ctx);
+}
+
+static void rockchip_vpu981_av1_dec_set_prob(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	const struct v4l2_av1_quantization *quantization = &frame->quantization;
+	struct hantro_dev *vpu = ctx->dev;
+	bool error_resilient_mode =
+	    !!(frame->flags & V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE);
+	bool frame_is_intra = IS_INTRA(frame->frame_type);
+
+	if (error_resilient_mode || frame_is_intra
+	    || frame->primary_ref_frame == AV1_PRIMARY_REF_NONE) {
+		av1_dec->cdfs = &av1_dec->default_cdfs;
+		av1_dec->cdfs_ndvc = &av1_dec->default_cdfs_ndvc;
+		rockchip_av1_default_coeff_probs(quantization->base_q_idx,
+						 av1_dec->cdfs);
+	} else {
+		rockchip_av1_get_cdfs(ctx, frame->ref_frame_idx[frame->primary_ref_frame]);
+	}
+	rockchip_av1_store_cdfs(ctx, frame->refresh_frame_flags);
+
+	memcpy(av1_dec->prob_tbl.cpu, av1_dec->cdfs, sizeof(struct av1cdfs));
+
+	if (frame_is_intra) {
+		int mv_offset = offsetof(struct av1cdfs, mv_cdf);
+		/* Overwrite MV context area with intrabc MV context */
+		memcpy(av1_dec->prob_tbl.cpu + mv_offset, av1_dec->cdfs_ndvc,
+		       sizeof(struct mvcdfs));
+	}
+
+	hantro_write_addr(vpu, AV1_PROP_TABLE_OUT, av1_dec->prob_tbl_out.dma);
+	hantro_write_addr(vpu, AV1_PROP_TABLE, av1_dec->prob_tbl.dma);
+}
+
+static void rockchip_vpu981_av1_dec_set_cdef(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	const struct v4l2_av1_cdef *cdef = &frame->cdef;
+	struct hantro_dev *vpu = ctx->dev;
+	uint32_t luma_pri_strength = 0;
+	uint16_t luma_sec_strength = 0;
+	uint32_t chroma_pri_strength = 0;
+	uint16_t chroma_sec_strength = 0;
+	int i;
+
+	hantro_reg_write(vpu, &av1_cdef_bits, cdef->bits);
+	hantro_reg_write(vpu, &av1_cdef_damping, cdef->damping_minus_3);
+
+	for (i = 0; i < (1 << cdef->bits); i++) {
+		luma_pri_strength |= cdef->y_pri_strength[i] << (i * 4);
+		if (cdef->y_sec_strength[i] == 4)
+			luma_sec_strength |= 3 << (i * 2);
+		else
+			luma_sec_strength |= cdef->y_sec_strength[i] << (i * 2);
+
+		chroma_pri_strength |= cdef->uv_pri_strength[i] << (i * 4);
+		if (cdef->uv_sec_strength[i] == 4)
+			chroma_sec_strength |= 3 << (i * 2);
+		else
+			chroma_sec_strength |= cdef->uv_sec_strength[i] << (i * 2);
+	}
+
+	hantro_reg_write(vpu, &av1_cdef_luma_primary_strength,
+			 luma_pri_strength);
+	hantro_reg_write(vpu, &av1_cdef_luma_secondary_strength,
+			 luma_sec_strength);
+	hantro_reg_write(vpu, &av1_cdef_chroma_primary_strength,
+			 chroma_pri_strength);
+	hantro_reg_write(vpu, &av1_cdef_chroma_secondary_strength,
+			 chroma_sec_strength);
+
+	hantro_write_addr(vpu, AV1_CDEF_COL, av1_dec->cdef_col.dma);
+}
+
+static void rockchip_vpu981_av1_dec_set_lr(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	const struct v4l2_av1_loop_restoration *loop_restoration =
+	    &frame->loop_restoration;
+	struct hantro_dev *vpu = ctx->dev;
+	uint16_t lr_type = 0, lr_unit_size = 0;
+	uint8_t restoration_unit_size[V4L2_AV1_NUM_PLANES_MAX] = { 3, 3, 3 };
+	int i;
+
+	if (loop_restoration->flags & V4L2_AV1_LOOP_RESTORATION_FLAG_USES_LR) {
+		restoration_unit_size[0] = 1 + loop_restoration->lr_unit_shift;
+		restoration_unit_size[1] =
+		    1 + loop_restoration->lr_unit_shift - loop_restoration->lr_uv_shift;
+		restoration_unit_size[2] =
+		    1 + loop_restoration->lr_unit_shift - loop_restoration->lr_uv_shift;
+	}
+
+	for (i = 0; i < V4L2_AV1_NUM_PLANES_MAX; i++) {
+		lr_type |=
+		    loop_restoration->frame_restoration_type[i] << (i * 2);
+		lr_unit_size |= restoration_unit_size[i] << (i * 2);
+	}
+
+	hantro_reg_write(vpu, &av1_lr_type, lr_type);
+	hantro_reg_write(vpu, &av1_lr_unit_size, lr_unit_size);
+	hantro_write_addr(vpu, AV1_LR_COL, av1_dec->lr_col.dma);
+}
+
+static void rockchip_vpu981_av1_dec_set_superres_params(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	struct hantro_dev *vpu = ctx->dev;
+	uint8_t superres_scale_denominator = SCALE_NUMERATOR;
+	int superres_luma_step = RS_SCALE_SUBPEL_BITS;
+	int superres_chroma_step = RS_SCALE_SUBPEL_BITS;
+	int superres_luma_step_invra = RS_SCALE_SUBPEL_BITS;
+	int superres_chroma_step_invra = RS_SCALE_SUBPEL_BITS;
+	int superres_init_luma_subpel_x = 0;
+	int superres_init_chroma_subpel_x = 0;
+	int superres_is_scaled = 0;
+	int min_w = min_t(uint32_t, 16, frame->upscaled_width);
+	int upscaled_luma, downscaled_luma;
+	int downscaled_chroma, upscaled_chroma;
+	int step_luma, step_chroma;
+	int err_luma, err_chroma;
+	int initial_luma, initial_chroma;
+	int width = 0;
+
+	if (frame->flags & V4L2_AV1_FRAME_FLAG_USE_SUPERRES)
+		superres_scale_denominator = frame->superres_denom;
+
+	if (superres_scale_denominator <= SCALE_NUMERATOR)
+		goto set_regs;
+
+	width = (frame->upscaled_width * SCALE_NUMERATOR +
+		(superres_scale_denominator / 2)) / superres_scale_denominator;
+
+	if (width < min_w)
+		width = min_w;
+
+	if (width == frame->upscaled_width)
+		goto set_regs;
+
+	superres_is_scaled = 1;
+	upscaled_luma = frame->upscaled_width;
+	downscaled_luma = width;
+	downscaled_chroma = (downscaled_luma + 1) >> 1;
+	upscaled_chroma = (upscaled_luma + 1) >> 1;
+	step_luma =
+		((downscaled_luma << RS_SCALE_SUBPEL_BITS) +
+		 (upscaled_luma / 2)) / upscaled_luma;
+	step_chroma =
+		((downscaled_chroma << RS_SCALE_SUBPEL_BITS) +
+		 (upscaled_chroma / 2)) / upscaled_chroma;
+	err_luma =
+		(upscaled_luma * step_luma)
+		- (downscaled_luma << RS_SCALE_SUBPEL_BITS);
+	err_chroma =
+		(upscaled_chroma * step_chroma)
+		- (downscaled_chroma << RS_SCALE_SUBPEL_BITS);
+	initial_luma =
+		((-((upscaled_luma - downscaled_luma) << (RS_SCALE_SUBPEL_BITS - 1))
+		  + upscaled_luma / 2)
+		 / upscaled_luma + (1 << (RS_SCALE_EXTRA_BITS - 1)) - err_luma / 2)
+		& RS_SCALE_SUBPEL_MASK;
+	initial_chroma =
+		((-((upscaled_chroma - downscaled_chroma) << (RS_SCALE_SUBPEL_BITS - 1))
+		  + upscaled_chroma / 2)
+		 / upscaled_chroma + (1 << (RS_SCALE_EXTRA_BITS - 1)) - err_chroma / 2)
+		& RS_SCALE_SUBPEL_MASK;
+	superres_luma_step = step_luma;
+	superres_chroma_step = step_chroma;
+	superres_luma_step_invra =
+		((upscaled_luma << RS_SCALE_SUBPEL_BITS) + (downscaled_luma / 2))
+		/ downscaled_luma;
+	superres_chroma_step_invra =
+		((upscaled_chroma << RS_SCALE_SUBPEL_BITS) + (downscaled_chroma / 2))
+		/ downscaled_chroma;
+	superres_init_luma_subpel_x = initial_luma;
+	superres_init_chroma_subpel_x = initial_chroma;
+
+set_regs:
+	hantro_reg_write(vpu, &av1_superres_pic_width, frame->upscaled_width);
+
+	if (frame->flags & V4L2_AV1_FRAME_FLAG_USE_SUPERRES)
+		hantro_reg_write(vpu, &av1_scale_denom_minus9,
+				 frame->superres_denom - SUPERRES_SCALE_DENOMINATOR_MIN);
+	else
+		hantro_reg_write(vpu, &av1_scale_denom_minus9, frame->superres_denom);
+
+	hantro_reg_write(vpu, &av1_superres_luma_step, superres_luma_step);
+	hantro_reg_write(vpu, &av1_superres_chroma_step, superres_chroma_step);
+	hantro_reg_write(vpu, &av1_superres_luma_step_invra,
+			 superres_luma_step_invra);
+	hantro_reg_write(vpu, &av1_superres_chroma_step_invra,
+			 superres_chroma_step_invra);
+	hantro_reg_write(vpu, &av1_superres_init_luma_subpel_x,
+			 superres_init_luma_subpel_x);
+	hantro_reg_write(vpu, &av1_superres_init_chroma_subpel_x,
+			 superres_init_chroma_subpel_x);
+	hantro_reg_write(vpu, &av1_superres_is_scaled, superres_is_scaled);
+
+	hantro_write_addr(vpu, AV1_SR_COL, av1_dec->sr_col.dma);
+}
+
+static void rockchip_vpu981_av1_dec_set_picture_dimensions(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	struct hantro_dev *vpu = ctx->dev;
+	int pic_width_in_cbs = DIV_ROUND_UP(frame->frame_width_minus_1 + 1, 8);
+	int pic_height_in_cbs = DIV_ROUND_UP(frame->frame_height_minus_1 + 1, 8);
+	int pic_width_pad = ALIGN(frame->frame_width_minus_1 + 1, 8)
+			    - (frame->frame_width_minus_1 + 1);
+	int pic_height_pad = ALIGN(frame->frame_height_minus_1 + 1, 8)
+			     - (frame->frame_height_minus_1 + 1);
+
+	hantro_reg_write(vpu, &av1_pic_width_in_cbs, pic_width_in_cbs);
+	hantro_reg_write(vpu, &av1_pic_height_in_cbs, pic_height_in_cbs);
+	hantro_reg_write(vpu, &av1_pic_width_pad, pic_width_pad);
+	hantro_reg_write(vpu, &av1_pic_height_pad, pic_height_pad);
+
+	rockchip_vpu981_av1_dec_set_superres_params(ctx);
+}
+
+static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	struct hantro_dev *vpu = ctx->dev;
+	bool use_ref_frame_mvs =
+	    !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_USE_REF_FRAME_MVS);
+	int cur_frame_offset = frame->order_hint;
+	int alt_frame_offset = 0;
+	int gld_frame_offset = 0;
+	int bwd_frame_offset = 0;
+	int alt2_frame_offset = 0;
+	int refs_selected[3] = { 0, 0, 0 };
+	int cur_mi_cols = DIV_ROUND_UP(frame->frame_width_minus_1 + 1, 8);
+	int cur_mi_rows = DIV_ROUND_UP(frame->frame_height_minus_1 + 1, 8);
+	int cur_offset[V4L2_AV1_TOTAL_REFS_PER_FRAME - 1];
+	int cur_roffset[V4L2_AV1_TOTAL_REFS_PER_FRAME - 1];
+	int mf_types[3] = { 0, 0, 0 };
+	int ref_stamp = 2;
+	int ref_ind = 0;
+	int rf, idx;
+
+	alt_frame_offset = rockchip_vpu981_get_order_hint(ctx, ALT_BUF_IDX);
+	gld_frame_offset = rockchip_vpu981_get_order_hint(ctx, GLD_BUF_IDX);
+	bwd_frame_offset = rockchip_vpu981_get_order_hint(ctx, BWD_BUF_IDX);
+	alt2_frame_offset = rockchip_vpu981_get_order_hint(ctx, ALT2_BUF_IDX);
+
+	idx = rockchip_vpu981_get_frame_index(ctx, LST_BUF_IDX);
+	if (idx >= 0) {
+		int alt_frame_offset_in_lst =
+			av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_ALTREF_FRAME];
+		bool is_lst_overlay =
+		    (alt_frame_offset_in_lst == gld_frame_offset);
+
+		if (!is_lst_overlay) {
+			int lst_mi_cols = av1_dec->frame_refs[idx].mi_cols;
+			int lst_mi_rows = av1_dec->frame_refs[idx].mi_rows;
+			bool lst_intra_only =
+			    IS_INTRA(av1_dec->frame_refs[idx].frame_type);
+
+			if (lst_mi_cols == cur_mi_cols
+			    && lst_mi_rows == cur_mi_rows && !lst_intra_only) {
+				mf_types[ref_ind] = V4L2_AV1_REF_LAST_FRAME;
+				refs_selected[ref_ind++] = LST_BUF_IDX;
+			}
+		}
+		ref_stamp--;
+	}
+
+	idx = rockchip_vpu981_get_frame_index(ctx, BWD_BUF_IDX);
+	if (rockchip_vpu981_av1_dec_get_relative_dist
+	    (ctx, bwd_frame_offset, cur_frame_offset) > 0) {
+		int bwd_mi_cols = av1_dec->frame_refs[idx].mi_cols;
+		int bwd_mi_rows = av1_dec->frame_refs[idx].mi_rows;
+		bool bwd_intra_only =
+		    IS_INTRA(av1_dec->frame_refs[idx].frame_type);
+
+		if (bwd_mi_cols == cur_mi_cols && bwd_mi_rows == cur_mi_rows &&
+		    !bwd_intra_only) {
+			mf_types[ref_ind] = V4L2_AV1_REF_BWDREF_FRAME;
+			refs_selected[ref_ind++] = BWD_BUF_IDX;
+			ref_stamp--;
+		}
+	}
+
+	idx = rockchip_vpu981_get_frame_index(ctx, ALT2_BUF_IDX);
+	if (rockchip_vpu981_av1_dec_get_relative_dist
+	    (ctx, alt2_frame_offset, cur_frame_offset) > 0) {
+		int alt2_mi_cols = av1_dec->frame_refs[idx].mi_cols;
+		int alt2_mi_rows = av1_dec->frame_refs[idx].mi_rows;
+		bool alt2_intra_only =
+		    IS_INTRA(av1_dec->frame_refs[idx].frame_type);
+
+		if (alt2_mi_cols == cur_mi_cols && alt2_mi_rows == cur_mi_rows
+		    && !alt2_intra_only) {
+			mf_types[ref_ind] = V4L2_AV1_REF_ALTREF2_FRAME;
+			refs_selected[ref_ind++] = ALT2_BUF_IDX;
+			ref_stamp--;
+		}
+	}
+
+	idx = rockchip_vpu981_get_frame_index(ctx, ALT_BUF_IDX);
+	if (rockchip_vpu981_av1_dec_get_relative_dist
+	    (ctx, alt_frame_offset, cur_frame_offset) > 0 && ref_stamp >= 0) {
+		int alt_mi_cols = av1_dec->frame_refs[idx].mi_cols;
+		int alt_mi_rows = av1_dec->frame_refs[idx].mi_rows;
+		bool alt_intra_only =
+		    IS_INTRA(av1_dec->frame_refs[idx].frame_type);
+
+		if (alt_mi_cols == cur_mi_cols && alt_mi_rows == cur_mi_rows &&
+		    !alt_intra_only) {
+			mf_types[ref_ind] = V4L2_AV1_REF_ALTREF_FRAME;
+			refs_selected[ref_ind++] = ALT_BUF_IDX;
+			ref_stamp--;
+		}
+	}
+
+	idx = rockchip_vpu981_get_frame_index(ctx, LST2_BUF_IDX);
+	if (idx >= 0 && ref_stamp >= 0) {
+		int lst2_mi_cols = av1_dec->frame_refs[idx].mi_cols;
+		int lst2_mi_rows = av1_dec->frame_refs[idx].mi_rows;
+		bool lst2_intra_only =
+		    IS_INTRA(av1_dec->frame_refs[idx].frame_type);
+
+		if (lst2_mi_cols == cur_mi_cols && lst2_mi_rows == cur_mi_rows
+		    && !lst2_intra_only) {
+			mf_types[ref_ind] = V4L2_AV1_REF_LAST2_FRAME;
+			refs_selected[ref_ind++] = LST2_BUF_IDX;
+			ref_stamp--;
+		}
+	}
+
+	for (rf = 0; rf < V4L2_AV1_TOTAL_REFS_PER_FRAME - 1; ++rf) {
+		idx = rockchip_vpu981_get_frame_index(ctx, rf);
+		if (idx >= 0) {
+			int rf_order_hint = rockchip_vpu981_get_order_hint(ctx, rf);
+
+			cur_offset[rf] =
+			    rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+								      cur_frame_offset,
+								      rf_order_hint);
+			cur_roffset[rf] =
+			    rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+								      rf_order_hint,
+								      cur_frame_offset);
+		} else {
+			cur_offset[rf] = 0;
+			cur_roffset[rf] = 0;
+		}
+	}
+
+	hantro_reg_write(vpu, &av1_use_temporal0_mvs, 0);
+	hantro_reg_write(vpu, &av1_use_temporal1_mvs, 0);
+	hantro_reg_write(vpu, &av1_use_temporal2_mvs, 0);
+	hantro_reg_write(vpu, &av1_use_temporal3_mvs, 0);
+
+	hantro_reg_write(vpu, &av1_mf1_last_offset, 0);
+	hantro_reg_write(vpu, &av1_mf1_last2_offset, 0);
+	hantro_reg_write(vpu, &av1_mf1_last3_offset, 0);
+	hantro_reg_write(vpu, &av1_mf1_golden_offset, 0);
+	hantro_reg_write(vpu, &av1_mf1_bwdref_offset, 0);
+	hantro_reg_write(vpu, &av1_mf1_altref2_offset, 0);
+	hantro_reg_write(vpu, &av1_mf1_altref_offset, 0);
+
+	if (use_ref_frame_mvs && ref_ind > 0 &&
+	    cur_offset[mf_types[0] - V4L2_AV1_REF_LAST_FRAME] <= MAX_FRAME_DISTANCE
+	    && cur_offset[mf_types[0] - V4L2_AV1_REF_LAST_FRAME] >= -MAX_FRAME_DISTANCE) {
+		int rf_order_hint = rockchip_vpu981_get_order_hint(ctx, refs_selected[0]);
+		int idx = rockchip_vpu981_get_frame_index(ctx, refs_selected[0]);
+		int val;
+
+		hantro_reg_write(vpu, &av1_use_temporal0_mvs, 1);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_LAST_FRAME]);
+		hantro_reg_write(vpu, &av1_mf1_last_offset, val);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_LAST2_FRAME]);
+		hantro_reg_write(vpu, &av1_mf1_last2_offset, val);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_LAST3_FRAME]);
+		hantro_reg_write(vpu, &av1_mf1_last3_offset, val);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_GOLDEN_FRAME]);
+		hantro_reg_write(vpu, &av1_mf1_golden_offset, val);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_BWDREF_FRAME]);
+		hantro_reg_write(vpu, &av1_mf1_bwdref_offset, val);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_ALTREF2_FRAME]);
+		hantro_reg_write(vpu, &av1_mf1_altref2_offset, val);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_ALTREF_FRAME]);
+		hantro_reg_write(vpu, &av1_mf1_altref_offset, val);
+	}
+
+	hantro_reg_write(vpu, &av1_mf2_last_offset, 0);
+	hantro_reg_write(vpu, &av1_mf2_last2_offset, 0);
+	hantro_reg_write(vpu, &av1_mf2_last3_offset, 0);
+	hantro_reg_write(vpu, &av1_mf2_golden_offset, 0);
+	hantro_reg_write(vpu, &av1_mf2_bwdref_offset, 0);
+	hantro_reg_write(vpu, &av1_mf2_altref2_offset, 0);
+	hantro_reg_write(vpu, &av1_mf2_altref_offset, 0);
+
+	if (use_ref_frame_mvs && ref_ind > 1 &&
+	    cur_offset[mf_types[1] - V4L2_AV1_REF_LAST_FRAME] <= MAX_FRAME_DISTANCE
+	    && cur_offset[mf_types[1] - V4L2_AV1_REF_LAST_FRAME] >= -MAX_FRAME_DISTANCE) {
+		int rf_order_hint = rockchip_vpu981_get_order_hint(ctx, refs_selected[1]);
+		int idx = rockchip_vpu981_get_frame_index(ctx, refs_selected[1]);
+		int val;
+
+		hantro_reg_write(vpu, &av1_use_temporal1_mvs, 1);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_LAST_FRAME]);
+		hantro_reg_write(vpu, &av1_mf2_last_offset, val);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_LAST2_FRAME]);
+		hantro_reg_write(vpu, &av1_mf2_last2_offset, val);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_LAST3_FRAME]);
+		hantro_reg_write(vpu, &av1_mf2_last3_offset, val);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_GOLDEN_FRAME]);
+		hantro_reg_write(vpu, &av1_mf2_golden_offset, val);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_BWDREF_FRAME]);
+		hantro_reg_write(vpu, &av1_mf2_bwdref_offset, val);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_ALTREF2_FRAME]);
+		hantro_reg_write(vpu, &av1_mf2_altref2_offset, val);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_ALTREF_FRAME]);
+		hantro_reg_write(vpu, &av1_mf2_altref_offset, val);
+	}
+
+	hantro_reg_write(vpu, &av1_mf3_last_offset, 0);
+	hantro_reg_write(vpu, &av1_mf3_last2_offset, 0);
+	hantro_reg_write(vpu, &av1_mf3_last3_offset, 0);
+	hantro_reg_write(vpu, &av1_mf3_golden_offset, 0);
+	hantro_reg_write(vpu, &av1_mf3_bwdref_offset, 0);
+	hantro_reg_write(vpu, &av1_mf3_altref2_offset, 0);
+	hantro_reg_write(vpu, &av1_mf3_altref_offset, 0);
+
+	if (use_ref_frame_mvs && ref_ind > 2 &&
+	    cur_offset[mf_types[2] - V4L2_AV1_REF_LAST_FRAME] <= MAX_FRAME_DISTANCE
+	    && cur_offset[mf_types[2] - V4L2_AV1_REF_LAST_FRAME] >= -MAX_FRAME_DISTANCE) {
+		int rf_order_hint = rockchip_vpu981_get_order_hint(ctx, refs_selected[2]);
+		int idx = rockchip_vpu981_get_frame_index(ctx, refs_selected[2]);
+		int val;
+
+		hantro_reg_write(vpu, &av1_use_temporal2_mvs, 1);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_LAST_FRAME]);
+		hantro_reg_write(vpu, &av1_mf3_last_offset, val);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_LAST2_FRAME]);
+		hantro_reg_write(vpu, &av1_mf3_last2_offset, val);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_LAST3_FRAME]);
+		hantro_reg_write(vpu, &av1_mf3_last3_offset, val);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_GOLDEN_FRAME]);
+		hantro_reg_write(vpu, &av1_mf3_golden_offset, val);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_BWDREF_FRAME]);
+		hantro_reg_write(vpu, &av1_mf3_bwdref_offset, val);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_ALTREF2_FRAME]);
+		hantro_reg_write(vpu, &av1_mf3_altref2_offset, val);
+
+		val = rockchip_vpu981_av1_dec_get_relative_dist(ctx,
+				rf_order_hint,
+				av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_ALTREF_FRAME]);
+		hantro_reg_write(vpu, &av1_mf3_altref_offset, val);
+	}
+
+	hantro_reg_write(vpu, &av1_cur_last_offset, cur_offset[0]);
+	hantro_reg_write(vpu, &av1_cur_last2_offset, cur_offset[1]);
+	hantro_reg_write(vpu, &av1_cur_last3_offset, cur_offset[2]);
+	hantro_reg_write(vpu, &av1_cur_golden_offset, cur_offset[3]);
+	hantro_reg_write(vpu, &av1_cur_bwdref_offset, cur_offset[4]);
+	hantro_reg_write(vpu, &av1_cur_altref2_offset, cur_offset[5]);
+	hantro_reg_write(vpu, &av1_cur_altref_offset, cur_offset[6]);
+
+	hantro_reg_write(vpu, &av1_cur_last_roffset, cur_roffset[0]);
+	hantro_reg_write(vpu, &av1_cur_last2_roffset, cur_roffset[1]);
+	hantro_reg_write(vpu, &av1_cur_last3_roffset, cur_roffset[2]);
+	hantro_reg_write(vpu, &av1_cur_golden_roffset, cur_roffset[3]);
+	hantro_reg_write(vpu, &av1_cur_bwdref_roffset, cur_roffset[4]);
+	hantro_reg_write(vpu, &av1_cur_altref2_roffset, cur_roffset[5]);
+	hantro_reg_write(vpu, &av1_cur_altref_roffset, cur_roffset[6]);
+
+	hantro_reg_write(vpu, &av1_mf1_type, mf_types[0] - V4L2_AV1_REF_LAST_FRAME);
+	hantro_reg_write(vpu, &av1_mf2_type, mf_types[1] - V4L2_AV1_REF_LAST_FRAME);
+	hantro_reg_write(vpu, &av1_mf3_type, mf_types[2] - V4L2_AV1_REF_LAST_FRAME);
+}
+
+static void rockchip_vpu981_av1_dec_set_reference_frames(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	int frame_type = frame->frame_type;
+	bool allow_intrabc = !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_ALLOW_INTRABC);
+	int ref_count[AV1DEC_MAX_PIC_BUFFERS] = { 0 };
+	struct hantro_dev *vpu = ctx->dev;
+	int i, ref_frames = 0;
+	bool scale_enable = false;
+
+	if (IS_INTRA(frame_type) && !allow_intrabc)
+		return;
+
+	if (!allow_intrabc) {
+		for (i = 0; i < V4L2_AV1_REFS_PER_FRAME; i++) {
+			int idx = rockchip_vpu981_get_frame_index(ctx, i);
+
+			if (idx >= 0)
+				ref_count[idx]++;
+		}
+
+		for (i = 0; i < AV1DEC_MAX_PIC_BUFFERS; i++) {
+			if (ref_count[i])
+				ref_frames++;
+		}
+	} else {
+		ref_frames = 1;
+	}
+	hantro_reg_write(vpu, &av1_ref_frames, ref_frames);
+
+	rockchip_vpu981_av1_dec_set_frame_sign_bias(ctx);
+
+	for (i = V4L2_AV1_REF_LAST_FRAME; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++) {
+		uint32_t ref = i - 1;
+		int idx = 0;
+		int width, height;
+
+		if (allow_intrabc) {
+			idx = av1_dec->current_frame_index;
+			width = frame->frame_width_minus_1 + 1;
+			height = frame->frame_height_minus_1 + 1;
+		} else {
+			if (rockchip_vpu981_get_frame_index(ctx, ref) > 0)
+				idx = rockchip_vpu981_get_frame_index(ctx, ref);
+			width = av1_dec->frame_refs[idx].width;
+			height = av1_dec->frame_refs[idx].height;
+		}
+
+		scale_enable |=
+		    rockchip_vpu981_av1_dec_set_ref(ctx, ref, idx, width,
+						    height);
+
+		rockchip_vpu981_av1_dec_set_sign_bias(ctx, ref,
+						      av1_dec->ref_frame_sign_bias[i]);
+	}
+	hantro_reg_write(vpu, &av1_ref_scaling_enable, scale_enable);
+
+	hantro_reg_write(vpu, &av1_ref0_gm_mode,
+			 frame->global_motion.type[V4L2_AV1_REF_LAST_FRAME]);
+	hantro_reg_write(vpu, &av1_ref1_gm_mode,
+			 frame->global_motion.type[V4L2_AV1_REF_LAST2_FRAME]);
+	hantro_reg_write(vpu, &av1_ref2_gm_mode,
+			 frame->global_motion.type[V4L2_AV1_REF_LAST3_FRAME]);
+	hantro_reg_write(vpu, &av1_ref3_gm_mode,
+			 frame->global_motion.type[V4L2_AV1_REF_GOLDEN_FRAME]);
+	hantro_reg_write(vpu, &av1_ref4_gm_mode,
+			 frame->global_motion.type[V4L2_AV1_REF_BWDREF_FRAME]);
+	hantro_reg_write(vpu, &av1_ref5_gm_mode,
+			 frame->global_motion.type[V4L2_AV1_REF_ALTREF2_FRAME]);
+	hantro_reg_write(vpu, &av1_ref6_gm_mode,
+			 frame->global_motion.type[V4L2_AV1_REF_ALTREF_FRAME]);
+
+	rockchip_vpu981_av1_dec_set_other_frames(ctx);
+}
+
+static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+
+	hantro_reg_write(vpu, &av1_skip_mode,
+			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_SKIP_MODE_PRESENT));
+	hantro_reg_write(vpu, &av1_tempor_mvp_e,
+			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_USE_REF_FRAME_MVS));
+	hantro_reg_write(vpu, &av1_delta_lf_res_log,
+			 ctrls->frame->loop_filter.delta_lf_res);
+	hantro_reg_write(vpu, &av1_delta_lf_multi,
+			 !!(ctrls->frame->loop_filter.flags
+			    & V4L2_AV1_LOOP_FILTER_FLAG_DELTA_LF_MULTI));
+	hantro_reg_write(vpu, &av1_delta_lf_present,
+			 !!(ctrls->frame->loop_filter.flags
+			    & V4L2_AV1_LOOP_FILTER_FLAG_DELTA_LF_PRESENT));
+	hantro_reg_write(vpu, &av1_disable_cdf_update,
+			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_DISABLE_CDF_UPDATE));
+	hantro_reg_write(vpu, &av1_allow_warp,
+			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_ALLOW_WARPED_MOTION));
+	hantro_reg_write(vpu, &av1_show_frame,
+			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_SHOW_FRAME));
+	hantro_reg_write(vpu, &av1_switchable_motion_mode,
+			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_IS_MOTION_MODE_SWITCHABLE));
+	hantro_reg_write(vpu, &av1_enable_cdef,
+			 !!(ctrls->sequence->flags & V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF));
+	hantro_reg_write(vpu, &av1_allow_masked_compound,
+			 !!(ctrls->sequence->flags
+			    & V4L2_AV1_SEQUENCE_FLAG_ENABLE_MASKED_COMPOUND));
+	hantro_reg_write(vpu, &av1_allow_interintra,
+			 !!(ctrls->sequence->flags
+			    & V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTERINTRA_COMPOUND));
+	hantro_reg_write(vpu, &av1_enable_intra_edge_filter,
+			 !!(ctrls->sequence->flags
+			    & V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTRA_EDGE_FILTER));
+	hantro_reg_write(vpu, &av1_allow_filter_intra,
+			 !!(ctrls->sequence->flags & V4L2_AV1_SEQUENCE_FLAG_ENABLE_FILTER_INTRA));
+	hantro_reg_write(vpu, &av1_enable_jnt_comp,
+			 !!(ctrls->sequence->flags & V4L2_AV1_SEQUENCE_FLAG_ENABLE_JNT_COMP));
+	hantro_reg_write(vpu, &av1_enable_dual_filter,
+			 !!(ctrls->sequence->flags & V4L2_AV1_SEQUENCE_FLAG_ENABLE_DUAL_FILTER));
+	hantro_reg_write(vpu, &av1_reduced_tx_set_used,
+			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_REDUCED_TX_SET));
+	hantro_reg_write(vpu, &av1_allow_screen_content_tools,
+			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_ALLOW_SCREEN_CONTENT_TOOLS));
+	hantro_reg_write(vpu, &av1_allow_intrabc,
+			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_ALLOW_INTRABC));
+
+	if (!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_ALLOW_SCREEN_CONTENT_TOOLS))
+		hantro_reg_write(vpu, &av1_force_interger_mv, 0);
+	else
+		hantro_reg_write(vpu, &av1_force_interger_mv,
+				 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_FORCE_INTEGER_MV));
+
+	hantro_reg_write(vpu, &av1_blackwhite_e, 0);
+	hantro_reg_write(vpu, &av1_delta_q_res_log, ctrls->frame->quantization.delta_q_res);
+	hantro_reg_write(vpu, &av1_delta_q_present,
+			 !!(ctrls->frame->quantization.flags
+			    & V4L2_AV1_QUANTIZATION_FLAG_DELTA_Q_PRESENT));
+
+	hantro_reg_write(vpu, &av1_idr_pic_e, !ctrls->frame->frame_type);
+	hantro_reg_write(vpu, &av1_quant_base_qindex, ctrls->frame->quantization.base_q_idx);
+	hantro_reg_write(vpu, &av1_bit_depth_y_minus8, ctx->bit_depth - 8);
+	hantro_reg_write(vpu, &av1_bit_depth_c_minus8, ctx->bit_depth - 8);
+
+	hantro_reg_write(vpu, &av1_mcomp_filt_type, ctrls->frame->interpolation_filter);
+	hantro_reg_write(vpu, &av1_high_prec_mv_e,
+			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_ALLOW_HIGH_PRECISION_MV));
+	hantro_reg_write(vpu, &av1_comp_pred_mode,
+			 (ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_REFERENCE_SELECT) ? 2 : 0);
+	hantro_reg_write(vpu, &av1_transform_mode, (ctrls->frame->tx_mode == 1) ? 3 : 4);
+	hantro_reg_write(vpu, &av1_max_cb_size,
+			 (ctrls->sequence->flags
+			  & V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK) ? 7 : 6);
+	hantro_reg_write(vpu, &av1_min_cb_size, 3);
+
+	hantro_reg_write(vpu, &av1_comp_pred_fixed_ref, 0);
+	hantro_reg_write(vpu, &av1_comp_pred_var_ref0_av1, 0);
+	hantro_reg_write(vpu, &av1_comp_pred_var_ref1_av1, 0);
+	hantro_reg_write(vpu, &av1_filt_level_seg0, 0);
+	hantro_reg_write(vpu, &av1_filt_level_seg1, 0);
+	hantro_reg_write(vpu, &av1_filt_level_seg2, 0);
+	hantro_reg_write(vpu, &av1_filt_level_seg3, 0);
+	hantro_reg_write(vpu, &av1_filt_level_seg4, 0);
+	hantro_reg_write(vpu, &av1_filt_level_seg5, 0);
+	hantro_reg_write(vpu, &av1_filt_level_seg6, 0);
+	hantro_reg_write(vpu, &av1_filt_level_seg7, 0);
+
+	hantro_reg_write(vpu, &av1_qp_delta_y_dc_av1, ctrls->frame->quantization.delta_q_y_dc);
+	hantro_reg_write(vpu, &av1_qp_delta_ch_dc_av1, ctrls->frame->quantization.delta_q_u_dc);
+	hantro_reg_write(vpu, &av1_qp_delta_ch_ac_av1, ctrls->frame->quantization.delta_q_u_ac);
+	if (ctrls->frame->quantization.flags & V4L2_AV1_QUANTIZATION_FLAG_USING_QMATRIX) {
+		hantro_reg_write(vpu, &av1_qmlevel_y, ctrls->frame->quantization.qm_y);
+		hantro_reg_write(vpu, &av1_qmlevel_u, ctrls->frame->quantization.qm_u);
+		hantro_reg_write(vpu, &av1_qmlevel_v, ctrls->frame->quantization.qm_v);
+	} else {
+		hantro_reg_write(vpu, &av1_qmlevel_y, 0xff);
+		hantro_reg_write(vpu, &av1_qmlevel_u, 0xff);
+		hantro_reg_write(vpu, &av1_qmlevel_v, 0xff);
+	}
+
+	hantro_reg_write(vpu, &av1_lossless_e, rockchip_vpu981_av1_dec_is_lossless(ctx));
+	hantro_reg_write(vpu, &av1_quant_delta_v_dc, ctrls->frame->quantization.delta_q_v_dc);
+	hantro_reg_write(vpu, &av1_quant_delta_v_ac, ctrls->frame->quantization.delta_q_v_ac);
+
+	hantro_reg_write(vpu, &av1_skip_ref0,
+			 (ctrls->frame->skip_mode_frame[0]) ? ctrls->frame->skip_mode_frame[0] : 1);
+	hantro_reg_write(vpu, &av1_skip_ref1,
+			 (ctrls->frame->skip_mode_frame[1]) ? ctrls->frame->skip_mode_frame[1] : 1);
+
+	hantro_write_addr(vpu, AV1_MC_SYNC_CURR, av1_dec->tile_buf.dma);
+	hantro_write_addr(vpu, AV1_MC_SYNC_LEFT, av1_dec->tile_buf.dma);
+}
+
+static void
+rockchip_vpu981_av1_dec_set_input_buffer(struct hantro_ctx *ctx,
+					 struct vb2_v4l2_buffer *vb2_src)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_tile_group_entry *group_entry =
+	    ctrls->tile_group_entry;
+	struct hantro_dev *vpu = ctx->dev;
+	dma_addr_t src_dma;
+	u32 src_len, src_buf_len;
+	int start_bit, offset;
+
+	src_dma = vb2_dma_contig_plane_dma_addr(&vb2_src->vb2_buf, 0);
+	src_len = vb2_get_plane_payload(&vb2_src->vb2_buf, 0);
+	src_buf_len = vb2_plane_size(&vb2_src->vb2_buf, 0);
+
+	start_bit = (group_entry[0].tile_offset & 0xf) * 8;
+	offset = group_entry[0].tile_offset & ~0xf;
+
+	hantro_reg_write(vpu, &av1_strm_buffer_len, src_buf_len);
+	hantro_reg_write(vpu, &av1_strm_start_bit, start_bit);
+	hantro_reg_write(vpu, &av1_stream_len, src_len);
+	hantro_reg_write(vpu, &av1_strm_start_offset, 0);
+	hantro_write_addr(vpu, AV1_INPUT_STREAM, src_dma + offset);
+}
+
+static void
+rockchip_vpu981_av1_dec_set_output_buffer(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_decoded_buffer *dst;
+	struct vb2_v4l2_buffer *vb2_dst;
+	dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
+	size_t cr_offset = rockchip_vpu981_av1_dec_luma_size(ctx);
+	size_t mv_offset = rockchip_vpu981_av1_dec_chroma_size(ctx);
+
+	vb2_dst = av1_dec->frame_refs[av1_dec->current_frame_index].vb2_ref;
+	dst = vb2_to_hantro_decoded_buf(&vb2_dst->vb2_buf);
+	luma_addr = hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
+	chroma_addr = luma_addr + cr_offset;
+	mv_addr = luma_addr + mv_offset;
+
+	hantro_write_addr(vpu, AV1_TILE_OUT_LU, luma_addr);
+	hantro_write_addr(vpu, AV1_TILE_OUT_CH, chroma_addr);
+	hantro_write_addr(vpu, AV1_TILE_OUT_MV, mv_addr);
+}
+
+int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct vb2_v4l2_buffer *vb2_src;
+	int ret;
+
+	hantro_start_prepare_run(ctx);
+
+	ret = rockchip_vpu981_av1_dec_prepare_run(ctx);
+	if (ret)
+		goto prepare_error;
+
+	vb2_src = hantro_get_src_buf(ctx);
+	if (!vb2_src)
+		goto prepare_error;
+
+	rockchip_vpu981_av1_dec_clean_refs(ctx);
+	rockchip_vpu981_av1_dec_frame_ref(ctx, vb2_src->vb2_buf.timestamp);
+
+	rockchip_vpu981_av1_dec_set_parameters(ctx);
+	rockchip_vpu981_av1_dec_set_global_model(ctx);
+	rockchip_vpu981_av1_dec_set_tile_info(ctx);
+	rockchip_vpu981_av1_dec_set_reference_frames(ctx);
+	rockchip_vpu981_av1_dec_set_segmentation(ctx);
+	rockchip_vpu981_av1_dec_set_loopfilter(ctx);
+	rockchip_vpu981_av1_dec_set_picture_dimensions(ctx);
+	rockchip_vpu981_av1_dec_set_cdef(ctx);
+	rockchip_vpu981_av1_dec_set_lr(ctx);
+	rockchip_vpu981_av1_dec_set_prob(ctx);
+
+	hantro_reg_write(vpu, &av1_dec_mode, AV1_DEC_MODE);
+	hantro_reg_write(vpu, &av1_dec_out_ec_byte_word, 0);
+	hantro_reg_write(vpu, &av1_write_mvs_e, 1);
+	hantro_reg_write(vpu, &av1_dec_out_ec_bypass, 1);
+	hantro_reg_write(vpu, &av1_dec_clk_gate_e, 1);
+
+	hantro_reg_write(vpu, &av1_dec_abort_e, 0);
+	hantro_reg_write(vpu, &av1_dec_tile_int_e, 0);
+
+	hantro_reg_write(vpu, &av1_dec_alignment, 64);
+	hantro_reg_write(vpu, &av1_apf_disable, 0);
+	hantro_reg_write(vpu, &av1_apf_threshold, 8);
+	hantro_reg_write(vpu, &av1_dec_buswidth, 2);
+	hantro_reg_write(vpu, &av1_dec_max_burst, 16);
+	hantro_reg_write(vpu, &av1_error_conceal_e, 0);
+	hantro_reg_write(vpu, &av1_axi_rd_ostd_threshold, 64);
+	hantro_reg_write(vpu, &av1_axi_wr_ostd_threshold, 64);
+
+	hantro_reg_write(vpu, &av1_ext_timeout_cycles, 0xfffffff);
+	hantro_reg_write(vpu, &av1_ext_timeout_override_e, 1);
+	hantro_reg_write(vpu, &av1_timeout_cycles, 0xfffffff);
+	hantro_reg_write(vpu, &av1_timeout_override_e, 1);
+
+	rockchip_vpu981_av1_dec_set_output_buffer(ctx);
+	rockchip_vpu981_av1_dec_set_input_buffer(ctx, vb2_src);
+
+	hantro_end_prepare_run(ctx);
+
+	hantro_reg_write(vpu, &av1_dec_e, 1);
+
+	return 0;
+
+prepare_error:
+	hantro_end_prepare_run(ctx);
+	hantro_irq_done(vpu, VB2_BUF_STATE_ERROR);
+	return ret;
+}
+
+static void rockchip_vpu981_postproc_enable(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	int width = ctx->dst_fmt.width;
+	int height = ctx->dst_fmt.height;
+	struct vb2_v4l2_buffer *vb2_dst;
+	size_t chroma_offset;
+	dma_addr_t dst_dma;
+
+	vb2_dst = hantro_get_dst_buf(ctx);
+
+	dst_dma = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
+	chroma_offset = ctx->dst_fmt.plane_fmt[0].bytesperline *
+	    ctx->dst_fmt.height;
+
+	/* enable post processor */
+	hantro_reg_write(vpu, &av1_pp_out_e, 1);
+	hantro_reg_write(vpu, &av1_pp_in_format, 0);
+	hantro_reg_write(vpu, &av1_pp0_dup_hor, 1);
+	hantro_reg_write(vpu, &av1_pp0_dup_ver, 1);
+
+	hantro_reg_write(vpu, &av1_pp_in_height, height / 2);
+	hantro_reg_write(vpu, &av1_pp_in_width, width / 2);
+	hantro_reg_write(vpu, &av1_pp_out_height, height);
+	hantro_reg_write(vpu, &av1_pp_out_width, width);
+	hantro_reg_write(vpu, &av1_pp_out_y_stride,
+			 ctx->dst_fmt.plane_fmt[0].bytesperline);
+	hantro_reg_write(vpu, &av1_pp_out_c_stride,
+			 ctx->dst_fmt.plane_fmt[0].bytesperline);
+	switch (ctx->dst_fmt.pixelformat) {
+	case V4L2_PIX_FMT_P010:
+		hantro_reg_write(vpu, &av1_pp_out_format, 1);
+		break;
+	case V4L2_PIX_FMT_NV12:
+		hantro_reg_write(vpu, &av1_pp_out_format, 3);
+		break;
+	default:
+		hantro_reg_write(vpu, &av1_pp_out_format, 0);
+	}
+
+	hantro_reg_write(vpu, &av1_ppd_blend_exist, 0);
+	hantro_reg_write(vpu, &av1_ppd_dith_exist, 0);
+	hantro_reg_write(vpu, &av1_ablend_crop_e, 0);
+	hantro_reg_write(vpu, &av1_pp_format_customer1_e, 0);
+	hantro_reg_write(vpu, &av1_pp_crop_exist, 0);
+	hantro_reg_write(vpu, &av1_pp_up_level, 0);
+	hantro_reg_write(vpu, &av1_pp_down_level, 0);
+	hantro_reg_write(vpu, &av1_pp_exist, 0);
+
+	hantro_write_addr(vpu, AV1_PP_OUT_LU, dst_dma);
+	hantro_write_addr(vpu, AV1_PP_OUT_CH, dst_dma + chroma_offset);
+}
+
+static void rockchip_vpu981_postproc_disable(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	/* disable post processor */
+	hantro_reg_write(vpu, &av1_pp_out_e, 0);
+}
+
+const struct hantro_postproc_ops rockchip_vpu981_postproc_ops = {
+	.enable = rockchip_vpu981_postproc_enable,
+	.disable = rockchip_vpu981_postproc_disable,
+};
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h b/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
new file mode 100644
index 000000000000..182e6c830ff6
--- /dev/null
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
@@ -0,0 +1,477 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022, Collabora
+ *
+ * Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
+ */
+
+#ifndef _ROCKCHIP_VPU981_REGS_H_
+#define _ROCKCHIP_VPU981_REGS_H_
+
+#include "hantro.h"
+
+#define AV1_SWREG(nr)	((nr) * 4)
+
+#define AV1_DEC_REG(b, s, m) \
+	((const struct hantro_reg) { \
+		.base = AV1_SWREG(b), \
+		.shift = s, \
+		.mask = m, \
+	})
+
+#define AV1_REG_INTERRUPT		AV1_SWREG(1)
+#define AV1_REG_INTERRUPT_DEC_RDY_INT	BIT(12)
+
+#define AV1_REG_CONFIG			AV1_SWREG(2)
+#define AV1_REG_CONFIG_DEC_CLK_GATE_E	BIT(10)
+
+#define av1_dec_e			AV1_DEC_REG(1, 0, 0x1)
+#define av1_dec_abort_e			AV1_DEC_REG(1, 5, 0x1)
+#define av1_dec_tile_int_e		AV1_DEC_REG(1, 7, 0x1)
+
+#define av1_dec_clk_gate_e		AV1_DEC_REG(2, 10, 0x1)
+
+#define av1_dec_out_ec_bypass		AV1_DEC_REG(3, 8,  0x1)
+#define av1_write_mvs_e			AV1_DEC_REG(3, 12, 0x1)
+#define av1_filtering_dis		AV1_DEC_REG(3, 14, 0x1)
+#define av1_dec_out_dis			AV1_DEC_REG(3, 15, 0x1)
+#define av1_dec_out_ec_byte_word	AV1_DEC_REG(3, 16, 0x1)
+#define av1_skip_mode			AV1_DEC_REG(3, 26, 0x1)
+#define av1_dec_mode			AV1_DEC_REG(3, 27, 0x1f)
+
+#define av1_ref_frames			AV1_DEC_REG(4, 0, 0xf)
+#define av1_pic_height_in_cbs		AV1_DEC_REG(4, 6, 0x1fff)
+#define av1_pic_width_in_cbs		AV1_DEC_REG(4, 19, 0x1fff)
+
+#define av1_ref_scaling_enable		AV1_DEC_REG(5, 0, 0x1)
+#define av1_filt_level_base_gt32	AV1_DEC_REG(5, 1, 0x1)
+#define av1_error_resilient		AV1_DEC_REG(5, 2, 0x1)
+#define av1_force_interger_mv		AV1_DEC_REG(5, 3, 0x1)
+#define av1_allow_intrabc		AV1_DEC_REG(5, 4, 0x1)
+#define av1_allow_screen_content_tools	AV1_DEC_REG(5, 5, 0x1)
+#define av1_reduced_tx_set_used		AV1_DEC_REG(5, 6, 0x1)
+#define av1_enable_dual_filter		AV1_DEC_REG(5, 7, 0x1)
+#define av1_enable_jnt_comp		AV1_DEC_REG(5, 8, 0x1)
+#define av1_allow_filter_intra		AV1_DEC_REG(5, 9, 0x1)
+#define av1_enable_intra_edge_filter	AV1_DEC_REG(5, 10, 0x1)
+#define av1_tempor_mvp_e		AV1_DEC_REG(5, 11, 0x1)
+#define av1_allow_interintra		AV1_DEC_REG(5, 12, 0x1)
+#define av1_allow_masked_compound	AV1_DEC_REG(5, 13, 0x1)
+#define av1_enable_cdef			AV1_DEC_REG(5, 14, 0x1)
+#define av1_switchable_motion_mode	AV1_DEC_REG(5, 15, 0x1)
+#define av1_show_frame			AV1_DEC_REG(5, 16, 0x1)
+#define av1_superres_is_scaled		AV1_DEC_REG(5, 17, 0x1)
+#define av1_allow_warp			AV1_DEC_REG(5, 18, 0x1)
+#define av1_disable_cdf_update		AV1_DEC_REG(5, 19, 0x1)
+#define av1_preskip_segid		AV1_DEC_REG(5, 20, 0x1)
+#define av1_delta_lf_present		AV1_DEC_REG(5, 21, 0x1)
+#define av1_delta_lf_multi		AV1_DEC_REG(5, 22, 0x1)
+#define av1_delta_lf_res_log		AV1_DEC_REG(5, 23, 0x3)
+#define av1_strm_start_bit		AV1_DEC_REG(5, 25, 0x7f)
+
+#define	av1_stream_len			AV1_DEC_REG(6, 0, 0xffffffff)
+
+#define av1_delta_q_present		AV1_DEC_REG(7, 0, 0x1)
+#define av1_delta_q_res_log		AV1_DEC_REG(7, 1, 0x3)
+#define av1_cdef_damping		AV1_DEC_REG(7, 3, 0x3)
+#define av1_cdef_bits			AV1_DEC_REG(7, 5, 0x3)
+#define av1_apply_grain			AV1_DEC_REG(7, 7, 0x1)
+#define av1_num_y_points_b		AV1_DEC_REG(7, 8, 0x1)
+#define av1_num_cb_points_b		AV1_DEC_REG(7, 9, 0x1)
+#define av1_num_cr_points_b		AV1_DEC_REG(7, 10, 0x1)
+#define av1_overlap_flag		AV1_DEC_REG(7, 11, 0x1)
+#define av1_clip_to_restricted_range	AV1_DEC_REG(7, 12, 0x1)
+#define av1_chroma_scaling_from_luma	AV1_DEC_REG(7, 13, 0x1)
+#define av1_random_seed			AV1_DEC_REG(7, 14, 0xffff)
+#define av1_blackwhite_e		AV1_DEC_REG(7, 30, 0x1)
+
+#define av1_scaling_shift		AV1_DEC_REG(8, 0, 0xf)
+#define av1_bit_depth_c_minus8		AV1_DEC_REG(8, 4, 0x3)
+#define av1_bit_depth_y_minus8		AV1_DEC_REG(8, 6, 0x3)
+#define av1_quant_base_qindex		AV1_DEC_REG(8, 8, 0xff)
+#define av1_idr_pic_e			AV1_DEC_REG(8, 16, 0x1)
+#define av1_superres_pic_width		AV1_DEC_REG(8, 17, 0x7fff)
+
+#define av1_ref4_sign_bias		AV1_DEC_REG(9, 2, 0x1)
+#define av1_ref5_sign_bias		AV1_DEC_REG(9, 3, 0x1)
+#define av1_ref6_sign_bias		AV1_DEC_REG(9, 4, 0x1)
+#define av1_mf1_type			AV1_DEC_REG(9, 5, 0x7)
+#define av1_mf2_type			AV1_DEC_REG(9, 8, 0x7)
+#define av1_mf3_type			AV1_DEC_REG(9, 11, 0x7)
+#define av1_scale_denom_minus9		AV1_DEC_REG(9, 14, 0x7)
+#define av1_last_active_seg		AV1_DEC_REG(9, 17, 0x7)
+#define av1_context_update_tile_id	AV1_DEC_REG(9, 20, 0xfff)
+
+#define av1_tile_transpose		AV1_DEC_REG(10, 0, 0x1)
+#define av1_tile_enable			AV1_DEC_REG(10, 1, 0x1)
+#define av1_multicore_full_width	AV1_DEC_REG(10,	2, 0xff)
+#define av1_num_tile_rows_8k		AV1_DEC_REG(10, 10, 0x7f)
+#define av1_num_tile_cols_8k		AV1_DEC_REG(10, 17, 0x7f)
+#define av1_multicore_tile_start_x	AV1_DEC_REG(10, 24, 0xff)
+
+#define av1_use_temporal3_mvs		AV1_DEC_REG(11, 0, 0x1)
+#define av1_use_temporal2_mvs		AV1_DEC_REG(11, 1, 0x1)
+#define av1_use_temporal1_mvs		AV1_DEC_REG(11, 2, 0x1)
+#define av1_use_temporal0_mvs		AV1_DEC_REG(11, 3, 0x1)
+#define av1_comp_pred_mode		AV1_DEC_REG(11, 4, 0x3)
+#define av1_high_prec_mv_e		AV1_DEC_REG(11, 7, 0x1)
+#define av1_mcomp_filt_type		AV1_DEC_REG(11, 8, 0x7)
+#define av1_multicore_expect_context_update	AV1_DEC_REG(11, 11, 0x1)
+#define av1_multicore_sbx_offset	AV1_DEC_REG(11, 12, 0x7f)
+#define av1_ulticore_tile_col		AV1_DEC_REG(11, 19, 0x7f)
+#define av1_transform_mode		AV1_DEC_REG(11, 27, 0x7)
+#define av1_dec_tile_size_mag		AV1_DEC_REG(11, 30, 0x3)
+
+#define av1_seg_quant_sign		AV1_DEC_REG(12, 2, 0xff)
+#define av1_max_cb_size			AV1_DEC_REG(12, 10, 0x7)
+#define av1_min_cb_size			AV1_DEC_REG(12, 13, 0x7)
+#define av1_comp_pred_fixed_ref		AV1_DEC_REG(12, 16, 0x7)
+#define av1_multicore_tile_width	AV1_DEC_REG(12, 19, 0x7f)
+#define av1_pic_height_pad		AV1_DEC_REG(12, 26, 0x7)
+#define av1_pic_width_pad		AV1_DEC_REG(12, 29, 0x7)
+
+#define av1_segment_e			AV1_DEC_REG(13, 0, 0x1)
+#define av1_segment_upd_e		AV1_DEC_REG(13, 1, 0x1)
+#define av1_segment_temp_upd_e		AV1_DEC_REG(13, 2, 0x1)
+#define av1_comp_pred_var_ref0_av1	AV1_DEC_REG(13, 3, 0x7)
+#define av1_comp_pred_var_ref1_av1	AV1_DEC_REG(13, 6, 0x7)
+#define av1_lossless_e			AV1_DEC_REG(13, 9, 0x1)
+#define av1_qp_delta_ch_ac_av1		AV1_DEC_REG(13, 11, 0x7f)
+#define av1_qp_delta_ch_dc_av1		AV1_DEC_REG(13, 18, 0x7f)
+#define av1_qp_delta_y_dc_av1		AV1_DEC_REG(13, 25, 0x7f)
+
+#define av1_quant_seg0			AV1_DEC_REG(14, 0, 0xff)
+#define av1_filt_level_seg0		AV1_DEC_REG(14, 8, 0x3f)
+#define av1_skip_seg0			AV1_DEC_REG(14, 14, 0x1)
+#define av1_refpic_seg0			AV1_DEC_REG(14, 15, 0xf)
+#define av1_filt_level_delta0_seg0	AV1_DEC_REG(14, 19, 0x7f)
+#define av1_filt_level0			AV1_DEC_REG(14, 26, 0x3f)
+
+#define av1_quant_seg1			AV1_DEC_REG(15, 0, 0xff)
+#define av1_filt_level_seg1		AV1_DEC_REG(15, 8, 0x3f)
+#define av1_skip_seg1			AV1_DEC_REG(15, 14, 0x1)
+#define av1_refpic_seg1			AV1_DEC_REG(15, 15, 0xf)
+#define av1_filt_level_delta0_seg1	AV1_DEC_REG(15, 19, 0x7f)
+#define av1_filt_level1			AV1_DEC_REG(15, 26, 0x3f)
+
+#define av1_quant_seg2			AV1_DEC_REG(16, 0, 0xff)
+#define av1_filt_level_seg2		AV1_DEC_REG(16, 8, 0x3f)
+#define av1_skip_seg2			AV1_DEC_REG(16, 14, 0x1)
+#define av1_refpic_seg2			AV1_DEC_REG(16, 15, 0xf)
+#define av1_filt_level_delta0_seg2	AV1_DEC_REG(16, 19, 0x7f)
+#define av1_filt_level2			AV1_DEC_REG(16, 26, 0x3f)
+
+#define av1_quant_seg3			AV1_DEC_REG(17, 0, 0xff)
+#define av1_filt_level_seg3		AV1_DEC_REG(17, 8, 0x3f)
+#define av1_skip_seg3			AV1_DEC_REG(17, 14, 0x1)
+#define av1_refpic_seg3			AV1_DEC_REG(17, 15, 0xf)
+#define av1_filt_level_delta0_seg3	AV1_DEC_REG(17, 19, 0x7f)
+#define av1_filt_level3			AV1_DEC_REG(17, 26, 0x3f)
+
+#define av1_quant_seg4			AV1_DEC_REG(18, 0, 0xff)
+#define av1_filt_level_seg4		AV1_DEC_REG(18, 8, 0x3f)
+#define av1_skip_seg4			AV1_DEC_REG(18, 14, 0x1)
+#define av1_refpic_seg4			AV1_DEC_REG(18, 15, 0xf)
+#define av1_filt_level_delta0_seg4	AV1_DEC_REG(18, 19, 0x7f)
+#define av1_lr_type			AV1_DEC_REG(18, 26, 0x3f)
+
+#define av1_quant_seg5			AV1_DEC_REG(19, 0, 0xff)
+#define av1_filt_level_seg5		AV1_DEC_REG(19, 8, 0x3f)
+#define av1_skip_seg5			AV1_DEC_REG(19, 14, 0x1)
+#define av1_refpic_seg5			AV1_DEC_REG(19, 15, 0xf)
+#define av1_filt_level_delta0_seg5	AV1_DEC_REG(19, 19, 0x7f)
+#define av1_lr_unit_size		AV1_DEC_REG(19, 26, 0x3f)
+
+#define av1_filt_level_delta1_seg0	AV1_DEC_REG(20, 0, 0x7f)
+#define av1_filt_level_delta2_seg0	AV1_DEC_REG(20, 7, 0x7f)
+#define av1_filt_level_delta3_seg0	AV1_DEC_REG(20, 14, 0x7f)
+#define av1_global_mv_seg0		AV1_DEC_REG(20, 21, 0x1)
+#define av1_mf1_last_offset		AV1_DEC_REG(20, 22, 0x1ff)
+
+#define av1_filt_level_delta1_seg1	AV1_DEC_REG(21, 0, 0x7f)
+#define av1_filt_level_delta2_seg1	AV1_DEC_REG(21, 7, 0x7f)
+#define av1_filt_level_delta3_seg1	AV1_DEC_REG(21, 14, 0x7f)
+#define av1_global_mv_seg1		AV1_DEC_REG(21, 21, 0x1)
+#define av1_mf1_last2_offset		AV1_DEC_REG(21, 22, 0x1ff)
+
+#define av1_filt_level_delta1_seg2	AV1_DEC_REG(22, 0, 0x7f)
+#define av1_filt_level_delta2_seg2	AV1_DEC_REG(22, 7, 0x7f)
+#define av1_filt_level_delta3_seg2	AV1_DEC_REG(22, 14, 0x7f)
+#define av1_global_mv_seg2		AV1_DEC_REG(22, 21, 0x1)
+#define av1_mf1_last3_offset		AV1_DEC_REG(22, 22, 0x1ff)
+
+#define av1_filt_level_delta1_seg3	AV1_DEC_REG(23, 0, 0x7f)
+#define av1_filt_level_delta2_seg3	AV1_DEC_REG(23, 7, 0x7f)
+#define av1_filt_level_delta3_seg3	AV1_DEC_REG(23, 14, 0x7f)
+#define av1_global_mv_seg3		AV1_DEC_REG(23, 21, 0x1)
+#define av1_mf1_golden_offset		AV1_DEC_REG(23, 22, 0x1ff)
+
+#define av1_filt_level_delta1_seg4	AV1_DEC_REG(24, 0, 0x7f)
+#define av1_filt_level_delta2_seg4	AV1_DEC_REG(24, 7, 0x7f)
+#define av1_filt_level_delta3_seg4	AV1_DEC_REG(24, 14, 0x7f)
+#define av1_global_mv_seg4		AV1_DEC_REG(24, 21, 0x1)
+#define av1_mf1_bwdref_offset		AV1_DEC_REG(24, 22, 0x1ff)
+
+#define av1_filt_level_delta1_seg5	AV1_DEC_REG(25, 0, 0x7f)
+#define av1_filt_level_delta2_seg5	AV1_DEC_REG(25, 7, 0x7f)
+#define av1_filt_level_delta3_seg5	AV1_DEC_REG(25, 14, 0x7f)
+#define av1_global_mv_seg5		AV1_DEC_REG(25, 21, 0x1)
+#define av1_mf1_altref2_offset		AV1_DEC_REG(25, 22, 0x1ff)
+
+#define av1_filt_level_delta1_seg6	AV1_DEC_REG(26, 0, 0x7f)
+#define av1_filt_level_delta2_seg6	AV1_DEC_REG(26, 7, 0x7f)
+#define av1_filt_level_delta3_seg6	AV1_DEC_REG(26, 14, 0x7f)
+#define av1_global_mv_seg6		AV1_DEC_REG(26, 21, 0x1)
+#define av1_mf1_altref_offset		AV1_DEC_REG(26, 22, 0x1ff)
+
+#define av1_filt_level_delta1_seg7	AV1_DEC_REG(27, 0, 0x7f)
+#define av1_filt_level_delta2_seg7	AV1_DEC_REG(27, 7, 0x7f)
+#define av1_filt_level_delta3_seg7	AV1_DEC_REG(27, 14, 0x7f)
+#define av1_global_mv_seg7		AV1_DEC_REG(27, 21, 0x1)
+#define av1_mf2_last_offset		AV1_DEC_REG(27, 22, 0x1ff)
+
+#define av1_cb_offset			AV1_DEC_REG(28, 0, 0x1ff)
+#define av1_cb_luma_mult		AV1_DEC_REG(28, 9, 0xff)
+#define av1_cb_mult			AV1_DEC_REG(28, 17, 0xff)
+#define	av1_quant_delta_v_dc		AV1_DEC_REG(28, 25, 0x7f)
+
+#define av1_cr_offset			AV1_DEC_REG(29, 0, 0x1ff)
+#define av1_cr_luma_mult		AV1_DEC_REG(29, 9, 0xff)
+#define av1_cr_mult			AV1_DEC_REG(29, 17, 0xff)
+#define	av1_quant_delta_v_ac		AV1_DEC_REG(29, 25, 0x7f)
+
+#define av1_filt_ref_adj_5		AV1_DEC_REG(30, 0, 0x7f)
+#define av1_filt_ref_adj_4		AV1_DEC_REG(30, 7, 0x7f)
+#define av1_filt_mb_adj_1		AV1_DEC_REG(30, 14, 0x7f)
+#define av1_filt_mb_adj_0		AV1_DEC_REG(30, 21, 0x7f)
+#define av1_filt_sharpness		AV1_DEC_REG(30, 28, 0x7)
+
+#define av1_quant_seg6			AV1_DEC_REG(31, 0, 0xff)
+#define av1_filt_level_seg6		AV1_DEC_REG(31, 8, 0x3f)
+#define av1_skip_seg6			AV1_DEC_REG(31, 14, 0x1)
+#define av1_refpic_seg6			AV1_DEC_REG(31, 15, 0xf)
+#define av1_filt_level_delta0_seg6	AV1_DEC_REG(31, 19, 0x7f)
+#define av1_skip_ref0			AV1_DEC_REG(31, 26, 0xf)
+
+#define av1_quant_seg7			AV1_DEC_REG(32, 0, 0xff)
+#define av1_filt_level_seg7		AV1_DEC_REG(32, 8, 0x3f)
+#define av1_skip_seg7			AV1_DEC_REG(32, 14, 0x1)
+#define av1_refpic_seg7			AV1_DEC_REG(32, 15, 0xf)
+#define av1_filt_level_delta0_seg7	AV1_DEC_REG(32, 19, 0x7f)
+#define av1_skip_ref1			AV1_DEC_REG(32, 26, 0xf)
+
+#define av1_ref0_height			AV1_DEC_REG(33, 0, 0xffff)
+#define av1_ref0_width			AV1_DEC_REG(33, 16, 0xffff)
+
+#define av1_ref1_height			AV1_DEC_REG(34, 0, 0xffff)
+#define av1_ref1_width			AV1_DEC_REG(34, 16, 0xffff)
+
+#define av1_ref2_height			AV1_DEC_REG(35, 0, 0xffff)
+#define av1_ref2_width			AV1_DEC_REG(35, 16, 0xffff)
+
+#define av1_ref0_ver_scale		AV1_DEC_REG(36, 0, 0xffff)
+#define av1_ref0_hor_scale		AV1_DEC_REG(36, 16, 0xffff)
+
+#define av1_ref1_ver_scale		AV1_DEC_REG(37, 0, 0xffff)
+#define av1_ref1_hor_scale		AV1_DEC_REG(37, 16, 0xffff)
+
+#define av1_ref2_ver_scale		AV1_DEC_REG(38, 0, 0xffff)
+#define av1_ref2_hor_scale		AV1_DEC_REG(38, 16, 0xffff)
+
+#define av1_ref3_ver_scale		AV1_DEC_REG(39, 0, 0xffff)
+#define av1_ref3_hor_scale		AV1_DEC_REG(39, 16, 0xffff)
+
+#define av1_ref4_ver_scale		AV1_DEC_REG(40, 0, 0xffff)
+#define av1_ref4_hor_scale		AV1_DEC_REG(40, 16, 0xffff)
+
+#define av1_ref5_ver_scale		AV1_DEC_REG(41, 0, 0xffff)
+#define av1_ref5_hor_scale		AV1_DEC_REG(41, 16, 0xffff)
+
+#define av1_ref6_ver_scale		AV1_DEC_REG(42, 0, 0xffff)
+#define av1_ref6_hor_scale		AV1_DEC_REG(42, 16, 0xffff)
+
+#define av1_ref3_height			AV1_DEC_REG(43, 0, 0xffff)
+#define av1_ref3_width			AV1_DEC_REG(43, 16, 0xffff)
+
+#define av1_ref4_height			AV1_DEC_REG(44, 0, 0xffff)
+#define av1_ref4_width			AV1_DEC_REG(44, 16, 0xffff)
+
+#define av1_ref5_height			AV1_DEC_REG(45, 0, 0xffff)
+#define av1_ref5_width			AV1_DEC_REG(45, 16, 0xffff)
+
+#define av1_ref6_height			AV1_DEC_REG(46, 0, 0xffff)
+#define av1_ref6_width			AV1_DEC_REG(46, 16, 0xffff)
+
+#define av1_mf2_last2_offset		AV1_DEC_REG(47, 0, 0x1ff)
+#define av1_mf2_last3_offset		AV1_DEC_REG(47, 9, 0x1ff)
+#define av1_mf2_golden_offset		AV1_DEC_REG(47, 18, 0x1ff)
+#define av1_qmlevel_y			AV1_DEC_REG(47, 27, 0xf)
+
+#define av1_mf2_bwdref_offset		AV1_DEC_REG(48, 0, 0x1ff)
+#define av1_mf2_altref2_offset		AV1_DEC_REG(48, 9, 0x1ff)
+#define av1_mf2_altref_offset		AV1_DEC_REG(48, 18, 0x1ff)
+#define av1_qmlevel_u			AV1_DEC_REG(48, 27, 0xf)
+
+#define av1_filt_ref_adj_6		AV1_DEC_REG(49, 0, 0x7f)
+#define av1_filt_ref_adj_7		AV1_DEC_REG(49, 7, 0x7f)
+#define av1_qmlevel_v			AV1_DEC_REG(49, 14, 0xf)
+
+#define av1_superres_chroma_step	AV1_DEC_REG(51, 0, 0x3fff)
+#define av1_superres_luma_step		AV1_DEC_REG(51, 14, 0x3fff)
+
+#define av1_superres_init_chroma_subpel_x	AV1_DEC_REG(52, 0, 0x3fff)
+#define av1_superres_init_luma_subpel_x		AV1_DEC_REG(52, 14, 0x3fff)
+
+#define av1_cdef_chroma_secondary_strength	AV1_DEC_REG(53, 0, 0xffff)
+#define av1_cdef_luma_secondary_strength	AV1_DEC_REG(53, 16, 0xffff)
+
+#define av1_apf_threshold		AV1_DEC_REG(55, 0, 0xffff)
+#define av1_apf_single_pu_mode		AV1_DEC_REG(55, 30, 0x1)
+#define av1_apf_disable			AV1_DEC_REG(55, 30, 0x1)
+
+#define av1_dec_max_burst		AV1_DEC_REG(58, 0, 0xff)
+#define av1_dec_buswidth		AV1_DEC_REG(58, 8, 0x7)
+#define av1_dec_multicore_mode		AV1_DEC_REG(58, 11, 0x3)
+#define av1_dec_axi_wd_id_e		AV1_DEC_REG(58,	13, 0x1)
+#define av1_dec_axi_rd_id_e		AV1_DEC_REG(58, 14, 0x1)
+#define av1_dec_mc_polltime		AV1_DEC_REG(58, 17, 0x3ff)
+#define av1_dec_mc_pollmode		AV1_DEC_REG(58,	27, 0x3)
+
+#define av1_filt_ref_adj_3		AV1_DEC_REG(59, 0, 0x3f)
+#define av1_filt_ref_adj_2		AV1_DEC_REG(59, 7, 0x3f)
+#define av1_filt_ref_adj_1		AV1_DEC_REG(59, 14, 0x3f)
+#define av1_filt_ref_adj_0		AV1_DEC_REG(59, 21, 0x3f)
+#define av1_ref0_sign_bias		AV1_DEC_REG(59, 28, 0x1)
+#define av1_ref1_sign_bias		AV1_DEC_REG(59, 29, 0x1)
+#define av1_ref2_sign_bias		AV1_DEC_REG(59, 30, 0x1)
+#define av1_ref3_sign_bias		AV1_DEC_REG(59, 31, 0x1)
+
+#define av1_cur_last_roffset		AV1_DEC_REG(184, 0, 0x1ff)
+#define av1_cur_last_offset		AV1_DEC_REG(184, 9, 0x1ff)
+#define av1_mf3_last_offset		AV1_DEC_REG(184, 18, 0x1ff)
+#define av1_ref0_gm_mode		AV1_DEC_REG(184, 27, 0x3)
+
+#define av1_cur_last2_roffset		AV1_DEC_REG(185, 0, 0x1ff)
+#define av1_cur_last2_offset		AV1_DEC_REG(185, 9, 0x1ff)
+#define av1_mf3_last2_offset		AV1_DEC_REG(185, 18, 0x1ff)
+#define av1_ref1_gm_mode		AV1_DEC_REG(185, 27, 0x3)
+
+#define av1_cur_last3_roffset		AV1_DEC_REG(186, 0, 0x1ff)
+#define av1_cur_last3_offset		AV1_DEC_REG(186, 9, 0x1ff)
+#define av1_mf3_last3_offset		AV1_DEC_REG(186, 18, 0x1ff)
+#define av1_ref2_gm_mode		AV1_DEC_REG(186, 27, 0x3)
+
+#define av1_cur_golden_roffset		AV1_DEC_REG(187, 0, 0x1ff)
+#define av1_cur_golden_offset		AV1_DEC_REG(187, 9, 0x1ff)
+#define av1_mf3_golden_offset		AV1_DEC_REG(187, 18, 0x1ff)
+#define av1_ref3_gm_mode		AV1_DEC_REG(187, 27, 0x3)
+
+#define av1_cur_bwdref_roffset		AV1_DEC_REG(188, 0, 0x1ff)
+#define av1_cur_bwdref_offset		AV1_DEC_REG(188, 9, 0x1ff)
+#define av1_mf3_bwdref_offset		AV1_DEC_REG(188, 18, 0x1ff)
+#define av1_ref4_gm_mode		AV1_DEC_REG(188, 27, 0x3)
+
+#define av1_cur_altref2_roffset		AV1_DEC_REG(257, 0, 0x1ff)
+#define av1_cur_altref2_offset		AV1_DEC_REG(257, 9, 0x1ff)
+#define av1_mf3_altref2_offset		AV1_DEC_REG(257, 18, 0x1ff)
+#define av1_ref5_gm_mode		AV1_DEC_REG(257, 27, 0x3)
+
+#define av1_strm_buffer_len		AV1_DEC_REG(258, 0, 0xffffffff)
+
+#define av1_strm_start_offset		AV1_DEC_REG(259, 0, 0xffffffff)
+
+#define av1_ppd_blend_exist		AV1_DEC_REG(260, 21, 0x1)
+#define av1_ppd_dith_exist		AV1_DEC_REG(260, 23, 0x1)
+#define av1_ablend_crop_e		AV1_DEC_REG(260, 24, 0x1)
+#define av1_pp_format_p010_e		AV1_DEC_REG(260, 25, 0x1)
+#define av1_pp_format_customer1_e	AV1_DEC_REG(260, 26, 0x1)
+#define av1_pp_crop_exist		AV1_DEC_REG(260, 27, 0x1)
+#define av1_pp_up_level			AV1_DEC_REG(260, 28, 0x1)
+#define av1_pp_down_level		AV1_DEC_REG(260, 29, 0x3)
+#define av1_pp_exist			AV1_DEC_REG(260, 31, 0x1)
+
+#define av1_cur_altref_roffset		AV1_DEC_REG(262, 0, 0x1ff)
+#define av1_cur_altref_offset		AV1_DEC_REG(262, 9, 0x1ff)
+#define av1_mf3_altref_offset		AV1_DEC_REG(262, 18, 0x1ff)
+#define av1_ref6_gm_mode		AV1_DEC_REG(262, 27, 0x3)
+
+#define av1_cdef_luma_primary_strength	AV1_DEC_REG(263, 0, 0xffffffff)
+
+#define av1_cdef_chroma_primary_strength AV1_DEC_REG(264, 0, 0xffffffff)
+
+#define av1_axi_arqos			AV1_DEC_REG(265, 0, 0xf)
+#define av1_axi_awqos			AV1_DEC_REG(265, 4, 0xf)
+#define av1_axi_wr_ostd_threshold	AV1_DEC_REG(265, 8, 0x3ff)
+#define av1_axi_rd_ostd_threshold	AV1_DEC_REG(265, 18, 0x3ff)
+#define av1_axi_wr_4k_dis		AV1_DEC_REG(265, 31, 0x1)
+
+#define av1_128bit_mode			AV1_DEC_REG(266, 5, 0x1)
+#define av1_wr_shaper_bypass		AV1_DEC_REG(266, 10, 0x1)
+#define av1_error_conceal_e		AV1_DEC_REG(266, 30, 0x1)
+
+#define av1_superres_chroma_step_invra	AV1_DEC_REG(298, 0, 0xffff)
+#define av1_superres_luma_step_invra	AV1_DEC_REG(298, 16, 0xffff)
+
+#define av1_dec_alignment		AV1_DEC_REG(314, 0, 0xffff)
+
+#define av1_ext_timeout_cycles		AV1_DEC_REG(318, 0, 0x7fffffff)
+#define av1_ext_timeout_override_e	AV1_DEC_REG(318, 31, 0x1)
+
+#define av1_timeout_cycles		AV1_DEC_REG(319, 0, 0x7fffffff)
+#define av1_timeout_override_e		AV1_DEC_REG(319, 31, 0x1)
+
+#define av1_pp_out_e			AV1_DEC_REG(320, 0, 0x1)
+#define av1_pp_cr_first			AV1_DEC_REG(320, 1, 0x1)
+#define av1_pp_out_mode			AV1_DEC_REG(320, 2, 0x1)
+#define av1_pp_out_tile_e		AV1_DEC_REG(320, 3, 0x1)
+#define av1_pp_status			AV1_DEC_REG(320, 4, 0xf)
+#define av1_pp_in_blk_size		AV1_DEC_REG(320, 8, 0x7)
+#define av1_pp_out_p010_fmt		AV1_DEC_REG(320, 11, 0x3)
+#define av1_pp_out_rgb_fmt		AV1_DEC_REG(320, 13, 0x1f)
+#define av1_rgb_range_max		AV1_DEC_REG(320, 18, 0xfff)
+#define av1_pp_rgb_planar		AV1_DEC_REG(320, 30, 0x1)
+
+#define av1_scale_hratio		AV1_DEC_REG(322, 0, 0x3ffff)
+#define av1_pp_out_format		AV1_DEC_REG(322, 18, 0x1f)
+#define av1_ver_scale_mode		AV1_DEC_REG(322, 23, 0x3)
+#define av1_hor_scale_mode		AV1_DEC_REG(322, 25, 0x3)
+#define av1_pp_in_format		AV1_DEC_REG(322, 27, 0x1f)
+
+#define av1_pp_out_c_stride		AV1_DEC_REG(329, 0, 0xffff)
+#define av1_pp_out_y_stride		AV1_DEC_REG(329, 16, 0xffff)
+
+#define av1_pp_in_height		AV1_DEC_REG(331, 0, 0xffff)
+#define av1_pp_in_width			AV1_DEC_REG(331, 16, 0xffff)
+
+#define av1_pp_out_height		AV1_DEC_REG(332, 0, 0xffff)
+#define av1_pp_out_width		AV1_DEC_REG(332, 16, 0xffff)
+
+#define av1_pp1_dup_ver			AV1_DEC_REG(394, 0, 0xff)
+#define av1_pp1_dup_hor			AV1_DEC_REG(394, 8, 0xff)
+#define av1_pp0_dup_ver			AV1_DEC_REG(394, 16, 0xff)
+#define av1_pp0_dup_hor			AV1_DEC_REG(394, 24, 0xff)
+
+#define AV1_TILE_OUT_LU			(AV1_SWREG(65))
+#define AV1_REFERENCE_Y(i)		(AV1_SWREG(67) + ((i) * 0x8))
+#define AV1_SEGMENTATION		(AV1_SWREG(81))
+#define AV1_GLOBAL_MODEL		(AV1_SWREG(83))
+#define AV1_CDEF_COL			(AV1_SWREG(85))
+#define AV1_SR_COL			(AV1_SWREG(89))
+#define AV1_LR_COL			(AV1_SWREG(91))
+#define AV1_FILM_GRAIN			(AV1_SWREG(95))
+#define AV1_TILE_OUT_CH			(AV1_SWREG(99))
+#define AV1_REFERENCE_CB(i)		(AV1_SWREG(101) + ((i) * 0x8))
+#define AV1_TILE_OUT_MV			(AV1_SWREG(133))
+#define AV1_REFERENCE_MV(i)		(AV1_SWREG(135) + ((i) * 0x8))
+#define AV1_TILE_BASE			(AV1_SWREG(167))
+#define AV1_INPUT_STREAM		(AV1_SWREG(169))
+#define AV1_PROP_TABLE_OUT		(AV1_SWREG(171))
+#define AV1_PROP_TABLE			(AV1_SWREG(173))
+#define AV1_MC_SYNC_CURR		(AV1_SWREG(175))
+#define AV1_MC_SYNC_LEFT		(AV1_SWREG(177))
+#define AV1_DB_DATA_COL			(AV1_SWREG(179))
+#define AV1_DB_CTRL_COL			(AV1_SWREG(183))
+#define AV1_PP_OUT_LU			(AV1_SWREG(326))
+#define AV1_PP_OUT_CH			(AV1_SWREG(328))
+
+#endif /* _ROCKCHIP_VPU981_REGS_H_ */
-- 
2.34.1

