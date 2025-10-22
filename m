Return-Path: <linux-media+bounces-45315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E47CBFDB34
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 19:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BF7D3AA4A8
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 17:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3768D2DC770;
	Wed, 22 Oct 2025 17:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Oh9RfBYh"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF66134B697;
	Wed, 22 Oct 2025 17:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761155157; cv=none; b=qFrfRwf2TzdOthVFyv0aBHTs/yqnwb8J/H50mYhqR3bpqcWGul9SYsxxAF9nqSad9oJQaoyIxeAQ/x4xVUM8B/6LULR4nAOWAVV+hQL4jZ863mp0FjRorLJm6T1AVb6L5QDh8EpSdnPvil4yzBSrvZkC8vPNBXT7tb/NNMYUylQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761155157; c=relaxed/simple;
	bh=KcUtQpTjceRQb92EgPDjZ/AQiUMhFwBADYecoGiPUM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qcvSmmaz8ueT5wRpWfoQsODBv2MsiGJgF4Z95r9OiaGLsEEgANEXFOMjhczKilKndKM/xsAQ0362fQpz0MhNo/yt5wO4euj+FCcsZ0AkK1jmYOVM+AVIBRuXwKVhWU8z8FTee3fEbbWbIZk97s8FtV8SeDdtD/lERCBtFZY6epc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Oh9RfBYh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761155152;
	bh=KcUtQpTjceRQb92EgPDjZ/AQiUMhFwBADYecoGiPUM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oh9RfBYhME9KLDNr0MWcKqTU6UleZDjf7dLz/Oeieun5aESssuBCEApknyJo1UW1+
	 pSVcrP/3VkXL0SYrvRgYDtGb+tgnPghdv2+O6NN5sY6cc1qDNDIZ4X7NI2UsCLuJyg
	 fhrUgTDeOAtrIb8VF1MM7A8MlIeoA5I4i0v8SlTzCei8WTQpE/5ylppRwytaJVhu3j
	 OQCid0yyZbQA1lep5EqTB69Uoxho71gb+aCPPumK+20r8Y0HQOHgCPAVpSGLo7ZCFZ
	 UcdfWyrNmFhFj1hFBrcMPOkSzql1uCuTef6n8X6LRzv3/u/ccWURbTdxSfiOl4mdde
	 r0TNXEYbgRzHQ==
Received: from trenzalore (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C93F717E1418;
	Wed, 22 Oct 2025 19:45:49 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v4 14/15] media: rkvdec: Add HEVC support for the VDPU381 variant
Date: Wed, 22 Oct 2025 13:45:06 -0400
Message-ID: <20251022174508.284929-15-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251022174508.284929-1-detlev.casanova@collabora.com>
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VDPU381 supports HEVC decoding up to 7680x4320@30fps.
It could double that when using both decoder cores.

It support YUV420 (8 and 10 bits) as well as AFBC (not implemented
here)

The fluster score is 146/147 for JCT-VC-HEVC_V1, tested on ROCK 5B.
None of the other test suites works.

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/Kconfig    |   1 +
 .../media/platform/rockchip/rkvdec/Makefile   |   1 +
 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 392 +++++++++++-
 .../rockchip/rkvdec/rkvdec-hevc-common.h      |  74 ++-
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     | 596 ++++++++++++++++++
 .../media/platform/rockchip/rkvdec/rkvdec.c   |  86 ++-
 .../media/platform/rockchip/rkvdec/rkvdec.h   |   3 +
 7 files changed, 1114 insertions(+), 39 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c

diff --git a/drivers/media/platform/rockchip/rkvdec/Kconfig b/drivers/media/platform/rockchip/rkvdec/Kconfig
index 5f3bdd848a2c..3303b0ce3280 100644
--- a/drivers/media/platform/rockchip/rkvdec/Kconfig
+++ b/drivers/media/platform/rockchip/rkvdec/Kconfig
@@ -8,6 +8,7 @@ config VIDEO_ROCKCHIP_VDEC
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV
 	select V4L2_H264
+	select V4L2_HEVC
 	select V4L2_VP9
 	help
 	  Support for the Rockchip Video Decoder IP present on Rockchip SoCs,
diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/media/platform/rockchip/rkvdec/Makefile
index a58d4aede2fe..e30fdd7d51c3 100644
--- a/drivers/media/platform/rockchip/rkvdec/Makefile
+++ b/drivers/media/platform/rockchip/rkvdec/Makefile
@@ -9,5 +9,6 @@ rockchip-vdec-y += \
 		   rkvdec-hevc-common.o \
 		   rkvdec-rcb.o \
 		   rkvdec-vdpu381-h264.o \
+		   rkvdec-vdpu381-hevc.o \
 		   rkvdec-vdpu383-h264.o \
 		   rkvdec-vp9.o
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index d571107f2242..4b21b3ea67fd 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -21,6 +21,143 @@
 #include "rkvdec.h"
 #include "rkvdec-hevc-common.h"
 
