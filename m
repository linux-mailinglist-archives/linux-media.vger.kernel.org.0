Return-Path: <linux-media+bounces-58785-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOHgHWlA32kxRAAAu9opvQ
	(envelope-from <linux-media+bounces-58785-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:38:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F390F4016ED
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6CAA30314A5
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 07:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74E3394493;
	Wed, 15 Apr 2026 07:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GutWcDpl"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41152030A;
	Wed, 15 Apr 2026 07:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776238690; cv=none; b=Nk+CqAXC8azjU5uVCXlXIkUtJGXcbFJGu3+nhnz/4HLu2UriJ0+q/VEJLIIaDGPtMu9vOVuHFcMAGPb8DNN56Rf3WZkFHmVcrlVuQVkN8l/8dPlyjHkXyWSQSRFUex5/HM9oNQmdZkmwwuFoJR/zf05MORyr3f+spr+JxPwoVdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776238690; c=relaxed/simple;
	bh=bppZl4mCGqId5rJoCIqCfE4VGLY9iGvur8gv7e07jBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zj60v0fpJr948vDsOB4hOF4bNzF5+Qh3PvbvmgQybzlh+83G1XbrBFyVBMlWEZ/K309CmAcdgSdBAGpXfJqpztHKUjmdB3a443PVfZDt9BWrZl248IuhoRk72AJvL6/j1dm9F3pTZWQWjnxU1bxpIyzeqGzITQiJg/4ViVeEOx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GutWcDpl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776238684;
	bh=bppZl4mCGqId5rJoCIqCfE4VGLY9iGvur8gv7e07jBw=;
	h=From:To:Cc:Subject:Date:From;
	b=GutWcDplz1M8sSXkM/cRaZJzjOiluVkX+fYXtP61F+q1HENCVt4nm0roUDPbrJTPZ
	 g0ssctnZsYEZ73mf9NOdiB2GaRP2WFb1tbE7jjgk5DqIjFn13Y1bBAisCZC/Qp8yCn
	 WUYUoAacQEPYPWPbgIVjTbiejXzhNNQVelbCZxhFQqBuE4yUpJm+REFkq1aPGFLMny
	 muuIbzxNZGaaMih7cDZES8OsRuNQb76TXdsXpiuQBjOTmRO2KBWyNgpTONjoXYXiGo
	 Fw7UB7nFUjE8Ox2kG9JWrKTCKY+2CTxqcSmNVUBttzmXz/AzFLQTqXbJMLURjunKAa
	 4leHUEviE+kYg==
Received: from benjamin-XPS-13-9310.. (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A831517E1166;
	Wed, 15 Apr 2026 09:38:03 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	heiko@sntech.de
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3] media: verisilicon: Create AV1 helper library
Date: Wed, 15 Apr 2026 09:38:01 +0200
Message-ID: <20260415073801.58369-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58785-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F390F4016ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Regroup all none hardware related AV1 functions into a helper library.
The goal is to avoid code duplication for futur AV1 codecs.

Tested on rock 5b board Fluster score remains the same 204/241.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
changes in version 3:
 - Remove useless wrapper functions.

 drivers/media/platform/verisilicon/Makefile   |   7 +-
 .../media/platform/verisilicon/hantro_av1.c   | 780 +++++++++++++++
 .../media/platform/verisilicon/hantro_av1.h   |  62 ++
 ...entropymode.c => hantro_av1_entropymode.c} |  18 +-
 ...entropymode.h => hantro_av1_entropymode.h} |  18 +-
 ...av1_filmgrain.c => hantro_av1_filmgrain.c} |  82 +-
 .../verisilicon/hantro_av1_filmgrain.h        |  44 +
 .../media/platform/verisilicon/hantro_hw.h    |   7 +-
 .../verisilicon/rockchip_av1_filmgrain.h      |  36 -
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 935 ++----------------
 .../platform/verisilicon/rockchip_vpu_hw.c    |   7 +-
 11 files changed, 1041 insertions(+), 955 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1.c
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1.h
 rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.c => hantro_av1_entropymode.c} (99%)
 rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.h => hantro_av1_entropymode.h} (95%)
 rename drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c => hantro_av1_filmgrain.c} (92%)
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
 delete mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h

diff --git a/drivers/media/platform/verisilicon/Makefile b/drivers/media/platform/verisilicon/Makefile
index f6f019d04ff0..a1dd6c2d29be 100644
--- a/drivers/media/platform/verisilicon/Makefile
+++ b/drivers/media/platform/verisilicon/Makefile
@@ -19,7 +19,10 @@ hantro-vpu-y += \
 		hantro_hevc.o \
 		hantro_mpeg2.o \
 		hantro_vp8.o \
-		hantro_vp9.o
+		hantro_vp9.o \
+		hantro_av1.o \
+		hantro_av1_filmgrain.o \
+		hantro_av1_entropymode.o
 
 hantro-vpu-$(CONFIG_VIDEO_HANTRO_IMX8M) += \
 		imx8m_vpu_hw.o
@@ -33,8 +36,6 @@ hantro-vpu-$(CONFIG_VIDEO_HANTRO_ROCKCHIP) += \
 		rockchip_vpu2_hw_mpeg2_dec.o \
 		rockchip_vpu2_hw_vp8_dec.o \
 		rockchip_vpu981_hw_av1_dec.o \
-		rockchip_av1_filmgrain.o \
-		rockchip_av1_entropymode.o \
 		rockchip_vpu_hw.o
 
 hantro-vpu-$(CONFIG_VIDEO_HANTRO_SUNXI) += \
