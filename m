Return-Path: <linux-media+bounces-459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D745D7EE4A4
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 16:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA8611C20A61
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 15:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4718D364DD;
	Thu, 16 Nov 2023 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="G99Ss31j"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A349A1A7;
	Thu, 16 Nov 2023 07:48:34 -0800 (PST)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 857736607355;
	Thu, 16 Nov 2023 15:48:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700149713;
	bh=haxNNgYEuaJVzI+mNLI9cTv7cUQtG7Z03PbQ1t1B4iQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G99Ss31jgnpY6mqW6YVtojgTI4ZwPiVSi1op1kDDG45j0R7DFiZmuDb3BwXutQ5mK
	 ljn5HwEd8MR3tWFwSRSZo78tKKXgxdClBqPhdJbPTqtEWQvtDfbIY1fp7mA7OBOw/3
	 fbBGg7Muy52l4tTLuUy+AbYNx4jWz/PeNrBM3uCUr21cc+O7yXLpgsppSf5ZYYOn0d
	 h2gx/5DkMOCPk5N36hhaah0fvSrxrrfW1h9rJqghTqUBFYDyQeFDoHE/EXQTWzKP7z
	 Vay3Pm+jsqZKu3z8SvKJijH4R20XABCqjK7Y2dQKWduuP0AEc29XyRX3leowsma+Ee
	 JV3mG3M+09K7w==
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	kernel@collabora.com
Subject: [RFC 6/6] media: verisilicon: Add H.264 stateless encoder
Date: Thu, 16 Nov 2023 16:48:16 +0100
Message-Id: <20231116154816.70959-7-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116154816.70959-1-andrzej.p@collabora.com>
References: <20231116154816.70959-1-andrzej.p@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add H.264 stateless encoder for the Hantro H1 variant.
It only supports constrained baseline, only I and P frames and allows
using either last frame as reference, or a long time reference frame
(which must have been marked as such in advance).

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/media/platform/verisilicon/Makefile   |   1 +
 drivers/media/platform/verisilicon/hantro.h   |   3 +
 .../media/platform/verisilicon/hantro_drv.c   |  10 +
 .../platform/verisilicon/hantro_h1_h264_enc.c | 493 +++++++++++
 .../platform/verisilicon/hantro_h1_regs.h     |   5 +
 .../media/platform/verisilicon/hantro_h264.c  | 777 ++++++++++++++++++
 .../media/platform/verisilicon/hantro_hw.h    |  23 +
 .../platform/verisilicon/stm32mp25_venc_hw.c  |  22 +-
 8 files changed, 1333 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_h1_h264_enc.c

diff --git a/drivers/media/platform/verisilicon/Makefile b/drivers/media/platform/verisilicon/Makefile
index faa19644fecb..f9cea26e2cab 100644
--- a/drivers/media/platform/verisilicon/Makefile
+++ b/drivers/media/platform/verisilicon/Makefile
@@ -9,6 +9,7 @@ hantro-vpu-y += \
 		hantro_boolenc.o \
 		hantro_h1_jpeg_enc.o \
 		hantro_h1_vp8_enc.o \
+		hantro_h1_h264_enc.o \
 		hantro_g1.o \
 		hantro_g1_h264_dec.o \
 		hantro_g1_mpeg2_dec.o \
diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index a248734013db..42c69deed10e 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -33,6 +33,7 @@ struct hantro_postproc_ops;
 
 #define HANTRO_JPEG_ENCODER	BIT(0)
 #define HANTRO_VP8_ENCODER	BIT(1)
+#define HANTRO_H264_ENCODER	BIT(2)
 #define HANTRO_ENCODERS		0x0000ffff
 #define HANTRO_MPEG2_DECODER	BIT(16)
 #define HANTRO_VP8_DECODER	BIT(17)
