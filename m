Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBECC3B8E9B
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 10:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235237AbhGAIIn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 04:08:43 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:13117 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235231AbhGAIIm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 04:08:42 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 01 Jul 2021 01:06:12 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 01 Jul 2021 01:06:10 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 01 Jul 2021 13:36:09 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id C4FF321A36; Thu,  1 Jul 2021 13:36:08 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v2 6/7] media: venus: helpers: update NUM_MBS macro calculation
Date:   Thu,  1 Jul 2021 13:35:35 +0530
Message-Id: <1625126736-16266-7-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625126736-16266-1-git-send-email-dikshita@codeaurora.org>
References: <1625126736-16266-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Consider alignment while calculating NUM_MBS.

Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 2223f55..ccf188a 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -18,8 +18,8 @@
 #include "hfi_platform.h"
 #include "hfi_parser.h"
 
-#define NUM_MBS_720P	(((1280 + 15) >> 4) * ((720 + 15) >> 4))
-#define NUM_MBS_4K	(((4096 + 15) >> 4) * ((2304 + 15) >> 4))
+#define NUM_MBS_720P	(((ALIGN(1280, 16)) >> 4) * ((ALIGN(736, 16)) >> 4))
+#define NUM_MBS_4K	(((ALIGN(4096, 16)) >> 4) * ((ALIGN(2304, 16)) >> 4))
 
 struct intbuf {
 	struct list_head list;
@@ -1099,16 +1099,17 @@ static u32 venus_helper_get_work_mode(struct venus_inst *inst)
 	u32 num_mbs;
 
 	mode = VIDC_WORK_MODE_2;
+
 	if (inst->session_type == VIDC_SESSION_TYPE_DEC) {
-		num_mbs = (ALIGN(inst->height, 16) * ALIGN(inst->width, 16)) / 256;
+		num_mbs = ((ALIGN(inst->height, 16))/16 * (ALIGN(inst->width, 16)))/16;
 		if (inst->hfi_codec == HFI_VIDEO_CODEC_MPEG2 ||
-		    inst->pic_struct != HFI_INTERLACE_FRAME_PROGRESSIVE ||
-		    num_mbs <= NUM_MBS_720P)
+			inst->pic_struct != HFI_INTERLACE_FRAME_PROGRESSIVE ||
+			num_mbs <= NUM_MBS_720P)
 			mode = VIDC_WORK_MODE_1;
 	} else {
 		num_mbs = (ALIGN(inst->out_height, 16) * ALIGN(inst->out_width, 16)) / 256;
 		if (inst->hfi_codec == HFI_VIDEO_CODEC_VP8 &&
-		    num_mbs <= NUM_MBS_4K)
+			num_mbs <= NUM_MBS_4K)
 			mode = VIDC_WORK_MODE_1;
 	}
 
-- 
2.7.4

