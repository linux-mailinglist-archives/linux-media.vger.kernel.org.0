Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59238276951
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 08:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbgIXGvf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 02:51:35 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:30298 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgIXGvb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 02:51:31 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 23 Sep 2020 23:51:30 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Sep 2020 23:51:28 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Sep 2020 12:21:12 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id D825A21D59; Thu, 24 Sep 2020 12:21:10 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH v3 2/4] venus: core: vote for video-mem path
Date:   Thu, 24 Sep 2020 12:21:04 +0530
Message-Id: <1600930266-9668-3-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600930266-9668-1-git-send-email-mansur@codeaurora.org>
References: <1600930266-9668-1-git-send-email-mansur@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently video driver is voting for venus0-ebi path during buffer
processing with an average bandwidth of all the instances and
unvoting during session release.

While video streaming when we try to do XO-SD using the command
"echo mem > /sys/power/state command" , device is not entering
to suspend state and from interconnect summary seeing votes for venus0-ebi

Corrected this by voting for venus0-ebi path in venus_runtime_resume()
and unvote during venus_runtime_suspend().

Fixes: 7482a983d ("media: venus: redesign clocks and pm domains control")
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
Changes in v3:
- Addressed review comments by Stephen Boyd

 drivers/media/platform/qcom/venus/core.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 52a3886..fa363b8 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -363,7 +363,18 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
 
 	ret = icc_set_bw(core->cpucfg_path, 0, 0);
 	if (ret)
-		return ret;
+		goto err_cpucfg_path;
+
+	ret = icc_set_bw(core->video_path, 0, 0);
+	if (ret)
+		goto err_video_path;
+
+	return ret;
+
+err_video_path:
+	icc_set_bw(core->cpucfg_path, kbps_to_icc(1000), 0);
+err_cpucfg_path:
+	pm_ops->core_power(dev, POWER_ON);
 
 	return ret;
 }
@@ -374,6 +385,10 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
 	const struct venus_pm_ops *pm_ops = core->pm_ops;
 	int ret;
 
+	ret = icc_set_bw(core->video_path, 0, kbps_to_icc(1000));
+	if (ret)
+		return ret;
+
 	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
 	if (ret)
 		return ret;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

