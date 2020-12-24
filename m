Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654F02E265D
	for <lists+linux-media@lfdr.de>; Thu, 24 Dec 2020 12:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbgLXL1n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Dec 2020 06:27:43 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:43131 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728033AbgLXL1n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Dec 2020 06:27:43 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 24 Dec 2020 03:26:25 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Dec 2020 03:26:23 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 24 Dec 2020 16:56:20 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id ACB142146B; Thu, 24 Dec 2020 16:56:19 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        nicolas@ndufresne.ca, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v4 3/3] venus: venc: Add support for frame-specific min/max qp controls
Date:   Thu, 24 Dec 2020 16:55:35 +0530
Message-Id: <1608809135-26061-4-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608809135-26061-1-git-send-email-dikshita@codeaurora.org>
References: <1608809135-26061-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for frame type specific min and max qp controls
for encoder.
This is a preparation patch to support v6.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.h       |  18 ++++
 drivers/media/platform/qcom/venus/venc.c       |  21 +++--
 drivers/media/platform/qcom/venus/venc_ctrls.c | 114 +++++++++++++++++++++++--
 3 files changed, 142 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index f03ed42..54c42a3 100644
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
index 1c61602..3961e03 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -669,17 +669,28 @@ static int venc_set_properties(struct venus_inst *inst)
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
index cf860e6..496ad4d 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -135,9 +135,60 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -223,7 +274,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 33);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 50);
 	if (ret)
 		return ret;
 
@@ -311,19 +362,70 @@ int venc_ctrl_init(struct venus_inst *inst)
 		BITRATE_STEP, BITRATE_DEFAULT_PEAK);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP, 1, 51, 1, 26);
+			  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP, 1, 51, 1, 26);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP, 1, 51, 1, 28);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP, 1, 51, 1, 30);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_MIN_QP, 1, 51, 1, 1);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP, 1, 51, 1, 1);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP, 1, 51, 1, 1);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP, 1, 51, 1, 1);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_MAX_QP, 1, 51, 1, 51);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP, 1, 51, 1, 51);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP, 1, 51, 1, 51);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP, 1, 51, 1, 51);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP, 1, 63, 1, 26);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP, 1, 63, 1, 28);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP, 1, 63, 1, 30);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP, 1, 63, 1, 1);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP, 1, 63, 1, 1);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP, 1, 63, 1, 1);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP, 1, 63, 1, 1);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP, 1, 51, 1, 28);
+			  V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP, 1, 63, 1, 63);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP, 1, 51, 1, 30);
+			  V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP, 1, 63, 1, 63);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_MIN_QP, 1, 51, 1, 1);
+			  V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP, 1, 63, 1, 63);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_MAX_QP, 1, 51, 1, 51);
+			  V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP, 1, 63, 1, 63);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
 		V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES, SLICE_BYTE_SIZE_MIN,
-- 
2.7.4