@@ -126,6 +127,7 @@ enum hantro_codec_mode {
 	HANTRO_MODE_VP9_DEC,
 	HANTRO_MODE_AV1_DEC,
 	HANTRO_MODE_VP8_ENC,
+	HANTRO_MODE_H264_ENC,
 };
 
 /*
@@ -277,6 +279,7 @@ struct hantro_ctx {
 		struct hantro_vp9_dec_hw_ctx vp9_dec;
 		struct hantro_av1_dec_hw_ctx av1_dec;
 		struct hantro_vp8_enc_hw_ctx vp8_enc;
+		struct hantro_h264_enc_hw_ctx h264_enc;
 	};
 };
 
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 0c8a4fcf2bf4..da52f6e28949 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -603,6 +603,16 @@ static const struct hantro_ctrl controls[] = {
 		.cfg = {
 			.id = V4L2_CID_STATELESS_AV1_FILM_GRAIN,
 		},
+	}, {
+		.codec = HANTRO_H264_ENCODER,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_H264_ENCODE_PARAMS,
+		},
+	}, {
+		.codec = HANTRO_H264_ENCODER,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_H264_ENCODE_RC,
+		},
 	},
 };
 
diff --git a/drivers/media/platform/verisilicon/hantro_h1_h264_enc.c b/drivers/media/platform/verisilicon/hantro_h1_h264_enc.c
new file mode 100644
index 000000000000..a9f742c733d8
--- /dev/null
+++ b/drivers/media/platform/verisilicon/hantro_h1_h264_enc.c
@@ -0,0 +1,493 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) STMicroelectronics SA 2023
+ * Authors:
+ *	Andrzej Pietrasiewicz <andrzej.p@collabora.com>
+ *
+ * Some portions of code are derived from
+ * https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-5.10/
+ * drivers/staging/media/hantro/rk3399_vpu_hw_h264_enc.c
+ *
+ * which is licensed GPL-2.0
+ *
+ * Rockchip rk3399 VPU codec driver
+ *
+ * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
+ *	Alpha Lin <Alpha.Lin@rock-chips.com>
+ *	Jung Zhao <jung.zhao@rock-chips.com>
+ */
+#include "hantro.h"
+#include "hantro_hw.h"
+#include "hantro_h1_regs.h"
+
+/* threshold of MBs count to disable quarter pixel mv for encode speed, e.g. 1920x1080 */
+#define MAX_MB_COUNT_TO_DISABLE_QUARTER_PIXEL_MV	8160
+
+/* threshold of MBs count to disable multi mv in one macro block, e.g. 1920x1080 */
+#define MAX_MB_COUNT_TO_DISABLE_SPLIT_MV		8160
+
+#define HANTRO_H264_QP_NUM				52
+
+#define ZERO_16x16_MV_FAVOR_DIV2			10
+
+/* H.264 motion estimation parameters */
+static const u32 h264_prev_mode_favor[HANTRO_H264_QP_NUM] = {
+	7, 7, 8, 8, 9, 9, 10, 10, 11, 12, 12, 13, 14, 15, 16, 17, 18,
+	19, 20, 21, 22, 24, 25, 27, 29, 30, 32, 34, 36, 38, 41, 43, 46,
+	49, 51, 55, 58, 61, 65, 69, 73, 78, 82, 87, 93, 98, 104, 110,
+	117, 124, 132, 140
+};
+
+/* sqrt(2^((qp-12)/3))*8 */
+static const u32 h264_diff_mv_penalty[HANTRO_H264_QP_NUM] = {
+	2, 2, 3, 3, 3, 4, 4, 4, 5, 6,
+	6, 7, 8, 9, 10, 11, 13, 14, 16, 18,
+	20, 23, 26, 29, 32, 36, 40, 45, 51, 57,
+	64, 72, 81, 91, 102, 114, 128, 144, 161, 181,
+	203, 228, 256, 287, 323, 362, 406, 456, 512, 575,
+	645, 724
+};
+
+/* 31*sqrt(2^((qp-12)/3))/4 */
+static const u32 h264_diff_mv_penalty4p[HANTRO_H264_QP_NUM] = {
+	2, 2, 2, 3, 3, 3, 4, 4, 5, 5,
+	6, 7, 8, 9, 10, 11, 12, 14, 16, 17,
+	20, 22, 25, 28, 31, 35, 39, 44, 49, 55,
+	62, 70, 78, 88, 98, 110, 124, 139, 156, 175,
+	197, 221, 248, 278, 312, 351, 394, 442, 496, 557,
+	625, 701
+};
+
+static const u32 h264_intra16_favor[HANTRO_H264_QP_NUM] = {
+	24, 24, 24, 26, 27, 30, 32, 35, 39, 43, 48, 53, 58, 64, 71, 78,
+	85, 93, 102, 111, 121, 131, 142, 154, 167, 180, 195, 211, 229,
+	248, 271, 296, 326, 361, 404, 457, 523, 607, 714, 852, 1034,
+	1272, 1588, 2008, 2568, 3318, 4323, 5672, 7486, 9928, 13216,
+	17648
+};
+
+static const u32 h264_inter_favor[HANTRO_H264_QP_NUM] = {
+	40, 40, 41, 42, 43, 44, 45, 48, 51, 53, 55, 60, 62, 67, 69, 72,
+	78, 84, 90, 96, 110, 120, 135, 152, 170, 189, 210, 235, 265,
+	297, 335, 376, 420, 470, 522, 572, 620, 670, 724, 770, 820,
+	867, 915, 970, 1020, 1076, 1132, 1180, 1230, 1275, 1320, 1370
+};
+
+static const u32 h264_skip_sad_penalty[HANTRO_H264_QP_NUM] = {
+	255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 233, 205, 182, 163,
+	146, 132, 120, 109, 100,  92,  84,  78,  71,  66,  61,  56,  52,  48,
+	44,  41,  38,  35,  32,  30,  27,  25,  23,  21,  19,  17,  15,  14,
+	12,  11,   9,   8,   7,   5,   4,   3,   2,   1
+};
+
+static const s32 h264_dmv_penalty[128] = { /* 4*sqrt(i*4*6) */
+	0,   19,   27,   33,   39,   43,   48,   51,   55,   58,
+	61,   64,   67,   70,   73,   75,   78,   80,   83,   85,
+	87,   89,   91,   93,   96,   97,   99,  101,  103,  105,
+	107,  109,  110,  112,  114,  115,  117,  119,  120,  122,
+	123,  125,  126,  128,  129,  131,  132,  134,  135,  137,
+	138,  139,  141,  142,  144,  145,  146,  147,  149,  150,
+	151,  153,  154,  155,  156,  157,  159,  160,  161,  162,
+	163,  165,  166,  167,  168,  169,  170,  171,  173,  174,
+	175,  176,  177,  178,  179,  180,  181,  182,  183,  184,
+	185,  186,  187,  188,  189,  190,  192,  192,  193,  194,
+	195,  196,  197,  198,  199,  200,  201,  202,  203,  204,
+	205,  206,  207,  208,  209,  210,  211,  211,  212,  213,
+	214,  215,  216,  217,  218,  219,  219,  220
+};
+
+static s32 exp_golomb_signed(s32 val)
+{
+	s32 tmp = 0;
+
+	if (val > 0)
+		val = 2 * val;
+	else
+		val = -2 * val + 1;
+	while (val >> ++tmp)
+		;
+	return tmp * 2 - 1;
+}
+
+static void hantro_h1_h264_enc_set_params(struct hantro_dev *vpu, struct hantro_ctx *ctx,
+					  struct v4l2_ctrl_h264_encode_params *params, int qp)
+{
+	unsigned int mb_width = MB_WIDTH(ctx->src_fmt.width);
+	unsigned int mb_height = MB_HEIGHT(ctx->src_fmt.height);
+	u32 prev_mode_favor = h264_prev_mode_favor[qp];
+	s32 scaler;
+	u32 skip_penalty;
+	u8 dmv_qpel_penalty[128];
+	u32 reg;
+	int i;
+
+	reg = H1_REG_ENC_CTRL0_INIT_QP(params->pic_init_qp_minus26 + 26)
+		| H1_REG_ENC_CTRL0_SLICE_ALPHA(params->slice_alpha_c0_offset_div2)
+		| H1_REG_ENC_CTRL0_SLICE_BETA(params->slice_beta_offset_div2)
+		| H1_REG_ENC_CTRL0_CHROMA_QP_OFFSET(params->chroma_qp_index_offset)
+		| H1_REG_ENC_CTRL0_IDR_PICID(params->idr_pic_id);
+	vepu_write_relaxed(vpu, reg, H1_REG_ENC_CTRL0);
+
+	reg = H1_REG_ENC_CTRL1_PPS_ID(params->pic_parameter_set_id)
+		| H1_REG_ENC_CTRL1_INTRA_PRED_MODE(prev_mode_favor)
+		| H1_REG_ENC_CTRL1_FRAME_NUM(params->frame_num);
+	vepu_write_relaxed(vpu, reg, H1_REG_ENC_CTRL1);
+
+	reg = 0;
+	if (mb_width * mb_height > MAX_MB_COUNT_TO_DISABLE_QUARTER_PIXEL_MV)
+		reg = H1_REG_ENC_CTRL2_DISABLE_QUARTER_PIXMV;
+	reg |= H1_REG_ENC_CTRL2_DEBLOCKING_FILTER_MODE(params->disable_deblocking_filter_idc)
+		| H1_REG_ENC_CTRL2_H264_SLICE_SIZE(0)
+		| H1_REG_ENC_CTRL2_CABAC_INIT_IDC(params->cabac_init_idc)
+		| H1_REG_ENC_CTRL2_H264_INTER4X4_MODE
+		| H1_REG_ENC_CTRL2_INTRA16X16_MODE(h264_intra16_favor[qp]);
+	if (params->flags & V4L2_H264_ENCODE_FLAG_ENTROPY_CABAC)
+		reg |= H1_REG_ENC_CTRL2_ENTROPY_CABAC;
+	vepu_write_relaxed(vpu, reg, H1_REG_ENC_CTRL2);
+
+	reg = H1_REG_ENC_CTRL3_MV_PENALTY_1P(h264_diff_mv_penalty[qp])
+		| H1_REG_ENC_CTRL3_MV_PENALTY_1_4P(h264_diff_mv_penalty[qp])
+		| H1_REG_ENC_CTRL3_MV_PENALTY_4P(h264_diff_mv_penalty4p[qp]);
+	if (mb_width * mb_height <= MAX_MB_COUNT_TO_DISABLE_SPLIT_MV)
+		reg |= H1_REG_ENC_CTRL3_MUTIMV_EN;
+	vepu_write_relaxed(vpu, reg, H1_REG_ENC_CTRL3);
+
+	scaler = max(1U, 200 / (mb_width + mb_height));
+	skip_penalty = min(255U, h264_skip_sad_penalty[qp] * scaler);
+	reg = H1_REG_ENC_CTRL5_MACROBLOCK_PENALTY(skip_penalty)
+		| H1_REG_ENC_CTRL5_COMPLETE_SLICES(0)
+		| H1_REG_ENC_CTRL5_INTER_MODE(h264_inter_favor[qp]);
+	vepu_write_relaxed(vpu, reg, H1_REG_ENC_CTRL5);
+
+	/*
+	 * The hardware only writes at 64-bit aligned addresses. If there's
+	 * a header generated with the CPU in the destination (encoded) buffer
+	 * then potentially up to 7 bytes will be overwritten by the hardware.
+	 * To preserve them, they are passed to the hardware via
+	 * H1_REG_STR_HDR_REM_MSB/LSB and the first free bit to be used by the hw
+	 * is passed via H1_REG_RLC_CTRL. This driver does not generate any headers,
+	 * so there's no bytes to pass to the hw and the hw-generated data
+	 * may be written at offset 0.
+	 */
+	vepu_write_relaxed(vpu, 0, H1_REG_STR_HDR_REM_MSB);
+	vepu_write_relaxed(vpu, 0, H1_REG_STR_HDR_REM_LSB);
+	vepu_write_relaxed(vpu, 0, H1_REG_RLC_CTRL);
+
+	/* Don't use MAD */
+	reg = H1_REG_MAD_CTRL_QP_ADJUST(0)
+		| H1_REG_MAD_CTRL_MAD_THRESHOLD(0)
+		| H1_REG_MAD_CTRL_QP_SUM_DIV2(0);
+	vepu_write_relaxed(vpu, reg, H1_REG_MAD_CTRL);
+
+	reg = H1_REG_QP_VAL_LUM(qp)
+		| H1_REG_QP_VAL_MAX(51)
+		| H1_REG_QP_VAL_MIN(0)
+		| H1_REG_QP_VAL_CHECKPOINT_DISTAN(0);
+	vepu_write_relaxed(vpu, reg, H1_REG_QP_VAL);
+
+	/* Don't use ROI */
+	vepu_write_relaxed(vpu, 0, H1_REG_FIRST_ROI_AREA);
+	vepu_write_relaxed(vpu, 0, H1_REG_SECOND_ROI_AREA);
+
+	/* Don't use stabilization */
+	vepu_write_relaxed(vpu, 0, H1_REG_STABILIZATION_OUTPUT);
+
+	/*
+	 * Color conversion:
+	 *
+	 * Y  = (A * R + B * G + C * B) / 65536
+	 * Cb = (E * (B - Y)) / 65536 + 128
+	 * Cr = (F * (R - Y)) / 65536 + 128
+	 *
+	 * alternatively Cb=f(R,G,B), Cr=f(R,G,B):
+	 *
+	 * Cb = (((-A * R - B * G + (65536 - C) * B) * E) / 65536) / 65536 + 128
+	 * Cr = ((((65536 - A) * R - B * G - C * B) * F) / 65536) / 65536 + 128
+	 *
+	 * BT.601 coefficients
+	 *
+	 * A = 19589 [0x4c85] B = 38443 [0x962b] C = 7504 [0x1d50]
+	 * E = 37008 [0x9090] F = 46740 [0xb694]
+	 *
+	 */
+	vepu_write_relaxed(vpu, 0x962b4c85, H1_REG_RGB_YUV_COEFF(0));
+	vepu_write_relaxed(vpu, 0x90901d50, H1_REG_RGB_YUV_COEFF(1));
+	vepu_write_relaxed(vpu, 0x0000b694, H1_REG_RGB_YUV_COEFF(2));
+
+	/* Disable CIR */
+	vepu_write_relaxed(vpu, 0, H1_REG_CIR_INTRA_CTRL);
+
+	/* Disable intra area */
+	vepu_write_relaxed(vpu, 0, H1_REG_INTRA_AREA_CTRL);
+
+	reg = H1_REG_ZERO_MV_FAVOR_D2(ZERO_16x16_MV_FAVOR_DIV2)
+		| H1_REG_PENALTY_4X4MV(0);
+	vepu_write_relaxed(vpu, reg, H1_REG_QP_MV_MVC_CTRL);
+
+	for (i = 0; i < 128; i++)
+		dmv_qpel_penalty[i] = min(255, exp_golomb_signed(i));
+
+	/* See rk3399_vpu_hw_h264_enc.c mentioned in the copyright section */
+	for (i = 0; i < 128; i += 4) {
+		reg = H1_REG_DMV_4P_1P_PENALTY_BIT((h264_dmv_penalty[i] + 1) / 2, 3)
+			| H1_REG_DMV_4P_1P_PENALTY_BIT((h264_dmv_penalty[i + 1] + 1) / 2, 2)
+			| H1_REG_DMV_4P_1P_PENALTY_BIT((h264_dmv_penalty[i + 2] + 1) / 2, 1)
+			| H1_REG_DMV_4P_1P_PENALTY_BIT((h264_dmv_penalty[i + 3] + 1) / 2, 0);
+		vepu_write_relaxed(vpu, reg, H1_REG_DMV_4P_1P_PENALTY(i / 4));
+
+		reg = H1_REG_DMV_QPEL_PENALTY_BIT(dmv_qpel_penalty[i], 3)
+			| H1_REG_DMV_QPEL_PENALTY_BIT(dmv_qpel_penalty[i + 1], 2)
+			| H1_REG_DMV_QPEL_PENALTY_BIT(dmv_qpel_penalty[i + 2], 1)
+			| H1_REG_DMV_QPEL_PENALTY_BIT(dmv_qpel_penalty[i + 3], 0);
+		vepu_write_relaxed(vpu, reg, H1_REG_DMV_QPEL_PENALTY(i / 4));
+	}
+}
+
+static void hantro_h1_h264_enc_set_src_img_ctrl(struct hantro_dev *vpu,
+						struct hantro_ctx *ctx)
+{
+	u32 overfill_r, overfill_b;
+	u32 reg;
+
+	/*
+	 * The format width and height are already macroblock aligned
+	 * by .vidioc_s_fmt_vid_cap_mplane() callback. Destination
+	 * format width and height can be further modified by
+	 * .vidioc_s_selection(), and the width is 4-aligned.
+	 */
+	overfill_r = ctx->src_fmt.width - ctx->dst_fmt.width;
+	overfill_b = ctx->src_fmt.height - ctx->dst_fmt.height;
+
+	reg = H1_REG_IN_IMG_CTRL_ROW_LEN(ctx->src_fmt.width)
+		| H1_REG_IN_IMG_CTRL_OVRFLR_D4(overfill_r / 4)
+		| H1_REG_IN_IMG_CTRL_OVRFLB(overfill_b)
+		| H1_REG_IN_IMG_CTRL_FMT(ctx->vpu_src_fmt->enc_fmt);
+	vepu_write_relaxed(vpu, reg, H1_REG_IN_IMG_CTRL);
+}
+
+static void hantro_h1_h264_enc_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
+					   struct v4l2_ctrl_h264_encode_params *params)
+{
+	const u32 src_addr_regs[] = { H1_REG_ADDR_IN_PLANE_0,
+				      H1_REG_ADDR_IN_PLANE_1,
+				      H1_REG_ADDR_IN_PLANE_2 };
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct v4l2_pix_format_mplane *src_fmt = &ctx->src_fmt;
+	size_t luma_size;
+	dma_addr_t dst_dma;
+	size_t dst_size;
+	int i;
+
+	src_buf = hantro_get_src_buf(ctx);
+	dst_buf = hantro_get_dst_buf(ctx);
+
+	luma_size = hantro_rounded_luma_size(ctx->src_fmt.width,
+					     ctx->src_fmt.height);
+
+	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+	dst_size = vb2_plane_size(&dst_buf->vb2_buf, 0);
+
+	/* Destination buffer */
+	vepu_write_relaxed(vpu, dst_dma, H1_REG_ADDR_OUTPUT_STREAM);
+	vepu_write_relaxed(vpu, dst_size, H1_REG_STR_BUF_LIMIT);
+
+	/* Auxiliary buffers */
+	memset(ctx->h264_enc.nal_table.cpu, 0, ctx->h264_enc.nal_table.size);
+	vepu_write_relaxed(vpu, ctx->h264_enc.nal_table.dma, H1_REG_ADDR_OUTPUT_CTRL);
+
+	vepu_write_relaxed(vpu, ctx->h264_enc.mv_buf.dma, H1_REG_ADDR_MV_OUT);
+
+	vepu_write_relaxed(vpu, ctx->h264_enc.cabac_ctx[params->cabac_init_idc].dma,
+			   H1_REG_ADDR_CABAC_TBL);
+
+	/* remember current frame timestamp */
+	ctx->h264_enc.reference_ts[ctx->h264_enc.reconstr_idx] = src_buf->vb2_buf.timestamp;
+
+	/* reference buffers */
+	if (params->slice_type) {
+		/* intra */
+		if (params->flags & V4L2_H264_ENCODE_FLAG_MARK_LONGTERM) {
+			ctx->h264_enc.ltr_idx = ctx->h264_enc.reconstr_idx;
+			vepu_write_relaxed(vpu, H1_REG_H264_MARK_LONGTRERM,
+					   H1_REG_H264_REFERENCE_CTRL);
+		}
+	} else {
+		/* inter */
+		if (params->reference_ts == ctx->h264_enc.reference_ts[ctx->h264_enc.last_idx]) {
+			i = ctx->h264_enc.last_idx;
+			vepu_write_relaxed(vpu, H1_REG_H264_MV_REF_IDX(0),
+					   H1_REG_H264_REFERENCE_IDX);
+		} else {
+			i = ctx->h264_enc.ltr_idx;
+			vepu_write_relaxed(vpu, H1_REG_H264_MV_REF_IDX(1),
+					   H1_REG_H264_REFERENCE_IDX);
+		}
+
+		vepu_write_relaxed(vpu, ctx->h264_enc.luma_internal[i].dma,
+				   H1_REG_ADDR_REF_LUMA);
+		vepu_write_relaxed(vpu, ctx->h264_enc.chroma_internal[i].dma,
+				   H1_REG_ADDR_REF_CHROMA);
+	}
+
+	/* Reconstruction buffers */
+	i = ctx->h264_enc.reconstr_idx;
+	vepu_write_relaxed(vpu, ctx->h264_enc.luma_internal[i].dma, H1_REG_ADDR_REC_LUMA);
+	vepu_write_relaxed(vpu, ctx->h264_enc.chroma_internal[i].dma, H1_REG_ADDR_REC_CHROMA);
+
+	/* Source buffer */
+	vepu_write_relaxed(vpu,
+			   vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0) +
+			   src_buf->vb2_buf.planes[0].data_offset,
+			   src_addr_regs[0]);
+	vepu_write_relaxed(vpu,
+			   vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0) +
+			   src_buf->vb2_buf.planes[0].data_offset +
+			   luma_size,
+			   src_addr_regs[1]);
+
+	for (i = 1; i < src_fmt->num_planes; ++i)
+		/* Multiplanes */
+		vepu_write_relaxed(vpu,
+				   vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, i) +
+				   src_buf->vb2_buf.planes[i].data_offset,
+				   src_addr_regs[i]);
+}
+
+static int hantro_h1_validate_references(struct hantro_ctx *ctx,
+					 struct v4l2_ctrl_h264_encode_params *params)
+{
+	u64 last_ts, ltr_ts, ref_ts;
+
+	/* last_idx exists no matter what because we're a P frame */
+	last_ts = ctx->h264_enc.reference_ts[ctx->h264_enc.last_idx];
+	ref_ts = params->reference_ts;
+
+	/* last frame is OK as reference */
+	if (ref_ts == last_ts)
+		return 0;
+
+	/* if long term reference exists then maybe it is requested? */
+	if (ctx->h264_enc.ltr_idx >= 0) {
+		ltr_ts = ctx->h264_enc.reference_ts[ctx->h264_enc.ltr_idx];
+		/* long term reference is OK */
+		if (ref_ts == ltr_ts)
+			return 0;
+	}
+
+	return -EINVAL;
+}
+
+int hantro_h1_h264_enc_run(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct v4l2_ctrl_h264_encode_params *params;
+	struct v4l2_ctrl_h264_encode_rc *rc;
+	u32 reg;
+
+	hantro_start_prepare_run(ctx);
+
+	params = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_H264_ENCODE_PARAMS);
+	if (WARN_ON(!params))
+		return -EINVAL;
+
+	/* This driver only supports I and P slices */
+	if (params->slice_type != V4L2_H264_SLICE_TYPE_I &&
+	    params->slice_type != V4L2_H264_SLICE_TYPE_P)
+		return -EINVAL;
+
+	/* This driver only supports NALU type 5 for I slices */
+	if (params->slice_type == V4L2_H264_SLICE_TYPE_I &&
+	    params->nalu_type != V4L2_H264_NAL_CODED_SLICE_IDR_PIC)
+		return -EINVAL;
+
+	/* This driver only supports NALU type 1 for P slices */
+	if (params->slice_type == V4L2_H264_SLICE_TYPE_P &&
+	    params->nalu_type != V4L2_H264_NAL_CODED_SLICE_NON_IDR_PIC)
+		return -EINVAL;
+
+	rc = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_H264_ENCODE_RC);
+	if (WARN_ON(!rc))
+		return -EINVAL;
+
+	if (params->slice_type == V4L2_H264_SLICE_TYPE_P &&
+	    hantro_h1_validate_references(ctx, params))
+		return -EINVAL;
+
+	/* Program the hardware */
+	vepu_write_relaxed(vpu, H1_REG_ENC_CTRL_ENC_MODE_H264, H1_REG_ENC_CTRL);
+
+	hantro_h1_h264_enc_set_params(vpu, ctx, params, rc->qp);
+	hantro_h1_h264_enc_set_src_img_ctrl(vpu, ctx);
+	hantro_h1_h264_enc_set_buffers(vpu, ctx, params);
+
+	reg = H1_REG_DEVICE_CTRL_SCALE_OUTPUT_SWAP8
+		| H1_REG_DEVICE_CTRL_SCALE_OUTPUT_SWAP16
+		| H1_REG_DEVICE_CTRL_SCALE_OUTPUT_SWAP32
+		| H1_REG_DEVICE_CTRL_MV_OUTPUT_SWAP8
+		| H1_REG_DEVICE_CTRL_MV_OUTPUT_SWAP16
+		| H1_REG_DEVICE_CTRL_MV_OUTPUT_SWAP32;
+	vepu_write(vpu, reg, H1_REG_DEVICE_CTRL);
+
+	reg = H1_REG_AXI_CTRL_OUTPUT_SWAP16
+		| H1_REG_AXI_CTRL_INPUT_SWAP16
+		| H1_REG_AXI_CTRL_BURST_LEN(16)
+		| H1_REG_AXI_CTRL_OUTPUT_SWAP32
+		| H1_REG_AXI_CTRL_INPUT_SWAP32
+		| H1_REG_AXI_CTRL_OUTPUT_SWAP8
+		| H1_REG_AXI_CTRL_INPUT_SWAP8;
+	/* Make sure that all registers are written at this point */
+	vepu_write(vpu, reg, H1_REG_AXI_CTRL);
+
+	/* Start the hardware */
+	reg = H1_REG_ENC_CTRL_TIMEOUT_EN
+		| H1_REG_ENC_CTRL_MV_WRITE
+		| H1_REG_ENC_CTRL_NAL_MODE_BIT
+		| H1_REG_ENC_CTRL_WIDTH(MB_WIDTH(ctx->src_fmt.width))
+		| H1_REG_ENC_CTRL_HEIGHT(MB_HEIGHT(ctx->src_fmt.height))
+		| H1_REG_ENC_REC_WRITE_BUFFER_4MB
+		| H1_REG_ENC_CTRL_ENC_MODE_H264
+		| H1_REG_ENC_CTRL_EN_BIT;
+	if (params->slice_type) {
+		struct vb2_v4l2_buffer *dst_buf;
+
+		reg |= H1_REG_ENC_PIC_INTRA;
+		dst_buf = hantro_get_dst_buf(ctx);
+		dst_buf->flags |= V4L2_BUF_FLAG_KEYFRAME;
+	} else {
+		reg |= H1_REG_ENC_PIC_INTER;
+	}
+
+	/* Kick the watchdog and start encoding */
+	hantro_end_prepare_run(ctx);
+
+	/* Start the hardware */
+	vepu_write(vpu, reg, H1_REG_ENC_CTRL);
+
+	return 0;
+}
+
+static inline void hantro_h1_bump_reconstr_idx(struct hantro_ctx *ctx)
+{
+	ctx->h264_enc.reconstr_idx++;
+	ctx->h264_enc.reconstr_idx %= HANTRO_H264_NUM_INTERNAL_FRAMES;
+}
+
+void hantro_h1_h264_enc_done(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct vb2_v4l2_buffer *dst_buf;
+	u32 encoded_size;
+
+	dst_buf = hantro_get_dst_buf(ctx);
+
+	encoded_size = vepu_read(vpu, H1_REG_STR_BUF_LIMIT) / 8;
+
+	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, encoded_size);
+
+	ctx->h264_enc.last_prev_idx = ctx->h264_enc.last_idx;
+	ctx->h264_enc.last_idx = ctx->h264_enc.reconstr_idx;
+
+	hantro_h1_bump_reconstr_idx(ctx);
+	if (ctx->h264_enc.reconstr_idx == ctx->h264_enc.ltr_idx)
+		hantro_h1_bump_reconstr_idx(ctx);
+}
diff --git a/drivers/media/platform/verisilicon/hantro_h1_regs.h b/drivers/media/platform/verisilicon/hantro_h1_regs.h
index efb46da23eab..4be852630cf7 100644
--- a/drivers/media/platform/verisilicon/hantro_h1_regs.h
+++ b/drivers/media/platform/verisilicon/hantro_h1_regs.h
@@ -80,6 +80,7 @@
 #define    H1_REG_ENC_CTRL2_TRANS8X8_MODE_EN		BIT(21)
 #define    H1_REG_ENC_CTRL2_CABAC_INIT_IDC(x)		((x) << 19)
 #define    H1_REG_ENC_CTRL2_VP8_BOOLENC_ENABLE		BIT(18)