diff --git a/drivers/media/platform/verisilicon/hantro_av1.c b/drivers/media/platform/verisilicon/hantro_av1.c
new file mode 100644
index 000000000000..5a51ac877c9c
--- /dev/null
+++ b/drivers/media/platform/verisilicon/hantro_av1.c
@@ -0,0 +1,780 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, Collabora
+ *
+ * Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
+ */
+
+#include <linux/types.h>
+#include <media/v4l2-h264.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "hantro.h"
+#include "hantro_av1.h"
+#include "hantro_hw.h"
+
+#define GM_GLOBAL_MODELS_PER_FRAME	7
+#define GLOBAL_MODEL_TOTAL_SIZE	(6 * 4 + 4 * 2)
+#define GLOBAL_MODEL_SIZE	ALIGN(GM_GLOBAL_MODELS_PER_FRAME * GLOBAL_MODEL_TOTAL_SIZE, 2048)
+#define AV1_MAX_TILES		128
+#define AV1_TILE_INFO_SIZE	(AV1_MAX_TILES * 16)
+#define AV1_INVALID_IDX		-1
+#define AV1_TILE_SIZE		ALIGN(32 * 128, 4096)
+
+#define SUPERRES_SCALE_BITS 3
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
+enum hantro_av1_tx_mode {
+	HANTRO_AV1_TX_MODE_ONLY_4X4	= 0,
+	HANTRO_AV1_TX_MODE_8X8		= 1,
+	HANTRO_AV1_TX_MODE_16x16	= 2,
+	HANTRO_AV1_TX_MODE_32x32	= 3,
+	HANTRO_AV1_TX_MODE_SELECT	= 4,
+};
+
+enum hantro_av1_inter_prediction_filter_type {
+	HANTRO_AV1_EIGHT_TAP_SMOOTH	= 0,
+	HANTRO_AV1_EIGHT_TAP		= 1,
+	HANTRO_AV1_EIGHT_TAP_SHARP	= 2,
+	HANTRO_AV1_BILINEAR		= 3,
+	HANTRO_AV1_SWITCHABLE		= 4,
+};
+
+int hantro_av1_get_hardware_tx_mode(enum v4l2_av1_tx_mode tx_mode)
+{
+	switch (tx_mode) {
+	case V4L2_AV1_TX_MODE_ONLY_4X4:
+		return HANTRO_AV1_TX_MODE_ONLY_4X4;
+	case V4L2_AV1_TX_MODE_LARGEST:
+		return HANTRO_AV1_TX_MODE_32x32;
+	case V4L2_AV1_TX_MODE_SELECT:
+		return HANTRO_AV1_TX_MODE_SELECT;
+	}
+
+	return HANTRO_AV1_TX_MODE_32x32;
+}
+
+int hantro_av1_get_hardware_mcomp_filt_type(int interpolation_filter)
+{
+	switch (interpolation_filter) {
+	case V4L2_AV1_INTERPOLATION_FILTER_EIGHTTAP:
+		return HANTRO_AV1_EIGHT_TAP;
+	case V4L2_AV1_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH:
+		return HANTRO_AV1_EIGHT_TAP_SMOOTH;
+	case V4L2_AV1_INTERPOLATION_FILTER_EIGHTTAP_SHARP:
+		return HANTRO_AV1_EIGHT_TAP_SHARP;
+	case V4L2_AV1_INTERPOLATION_FILTER_BILINEAR:
+		return HANTRO_AV1_BILINEAR;
+	case V4L2_AV1_INTERPOLATION_FILTER_SWITCHABLE:
+		return HANTRO_AV1_SWITCHABLE;
+	}
+
+	return HANTRO_AV1_EIGHT_TAP_SMOOTH;
+}
+
+int hantro_av1_get_frame_index(struct hantro_ctx *ctx, int ref)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	u64 timestamp;
+	int i, idx = frame->ref_frame_idx[ref];
+
+	if (idx >= V4L2_AV1_TOTAL_REFS_PER_FRAME || idx < 0)
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
+int hantro_av1_get_order_hint(struct hantro_ctx *ctx, int ref)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	int idx = hantro_av1_get_frame_index(ctx, ref);
+
+	if (idx != AV1_INVALID_IDX)
+		return av1_dec->frame_refs[idx].order_hint;
+
+	return 0;
+}
+
+int hantro_av1_frame_ref(struct hantro_ctx *ctx, u64 timestamp)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	int i;
+
+	for (i = 0; i < AV1_MAX_FRAME_BUF_COUNT; i++) {
+		int j;
+
+		if (av1_dec->frame_refs[i].used)
+			continue;
+
+		av1_dec->frame_refs[i].width = frame->frame_width_minus_1 + 1;
+		av1_dec->frame_refs[i].height = frame->frame_height_minus_1 + 1;
+		av1_dec->frame_refs[i].mi_cols = DIV_ROUND_UP(frame->frame_width_minus_1 + 1, 8);
+		av1_dec->frame_refs[i].mi_rows = DIV_ROUND_UP(frame->frame_height_minus_1 + 1, 8);
+		av1_dec->frame_refs[i].timestamp = timestamp;
+		av1_dec->frame_refs[i].frame_type = frame->frame_type;
+		av1_dec->frame_refs[i].order_hint = frame->order_hint;
+		av1_dec->frame_refs[i].vb2_ref = hantro_get_dst_buf(ctx);
+
+		for (j = 0; j < V4L2_AV1_TOTAL_REFS_PER_FRAME; j++)
+			av1_dec->frame_refs[i].order_hints[j] = frame->order_hints[j];
+		av1_dec->frame_refs[i].used = true;
+		av1_dec->current_frame_index = i;
+
+		return i;
+	}
+
+	return AV1_INVALID_IDX;
+}
+
+static void hantro_av1_frame_unref(struct hantro_ctx *ctx, int idx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+
+	if (idx >= 0)
+		av1_dec->frame_refs[idx].used = false;
+}
+
+void hantro_av1_clean_refs(struct hantro_ctx *ctx)
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
+			hantro_av1_frame_unref(ctx, idx);
+	}
+}
+
+size_t hantro_av1_luma_size(struct hantro_ctx *ctx)
+{
+	return ctx->ref_fmt.plane_fmt[0].bytesperline * ctx->ref_fmt.height;
+}
+
+size_t hantro_av1_chroma_size(struct hantro_ctx *ctx)
+{
+	size_t cr_offset = hantro_av1_luma_size(ctx);
+
+	return ALIGN((cr_offset * 3) / 2, 64);
+}
+
+static void hantro_av1_tiles_free(struct hantro_ctx *ctx)
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
+static int hantro_av1_tiles_reallocate(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_av1_tile_info *tile_info = &ctrls->frame->tile_info;
+	unsigned int num_tile_cols = tile_info->tile_cols;
+	unsigned int height = ALIGN(ctrls->frame->frame_height_minus_1 + 1, 64);
+	unsigned int height_in_sb = height / 64;
+	unsigned int stripe_num = ((height + 8) + 63) / 64;
+	size_t size;
+
+	if (av1_dec->db_data_col.size >=
+	    ALIGN(height * 12 * ctx->bit_depth / 8, 128) * num_tile_cols)
+		return 0;
+
+	hantro_av1_tiles_free(ctx);
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
+	hantro_av1_tiles_free(ctx);
+	return -ENOMEM;
+}
+
+void hantro_av1_exit(struct hantro_ctx *ctx)
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
+	if (av1_dec->film_grain.cpu)
+		dma_free_coherent(vpu->dev, av1_dec->film_grain.size,
+				  av1_dec->film_grain.cpu,
+				  av1_dec->film_grain.dma);
+	av1_dec->film_grain.cpu = NULL;
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
+	hantro_av1_tiles_free(ctx);
+}
+
+int hantro_av1_init(struct hantro_ctx *ctx)
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
+	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_TILE_INFO_SIZE,
+						    &av1_dec->tile_info.dma,
+						    GFP_KERNEL);
+	if (!av1_dec->tile_info.cpu)
+		return -ENOMEM;
+	av1_dec->tile_info.size = AV1_TILE_INFO_SIZE;
+
+	av1_dec->film_grain.cpu = dma_alloc_coherent(vpu->dev,
+						     ALIGN(sizeof(struct hantro_av1_film_grain), 2048),
+						     &av1_dec->film_grain.dma,
+						     GFP_KERNEL);
+	if (!av1_dec->film_grain.cpu)
+		return -ENOMEM;
+	av1_dec->film_grain.size = ALIGN(sizeof(struct hantro_av1_film_grain), 2048);
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
+	hantro_av1_set_default_cdfs(av1_dec->cdfs, av1_dec->cdfs_ndvc);
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
+int hantro_av1_prepare_run(struct hantro_ctx *ctx)
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
+	return hantro_av1_tiles_reallocate(ctx);
+}
+
+static int hantro_av1_get_msb(u32 n)
+{
+	if (n == 0)
+		return 0;
+	return 31 ^ __builtin_clz(n);
+}
+
+static short hantro_av1_resolve_divisor_32(u32 d, short *shift)
+{
+	int f;
+	u64 e;
+
+	*shift = hantro_av1_get_msb(d);
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
+static void hantro_av1_get_shear_params(const u32 *params, s64 *alpha,
+					s64 *beta, s64 *gamma, s64 *delta)
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
+	y = hantro_av1_resolve_divisor_32(abs(mat[2]), &shift) * (mat[2] < 0 ? -1 : 1);
+
+	gv = ((long long)mat[4] * (1 << WARPEDMODEL_PREC_BITS)) * y;
+
+	*gamma = clamp_val((int)AV1_DIV_ROUND_UP_POW2_SIGNED(gv, shift), S16_MIN, S16_MAX);
+
+	dv = ((long long)mat[3] * mat[4]) * y;
+	*delta = clamp_val(mat[5] -
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
+void hantro_av1_set_global_model(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	const struct v4l2_av1_global_motion *gm = &frame->global_motion;
+	u8 *dst = av1_dec->global_model.cpu;
+	int ref_frame, i;
+
+	memset(dst, 0, GLOBAL_MODEL_SIZE);
+	for (ref_frame = 0; ref_frame < V4L2_AV1_REFS_PER_FRAME; ++ref_frame) {
+		s64 alpha = 0, beta = 0, gamma = 0, delta = 0;
+
+		for (i = 0; i < 6; ++i) {
+			if (i == 2)
+				*(s32 *)dst =
+					gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][3];
+			else if (i == 3)
+				*(s32 *)dst =
+					gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][2];
+			else
+				*(s32 *)dst =
+					gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][i];
+			dst += 4;
+		}
+
+		if (gm->type[V4L2_AV1_REF_LAST_FRAME + ref_frame] <= V4L2_AV1_WARP_MODEL_AFFINE)
+			hantro_av1_get_shear_params(&gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][0],
+						    &alpha, &beta, &gamma, &delta);
+
+		*(s16 *)dst = alpha;
+		dst += 2;
+		*(s16 *)dst = beta;
+		dst += 2;
+		*(s16 *)dst = gamma;
+		dst += 2;
+		*(s16 *)dst = delta;
+		dst += 2;
+	}
+}
+
+int hantro_av1_tile_log2(int target)
+{
+	int k;
+
+	/*
+	 * returns the smallest value for k such that 1 << k is greater
+	 * than or equal to target
+	 */
+	for (k = 0; (1 << k) < target; k++);
+
+	return k;
+}
+
+int hantro_av1_get_dist(struct hantro_ctx *ctx, int a, int b)
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
+void hantro_av1_set_frame_sign_bias(struct hantro_ctx *ctx)
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
+		if (hantro_av1_get_frame_index(ctx, i) >= 0) {
+			int rel_off =
+			    hantro_av1_get_dist(ctx,
+						hantro_av1_get_order_hint(ctx, i),
+						frame->order_hint);
+			av1_dec->ref_frame_sign_bias[i + 1] = (rel_off <= 0) ? 0 : 1;
+		}
+	}
+}
+
+void hantro_av1_init_scaling_function(const u8 *values, const u8 *scaling,
+				      u8 num_points, u8 *scaling_lut)
+{
+	int i, point;
+
+	if (num_points == 0) {
+		memset(scaling_lut, 0, 256);
+		return;
+	}
+
+	for (point = 0; point < num_points - 1; point++) {
+		int x;
+		s32 delta_y = scaling[point + 1] - scaling[point];
+		s32 delta_x = values[point + 1] - values[point];
+		s64 delta =
+		    delta_x ? delta_y * ((65536 + (delta_x >> 1)) /
+					 delta_x) : 0;
+
+		for (x = 0; x < delta_x; x++) {
+			scaling_lut[values[point] + x] =
+			    scaling[point] +
+			    (s32)((x * delta + 32768) >> 16);
+		}
+	}
+
+	for (i = values[num_points - 1]; i < 256; i++)
+		scaling_lut[i] = scaling[num_points - 1];
+}
+
+void hantro_av1_set_tile_info(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_av1_tile_info *tile_info = &ctrls->frame->tile_info;
+	const struct v4l2_ctrl_av1_tile_group_entry *group_entry =
+	    ctrls->tile_group_entry;
+	u8 *dst = av1_dec->tile_info.cpu;
+	int tile0, tile1;
+
+	memset(dst, 0, av1_dec->tile_info.size);
+
+	for (tile0 = 0; tile0 < tile_info->tile_cols; tile0++) {
+		for (tile1 = 0; tile1 < tile_info->tile_rows; tile1++) {
+			int tile_id = tile1 * tile_info->tile_cols + tile0;
+			u32 start, end;
+			u32 y0 =
+			    tile_info->height_in_sbs_minus_1[tile1] + 1;
+			u32 x0 = tile_info->width_in_sbs_minus_1[tile0] + 1;
+
+			/* tile size in SB units (width,height) */
+			*dst++ = x0;
+			*dst++ = 0;
+			*dst++ = 0;
+			*dst++ = 0;
+			*dst++ = y0;
+			*dst++ = 0;
+			*dst++ = 0;
+			*dst++ = 0;
+
+			/* tile start position */
+			start = group_entry[tile_id].tile_offset - group_entry[0].tile_offset;
+			*dst++ = start & 255;
+			*dst++ = (start >> 8) & 255;
+			*dst++ = (start >> 16) & 255;
+			*dst++ = (start >> 24) & 255;
+
+			/* number of bytes in tile data */
+			end = start + group_entry[tile_id].tile_size;
+			*dst++ = end & 255;
+			*dst++ = (end >> 8) & 255;
+			*dst++ = (end >> 16) & 255;
+			*dst++ = (end >> 24) & 255;
+		}
+	}
+}
+
+bool hantro_av1_is_lossless(struct hantro_ctx *ctx)
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
+		if (qindex ||
+		    quantization->delta_q_y_dc ||
+		    quantization->delta_q_u_dc ||
+		    quantization->delta_q_u_ac ||
+		    quantization->delta_q_v_dc ||
+		    quantization->delta_q_v_ac)
+			return false;
+	}
+
+	return true;
+}
+
+void hantro_av1_update_prob(struct hantro_ctx *ctx)
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
+		if (frame->refresh_frame_flags & BIT(i)) {
+			struct mvcdfs stored_mv_cdf;
+
+			hantro_av1_get_cdfs(ctx, i);
+			stored_mv_cdf = av1_dec->cdfs->mv_cdf;
+			*av1_dec->cdfs = *out_cdfs;
+			if (frame_is_intra) {
+				av1_dec->cdfs->mv_cdf = stored_mv_cdf;
+				*av1_dec->cdfs_ndvc = out_cdfs->mv_cdf;
+			}
+			hantro_av1_store_cdfs(ctx, frame->refresh_frame_flags);
+			break;
+		}
+	}
+}
+
+void hantro_av1_set_prob(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
+	const struct v4l2_av1_quantization *quantization = &frame->quantization;
+	bool error_resilient_mode =
+	    !!(frame->flags & V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE);
+	bool frame_is_intra = IS_INTRA(frame->frame_type);
+
+	if (error_resilient_mode || frame_is_intra ||
+	    frame->primary_ref_frame == AV1_PRIMARY_REF_NONE) {
+		av1_dec->cdfs = &av1_dec->default_cdfs;
+		av1_dec->cdfs_ndvc = &av1_dec->default_cdfs_ndvc;
+		hantro_av1_default_coeff_probs(quantization->base_q_idx,
+					       av1_dec->cdfs);
+	} else {
+		hantro_av1_get_cdfs(ctx, frame->ref_frame_idx[frame->primary_ref_frame]);
+	}
+	hantro_av1_store_cdfs(ctx, frame->refresh_frame_flags);
+
+	memcpy(av1_dec->prob_tbl.cpu, av1_dec->cdfs, sizeof(struct av1cdfs));
+
+	if (frame_is_intra) {
+		int mv_offset = offsetof(struct av1cdfs, mv_cdf);
+		/* Overwrite MV context area with intrabc MV context */
+		memcpy(av1_dec->prob_tbl.cpu + mv_offset, av1_dec->cdfs_ndvc,
+		       sizeof(struct mvcdfs));
+	}
+}
diff --git a/drivers/media/platform/verisilicon/hantro_av1.h b/drivers/media/platform/verisilicon/hantro_av1.h
new file mode 100644
index 000000000000..4e2122b95cdd
--- /dev/null
+++ b/drivers/media/platform/verisilicon/hantro_av1.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _HANTRO_AV1_H_
+#define _HANTRO_AV1_H_
+
+#define AV1_PRIMARY_REF_NONE	7
+#define AV1_REF_SCALE_SHIFT	14
+#define MAX_FRAME_DISTANCE	31
+#define AV1DEC_MAX_PIC_BUFFERS	24
+
+#define SCALE_NUMERATOR 8
+#define SUPERRES_SCALE_DENOMINATOR_MIN (SCALE_NUMERATOR + 1)
+
+#define RS_SCALE_SUBPEL_BITS 14
+#define RS_SCALE_SUBPEL_MASK ((1 << RS_SCALE_SUBPEL_BITS) - 1)
+#define RS_SUBPEL_BITS 6
+#define RS_SUBPEL_MASK ((1 << RS_SUBPEL_BITS) - 1)
+#define RS_SCALE_EXTRA_BITS (RS_SCALE_SUBPEL_BITS - RS_SUBPEL_BITS)
+#define RS_SCALE_EXTRA_OFF (1 << (RS_SCALE_EXTRA_BITS - 1))
+
+/*
+ * These 3 values aren't defined enum v4l2_av1_segment_feature because
+ * they are not part of the specification
+ */
+#define V4L2_AV1_SEG_LVL_ALT_LF_Y_H	2
+#define V4L2_AV1_SEG_LVL_ALT_LF_U	3
+#define V4L2_AV1_SEG_LVL_ALT_LF_V	4
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
+int hantro_av1_get_frame_index(struct hantro_ctx *ctx, int ref);
+int hantro_av1_get_order_hint(struct hantro_ctx *ctx, int ref);
+int hantro_av1_frame_ref(struct hantro_ctx *ctx, u64 timestamp);
+void hantro_av1_clean_refs(struct hantro_ctx *ctx);
+size_t hantro_av1_luma_size(struct hantro_ctx *ctx);
+size_t hantro_av1_chroma_size(struct hantro_ctx *ctx);
+void hantro_av1_exit(struct hantro_ctx *ctx);
+int hantro_av1_init(struct hantro_ctx *ctx);
+int hantro_av1_prepare_run(struct hantro_ctx *ctx);
+void hantro_av1_set_global_model(struct hantro_ctx *ctx);
+int hantro_av1_tile_log2(int target);
+int hantro_av1_get_dist(struct hantro_ctx *ctx, int a, int b);
+void hantro_av1_set_frame_sign_bias(struct hantro_ctx *ctx);
+void hantro_av1_init_scaling_function(const u8 *values, const u8 *scaling,
+				      u8 num_points, u8 *scaling_lut);
+void hantro_av1_set_tile_info(struct hantro_ctx *ctx);
+bool hantro_av1_is_lossless(struct hantro_ctx *ctx);
+void hantro_av1_update_prob(struct hantro_ctx *ctx);
+void hantro_av1_set_prob(struct hantro_ctx *ctx);
+
+int hantro_av1_get_hardware_mcomp_filt_type(int interpolation_filter);
+int hantro_av1_get_hardware_tx_mode(enum v4l2_av1_tx_mode tx_mode);
+
+#endif
diff --git a/drivers/media/platform/verisilicon/rockchip_av1_entropymode.c b/drivers/media/platform/verisilicon/hantro_av1_entropymode.c
similarity index 99%
rename from drivers/media/platform/verisilicon/rockchip_av1_entropymode.c
rename to drivers/media/platform/verisilicon/hantro_av1_entropymode.c
index b1ae72ad675e..4f7bfec73668 100644
--- a/drivers/media/platform/verisilicon/rockchip_av1_entropymode.c
+++ b/drivers/media/platform/verisilicon/hantro_av1_entropymode.c
@@ -11,7 +11,7 @@
  */
 
 #include "hantro.h"
