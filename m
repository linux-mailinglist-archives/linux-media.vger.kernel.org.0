Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93A1734751F
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 10:55:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235192AbhCXJzL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 05:55:11 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:48975 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235127AbhCXJy6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 05:54:58 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 24 Mar 2021 02:54:58 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Mar 2021 02:54:56 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 24 Mar 2021 15:24:39 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 1582521694; Wed, 24 Mar 2021 15:24:38 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v10 2/2] venus: venc: Add support for Long Term Reference (LTR) controls
Date:   Wed, 24 Mar 2021 15:24:32 +0530
Message-Id: <1616579672-13898-3-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616579672-13898-1-git-send-email-dikshita@codeaurora.org>
References: <1616579672-13898-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for below LTR controls in encoder:
- V4L2_CID_MPEG_VIDEO_LTR_COUNT
- V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX
- V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/venc.c       |  9 +++++
 drivers/media/platform/qcom/venus/venc_ctrls.c | 48 +++++++++++++++++++++++++-
 3 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index a252ed3..9451e54 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -238,6 +238,8 @@ struct venc_controls {
 	} level;
 
 	u32 base_priority_id;
+
+	u32 ltr_count;
 };
 
 struct venus_buffer {
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 6976ed5..508af44 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -546,6 +546,7 @@ static int venc_set_properties(struct venus_inst *inst)
 	struct hfi_quantization quant;
 	struct hfi_quantization_range quant_range;
 	struct hfi_enable en;
+	struct hfi_ltr_mode ltr_mode;
 	u32 ptype, rate_control, bitrate;
 	u32 profile, level;
 	int ret;
@@ -722,6 +723,14 @@ static int venc_set_properties(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
+	ptype = HFI_PROPERTY_PARAM_VENC_LTRMODE;
+		ltr_mode.ltr_count = ctr->ltr_count;
+		ltr_mode.ltr_mode = HFI_LTR_MODE_MANUAL;
+		ltr_mode.trust_mode = 1;
+		ret = hfi_session_set_property(inst, ptype, &ltr_mode);
+		if (ret)
+			return ret;
+
 	switch (inst->hfi_codec) {
 	case HFI_VIDEO_CODEC_H264:
 		profile = ctr->profile.h264;
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index a52b800..1f2d8183 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -20,6 +20,7 @@
 #define INTRA_REFRESH_MBS_MAX	300
 #define AT_SLICE_BOUNDARY	\
 	V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY
+#define MAX_LTR_FRAME_COUNT 4
 
 static int venc_calc_bpframes(u32 gop_size, u32 conseq_b, u32 *bf, u32 *pf)
 {
@@ -72,6 +73,8 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct venc_controls *ctr = &inst->controls.enc;
 	struct hfi_enable en = { .enable = 1 };
 	struct hfi_bitrate brate;
+	struct hfi_ltr_use ltr_use;
+	struct hfi_ltr_mark ltr_mark;
 	u32 bframes;
 	u32 ptype;
 	int ret;
@@ -276,6 +279,37 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID:
 		ctr->base_priority_id = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
+		ctr->ltr_count = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
+		mutex_lock(&inst->lock);
+		if (inst->streamon_out && inst->streamon_cap) {
+			ptype = HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME;
+			ltr_mark.mark_frame = ctrl->val;
+			ret = hfi_session_set_property(inst, ptype, &ltr_mark);
+			if (ret) {
+				mutex_unlock(&inst->lock);
+				return ret;
+			}
+		}
+		mutex_unlock(&inst->lock);
+		break;
+	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
+		mutex_lock(&inst->lock);
+		if (inst->streamon_out && inst->streamon_cap) {
+			ptype = HFI_PROPERTY_CONFIG_VENC_USELTRFRAME;
+			ltr_use.ref_ltr = ctrl->val;
+			ltr_use.use_constrnt = true;
+			ltr_use.frames = 0;
+			ret = hfi_session_set_property(inst, ptype, &ltr_use);
+			if (ret) {
+				mutex_unlock(&inst->lock);
+				return ret;
+			}
+		}
+		mutex_unlock(&inst->lock);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -291,7 +325,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 51);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 54);
 	if (ret)
 		return ret;
 
@@ -498,6 +532,18 @@ int venc_ctrl_init(struct venus_inst *inst)
 			  V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID, 0,
 			  6, 1, 0);
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES, 0,
+			  ((1 << MAX_LTR_FRAME_COUNT) - 1), 1, 0);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_LTR_COUNT, 0,
+			  MAX_LTR_FRAME_COUNT, 1, 0);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX, 0,
+			  (MAX_LTR_FRAME_COUNT - 1), 1, 0);
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.7.4