+#define RKVDEC_HEVC_MAX_DEPTH_IN_BYTES		2
+
+/* Store the Short term ref pic set calculated values */
+struct calculated_rps_st_set {
+	u8 num_delta_pocs;
+	u8 num_negative_pics;
+	u8 num_positive_pics;
+	u8 used_by_curr_pic_s0[16];
+	u8 used_by_curr_pic_s1[16];
+	s32 delta_poc_s0[16];
+	s32 delta_poc_s1[16];
+};
+
+enum rkvdec_image_fmt rkvdec_hevc_get_image_fmt(struct rkvdec_ctx *ctx,
+						struct v4l2_ctrl *ctrl)
+{
+	const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
+
+	if (ctrl->id != V4L2_CID_STATELESS_HEVC_SPS)
+		return RKVDEC_IMG_FMT_ANY;
+
+	if (sps->bit_depth_luma_minus8 == 0)
+		return RKVDEC_IMG_FMT_420_8BIT;
+	else if (sps->bit_depth_luma_minus8 == 2)
+		return RKVDEC_IMG_FMT_420_10BIT;
+
+	return RKVDEC_IMG_FMT_ANY;
+}
+
+void compute_tiles_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size,
+			   u16 width, u16 height, s32 pic_in_cts_width,
+			   s32 pic_in_cts_height, u16 *column_width, u16 *row_height)
+{
+	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	int i;
+
+	for (i = 0; i < pps->num_tile_columns_minus1 + 1; i++)
+		column_width[i] = ((i + 1) * pic_in_cts_width) /
+				  (pps->num_tile_columns_minus1 + 1) -
+				  (i * pic_in_cts_width) /
+				  (pps->num_tile_columns_minus1 + 1);
+
+	for (i = 0; i < pps->num_tile_rows_minus1 + 1; i++)
+		row_height[i] = ((i + 1) * pic_in_cts_height) /
+				(pps->num_tile_rows_minus1 + 1) -
+				(i * pic_in_cts_height) /
+				(pps->num_tile_rows_minus1 + 1);
+}
+
+void compute_tiles_non_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size,
+			       u16 width, u16 height, s32 pic_in_cts_width,
+			       s32 pic_in_cts_height, u16 *column_width, u16 *row_height)
+{
+	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	s32 sum = 0;
+	int i;
+
+	for (i = 0; i < pps->num_tile_columns_minus1; i++) {
+		column_width[i] = pps->column_width_minus1[i] + 1;
+		sum += column_width[i];
+	}
+	column_width[i] = pic_in_cts_width - sum;
+
+	sum = 0;
+	for (i = 0; i < pps->num_tile_rows_minus1; i++) {
+		row_height[i] = pps->row_height_minus1[i] + 1;
+		sum += row_height[i];
+	}
+	row_height[i] = pic_in_cts_height - sum;
+}
+
+static void set_ref_poc(struct rkvdec_rps_short_term_ref_set *set, int poc, int value, int flag)
+{
+	switch (poc) {
+	case 0:
+		set->delta_poc0 = value;
+		set->used_flag0 = flag;
+		break;
+	case 1:
+		set->delta_poc1 = value;
+		set->used_flag1 = flag;
+		break;
+	case 2:
+		set->delta_poc2 = value;
+		set->used_flag2 = flag;
+		break;
+	case 3:
+		set->delta_poc3 = value;
+		set->used_flag3 = flag;
+		break;
+	case 4:
+		set->delta_poc4 = value;
+		set->used_flag4 = flag;
+		break;
+	case 5:
+		set->delta_poc5 = value;
+		set->used_flag5 = flag;
+		break;
+	case 6:
+		set->delta_poc6 = value;
+		set->used_flag6 = flag;
+		break;
+	case 7:
+		set->delta_poc7 = value;
+		set->used_flag7 = flag;
+		break;
+	case 8:
+		set->delta_poc8 = value;
+		set->used_flag8 = flag;
+		break;
+	case 9:
+		set->delta_poc9 = value;
+		set->used_flag9 = flag;
+		break;
+	case 10:
+		set->delta_poc10 = value;
+		set->used_flag10 = flag;
+		break;
+	case 11:
+		set->delta_poc11 = value;
+		set->used_flag11 = flag;
+		break;
+	case 12:
+		set->delta_poc12 = value;
+		set->used_flag12 = flag;
+		break;
+	case 13:
+		set->delta_poc13 = value;
+		set->used_flag13 = flag;
+		break;
+	case 14:
+		set->delta_poc14 = value;
+		set->used_flag14 = flag;
+		break;
+	}
+}
+
 /*
  * Flip one or more matrices along their main diagonal and flatten them
  * before writing it to the memory.
@@ -105,7 +242,7 @@ static void translate_scaling_list(struct scaling_factor *output,
 }
 
 void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_hevc_run *run,
-					  struct scaling_factor *scaling_factor,
+					  struct scaling_factor *scaling_list,
 					  struct v4l2_ctrl_hevc_scaling_matrix *cache)
 {
 	const struct v4l2_ctrl_hevc_scaling_matrix *scaling = run->scaling_matrix;
@@ -114,15 +251,220 @@ void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_hevc_run *run,
 		    sizeof(struct v4l2_ctrl_hevc_scaling_matrix)))
 		return;
 
-	translate_scaling_list(scaling_factor, scaling);
+	translate_scaling_list(scaling_list, scaling);
 
 	memcpy(cache, scaling,
 	       sizeof(struct v4l2_ctrl_hevc_scaling_matrix));
 }
 
-struct vb2_buffer *
-get_ref_buf(struct rkvdec_ctx *ctx, struct rkvdec_hevc_run *run,
-	    unsigned int dpb_idx)
+static void rkvdec_hevc_assemble_hw_lt_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps)
+{
+	const struct v4l2_ctrl_hevc_sps *sps = run->sps;
+
+	if (!run->ext_sps_lt_rps)
+		return;
+
+	for (int i = 0; i < sps->num_long_term_ref_pics_sps; i++) {
+		rps->refs[i].lt_ref_pic_poc_lsb =
+			run->ext_sps_lt_rps[i].lt_ref_pic_poc_lsb_sps;
+		rps->refs[i].used_by_curr_pic_lt_flag =
+			!!(run->ext_sps_lt_rps[i].flags & V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT);
+	}
+}
+
+static void rkvdec_hevc_assemble_hw_st_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
+					   struct calculated_rps_st_set *calculated_rps_st_sets)
+{
+	const struct v4l2_ctrl_hevc_sps *sps = run->sps;
+
+	for (int i = 0; i < sps->num_short_term_ref_pic_sets; i++) {
+		int poc = 0;
+		int j = 0;
+		const struct calculated_rps_st_set *set = &calculated_rps_st_sets[i];
+
+		rps->short_term_ref_sets[i].num_negative = set->num_negative_pics;
+		rps->short_term_ref_sets[i].num_positive = set->num_positive_pics;
+
+		for (; j < set->num_negative_pics; j++) {
+			set_ref_poc(&rps->short_term_ref_sets[i], j,
+				    set->delta_poc_s0[j], set->used_by_curr_pic_s0[j]);
+		}
+		poc = j;
+
+		for (j = 0; j < set->num_positive_pics; j++) {
+			set_ref_poc(&rps->short_term_ref_sets[i], poc + j,
+				    set->delta_poc_s1[j], set->used_by_curr_pic_s1[j]);
+		}
+	}
+}
+
+/*
+ * Compute the short term ref pic set parameters based on its reference short term ref pic
+ */
+static void st_ref_pic_set_prediction(struct rkvdec_hevc_run *run, int idx,
+				      struct calculated_rps_st_set *calculated_rps_st_sets)
+{
+	const struct v4l2_ctrl_hevc_ext_sps_st_rps *rps_data = &run->ext_sps_st_rps[idx];
+	struct calculated_rps_st_set *st_rps = &calculated_rps_st_sets[idx];
+	struct calculated_rps_st_set *ref_rps;
+	u8 st_rps_idx = idx;
+	u8 ref_rps_idx = 0;
+	s16 delta_rps = 0;
+	u8 use_delta_flag[16] = { 0 };
+	u8 used_by_curr_pic_flag[16] = { 0 };
+	int i, j;
+	int dPoc;
+
+	ref_rps_idx = st_rps_idx - (rps_data->delta_idx_minus1 + 1); /* 7-59 */
+	delta_rps = (1 - 2 * rps_data->delta_rps_sign) *
+		   (rps_data->abs_delta_rps_minus1 + 1); /* 7-60 */
+
+	ref_rps = &calculated_rps_st_sets[ref_rps_idx];
+
+	for (j = 0; j <= ref_rps->num_delta_pocs; j++) {
+		used_by_curr_pic_flag[j] = !!(rps_data->used_by_curr_pic & (1 << j));
+		use_delta_flag[j] = !!(rps_data->use_delta_flag & (1 << j));
+	}
+
+	/* 7-61: calculate num_negative_pics, delta_poc_s0 and used_by_curr_pic_s0 */
+	i = 0;
+	for (j = (ref_rps->num_positive_pics - 1); j >= 0; j--) {
+		dPoc = ref_rps->delta_poc_s1[j] + delta_rps;
+		if (dPoc < 0 && use_delta_flag[ref_rps->num_negative_pics + j]) {
+			st_rps->delta_poc_s0[i] = dPoc;
+			st_rps->used_by_curr_pic_s0[i++] =
+				used_by_curr_pic_flag[ref_rps->num_negative_pics + j];
+		}
+	}
+	if (delta_rps < 0 && use_delta_flag[ref_rps->num_delta_pocs]) {
+		st_rps->delta_poc_s0[i] = delta_rps;
+		st_rps->used_by_curr_pic_s0[i++] = used_by_curr_pic_flag[ref_rps->num_delta_pocs];
+	}
+	for (j = 0; j < ref_rps->num_negative_pics; j++) {
+		dPoc = ref_rps->delta_poc_s0[j] + delta_rps;
+		if (dPoc < 0 && use_delta_flag[j]) {
+			st_rps->delta_poc_s0[i] = dPoc;
+			st_rps->used_by_curr_pic_s0[i++] = used_by_curr_pic_flag[j];
+		}
+	}
+	st_rps->num_negative_pics = i;
+
+	/* 7-62: calculate num_positive_pics, delta_poc_s1 and used_by_curr_pic_s1 */
+	i = 0;
+	for (j = (ref_rps->num_negative_pics - 1); j >= 0; j--) {
+		dPoc = ref_rps->delta_poc_s0[j] + delta_rps;
+		if (dPoc > 0 && use_delta_flag[j]) {
+			st_rps->delta_poc_s1[i] = dPoc;
+			st_rps->used_by_curr_pic_s1[i++] = used_by_curr_pic_flag[j];
+		}
+	}
+	if (delta_rps > 0 && use_delta_flag[ref_rps->num_delta_pocs]) {
+		st_rps->delta_poc_s1[i] = delta_rps;
+		st_rps->used_by_curr_pic_s1[i++] = used_by_curr_pic_flag[ref_rps->num_delta_pocs];
+	}
+	for (j = 0; j < ref_rps->num_positive_pics; j++) {
+		dPoc = ref_rps->delta_poc_s1[j] + delta_rps;
+		if (dPoc > 0 && use_delta_flag[ref_rps->num_negative_pics + j]) {
+			st_rps->delta_poc_s1[i] = dPoc;
+			st_rps->used_by_curr_pic_s1[i++] =
+				used_by_curr_pic_flag[ref_rps->num_negative_pics + j];
+		}
+	}
+	st_rps->num_positive_pics = i;
+
+	st_rps->num_delta_pocs = st_rps->num_positive_pics + st_rps->num_negative_pics;
+}
+
+/*
+ * Compute the short term ref pic set parameters based on the control's data.
+ */
+static void st_ref_pic_set_calculate(struct rkvdec_hevc_run *run, int idx,
+				     struct calculated_rps_st_set *calculated_rps_st_sets)
+{
+	const struct v4l2_ctrl_hevc_ext_sps_st_rps *rps_data = &run->ext_sps_st_rps[idx];
+	struct calculated_rps_st_set *st_rps = &calculated_rps_st_sets[idx];
+	int j, i = 0;
+
+	/* 7-63 */
+	st_rps->num_negative_pics = rps_data->num_negative_pics;
+	/* 7-64 */
+	st_rps->num_positive_pics = rps_data->num_positive_pics;
+
+	for (i = 0; i < st_rps->num_negative_pics; i++) {
+		/* 7-65 */
+		st_rps->used_by_curr_pic_s0[i] = !!(rps_data->used_by_curr_pic & (1 << i));
+
+		if (i == 0) {
+			/* 7-67 */
+			st_rps->delta_poc_s0[i] = -(rps_data->delta_poc_s0_minus1[i] + 1);
+		} else {
+			/* 7-69 */
+			st_rps->delta_poc_s0[i] =
+				st_rps->delta_poc_s0[i - 1] -
+				(rps_data->delta_poc_s0_minus1[i] + 1);
+		}
+	}
+
+	for (j = 0; j < st_rps->num_positive_pics; j++) {
+		/* 7-66 */
+		st_rps->used_by_curr_pic_s1[j] = !!(rps_data->used_by_curr_pic & (1 << (i + j)));
+
+		if (j == 0) {
+			/* 7-68 */
+			st_rps->delta_poc_s1[j] = rps_data->delta_poc_s1_minus1[j] + 1;
+		} else {
+			/* 7-70 */
+			st_rps->delta_poc_s1[j] =
+				st_rps->delta_poc_s1[j - 1] +
+				(rps_data->delta_poc_s1_minus1[j] + 1);
+		}
+	}
+
+	/* 7-71 */
+	st_rps->num_delta_pocs = st_rps->num_positive_pics + st_rps->num_negative_pics;
+}
+
+static void rkvdec_hevc_prepare_hw_st_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
+					  struct v4l2_ctrl_hevc_ext_sps_st_rps *cache)
+{
+	int idx;
+
+	if (!run->ext_sps_st_rps)
+		return;
+
+	if (!memcmp(cache, run->ext_sps_st_rps, sizeof(struct v4l2_ctrl_hevc_ext_sps_st_rps)))
+		return;
+
+	struct calculated_rps_st_set *calculated_rps_st_sets =
+		kzalloc(sizeof(struct calculated_rps_st_set) *
+			run->sps->num_short_term_ref_pic_sets, GFP_KERNEL);
+
+	for (idx = 0; idx < run->sps->num_short_term_ref_pic_sets; idx++) {
+		const struct v4l2_ctrl_hevc_ext_sps_st_rps *rps_data = &run->ext_sps_st_rps[idx];
+
+		if (rps_data->flags & V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED)
+			st_ref_pic_set_prediction(run, idx, calculated_rps_st_sets);
+		else
+			st_ref_pic_set_calculate(run, idx, calculated_rps_st_sets);
+	}
+
+	rkvdec_hevc_assemble_hw_st_rps(run, rps, calculated_rps_st_sets);
+
+	kfree(calculated_rps_st_sets);
+
+	memcpy(cache, run->ext_sps_st_rps, sizeof(struct v4l2_ctrl_hevc_ext_sps_st_rps));
+}
+
+void rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
+				 struct v4l2_ctrl_hevc_ext_sps_st_rps *st_cache)
+{
+	rkvdec_hevc_prepare_hw_st_rps(run, rps, st_cache);
+	rkvdec_hevc_assemble_hw_lt_rps(run, rps);
+}
+
+struct vb2_buffer *get_ref_buf(struct rkvdec_ctx *ctx,
+			       struct rkvdec_hevc_run *run,
+			       unsigned int dpb_idx)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	const struct v4l2_ctrl_hevc_decode_params *decode_params = run->decode_params;
@@ -143,8 +485,6 @@ get_ref_buf(struct rkvdec_ctx *ctx, struct rkvdec_hevc_run *run,
 	return buf;
 }
 