-#include "rockchip_av1_entropymode.h"
+#include "hantro_av1_entropymode.h"
 
 #define AOM_ICDF ICDF
 #define AOM_CDF2(a0) AOM_ICDF(a0)
@@ -4195,7 +4195,7 @@ static const u16 default_bits_cdf[][10] = {
 	}
 };
 
-static int rockchip_av1_get_q_ctx(int q)
+static int hantro_av1_get_q_ctx(int q)
 {
 	if (q <= 20)
 		return 0;
@@ -4206,10 +4206,10 @@ static int rockchip_av1_get_q_ctx(int q)
 	return 3;
 }
 
-void rockchip_av1_default_coeff_probs(u32 base_qindex, void *ptr)
+void hantro_av1_default_coeff_probs(u32 base_qindex, void *ptr)
 {
 	struct av1cdfs *cdfs = (struct av1cdfs *)ptr;
-	const int index = rockchip_av1_get_q_ctx(base_qindex);
+	const int index = hantro_av1_get_q_ctx(base_qindex);
 
 	memcpy(cdfs->txb_skip_cdf, av1_default_txb_skip_cdfs[index],
 	       sizeof(av1_default_txb_skip_cdfs[0]));
@@ -4240,8 +4240,8 @@ void rockchip_av1_default_coeff_probs(u32 base_qindex, void *ptr)
 	       sizeof(av1_default_eob_multi1024_cdfs[0]));
 }
 
-void rockchip_av1_set_default_cdfs(struct av1cdfs *cdfs,
-				   struct mvcdfs *cdfs_ndvc)
+void hantro_av1_set_default_cdfs(struct av1cdfs *cdfs,
+				 struct mvcdfs *cdfs_ndvc)
 {
 	memcpy(cdfs->partition_cdf, default_partition_cdf,
 	       sizeof(cdfs->partition_cdf));
@@ -4398,7 +4398,7 @@ void rockchip_av1_set_default_cdfs(struct av1cdfs *cdfs,
 	       sizeof(cdfs->compound_idx_cdf));
 }
 
-void rockchip_av1_get_cdfs(struct hantro_ctx *ctx, u32 ref_idx)
+void hantro_av1_get_cdfs(struct hantro_ctx *ctx, u32 ref_idx)
 {
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 
@@ -4406,8 +4406,8 @@ void rockchip_av1_get_cdfs(struct hantro_ctx *ctx, u32 ref_idx)
 	av1_dec->cdfs_ndvc = &av1_dec->cdfs_last_ndvc[ref_idx];
 }
 
