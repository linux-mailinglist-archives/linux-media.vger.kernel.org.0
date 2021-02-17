Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B804F31D61F
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 09:06:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbhBQIFL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 03:05:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbhBQIEW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 03:04:22 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658B5C061756;
        Wed, 17 Feb 2021 00:03:42 -0800 (PST)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:fd6e:12cd:95d7:3350])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4AFDB1F44FF3;
        Wed, 17 Feb 2021 08:03:37 +0000 (GMT)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, krzk@kernel.org, shengjiu.wang@nxp.com,
        adrian.ratiu@collabora.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        Anson.Huang@nxp.com, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v1 04/18] media: hevc: add structures for hevc codec
Date:   Wed, 17 Feb 2021 09:02:52 +0100
Message-Id: <20210217080306.157876-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Define additional structures to be used by HEVC codecs.
This will allow to provide the needed information to the
hardware block.
Adapt Cedrus driver to use these new structures

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  6 +++
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |  2 +
 .../staging/media/sunxi/cedrus/cedrus_h265.c  |  6 ++-
 include/media/hevc-ctrls.h                    | 52 ++++++++++++++++---
 5 files changed, 57 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 7bd9291c8d5f..4cd3cab1a257 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -151,6 +151,12 @@ static const struct cedrus_control cedrus_controls[] = {
 		},
 		.codec		= CEDRUS_CODEC_VP8,
 	},
+	{
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS,
+		},
+		.codec		= CEDRUS_CODEC_H265,
+	},
 };
 
 #define CEDRUS_CONTROLS_COUNT	ARRAY_SIZE(cedrus_controls)
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 251a6a660351..c18b7f7a2820 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -76,6 +76,7 @@ struct cedrus_h265_run {
 	const struct v4l2_ctrl_hevc_sps			*sps;
 	const struct v4l2_ctrl_hevc_pps			*pps;
 	const struct v4l2_ctrl_hevc_slice_params	*slice_params;
+	const struct v4l2_ctrl_hevc_decode_params	*decode_params;
 };
 
 struct cedrus_vp8_run {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index a9090daf626a..cd821f417a14 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -68,6 +68,8 @@ void cedrus_device_run(void *priv)
 			V4L2_CID_MPEG_VIDEO_HEVC_PPS);
 		run.h265.slice_params = cedrus_find_control_data(ctx,
 			V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS);
+		run.h265.decode_params = cedrus_find_control_data(ctx,
+			V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS);
 		break;
 
 	case V4L2_PIX_FMT_VP8_FRAME:
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index ce497d0197df..dce5db6be13a 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -245,6 +245,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 	const struct v4l2_ctrl_hevc_sps *sps;
 	const struct v4l2_ctrl_hevc_pps *pps;
 	const struct v4l2_ctrl_hevc_slice_params *slice_params;
+	const struct v4l2_ctrl_hevc_decode_params *decode_params;
 	const struct v4l2_hevc_pred_weight_table *pred_weight_table;
 	dma_addr_t src_buf_addr;
 	dma_addr_t src_buf_end_addr;
@@ -256,6 +257,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 	sps = run->h265.sps;
 	pps = run->h265.pps;
 	slice_params = run->h265.slice_params;
+	decode_params = run->h265.decode_params;
 	pred_weight_table = &slice_params->pred_weight_table;
 
 	/* MV column buffer size and allocation. */
@@ -487,7 +489,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 
 	reg = VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_TC_OFFSET_DIV2(slice_params->slice_tc_offset_div2) |
 	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_BETA_OFFSET_DIV2(slice_params->slice_beta_offset_div2) |
-	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_POC_BIGEST_IN_RPS_ST(slice_params->num_rps_poc_st_curr_after == 0) |
+	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_POC_BIGEST_IN_RPS_ST(decode_params->num_rps_poc_st_curr_after == 0) |
 	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_CR_QP_OFFSET(slice_params->slice_cr_qp_offset) |
 	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_CB_QP_OFFSET(slice_params->slice_cb_qp_offset) |
 	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_QP_DELTA(slice_params->slice_qp_delta);
