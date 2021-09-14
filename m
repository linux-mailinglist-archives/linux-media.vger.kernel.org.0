Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5671340A4DB
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 05:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239029AbhINDsX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 23:48:23 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:54237 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235059AbhINDsX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 23:48:23 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 13 Sep 2021 20:47:06 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 13 Sep 2021 20:47:04 -0700
X-QCInternal: smtphost
Received: from c-mansur-linux.qualcomm.com ([10.204.83.180])
  by ironmsg01-blr.qualcomm.com with ESMTP; 14 Sep 2021 09:16:53 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id B52CB2267B; Tue, 14 Sep 2021 09:16:52 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH] venus: fix vpp frequency calculation for decoder
Date:   Tue, 14 Sep 2021 09:16:50 +0530
Message-Id: <20210914034650.22959-1-mansur@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In existing video driver implementation vpp frequency calculation in
calculate_inst_freq() is always zero because the value of vpp_freq_per_mb
is always zero for decoder.

Fixed this by correcting the calculating the vpp frequency calculation for
decoder.

Fixes: bc28936bbba9 ("media: venus: helpers, hfi, vdec: Set actual plane constraints to FW")
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 3e2345eb47f7..e031fd17f4e7 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -1085,12 +1085,16 @@ static unsigned long calculate_inst_freq(struct venus_inst *inst,
 	if (inst->state != INST_START)
 		return 0;
 
-	if (inst->session_type == VIDC_SESSION_TYPE_ENC)
+	if (inst->session_type == VIDC_SESSION_TYPE_ENC) {
 		vpp_freq_per_mb = inst->flags & VENUS_LOW_POWER ?
 			inst->clk_data.low_power_freq :
 			inst->clk_data.vpp_freq;
 
-	vpp_freq = mbs_per_sec * vpp_freq_per_mb;
+		vpp_freq = mbs_per_sec * vpp_freq_per_mb;
+	} else {
+		vpp_freq = mbs_per_sec * inst->clk_data.vpp_freq;
+	}
+
 	/* 21 / 20 is overhead factor */
 	vpp_freq += vpp_freq / 20;
 	vsp_freq = mbs_per_sec * inst->clk_data.vsp_freq;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