-void rockchip_av1_store_cdfs(struct hantro_ctx *ctx,
-			     u32 refresh_frame_flags)
+void hantro_av1_store_cdfs(struct hantro_ctx *ctx,
+			   u32 refresh_frame_flags)
 {
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 	int i;
diff --git a/drivers/media/platform/verisilicon/rockchip_av1_entropymode.h b/drivers/media/platform/verisilicon/hantro_av1_entropymode.h
similarity index 95%
rename from drivers/media/platform/verisilicon/rockchip_av1_entropymode.h
rename to drivers/media/platform/verisilicon/hantro_av1_entropymode.h
index bbf8424c7d2c..abbc660ecce3 100644
--- a/drivers/media/platform/verisilicon/rockchip_av1_entropymode.h
+++ b/drivers/media/platform/verisilicon/hantro_av1_entropymode.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef _ROCKCHIP_AV1_ENTROPYMODE_H_
-#define _ROCKCHIP_AV1_ENTROPYMODE_H_
+#ifndef _HANTRO_AV1_ENTROPYMODE_H_
+#define _HANTRO_AV1_ENTROPYMODE_H_
 
 #include <linux/types.h>
 
@@ -262,11 +262,11 @@ struct av1cdfs {
 	u16 dummy3[16];
 };
 
-void rockchip_av1_store_cdfs(struct hantro_ctx *ctx,
-			     u32 refresh_frame_flags);
-void rockchip_av1_get_cdfs(struct hantro_ctx *ctx, u32 ref_idx);
-void rockchip_av1_set_default_cdfs(struct av1cdfs *cdfs,
-				   struct mvcdfs *cdfs_ndvc);
-void rockchip_av1_default_coeff_probs(u32 base_qindex, void *ptr);
+void hantro_av1_store_cdfs(struct hantro_ctx *ctx,
+			   u32 refresh_frame_flags);
+void hantro_av1_get_cdfs(struct hantro_ctx *ctx, u32 ref_idx);
+void hantro_av1_set_default_cdfs(struct av1cdfs *cdfs,
+				 struct mvcdfs *cdfs_ndvc);
+void hantro_av1_default_coeff_probs(u32 base_qindex, void *ptr);
 
-#endif /* _ROCKCHIP_AV1_ENTROPYMODE_H_ */
+#endif /* _HANTRO_AV1_ENTROPYMODE_H_ */
diff --git a/drivers/media/platform/verisilicon/rockchip_av1_filmgrain.c b/drivers/media/platform/verisilicon/hantro_av1_filmgrain.c
similarity index 92%
rename from drivers/media/platform/verisilicon/rockchip_av1_filmgrain.c
rename to drivers/media/platform/verisilicon/hantro_av1_filmgrain.c
index f64dea797eff..06a21974e24e 100644
--- a/drivers/media/platform/verisilicon/rockchip_av1_filmgrain.c
+++ b/drivers/media/platform/verisilicon/hantro_av1_filmgrain.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR Apache-2.0
 
-#include "rockchip_av1_filmgrain.h"
+#include "hantro_av1_filmgrain.h"
 
 static const s32 gaussian_sequence[2048] = {
 	56, 568, -180, 172, 124, -84, 172, -64, -900, 24, 820,
@@ -204,8 +204,8 @@ static inline s32 round_power_of_two(const s32 val, s32 n)
 	return (val + a) >> n;
 }
 
-static void rockchip_av1_init_random_generator(u8 luma_num, u16 seed,
-					       u16 *random_register)
+static void hantro_av1_init_random_generator(u8 luma_num, u16 seed,
+					     u16 *random_register)
 {
 	u16 random_reg = seed;
 
@@ -214,7 +214,7 @@ static void rockchip_av1_init_random_generator(u8 luma_num, u16 seed,
 	*random_register = random_reg;
 }
 
-static inline void rockchip_av1_update_random_register(u16 *random_register)
+static inline void hantro_av1_update_random_register(u16 *random_register)
 {
 	u16 bit;
 	u16 random_reg = *random_register;
@@ -224,21 +224,21 @@ static inline void rockchip_av1_update_random_register(u16 *random_register)
 	*random_register = (random_reg >> 1) | (bit << 15);
 }
 
-static inline s32 rockchip_av1_get_random_number(u16 random_register)
+static inline s32 hantro_av1_get_random_number(u16 random_register)
 {
 	return (random_register >> 5) & ((1 << 11) - 1);
 }
 
-void rockchip_av1_generate_luma_grain_block(s32 (*luma_grain_block)[73][82],
-					    s32 bitdepth,
-					    u8 num_y_points,
-					    s32 grain_scale_shift,
-					    s32 ar_coeff_lag,
-					    s32 (*ar_coeffs_y)[24],
-					    s32 ar_coeff_shift,
-					    s32 grain_min,
-					    s32 grain_max,
-					    u16 random_seed)
+void hantro_av1_generate_luma_grain_block(s32 (*luma_grain_block)[73][82],
+					  s32 bitdepth,
+					  u8 num_y_points,
+					  s32 grain_scale_shift,
+					  s32 ar_coeff_lag,
+					  s32 (*ar_coeffs_y)[24],
+					  s32 ar_coeff_shift,
+					  s32 grain_min,
+					  s32 grain_max,
+					  u16 random_seed)
 {
 	s32 gauss_sec_shift = 12 - bitdepth + grain_scale_shift;
 	u16 grain_random_register = random_seed;
@@ -247,11 +247,11 @@ void rockchip_av1_generate_luma_grain_block(s32 (*luma_grain_block)[73][82],
 	for (i = 0; i < 73; i++) {
 		for (j = 0; j < 82; j++) {
 			if (num_y_points > 0) {
-				rockchip_av1_update_random_register
+				hantro_av1_update_random_register
 				    (&grain_random_register);
 				(*luma_grain_block)[i][j] =
 				    round_power_of_two(gaussian_sequence
-					     [rockchip_av1_get_random_number
+					     [hantro_av1_get_random_number
 					      (grain_random_register)],
 					     gauss_sec_shift);
 			} else {
@@ -285,37 +285,37 @@ void rockchip_av1_generate_luma_grain_block(s32 (*luma_grain_block)[73][82],
 }
 
 // Calculate chroma grain noise once per frame
-void rockchip_av1_generate_chroma_grain_block(s32 (*luma_grain_block)[73][82],
-					      s32 (*cb_grain_block)[38][44],
-					      s32 (*cr_grain_block)[38][44],
-					      s32 bitdepth,
-					      u8 num_y_points,
-					      u8 num_cb_points,
-					      u8 num_cr_points,
-					      s32 grain_scale_shift,
-					      s32 ar_coeff_lag,
-					      s32 (*ar_coeffs_cb)[25],
-					      s32 (*ar_coeffs_cr)[25],
-					      s32 ar_coeff_shift,
-					      s32 grain_min,
-					      s32 grain_max,
-					      u8 chroma_scaling_from_luma,
-					      u16 random_seed)
+void hantro_av1_generate_chroma_grain_block(s32 (*luma_grain_block)[73][82],
+					    s32 (*cb_grain_block)[38][44],
+					    s32 (*cr_grain_block)[38][44],
+					    s32 bitdepth,
+					    u8 num_y_points,
+					    u8 num_cb_points,
+					    u8 num_cr_points,
+					    s32 grain_scale_shift,
+					    s32 ar_coeff_lag,
+					    s32 (*ar_coeffs_cb)[25],
+					    s32 (*ar_coeffs_cr)[25],
+					    s32 ar_coeff_shift,
+					    s32 grain_min,
+					    s32 grain_max,
+					    u8 chroma_scaling_from_luma,
+					    u16 random_seed)
 {
 	s32 gauss_sec_shift = 12 - bitdepth + grain_scale_shift;
 	u16 grain_random_register = 0;
 	s32 i, j;
 
-	rockchip_av1_init_random_generator(7, random_seed,
-					   &grain_random_register);
+	hantro_av1_init_random_generator(7, random_seed,
+					 &grain_random_register);
 	for (i = 0; i < 38; i++) {
 		for (j = 0; j < 44; j++) {
 			if (num_cb_points || chroma_scaling_from_luma) {
-				rockchip_av1_update_random_register
+				hantro_av1_update_random_register
 				    (&grain_random_register);
 				(*cb_grain_block)[i][j] =
 				    round_power_of_two(gaussian_sequence
-					     [rockchip_av1_get_random_number
+					     [hantro_av1_get_random_number
 					      (grain_random_register)],
 					     gauss_sec_shift);
 			} else {
@@ -324,16 +324,16 @@ void rockchip_av1_generate_chroma_grain_block(s32 (*luma_grain_block)[73][82],
 		}
 	}
 
-	rockchip_av1_init_random_generator(11, random_seed,
-					   &grain_random_register);
+	hantro_av1_init_random_generator(11, random_seed,
+					 &grain_random_register);
 	for (i = 0; i < 38; i++) {
 		for (j = 0; j < 44; j++) {
 			if (num_cr_points || chroma_scaling_from_luma) {
-				rockchip_av1_update_random_register
+				hantro_av1_update_random_register
 				    (&grain_random_register);
 				(*cr_grain_block)[i][j] =
 				    round_power_of_two(gaussian_sequence
-					     [rockchip_av1_get_random_number
+					     [hantro_av1_get_random_number
 					      (grain_random_register)],
 					     gauss_sec_shift);
 			} else {
diff --git a/drivers/media/platform/verisilicon/hantro_av1_filmgrain.h b/drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
new file mode 100644
index 000000000000..5593e84114d0
--- /dev/null
+++ b/drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _HANTRO_AV1_FILMGRAIN_H_
+#define _HANTRO_AV1_FILMGRAIN_H_
+
+#include <linux/types.h>
+
+struct hantro_av1_film_grain {
+	u8 scaling_lut_y[256];
+	u8 scaling_lut_cb[256];
+	u8 scaling_lut_cr[256];
+	s16 cropped_luma_grain_block[4096];
+	s16 cropped_chroma_grain_block[1024 * 2];
+};
+
+void hantro_av1_generate_luma_grain_block(s32 (*luma_grain_block)[73][82],
+					  s32 bitdepth,
+					  u8 num_y_points,
+					  s32 grain_scale_shift,
+					  s32 ar_coeff_lag,
+					  s32 (*ar_coeffs_y)[24],
+					  s32 ar_coeff_shift,
+					  s32 grain_min,
+					  s32 grain_max,
+					  u16 random_seed);
+
+void hantro_av1_generate_chroma_grain_block(s32 (*luma_grain_block)[73][82],
+					    s32 (*cb_grain_block)[38][44],
+					    s32 (*cr_grain_block)[38][44],
+					    s32 bitdepth,
+					    u8 num_y_points,
+					    u8 num_cb_points,
+					    u8 num_cr_points,
+					    s32 grain_scale_shift,
+					    s32 ar_coeff_lag,
+					    s32 (*ar_coeffs_cb)[25],
+					    s32 (*ar_coeffs_cr)[25],
+					    s32 ar_coeff_shift,
+					    s32 grain_min,
+					    s32 grain_max,
+					    u8 chroma_scaling_from_luma,
+					    u16 random_seed);
+
+#endif
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 5f2011529f02..d1d39d1df5d2 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -15,8 +15,8 @@
 #include <media/v4l2-vp9.h>
 #include <media/videobuf2-core.h>
 
-#include "rockchip_av1_entropymode.h"
-#include "rockchip_av1_filmgrain.h"
+#include "hantro_av1_entropymode.h"
+#include "hantro_av1_filmgrain.h"
 
 #define DEC_8190_ALIGN_MASK	0x07U
 
@@ -459,10 +459,7 @@ void hantro_hevc_ref_init(struct hantro_ctx *ctx);
 dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, s32 poc);
 int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc, dma_addr_t addr);
 
-int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx);
-void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx);
 int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx);
-void rockchip_vpu981_av1_dec_done(struct hantro_ctx *ctx);
 
 static inline unsigned short hantro_vp9_num_sbs(unsigned short dimension)
 {
diff --git a/drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h b/drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h
deleted file mode 100644
index 31a8b7920c31..000000000000
--- a/drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#ifndef _ROCKCHIP_AV1_FILMGRAIN_H_
-#define _ROCKCHIP_AV1_FILMGRAIN_H_
-
-#include <linux/types.h>
-
-void rockchip_av1_generate_luma_grain_block(s32 (*luma_grain_block)[73][82],
-					    s32 bitdepth,
-					    u8 num_y_points,
-					    s32 grain_scale_shift,
-					    s32 ar_coeff_lag,
-					    s32 (*ar_coeffs_y)[24],
-					    s32 ar_coeff_shift,
-					    s32 grain_min,
-					    s32 grain_max,
-					    u16 random_seed);
-
-void rockchip_av1_generate_chroma_grain_block(s32 (*luma_grain_block)[73][82],
-					      s32 (*cb_grain_block)[38][44],
-					      s32 (*cr_grain_block)[38][44],
-					      s32 bitdepth,
-					      u8 num_y_points,
-					      u8 num_cb_points,
-					      u8 num_cr_points,
-					      s32 grain_scale_shift,
-					      s32 ar_coeff_lag,
-					      s32 (*ar_coeffs_cb)[25],
-					      s32 (*ar_coeffs_cr)[25],
-					      s32 ar_coeff_shift,
-					      s32 grain_min,
-					      s32 grain_max,
-					      u8 chroma_scaling_from_luma,
-					      u16 random_seed);
-
-#endif
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e4e21ad37323..990a5e6b5531 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -7,622 +7,35 @@
 
 #include <media/v4l2-mem2mem.h>
 #include "hantro.h"
+#include "hantro_av1.h"
 #include "hantro_v4l2.h"
 #include "rockchip_vpu981_regs.h"
 
 #define AV1_DEC_MODE		17
-#define GM_GLOBAL_MODELS_PER_FRAME	7
-#define GLOBAL_MODEL_TOTAL_SIZE	(6 * 4 + 4 * 2)
-#define GLOBAL_MODEL_SIZE	ALIGN(GM_GLOBAL_MODELS_PER_FRAME * GLOBAL_MODEL_TOTAL_SIZE, 2048)
-#define AV1_MAX_TILES		128
-#define AV1_TILE_INFO_SIZE	(AV1_MAX_TILES * 16)
-#define AV1DEC_MAX_PIC_BUFFERS	24
-#define AV1_REF_SCALE_SHIFT	14
-#define AV1_INVALID_IDX		-1
-#define MAX_FRAME_DISTANCE	31
-#define AV1_PRIMARY_REF_NONE	7
-#define AV1_TILE_SIZE		ALIGN(32 * 128, 4096)
-/*
- * These 3 values aren't defined enum v4l2_av1_segment_feature because
- * they are not part of the specification
- */
-#define V4L2_AV1_SEG_LVL_ALT_LF_Y_H	2
-#define V4L2_AV1_SEG_LVL_ALT_LF_U	3
-#define V4L2_AV1_SEG_LVL_ALT_LF_V	4
-
-#define SUPERRES_SCALE_BITS 3
-#define SCALE_NUMERATOR 8
-#define SUPERRES_SCALE_DENOMINATOR_MIN (SCALE_NUMERATOR + 1)
-
-#define RS_SUBPEL_BITS 6
-#define RS_SUBPEL_MASK ((1 << RS_SUBPEL_BITS) - 1)
-#define RS_SCALE_SUBPEL_BITS 14
-#define RS_SCALE_SUBPEL_MASK ((1 << RS_SCALE_SUBPEL_BITS) - 1)
-#define RS_SCALE_EXTRA_BITS (RS_SCALE_SUBPEL_BITS - RS_SUBPEL_BITS)
-#define RS_SCALE_EXTRA_OFF (1 << (RS_SCALE_EXTRA_BITS - 1))
-
-#define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
-
-#define LST_BUF_IDX (V4L2_AV1_REF_LAST_FRAME - V4L2_AV1_REF_LAST_FRAME)
-#define LST2_BUF_IDX (V4L2_AV1_REF_LAST2_FRAME - V4L2_AV1_REF_LAST_FRAME)
-#define LST3_BUF_IDX (V4L2_AV1_REF_LAST3_FRAME - V4L2_AV1_REF_LAST_FRAME)
-#define GLD_BUF_IDX (V4L2_AV1_REF_GOLDEN_FRAME - V4L2_AV1_REF_LAST_FRAME)
-#define BWD_BUF_IDX (V4L2_AV1_REF_BWDREF_FRAME - V4L2_AV1_REF_LAST_FRAME)
-#define ALT2_BUF_IDX (V4L2_AV1_REF_ALTREF2_FRAME - V4L2_AV1_REF_LAST_FRAME)
-#define ALT_BUF_IDX (V4L2_AV1_REF_ALTREF_FRAME - V4L2_AV1_REF_LAST_FRAME)
-
-#define DIV_LUT_PREC_BITS 14
-#define DIV_LUT_BITS 8
-#define DIV_LUT_NUM BIT(DIV_LUT_BITS)
-#define WARP_PARAM_REDUCE_BITS 6
-#define WARPEDMODEL_PREC_BITS 16
-
-#define AV1_DIV_ROUND_UP_POW2(value, n)			\
-({							\
-	typeof(n) _n  = n;				\
-	typeof(value) _value = value;			\
-	(_value + (BIT(_n) >> 1)) >> _n;		\
-})
-
-#define AV1_DIV_ROUND_UP_POW2_SIGNED(value, n)				\
-({									\
-	typeof(n) _n_  = n;						\
-	typeof(value) _value_ = value;					\
-	(((_value_) < 0) ? -AV1_DIV_ROUND_UP_POW2(-(_value_), (_n_))	\
-		: AV1_DIV_ROUND_UP_POW2((_value_), (_n_)));		\
-})
-
-enum rockchip_av1_tx_mode {
-	ROCKCHIP_AV1_TX_MODE_ONLY_4X4	= 0,
-	ROCKCHIP_AV1_TX_MODE_8X8	= 1,
-	ROCKCHIP_AV1_TX_MODE_16x16	= 2,
-	ROCKCHIP_AV1_TX_MODE_32x32	= 3,
-	ROCKCHIP_AV1_TX_MODE_SELECT	= 4,
-};
-
-struct rockchip_av1_film_grain {
-	u8 scaling_lut_y[256];
-	u8 scaling_lut_cb[256];
-	u8 scaling_lut_cr[256];
-	s16 cropped_luma_grain_block[4096];
-	s16 cropped_chroma_grain_block[1024 * 2];
-};
-
-static const short div_lut[DIV_LUT_NUM + 1] = {
-	16384, 16320, 16257, 16194, 16132, 16070, 16009, 15948, 15888, 15828, 15768,
-	15709, 15650, 15592, 15534, 15477, 15420, 15364, 15308, 15252, 15197, 15142,
-	15087, 15033, 14980, 14926, 14873, 14821, 14769, 14717, 14665, 14614, 14564,
-	14513, 14463, 14413, 14364, 14315, 14266, 14218, 14170, 14122, 14075, 14028,
-	13981, 13935, 13888, 13843, 13797, 13752, 13707, 13662, 13618, 13574, 13530,
-	13487, 13443, 13400, 13358, 13315, 13273, 13231, 13190, 13148, 13107, 13066,
-	13026, 12985, 12945, 12906, 12866, 12827, 12788, 12749, 12710, 12672, 12633,
-	12596, 12558, 12520, 12483, 12446, 12409, 12373, 12336, 12300, 12264, 12228,
-	12193, 12157, 12122, 12087, 12053, 12018, 11984, 11950, 11916, 11882, 11848,
-	11815, 11782, 11749, 11716, 11683, 11651, 11619, 11586, 11555, 11523, 11491,
-	11460, 11429, 11398, 11367, 11336, 11305, 11275, 11245, 11215, 11185, 11155,
-	11125, 11096, 11067, 11038, 11009, 10980, 10951, 10923, 10894, 10866, 10838,
-	10810, 10782, 10755, 10727, 10700, 10673, 10645, 10618, 10592, 10565, 10538,
-	10512, 10486, 10460, 10434, 10408, 10382, 10356, 10331, 10305, 10280, 10255,
-	10230, 10205, 10180, 10156, 10131, 10107, 10082, 10058, 10034, 10010, 9986,
-	9963,  9939,  9916,  9892,  9869,  9846,  9823,  9800,  9777,  9754,  9732,
-	9709,  9687,  9664,  9642,  9620,  9598,  9576,  9554,  9533,  9511,  9489,
-	9468,  9447,  9425,  9404,  9383,  9362,  9341,  9321,  9300,  9279,  9259,
-	9239,  9218,  9198,  9178,  9158,  9138,  9118,  9098,  9079,  9059,  9039,
-	9020,  9001,  8981,  8962,  8943,  8924,  8905,  8886,  8867,  8849,  8830,
-	8812,  8793,  8775,  8756,  8738,  8720,  8702,  8684,  8666,  8648,  8630,
-	8613,  8595,  8577,  8560,  8542,  8525,  8508,  8490,  8473,  8456,  8439,
-	8422,  8405,  8389,  8372,  8355,  8339,  8322,  8306,  8289,  8273,  8257,
-	8240,  8224,  8208,  8192,
-};
-
-static int rockchip_vpu981_get_frame_index(struct hantro_ctx *ctx, int ref)
-{
-	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
-	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
-	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
-	u64 timestamp;
-	int i, idx = frame->ref_frame_idx[ref];
-
-	if (idx >= V4L2_AV1_TOTAL_REFS_PER_FRAME || idx < 0)
-		return AV1_INVALID_IDX;
-
-	timestamp = frame->reference_frame_ts[idx];
-	for (i = 0; i < AV1_MAX_FRAME_BUF_COUNT; i++) {
-		if (!av1_dec->frame_refs[i].used)
-			continue;
-		if (av1_dec->frame_refs[i].timestamp == timestamp)
-			return i;
-	}
-
-	return AV1_INVALID_IDX;
-}
-
-static int rockchip_vpu981_get_order_hint(struct hantro_ctx *ctx, int ref)
-{
-	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
-	int idx = rockchip_vpu981_get_frame_index(ctx, ref);
-
-	if (idx != AV1_INVALID_IDX)
-		return av1_dec->frame_refs[idx].order_hint;
-
-	return 0;
-}
-
-static int rockchip_vpu981_av1_dec_frame_ref(struct hantro_ctx *ctx,
-					     u64 timestamp)
-{
-	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
-	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
-	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
-	int i;
-
-	for (i = 0; i < AV1_MAX_FRAME_BUF_COUNT; i++) {
-		int j;
-
-		if (av1_dec->frame_refs[i].used)
-			continue;
-
-		av1_dec->frame_refs[i].width = frame->frame_width_minus_1 + 1;
-		av1_dec->frame_refs[i].height = frame->frame_height_minus_1 + 1;
-		av1_dec->frame_refs[i].mi_cols = DIV_ROUND_UP(frame->frame_width_minus_1 + 1, 8);
-		av1_dec->frame_refs[i].mi_rows = DIV_ROUND_UP(frame->frame_height_minus_1 + 1, 8);
-		av1_dec->frame_refs[i].timestamp = timestamp;
-		av1_dec->frame_refs[i].frame_type = frame->frame_type;
-		av1_dec->frame_refs[i].order_hint = frame->order_hint;
-		av1_dec->frame_refs[i].vb2_ref = hantro_get_dst_buf(ctx);
-
-		for (j = 0; j < V4L2_AV1_TOTAL_REFS_PER_FRAME; j++)
-			av1_dec->frame_refs[i].order_hints[j] = frame->order_hints[j];
-		av1_dec->frame_refs[i].used = true;
-		av1_dec->current_frame_index = i;
-
-		return i;
-	}
-
-	return AV1_INVALID_IDX;
-}
-
-static void rockchip_vpu981_av1_dec_frame_unref(struct hantro_ctx *ctx, int idx)
-{
-	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
-
-	if (idx >= 0)
-		av1_dec->frame_refs[idx].used = false;
-}
-
-static void rockchip_vpu981_av1_dec_clean_refs(struct hantro_ctx *ctx)
-{
-	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
-	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
-
-	int ref, idx;
-
-	for (idx = 0; idx < AV1_MAX_FRAME_BUF_COUNT; idx++) {
-		u64 timestamp = av1_dec->frame_refs[idx].timestamp;
-		bool used = false;
-
-		if (!av1_dec->frame_refs[idx].used)
-			continue;
-
-		for (ref = 0; ref < V4L2_AV1_TOTAL_REFS_PER_FRAME; ref++) {
-			if (ctrls->frame->reference_frame_ts[ref] == timestamp)
-				used = true;
-		}
-
-		if (!used)
-			rockchip_vpu981_av1_dec_frame_unref(ctx, idx);
-	}
-}
-
-static size_t rockchip_vpu981_av1_dec_luma_size(struct hantro_ctx *ctx)
-{
-	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
-}
-
-static size_t rockchip_vpu981_av1_dec_chroma_size(struct hantro_ctx *ctx)
-{
-	size_t cr_offset = rockchip_vpu981_av1_dec_luma_size(ctx);
-
-	return ALIGN((cr_offset * 3) / 2, 64);
-}
-
-static void rockchip_vpu981_av1_dec_tiles_free(struct hantro_ctx *ctx)
-{
-	struct hantro_dev *vpu = ctx->dev;
-	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
-
-	if (av1_dec->db_data_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->db_data_col.size,
-				  av1_dec->db_data_col.cpu,
-				  av1_dec->db_data_col.dma);
-	av1_dec->db_data_col.cpu = NULL;
-
-	if (av1_dec->db_ctrl_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->db_ctrl_col.size,
-				  av1_dec->db_ctrl_col.cpu,
-				  av1_dec->db_ctrl_col.dma);
-	av1_dec->db_ctrl_col.cpu = NULL;
-
-	if (av1_dec->cdef_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->cdef_col.size,
-				  av1_dec->cdef_col.cpu, av1_dec->cdef_col.dma);
-	av1_dec->cdef_col.cpu = NULL;
-
-	if (av1_dec->sr_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->sr_col.size,
-				  av1_dec->sr_col.cpu, av1_dec->sr_col.dma);
-	av1_dec->sr_col.cpu = NULL;
-
-	if (av1_dec->lr_col.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->lr_col.size,
-				  av1_dec->lr_col.cpu, av1_dec->lr_col.dma);
-	av1_dec->lr_col.cpu = NULL;
-}
-
-static int rockchip_vpu981_av1_dec_tiles_reallocate(struct hantro_ctx *ctx)
-{
-	struct hantro_dev *vpu = ctx->dev;
-	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
-	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
-	const struct v4l2_av1_tile_info *tile_info = &ctrls->frame->tile_info;
-	unsigned int num_tile_cols = tile_info->tile_cols;
-	unsigned int height = ALIGN(ctrls->frame->frame_height_minus_1 + 1, 64);
-	unsigned int height_in_sb = height / 64;
-	unsigned int stripe_num = ((height + 8) + 63) / 64;
-	size_t size;
-
-	if (av1_dec->db_data_col.size >=
-	    ALIGN(height * 12 * ctx->bit_depth / 8, 128) * num_tile_cols)
-		return 0;
-
-	rockchip_vpu981_av1_dec_tiles_free(ctx);
-
-	size = ALIGN(height * 12 * ctx->bit_depth / 8, 128) * num_tile_cols;
-	av1_dec->db_data_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						      &av1_dec->db_data_col.dma,
-						      GFP_KERNEL);
-	if (!av1_dec->db_data_col.cpu)
-		goto buffer_allocation_error;
-	av1_dec->db_data_col.size = size;
-
-	size = ALIGN(height * 2 * 16 / 4, 128) * num_tile_cols;
-	av1_dec->db_ctrl_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						      &av1_dec->db_ctrl_col.dma,
-						      GFP_KERNEL);
-	if (!av1_dec->db_ctrl_col.cpu)
-		goto buffer_allocation_error;
-	av1_dec->db_ctrl_col.size = size;
-
-	size = ALIGN(height_in_sb * 44 * ctx->bit_depth * 16 / 8, 128) * num_tile_cols;
-	av1_dec->cdef_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						   &av1_dec->cdef_col.dma,
-						   GFP_KERNEL);
-	if (!av1_dec->cdef_col.cpu)
-		goto buffer_allocation_error;
-	av1_dec->cdef_col.size = size;
-
-	size = ALIGN(height_in_sb * (3040 + 1280), 128) * num_tile_cols;
-	av1_dec->sr_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						 &av1_dec->sr_col.dma,
-						 GFP_KERNEL);
-	if (!av1_dec->sr_col.cpu)
-		goto buffer_allocation_error;
-	av1_dec->sr_col.size = size;
-
-	size = ALIGN(stripe_num * 1536 * ctx->bit_depth / 8, 128) * num_tile_cols;
-	av1_dec->lr_col.cpu = dma_alloc_coherent(vpu->dev, size,
-						 &av1_dec->lr_col.dma,
-						 GFP_KERNEL);
-	if (!av1_dec->lr_col.cpu)
-		goto buffer_allocation_error;
-	av1_dec->lr_col.size = size;
-
-	av1_dec->num_tile_cols_allocated = num_tile_cols;
-	return 0;
-
-buffer_allocation_error:
-	rockchip_vpu981_av1_dec_tiles_free(ctx);
-	return -ENOMEM;
-}
-
-void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx)
-{
-	struct hantro_dev *vpu = ctx->dev;
-	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
-
-	if (av1_dec->global_model.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->global_model.size,
-				  av1_dec->global_model.cpu,
-				  av1_dec->global_model.dma);
-	av1_dec->global_model.cpu = NULL;
-
-	if (av1_dec->tile_info.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->tile_info.size,
-				  av1_dec->tile_info.cpu,
-				  av1_dec->tile_info.dma);
-	av1_dec->tile_info.cpu = NULL;
-
-	if (av1_dec->film_grain.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->film_grain.size,
-				  av1_dec->film_grain.cpu,
-				  av1_dec->film_grain.dma);
-	av1_dec->film_grain.cpu = NULL;
-
-	if (av1_dec->prob_tbl.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->prob_tbl.size,
-				  av1_dec->prob_tbl.cpu, av1_dec->prob_tbl.dma);
-	av1_dec->prob_tbl.cpu = NULL;
-
-	if (av1_dec->prob_tbl_out.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->prob_tbl_out.size,
-				  av1_dec->prob_tbl_out.cpu,
-				  av1_dec->prob_tbl_out.dma);
-	av1_dec->prob_tbl_out.cpu = NULL;
-
-	if (av1_dec->tile_buf.cpu)
-		dma_free_coherent(vpu->dev, av1_dec->tile_buf.size,
-				  av1_dec->tile_buf.cpu, av1_dec->tile_buf.dma);
-	av1_dec->tile_buf.cpu = NULL;
-
-	rockchip_vpu981_av1_dec_tiles_free(ctx);
-}
-
-int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
-{
-	struct hantro_dev *vpu = ctx->dev;
-	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
-
-	memset(av1_dec, 0, sizeof(*av1_dec));
-
-	av1_dec->global_model.cpu = dma_alloc_coherent(vpu->dev, GLOBAL_MODEL_SIZE,
-						       &av1_dec->global_model.dma,
-						       GFP_KERNEL);
-	if (!av1_dec->global_model.cpu)
-		return -ENOMEM;
-	av1_dec->global_model.size = GLOBAL_MODEL_SIZE;
-
-	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_TILE_INFO_SIZE,
-						    &av1_dec->tile_info.dma,
-						    GFP_KERNEL);
-	if (!av1_dec->tile_info.cpu)
-		return -ENOMEM;
-	av1_dec->tile_info.size = AV1_TILE_INFO_SIZE;
-
-	av1_dec->film_grain.cpu = dma_alloc_coherent(vpu->dev,
-						     ALIGN(sizeof(struct rockchip_av1_film_grain), 2048),
-						     &av1_dec->film_grain.dma,
-						     GFP_KERNEL);
-	if (!av1_dec->film_grain.cpu)
-		return -ENOMEM;
-	av1_dec->film_grain.size = ALIGN(sizeof(struct rockchip_av1_film_grain), 2048);
-
-	av1_dec->prob_tbl.cpu = dma_alloc_coherent(vpu->dev,
-						   ALIGN(sizeof(struct av1cdfs), 2048),
-						   &av1_dec->prob_tbl.dma,
-						   GFP_KERNEL);
-	if (!av1_dec->prob_tbl.cpu)
-		return -ENOMEM;
-	av1_dec->prob_tbl.size = ALIGN(sizeof(struct av1cdfs), 2048);
-
-	av1_dec->prob_tbl_out.cpu = dma_alloc_coherent(vpu->dev,
-						       ALIGN(sizeof(struct av1cdfs), 2048),
-						       &av1_dec->prob_tbl_out.dma,
-						       GFP_KERNEL);
-	if (!av1_dec->prob_tbl_out.cpu)
-		return -ENOMEM;
-	av1_dec->prob_tbl_out.size = ALIGN(sizeof(struct av1cdfs), 2048);
-	av1_dec->cdfs = &av1_dec->default_cdfs;
-	av1_dec->cdfs_ndvc = &av1_dec->default_cdfs_ndvc;
-
-	rockchip_av1_set_default_cdfs(av1_dec->cdfs, av1_dec->cdfs_ndvc);
-
-	av1_dec->tile_buf.cpu = dma_alloc_coherent(vpu->dev,
-						   AV1_TILE_SIZE,
-						   &av1_dec->tile_buf.dma,
-						   GFP_KERNEL);
-	if (!av1_dec->tile_buf.cpu)
-		return -ENOMEM;
-	av1_dec->tile_buf.size = AV1_TILE_SIZE;
-
-	return 0;
-}
-
-static int rockchip_vpu981_av1_dec_prepare_run(struct hantro_ctx *ctx)
-{
-	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
-	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
-
-	ctrls->sequence = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_SEQUENCE);
-	if (WARN_ON(!ctrls->sequence))
-		return -EINVAL;
-
-	ctrls->tile_group_entry =
-	    hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY);
-	if (WARN_ON(!ctrls->tile_group_entry))
-		return -EINVAL;
-
-	ctrls->frame = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_FRAME);
-	if (WARN_ON(!ctrls->frame))
-		return -EINVAL;
-
-	ctrls->film_grain =
-	    hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_FILM_GRAIN);
-
-	return rockchip_vpu981_av1_dec_tiles_reallocate(ctx);
-}
-
-static inline int rockchip_vpu981_av1_dec_get_msb(u32 n)
-{
-	if (n == 0)
-		return 0;
-	return 31 ^ __builtin_clz(n);
-}
-
-static short rockchip_vpu981_av1_dec_resolve_divisor_32(u32 d, short *shift)
-{
-	int f;
-	u64 e;
-
-	*shift = rockchip_vpu981_av1_dec_get_msb(d);
-	/* e is obtained from D after resetting the most significant 1 bit. */
-	e = d - ((u32)1 << *shift);
-	/* Get the most significant DIV_LUT_BITS (8) bits of e into f */
-	if (*shift > DIV_LUT_BITS)
-		f = AV1_DIV_ROUND_UP_POW2(e, *shift - DIV_LUT_BITS);
-	else
-		f = e << (DIV_LUT_BITS - *shift);
-	if (f > DIV_LUT_NUM)
-		return -1;
-	*shift += DIV_LUT_PREC_BITS;
-	/* Use f as lookup into the precomputed table of multipliers */
-	return div_lut[f];
-}
-
-static void
-rockchip_vpu981_av1_dec_get_shear_params(const u32 *params, s64 *alpha,
-					 s64 *beta, s64 *gamma, s64 *delta)
-{
-	const int *mat = params;
-	short shift;
-	short y;
-	long long gv, dv;
-
-	if (mat[2] <= 0)
-		return;
-
-	*alpha = clamp_val(mat[2] - (1 << WARPEDMODEL_PREC_BITS), S16_MIN, S16_MAX);
-	*beta = clamp_val(mat[3], S16_MIN, S16_MAX);
-
-	y = rockchip_vpu981_av1_dec_resolve_divisor_32(abs(mat[2]), &shift) * (mat[2] < 0 ? -1 : 1);
-
-	gv = ((long long)mat[4] * (1 << WARPEDMODEL_PREC_BITS)) * y;
-
-	*gamma = clamp_val((int)AV1_DIV_ROUND_UP_POW2_SIGNED(gv, shift), S16_MIN, S16_MAX);
-
-	dv = ((long long)mat[3] * mat[4]) * y;
-	*delta = clamp_val(mat[5] -
-		(int)AV1_DIV_ROUND_UP_POW2_SIGNED(dv, shift) - (1 << WARPEDMODEL_PREC_BITS),
-		S16_MIN, S16_MAX);
-
-	*alpha = AV1_DIV_ROUND_UP_POW2_SIGNED(*alpha, WARP_PARAM_REDUCE_BITS)
-		 * (1 << WARP_PARAM_REDUCE_BITS);
-	*beta = AV1_DIV_ROUND_UP_POW2_SIGNED(*beta, WARP_PARAM_REDUCE_BITS)
-		* (1 << WARP_PARAM_REDUCE_BITS);
-	*gamma = AV1_DIV_ROUND_UP_POW2_SIGNED(*gamma, WARP_PARAM_REDUCE_BITS)
-		 * (1 << WARP_PARAM_REDUCE_BITS);
-	*delta = AV1_DIV_ROUND_UP_POW2_SIGNED(*delta, WARP_PARAM_REDUCE_BITS)
-		* (1 << WARP_PARAM_REDUCE_BITS);
-}
 
 static void rockchip_vpu981_av1_dec_set_global_model(struct hantro_ctx *ctx)
 {
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
-	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
-	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
-	const struct v4l2_av1_global_motion *gm = &frame->global_motion;
-	u8 *dst = av1_dec->global_model.cpu;
 	struct hantro_dev *vpu = ctx->dev;
-	int ref_frame, i;
-
-	memset(dst, 0, GLOBAL_MODEL_SIZE);
-	for (ref_frame = 0; ref_frame < V4L2_AV1_REFS_PER_FRAME; ++ref_frame) {
-		s64 alpha = 0, beta = 0, gamma = 0, delta = 0;
-
-		for (i = 0; i < 6; ++i) {
-			if (i == 2)
-				*(s32 *)dst =
-					gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][3];
-			else if (i == 3)
-				*(s32 *)dst =
-					gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][2];
-			else
-				*(s32 *)dst =
-					gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][i];
-			dst += 4;
-		}
-
-		if (gm->type[V4L2_AV1_REF_LAST_FRAME + ref_frame] <= V4L2_AV1_WARP_MODEL_AFFINE)
-			rockchip_vpu981_av1_dec_get_shear_params(&gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][0],
-								 &alpha, &beta, &gamma, &delta);
-
-		*(s16 *)dst = alpha;
-		dst += 2;
-		*(s16 *)dst = beta;
-		dst += 2;
-		*(s16 *)dst = gamma;
-		dst += 2;
-		*(s16 *)dst = delta;
-		dst += 2;
-	}
 
