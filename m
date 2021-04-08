Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4711D3584D1
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 15:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231601AbhDHNfm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 09:35:42 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:22645 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbhDHNfj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 09:35:39 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 08 Apr 2021 06:35:26 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 08 Apr 2021 06:35:24 -0700
X-QCInternal: smtphost
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 08 Apr 2021 19:05:05 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id D21252177A; Thu,  8 Apr 2021 19:05:04 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH] venus: fix hw overload error log condition
Date:   Thu,  8 Apr 2021 19:05:00 +0530
Message-Id: <1617888900-857-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In current video driver, frequency is calculated for all the
running video instances and check aganist maximum supported frequency.
If both calculated frequency and maximum supported frequency are same,
even then HW overload error is printed.
Fix this by printing error log only when frequency is greater than
maximum supported frequency.

Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index dfe3ee8..9714ca7 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -1083,7 +1083,7 @@ static int load_scale_v4(struct venus_inst *inst)
 
 	freq = max(freq_core1, freq_core2);
 
-	if (freq >= table[0].freq) {
+	if (freq > table[0].freq) {
 		freq = table[0].freq;
 		dev_warn(dev, "HW is overloaded, needed: %lu max: %lu\n",
 			 freq, table[0].freq);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

