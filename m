Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA9227A5B7
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 05:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgI1DIp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Sep 2020 23:08:45 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:62795 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgI1DIl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Sep 2020 23:08:41 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 27 Sep 2020 20:08:40 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Sep 2020 20:08:39 -0700
X-QCInternal: smtphost
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg01-blr.qualcomm.com with ESMTP; 28 Sep 2020 08:38:22 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id CA7F821C27; Mon, 28 Sep 2020 08:38:21 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, swboyd@chromium.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [RESEND v3 1/4] venus: core: change clk enable and disable order in resume and suspend
Date:   Mon, 28 Sep 2020 08:38:13 +0530
Message-Id: <1601262496-27026-2-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601262496-27026-1-git-send-email-mansur@codeaurora.org>
References: <1601262496-27026-1-git-send-email-mansur@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently video driver is voting after clk enable and un voting
before clk disable. This is incorrect, video driver should vote
before clk enable and unvote after clk disable.

Corrected this by changing the order of clk enable and clk disable.

Fixes: 07f8f22a33a9e ("media: venus: core: remove CNOC voting while device
suspend")
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
- Resending by corecting fixes tag

 drivers/media/platform/qcom/venus/core.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 6103aaf..52a3886 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -355,13 +355,16 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
+	if (pm_ops->core_power) {
+		ret = pm_ops->core_power(dev, POWER_OFF);
+		if (ret)
+			return ret;
+	}
+
 	ret = icc_set_bw(core->cpucfg_path, 0, 0);
 	if (ret)
 		return ret;
 
-	if (pm_ops->core_power)
-		ret = pm_ops->core_power(dev, POWER_OFF);
-
 	return ret;
 }
 
@@ -371,16 +374,16 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
 	const struct venus_pm_ops *pm_ops = core->pm_ops;
 	int ret;
 
+	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
+	if (ret)
+		return ret;
+
 	if (pm_ops->core_power) {
 		ret = pm_ops->core_power(dev, POWER_ON);
 		if (ret)
 			return ret;
 	}
 
-	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
-	if (ret)
-		return ret;
-
 	return hfi_core_resume(core, false);
 }
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