+	hantro_av1_set_global_model(ctx);
 	hantro_write_addr(vpu, AV1_GLOBAL_MODEL, av1_dec->global_model.dma);
 }
 
-static int rockchip_vpu981_av1_tile_log2(int target)
-{
-	int k;
-
-	/*
-	 * returns the smallest value for k such that 1 << k is greater
-	 * than or equal to target
-	 */
-	for (k = 0; (1 << k) < target; k++);
-
-	return k;
-}
-
 static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
 {
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
 	const struct v4l2_av1_tile_info *tile_info = &ctrls->frame->tile_info;
-	const struct v4l2_ctrl_av1_tile_group_entry *group_entry =
-	    ctrls->tile_group_entry;
 	int context_update_y =
 	    tile_info->context_update_tile_id / tile_info->tile_cols;
 	int context_update_x =
 	    tile_info->context_update_tile_id % tile_info->tile_cols;
 	int context_update_tile_id =
 	    context_update_x * tile_info->tile_rows + context_update_y;
-	u8 *dst = av1_dec->tile_info.cpu;
 	struct hantro_dev *vpu = ctx->dev;
-	int tile0, tile1;
-
-	memset(dst, 0, av1_dec->tile_info.size);
-
-	for (tile0 = 0; tile0 < tile_info->tile_cols; tile0++) {
-		for (tile1 = 0; tile1 < tile_info->tile_rows; tile1++) {
-			int tile_id = tile1 * tile_info->tile_cols + tile0;
-			u32 start, end;
-			u32 y0 =
-			    tile_info->height_in_sbs_minus_1[tile1] + 1;
-			u32 x0 = tile_info->width_in_sbs_minus_1[tile0] + 1;
-
-			/* tile size in SB units (width,height) */
-			*dst++ = x0;
-			*dst++ = 0;
-			*dst++ = 0;
-			*dst++ = 0;
-			*dst++ = y0;
-			*dst++ = 0;
-			*dst++ = 0;
-			*dst++ = 0;
-
-			/* tile start position */
-			start = group_entry[tile_id].tile_offset - group_entry[0].tile_offset;
-			*dst++ = start & 255;
-			*dst++ = (start >> 8) & 255;
-			*dst++ = (start >> 16) & 255;
-			*dst++ = (start >> 24) & 255;
-
-			/* number of bytes in tile data */
-			end = start + group_entry[tile_id].tile_size;
-			*dst++ = end & 255;
-			*dst++ = (end >> 8) & 255;
-			*dst++ = (end >> 16) & 255;
-			*dst++ = (end >> 24) & 255;
-		}
-	}
+
+	hantro_av1_set_tile_info(ctx);
 
 	hantro_reg_write(vpu, &av1_multicore_expect_context_update, !!(context_update_x == 0));
 	hantro_reg_write(vpu, &av1_tile_enable,
@@ -631,8 +44,8 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
 	hantro_reg_write(vpu, &av1_num_tile_rows_8k, tile_info->tile_rows);
 	hantro_reg_write(vpu, &av1_context_update_tile_id, context_update_tile_id);
 	hantro_reg_write(vpu, &av1_tile_transpose, 1);
-	if (rockchip_vpu981_av1_tile_log2(tile_info->tile_cols) ||
-	    rockchip_vpu981_av1_tile_log2(tile_info->tile_rows))
+	if (hantro_av1_tile_log2(tile_info->tile_cols) ||
+	    hantro_av1_tile_log2(tile_info->tile_rows))
 		hantro_reg_write(vpu, &av1_dec_tile_size_mag, tile_info->tile_size_bytes - 1);
 	else
 		hantro_reg_write(vpu, &av1_dec_tile_size_mag, 3);
@@ -640,50 +53,6 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
 	hantro_write_addr(vpu, AV1_TILE_BASE, av1_dec->tile_info.dma);
 }
 
-static int rockchip_vpu981_av1_dec_get_dist(struct hantro_ctx *ctx,
-					    int a, int b)
-{
-	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
-	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
-	int bits = ctrls->sequence->order_hint_bits - 1;
-	int diff, m;
-
-	if (!ctrls->sequence->order_hint_bits)
-		return 0;
-
-	diff = a - b;
-	m = 1 << bits;
-	diff = (diff & (m - 1)) - (diff & m);
-
-	return diff;
-}
-
-static void rockchip_vpu981_av1_dec_set_frame_sign_bias(struct hantro_ctx *ctx)
-{
-	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
-	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
-	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
-	const struct v4l2_ctrl_av1_sequence *sequence = ctrls->sequence;
-	int i;
-
-	if (!sequence->order_hint_bits || IS_INTRA(frame->frame_type)) {
-		for (i = 0; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++)
-			av1_dec->ref_frame_sign_bias[i] = 0;
-
-		return;
-	}
-	// Identify the nearest forward and backward references.
-	for (i = 0; i < V4L2_AV1_TOTAL_REFS_PER_FRAME - 1; i++) {
-		if (rockchip_vpu981_get_frame_index(ctx, i) >= 0) {
-			int rel_off =
-			    rockchip_vpu981_av1_dec_get_dist(ctx,
-							     rockchip_vpu981_get_order_hint(ctx, i),
-							     frame->order_hint);
-			av1_dec->ref_frame_sign_bias[i + 1] = (rel_off <= 0) ? 0 : 1;
-		}
-	}
-}
-
 static bool
 rockchip_vpu981_av1_dec_set_ref(struct hantro_ctx *ctx, int ref, int idx,
 				int width, int height)
@@ -806,12 +175,12 @@ static void rockchip_vpu981_av1_dec_set_segmentation(struct hantro_ctx *ctx)
 
 	if (!!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED) &&
 	    frame->primary_ref_frame < V4L2_AV1_REFS_PER_FRAME) {
-		int idx = rockchip_vpu981_get_frame_index(ctx, frame->primary_ref_frame);
+		int idx = hantro_av1_get_frame_index(ctx, frame->primary_ref_frame);
 
 		if (idx >= 0) {
 			dma_addr_t luma_addr, mv_addr = 0;
 			struct hantro_decoded_buffer *seg;
-			size_t mv_offset = rockchip_vpu981_av1_dec_chroma_size(ctx);
+			size_t mv_offset = hantro_av1_chroma_size(ctx);
 
 			seg = vb2_to_hantro_decoded_buf(&av1_dec->frame_refs[idx].vb2_ref->vb2_buf);
 			luma_addr = hantro_get_dec_buf_addr(ctx, &seg->base.vb.vb2_buf);
@@ -1041,35 +410,6 @@ static void rockchip_vpu981_av1_dec_set_segmentation(struct hantro_ctx *ctx)
 			 segval[7][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
 }
 
-static bool rockchip_vpu981_av1_dec_is_lossless(struct hantro_ctx *ctx)
-{
-	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
-	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
-	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
-	const struct v4l2_av1_segmentation *segmentation = &frame->segmentation;
-	const struct v4l2_av1_quantization *quantization = &frame->quantization;
-	int i;
-
-	for (i = 0; i < V4L2_AV1_MAX_SEGMENTS; i++) {
-		int qindex = quantization->base_q_idx;
-
-		if (segmentation->feature_enabled[i] &
-		    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_Q)) {
-			qindex += segmentation->feature_data[i][V4L2_AV1_SEG_LVL_ALT_Q];
-		}
-		qindex = clamp(qindex, 0, 255);
-
-		if (qindex ||
-		    quantization->delta_q_y_dc ||
-		    quantization->delta_q_u_dc ||
-		    quantization->delta_q_u_ac ||
-		    quantization->delta_q_v_dc ||
-		    quantization->delta_q_v_ac)
-			return false;
-	}
-	return true;
-}
-
 static void rockchip_vpu981_av1_dec_set_loopfilter(struct hantro_ctx *ctx)
 {
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
@@ -1089,7 +429,7 @@ static void rockchip_vpu981_av1_dec_set_loopfilter(struct hantro_ctx *ctx)
 	hantro_reg_write(vpu, &av1_filt_level3, loop_filter->level[3]);
 
 	if (loop_filter->flags & V4L2_AV1_LOOP_FILTER_FLAG_DELTA_ENABLED &&
-	    !rockchip_vpu981_av1_dec_is_lossless(ctx) &&
+	    !hantro_av1_is_lossless(ctx) &&
 	    !(frame->flags & V4L2_AV1_FRAME_FLAG_ALLOW_INTRABC)) {
 		hantro_reg_write(vpu, &av1_filt_ref_adj_0,
 				 loop_filter->ref_deltas[0]);
@@ -1128,112 +468,23 @@ static void rockchip_vpu981_av1_dec_set_loopfilter(struct hantro_ctx *ctx)
 	hantro_write_addr(vpu, AV1_DB_CTRL_COL, av1_dec->db_ctrl_col.dma);
 }
 
-static void rockchip_vpu981_av1_dec_update_prob(struct hantro_ctx *ctx)
-{
-	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
-	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
-	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
-	bool frame_is_intra = IS_INTRA(frame->frame_type);
-	struct av1cdfs *out_cdfs = (struct av1cdfs *)av1_dec->prob_tbl_out.cpu;
-	int i;
-
-	if (frame->flags & V4L2_AV1_FRAME_FLAG_DISABLE_FRAME_END_UPDATE_CDF)
-		return;
-
-	for (i = 0; i < NUM_REF_FRAMES; i++) {
-		if (frame->refresh_frame_flags & BIT(i)) {
-			struct mvcdfs stored_mv_cdf;
-
-			rockchip_av1_get_cdfs(ctx, i);
-			stored_mv_cdf = av1_dec->cdfs->mv_cdf;
-			*av1_dec->cdfs = *out_cdfs;
-			if (frame_is_intra) {
-				av1_dec->cdfs->mv_cdf = stored_mv_cdf;
-				*av1_dec->cdfs_ndvc = out_cdfs->mv_cdf;
-			}
-			rockchip_av1_store_cdfs(ctx,
-						frame->refresh_frame_flags);
-			break;
-		}
-	}
-}
-
-void rockchip_vpu981_av1_dec_done(struct hantro_ctx *ctx)
-{
-	rockchip_vpu981_av1_dec_update_prob(ctx);
-}
-
 static void rockchip_vpu981_av1_dec_set_prob(struct hantro_ctx *ctx)
 {
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
-	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
-	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
-	const struct v4l2_av1_quantization *quantization = &frame->quantization;
 	struct hantro_dev *vpu = ctx->dev;
-	bool error_resilient_mode =
-	    !!(frame->flags & V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE);
-	bool frame_is_intra = IS_INTRA(frame->frame_type);
-
-	if (error_resilient_mode || frame_is_intra ||
-	    frame->primary_ref_frame == AV1_PRIMARY_REF_NONE) {
-		av1_dec->cdfs = &av1_dec->default_cdfs;
-		av1_dec->cdfs_ndvc = &av1_dec->default_cdfs_ndvc;
-		rockchip_av1_default_coeff_probs(quantization->base_q_idx,
-						 av1_dec->cdfs);
-	} else {
-		rockchip_av1_get_cdfs(ctx, frame->ref_frame_idx[frame->primary_ref_frame]);
-	}
-	rockchip_av1_store_cdfs(ctx, frame->refresh_frame_flags);
-
-	memcpy(av1_dec->prob_tbl.cpu, av1_dec->cdfs, sizeof(struct av1cdfs));
-
-	if (frame_is_intra) {
-		int mv_offset = offsetof(struct av1cdfs, mv_cdf);
-		/* Overwrite MV context area with intrabc MV context */
-		memcpy(av1_dec->prob_tbl.cpu + mv_offset, av1_dec->cdfs_ndvc,
-		       sizeof(struct mvcdfs));
-	}
 
+	hantro_av1_set_prob(ctx);
 	hantro_write_addr(vpu, AV1_PROP_TABLE_OUT, av1_dec->prob_tbl_out.dma);
 	hantro_write_addr(vpu, AV1_PROP_TABLE, av1_dec->prob_tbl.dma);
 }
 
-static void
-rockchip_vpu981_av1_dec_init_scaling_function(const u8 *values, const u8 *scaling,
-					      u8 num_points, u8 *scaling_lut)
-{
-	int i, point;
-
-	if (num_points == 0) {
-		memset(scaling_lut, 0, 256);
-		return;
-	}
-
-	for (point = 0; point < num_points - 1; point++) {
-		int x;
-		s32 delta_y = scaling[point + 1] - scaling[point];
-		s32 delta_x = values[point + 1] - values[point];
-		s64 delta =
-		    delta_x ? delta_y * ((65536 + (delta_x >> 1)) /
-					 delta_x) : 0;
-
-		for (x = 0; x < delta_x; x++) {
-			scaling_lut[values[point] + x] =
-			    scaling[point] +
-			    (s32)((x * delta + 32768) >> 16);
-		}
-	}
-
-	for (i = values[num_points - 1]; i < 256; i++)
-		scaling_lut[i] = scaling[num_points - 1];
-}
 
 static void rockchip_vpu981_av1_dec_set_fgs(struct hantro_ctx *ctx)
 {
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
 	const struct v4l2_ctrl_av1_film_grain *film_grain = ctrls->film_grain;
-	struct rockchip_av1_film_grain *fgmem = av1_dec->film_grain.cpu;
+	struct hantro_av1_film_grain *fgmem = av1_dec->film_grain.cpu;
 	struct hantro_dev *vpu = ctx->dev;
 	bool scaling_from_luma =
 		!!(film_grain->flags & V4L2_AV1_FILM_GRAIN_FLAG_CHROMA_SCALING_FROM_LUMA);
@@ -1316,10 +567,10 @@ static void rockchip_vpu981_av1_dec_set_fgs(struct hantro_ctx *ctx)
 	hantro_reg_write(vpu, &av1_chroma_scaling_from_luma, scaling_from_luma);
 	hantro_reg_write(vpu, &av1_random_seed, film_grain->grain_seed);
 
-	rockchip_vpu981_av1_dec_init_scaling_function(film_grain->point_y_value,
-						      film_grain->point_y_scaling,
-						      film_grain->num_y_points,
-						      fgmem->scaling_lut_y);
+	hantro_av1_init_scaling_function(film_grain->point_y_value,
+					 film_grain->point_y_scaling,
+					 film_grain->num_y_points,
+					 fgmem->scaling_lut_y);
 
 	if (film_grain->flags &
 	    V4L2_AV1_FILM_GRAIN_FLAG_CHROMA_SCALING_FROM_LUMA) {
@@ -1328,10 +579,10 @@ static void rockchip_vpu981_av1_dec_set_fgs(struct hantro_ctx *ctx)
 		memcpy(fgmem->scaling_lut_cr, fgmem->scaling_lut_y,
 		       sizeof(*fgmem->scaling_lut_y) * 256);
 	} else {
-		rockchip_vpu981_av1_dec_init_scaling_function
+		hantro_av1_init_scaling_function
 		    (film_grain->point_cb_value, film_grain->point_cb_scaling,
 		     film_grain->num_cb_points, fgmem->scaling_lut_cb);
-		rockchip_vpu981_av1_dec_init_scaling_function
+		hantro_av1_init_scaling_function
 		    (film_grain->point_cr_value, film_grain->point_cr_scaling,
 		     film_grain->num_cr_points, fgmem->scaling_lut_cr);
 	}
@@ -1351,21 +602,21 @@ static void rockchip_vpu981_av1_dec_set_fgs(struct hantro_ctx *ctx)
 	grain_min = 0 - grain_center;
 	grain_max = (256 << (bitdepth - 8)) - 1 - grain_center;
 
-	rockchip_av1_generate_luma_grain_block(luma_grain_block, bitdepth,
-					       film_grain->num_y_points, grain_scale_shift,
-					       ar_coeff_lag, ar_coeffs_y, ar_coeff_shift,
-					       grain_min, grain_max, film_grain->grain_seed);
-
-	rockchip_av1_generate_chroma_grain_block(luma_grain_block, cb_grain_block,
-						 cr_grain_block, bitdepth,
-						 film_grain->num_y_points,
-						 film_grain->num_cb_points,
-						 film_grain->num_cr_points,
-						 grain_scale_shift, ar_coeff_lag, ar_coeffs_cb,
-						 ar_coeffs_cr, ar_coeff_shift, grain_min,
-						 grain_max,
-						 scaling_from_luma,
-						 film_grain->grain_seed);
+	hantro_av1_generate_luma_grain_block(luma_grain_block, bitdepth,
+					     film_grain->num_y_points, grain_scale_shift,
+					     ar_coeff_lag, ar_coeffs_y, ar_coeff_shift,
+					     grain_min, grain_max, film_grain->grain_seed);
+
+	hantro_av1_generate_chroma_grain_block(luma_grain_block, cb_grain_block,
+					       cr_grain_block, bitdepth,
+					       film_grain->num_y_points,
+					       film_grain->num_cb_points,
+					       film_grain->num_cr_points,
+					       grain_scale_shift, ar_coeff_lag, ar_coeffs_cb,
+					       ar_coeffs_cr, ar_coeff_shift, grain_min,
+					       grain_max,
+					       scaling_from_luma,
+					       film_grain->grain_seed);
 
 	for (i = 0; i < 64; i++) {
 		for (j = 0; j < 64; j++)
@@ -1617,12 +868,12 @@ static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
 	int ref_ind = 0;
 	int rf, idx;
 
-	alt_frame_offset = rockchip_vpu981_get_order_hint(ctx, ALT_BUF_IDX);
-	gld_frame_offset = rockchip_vpu981_get_order_hint(ctx, GLD_BUF_IDX);
-	bwd_frame_offset = rockchip_vpu981_get_order_hint(ctx, BWD_BUF_IDX);
-	alt2_frame_offset = rockchip_vpu981_get_order_hint(ctx, ALT2_BUF_IDX);
+	alt_frame_offset = hantro_av1_get_order_hint(ctx, ALT_BUF_IDX);
+	gld_frame_offset = hantro_av1_get_order_hint(ctx, GLD_BUF_IDX);
+	bwd_frame_offset = hantro_av1_get_order_hint(ctx, BWD_BUF_IDX);
+	alt2_frame_offset = hantro_av1_get_order_hint(ctx, ALT2_BUF_IDX);
 
-	idx = rockchip_vpu981_get_frame_index(ctx, LST_BUF_IDX);
+	idx = hantro_av1_get_frame_index(ctx, LST_BUF_IDX);
 	if (idx >= 0) {
 		int alt_frame_offset_in_lst =
 			av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_ALTREF_FRAME];
@@ -1644,8 +895,8 @@ static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
 		ref_stamp--;
 	}
 
-	idx = rockchip_vpu981_get_frame_index(ctx, BWD_BUF_IDX);
-	if (rockchip_vpu981_av1_dec_get_dist(ctx, bwd_frame_offset, cur_frame_offset) > 0) {
+	idx = hantro_av1_get_frame_index(ctx, BWD_BUF_IDX);
+	if (hantro_av1_get_dist(ctx, bwd_frame_offset, cur_frame_offset) > 0) {
 		int bwd_mi_cols = av1_dec->frame_refs[idx].mi_cols;
 		int bwd_mi_rows = av1_dec->frame_refs[idx].mi_rows;
 		bool bwd_intra_only =
@@ -1659,8 +910,8 @@ static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
 		}
 	}
 
-	idx = rockchip_vpu981_get_frame_index(ctx, ALT2_BUF_IDX);
-	if (rockchip_vpu981_av1_dec_get_dist(ctx, alt2_frame_offset, cur_frame_offset) > 0) {
+	idx = hantro_av1_get_frame_index(ctx, ALT2_BUF_IDX);
+	if (hantro_av1_get_dist(ctx, alt2_frame_offset, cur_frame_offset) > 0) {
 		int alt2_mi_cols = av1_dec->frame_refs[idx].mi_cols;
 		int alt2_mi_rows = av1_dec->frame_refs[idx].mi_rows;
 		bool alt2_intra_only =
@@ -1674,8 +925,8 @@ static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
 		}
 	}
 
-	idx = rockchip_vpu981_get_frame_index(ctx, ALT_BUF_IDX);
-	if (rockchip_vpu981_av1_dec_get_dist(ctx, alt_frame_offset, cur_frame_offset) > 0 &&
+	idx = hantro_av1_get_frame_index(ctx, ALT_BUF_IDX);
+	if (hantro_av1_get_dist(ctx, alt_frame_offset, cur_frame_offset) > 0 &&
 	    ref_stamp >= 0) {
 		int alt_mi_cols = av1_dec->frame_refs[idx].mi_cols;
 		int alt_mi_rows = av1_dec->frame_refs[idx].mi_rows;
@@ -1690,7 +941,7 @@ static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
 		}
 	}
 
-	idx = rockchip_vpu981_get_frame_index(ctx, LST2_BUF_IDX);
+	idx = hantro_av1_get_frame_index(ctx, LST2_BUF_IDX);
 	if (idx >= 0 && ref_stamp >= 0) {
 		int lst2_mi_cols = av1_dec->frame_refs[idx].mi_cols;
 		int lst2_mi_rows = av1_dec->frame_refs[idx].mi_rows;
@@ -1706,14 +957,14 @@ static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
 	}
 
 	for (rf = 0; rf < V4L2_AV1_TOTAL_REFS_PER_FRAME - 1; ++rf) {
-		idx = rockchip_vpu981_get_frame_index(ctx, rf);
+		idx = hantro_av1_get_frame_index(ctx, rf);
 		if (idx >= 0) {
-			int rf_order_hint = rockchip_vpu981_get_order_hint(ctx, rf);
+			int rf_order_hint = hantro_av1_get_order_hint(ctx, rf);
 
 			cur_offset[rf] =
-			    rockchip_vpu981_av1_dec_get_dist(ctx, cur_frame_offset, rf_order_hint);
+			    hantro_av1_get_dist(ctx, cur_frame_offset, rf_order_hint);
 			cur_roffset[rf] =
-			    rockchip_vpu981_av1_dec_get_dist(ctx, rf_order_hint, cur_frame_offset);
+			    hantro_av1_get_dist(ctx, rf_order_hint, cur_frame_offset);
 		} else {
 			cur_offset[rf] = 0;
 			cur_roffset[rf] = 0;
@@ -1736,32 +987,32 @@ static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
 	if (use_ref_frame_mvs && ref_ind > 0 &&
 	    cur_offset[mf_types[0] - V4L2_AV1_REF_LAST_FRAME] <= MAX_FRAME_DISTANCE &&
 	    cur_offset[mf_types[0] - V4L2_AV1_REF_LAST_FRAME] >= -MAX_FRAME_DISTANCE) {
-		int rf = rockchip_vpu981_get_order_hint(ctx, refs_selected[0]);
-		int idx = rockchip_vpu981_get_frame_index(ctx, refs_selected[0]);
+		int rf = hantro_av1_get_order_hint(ctx, refs_selected[0]);
+		int idx = hantro_av1_get_frame_index(ctx, refs_selected[0]);
 		u32 *oh = av1_dec->frame_refs[idx].order_hints;
 		int val;
 
 		hantro_reg_write(vpu, &av1_use_temporal0_mvs, 1);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST_FRAME]);
 		hantro_reg_write(vpu, &av1_mf1_last_offset, val);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST2_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST2_FRAME]);
 		hantro_reg_write(vpu, &av1_mf1_last2_offset, val);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST3_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST3_FRAME]);
 		hantro_reg_write(vpu, &av1_mf1_last3_offset, val);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_GOLDEN_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_GOLDEN_FRAME]);
 		hantro_reg_write(vpu, &av1_mf1_golden_offset, val);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_BWDREF_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_BWDREF_FRAME]);
 		hantro_reg_write(vpu, &av1_mf1_bwdref_offset, val);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF2_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF2_FRAME]);
 		hantro_reg_write(vpu, &av1_mf1_altref2_offset, val);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF_FRAME]);
 		hantro_reg_write(vpu, &av1_mf1_altref_offset, val);
 	}
 
