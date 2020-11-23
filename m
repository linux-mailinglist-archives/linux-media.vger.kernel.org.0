Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE922C0DF3
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 15:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730909AbgKWOkr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 09:40:47 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34912 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730182AbgKWOkp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 09:40:45 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 3EA591F449A6
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
Subject: [PATCH v4 07/13] media: controls: Validate H264 stateless controls
Date:   Mon, 23 Nov 2020 11:39:54 -0300
Message-Id: <20201123144000.81310-8-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201123144000.81310-1-ezequiel@collabora.com>
References: <20201123144000.81310-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check that all the fields that correspond or are related
to a H264 specification syntax element have legal values.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 128 +++++++++++++++++++++++++++
 include/media/h264-ctrls.h           |   9 ++
 2 files changed, 137 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 88ad475bd716..7b4f5ca91b86 100644
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
@@ -1834,20 +1837,145 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
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
+		/* Only monochrome and 4:2:0 allowed for these profiles */
+		if (p_h264_sps->profile_idc < V4L2_H264_PROFILE_IDC_HIGH_422 &&
+		    p_h264_sps->chroma_format_idc > 1)
+			return -EINVAL;
+		/* 4:2:2 allowed */
+		if (p_h264_sps->profile_idc < V4L2_H264_PROFILE_IDC_HIGH_444 &&
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
index e14307f1a77c..0bd253031ab5 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -105,6 +105,15 @@ enum v4l2_mpeg_video_h264_start_code {
 #define V4L2_H264_PROFILE_IDC_HIGH_422                          122
 #define V4L2_H264_PROFILE_IDC_HIGH_444                          244
 
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

