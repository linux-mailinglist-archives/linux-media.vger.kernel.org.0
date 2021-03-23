Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0CD3463CA
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 16:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232937AbhCWPzO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 11:55:14 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:23082 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232909AbhCWPy6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 11:54:58 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 23 Mar 2021 08:54:58 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Mar 2021 08:54:56 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 23 Mar 2021 21:24:41 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 3B6752168C; Tue, 23 Mar 2021 21:24:39 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v9 2/2] venus: venc: Add support for Long Term Reference (LTR) controls
Date:   Tue, 23 Mar 2021 21:24:27 +0530
Message-Id: <1616514867-16496-3-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616514867-16496-1-git-send-email-dikshita@codeaurora.org>
References: <1616514867-16496-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for below LTR controls in encoder:
- V4L2_CID_MPEG_VIDEO_LTR_COUNT
- V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX
- V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/venc_ctrls.c | 55 +++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index a52b800..bb4261b 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -20,6 +20,7 @@
 #define INTRA_REFRESH_MBS_MAX	300
 #define AT_SLICE_BOUNDARY	\
 	V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY
+#define MAX_LTR_FRAME_COUNT 4
 
 static int venc_calc_bpframes(u32 gop_size, u32 conseq_b, u32 *bf, u32 *pf)
 {
@@ -72,6 +73,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct venc_controls *ctr = &inst->controls.enc;
 	struct hfi_enable en = { .enable = 1 };
 	struct hfi_bitrate brate;
+	struct hfi_ltr_use ltr_use;
+	struct hfi_ltr_mark ltr_mark;
+	struct hfi_ltr_mode ltr_mode;
 	u32 bframes;
 	u32 ptype;
 	int ret;
@@ -276,6 +280,43 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID:
 		ctr->base_priority_id = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
+		ptype = HFI_PROPERTY_PARAM_VENC_LTRMODE;
+		ltr_mode.ltr_count = ctrl->val;
+		ltr_mode.ltr_mode = HFI_LTR_MODE_MANUAL;
+		ltr_mode.trust_mode = 1;
+		ret = hfi_session_set_property(inst, ptype, &ltr_mode);
+		if (ret)
+			return ret;
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
@@ -291,7 +332,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 51);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 54);
 	if (ret)
 		return ret;
 
@@ -498,6 +539,18 @@ int venc_ctrl_init(struct venus_inst *inst)
 			  V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID, 0,
 			  6, 1, 0);
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES, 0,
+			  (MAX_LTR_FRAME_COUNT - 1), 1, 0);
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