-#define RKVDEC_HEVC_MAX_DEPTH_IN_BYTES		2
-
 int rkvdec_hevc_adjust_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *fmt = &f->fmt.pix_mp;
@@ -156,38 +496,17 @@ int rkvdec_hevc_adjust_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f)
 	return 0;
 }
 
-enum rkvdec_image_fmt rkvdec_hevc_get_image_fmt(struct rkvdec_ctx *ctx,
-						struct v4l2_ctrl *ctrl)
-{
-	const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
-
-	if (ctrl->id != V4L2_CID_STATELESS_HEVC_SPS)
-		return RKVDEC_IMG_FMT_ANY;
-
-	if (sps->bit_depth_luma_minus8 == 0) {
-		if (sps->chroma_format_idc == 2)
-			return RKVDEC_IMG_FMT_422_8BIT;
-		else
-			return RKVDEC_IMG_FMT_420_8BIT;
-	} else if (sps->bit_depth_luma_minus8 == 2) {
-		if (sps->chroma_format_idc == 2)
-			return RKVDEC_IMG_FMT_422_10BIT;
-		else
-			return RKVDEC_IMG_FMT_420_10BIT;
-	}
-
-	return RKVDEC_IMG_FMT_ANY;
-}
-
-static int rkvdec_hevc_validate_sps(struct rkvdec_ctx *ctx,
+int rkvdec_hevc_validate_sps(struct rkvdec_ctx *ctx,
 			     const struct v4l2_ctrl_hevc_sps *sps)
 {
 	if (sps->chroma_format_idc > 1)
 		/* Only 4:0:0 and 4:2:0 are supported */
 		return -EINVAL;
+
 	if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
 		/* Luma and chroma bit depth mismatch */
 		return -EINVAL;
+
 	if (sps->bit_depth_luma_minus8 != 0 && sps->bit_depth_luma_minus8 != 2)
 		/* Only 8-bit and 10-bit are supported */
 		return -EINVAL;
@@ -221,6 +540,17 @@ void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx,
 			      V4L2_CID_STATELESS_HEVC_SCALING_MATRIX);
 	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
 
+	if (ctx->has_sps_st_rps) {
+		ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+				      V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS);
+		run->ext_sps_st_rps = ctrl ? ctrl->p_cur.p : NULL;
+	}
+	if (ctx->has_sps_lt_rps) {
+		ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+				      V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS);
+		run->ext_sps_lt_rps = ctrl ? ctrl->p_cur.p : NULL;
+	}
+
 	rkvdec_run_preamble(ctx, &run->base);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
