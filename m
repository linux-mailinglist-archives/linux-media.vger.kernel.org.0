Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFCF3B9BEA
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 07:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbhGBFTS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 01:19:18 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:34213 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhGBFTR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 01:19:17 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 01 Jul 2021 22:16:46 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 01 Jul 2021 22:16:43 -0700
X-QCInternal: smtphost
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 02 Jul 2021 10:46:25 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 7F795224DC; Fri,  2 Jul 2021 10:46:24 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [V3] venus: helper: do not set constrained parameters for UBWC
Date:   Fri,  2 Jul 2021 10:46:19 +0530
Message-Id: <1625202979-23232-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

plane constraints firmware interface is to override the default
alignment for a given color format. By default venus hardware has
alignments as 128x32, but NV12 was defined differently to meet
various usecases. Compressed NV12 has always been aligned as 128x32,
hence not needed to override the default alignment.

Fixes: bc28936bbba9 ("media: venus: helpers, hfi, vdec: Set actual plane constraints to FW")
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>

Changes in V3:
- Elaborated commit message as per comments by Bryan
- As per Bryan comment alligned fixes in single line.
---
 drivers/media/platform/qcom/venus/helpers.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 1fe6d46..601ee3e 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1137,8 +1137,12 @@ int venus_helper_set_format_constraints(struct venus_inst *inst)
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

