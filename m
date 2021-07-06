Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01CF13BDB45
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 18:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbhGFQYe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 12:24:34 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:8092 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbhGFQYc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 12:24:32 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 06 Jul 2021 09:21:53 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 Jul 2021 09:21:50 -0700
X-QCInternal: smtphost
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg01-blr.qualcomm.com with ESMTP; 06 Jul 2021 21:51:26 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 7005A226EF; Tue,  6 Jul 2021 21:51:24 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [V4] venus: helper: do not set constrained parameters for UBWC
Date:   Tue,  6 Jul 2021 21:51:22 +0530
Message-Id: <1625588482-19269-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Plane constraints firmware interface is to override the default
alignment for a given color format. By default venus hardware has
alignments as 128x32, but NV12 was defined differently to meet
various usecases. Compressed NV12 has always been aligned as 128x32,
hence not needed to override the default alignment.

Fixes: bc28936bbba9 ("media: venus: helpers, hfi, vdec: Set actual plane constraints to FW")
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Changes in V4:
- Corrected the commit message and removed extra line
---
 drivers/media/platform/qcom/venus/helpers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 1fe6d46..8012f5c 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1137,6 +1137,9 @@ int venus_helper_set_format_constraints(struct venus_inst *inst)
 	if (!IS_V6(inst->core))
 		return 0;
 
+	if (inst->opb_fmt == HFI_COLOR_FORMAT_NV12_UBWC)
+		return 0;
+
 	pconstraint.buffer_type = HFI_BUFFER_OUTPUT2;
 	pconstraint.num_planes = 2;
 	pconstraint.plane_format[0].stride_multiples = 128;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

