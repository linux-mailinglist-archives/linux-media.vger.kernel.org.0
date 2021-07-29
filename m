Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3BA23DA043
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 11:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235421AbhG2JbR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 05:31:17 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:10689 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235244AbhG2JbR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 05:31:17 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 29 Jul 2021 02:31:14 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 Jul 2021 02:31:12 -0700
X-QCInternal: smtphost
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg01-blr.qualcomm.com with ESMTP; 29 Jul 2021 15:00:49 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id C762F226D4; Thu, 29 Jul 2021 15:00:48 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH] venus: helper: change log level for false warning message
Date:   Thu, 29 Jul 2021 15:00:44 +0530
Message-Id: <20210729093044.5896-1-mansur@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In current video driver implementation in calculate_inst_freq()
frequency is calculated based on filled_len. The filled_len may
vary frame to frame, because of this in load_scale_v4() since
frequency is calculated for all instances, driver is throwing
false warning like "HW is overloaded".

Hence to handle this, changed log level to low log message. Since the
actual session rejection is happening in decide_core() based on
load.

Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 3e2345eb47f7..679177e7ad22 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -1139,9 +1139,10 @@ static int load_scale_v4(struct venus_inst *inst)
 	freq = max(freq_core1, freq_core2);
 
 	if (freq > table[0].freq) {
+		dev_dbg(dev, VDBGL "requested clock rate: %lu scaling clock rate : %lu\n",
+			freq, table[0].freq);
+
 		freq = table[0].freq;
-		dev_warn(dev, "HW is overloaded, needed: %lu max: %lu\n",
-			 freq, table[0].freq);
 		goto set_freq;
 	}
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

