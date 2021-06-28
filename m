Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0708F3B6654
	for <lists+linux-media@lfdr.de>; Mon, 28 Jun 2021 18:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232586AbhF1QEh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Jun 2021 12:04:37 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:16953 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232012AbhF1QEg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Jun 2021 12:04:36 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 28 Jun 2021 09:02:10 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 28 Jun 2021 09:02:08 -0700
X-QCInternal: smtphost
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 28 Jun 2021 21:31:49 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 9E9392241D; Mon, 28 Jun 2021 21:31:47 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [V2] venus: helper: do not set constrained parameters for UBWC
Date:   Mon, 28 Jun 2021 21:31:45 +0530
Message-Id: <1624896105-26852-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

onstrained parameters are to override the default alignment for
a given color format. By default venus hardware has alignments as
128x32, but NV12 was defined differently to meet various usecases.
Compressed NV12 has always been aligned as 128x32, hence not needed
to override the default alignment.

Fixes: bc28936bbba9 ("media: venus: helpers, hfi, vdec: Set actual plane
constraints to FW")
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>

Changes in V2:
- Elaborated commit message as per comments by Bryan
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

