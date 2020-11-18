Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E572B8419
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 19:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgKRSrr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 13:47:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgKRSrq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 13:47:46 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE763C0613D4;
        Wed, 18 Nov 2020 10:47:46 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A5E4F1F4499B
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
Subject: [PATCH v3 07/13] media: controls: Validate H264 stateless controls
Date:   Wed, 18 Nov 2020 15:46:54 -0300
Message-Id: <20201118184700.331213-8-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201118184700.331213-1-ezequiel@collabora.com>
References: <20201118184700.331213-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check that all the fields that correspond or are related
to a H264 specification syntax element have legal values.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 83 ++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 21c1928a9df8..adcf47bddbe3 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1775,6 +1775,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 {
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
 	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
+	struct v4l2_ctrl_h264_sps *p_h264_sps;
+	struct v4l2_ctrl_h264_pps *p_h264_pps;
+	struct v4l2_ctrl_h264_pred_weights *p_h264_pred_weigths;
 	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
 	struct v4l2_ctrl_h264_decode_params *p_h264_dec_params;
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
@@ -1834,20 +1837,100 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		break;
 
 	case V4L2_CTRL_TYPE_H264_SPS:
+		p_h264_sps = p;
+
+		/* Only monochrome and 4:2:0 allowed */
+		if (p_h264_sps->profile_idc < V4L2_H264_PROFILE_IDC_HIGH_422 &&
+		    p_h264_sps->chroma_format_idc > 1)
+				return -EINVAL;
+		/* 4:2:2 allowed */
+		else if (p_h264_sps->profile_idc < V4L2_H264_PROFILE_IDC_HIGH_444 &&
+			 p_h264_sps->chroma_format_idc > 2)
+				return -EINVAL;
+		else if (p_h264_sps->chroma_format_idc > 3)
+				return -EINVAL;
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
+		p_h264_pred_weigths = p;
+
+		if (p_h264_pred_weigths->luma_log2_weight_denom > 7)
+			return -EINVAL;
+		if (p_h264_pred_weigths->chroma_log2_weight_denom > 7)
+			return -EINVAL;
 		break;
 
 	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
 		p_h264_slice_params = p;
 
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
 		zero_reserved(*p_h264_slice_params);
 		break;
 
 	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
 		p_h264_dec_params = p;
 
+		if (p_h264_dec_params->nal_ref_idc > 3)
+			return -EINVAL;
 		for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
 			struct v4l2_h264_dpb_entry *dpb_entry =
 				&p_h264_dec_params->dpb[i];
-- 
2.27.0

