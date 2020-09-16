Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554CB26C235
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 13:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgIPL3k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 07:29:40 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:62750 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbgIPKcy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 06:32:54 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 16 Sep 2020 03:28:27 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 16 Sep 2020 03:28:26 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 16 Sep 2020 15:58:13 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 1E04B21D39; Wed, 16 Sep 2020 15:58:13 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH v2 3/4] venus: core: vote with average bandwidth and peak bandwidth as zero
Date:   Wed, 16 Sep 2020 15:58:04 +0530
Message-Id: <1600252084-30779-4-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600252084-30779-1-git-send-email-mansur@codeaurora.org>
References: <1600252084-30779-1-git-send-email-mansur@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
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

