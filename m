Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E68E3021FA
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 06:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbhAYF6s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 00:58:48 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:4444 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbhAYFxJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 00:53:09 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 24 Jan 2021 21:52:28 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Jan 2021 21:52:26 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 25 Jan 2021 11:22:25 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 9C09621578; Mon, 25 Jan 2021 11:22:24 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v6 2/2] venus: venc: Add support for Long Term Reference (LTR) controls
Date:   Mon, 25 Jan 2021 11:21:59 +0530
Message-Id: <1611553919-17919-3-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611553919-17919-1-git-send-email-dikshita@codeaurora.org>
References: <1611553919-17919-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for below LTR controls in encoder:
- V4L2_CID_MPEG_VIDEO_LTR_COUNT
- V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX
- V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/venc_ctrls.c | 49 +++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 496ad4d..7d010d8 100644
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
@@ -259,6 +263,37 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
 		ctr->frame_skip_mode = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
+		ptype = HFI_PROPERTY_PARAM_VENC_LTRMODE;
+		ltr_mode.ltr_count = ctrl->val;
+		ltr_mode.ltr_mode = HFI_LTR_MODE_MANUAL;
+		ltr_mode.trust_mode = 1;
+		ret = hfi_session_set_property(inst, ptype, &ltr_mode);
+		if (ret) {
+			mutex_unlock(&inst->lock);
+			return ret;
+		}
+		break;
+	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
+		ptype = HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME;
+		ltr_mark.mark_frame = ctrl->val;
+		ret = hfi_session_set_property(inst, ptype, &ltr_mark);
+		if (ret) {
+			mutex_unlock(&inst->lock);
+			return ret;
+		}
+		break;
+	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
+		ptype = HFI_PROPERTY_CONFIG_VENC_USELTRFRAME;
+		ltr_use.ref_ltr = ctrl->val;
+		ltr_use.use_constrnt = true;
+		ltr_use.frames = 0;
+		ret = hfi_session_set_property(inst, ptype, &ltr_use);
+		if (ret) {
+			mutex_unlock(&inst->lock);
+			return ret;
+		}
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -274,7 +309,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 50);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 53);
 	if (ret)
 		return ret;
 
@@ -476,6 +511,18 @@ int venc_ctrl_init(struct venus_inst *inst)
 			       (1 << V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT)),
 			       V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED);
 
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

