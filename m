Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4175716118E
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 13:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbgBQMDU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 07:03:20 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:34277 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729000AbgBQMDU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 07:03:20 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 17 Feb 2020 17:31:47 +0530
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg01-blr.qualcomm.com with ESMTP; 17 Feb 2020 17:31:35 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id B4E55216B6; Mon, 17 Feb 2020 17:31:34 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, mansur@codeaurora.org
Subject: [PATCH] [PATCH] venus: core: remove CNOC voting while device suspend
Date:   Mon, 17 Feb 2020 17:31:31 +0530
Message-Id: <1581940891-2376-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

video driver is voting for CNOC during probe and not clear
while device suspend. Because of which XO shutdown is
happing(BCM42: VALID: 0x1 VOTE_X: 0x0000 VOTE_Y: 0x0004).

So, clearing CNOC voting while device suspend.

Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index e7995cb..153effe 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -244,10 +244,6 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
-	if (ret)
-		return ret;
-
 	ret = hfi_create(core, &venus_core_ops);
 	if (ret)
 		return ret;
@@ -353,6 +349,10 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = icc_set_bw(core->cpucfg_path, 0, 0);
+	if (ret)
+		return ret;
+
 	if (pm_ops->core_power)
 		ret = pm_ops->core_power(dev, POWER_OFF);
 
@@ -371,6 +371,10 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
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