index 746b1bd73c08..0005b80bad79 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
@@ -16,19 +16,70 @@
  */
 
 #include <media/v4l2-mem2mem.h>
+#include <linux/types.h>
 #include "rkvdec.h"
 
 #define RKV_HEVC_CABAC_TABLE_SIZE		27456
 extern const u8 rkvdec_hevc_cabac_table[RKV_HEVC_CABAC_TABLE_SIZE];
 
+struct rkvdec_rps_refs {
+	u16 lt_ref_pic_poc_lsb;
+	u16 used_by_curr_pic_lt_flag	: 1;
+	u16 reserved			: 15;
+} __packed;
+
+struct rkvdec_rps_short_term_ref_set {
+	u32 num_negative	: 4;
+	u32 num_positive	: 4;
+	u32 delta_poc0		: 16;
+	u32 used_flag0		: 1;
+	u32 delta_poc1		: 16;
+	u32 used_flag1		: 1;
+	u32 delta_poc2		: 16;
+	u32 used_flag2		: 1;
+	u32 delta_poc3		: 16;
+	u32 used_flag3		: 1;
+	u32 delta_poc4		: 16;
+	u32 used_flag4		: 1;
+	u32 delta_poc5		: 16;
+	u32 used_flag5		: 1;
+	u32 delta_poc6		: 16;
+	u32 used_flag6		: 1;
+	u32 delta_poc7		: 16;
+	u32 used_flag7		: 1;
+	u32 delta_poc8		: 16;
+	u32 used_flag8		: 1;
+	u32 delta_poc9		: 16;
+	u32 used_flag9		: 1;
+	u32 delta_poc10		: 16;
+	u32 used_flag10		: 1;
+	u32 delta_poc11		: 16;
+	u32 used_flag11		: 1;
+	u32 delta_poc12		: 16;
+	u32 used_flag12		: 1;
+	u32 delta_poc13		: 16;
+	u32 used_flag13		: 1;
+	u32 delta_poc14		: 16;
+	u32 used_flag14		: 1;
+	u32 reserved_bits	: 25;
+	u32 reserved[3];
+} __packed;
+
+struct rkvdec_rps {
+	struct rkvdec_rps_refs refs[32];
+	struct rkvdec_rps_short_term_ref_set short_term_ref_sets[64];
+} __packed;
+
 struct rkvdec_hevc_run {
-	struct rkvdec_run base;
-	const struct v4l2_ctrl_hevc_slice_params *slices_params;
-	const struct v4l2_ctrl_hevc_decode_params *decode_params;
-	const struct v4l2_ctrl_hevc_sps *sps;
-	const struct v4l2_ctrl_hevc_pps *pps;
-	const struct v4l2_ctrl_hevc_scaling_matrix *scaling_matrix;
-	int num_slices;
+	struct rkvdec_run				base;
+	const struct v4l2_ctrl_hevc_decode_params	*decode_params;
+	const struct v4l2_ctrl_hevc_slice_params	*slices_params;
+	const struct v4l2_ctrl_hevc_sps			*sps;
+	const struct v4l2_ctrl_hevc_pps			*pps;
+	const struct v4l2_ctrl_hevc_scaling_matrix	*scaling_matrix;
+	const struct v4l2_ctrl_hevc_ext_sps_st_rps	*ext_sps_st_rps;
+	const struct v4l2_ctrl_hevc_ext_sps_lt_rps	*ext_sps_lt_rps;
+	int						num_slices;
 };
 
 struct scaling_factor {
@@ -40,6 +91,14 @@ struct scaling_factor {
 
 enum rkvdec_image_fmt rkvdec_hevc_get_image_fmt(struct rkvdec_ctx *ctx,
 						struct v4l2_ctrl *ctrl);
+void compute_tiles_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size,
+			   u16 width, u16 height, s32 pic_in_cts_width,
+			   s32 pic_in_cts_height, u16 *column_width, u16 *row_height);
+void compute_tiles_non_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size,
+			       u16 width, u16 height, s32 pic_in_cts_width,
+			       s32 pic_in_cts_height, u16 *column_width, u16 *row_height);
+void rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
+				 struct v4l2_ctrl_hevc_ext_sps_st_rps *st_cache);
 void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_hevc_run *run,
 					  struct scaling_factor *scaling_factor,
 					  struct v4l2_ctrl_hevc_scaling_matrix *cache);
@@ -47,5 +106,6 @@ struct vb2_buffer *get_ref_buf(struct rkvdec_ctx *ctx,
 			       struct rkvdec_hevc_run *run,
 			       unsigned int dpb_idx);
 int rkvdec_hevc_adjust_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f);
+int rkvdec_hevc_validate_sps(struct rkvdec_ctx *ctx, const struct v4l2_ctrl_hevc_sps *sps);
 int rkvdec_hevc_try_ctrl(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl);
 void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_hevc_run *run);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
