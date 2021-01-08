Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D142EEDAF
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 08:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbhAHHFO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 02:05:14 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:9371 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbhAHHFO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 02:05:14 -0500
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 07 Jan 2021 23:04:33 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 07 Jan 2021 23:04:31 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 08 Jan 2021 12:34:19 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id DD17B2149A; Fri,  8 Jan 2021 12:34:17 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v3] venus: venc: set inband mode property to FW.
Date:   Fri,  8 Jan 2021 12:34:03 +0530
Message-Id: <1610089443-16420-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

set HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER to FW
to support inband sequence header mode.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>

Changes since v2:
- fixed Null pointer dereference (Stanimir, Fritz)
- added set property call at correct place.
---
 drivers/media/platform/qcom/venus/venc.c       | 14 ++++++++++++++
 drivers/media/platform/qcom/venus/venc_ctrls.c | 17 ++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 3a2e449..bd6597c 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -536,6 +536,7 @@ static int venc_set_properties(struct venus_inst *inst)
 	struct hfi_idr_period idrp;
 	struct hfi_quantization quant;
 	struct hfi_quantization_range quant_range;
+	struct hfi_enable en;
 	u32 ptype, rate_control, bitrate;
 	u32 profile, level;
 	int ret;
@@ -655,6 +656,19 @@ static int venc_set_properties(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
+	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
+		inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
+		ptype = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER;
+		if (ctr->header_mode == V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
+			en.enable = 0;
+		else
+			en.enable = 1;
+
+		ret = hfi_session_set_property(inst, ptype, &en);
+		if (ret)
+			return ret;
+	}
+
 	if (!ctr->bitrate_peak)
 		bitrate *= 2;
 	else
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index cf860e6..3ce02ad 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -158,6 +158,20 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
 		ctr->header_mode = ctrl->val;
+		mutex_lock(&inst->lock);
+		if (inst->streamon_out && inst->streamon_cap) {
+			if (ctrl->val == V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
+				en.enable = 0;
+			else
+				en.enable = 1;
+			ptype = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER;
+			ret = hfi_session_set_property(inst, ptype, &en);
+			if (ret) {
+				mutex_unlock(&inst->lock);
+				return ret;
+			}
+		}
+		mutex_unlock(&inst->lock);
 		break;
 	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:
 		break;
@@ -289,7 +303,8 @@ int venc_ctrl_init(struct venus_inst *inst)
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
 		V4L2_CID_MPEG_VIDEO_HEADER_MODE,
 		V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
-		1 << V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		~((1 << V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
+		(1 << V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME)),
 		V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE);
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
-- 
2.7.4