+#define    H1_REG_ENC_CTRL2_ENTROPY_CABAC		BIT(18)
 #define    H1_REG_ENC_CTRL2_H264_INTER4X4_MODE		BIT(17)
 #define    H1_REG_ENC_CTRL2_H264_STREAM_MODE		BIT(16)
 #define    H1_REG_ENC_CTRL2_INTRA16X16_MODE(x)		((x))
@@ -148,6 +149,8 @@
 #define     H1_REG_VP8_SEG0_DQUT_DC_Y2(x)		(((x) & 0x1ff) << 17)
 #define     H1_REG_VP8_SEG0_DQUT_AC_Y1(x)		(((x) & 0x1ff) << 8)
 #define     H1_REG_VP8_SEG0_DQUT_DC_Y1(x)		(((x) & 0xff) << 0)
+#define H1_REG_H264_REFERENCE_IDX			0x084
+#define     H1_REG_H264_MV_REF_IDX(x)			(((x) & 0x03) << 26)
 #define H1_REG_VP8_SEG0_QUANT_DQUT_1			0x088
 #define     H1_REG_VP8_SEGMENT_MAP_UPDATE		BIT(30)
 #define     H1_REG_VP8_SEGMENT_EN			BIT(29)
@@ -156,6 +159,8 @@
 #define     H1_REG_VP8_SEG0_DQUT_AC_CHR(x)		(((x) & 0x1ff) << 17)
 #define     H1_REG_VP8_SEG0_DQUT_DC_CHR(x)		(((x) & 0xff) << 9)
 #define     H1_REG_VP8_SEG0_DQUT_AC_Y2(x)		(((x) & 0x1ff) << 0)
+#define H1_REG_H264_REFERENCE_CTRL			0x088
+#define     H1_REG_H264_MARK_LONGTRERM			BIT(26)
 #define H1_REG_VP8_BOOL_ENC				0x08c
 #define H1_REG_CHKPT_DELTA_QP				0x090
 #define     H1_REG_CHKPT_DELTA_QP_CHK0(x)		(((x) & 0x0f) << 0)
diff --git a/drivers/media/platform/verisilicon/hantro_h264.c b/drivers/media/platform/verisilicon/hantro_h264.c
index 4e9a0ecf5c13..ebe186d19228 100644
--- a/drivers/media/platform/verisilicon/hantro_h264.c
+++ b/drivers/media/platform/verisilicon/hantro_h264.c
@@ -198,6 +198,586 @@ static const u32 h264_cabac_table[] = {
 	0x1f0c2517, 0x1f261440
 };
 