new file mode 100644
index 000000000000..278f1dbf0910
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -0,0 +1,596 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip VDPU381 HEVC backend
+ *
+ * Copyright (C) 2025 Collabora, Ltd.
+ *  Detlev Casanova <detlev.casanova@collabora.com>
+ */
+
+#include <media/v4l2-mem2mem.h>
+
+#include "rkvdec.h"
+#include "rkvdec-rcb.h"
+#include "rkvdec-hevc-common.h"
+#include "rkvdec-vdpu381-regs.h"
+
+// SPS
+struct rkvdec_hevc_sps {
+	u16 video_parameters_set_id			: 4;
+	u16 seq_parameters_set_id_sps			: 4;
+	u16 chroma_format_idc				: 2;
+	u16 width					: 16;
+	u16 height					: 16;
+	u16 bit_depth_luma				: 4;
+	u16 bit_depth_chroma				: 4;
+	u16 max_pic_order_count_lsb			: 5;
+	u16 diff_max_min_luma_coding_block_size		: 2;
+	u16 min_luma_coding_block_size			: 3;
+	u16 min_transform_block_size			: 3;
+	u16 diff_max_min_transform_block_size		: 2;
+	u16 max_transform_hierarchy_depth_inter		: 3;
+	u16 max_transform_hierarchy_depth_intra		: 3;
+	u16 scaling_list_enabled_flag			: 1;
+	u16 amp_enabled_flag				: 1;
+	u16 sample_adaptive_offset_enabled_flag		: 1;
+	u16 pcm_enabled_flag				: 1;
+	u16 pcm_sample_bit_depth_luma			: 4;
+	u16 pcm_sample_bit_depth_chroma			: 4;
+	u16 pcm_loop_filter_disabled_flag		: 1;
+	u16 diff_max_min_pcm_luma_coding_block_size	: 3;
+	u16 min_pcm_luma_coding_block_size		: 3;
+	u16 num_short_term_ref_pic_sets			: 7;
+	u16 long_term_ref_pics_present_flag		: 1;
+	u16 num_long_term_ref_pics_sps			: 6;
+	u16 sps_temporal_mvp_enabled_flag		: 1;
+	u16 strong_intra_smoothing_enabled_flag		: 1;
+	u16 reserved_0					: 7;
+	u16 sps_max_dec_pic_buffering_minus1		: 4;
+	u16 reserved_0_2				: 3;
+	u16 reserved_f					: 8;
+} __packed;
+
+//PPS
+struct rkvdec_hevc_pps {
+	u16 picture_parameters_set_id			: 6;
+	u16 seq_parameters_set_id_pps			: 4;
+	u16 dependent_slice_segments_enabled_flag	: 1;
+	u16 output_flag_present_flag			: 1;
+	u16 num_extra_slice_header_bits			: 13;
+	u16 sign_data_hiding_enabled_flag		: 1;
+	u16 cabac_init_present_flag			: 1;
+	u16 num_ref_idx_l0_default_active		: 4;
+	u16 num_ref_idx_l1_default_active		: 4;
+	u16 init_qp_minus26				: 7;
+	u16 constrained_intra_pred_flag			: 1;
+	u16 transform_skip_enabled_flag			: 1;
+	u16 cu_qp_delta_enabled_flag			: 1;
+	u16 log2_min_cb_size				: 3;
+	u16 pps_cb_qp_offset				: 5;
+	u16 pps_cr_qp_offset				: 5;
+	u16 pps_slice_chroma_qp_offsets_present_flag	: 1;
+	u16 weighted_pred_flag				: 1;
+	u16 weighted_bipred_flag			: 1;
+	u16 transquant_bypass_enabled_flag		: 1;
+	u16 tiles_enabled_flag				: 1;
+	u16 entropy_coding_sync_enabled_flag		: 1;
+	u16 pps_loop_filter_across_slices_enabled_flag	: 1;
+	u16 loop_filter_across_tiles_enabled_flag	: 1;
+	u16 deblocking_filter_override_enabled_flag	: 1;
+	u16 pps_deblocking_filter_disabled_flag		: 1;
+	u16 pps_beta_offset_div2			: 4;
+	u16 pps_tc_offset_div2				: 4;
+	u16 lists_modification_present_flag		: 1;
+	u16 log2_parallel_merge_level			: 3;
+	u16 slice_segment_header_extension_present_flag	: 1;
+	u16 zeroes					: 3;
+	u16 num_tile_columns				: 5;
+	u16 num_tile_rows				: 5;
+	u16 sps_pps_mode				: 4;
+	u16 reserved_bits				: 14;
+	u16 reserved;
+} __packed;
+
+struct rkvdec_hevc_tile {
+	u16 value0	: 12;
+	u16 value1	: 12;
+} __packed;
+
+struct rkvdec_sps_pps_packet {
+	struct rkvdec_hevc_sps sps;
+	struct rkvdec_hevc_pps pps;
+	struct rkvdec_hevc_tile column_width[10];
+	struct rkvdec_hevc_tile row_height[11];
+	u32 zeroes[3];
+	u32 zeroes_bits		: 6;
+	u32 padding_bits	: 2;
+	u32 padding;
+} __packed;
+
+struct rkvdec_hevc_priv_tbl {
+	struct rkvdec_sps_pps_packet param_set[64];
+	struct rkvdec_rps rps;
+	struct scaling_factor scaling_list;
+	u8 cabac_table[27456];
+};
+
+struct rkvdec_hevc_ctx {
+	struct rkvdec_aux_buf			priv_tbl;
+	struct v4l2_ctrl_hevc_scaling_matrix	scaling_matrix_cache;
+	struct v4l2_ctrl_hevc_ext_sps_st_rps	st_cache;
+	struct rkvdec_vdpu381_regs_hevc		regs;
+};
+
+static void assemble_hw_pps(struct rkvdec_ctx *ctx,
+			    struct rkvdec_hevc_run *run)
+{
+	struct rkvdec_hevc_ctx *h264_ctx = ctx->priv;
+	const struct v4l2_ctrl_hevc_sps *sps = run->sps;
+	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	struct rkvdec_hevc_priv_tbl *priv_tbl = h264_ctx->priv_tbl.cpu;
+	struct rkvdec_sps_pps_packet *hw_ps;
+	bool tiles_enabled;
+	s32 max_cu_width;
+	s32 pic_in_cts_width;
+	s32 pic_in_cts_height;
+	u16 log2_min_cb_size, width, height;
+	u16 column_width[20];
+	u16 row_height[22];
+	u8 pcm_enabled;
+	u32 i;
+
+	/*
+	 * HW read the SPS/PPS information from PPS packet index by PPS id.
+	 * offset from the base can be calculated by PPS_id * 32 (size per PPS
+	 * packet unit). so the driver copy SPS/PPS information to the exact PPS
+	 * packet unit for HW accessing.
+	 */
+	hw_ps = &priv_tbl->param_set[pps->pic_parameter_set_id];
+	memset(hw_ps, 0, sizeof(*hw_ps));
+
+	/* write sps */
+	hw_ps->sps.video_parameters_set_id = sps->video_parameter_set_id;
+	hw_ps->sps.seq_parameters_set_id_sps = sps->seq_parameter_set_id;
+	hw_ps->sps.chroma_format_idc = sps->chroma_format_idc;
+
+	log2_min_cb_size = sps->log2_min_luma_coding_block_size_minus3 + 3;
+	width = sps->pic_width_in_luma_samples;
+	height = sps->pic_height_in_luma_samples;
+	hw_ps->sps.width = width;
+	hw_ps->sps.height = height;
+	hw_ps->sps.bit_depth_luma = sps->bit_depth_luma_minus8 + 8;
+	hw_ps->sps.bit_depth_chroma = sps->bit_depth_chroma_minus8 + 8;
+	hw_ps->sps.max_pic_order_count_lsb = sps->log2_max_pic_order_cnt_lsb_minus4 + 4;
+	hw_ps->sps.diff_max_min_luma_coding_block_size =
+		sps->log2_diff_max_min_luma_coding_block_size;
+	hw_ps->sps.min_luma_coding_block_size = sps->log2_min_luma_coding_block_size_minus3 + 3;
+	hw_ps->sps.min_transform_block_size = sps->log2_min_luma_transform_block_size_minus2 + 2;
+	hw_ps->sps.diff_max_min_transform_block_size =
+		sps->log2_diff_max_min_luma_transform_block_size;
+	hw_ps->sps.max_transform_hierarchy_depth_inter = sps->max_transform_hierarchy_depth_inter;
+	hw_ps->sps.max_transform_hierarchy_depth_intra = sps->max_transform_hierarchy_depth_intra;
+	hw_ps->sps.scaling_list_enabled_flag =
+		!!(sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED);
+	hw_ps->sps.amp_enabled_flag = !!(sps->flags & V4L2_HEVC_SPS_FLAG_AMP_ENABLED);
+	hw_ps->sps.sample_adaptive_offset_enabled_flag =
+		!!(sps->flags & V4L2_HEVC_SPS_FLAG_SAMPLE_ADAPTIVE_OFFSET);
+
+	pcm_enabled = !!(sps->flags & V4L2_HEVC_SPS_FLAG_PCM_ENABLED);
+	hw_ps->sps.pcm_enabled_flag = pcm_enabled;
+	hw_ps->sps.pcm_sample_bit_depth_luma =
+		pcm_enabled ? sps->pcm_sample_bit_depth_luma_minus1 + 1 : 0;
+	hw_ps->sps.pcm_sample_bit_depth_chroma =
+		pcm_enabled ? sps->pcm_sample_bit_depth_chroma_minus1 + 1 : 0;
+	hw_ps->sps.pcm_loop_filter_disabled_flag =
+		!!(sps->flags & V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER_DISABLED);
+	hw_ps->sps.diff_max_min_pcm_luma_coding_block_size =
+		sps->log2_diff_max_min_pcm_luma_coding_block_size;
+	hw_ps->sps.min_pcm_luma_coding_block_size =
+		pcm_enabled ? sps->log2_min_pcm_luma_coding_block_size_minus3 + 3 : 0;
+	hw_ps->sps.num_short_term_ref_pic_sets = sps->num_short_term_ref_pic_sets;
+	hw_ps->sps.long_term_ref_pics_present_flag =
+		!!(sps->flags & V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT);
+	hw_ps->sps.num_long_term_ref_pics_sps = sps->num_long_term_ref_pics_sps;
+	hw_ps->sps.sps_temporal_mvp_enabled_flag =
+		!!(sps->flags & V4L2_HEVC_SPS_FLAG_SPS_TEMPORAL_MVP_ENABLED);
+	hw_ps->sps.strong_intra_smoothing_enabled_flag =
+		!!(sps->flags & V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED);
+	hw_ps->sps.sps_max_dec_pic_buffering_minus1 = sps->sps_max_dec_pic_buffering_minus1;
+	hw_ps->sps.reserved_f = 0xff;
+
+	/* write pps */
+	hw_ps->pps.picture_parameters_set_id = pps->pic_parameter_set_id;
+	hw_ps->pps.seq_parameters_set_id_pps = sps->seq_parameter_set_id;
+	hw_ps->pps.dependent_slice_segments_enabled_flag =
+		!!(pps->flags & V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT_ENABLED);
+	hw_ps->pps.output_flag_present_flag =
+		!!(pps->flags & V4L2_HEVC_PPS_FLAG_OUTPUT_FLAG_PRESENT);
+	hw_ps->pps.num_extra_slice_header_bits = pps->num_extra_slice_header_bits;
+	hw_ps->pps.sign_data_hiding_enabled_flag =
+		!!(pps->flags & V4L2_HEVC_PPS_FLAG_SIGN_DATA_HIDING_ENABLED);
+	hw_ps->pps.cabac_init_present_flag =
+		!!(pps->flags & V4L2_HEVC_PPS_FLAG_CABAC_INIT_PRESENT);
+	hw_ps->pps.num_ref_idx_l0_default_active = pps->num_ref_idx_l0_default_active_minus1 + 1;
+	hw_ps->pps.num_ref_idx_l1_default_active = pps->num_ref_idx_l1_default_active_minus1 + 1;
+	hw_ps->pps.init_qp_minus26 = pps->init_qp_minus26;
+	hw_ps->pps.constrained_intra_pred_flag =
+		!!(pps->flags & V4L2_HEVC_PPS_FLAG_CONSTRAINED_INTRA_PRED);
+	hw_ps->pps.transform_skip_enabled_flag =
+		!!(pps->flags & V4L2_HEVC_PPS_FLAG_TRANSFORM_SKIP_ENABLED);
+	hw_ps->pps.cu_qp_delta_enabled_flag =
+		!!(pps->flags & V4L2_HEVC_PPS_FLAG_CU_QP_DELTA_ENABLED);
+	hw_ps->pps.log2_min_cb_size = log2_min_cb_size +
+				      sps->log2_diff_max_min_luma_coding_block_size -
+				      pps->diff_cu_qp_delta_depth;
+	hw_ps->pps.pps_cb_qp_offset = pps->pps_cb_qp_offset;
+	hw_ps->pps.pps_cr_qp_offset = pps->pps_cr_qp_offset;
+	hw_ps->pps.pps_slice_chroma_qp_offsets_present_flag =
+		!!(pps->flags & V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT);
+	hw_ps->pps.weighted_pred_flag = !!(pps->flags & V4L2_HEVC_PPS_FLAG_WEIGHTED_PRED);
+	hw_ps->pps.weighted_bipred_flag = !!(pps->flags & V4L2_HEVC_PPS_FLAG_WEIGHTED_BIPRED);
+	hw_ps->pps.transquant_bypass_enabled_flag =
+		!!(pps->flags & V4L2_HEVC_PPS_FLAG_TRANSQUANT_BYPASS_ENABLED);
+
+	tiles_enabled = !!(pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED);
+	hw_ps->pps.tiles_enabled_flag = tiles_enabled;
+	hw_ps->pps.entropy_coding_sync_enabled_flag =
+		!!(pps->flags & V4L2_HEVC_PPS_FLAG_ENTROPY_CODING_SYNC_ENABLED);
+	hw_ps->pps.pps_loop_filter_across_slices_enabled_flag =
+		!!(pps->flags & V4L2_HEVC_PPS_FLAG_PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED);
+	hw_ps->pps.loop_filter_across_tiles_enabled_flag =
+		!!(pps->flags & V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED);
+	hw_ps->pps.deblocking_filter_override_enabled_flag =
+		!!(pps->flags & V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_OVERRIDE_ENABLED);
+	hw_ps->pps.pps_deblocking_filter_disabled_flag =
+		!!(pps->flags & V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER);
+	hw_ps->pps.pps_beta_offset_div2 = pps->pps_beta_offset_div2;
+	hw_ps->pps.pps_tc_offset_div2 = pps->pps_tc_offset_div2;
+	hw_ps->pps.lists_modification_present_flag =
+		!!(pps->flags & V4L2_HEVC_PPS_FLAG_LISTS_MODIFICATION_PRESENT);
+	hw_ps->pps.log2_parallel_merge_level = pps->log2_parallel_merge_level_minus2 + 2;
+	hw_ps->pps.slice_segment_header_extension_present_flag =
+		!!(pps->flags & V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT);
+	hw_ps->pps.num_tile_columns = tiles_enabled ? pps->num_tile_columns_minus1 + 1 : 0;
+	hw_ps->pps.num_tile_rows = tiles_enabled ? pps->num_tile_rows_minus1 + 1 : 0;
+	hw_ps->pps.sps_pps_mode = 0;
+	hw_ps->pps.reserved_bits = 0x3fff;
+	hw_ps->pps.reserved = 0xffff;
+
+	// Setup tiles information
+	memset(column_width, 0, sizeof(column_width));
+	memset(row_height, 0, sizeof(row_height));
+
+	max_cu_width = 1 << (sps->log2_diff_max_min_luma_coding_block_size + log2_min_cb_size);
+	pic_in_cts_width = (width + max_cu_width - 1) / max_cu_width;
+	pic_in_cts_height = (height + max_cu_width - 1) / max_cu_width;
+
+	if (pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) {
+		if (pps->flags & V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING) {
+			compute_tiles_uniform(run, log2_min_cb_size, width, height,
+					      pic_in_cts_width, pic_in_cts_height,
+					      column_width, row_height);
+		} else {
+			compute_tiles_non_uniform(run, log2_min_cb_size, width, height,
+						  pic_in_cts_width, pic_in_cts_height,
+						  column_width, row_height);
+		}
+	} else {
+		column_width[0] = (width + max_cu_width - 1) / max_cu_width;
+		row_height[0] = (height + max_cu_width - 1) / max_cu_width;
+	}
+
+	for (i = 0; i < 20; i++) {
+		if (column_width[i] > 0)
+			column_width[i]--;
+
+		if (i & 1)
+			hw_ps->column_width[i / 2].value1 = column_width[i];
+		else
+			hw_ps->column_width[i / 2].value0 = column_width[i];
+	}
+
+	for (i = 0; i < 22; i++) {
+		if (row_height[i] > 0)
+			row_height[i]--;
+
+		if (i & 1)
+			hw_ps->row_height[i / 2].value1 = row_height[i];
+		else
+			hw_ps->row_height[i / 2].value0 = row_height[i];
+	}
+
+	hw_ps->padding = 0xffffffff;
+	hw_ps->padding_bits = 0x3;
+}
+
+static void set_ref_valid(struct rkvdec_vdpu381_regs_hevc *regs, int id, u32 valid)
+{
+	switch (id) {
+	case 0:
+		regs->hevc_param.reg099.hevc_ref_valid_0 = valid;
+		break;
+	case 1:
+		regs->hevc_param.reg099.hevc_ref_valid_1 = valid;
+		break;
+	case 2:
+		regs->hevc_param.reg099.hevc_ref_valid_2 = valid;
+		break;
+	case 3:
+		regs->hevc_param.reg099.hevc_ref_valid_3 = valid;
+		break;
+	case 4:
+		regs->hevc_param.reg099.hevc_ref_valid_4 = valid;
+		break;
+	case 5:
+		regs->hevc_param.reg099.hevc_ref_valid_5 = valid;
+		break;
+	case 6:
+		regs->hevc_param.reg099.hevc_ref_valid_6 = valid;
+		break;
+	case 7:
+		regs->hevc_param.reg099.hevc_ref_valid_7 = valid;
+		break;
+	case 8:
+		regs->hevc_param.reg099.hevc_ref_valid_8 = valid;
+		break;
+	case 9:
+		regs->hevc_param.reg099.hevc_ref_valid_9 = valid;
+		break;
+	case 10:
+		regs->hevc_param.reg099.hevc_ref_valid_10 = valid;
+		break;
+	case 11:
+		regs->hevc_param.reg099.hevc_ref_valid_11 = valid;
+		break;
+	case 12:
+		regs->hevc_param.reg099.hevc_ref_valid_12 = valid;
+		break;
+	case 13:
+		regs->hevc_param.reg099.hevc_ref_valid_13 = valid;
+		break;
+	case 14:
+		regs->hevc_param.reg099.hevc_ref_valid_14 = valid;
+		break;
+	}
+}
+
+static void rkvdec_write_regs(struct rkvdec_ctx *ctx)
+{
+	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
+
+	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_COMMON_REGS,
+			   &hevc_ctx->regs.common,
+			   sizeof(hevc_ctx->regs.common));
+	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_CODEC_PARAMS_REGS,
+			   &hevc_ctx->regs.hevc_param,
+			   sizeof(hevc_ctx->regs.hevc_param));
+	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_COMMON_ADDR_REGS,
+			   &hevc_ctx->regs.common_addr,
+			   sizeof(hevc_ctx->regs.common_addr));
+	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_CODEC_ADDR_REGS,
+			   &hevc_ctx->regs.hevc_addr,
+			   sizeof(hevc_ctx->regs.hevc_addr));
+	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_POC_HIGHBIT_REGS,
+			   &hevc_ctx->regs.hevc_highpoc,
+			   sizeof(hevc_ctx->regs.hevc_highpoc));
+}
+
+static void config_registers(struct rkvdec_ctx *ctx,
+			     struct rkvdec_hevc_run *run)
+{
+	const struct v4l2_ctrl_hevc_decode_params *dec_params = run->decode_params;
+	const struct v4l2_hevc_dpb_entry *dpb = dec_params->dpb;
+	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
+	struct rkvdec_vdpu381_regs_hevc *regs = &hevc_ctx->regs;
+	dma_addr_t priv_start_addr = hevc_ctx->priv_tbl.dma;
+	const struct v4l2_pix_format_mplane *dst_fmt;
+	struct vb2_v4l2_buffer *src_buf = run->base.bufs.src;
+	struct vb2_v4l2_buffer *dst_buf = run->base.bufs.dst;
+	const struct v4l2_format *f;
+	dma_addr_t rlc_addr;
+	u32 hor_virstride = 0;
+	u32 ver_virstride = 0;
+	u32 y_virstride = 0;
+	u32 offset;
+	u32 pixels;
+	dma_addr_t dst_addr;
+	u32 i;
+
+	memset(regs, 0, sizeof(*regs));
+
+	/* Set HEVC mode */
+	regs->common.reg009.dec_mode = VDPU381_MODE_HEVC;
+
+	/* Set config */
+	regs->common.reg011.buf_empty_en = 1;
+	regs->common.reg011.dec_clkgate_e = 1;
+	regs->common.reg011.dec_timeout_e = 1;
+	regs->common.reg011.pix_range_detection_e = 1;
+
+	/* Set IDR flag */
+	regs->common.reg013.cur_pic_is_idr =
+		!!(dec_params->flags & V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC);
+
+	/* Set input stream length */
+	regs->common.stream_len = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
+
+	/* Set max slice number */
+	regs->common.reg017.slice_num = 1;
+
+	/* Set strides */
+	f = &ctx->decoded_fmt;
+	dst_fmt = &f->fmt.pix_mp;
+	hor_virstride = dst_fmt->plane_fmt[0].bytesperline;
+	ver_virstride = dst_fmt->height;
+	y_virstride = hor_virstride * ver_virstride;
+	pixels = dst_fmt->height * dst_fmt->width;
+
+	regs->common.reg018.y_hor_virstride = hor_virstride / 16;
+	regs->common.reg019.uv_hor_virstride = hor_virstride / 16;
+	regs->common.reg020.y_virstride = y_virstride / 16;
+
+	/* Activate block gating */
+	regs->common.reg026.swreg_block_gating_e = 0xfffef;
+	regs->common.reg026.reg_cfg_gating_en = 1;
+
+	/* Set timeout threshold */
+	if (pixels < RKVDEC_1080P_PIXELS)
+		regs->common.timeout_threshold = RKVDEC_TIMEOUT_1080p;
+	else if (pixels < RKVDEC_4K_PIXELS)
+		regs->common.timeout_threshold = RKVDEC_TIMEOUT_4K;
+	else if (pixels < RKVDEC_8K_PIXELS)
+		regs->common.timeout_threshold = RKVDEC_TIMEOUT_8K;
+
+	/* Set POC val */
+	regs->hevc_param.cur_top_poc = dec_params->pic_order_cnt_val;
+
+	/* Set ref pic address & poc */
+	for (i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
+		struct vb2_buffer *vb_buf = get_ref_buf(ctx, run, i);
+		dma_addr_t buf_dma = vb2_dma_contig_plane_dma_addr(vb_buf, 0);
+		u32 valid = !!(dec_params->num_active_dpb_entries > i);
+
+		/* Set reference addresses */
+		regs->hevc_addr.ref_base[i] = buf_dma;
+
+		/* Set COLMV addresses */
+		regs->hevc_addr.colmv_base[i] = buf_dma + ctx->colmv_offset;
+
+		regs->hevc_param.reg067_082_ref_poc[i] =
+			dpb[i].pic_order_cnt_val;
+
+		set_ref_valid(regs, i, valid);
+		regs->hevc_param.reg103.ref_pic_layer_same_with_cur |= 1 << i;
+	}
+
+	/* Set rlc base address (input stream) */
+	rlc_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
+	regs->common_addr.rlc_base = rlc_addr;
+	regs->common_addr.rlcwrite_base = rlc_addr;
+
+	/* Set output base address */
+	dst_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+	regs->common_addr.decout_base = dst_addr;
+	regs->common_addr.error_ref_base = dst_addr;
+
+	/* Set colmv address */
+	regs->common_addr.colmv_cur_base = dst_addr + ctx->colmv_offset;
+
+	/* Set RCB addresses */
+	for (i = 0; i < rkvdec_rcb_buf_count(ctx); i++)
+		regs->common_addr.rcb_base[i] = rkvdec_rcb_buf_dma_addr(ctx, i);
+
+	/* Set hw pps address */
+	offset = offsetof(struct rkvdec_hevc_priv_tbl, param_set);
+	regs->hevc_addr.pps_base = priv_start_addr + offset;
+
+	/* Set hw rps address */
+	offset = offsetof(struct rkvdec_hevc_priv_tbl, rps);
+	regs->hevc_addr.rps_base = priv_start_addr + offset;
+
+	/* Set cabac table */
+	offset = offsetof(struct rkvdec_hevc_priv_tbl, cabac_table);
+	regs->hevc_addr.cabactbl_base = priv_start_addr + offset;
+
+	/* Set scaling matrix */
+	offset = offsetof(struct rkvdec_hevc_priv_tbl, scaling_list);
+	regs->hevc_addr.scanlist_addr = priv_start_addr + offset;
+
+	rkvdec_write_regs(ctx);
+}
+
+static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
+{
+	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_hevc_priv_tbl *priv_tbl;
+	struct rkvdec_hevc_ctx *hevc_ctx;
+	struct v4l2_ctrl *ctrl;
+	int ret;
+
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_HEVC_SPS);
+	if (!ctrl)
+		return -EINVAL;
+
+	ret = rkvdec_hevc_validate_sps(ctx, ctrl->p_new.p_hevc_sps);
+	if (ret)
+		return ret;
+
+	hevc_ctx = kzalloc(sizeof(*hevc_ctx), GFP_KERNEL);
+	if (!hevc_ctx)
+		return -ENOMEM;
+
+	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
+				      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
+	if (!priv_tbl) {
+		ret = -ENOMEM;
+		goto err_free_ctx;
+	}
+
+	hevc_ctx->priv_tbl.size = sizeof(*priv_tbl);
+	hevc_ctx->priv_tbl.cpu = priv_tbl;
+	memcpy(priv_tbl->cabac_table, rkvdec_hevc_cabac_table,
+	       sizeof(rkvdec_hevc_cabac_table));
+
+	ctx->priv = hevc_ctx;
+	return 0;
+
+err_free_ctx:
+	kfree(hevc_ctx);
+	return ret;
+}
+
+static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
+{
+	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
+	struct rkvdec_dev *rkvdec = ctx->dev;
+
+	dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
+			  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
+	kfree(hevc_ctx);
+}
+
+static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
+{
+	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_hevc_run run;
+	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
+	struct rkvdec_hevc_priv_tbl *tbl = hevc_ctx->priv_tbl.cpu;
+
+	rkvdec_hevc_run_preamble(ctx, &run);
+
+	/*
+	 * On vdpu381, not setting the long and short term ref sets will just output wrong frames.
+	 * Let's just warn about it and let the decoder run anyway.
+	 */
+	if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
+		(!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
+		dev_warn_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
+	}
+
+	rkvdec_hevc_assemble_hw_scaling_list(&run,
+					     &tbl->scaling_list,
+					     &hevc_ctx->scaling_matrix_cache);
+	assemble_hw_pps(ctx, &run);
+	rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
+
+	config_registers(ctx, &run);
+
+	rkvdec_run_postamble(ctx, &run.base);
+
+	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(2000));
+
+	/* Start decoding! */
+	writel(VDPU381_DEC_E_BIT, rkvdec->regs + VDPU381_REG_DEC_E);
+
+	return 0;
+}
+
+const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_hevc_fmt_ops = {
+	.adjust_fmt = rkvdec_hevc_adjust_fmt,
+	.start = rkvdec_hevc_start,
+	.stop = rkvdec_hevc_stop,
+	.run = rkvdec_hevc_run,
+	.try_ctrl = rkvdec_hevc_try_ctrl,
+	.get_image_fmt = rkvdec_hevc_get_image_fmt,
+};
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 1837f12f1aa1..b72cb07de70e 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -154,6 +154,16 @@ static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
 	enum rkvdec_image_fmt image_fmt;
 	struct vb2_queue *vq;
 
