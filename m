Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D872B7698
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 07:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbgKRGzd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 01:55:33 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:26429 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgKRGzc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 01:55:32 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 17 Nov 2020 22:55:30 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 17 Nov 2020 22:55:28 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 18 Nov 2020 12:25:22 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 93143212C6; Wed, 18 Nov 2020 12:25:21 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        nicolas@ndufresne.ca, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v3 3/3] venus: venc: Add support for frame-specific min/max qp controls
Date:   Wed, 18 Nov 2020 12:24:57 +0530
Message-Id: <1605682497-29273-4-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605682497-29273-1-git-send-email-dikshita@codeaurora.org>
References: <1605682497-29273-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for frame type specific min and max qp controls
for encoder.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.h       | 18 +++++++++
 drivers/media/platform/qcom/venus/venc.c       | 21 ++++++++---
 drivers/media/platform/qcom/venus/venc_ctrls.c | 51 ++++++++++++++++++++++++++
 3 files changed, 85 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 3bc129a..6a764c9 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -230,10 +230,28 @@ struct venc_controls {
 	u32 h264_b_qp;
 	u32 h264_min_qp;
 	u32 h264_max_qp;
+	u32 h264_i_min_qp;
+	u32 h264_i_max_qp;
+	u32 h264_p_min_qp;
+	u32 h264_p_max_qp;
+	u32 h264_b_min_qp;
+	u32 h264_b_max_qp;
 	u32 h264_loop_filter_mode;
 	s32 h264_loop_filter_alpha;
 	s32 h264_loop_filter_beta;
 
+	u32 hevc_i_qp;
+	u32 hevc_p_qp;
+	u32 hevc_b_qp;
+	u32 hevc_min_qp;
+	u32 hevc_max_qp;
+	u32 hevc_i_min_qp;
+	u32 hevc_i_max_qp;
+	u32 hevc_p_min_qp;
+	u32 hevc_p_max_qp;
+	u32 hevc_b_min_qp;
+	u32 hevc_b_max_qp;
+
 	u32 vp8_min_qp;
 	u32 vp8_max_qp;
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 0bf92cc..f2f5a85 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -668,17 +668,28 @@ static int venc_set_properties(struct venus_inst *inst)
 		return ret;
 
 	ptype = HFI_PROPERTY_PARAM_VENC_SESSION_QP;
-	quant.qp_i = ctr->h264_i_qp;
-	quant.qp_p = ctr->h264_p_qp;
-	quant.qp_b = ctr->h264_b_qp;
+	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
+		quant.qp_i = ctr->hevc_i_qp;
+		quant.qp_p = ctr->hevc_p_qp;
+		quant.qp_b = ctr->hevc_b_qp;
+	} else {
+		quant.qp_i = ctr->h264_i_qp;
+		quant.qp_p = ctr->h264_p_qp;
+		quant.qp_b = ctr->h264_b_qp;
+	}
 	quant.layer_id = 0;
 	ret = hfi_session_set_property(inst, ptype, &quant);
 	if (ret)
 		return ret;
 
 	ptype = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE;
-	quant_range.min_qp = ctr->h264_min_qp;
-	quant_range.max_qp = ctr->h264_max_qp;
+	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
+		quant_range.min_qp = ctr->hevc_min_qp;
+		quant_range.max_qp = ctr->hevc_max_qp;
+	} else {
+		quant_range.min_qp = ctr->h264_min_qp;
+		quant_range.max_qp = ctr->h264_max_qp;
+	}
 	quant_range.layer_id = 0;
 	ret = hfi_session_set_property(inst, ptype, &quant_range);
 	if (ret)
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 0708b3b..cd131e3 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -125,9 +125,60 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
 		ctr->h264_min_qp = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP:
+		ctr->h264_i_min_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP:
+		ctr->h264_p_min_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP:
+		ctr->h264_b_min_qp = ctrl->val;
+		break;
 	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:
 		ctr->h264_max_qp = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP:
+		ctr->h264_i_max_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP:
+		ctr->h264_p_max_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP:
+		ctr->h264_b_max_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:
+		ctr->hevc_i_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP:
+		ctr->hevc_p_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
+		ctr->hevc_b_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:
+		ctr->hevc_min_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP:
+		ctr->hevc_i_min_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP:
+		ctr->hevc_p_min_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP:
+		ctr->hevc_b_min_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP:
+		ctr->hevc_max_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP:
+		ctr->hevc_i_max_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP:
+		ctr->hevc_p_max_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP:
+		ctr->hevc_b_max_qp = ctrl->val;
+		break;
 	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
 		ctr->multi_slice_mode = ctrl->val;
 		break;
-- 
2.7.4

