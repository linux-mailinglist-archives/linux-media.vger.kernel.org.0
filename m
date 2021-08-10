Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8A73E5774
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 11:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239295AbhHJJuC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 05:50:02 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:61815 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238838AbhHJJsw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 05:48:52 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 10 Aug 2021 02:48:30 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 10 Aug 2021 02:48:29 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 10 Aug 2021 15:18:15 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id F2B5D21CA3; Tue, 10 Aug 2021 15:18:14 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v4 6/7] media: venus: helpers: update NUM_MBS macro calculation
Date:   Tue, 10 Aug 2021 15:17:54 +0530
Message-Id: <1628588875-23790-7-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628588875-23790-1-git-send-email-dikshita@codeaurora.org>
References: <1628588875-23790-1-git-send-email-dikshita@codeaurora.org>
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
index 60a2775..2db33ba 100644
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
@@ -1098,16 +1098,17 @@ static u32 venus_helper_get_work_mode(struct venus_inst *inst)
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