+/*
+ * CABAC tables for the encoder.
+ * From drivers/staging/media/hantro/rk3399_vpu_hw_h264_enc.c
+ * in https://chromium.googlesource.com/chromiumos/third_party/kernel,
+ * chromeos-5.10 branch.
+ */
+static const s32 h264_context_init_intra[HANTRO_H264_CABAC_CV_NUM][2] = {
+	/* 0 -> 10 */
+	{ 20, -15 }, { 2, 54 }, { 3, 74 }, { 20, -15 },
+	{ 2, 54 }, { 3, 74 }, { -28, 127 }, { -23, 104 },
+	{ -6, 53 }, { -1, 54 }, { 7, 51 },
+	/* 11 -> 23 unsused for I */
+	{ 0, 0 }, { 0, 0 }, { 0, 0 }, { 0, 0 },
+	{ 0, 0 }, { 0, 0 }, { 0, 0 }, { 0, 0 },
+	{ 0, 0 }, { 0, 0 }, { 0, 0 }, { 0, 0 },
+	{ 0, 0 },
+	/* 24 -> 39 */
+	{ 0, 0 }, { 0, 0 }, { 0, 0 }, { 0, 0 },
+	{ 0, 0 }, { 0, 0 }, { 0, 0 }, { 0, 0 },
+	{ 0, 0 }, { 0, 0 }, { 0, 0 }, { 0, 0 },
+	{ 0, 0 }, { 0, 0 }, { 0, 0 }, { 0, 0 },
+	/* 40 -> 53 */
+	{ 0, 0 }, { 0, 0 }, { 0, 0 }, { 0, 0 },
+	{ 0, 0 }, { 0, 0 }, { 0, 0 }, { 0, 0 },
+	{ 0, 0 }, { 0, 0 }, { 0, 0 }, { 0, 0 },
+	{ 0, 0 }, { 0, 0 },
+	/* 54 -> 59 */
+	{ 0, 0 }, { 0, 0 }, { 0, 0 }, { 0, 0 },
+	{ 0, 0 }, { 0, 0 },
+	/* 60 -> 69 */
+	{ 0, 41 }, { 0, 63 }, { 0, 63 }, { 0, 63 },
+	{ -9, 83 }, { 4, 86 }, { 0, 97 }, { -7, 72 },
+	{ 13, 41 }, { 3, 62 },
+	/* 70 -> 87 */
+	{ 0, 11 }, { 1, 55 }, { 0, 69 }, { -17, 127 },
+	{ -13, 102 }, { 0, 82 }, { -7, 74 }, { -21, 107 },
+	{ -27, 127 }, { -31, 127 }, { -24, 127 }, { -18, 95 },
+	{ -27, 127 }, { -21, 114 }, { -30, 127 }, { -17, 123 },
+	{ -12, 115 }, { -16, 122 },
+	/* 88 -> 104 */
+	{ -11, 115 }, { -12, 63 }, { -2, 68 }, { -15, 84 },
+	{ -13, 104 }, { -3, 70 }, { -8, 93 }, { -10, 90 },
+	{ -30, 127 }, { -1, 74 }, { -6, 97 }, { -7, 91 },
+	{ -20, 127 }, { -4, 56 }, { -5, 82 }, { -7, 76 },
+	{ -22, 125 },
+	/* 105 -> 135 */
+	{ -7, 93 }, { -11, 87 }, { -3, 77 }, { -5, 71 },
+	{ -4, 63 }, { -4, 68 }, { -12, 84 }, { -7, 62 },
+	{ -7, 65 }, { 8, 61 }, { 5, 56 }, { -2, 66 },
+	{ 1, 64 }, { 0, 61 }, { -2, 78 }, { 1, 50 },
+	{ 7, 52 }, { 10, 35 }, { 0, 44 }, { 11, 38 },
+	{ 1, 45 }, { 0, 46 }, { 5, 44 }, { 31, 17 },
+	{ 1, 51 }, { 7, 50 }, { 28, 19 }, { 16, 33 },
+	{ 14, 62 }, { -13, 108 }, { -15, 100 },
+	/* 136 -> 165 */
+	{ -13, 101 }, { -13, 91 }, { -12, 94 }, { -10, 88 },
+	{ -16, 84 }, { -10, 86 }, { -7, 83 }, { -13, 87 },
+	{ -19, 94 }, { 1, 70 }, { 0, 72 }, { -5, 74 },
+	{ 18, 59 }, { -8, 102 }, { -15, 100 }, { 0, 95 },
+	{ -4, 75 }, { 2, 72 }, { -11, 75 }, { -3, 71 },
+	{ 15, 46 }, { -13, 69 }, { 0, 62 }, { 0, 65 },
+	{ 21, 37 }, { -15, 72 }, { 9, 57 }, { 16, 54 },
+	{ 0, 62 }, { 12, 72 },
+	/* 166 -> 196 */
+	{ 24, 0 }, { 15, 9 }, { 8, 25 }, { 13, 18 },
+	{ 15, 9 }, { 13, 19 }, { 10, 37 }, { 12, 18 },
+	{ 6, 29 }, { 20, 33 }, { 15, 30 }, { 4, 45 },
+	{ 1, 58 }, { 0, 62 }, { 7, 61 }, { 12, 38 },
+	{ 11, 45 }, { 15, 39 }, { 11, 42 }, { 13, 44 },
+	{ 16, 45 }, { 12, 41 }, { 10, 49 }, { 30, 34 },
+	{ 18, 42 }, { 10, 55 }, { 17, 51 }, { 17, 46 },
+	{ 0, 89 }, { 26, -19 }, { 22, -17 },
+	/* 197 -> 226 */
+	{ 26, -17 }, { 30, -25 }, { 28, -20 }, { 33, -23 },
+	{ 37, -27 }, { 33, -23 }, { 40, -28 }, { 38, -17 },
+	{ 33, -11 }, { 40, -15 }, { 41, -6 }, { 38, 1 },
+	{ 41, 17 }, { 30, -6 }, { 27, 3 }, { 26, 22 },
+	{ 37, -16 }, { 35, -4 }, { 38, -8 }, { 38, -3 },
+	{ 37, 3 }, { 38, 5 }, { 42, 0 }, { 35, 16 },
+	{ 39, 22 }, { 14, 48 }, { 27, 37 }, { 21, 60 },
+	{ 12, 68 }, { 2, 97 },
+	/* 227 -> 251 */
+	{ -3, 71 }, { -6, 42 }, { -5, 50 }, { -3, 54 },
+	{ -2, 62 }, { 0, 58 }, { 1, 63 }, { -2, 72 },
+	{ -1, 74 }, { -9, 91 }, { -5, 67 }, { -5, 27 },
+	{ -3, 39 }, { -2, 44 }, { 0, 46 }, { -16, 64 },
+	{ -8, 68 }, { -10, 78 }, { -6, 77 }, { -10, 86 },
+	{ -12, 92 }, { -15, 55 }, { -10, 60 }, { -6, 62 },
+	{ -4, 65 },
+	/* 252 -> 275 */
+	{ -12, 73 }, { -8, 76 }, { -7, 80 }, { -9, 88 },
+	{ -17, 110 }, { -11, 97 }, { -20, 84 }, { -11, 79 },
+	{ -6, 73 }, { -4, 74 }, { -13, 86 }, { -13, 96 },
+	{ -11, 97 }, { -19, 117 }, { -8, 78 }, { -5, 33 },
+	{ -4, 48 }, { -2, 53 }, { -3, 62 }, { -13, 71 },
+	{ -10, 79 }, { -12, 86 }, { -13, 90 }, { -14, 97 },
+	/* 276 special case, bypass used */
+	{ 0, 0 },
+	/* 277 -> 307 */
+	{ -6, 93 }, { -6, 84 }, { -8, 79 }, { 0, 66 },
+	{ -1, 71 }, { 0, 62 }, { -2, 60 }, { -2, 59 },
+	{ -5, 75 }, { -3, 62 }, { -4, 58 }, { -9, 66 },
+	{ -1, 79 }, { 0, 71 }, { 3, 68 }, { 10, 44 },
+	{ -7, 62 }, { 15, 36 }, { 14, 40 }, { 16, 27 },
+	{ 12, 29 }, { 1, 44 }, { 20, 36 }, { 18, 32 },
+	{ 5, 42 }, { 1, 48 }, { 10, 62 }, { 17, 46 },
+	{ 9, 64 }, { -12, 104 }, { -11, 97 },
+	/* 308 -> 337 */
+	{ -16, 96 }, { -7, 88 }, { -8, 85 }, { -7, 85 },
+	{ -9, 85 }, { -13, 88 }, { 4, 66 }, { -3, 77 },
+	{ -3, 76 }, { -6, 76 }, { 10, 58 }, { -1, 76 },
+	{ -1, 83 }, { -7, 99 }, { -14, 95 }, { 2, 95 },
+	{ 0, 76 }, { -5, 74 }, { 0, 70 }, { -11, 75 },
+	{ 1, 68 }, { 0, 65 }, { -14, 73 }, { 3, 62 },
+	{ 4, 62 }, { -1, 68 }, { -13, 75 }, { 11, 55 },
+	{ 5, 64 }, { 12, 70 },
+	/* 338 -> 368 */
+	{ 15, 6 }, { 6, 19 }, { 7, 16 }, { 12, 14 },
+	{ 18, 13 }, { 13, 11 }, { 13, 15 }, { 15, 16 },
+	{ 12, 23 }, { 13, 23 }, { 15, 20 }, { 14, 26 },
+	{ 14, 44 }, { 17, 40 }, { 17, 47 }, { 24, 17 },
+	{ 21, 21 }, { 25, 22 }, { 31, 27 }, { 22, 29 },
+	{ 19, 35 }, { 14, 50 }, { 10, 57 }, { 7, 63 },
+	{ -2, 77 }, { -4, 82 }, { -3, 94 }, { 9, 69 },
+	{ -12, 109 }, { 36, -35 }, { 36, -34 },
+	/* 369 -> 398 */
+	{ 32, -26 }, { 37, -30 }, { 44, -32 }, { 34, -18 },
+	{ 34, -15 }, { 40, -15 }, { 33, -7 }, { 35, -5 },
+	{ 33, 0 }, { 38, 2 }, { 33, 13 }, { 23, 35 },
+	{ 13, 58 }, { 29, -3 }, { 26, 0 }, { 22, 30 },
+	{ 31, -7 }, { 35, -15 }, { 34, -3 }, { 34, 3 },
+	{ 36, -1 }, { 34, 5 }, { 32, 11 }, { 35, 5 },
+	{ 34, 12 }, { 39, 11 }, { 30, 29 }, { 34, 26 },
+	{ 29, 39 }, { 19, 66 },
+	/* 399 -> 435 */
+	{ 31, 21 }, { 31, 31 }, { 25, 50 },
+	{ -17, 120 }, { -20, 112 }, { -18, 114 }, { -11, 85 },
+	{ -15, 92 }, { -14, 89 }, { -26, 71 }, { -15, 81 },
+	{ -14, 80 }, { 0, 68 }, { -14, 70 }, { -24, 56 },
+	{ -23, 68 }, { -24, 50 }, { -11, 74 }, { 23, -13 },
+	{ 26, -13 }, { 40, -15 }, { 49, -14 }, { 44, 3 },
+	{ 45, 6 }, { 44, 34 }, { 33, 54 }, { 19, 82 },
+	{ -3, 75 }, { -1, 23 }, { 1, 34 }, { 1, 43 },
+	{ 0, 54 }, { -2, 55 }, { 0, 61 }, { 1, 64 },
+	{ 0, 68 }, { -9, 92 },
+	/* 436 -> 459 */
+	{ -14, 106 }, { -13, 97 }, { -15, 90 }, { -12, 90 },
+	{ -18, 88 }, { -10, 73 }, { -9, 79 }, { -14, 86 },
+	{ -10, 73 }, { -10, 70 }, { -10, 69 }, { -5, 66 },
+	{ -9, 64 }, { -5, 58 }, { 2, 59 }, { 21, -10 },
+	{ 24, -11 }, { 28, -8 }, { 28, -1 }, { 29, 3 },
+	{ 29, 9 }, { 35, 20 }, { 29, 36 }, { 14, 67 }
+};
+
+static const s32 h264_context_init[HANTRO_H264_CABAC_IDC_NUM][HANTRO_H264_CABAC_CV_NUM][2] = {
+	/* cabac_init_idc == 0 */
+	{
+		/* 0 -> 10 */
+		{ 20, -15 }, { 2, 54 }, { 3, 74 }, { 20, -15 },
+		{ 2, 54 }, { 3, 74 }, { -28, 127 }, { -23, 104 },
+		{ -6, 53 }, { -1, 54 }, { 7, 51 },
+		/* 11 -> 23 */
+		{ 23, 33 }, { 23, 2 }, { 21, 0 }, { 1, 9 },
+		{ 0, 49 }, { -37, 118 }, { 5, 57 }, { -13, 78 },
+		{ -11, 65 }, { 1, 62 }, { 12, 49 }, { -4, 73 },
+		{ 17, 50 },
+		/* 24 -> 39 */
+		{ 18, 64 }, { 9, 43 }, { 29, 0 }, { 26, 67 },
+		{ 16, 90 }, { 9, 104 }, { -46, 127 }, { -20, 104 },
+		{ 1, 67 }, { -13, 78 }, { -11, 65 }, { 1, 62 },
+		{ -6, 86 }, { -17, 95 }, { -6, 61 }, { 9, 45 },
+		/* 40 -> 53 */
+		{ -3, 69 }, { -6, 81 }, { -11, 96 }, { 6, 55 },
+		{ 7, 67 }, { -5, 86 }, { 2, 88 }, { 0, 58 },
+		{ -3, 76 }, { -10, 94 }, { 5, 54 }, { 4, 69 },
+		{ -3, 81 }, { 0, 88 },
+		/* 54 -> 59 */
+		{ -7, 67 }, { -5, 74 }, { -4, 74 }, { -5, 80 },
+		{ -7, 72 }, { 1, 58 },
+		/* 60 -> 69 */
+		{ 0, 41 }, { 0, 63 }, { 0, 63 }, { 0, 63 },
+		{ -9, 83 }, { 4, 86 }, { 0, 97 }, { -7, 72 },
+		{ 13, 41 }, { 3, 62 },
+		/* 70 -> 87 */
+		{ 0, 45 }, { -4, 78 }, { -3, 96 }, { -27, 126 },
+		{ -28, 98 }, { -25, 101 }, { -23, 67 }, { -28, 82 },
+		{ -20, 94 }, { -16, 83 }, { -22, 110 }, { -21, 91 },
+		{ -18, 102 }, { -13, 93 }, { -29, 127 }, { -7, 92 },
+		{ -5, 89 }, { -7, 96 }, { -13, 108 }, { -3, 46 },
+		{ -1, 65 }, { -1, 57 }, { -9, 93 }, { -3, 74 },
+		{ -9, 92 }, { -8, 87 }, { -23, 126 }, { 5, 54 },
+		{ 6, 60 }, { 6, 59 }, { 6, 69 }, { -1, 48 },
+		{ 0, 68 }, { -4, 69 }, { -8, 88 },
+		/* 105 -> 165 */
+		{ -2, 85 }, { -6, 78 }, { -1, 75 }, { -7, 77 },
+		{ 2, 54 }, { 5, 50 }, { -3, 68 }, { 1, 50 },
+		{ 6, 42 }, { -4, 81 }, { 1, 63 }, { -4, 70 },
+		{ 0, 67 }, { 2, 57 }, { -2, 76 }, { 11, 35 },
+		{ 4, 64 }, { 1, 61 }, { 11, 35 }, { 18, 25 },
+		{ 12, 24 }, { 13, 29 }, { 13, 36 }, { -10, 93 },
+		{ -7, 73 }, { -2, 73 }, { 13, 46 }, { 9, 49 },
+		{ -7, 100 }, { 9, 53 }, { 2, 53 }, { 5, 53 },
+		{ -2, 61 }, { 0, 56 }, { 0, 56 }, { -13, 63 },
+		{ -5, 60 }, { -1, 62 }, { 4, 57 }, { -6, 69 },
+		{ 4, 57 }, { 14, 39 }, { 4, 51 }, { 13, 68 },
+		{ 3, 64 }, { 1, 61 }, { 9, 63 }, { 7, 50 },
+		{ 16, 39 }, { 5, 44 }, { 4, 52 }, { 11, 48 },
+		{ -5, 60 }, { -1, 59 }, { 0, 59 }, { 22, 33 },
+		{ 5, 44 }, { 14, 43 }, { -1, 78 }, { 0, 60 },
+		{ 9, 69 },
+		/* 166 -> 226 */
+		{ 11, 28 }, { 2, 40 }, { 3, 44 }, { 0, 49 },
+		{ 0, 46 }, { 2, 44 }, { 2, 51 }, { 0, 47 },
+		{ 4, 39 }, { 2, 62 }, { 6, 46 }, { 0, 54 },
+		{ 3, 54 }, { 2, 58 }, { 4, 63 }, { 6, 51 },
+		{ 6, 57 }, { 7, 53 }, { 6, 52 }, { 6, 55 },
+		{ 11, 45 }, { 14, 36 }, { 8, 53 }, { -1, 82 },
+		{ 7, 55 }, { -3, 78 }, { 15, 46 }, { 22, 31 },
+		{ -1, 84 }, { 25, 7 }, { 30, -7 }, { 28, 3 },
+		{ 28, 4 }, { 32, 0 }, { 34, -1 }, { 30, 6 },
+		{ 30, 6 }, { 32, 9 }, { 31, 19 }, { 26, 27 },
+		{ 26, 30 }, { 37, 20 }, { 28, 34 }, { 17, 70 },
+		{ 1, 67 }, { 5, 59 }, { 9, 67 }, { 16, 30 },
+		{ 18, 32 }, { 18, 35 }, { 22, 29 }, { 24, 31 },
+		{ 23, 38 }, { 18, 43 }, { 20, 41 }, { 11, 63 },
+		{ 9, 59 }, { 9, 64 }, { -1, 94 }, { -2, 89 },
+		{ -9, 108 },
+		/* 227 -> 275 */
+		{ -6, 76 }, { -2, 44 }, { 0, 45 }, { 0, 52 },
+		{ -3, 64 }, { -2, 59 }, { -4, 70 }, { -4, 75 },
+		{ -8, 82 }, { -17, 102 }, { -9, 77 }, { 3, 24 },
+		{ 0, 42 }, { 0, 48 }, { 0, 55 }, { -6, 59 },
+		{ -7, 71 }, { -12, 83 }, { -11, 87 }, { -30, 119 },
+		{ 1, 58 }, { -3, 29 }, { -1, 36 }, { 1, 38 },
+		{ 2, 43 }, { -6, 55 }, { 0, 58 }, { 0, 64 },
+		{ -3, 74 }, { -10, 90 }, { 0, 70 }, { -4, 29 },
+		{ 5, 31 }, { 7, 42 }, { 1, 59 }, { -2, 58 },
+		{ -3, 72 }, { -3, 81 }, { -11, 97 }, { 0, 58 },
+		{ 8, 5 }, { 10, 14 }, { 14, 18 }, { 13, 27 },
+		{ 2, 40 }, { 0, 58 }, { -3, 70 }, { -6, 79 },
+		{ -8, 85 },
+		/* 276 special case, bypass used */
+		{ 0, 0 },
+		/* 277 -> 337 */
+		{ -13, 106 }, { -16, 106 }, { -10, 87 }, { -21, 114 },
+		{ -18, 110 }, { -14, 98 }, { -22, 110 }, { -21, 106 },
+		{ -18, 103 }, { -21, 107 }, { -23, 108 }, { -26, 112 },
+		{ -10, 96 }, { -12, 95 }, { -5, 91 }, { -9, 93 },
+		{ -22, 94 }, { -5, 86 }, { 9, 67 }, { -4, 80 },
+		{ -10, 85 }, { -1, 70 }, { 7, 60 }, { 9, 58 },
+		{ 5, 61 }, { 12, 50 }, { 15, 50 }, { 18, 49 },
+		{ 17, 54 }, { 10, 41 }, { 7, 46 }, { -1, 51 },
+		{ 7, 49 }, { 8, 52 }, { 9, 41 }, { 6, 47 },
+		{ 2, 55 }, { 13, 41 }, { 10, 44 }, { 6, 50 },
+		{ 5, 53 }, { 13, 49 }, { 4, 63 }, { 6, 64 },
+		{ -2, 69 }, { -2, 59 }, { 6, 70 }, { 10, 44 },
+		{ 9, 31 }, { 12, 43 }, { 3, 53 }, { 14, 34 },
+		{ 10, 38 }, { -3, 52 }, { 13, 40 }, { 17, 32 },
+		{ 7, 44 }, { 7, 38 }, { 13, 50 }, { 10, 57 },
+		{ 26, 43 },
+		/* 338 -> 398 */
+		{ 14, 11 }, { 11, 14 }, { 9, 11 }, { 18, 11 },
+		{ 21, 9 }, { 23, -2 }, { 32, -15 }, { 32, -15 },
+		{ 34, -21 }, { 39, -23 }, { 42, -33 }, { 41, -31 },
+		{ 46, -28 }, { 38, -12 }, { 21, 29 }, { 45, -24 },
+		{ 53, -45 }, { 48, -26 }, { 65, -43 }, { 43, -19 },
+		{ 39, -10 }, { 30, 9 }, { 18, 26 }, { 20, 27 },
+		{ 0, 57 }, { -14, 82 }, { -5, 75 }, { -19, 97 },
+		{ -35, 125 }, { 27, 0 }, { 28, 0 }, { 31, -4 },
+		{ 27, 6 }, { 34, 8 }, { 30, 10 }, { 24, 22 },
+		{ 33, 19 }, { 22, 32 }, { 26, 31 }, { 21, 41 },
+		{ 26, 44 }, { 23, 47 }, { 16, 65 }, { 14, 71 },
+		{ 8, 60 }, { 6, 63 }, { 17, 65 }, { 21, 24 },
+		{ 23, 20 }, { 26, 23 }, { 27, 32 }, { 28, 23 },
+		{ 28, 24 }, { 23, 40 }, { 24, 32 }, { 28, 29 },
+		{ 23, 42 }, { 19, 57 }, { 22, 53 }, { 22, 61 },
+		{ 11, 86 },
+		/* 399 -> 435 */
+		{ 12, 40 }, { 11, 51 }, { 14, 59 },
+		{ -4, 79 }, { -7, 71 }, { -5, 69 }, { -9, 70 },
+		{ -8, 66 }, { -10, 68 }, { -19, 73 }, { -12, 69 },
+		{ -16, 70 }, { -15, 67 }, { -20, 62 }, { -19, 70 },
+		{ -16, 66 }, { -22, 65 }, { -20, 63 }, { 9, -2 },
+		{ 26, -9 }, { 33, -9 }, { 39, -7 }, { 41, -2 },
+		{ 45, 3 }, { 49, 9 }, { 45, 27 }, { 36, 59 },
+		{ -6, 66 }, { -7, 35 }, { -7, 42 }, { -8, 45 },
+		{ -5, 48 }, { -12, 56 }, { -6, 60 }, { -5, 62 },
+		{ -8, 66 }, { -8, 76 },
+		/* 436 -> 459 */
+		{ -5, 85 }, { -6, 81 }, { -10, 77 }, { -7, 81 },
+		{ -17, 80 }, { -18, 73 }, { -4, 74 }, { -10, 83 },
+		{ -9, 71 }, { -9, 67 }, { -1, 61 }, { -8, 66 },
+		{ -14, 66 }, { 0, 59 }, { 2, 59 }, { 21, -13 },
+		{ 33, -14 }, { 39, -7 }, { 46, -2 }, { 51, 2 },
+		{ 60, 6 }, { 61, 17 }, { 55, 34 }, { 42, 62 },
+	},
+	/* cabac_init_idc == 1 */
+	{
+		/* 0 -> 10 */
+		{ 20, -15 }, { 2, 54 }, { 3, 74 }, { 20, -15 },
+		{ 2, 54 }, { 3, 74 }, { -28, 127 }, { -23, 104 },
+		{ -6, 53 }, { -1, 54 }, { 7, 51 },
+		/* 11 -> 23 */
+		{ 22, 25 }, { 34, 0 }, { 16, 0 }, { -2, 9 },
+		{ 4, 41 }, { -29, 118 }, { 2, 65 }, { -6, 71 },
+		{ -13, 79 }, { 5, 52 }, { 9, 50 }, { -3, 70 },
+		{ 10, 54 },
+		/* 24 -> 39 */
+		{ 26, 34 }, { 19, 22 }, { 40, 0 }, { 57, 2 },
+		{ 41, 36 }, { 26, 69 }, { -45, 127 }, { -15, 101 },
+		{ -4, 76 }, { -6, 71 }, { -13, 79 }, { 5, 52 },
+		{ 6, 69 }, { -13, 90 }, { 0, 52 }, { 8, 43 },
+		/* 40 -> 53 */
+		{ -2, 69 }, { -5, 82 }, { -10, 96 }, { 2, 59 },
+		{ 2, 75 }, { -3, 87 }, { -3, 100 }, { 1, 56 },
+		{ -3, 74 }, { -6, 85 }, { 0, 59 }, { -3, 81 },
+		{ -7, 86 }, { -5, 95 },
+		/* 54 -> 59 */
+		{ -1, 66 }, { -1, 77 }, { 1, 70 }, { -2, 86 },
+		{ -5, 72 }, { 0, 61 },
+		/* 60 -> 69 */
+		{ 0, 41 }, { 0, 63 }, { 0, 63 }, { 0, 63 },
+		{ -9, 83 }, { 4, 86 }, { 0, 97 }, { -7, 72 },
+		{ 13, 41 }, { 3, 62 },
+		/* 70 -> 104 */
+		{ 13, 15 }, { 7, 51 }, { 2, 80 }, { -39, 127 },
+		{ -18, 91 }, { -17, 96 }, { -26, 81 }, { -35, 98 },
+		{ -24, 102 }, { -23, 97 }, { -27, 119 }, { -24, 99 },
+		{ -21, 110 }, { -18, 102 }, { -36, 127 }, { 0, 80 },
+		{ -5, 89 }, { -7, 94 }, { -4, 92 }, { 0, 39 },
+		{ 0, 65 }, { -15, 84 }, { -35, 127 }, { -2, 73 },
+		{ -12, 104 }, { -9, 91 }, { -31, 127 }, { 3, 55 },
+		{ 7, 56 }, { 7, 55 }, { 8, 61 }, { -3, 53 },
+		{ 0, 68 }, { -7, 74 }, { -9, 88 },
+		/* 105 -> 165 */
+		{ -13, 103 }, { -13, 91 }, { -9, 89 }, { -14, 92 },
+		{ -8, 76 }, { -12, 87 }, { -23, 110 }, { -24, 105 },
+		{ -10, 78 }, { -20, 112 }, { -17, 99 }, { -78, 127 },
+		{ -70, 127 }, { -50, 127 }, { -46, 127 }, { -4, 66 },
+		{ -5, 78 }, { -4, 71 }, { -8, 72 }, { 2, 59 },
+		{ -1, 55 }, { -7, 70 }, { -6, 75 }, { -8, 89 },
+		{ -34, 119 }, { -3, 75 }, { 32, 20 }, { 30, 22 },
+		{ -44, 127 }, { 0, 54 }, { -5, 61 }, { 0, 58 },
+		{ -1, 60 }, { -3, 61 }, { -8, 67 }, { -25, 84 },
+		{ -14, 74 }, { -5, 65 }, { 5, 52 }, { 2, 57 },
+		{ 0, 61 }, { -9, 69 }, { -11, 70 }, { 18, 55 },
+		{ -4, 71 }, { 0, 58 }, { 7, 61 }, { 9, 41 },
+		{ 18, 25 }, { 9, 32 }, { 5, 43 }, { 9, 47 },
+		{ 0, 44 }, { 0, 51 }, { 2, 46 }, { 19, 38 },
+		{ -4, 66 }, { 15, 38 }, { 12, 42 }, { 9, 34 },
+		{ 0, 89 },
+		/* 166 -> 226 */
+		{ 4, 45 }, { 10, 28 }, { 10, 31 }, { 33, -11 },
+		{ 52, -43 }, { 18, 15 }, { 28, 0 }, { 35, -22 },
+		{ 38, -25 }, { 34, 0 }, { 39, -18 }, { 32, -12 },
+		{ 102, -94 }, { 0, 0 }, { 56, -15 }, { 33, -4 },
+		{ 29, 10 }, { 37, -5 }, { 51, -29 }, { 39, -9 },
+		{ 52, -34 }, { 69, -58 }, { 67, -63 }, { 44, -5 },
+		{ 32, 7 }, { 55, -29 }, { 32, 1 }, { 0, 0 },
+		{ 27, 36 }, { 33, -25 }, { 34, -30 }, { 36, -28 },
+		{ 38, -28 }, { 38, -27 }, { 34, -18 }, { 35, -16 },
+		{ 34, -14 }, { 32, -8 }, { 37, -6 }, { 35, 0 },
+		{ 30, 10 }, { 28, 18 }, { 26, 25 }, { 29, 41 },
+		{ 0, 75 }, { 2, 72 }, { 8, 77 }, { 14, 35 },
+		{ 18, 31 }, { 17, 35 }, { 21, 30 }, { 17, 45 },
+		{ 20, 42 }, { 18, 45 }, { 27, 26 }, { 16, 54 },
+		{ 7, 66 }, { 16, 56 }, { 11, 73 }, { 10, 67 },
+		{ -10, 116 },
+		/* 227 -> 275 */
+		{ -23, 112 }, { -15, 71 }, { -7, 61 }, { 0, 53 },
+		{ -5, 66 }, { -11, 77 }, { -9, 80 }, { -9, 84 },
+		{ -10, 87 }, { -34, 127 }, { -21, 101 }, { -3, 39 },
+		{ -5, 53 }, { -7, 61 }, { -11, 75 }, { -15, 77 },
+		{ -17, 91 }, { -25, 107 }, { -25, 111 }, { -28, 122 },
+		{ -11, 76 }, { -10, 44 }, { -10, 52 }, { -10, 57 },
+		{ -9, 58 }, { -16, 72 }, { -7, 69 }, { -4, 69 },
+		{ -5, 74 }, { -9, 86 }, { 2, 66 }, { -9, 34 },
+		{ 1, 32 }, { 11, 31 }, { 5, 52 }, { -2, 55 },
+		{ -2, 67 }, { 0, 73 }, { -8, 89 }, { 3, 52 },
+		{ 7, 4 }, { 10, 8 }, { 17, 8 }, { 16, 19 },
+		{ 3, 37 }, { -1, 61 }, { -5, 73 }, { -1, 70 },
+		{ -4, 78 },
+		/* 276 special case, bypass used */
+		{ 0, 0 },
+		/* 277 -> 337 */
+		{ -21, 126 }, { -23, 124 }, { -20, 110 }, { -26, 126 },
+		{ -25, 124 }, { -17, 105 }, { -27, 121 }, { -27, 117 },
+		{ -17, 102 }, { -26, 117 }, { -27, 116 }, { -33, 122 },
+		{ -10, 95 }, { -14, 100 }, { -8, 95 }, { -17, 111 },
+		{ -28, 114 }, { -6, 89 }, { -2, 80 }, { -4, 82 },
+		{ -9, 85 }, { -8, 81 }, { -1, 72 }, { 5, 64 },
+		{ 1, 67 }, { 9, 56 }, { 0, 69 }, { 1, 69 },
+		{ 7, 69 }, { -7, 69 }, { -6, 67 }, { -16, 77 },
+		{ -2, 64 }, { 2, 61 }, { -6, 67 }, { -3, 64 },
+		{ 2, 57 }, { -3, 65 }, { -3, 66 }, { 0, 62 },
+		{ 9, 51 }, { -1, 66 }, { -2, 71 }, { -2, 75 },
+		{ -1, 70 }, { -9, 72 }, { 14, 60 }, { 16, 37 },
+		{ 0, 47 }, { 18, 35 }, { 11, 37 }, { 12, 41 },
+		{ 10, 41 }, { 2, 48 }, { 12, 41 }, { 13, 41 },
+		{ 0, 59 }, { 3, 50 }, { 19, 40 }, { 3, 66 },
+		{ 18, 50 },
+		/* 338 -> 398 */
+		{ 19, -6 }, { 18, -6 }, { 14, 0 }, { 26, -12 },
+		{ 31, -16 }, { 33, -25 }, { 33, -22 }, { 37, -28 },
+		{ 39, -30 }, { 42, -30 }, { 47, -42 }, { 45, -36 },
+		{ 49, -34 }, { 41, -17 }, { 32, 9 }, { 69, -71 },
+		{ 63, -63 }, { 66, -64 }, { 77, -74 }, { 54, -39 },
+		{ 52, -35 }, { 41, -10 }, { 36, 0 }, { 40, -1 },
+		{ 30, 14 }, { 28, 26 }, { 23, 37 }, { 12, 55 },
+		{ 11, 65 }, { 37, -33 }, { 39, -36 }, { 40, -37 },
+		{ 38, -30 }, { 46, -33 }, { 42, -30 }, { 40, -24 },
+		{ 49, -29 }, { 38, -12 }, { 40, -10 }, { 38, -3 },
+		{ 46, -5 }, { 31, 20 }, { 29, 30 }, { 25, 44 },
+		{ 12, 48 }, { 11, 49 }, { 26, 45 }, { 22, 22 },
+		{ 23, 22 }, { 27, 21 }, { 33, 20 }, { 26, 28 },
+		{ 30, 24 }, { 27, 34 }, { 18, 42 }, { 25, 39 },
+		{ 18, 50 }, { 12, 70 }, { 21, 54 }, { 14, 71 },
+		{ 11, 83 },
+		/* 399 -> 435 */
+		{ 25, 32 }, { 21, 49 }, { 21, 54 },
+		{ -5, 85 }, { -6, 81 }, { -10, 77 }, { -7, 81 },
+		{ -17, 80 }, { -18, 73 }, { -4, 74 }, { -10, 83 },
+		{ -9, 71 }, { -9, 67 }, { -1, 61 }, { -8, 66 },
+		{ -14, 66 }, { 0, 59 }, { 2, 59 }, { 17, -10 },
+		{ 32, -13 }, { 42, -9 }, { 49, -5 }, { 53, 0 },
+		{ 64, 3 }, { 68, 10 }, { 66, 27 }, { 47, 57 },
+		{ -5, 71 }, { 0, 24 }, { -1, 36 }, { -2, 42 },
+		{ -2, 52 }, { -9, 57 }, { -6, 63 }, { -4, 65 },
+		{ -4, 67 }, { -7, 82 },
+		/* 436 -> 459 */
+		{ -3, 81 }, { -3, 76 }, { -7, 72 }, { -6, 78 },
+		{ -12, 72 }, { -14, 68 }, { -3, 70 }, { -6, 76 },
+		{ -5, 66 }, { -5, 62 }, { 0, 57 }, { -4, 61 },
+		{ -9, 60 }, { 1, 54 }, { 2, 58 }, { 17, -10 },
+		{ 32, -13 }, { 42, -9 }, { 49, -5 }, { 53, 0 },
+		{ 64, 3 }, { 68, 10 }, { 66, 27 }, { 47, 57 },
+	},
+	/* cabac_init_idc == 2 */
+	{
+		/* 0 -> 10 */
+		{ 20, -15 }, { 2, 54 }, { 3, 74 }, { 20, -15 },
+		{ 2, 54 }, { 3, 74 }, { -28, 127 }, { -23, 104 },
+		{ -6, 53 }, { -1, 54 }, { 7, 51 },
+		/* 11 -> 23 */
+		{ 29, 16 }, { 25, 0 }, { 14, 0 }, { -10, 51 },
+		{ -3, 62 }, { -27, 99 }, { 26, 16 }, { -4, 85 },
+		{ -24, 102 }, { 5, 57 }, { 6, 57 }, { -17, 73 },
+		{ 14, 57 },
+		/* 24 -> 39 */
+		{ 20, 40 }, { 20, 10 }, { 29, 0 }, { 54, 0 },
+		{ 37, 42 }, { 12, 97 }, { -32, 127 }, { -22, 117 },
+		{ -2, 74 }, { -4, 85 }, { -24, 102 }, { 5, 57 },
+		{ -6, 93 }, { -14, 88 }, { -6, 44 }, { 4, 55 },
+		/* 40 -> 53 */
+		{ -11, 89 }, { -15, 103 }, { -21, 116 }, { 19, 57 },
+		{ 20, 58 }, { 4, 84 }, { 6, 96 }, { 1, 63 },
+		{ -5, 85 }, { -13, 106 }, { 5, 63 }, { 6, 75 },
+		{ -3, 90 }, { -1, 101 },
+		/* 54 -> 59 */
+		{ 3, 55 }, { -4, 79 }, { -2, 75 }, { -12, 97 },
+		{ -7, 50 }, { 1, 60 },
+		/* 60 -> 69 */
+		{ 0, 41 }, { 0, 63 }, { 0, 63 }, { 0, 63 },
+		{ -9, 83 }, { 4, 86 }, { 0, 97 }, { -7, 72 },
+		{ 13, 41 }, { 3, 62 },
+		/* 70 -> 104 */
+		{ 7, 34 }, { -9, 88 }, { -20, 127 }, { -36, 127 },
+		{ -17, 91 }, { -14, 95 }, { -25, 84 }, { -25, 86 },
+		{ -12, 89 }, { -17, 91 }, { -31, 127 }, { -14, 76 },
+		{ -18, 103 }, { -13, 90 }, { -37, 127 }, { 11, 80 },
+		{ 5, 76 }, { 2, 84 }, { 5, 78 }, { -6, 55 },
+		{ 4, 61 }, { -14, 83 }, { -37, 127 }, { -5, 79 },
+		{ -11, 104 }, { -11, 91 }, { -30, 127 }, { 0, 65 },
+		{ -2, 79 }, { 0, 72 }, { -4, 92 }, { -6, 56 },
+		{ 3, 68 }, { -8, 71 }, { -13, 98 },
+		/* 105 -> 165 */
+		{ -4, 86 }, { -12, 88 }, { -5, 82 }, { -3, 72 },
+		{ -4, 67 }, { -8, 72 }, { -16, 89 }, { -9, 69 },
+		{ -1, 59 }, { 5, 66 }, { 4, 57 }, { -4, 71 },
+		{ -2, 71 }, { 2, 58 }, { -1, 74 }, { -4, 44 },
+		{ -1, 69 }, { 0, 62 }, { -7, 51 }, { -4, 47 },
+		{ -6, 42 }, { -3, 41 }, { -6, 53 }, { 8, 76 },
+		{ -9, 78 }, { -11, 83 }, { 9, 52 }, { 0, 67 },
+		{ -5, 90 }, { 1, 67 }, { -15, 72 }, { -5, 75 },
+		{ -8, 80 }, { -21, 83 }, { -21, 64 }, { -13, 31 },
+		{ -25, 64 }, { -29, 94 }, { 9, 75 }, { 17, 63 },
+		{ -8, 74 }, { -5, 35 }, { -2, 27 }, { 13, 91 },
+		{ 3, 65 }, { -7, 69 }, { 8, 77 }, { -10, 66 },
+		{ 3, 62 }, { -3, 68 }, { -20, 81 }, { 0, 30 },
+		{ 1, 7 }, { -3, 23 }, { -21, 74 }, { 16, 66 },
+		{ -23, 124 }, { 17, 37 }, { 44, -18 }, { 50, -34 },
+		{ -22, 127 },
+		/* 166 -> 226 */
+		{ 4, 39 }, { 0, 42 }, { 7, 34 }, { 11, 29 },
+		{ 8, 31 }, { 6, 37 }, { 7, 42 }, { 3, 40 },
+		{ 8, 33 }, { 13, 43 }, { 13, 36 }, { 4, 47 },
+		{ 3, 55 }, { 2, 58 }, { 6, 60 }, { 8, 44 },
+		{ 11, 44 }, { 14, 42 }, { 7, 48 }, { 4, 56 },
+		{ 4, 52 }, { 13, 37 }, { 9, 49 }, { 19, 58 },
+		{ 10, 48 }, { 12, 45 }, { 0, 69 }, { 20, 33 },
+		{ 8, 63 }, { 35, -18 }, { 33, -25 }, { 28, -3 },
+		{ 24, 10 }, { 27, 0 }, { 34, -14 }, { 52, -44 },
+		{ 39, -24 }, { 19, 17 }, { 31, 25 }, { 36, 29 },
+		{ 24, 33 }, { 34, 15 }, { 30, 20 }, { 22, 73 },
+		{ 20, 34 }, { 19, 31 }, { 27, 44 }, { 19, 16 },
+		{ 15, 36 }, { 15, 36 }, { 21, 28 }, { 25, 21 },
+		{ 30, 20 }, { 31, 12 }, { 27, 16 }, { 24, 42 },
+		{ 0, 93 }, { 14, 56 }, { 15, 57 }, { 26, 38 },
+		{ -24, 127 },
+		/* 227 -> 275 */
+		{ -24, 115 }, { -22, 82 }, { -9, 62 }, { 0, 53 },
+		{ 0, 59 }, { -14, 85 }, { -13, 89 }, { -13, 94 },
+		{ -11, 92 }, { -29, 127 }, { -21, 100 }, { -14, 57 },
+		{ -12, 67 }, { -11, 71 }, { -10, 77 }, { -21, 85 },
+		{ -16, 88 }, { -23, 104 }, { -15, 98 }, { -37, 127 },
+		{ -10, 82 }, { -8, 48 }, { -8, 61 }, { -8, 66 },
+		{ -7, 70 }, { -14, 75 }, { -10, 79 }, { -9, 83 },
+		{ -12, 92 }, { -18, 108 }, { -4, 79 }, { -22, 69 },
+		{ -16, 75 }, { -2, 58 }, { 1, 58 }, { -13, 78 },
+		{ -9, 83 }, { -4, 81 }, { -13, 99 }, { -13, 81 },
+		{ -6, 38 }, { -13, 62 }, { -6, 58 }, { -2, 59 },
+		{ -16, 73 }, { -10, 76 }, { -13, 86 }, { -9, 83 },
+		{ -10, 87 },
+		/* 276 special case, bypass used */
+		{ 0, 0 },
+		/* 277 -> 337 */
+		{ -22, 127 }, { -25, 127 }, { -25, 120 }, { -27, 127 },
+		{ -19, 114 }, { -23, 117 }, { -25, 118 }, { -26, 117 },
+		{ -24, 113 }, { -28, 118 }, { -31, 120 }, { -37, 124 },
+		{ -10, 94 }, { -15, 102 }, { -10, 99 }, { -13, 106 },
+		{ -50, 127 }, { -5, 92 }, { 17, 57 }, { -5, 86 },
+		{ -13, 94 }, { -12, 91 }, { -2, 77 }, { 0, 71 },
+		{ -1, 73 }, { 4, 64 }, { -7, 81 }, { 5, 64 },
+		{ 15, 57 }, { 1, 67 }, { 0, 68 }, { -10, 67 },
+		{ 1, 68 }, { 0, 77 }, { 2, 64 }, { 0, 68 },
+		{ -5, 78 }, { 7, 55 }, { 5, 59 }, { 2, 65 },
+		{ 14, 54 }, { 15, 44 }, { 5, 60 }, { 2, 70 },
+		{ -2, 76 }, { -18, 86 }, { 12, 70 }, { 5, 64 },
+		{ -12, 70 }, { 11, 55 }, { 5, 56 }, { 0, 69 },
+		{ 2, 65 }, { -6, 74 }, { 5, 54 }, { 7, 54 },
+		{ -6, 76 }, { -11, 82 }, { -2, 77 }, { -2, 77 },
+		{ 25, 42 },
+		/* 338 -> 398 */
+		{ 17, -13 }, { 16, -9 }, { 17, -12 }, { 27, -21 },
+		{ 37, -30 }, { 41, -40 }, { 42, -41 }, { 48, -47 },
+		{ 39, -32 }, { 46, -40 }, { 52, -51 }, { 46, -41 },
+		{ 52, -39 }, { 43, -19 }, { 32, 11 }, { 61, -55 },
+		{ 56, -46 }, { 62, -50 }, { 81, -67 }, { 45, -20 },
+		{ 35, -2 }, { 28, 15 }, { 34, 1 }, { 39, 1 },
+		{ 30, 17 }, { 20, 38 }, { 18, 45 }, { 15, 54 },
+		{ 0, 79 }, { 36, -16 }, { 37, -14 }, { 37, -17 },
+		{ 32, 1 }, { 34, 15 }, { 29, 15 }, { 24, 25 },
+		{ 34, 22 }, { 31, 16 }, { 35, 18 }, { 31, 28 },
+		{ 33, 41 }, { 36, 28 }, { 27, 47 }, { 21, 62 },
+		{ 18, 31 }, { 19, 26 }, { 36, 24 }, { 24, 23 },
+		{ 27, 16 }, { 24, 30 }, { 31, 29 }, { 22, 41 },
+		{ 22, 42 }, { 16, 60 }, { 15, 52 }, { 14, 60 },
+		{ 3, 78 }, { -16, 123 }, { 21, 53 }, { 22, 56 },
+		{ 25, 61 },
+		/* 399 -> 435 */
+		{ 21, 33 }, { 19, 50 }, { 17, 61 },
+		{ -3, 78 }, { -8, 74 }, { -9, 72 }, { -10, 72 },
+		{ -18, 75 }, { -12, 71 }, { -11, 63 }, { -5, 70 },
+		{ -17, 75 }, { -14, 72 }, { -16, 67 }, { -8, 53 },
+		{ -14, 59 }, { -9, 52 }, { -11, 68 }, { 9, -2 },
+		{ 30, -10 }, { 31, -4 }, { 33, -1 }, { 33, 7 },
+		{ 31, 12 }, { 37, 23 }, { 31, 38 }, { 20, 64 },
+		{ -9, 71 }, { -7, 37 }, { -8, 44 }, { -11, 49 },
+		{ -10, 56 }, { -12, 59 }, { -8, 63 }, { -9, 67 },
+		{ -6, 68 }, { -10, 79 },
+		/* 436 -> 459 */
+		{ -3, 78 }, { -8, 74 }, { -9, 72 }, { -10, 72 },
+		{ -18, 75 }, { -12, 71 }, { -11, 63 }, { -5, 70 },
+		{ -17, 75 }, { -14, 72 }, { -16, 67 }, { -8, 53 },
+		{ -14, 59 }, { -9, 52 }, { -11, 68 }, { 9, -2 },
+		{ 30, -10 }, { 31, -4 }, { 33, -1 }, { 33, 7 },
+		{ 31, 12 }, { 37, 23 }, { 31, 38 }, { 20, 64 },
+	}
+};
+
 static void
 assemble_scaling_list(struct hantro_ctx *ctx)
 {
@@ -519,3 +1099,200 @@ int hantro_h264_dec_init(struct hantro_ctx *ctx)
 
 	return 0;
 }
