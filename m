Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D81639404B
	for <lists+linux-media@lfdr.de>; Fri, 28 May 2021 11:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235951AbhE1JuP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 May 2021 05:50:15 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:2534 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhE1JuP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 May 2021 05:50:15 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 28 May 2021 02:48:40 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 28 May 2021 02:48:38 -0700
X-QCInternal: smtphost
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg01-blr.qualcomm.com with ESMTP; 28 May 2021 15:18:20 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 9E5DD225EC; Fri, 28 May 2021 15:18:19 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, mansur@codeaurora.org,
        dikshita@codeaurora.org
Subject: [PATCH] venus: helper: do not set constrained format for UBWC
Date:   Fri, 28 May 2021 15:18:08 +0530
Message-Id: <1622195288-18541-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Do not set constrained format explicitly for UBWC

Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index b813d6dba..e4b8a2a 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1138,8 +1138,12 @@ int venus_helper_set_format_constraints(struct venus_inst *inst)
 	if (!IS_V6(inst->core))
 		return 0;
 
+	if (inst->opb_fmt == HFI_COLOR_FORMAT_NV12_UBWC)
+		return 0;
+
 	pconstraint.buffer_type = HFI_BUFFER_OUTPUT2;
 	pconstraint.num_planes = 2;
+
 	pconstraint.plane_format[0].stride_multiples = 128;
 	pconstraint.plane_format[0].max_stride = 8192;
 	pconstraint.plane_format[0].min_plane_buffer_height_multiple = 32;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

