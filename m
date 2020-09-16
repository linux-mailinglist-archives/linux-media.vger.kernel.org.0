Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C9626C2D5
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 14:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbgIPMiQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 08:38:16 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:62750 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbgIPKae (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 06:30:34 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 16 Sep 2020 03:28:27 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 16 Sep 2020 03:28:26 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 16 Sep 2020 15:58:11 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 7141A21D39; Wed, 16 Sep 2020 15:58:11 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH v2 2/4] venus: core: vote for video-mem path
Date:   Wed, 16 Sep 2020 15:58:03 +0530
Message-Id: <1600252084-30779-3-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600252084-30779-1-git-send-email-mansur@codeaurora.org>
References: <1600252084-30779-1-git-send-email-mansur@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently we are voting for venus0-ebi path during buffer processing
with an average bandwidth of all the instances and unvoting during
session release.

While video streaming when we try to do XO-SD using the command
"echo mem > /sys/power/state command" , device is not entering
to suspend state and from interconnect summary seeing votes for venus0-ebi

Corrected this by voting for venus0-ebi path in venus_runtime_resume
and unvote during venus_runtime_suspend.

Fixes: 7482a983d ("media: venus: redesign clocks and pm domains control")
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
Changes in V2:
- Added fixes tag
- Addressed review comments by Stephen Boyd
 drivers/media/platform/qcom/venus/core.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 52a3886..064b6c8 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -363,8 +363,16 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
 
 	ret = icc_set_bw(core->cpucfg_path, 0, 0);
 	if (ret)
-		return ret;
+		goto err_poweron_core;
+
+	ret = icc_set_bw(core->video_path, 0, 0);
+	if (ret)
+		goto err_poweron_core;
+
+	return ret;
 
+err_poweron_core:
+	pm_ops->core_power(dev, POWER_ON);
 	return ret;
 }
 
@@ -374,6 +382,10 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
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