@@ -1776,32 +1027,32 @@ static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
 	if (use_ref_frame_mvs && ref_ind > 1 &&
 	    cur_offset[mf_types[1] - V4L2_AV1_REF_LAST_FRAME] <= MAX_FRAME_DISTANCE &&
 	    cur_offset[mf_types[1] - V4L2_AV1_REF_LAST_FRAME] >= -MAX_FRAME_DISTANCE) {
-		int rf = rockchip_vpu981_get_order_hint(ctx, refs_selected[1]);
-		int idx = rockchip_vpu981_get_frame_index(ctx, refs_selected[1]);
+		int rf = hantro_av1_get_order_hint(ctx, refs_selected[1]);
+		int idx = hantro_av1_get_frame_index(ctx, refs_selected[1]);
 		u32 *oh = av1_dec->frame_refs[idx].order_hints;
 		int val;
 
 		hantro_reg_write(vpu, &av1_use_temporal1_mvs, 1);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST_FRAME]);
 		hantro_reg_write(vpu, &av1_mf2_last_offset, val);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST2_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST2_FRAME]);
 		hantro_reg_write(vpu, &av1_mf2_last2_offset, val);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST3_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST3_FRAME]);
 		hantro_reg_write(vpu, &av1_mf2_last3_offset, val);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_GOLDEN_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_GOLDEN_FRAME]);
 		hantro_reg_write(vpu, &av1_mf2_golden_offset, val);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_BWDREF_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_BWDREF_FRAME]);
 		hantro_reg_write(vpu, &av1_mf2_bwdref_offset, val);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF2_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF2_FRAME]);
 		hantro_reg_write(vpu, &av1_mf2_altref2_offset, val);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF_FRAME]);
 		hantro_reg_write(vpu, &av1_mf2_altref_offset, val);
 	}
 
