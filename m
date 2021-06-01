Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9373954FE
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 07:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhEaFYA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 01:24:00 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:17589 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbhEaFX7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 01:23:59 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 30 May 2021 22:22:20 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 30 May 2021 22:22:18 -0700
X-QCInternal: smtphost
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 31 May 2021 10:52:00 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 7043222586; Mon, 31 May 2021 10:51:59 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, mansur@codeaurora.org,
        dikshita@codeaurora.org
Subject: [PATCH] venus: venc: add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control
Date:   Mon, 31 May 2021 10:51:54 +0530
Message-Id: <1622438514-16657-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control for
H264 high profile and constrained high profile.

Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.h       |  1 +
 drivers/media/platform/qcom/venus/hfi_cmds.c   | 10 ++++++++++
 drivers/media/platform/qcom/venus/hfi_helper.h |  5 +++++
 drivers/media/platform/qcom/venus/venc.c       | 11 +++++++++++
 drivers/media/platform/qcom/venus/venc_ctrls.c | 12 +++++++++++-
 5 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 745f226..103fbd8 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -235,6 +235,7 @@ struct venc_controls {
 	u32 h264_loop_filter_mode;
 	s32 h264_loop_filter_alpha;
 	s32 h264_loop_filter_beta;
+	u32 h264_8x8_transform;
 
 	u32 hevc_i_qp;
 	u32 hevc_p_qp;
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 11a8347..61d04a5 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -1178,6 +1178,7 @@ pkt_session_set_property_4xx(struct hfi_session_set_property_pkt *pkt,
 {
 	void *prop_data;
 
+
 	if (!pkt || !cookie || !pdata)
 		return -EINVAL;
 
@@ -1227,6 +1228,15 @@ pkt_session_set_property_4xx(struct hfi_session_set_property_pkt *pkt,
 		break;
 	}
 
+	case HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8: {
+		struct hfi_h264_8x8x_transform *in = pdata, *tm = prop_data;
+
+		tm->enable_type = in->enable_type;
+		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*tm);
+		break;
+
+	}
+
 	case HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE:
 	case HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER:
 	case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE:
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 63cd347..81d0536 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -510,6 +510,7 @@
 #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
 #define HFI_PROPERTY_PARAM_VENC_H264_VUI_BITSTREAM_RESTRC	0x2005021
 #define HFI_PROPERTY_PARAM_VENC_PRESERVE_TEXT_QUALITY		0x2005023
+#define HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8			0x2005025
 #define HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER	0x2005026
 #define HFI_PROPERTY_PARAM_VENC_DISABLE_RC_TIMESTAMP		0x2005027
 #define HFI_PROPERTY_PARAM_VENC_INITIAL_QP			0x2005028
@@ -565,6 +566,10 @@ struct hfi_bitrate {
 	u32 layer_id;
 };
 
+struct hfi_h264_8x8x_transform {
+	u32 enable_type;
+};
+
 #define HFI_CAPABILITY_FRAME_WIDTH			0x01
 #define HFI_CAPABILITY_FRAME_HEIGHT			0x02
 #define HFI_CAPABILITY_MBS_PER_FRAME			0x03
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 8dd49d4..4ecf331 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -567,6 +567,7 @@ static int venc_set_properties(struct venus_inst *inst)
 		struct hfi_h264_vui_timing_info info;
 		struct hfi_h264_entropy_control entropy;
 		struct hfi_h264_db_control deblock;
+		struct hfi_h264_8x8x_transform h264_transform;
 
 		ptype = HFI_PROPERTY_PARAM_VENC_H264_VUI_TIMING_INFO;
 		info.enable = 1;
@@ -597,6 +598,16 @@ static int venc_set_properties(struct venus_inst *inst)
 		ret = hfi_session_set_property(inst, ptype, &deblock);
 		if (ret)
 			return ret;
+
+		ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
+		if (ctr->profile.h264 == HFI_H264_PROFILE_HIGH ||
+			ctr->profile.h264 == HFI_H264_PROFILE_CONSTRAINED_HIGH)
+			h264_transform.enable_type = ctr->h264_8x8_transform;
+
+		ret = hfi_session_set_property(inst, ptype, &h264_transform);
+		if (ret)
+			return ret;
+
 	}
 
 	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 637c92f..e3ef611 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -319,6 +319,13 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		ctr->mastering = *ctrl->p_new.p_hdr10_mastering;
 		break;
+	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
+		if (ctr->profile.h264 != HFI_H264_PROFILE_HIGH ||
+			ctr->profile.h264 != HFI_H264_PROFILE_CONSTRAINED_HIGH)
+			return -EINVAL;
+
+		ctr->h264_8x8_transform = ctrl->val;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -334,7 +341,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 57);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 58);
 	if (ret)
 		return ret;
 
@@ -438,6 +445,9 @@ int venc_ctrl_init(struct venus_inst *inst)
 			  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP, 1, 51, 1, 1);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+		V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM, 0, 1, 1, 0);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP, 1, 51, 1, 1);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

