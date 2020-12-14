Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8692D9E10
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 18:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730877AbgLNRqV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 12:46:21 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:37176 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407357AbgLNRqU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 12:46:20 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 14 Dec 2020 09:45:34 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Dec 2020 09:45:32 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 14 Dec 2020 23:15:18 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id A250721300; Mon, 14 Dec 2020 23:15:17 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH] venus: venc: set inband mode property to FW.
Date:   Mon, 14 Dec 2020 23:14:29 +0530
Message-Id: <1607967869-1041-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

set HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER to FW
to support inband sequence header mode.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/venc_ctrls.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index cf860e6..12dfe7d 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -157,7 +157,20 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		ctr->h264_loop_filter_mode = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
-		ctr->header_mode = ctrl->val;
+		switch (ctrl->val) {
+		case V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE:
+			en.enable = 0;
+			break;
+		case V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME:
+			en.enable = 1;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		ptype = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER;
+		ret = hfi_session_set_property(inst, ptype, &en);
+		if (ret)
+			return ret;
 		break;
 	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:
 		break;
-- 
2.7.4

