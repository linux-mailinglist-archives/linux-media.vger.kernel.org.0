Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838622DBBD5
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 08:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbgLPHHv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 02:07:51 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:54488 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbgLPHHv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 02:07:51 -0500
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 15 Dec 2020 23:07:10 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 15 Dec 2020 23:07:07 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 16 Dec 2020 12:36:54 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 127FA2142E; Wed, 16 Dec 2020 12:36:52 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH] venus: venc: set IDR period to FW only for H264 & HEVC
Date:   Wed, 16 Dec 2020 12:36:50 +0530
Message-Id: <1608102410-23390-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HFI_PROPERTY_CONFIG_VENC_IDR_PERIOD is supported for only
H264 & HEVC codec. There is no need to set it for VP8 since
all key frames are treated as IDR frames for VP8.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/venc.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 3a2e449..618cf92 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -588,16 +588,19 @@ static int venc_set_properties(struct venus_inst *inst)
 			return ret;
 	}
 
-	/* IDR periodicity, n:
-	 * n = 0 - only the first I-frame is IDR frame
-	 * n = 1 - all I-frames will be IDR frames
-	 * n > 1 - every n-th I-frame will be IDR frame
-	 */
-	ptype = HFI_PROPERTY_CONFIG_VENC_IDR_PERIOD;
-	idrp.idr_period = 0;
-	ret = hfi_session_set_property(inst, ptype, &idrp);
-	if (ret)
-		return ret;
+	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
+	    inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
+		/* IDR periodicity, n:
+		 * n = 0 - only the first I-frame is IDR frame
+		 * n = 1 - all I-frames will be IDR frames
+		 * n > 1 - every n-th I-frame will be IDR frame
+		 */
+		ptype = HFI_PROPERTY_CONFIG_VENC_IDR_PERIOD;
+		idrp.idr_period = 0;
+		ret = hfi_session_set_property(inst, ptype, &idrp);
+		if (ret)
+			return ret;
+	}
 
 	if (ctr->num_b_frames) {
 		u32 max_num_b_frames = NUM_B_FRAMES_MAX;
-- 
2.7.4

