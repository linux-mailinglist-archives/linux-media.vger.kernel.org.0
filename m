Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 154A943C2E4
	for <lists+linux-media@lfdr.de>; Wed, 27 Oct 2021 08:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238476AbhJ0GXx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Oct 2021 02:23:53 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:32523 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236961AbhJ0GXw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Oct 2021 02:23:52 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 26 Oct 2021 23:21:28 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 26 Oct 2021 23:21:26 -0700
X-QCInternal: smtphost
Received: from c-mansur-linux.qualcomm.com ([10.204.83.180])
  by ironmsg01-blr.qualcomm.com with ESMTP; 27 Oct 2021 11:51:15 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 2EE0220F0C; Wed, 27 Oct 2021 11:51:14 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH] venus: correct low power frequency calculation for encoder
Date:   Wed, 27 Oct 2021 11:51:12 +0530
Message-Id: <20211027062112.11380-1-mansur@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In exististing implimentation, in min_loaded_core() for low_power
vpp frequency value is considering as vpp_freq instead of low_power_freq.
Fixed this by correcting vpp frequency calculation for encoder.

Fixes: 3cfe5815ce0e (media: venus: Enable low power setting for encoder)
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index cedc664ba755..184f0cea2fdb 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -587,8 +587,8 @@ min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load, bool lo
 		if (inst->session_type == VIDC_SESSION_TYPE_DEC)
 			vpp_freq = inst_pos->clk_data.vpp_freq;
 		else if (inst->session_type == VIDC_SESSION_TYPE_ENC)
-			vpp_freq = low_power ? inst_pos->clk_data.vpp_freq :
-				inst_pos->clk_data.low_power_freq;
+			vpp_freq = low_power ? inst_pos->clk_data.low_power_freq :
+				inst_pos->clk_data.vpp_freq;
 		else
 			continue;
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

