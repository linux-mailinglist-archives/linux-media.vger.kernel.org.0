Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9E9276958
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 08:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbgIXGvm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 02:51:42 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:7461 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgIXGvb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 02:51:31 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 23 Sep 2020 23:51:29 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Sep 2020 23:51:27 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Sep 2020 12:21:14 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 00D5021D59; Thu, 24 Sep 2020 12:21:12 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH v3 4/4] venus: put dummy vote on video-mem path after last session release
Date:   Thu, 24 Sep 2020 12:21:06 +0530
Message-Id: <1600930266-9668-5-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600930266-9668-1-git-send-email-mansur@codeaurora.org>
References: <1600930266-9668-1-git-send-email-mansur@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As per current implementation, video driver is unvoting "videom-mem" path
for last video session during vdec_session_release().
While video playback when we try to suspend device, we see video clock
warnings since votes are already removed during vdec_session_release().

corrected this by putting dummy vote on "video-mem" after last video
session release and unvoting it during suspend.

Fixes: 7482a983d ("media: venus: redesign clocks and pm domains control")
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
Changes in v3:
- Added fixes tag

 drivers/media/platform/qcom/venus/pm_helpers.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 57877ea..ca09ea8 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -212,6 +212,16 @@ static int load_scale_bw(struct venus_core *core)
 	}
 	mutex_unlock(&core->lock);
 
+	/*
+	 * keep minimum bandwidth vote for "video-mem" path,
+	 * so that clks can be disabled during vdec_session_release().
+	 * Actual bandwidth drop will be done during device supend
+	 * so that device can power down without any warnings.
+	 */
+
+	if (!total_avg && !total_peak)
+		total_avg = kbps_to_icc(1000);
+
 	dev_dbg(core->dev, VDBGL "total: avg_bw: %u, peak_bw: %u\n",
 		total_avg, total_peak);
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