@@ -528,7 +530,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 
 	/* Write decoded picture buffer in pic list. */
 	cedrus_h265_frame_info_write_dpb(ctx, slice_params->dpb,
-					 slice_params->num_active_dpb_entries);
+					 decode_params->num_active_dpb_entries);
 
 	/* Output frame. */
 
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index ce503bbcb441..799c81612242 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -58,6 +58,9 @@ enum v4l2_mpeg_video_hevc_start_code {
 /* The controls are not stable at the moment and will likely be reworked. */
 struct v4l2_ctrl_hevc_sps {
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Sequence parameter set */
+	__u8	video_parameter_set_id;
+	__u8	seq_parameter_set_id;
+	__u8	chroma_format_idc;
 	__u16	pic_width_in_luma_samples;
 	__u16	pic_height_in_luma_samples;
 	__u8	bit_depth_luma_minus8;
@@ -78,9 +81,9 @@ struct v4l2_ctrl_hevc_sps {
 	__u8	log2_diff_max_min_pcm_luma_coding_block_size;
 	__u8	num_short_term_ref_pic_sets;
 	__u8	num_long_term_ref_pics_sps;
-	__u8	chroma_format_idc;
 
-	__u8	padding;
+	__u8	num_slices;
+	__u8	padding[6];
 
 	__u64	flags;
 };
@@ -104,10 +107,15 @@ struct v4l2_ctrl_hevc_sps {
 #define V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER	(1ULL << 16)
 #define V4L2_HEVC_PPS_FLAG_LISTS_MODIFICATION_PRESENT		(1ULL << 17)
 #define V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT (1ULL << 18)
+#define V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT	(1ULL << 19)
+#define V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING			(1ULL << 20)
 
 struct v4l2_ctrl_hevc_pps {
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Picture parameter set */
+	__u8	pic_parameter_set_id;
 	__u8	num_extra_slice_header_bits;
+	__u8	num_ref_idx_l0_default_active_minus1;
+	__u8	num_ref_idx_l1_default_active_minus1;
 	__s8	init_qp_minus26;
 	__u8	diff_cu_qp_delta_depth;
 	__s8	pps_cb_qp_offset;
@@ -120,7 +128,7 @@ struct v4l2_ctrl_hevc_pps {
 	__s8	pps_tc_offset_div2;
 	__u8	log2_parallel_merge_level_minus2;
 
-	__u8	padding[4];
+	__u8	padding;
 	__u64	flags;
 };
 
@@ -169,6 +177,10 @@ struct v4l2_ctrl_hevc_slice_params {
 	__u32	bit_size;
 	__u32	data_bit_offset;
 
+	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
+	__u32	slice_segment_addr;
+	__u32	num_entry_point_offsets;
+
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: NAL unit header */
 	__u8	nal_unit_type;
 	__u8	nuh_temporal_id_plus1;
@@ -194,15 +206,13 @@ struct v4l2_ctrl_hevc_slice_params {
 	__u8	pic_struct;
 
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
-	__u8	num_active_dpb_entries;
 	__u8	ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
 	__u8	ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
 
-	__u8	num_rps_poc_st_curr_before;
-	__u8	num_rps_poc_st_curr_after;
-	__u8	num_rps_poc_lt_curr;
+	__u16	short_term_ref_pic_set_size;
+	__u16	long_term_ref_pic_set_size;
 
-	__u8	padding;
+	__u8	padding[5];
 
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
 	struct v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
@@ -213,4 +223,30 @@ struct v4l2_ctrl_hevc_slice_params {
 	__u64	flags;
 };
 
+#define V4L2_HEVC_DECODE_PARAM_FLAG_IRAP_PIC		0x1
+#define V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC		0x2
+#define V4L2_HEVC_DECODE_PARAM_FLAG_NO_OUTPUT_OF_PRIOR  0x4
+
+struct v4l2_ctrl_hevc_decode_params {
+	__s32	pic_order_cnt_val;
+	__u8	num_active_dpb_entries;
+	struct	v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__u8	num_rps_poc_st_curr_before;
+	__u8	num_rps_poc_st_curr_after;
+	__u8	num_rps_poc_lt_curr;
+	__u8	rps_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__u8	rps_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__u8	rps_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__u64	flags;
+};
+
+struct v4l2_ctrl_hevc_scaling_matrix {
+	__u8	scaling_list_4x4[6][16];
+	__u8	scaling_list_8x8[6][64];
+	__u8	scaling_list_16x16[6][64];
+	__u8	scaling_list_32x32[2][64];
+	__u8	scaling_list_dc_coef_16x16[6];
+	__u8	scaling_list_dc_coef_32x32[2];
+};
+
 #endif
-- 
2.25.1