+
+void hantro_h264_enc_exit(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	int i;
+
+	dma_free_coherent(vpu->dev, ctx->h264_enc.segment_map.size,
+			  ctx->h264_enc.segment_map.cpu,
+			  ctx->h264_enc.segment_map.dma);
+
+	dma_free_coherent(vpu->dev, ctx->h264_enc.mv_buf.size,
+			  ctx->h264_enc.mv_buf.cpu,
+			  ctx->h264_enc.mv_buf.dma);
+
+	i = HANTRO_H264_CABAC_IDC_NUM;
+	while (--i >= 0)
+		dma_free_coherent(vpu->dev, ctx->h264_enc.cabac_ctx[i].size,
+				  ctx->h264_enc.cabac_ctx[i].cpu,
+				  ctx->h264_enc.cabac_ctx[i].dma);
+
+	dma_free_coherent(vpu->dev, ctx->h264_enc.nal_table.size,
+			  ctx->h264_enc.nal_table.cpu,
+			  ctx->h264_enc.nal_table.dma);
+
+	i = HANTRO_H264_NUM_INTERNAL_FRAMES;
+	while (--i >= 0)
+		dma_free_coherent(vpu->dev, ctx->h264_enc.chroma_internal[i].size,
+				  ctx->h264_enc.chroma_internal[i].cpu,
+				  ctx->h264_enc.chroma_internal[i].dma);
+	i = HANTRO_H264_NUM_INTERNAL_FRAMES;
+	while (--i >= 0)
+		dma_free_coherent(vpu->dev, ctx->h264_enc.luma_internal[i].size,
+				  ctx->h264_enc.luma_internal[i].cpu,
+				  ctx->h264_enc.luma_internal[i].dma);
+}
+
+#define LUMA_MB_BYTES_W 16
+#define LUMA_MB_BYTES_H 16
+#define LUMA_MB_BYTES (LUMA_MB_BYTES_W * LUMA_MB_BYTES_H)
+#define CHROMA_MB_BYTES_W 8
+#define CHROMA_MB_BYTES_H 8
+#define CHROMA_MB_BYTES (CHROMA_MB_BYTES_W * CHROMA_MB_BYTES_H)
+#define N_CHROMA_PLANES 2
+#define NAL_ENTRY_BYTES 4
+#define N_QPS 52
+#define CABAC_CTX_TABLE_BYTES 464
+#define MB_MV_BYTES 56
+#define MB_SEGMENTATION_BITS 4
+
+static void buffer_cpu_to_be64(u64 *buf, u32 size)
+{
+	u32 i;
+
+	for (i = 0; i < size; ++i)
+		buf[i] = cpu_to_be64(buf[i]);
+}
+
+static void h264_enc_init_cabac_table(struct hantro_ctx *ctx)
+{
+	u8 *table;
+	const s32(*context)[HANTRO_H264_CABAC_CV_NUM][2];
+	s32 i, j, k, qp;
+
+	for (k = 0; k < HANTRO_H264_CABAC_IDC_NUM; k++) {
+		table = (u8 *)ctx->h264_enc.cabac_ctx[k].cpu;
+
+		for (qp = 0; qp < N_QPS; qp++) { /* All QP values */
+			for (j = 0; j < 2; j++) { /* Intra/Inter */
+				context = (j == 0) ?
+					&h264_context_init_intra :
+					&h264_context_init[k];
+				for (i = 0; i < HANTRO_H264_CABAC_CV_NUM; i++) {
+					s32 m = (s32)(*context)[i][0];
+					s32 n = (s32)(*context)[i][1];
+					s32 pre_ctx_st = clamp(((m * qp) >> 4) + n, 1, 126);
+					int idx = qp * 464 * 2 + j * 464 + i;
+
+					if (pre_ctx_st <= 63)
+						table[idx] = (u8)((63 - pre_ctx_st) << 1);
+					else
+						table[idx] = (u8)(((pre_ctx_st - 64) << 1) | 1);
+				}
+			}
+		}
+
+		buffer_cpu_to_be64((u64 *)table, 2 * N_QPS * CABAC_CTX_TABLE_BYTES / sizeof(u64));
+	}
+}
+
+int hantro_h264_enc_init(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_aux_buf *aux_buf;
+	unsigned int mb_width, mb_height, mb_total;
+	int ret, i;
+
+	mb_width = DIV_ROUND_UP(ctx->src_fmt.width, 16);
+	mb_height = DIV_ROUND_UP(ctx->src_fmt.height, 16);
+	mb_total = mb_width * mb_height;
+
+	for (i = 0; i < HANTRO_H264_NUM_INTERNAL_FRAMES; ++i) {
+		aux_buf = &ctx->h264_enc.luma_internal[i];
+		aux_buf->size = mb_total * LUMA_MB_BYTES;
+		aux_buf->cpu = dma_alloc_coherent(vpu->dev, aux_buf->size,
+						  &aux_buf->dma, GFP_KERNEL);
+		if (!aux_buf->cpu) {
+			ret = -ENOMEM;
+			goto err_free_luma_internal;
+		}
+	}
+
+	for (i = 0; i < HANTRO_H264_NUM_INTERNAL_FRAMES; ++i) {
+		aux_buf = &ctx->h264_enc.chroma_internal[i];
+		aux_buf->size = N_CHROMA_PLANES * mb_total * CHROMA_MB_BYTES;
+		aux_buf->cpu = dma_alloc_coherent(vpu->dev, aux_buf->size,
+						  &aux_buf->dma, GFP_KERNEL);
+		if (!aux_buf->cpu) {
+			ret = -ENOMEM;
+			goto err_free_chroma_internal;
+		}
+	}
+
+	aux_buf = &ctx->h264_enc.nal_table;
+	aux_buf->size = round_up(NAL_ENTRY_BYTES * (mb_height + 4), 8);
+	aux_buf->cpu = dma_alloc_coherent(vpu->dev, aux_buf->size,
+					  &aux_buf->dma, GFP_KERNEL);
+	if (!aux_buf->cpu) {
+		ret = -ENOMEM;
+		goto err_free_chroma_internal;
+	}
+
+	for (i = 0; i < HANTRO_H264_CABAC_IDC_NUM; ++i) {
+		aux_buf = &ctx->h264_enc.cabac_ctx[i];
+		aux_buf->size = 2 * N_QPS * CABAC_CTX_TABLE_BYTES; /* 2: intra + inter */
+		aux_buf->cpu = dma_alloc_coherent(vpu->dev, aux_buf->size,
+						  &aux_buf->dma, GFP_KERNEL);
+		if (!aux_buf->cpu) {
+			ret = -ENOMEM;
+			goto err_free_cabac_ctx;
+		}
+	}
+
+	aux_buf = &ctx->h264_enc.mv_buf;
+	aux_buf->size = mb_total * MB_MV_BYTES;
+	aux_buf->cpu = dma_alloc_coherent(vpu->dev, aux_buf->size,
+					  &aux_buf->dma, GFP_KERNEL);
+	if (!aux_buf->cpu) {
+		ret = -ENOMEM;
+		goto err_free_cabac_ctx;
+	}
+
+	aux_buf = &ctx->h264_enc.segment_map;
+	aux_buf->size = round_up(mb_total * MB_SEGMENTATION_BITS, 64) * 8;
+	aux_buf->cpu = dma_alloc_coherent(vpu->dev, aux_buf->size,
+					  &aux_buf->dma, GFP_KERNEL);
+	if (!aux_buf->cpu) {
+		ret = -ENOMEM;
+		goto err_free_mv_buf;
+	}
+
+	h264_enc_init_cabac_table(ctx);
+
+	ctx->h264_enc.last_prev_idx = ctx->h264_enc.last_idx = ctx->h264_enc.ltr_idx = -1;
+
+	return 0;
+
+err_free_mv_buf:
+	dma_free_coherent(vpu->dev, ctx->h264_enc.mv_buf.size,
+			  ctx->h264_enc.mv_buf.cpu,
+			  ctx->h264_enc.mv_buf.dma);
+
+err_free_cabac_ctx:
+	while (--i >= 0)
+		dma_free_coherent(vpu->dev, ctx->h264_enc.cabac_ctx[i].size,
+				  ctx->h264_enc.cabac_ctx[i].cpu,
+				  ctx->h264_enc.cabac_ctx[i].dma);
+
+	dma_free_coherent(vpu->dev, ctx->h264_enc.nal_table.size,
+			  ctx->h264_enc.nal_table.cpu,
+			  ctx->h264_enc.nal_table.dma);
+	i = HANTRO_H264_NUM_INTERNAL_FRAMES;
+
+err_free_chroma_internal:
+	while (--i >= 0)
+		dma_free_coherent(vpu->dev, ctx->h264_enc.chroma_internal[i].size,
+				  ctx->h264_enc.chroma_internal[i].cpu,
+				  ctx->h264_enc.chroma_internal[i].dma);
+	i = HANTRO_H264_NUM_INTERNAL_FRAMES;
+
+err_free_luma_internal:
+	while (--i >= 0)
+		dma_free_coherent(vpu->dev, ctx->h264_enc.luma_internal[i].size,
+				  ctx->h264_enc.luma_internal[i].cpu,
+				  ctx->h264_enc.luma_internal[i].dma);
+
+	return ret;
+}
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index e2dc03b81b0d..444a339642d3 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -417,6 +417,24 @@ struct hantro_vp8_enc_hw_ctx {
 	u8 copy_buffer_to_alternate;
 };
 
