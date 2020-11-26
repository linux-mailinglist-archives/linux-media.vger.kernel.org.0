Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31B02C5167
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 10:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389606AbgKZJhJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 04:37:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389572AbgKZJhJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 04:37:09 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E04C0613D4;
        Thu, 26 Nov 2020 01:37:08 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1B49A1F4575B
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v5 07/14] media: controls: Validate H264 stateless controls
Date:   Thu, 26 Nov 2020 06:36:11 -0300
Message-Id: <20201126093618.137292-8-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201126093618.137292-1-ezequiel@collabora.com>
References: <20201126093618.137292-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check that all the fields that correspond or are related
to a H264 specification syntax element have legal values.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Tested-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 134 +++++++++++++++++++++++++++
 include/media/h264-ctrls.h           |   9 ++
 2 files changed, 143 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 88ad475bd716..6a17a7487459 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1775,6 +1775,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 {
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
 	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
+	struct v4l2_ctrl_h264_sps *p_h264_sps;
+	struct v4l2_ctrl_h264_pps *p_h264_pps;
+	struct v4l2_ctrl_h264_pred_weights *p_h264_pred_weights;
 	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
 	struct v4l2_ctrl_h264_decode_params *p_h264_dec_params;
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
@@ -1834,20 +1837,151 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		break;
 
 	case V4L2_CTRL_TYPE_H264_SPS:
+		p_h264_sps = p;
+
+		/* Some syntax elements are only conditionally valid */
+		if (p_h264_sps->pic_order_cnt_type != 0) {
+			p_h264_sps->log2_max_pic_order_cnt_lsb_minus4 = 0;
+		} else if (p_h264_sps->pic_order_cnt_type != 1) {
+			p_h264_sps->num_ref_frames_in_pic_order_cnt_cycle = 0;
+			p_h264_sps->offset_for_non_ref_pic = 0;
+			p_h264_sps->offset_for_top_to_bottom_field = 0;
+			memset(&p_h264_sps->offset_for_ref_frame, 0,
+			       sizeof(p_h264_sps->offset_for_ref_frame));
+		}
+
+		if (!V4L2_H264_SPS_HAS_CHROMA_FORMAT(p_h264_sps)) {
+			p_h264_sps->chroma_format_idc = 1;
+			p_h264_sps->bit_depth_luma_minus8 = 0;
+			p_h264_sps->bit_depth_chroma_minus8 = 0;
+
+			p_h264_sps->flags &=
+				~V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS;
+
+			if (p_h264_sps->chroma_format_idc < 3)
+				p_h264_sps->flags &=
+					~V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE;
+		}
+
+		if (p_h264_sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY)
+			p_h264_sps->flags &=
+				~V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD;
+
+		/*
+		 * Chroma 4:2:2 format require at least High 4:2:2 profile.
+		 *
+		 * The H264 specification and well-known parser implementations
+		 * use profile-idc values directly, as that is clearer and
+		 * less ambiguous. We do the same here.
+		 */
+		if (p_h264_sps->profile_idc < 122 &&
+		    p_h264_sps->chroma_format_idc > 1)
+			return -EINVAL;
+		/* Chroma 4:4:4 format require at least High 4:2:2 profile */
+		if (p_h264_sps->profile_idc < 244 &&
+		    p_h264_sps->chroma_format_idc > 2)
+			return -EINVAL;
+		if (p_h264_sps->chroma_format_idc > 3)
+			return -EINVAL;
+
+		if (p_h264_sps->bit_depth_luma_minus8 > 6)
+			return -EINVAL;
+		if (p_h264_sps->bit_depth_chroma_minus8 > 6)
+			return -EINVAL;
+		if (p_h264_sps->log2_max_frame_num_minus4 > 12)
+			return -EINVAL;
+		if (p_h264_sps->pic_order_cnt_type > 2)
+			return -EINVAL;
+		if (p_h264_sps->log2_max_pic_order_cnt_lsb_minus4 > 12)
+			return -EINVAL;
+		if (p_h264_sps->max_num_ref_frames > V4L2_H264_REF_LIST_LEN)
+			return -EINVAL;
+		break;
+
 	case V4L2_CTRL_TYPE_H264_PPS:
+		p_h264_pps = p;
+
+		if (p_h264_pps->num_slice_groups_minus1 > 7)
+			return -EINVAL;
+		if (p_h264_pps->num_ref_idx_l0_default_active_minus1 >
+		    (V4L2_H264_REF_LIST_LEN - 1))
+			return -EINVAL;
+		if (p_h264_pps->num_ref_idx_l1_default_active_minus1 >
+		    (V4L2_H264_REF_LIST_LEN - 1))
+			return -EINVAL;
+		if (p_h264_pps->weighted_bipred_idc > 2)
+			return -EINVAL;
+		/*
+		 * pic_init_qp_minus26 shall be in the range of
+		 * -(26 + QpBdOffset_y) to +25, inclusive,
+		 *  where QpBdOffset_y is 6 * bit_depth_luma_minus8
+		 */
+		if (p_h264_pps->pic_init_qp_minus26 < -62 ||
+		    p_h264_pps->pic_init_qp_minus26 > 25)
+			return -EINVAL;
+		if (p_h264_pps->pic_init_qs_minus26 < -26 ||
+		    p_h264_pps->pic_init_qs_minus26 > 25)
+			return -EINVAL;
+		if (p_h264_pps->chroma_qp_index_offset < -12 ||
+		    p_h264_pps->chroma_qp_index_offset > 12)
+			return -EINVAL;
+		if (p_h264_pps->second_chroma_qp_index_offset < -12 ||
+		    p_h264_pps->second_chroma_qp_index_offset > 12)
+			return -EINVAL;
+		break;
+
 	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
+		break;
+
 	case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
+		p_h264_pred_weights = p;
+
+		if (p_h264_pred_weights->luma_log2_weight_denom > 7)
+			return -EINVAL;
+		if (p_h264_pred_weights->chroma_log2_weight_denom > 7)
+			return -EINVAL;
 		break;
 
 	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
 		p_h264_slice_params = p;
 
+		if (p_h264_slice_params->slice_type != V4L2_H264_SLICE_TYPE_B)
+			p_h264_slice_params->flags &=
+				~V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED;
+
+		if (p_h264_slice_params->colour_plane_id > 2)
+			return -EINVAL;
+		if (p_h264_slice_params->cabac_init_idc > 2)
+			return -EINVAL;
+		if (p_h264_slice_params->disable_deblocking_filter_idc > 2)
+			return -EINVAL;
+		if (p_h264_slice_params->slice_alpha_c0_offset_div2 < -6 ||
+		    p_h264_slice_params->slice_alpha_c0_offset_div2 > 6)
+			return -EINVAL;
+		if (p_h264_slice_params->slice_beta_offset_div2 < -6 ||
+		    p_h264_slice_params->slice_beta_offset_div2 > 6)
+			return -EINVAL;
+
+		if (p_h264_slice_params->slice_type == V4L2_H264_SLICE_TYPE_I ||
+		    p_h264_slice_params->slice_type == V4L2_H264_SLICE_TYPE_SI)
+			p_h264_slice_params->num_ref_idx_l0_active_minus1 = 0;
+		if (p_h264_slice_params->slice_type != V4L2_H264_SLICE_TYPE_B)
+			p_h264_slice_params->num_ref_idx_l1_active_minus1 = 0;
+
+		if (p_h264_slice_params->num_ref_idx_l0_active_minus1 >
+		    (V4L2_H264_REF_LIST_LEN - 1))
+			return -EINVAL;
+		if (p_h264_slice_params->num_ref_idx_l1_active_minus1 >
+		    (V4L2_H264_REF_LIST_LEN - 1))
+			return -EINVAL;
 		zero_reserved(*p_h264_slice_params);
 		break;
 
 	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
 		p_h264_dec_params = p;
 
+		if (p_h264_dec_params->nal_ref_idc > 3)
+			return -EINVAL;
 		for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
 			struct v4l2_h264_dpb_entry *dpb_entry =
 				&p_h264_dec_params->dpb[i];
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index f86345b8efd1..083899c3ea19 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -98,6 +98,15 @@ enum v4l2_mpeg_video_h264_start_code {
 #define V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD		0x20
 #define V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE			0x40
 
+#define V4L2_H264_SPS_HAS_CHROMA_FORMAT(sps) \
+	((sps)->profile_idc == 100 || (sps)->profile_idc == 110 || \
+	 (sps)->profile_idc == 122 || (sps)->profile_idc == 244 || \
+	 (sps)->profile_idc == 44  || (sps)->profile_idc == 83  || \
+	 (sps)->profile_idc == 86  || (sps)->profile_idc == 118 || \
+	 (sps)->profile_idc == 128 || (sps)->profile_idc == 138 || \
+	 (sps)->profile_idc == 139 || (sps)->profile_idc == 134 || \
+	 (sps)->profile_idc == 135)
+
 /**
  * struct v4l2_ctrl_h264_sps - H264 sequence parameter set
  *
-- 
2.27.0