@@ -1816,32 +1067,32 @@ static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
 	if (use_ref_frame_mvs && ref_ind > 2 &&
 	    cur_offset[mf_types[2] - V4L2_AV1_REF_LAST_FRAME] <= MAX_FRAME_DISTANCE &&
 	    cur_offset[mf_types[2] - V4L2_AV1_REF_LAST_FRAME] >= -MAX_FRAME_DISTANCE) {
-		int rf = rockchip_vpu981_get_order_hint(ctx, refs_selected[2]);
-		int idx = rockchip_vpu981_get_frame_index(ctx, refs_selected[2]);
+		int rf = hantro_av1_get_order_hint(ctx, refs_selected[2]);
+		int idx = hantro_av1_get_frame_index(ctx, refs_selected[2]);
 		u32 *oh = av1_dec->frame_refs[idx].order_hints;
 		int val;
 
 		hantro_reg_write(vpu, &av1_use_temporal2_mvs, 1);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST_FRAME]);
 		hantro_reg_write(vpu, &av1_mf3_last_offset, val);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST2_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST2_FRAME]);
 		hantro_reg_write(vpu, &av1_mf3_last2_offset, val);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST3_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST3_FRAME]);
 		hantro_reg_write(vpu, &av1_mf3_last3_offset, val);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_GOLDEN_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_GOLDEN_FRAME]);
 		hantro_reg_write(vpu, &av1_mf3_golden_offset, val);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_BWDREF_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_BWDREF_FRAME]);
 		hantro_reg_write(vpu, &av1_mf3_bwdref_offset, val);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF2_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF2_FRAME]);
 		hantro_reg_write(vpu, &av1_mf3_altref2_offset, val);
 
