Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDD526D0AF
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 03:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgIQBdj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 21:33:39 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:30994 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgIQBcq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 21:32:46 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 16 Sep 2020 18:26:30 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 16 Sep 2020 18:26:28 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 17 Sep 2020 06:56:11 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 69BA121D3F; Thu, 17 Sep 2020 06:56:09 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [RESEND v2 3/4] venus: core: vote with average bandwidth and peak bandwidth as zero
Date:   Thu, 17 Sep 2020 06:56:02 +0530
Message-Id: <1600305963-7659-4-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600305963-7659-1-git-send-email-mansur@codeaurora.org>
References: <1600305963-7659-1-git-send-email-mansur@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As per bandwidth table we are voting with average bandwidth
for "video-mem" and "cpu-cfg" paths as peak bandwidth is zero
in bandwidth table.

Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 064b6c8..c9669ad 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -382,11 +382,11 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
 	const struct venus_pm_ops *pm_ops = core->pm_ops;
 	int ret;
 
-	ret = icc_set_bw(core->video_path, 0, kbps_to_icc(1000));
+	ret = icc_set_bw(core->video_path, kbps_to_icc(20000), 0);
 	if (ret)
 		return ret;
 
-	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
+	ret = icc_set_bw(core->cpucfg_path, kbps_to_icc(1000), 0);
 	if (ret)
 		return ret;
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