+#define HANTRO_H264_NUM_INTERNAL_FRAMES 4
+#define HANTRO_H264_CABAC_IDC_NUM	3
+#define HANTRO_H264_CABAC_CV_NUM	460
+
+struct hantro_h264_enc_hw_ctx {
+	struct hantro_aux_buf luma_internal[HANTRO_H264_NUM_INTERNAL_FRAMES];
+	struct hantro_aux_buf chroma_internal[HANTRO_H264_NUM_INTERNAL_FRAMES];
+	u64 reference_ts[HANTRO_H264_NUM_INTERNAL_FRAMES];
+	int last_idx;
+	int last_prev_idx;
+	int reconstr_idx;
+	int ltr_idx;
+	struct hantro_aux_buf nal_table;
+	struct hantro_aux_buf cabac_ctx[HANTRO_H264_CABAC_IDC_NUM];
+	struct hantro_aux_buf mv_buf;
+	struct hantro_aux_buf segment_map;
+};
+
 /**
  * struct hantro_codec_ops - codec mode specific operations
  *
@@ -635,4 +653,9 @@ void hantro_vp8_enc_exit(struct hantro_ctx *ctx);
 int hantro_h1_vp8_enc_run(struct hantro_ctx *ctx);
 void hantro_h1_vp8_enc_done(struct hantro_ctx *ctx);
 
+int hantro_h1_h264_enc_run(struct hantro_ctx *ctx);
+int hantro_h264_enc_init(struct hantro_ctx *ctx);
+void hantro_h1_h264_enc_done(struct hantro_ctx *ctx);
+void hantro_h264_enc_exit(struct hantro_ctx *ctx);
+
 #endif /* HANTRO_HW_H_ */
