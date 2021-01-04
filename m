Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B69B2E9036
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 06:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbhADFm6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 00:42:58 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:54325 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbhADFm6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 00:42:58 -0500
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 03 Jan 2021 21:42:17 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Jan 2021 21:42:16 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 04 Jan 2021 11:12:03 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 7B12D214AD; Mon,  4 Jan 2021 11:12:02 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v4 2/2] venus: venc : Add support for priority ID control.
Date:   Mon,  4 Jan 2021 11:11:54 +0530
Message-Id: <1609738914-22769-3-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609738914-22769-1-git-send-email-dikshita@codeaurora.org>
References: <1609738914-22769-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for base layer priority ID control in
encoder.
This is a preparation patch to support v6.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.h       | 2 ++
 drivers/media/platform/qcom/venus/venc_ctrls.c | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 54c42a3..a346ddc 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -274,6 +274,8 @@ struct venc_controls {
 		u32 hevc;
 		u32 vp9;
 	} level;
+
+	u32 base_priority_id;
 };
 
 struct venus_buffer {
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 7d010d8..3ead51c 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -294,6 +294,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 			return ret;
 		}
 		break;
+	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID:
+		ctr->base_priority_id = ctrl->val;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -309,7 +312,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 53);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 54);
 	if (ret)
 		return ret;
 
@@ -523,6 +526,10 @@ int venc_ctrl_init(struct venus_inst *inst)
 			  V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX, 0,
 			  (MAX_LTR_FRAME_COUNT - 1), 1, 0);
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID, 0,
+			  6, 1, 0);
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.7.4

