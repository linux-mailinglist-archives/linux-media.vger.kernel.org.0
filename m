Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2D82DBB90
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 07:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgLPGu7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 01:50:59 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:45606 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgLPGu7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 01:50:59 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 15 Dec 2020 22:50:18 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 15 Dec 2020 22:50:16 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 16 Dec 2020 12:20:02 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id D2BCB2142E; Wed, 16 Dec 2020 12:20:01 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v2] venus: venc: set inband mode property to FW.
Date:   Wed, 16 Dec 2020 12:19:48 +0530
Message-Id: <1608101388-31810-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

set HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER to FW
to support inband sequence header mode.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>

Changes since v1:
- added codec check 
- fixed the mask while initializing the control

---
 drivers/media/platform/qcom/venus/venc_ctrls.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index cf860e6..a94f5fd 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -157,7 +157,17 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		ctr->h264_loop_filter_mode = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
-		ctr->header_mode = ctrl->val;
+		if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
+		    inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
+			if (ctrl->val == V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
+				en.enable = 0;
+			else
+				en.enable = 1;
+			ptype = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER;
+			ret = hfi_session_set_property(inst, ptype, &en);
+			if (ret)
+				return ret;
+		}
 		break;
 	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:
 		break;
@@ -289,7 +299,8 @@ int venc_ctrl_init(struct venus_inst *inst)
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