+	if (ctrl->id == V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS) {
+		ctx->has_sps_st_rps |= !!(ctrl->has_changed);
+		return 0;
+	}
+
+	if (ctrl->id == V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS) {
+		ctx->has_sps_lt_rps |= !!(ctrl->has_changed);
+		return 0;
+	}
+
 	/* Check if this change requires a capture format reset */
 	if (!desc->ops->get_image_fmt)
 		return 0;
@@ -285,6 +295,62 @@ static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
 	.num_ctrls = ARRAY_SIZE(rkvdec_h264_ctrl_descs),
 };
 
+static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] = {
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_SPS,
+		.cfg.ops = &rkvdec_ctrl_ops,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_PPS,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_DECODE_MODE,
+		.cfg.min = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
+		.cfg.max = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
+		.cfg.def = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_START_CODE,
+		.cfg.min = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
+		.cfg.def = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
+		.cfg.max = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
+	},
+	{
+		.cfg.id = V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+		.cfg.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.cfg.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+		.cfg.menu_skip_mask =
+			BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+		.cfg.def = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+	},
+	{
+		.cfg.id = V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+		.cfg.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+		.cfg.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
+		.cfg.ops = &rkvdec_ctrl_ops,
+		.cfg.dims = { 65 },
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
+		.cfg.ops = &rkvdec_ctrl_ops,
+		.cfg.dims = { 65 },
+	},
+};
+
+static const struct rkvdec_ctrls vdpu38x_hevc_ctrls = {
+	.ctrls = vdpu38x_hevc_ctrl_descs,
+	.num_ctrls = ARRAY_SIZE(vdpu38x_hevc_ctrl_descs),
+};
+
 static const struct rkvdec_decoded_fmt_desc rkvdec_h264_decoded_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12,
