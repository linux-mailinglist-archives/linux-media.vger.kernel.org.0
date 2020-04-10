Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEFF1A42CB
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 09:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgDJHIF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 03:08:05 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:21196 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725776AbgDJHIF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 03:08:05 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 10 Apr 2020 12:37:12 +0530
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg01-blr.qualcomm.com with ESMTP; 10 Apr 2020 12:37:04 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id B91CC218D0; Fri, 10 Apr 2020 12:37:03 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, mansur@codeaurora.org
Subject: [PATCH] venus: core: remove CNOC voting while device suspend
Date:   Fri, 10 Apr 2020 12:36:56 +0530
Message-Id: <1586502416-15157-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Venus driver is voting Configuration NoC during .probe but not clear
voting in .suspend. Because of this NoC is up during shutdown also. As a
consequence the whole device could leak energy while in .suspend.

So correct this by moving voting in .resume and unvoting
in .suspend

signed-off-by: mansur alisha shaik <mansur@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 194b10b9..13fa507 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -242,10 +242,6 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
-	if (ret)
-		return ret;
-
 	ret = hfi_create(core, &venus_core_ops);
 	if (ret)
 		return ret;
@@ -350,6 +346,10 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = icc_set_bw(core->cpucfg_path, 0, 0);
+	if (ret)
+		return ret;
+
 	if (pm_ops->core_power)
 		ret = pm_ops->core_power(dev, POWER_OFF);
 
@@ -368,6 +368,10 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
 			return ret;
 	}
 
+	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
+	if (ret)
+		return ret;
+
 	return hfi_core_resume(core, false);
 }
 
-- 
2.7.4