diff --git a/drivers/media/platform/verisilicon/stm32mp25_venc_hw.c b/drivers/media/platform/verisilicon/stm32mp25_venc_hw.c
index 6e351502c98d..95260c6193c5 100644
--- a/drivers/media/platform/verisilicon/stm32mp25_venc_hw.c
+++ b/drivers/media/platform/verisilicon/stm32mp25_venc_hw.c
@@ -113,6 +113,19 @@ static const struct hantro_fmt stm32mp25_venc_fmts[] = {
 			.step_height = MB_DIM,
 		},
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_H264_SLICE,
+		.codec_mode = HANTRO_MODE_H264_ENC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 96,
+			.max_width = 4080,
+			.step_width = MB_DIM,
+			.min_height = 96,
+			.max_height = 4080,
+			.step_height = MB_DIM,
+		},
+	},
 };
 
 static irqreturn_t stm32mp25_venc_irq(int irq, void *dev_id)
@@ -161,6 +174,13 @@ static const struct hantro_codec_ops stm32mp25_venc_codec_ops[] = {
 		.done = hantro_h1_vp8_enc_done,
 		.exit = hantro_vp8_enc_exit,
 	},
+	[HANTRO_MODE_H264_ENC] = {
+		.run = hantro_h1_h264_enc_run,
+		.reset = stm32mp25_venc_reset,
+		.init = hantro_h264_enc_init,
+		.done = hantro_h1_h264_enc_done,
+		.exit = hantro_h264_enc_exit,
+	},
 };
 
 /*
@@ -178,7 +198,7 @@ static const char * const stm32mp25_venc_clk_names[] = {
 const struct hantro_variant stm32mp25_venc_variant = {
 	.enc_fmts = stm32mp25_venc_fmts,
 	.num_enc_fmts = ARRAY_SIZE(stm32mp25_venc_fmts),
-	.codec = HANTRO_JPEG_ENCODER | HANTRO_VP8_ENCODER,
+	.codec = HANTRO_JPEG_ENCODER | HANTRO_VP8_ENCODER | HANTRO_H264_ENCODER,
 	.codec_ops = stm32mp25_venc_codec_ops,
 	.irqs = stm32mp25_venc_irqs,
 	.num_irqs = ARRAY_SIZE(stm32mp25_venc_irqs),
-- 
2.25.1