@@ -401,6 +467,23 @@ static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] = {
 		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
 		.capability = RKVDEC_CAPABILITY_H264,
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_HEVC_SLICE,
+		.frmsize = {
+			.min_width = 64,
+			.max_width = 65472,
+			.step_width = 64,
+			.min_height = 64,
+			.max_height = 65472,
+			.step_height = 16,
+		},
+		.ctrls = &vdpu38x_hevc_ctrls,
+		.ops = &rkvdec_vdpu381_hevc_fmt_ops,
+		.num_decoded_fmts = ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
+		.decoded_fmts = rkvdec_hevc_decoded_fmts,
+		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
+		.capability = RKVDEC_CAPABILITY_HEVC,
+	},
 };
 
 static const struct rkvdec_coded_fmt_desc vdpu383_coded_fmts[] = {
@@ -1500,7 +1583,8 @@ static const struct rkvdec_variant rk3399_rkvdec_variant = {
 
 static const struct rkvdec_variant rk3588_vdpu381_variant = {
 	.config = &config_vdpu381,
-	.capabilities = RKVDEC_CAPABILITY_H264,
+	.capabilities = RKVDEC_CAPABILITY_H264 |
+			RKVDEC_CAPABILITY_HEVC,
 };
 
 static const struct rkvdec_variant rk3576_vdpu383_variant = {
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index e752706e9f5c..94e2e6429992 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -156,6 +156,8 @@ struct rkvdec_ctx {
 	struct rkvdec_rcb_config *rcb_config;
 	u32 colmv_offset;
 	void *priv;
+	u8 has_sps_st_rps: 1;
+	u8 has_sps_lt_rps: 1;
 };
 
 static inline struct rkvdec_ctx *file_to_rkvdec_ctx(struct file *filp)
@@ -188,6 +190,7 @@ extern const struct rkvdec_coded_fmt_ops rkvdec_vp9_fmt_ops;
 
 /* VDPU381 ops */
 extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_h264_fmt_ops;
+extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_hevc_fmt_ops;
 
 /* VDPU383 ops */
 extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu383_h264_fmt_ops;
-- 
2.51.1.dirty