-		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF_FRAME]);
+		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF_FRAME]);
 		hantro_reg_write(vpu, &av1_mf3_altref_offset, val);
 	}
 
@@ -1883,7 +1134,7 @@ static void rockchip_vpu981_av1_dec_set_reference_frames(struct hantro_ctx *ctx)
 
 	if (!allow_intrabc) {
 		for (i = 0; i < V4L2_AV1_REFS_PER_FRAME; i++) {
-			int idx = rockchip_vpu981_get_frame_index(ctx, i);
+			int idx = hantro_av1_get_frame_index(ctx, i);
 
 			if (idx >= 0)
 				ref_count[idx]++;
@@ -1898,7 +1149,7 @@ static void rockchip_vpu981_av1_dec_set_reference_frames(struct hantro_ctx *ctx)
 	}
 	hantro_reg_write(vpu, &av1_ref_frames, ref_frames);
 
-	rockchip_vpu981_av1_dec_set_frame_sign_bias(ctx);
+	hantro_av1_set_frame_sign_bias(ctx);
 
 	for (i = V4L2_AV1_REF_LAST_FRAME; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++) {
 		u32 ref = i - 1;
@@ -1910,8 +1161,8 @@ static void rockchip_vpu981_av1_dec_set_reference_frames(struct hantro_ctx *ctx)
 			width = frame->frame_width_minus_1 + 1;
 			height = frame->frame_height_minus_1 + 1;
 		} else {
-			if (rockchip_vpu981_get_frame_index(ctx, ref) > 0)
-				idx = rockchip_vpu981_get_frame_index(ctx, ref);
+			if (hantro_av1_get_frame_index(ctx, ref) > 0)
+				idx = hantro_av1_get_frame_index(ctx, ref);
 			width = av1_dec->frame_refs[idx].width;
 			height = av1_dec->frame_refs[idx].height;
 		}
@@ -1943,20 +1194,6 @@ static void rockchip_vpu981_av1_dec_set_reference_frames(struct hantro_ctx *ctx)
 	rockchip_vpu981_av1_dec_set_other_frames(ctx);
 }
 
-static int rockchip_vpu981_av1_get_hardware_tx_mode(enum v4l2_av1_tx_mode tx_mode)
-{
-	switch (tx_mode) {
-	case V4L2_AV1_TX_MODE_ONLY_4X4:
-		return ROCKCHIP_AV1_TX_MODE_ONLY_4X4;
-	case V4L2_AV1_TX_MODE_LARGEST:
-		return ROCKCHIP_AV1_TX_MODE_32x32;
-	case V4L2_AV1_TX_MODE_SELECT:
-		return ROCKCHIP_AV1_TX_MODE_SELECT;
-	}
-
-	return ROCKCHIP_AV1_TX_MODE_32x32;
-}
-
 static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
@@ -2029,7 +1266,7 @@ static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
 	hantro_reg_write(vpu, &av1_comp_pred_mode,
 			 (ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_REFERENCE_SELECT) ? 2 : 0);
 
-	tx_mode = rockchip_vpu981_av1_get_hardware_tx_mode(ctrls->frame->tx_mode);
+	tx_mode = hantro_av1_get_hardware_tx_mode(ctrls->frame->tx_mode);
 	hantro_reg_write(vpu, &av1_transform_mode, tx_mode);
 	hantro_reg_write(vpu, &av1_max_cb_size,
 			 (ctrls->sequence->flags
@@ -2061,7 +1298,7 @@ static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
 		hantro_reg_write(vpu, &av1_qmlevel_v, 0xff);
 	}
 
-	hantro_reg_write(vpu, &av1_lossless_e, rockchip_vpu981_av1_dec_is_lossless(ctx));
+	hantro_reg_write(vpu, &av1_lossless_e, hantro_av1_is_lossless(ctx));
 	hantro_reg_write(vpu, &av1_quant_delta_v_dc, ctrls->frame->quantization.delta_q_v_dc);
 	hantro_reg_write(vpu, &av1_quant_delta_v_ac, ctrls->frame->quantization.delta_q_v_ac);
 
@@ -2109,8 +1346,8 @@ rockchip_vpu981_av1_dec_set_output_buffer(struct hantro_ctx *ctx)
 	struct hantro_decoded_buffer *dst;
 	struct vb2_v4l2_buffer *vb2_dst;
 	dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
-	size_t cr_offset = rockchip_vpu981_av1_dec_luma_size(ctx);
-	size_t mv_offset = rockchip_vpu981_av1_dec_chroma_size(ctx);
+	size_t cr_offset = hantro_av1_luma_size(ctx);
+	size_t mv_offset = hantro_av1_chroma_size(ctx);
 
 	vb2_dst = av1_dec->frame_refs[av1_dec->current_frame_index].vb2_ref;
 	dst = vb2_to_hantro_decoded_buf(&vb2_dst->vb2_buf);
@@ -2134,7 +1371,7 @@ int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
 
 	hantro_start_prepare_run(ctx);
 
-	ret = rockchip_vpu981_av1_dec_prepare_run(ctx);
+	ret = hantro_av1_prepare_run(ctx);
 	if (ret)
 		goto prepare_error;
 
@@ -2144,8 +1381,8 @@ int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
 		goto prepare_error;
 	}
 
-	rockchip_vpu981_av1_dec_clean_refs(ctx);
-	rockchip_vpu981_av1_dec_frame_ref(ctx, vb2_src->vb2_buf.timestamp);
+	hantro_av1_clean_refs(ctx);
+	hantro_av1_frame_ref(ctx, vb2_src->vb2_buf.timestamp);
 
 	rockchip_vpu981_av1_dec_set_parameters(ctx);
 	rockchip_vpu981_av1_dec_set_global_model(ctx);
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 02673be9878e..f50a3e38097e 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 
 #include "hantro.h"
+#include "hantro_av1.h"
 #include "hantro_jpeg.h"
 #include "hantro_g1_regs.h"
 #include "hantro_h1_regs.h"
@@ -608,9 +609,9 @@ static const struct hantro_codec_ops rk3568_vepu_codec_ops[] = {
 static const struct hantro_codec_ops rk3588_vpu981_codec_ops[] = {
 	[HANTRO_MODE_AV1_DEC] = {
 		.run = rockchip_vpu981_av1_dec_run,
-		.init = rockchip_vpu981_av1_dec_init,
-		.exit = rockchip_vpu981_av1_dec_exit,
-		.done = rockchip_vpu981_av1_dec_done,
+		.init = hantro_av1_init,
+		.exit = hantro_av1_exit,
+		.done = hantro_av1_update_prob,
 	},
 };
 /*
-- 
2.43.0


