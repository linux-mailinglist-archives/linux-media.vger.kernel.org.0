Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5754276953
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 08:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbgIXGvb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 02:51:31 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:18478 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727000AbgIXGv1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 02:51:27 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 23 Sep 2020 23:51:27 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Sep 2020 23:51:25 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Sep 2020 12:21:11 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id F05AA21D5B; Thu, 24 Sep 2020 12:21:09 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH v3 1/4] venus: core: change clk enable and disable order in resume and suspend
Date:   Thu, 24 Sep 2020 12:21:03 +0530
Message-Id: <1600930266-9668-2-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600930266-9668-1-git-send-email-mansur@codeaurora.org>
References: <1600930266-9668-1-git-send-email-mansur@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently video driver is voting after clk enable and un voting
before clk disable. This is incorrect, video driver should vote
before clk enable and unvote after clk disable.

Corrected this by changing the order of clk enable and clk disable.

Fixes: 7482a983d ("media: venus: redesign clocks and pm domains control")
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
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

