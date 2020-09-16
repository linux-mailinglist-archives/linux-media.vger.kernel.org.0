Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32A026C1B2
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 12:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgIPKcq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 06:32:46 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:1237 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbgIPKae (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 06:30:34 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 16 Sep 2020 03:28:25 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 16 Sep 2020 03:28:24 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 16 Sep 2020 15:58:10 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id C892621D39; Wed, 16 Sep 2020 15:58:09 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH v2 1/4] venus: core: change clk enable and disable order in resume and suspend
Date:   Wed, 16 Sep 2020 15:58:02 +0530
Message-Id: <1600252084-30779-2-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600252084-30779-1-git-send-email-mansur@codeaurora.org>
References: <1600252084-30779-1-git-send-email-mansur@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently video driver is voting after clk enable and un voting
before clk disable. Basically we should vote before clk enable
and un vote after clk disable.

Corrected this by changing the order of clk enable and clk disable.

Fixes: 7482a983d ("media: venus: redesign clocks and pm domains control")
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
Changes in V2:
- Added fixes tag

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

