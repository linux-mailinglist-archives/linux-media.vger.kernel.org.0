Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDA827A5B4
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 05:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgI1DIp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Sep 2020 23:08:45 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:25744 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgI1DIj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Sep 2020 23:08:39 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 27 Sep 2020 20:08:39 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Sep 2020 20:08:37 -0700
X-QCInternal: smtphost
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg01-blr.qualcomm.com with ESMTP; 28 Sep 2020 08:38:26 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 9816521C27; Mon, 28 Sep 2020 08:38:25 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, swboyd@chromium.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [RESEND v3 4/4] venus: put dummy vote on video-mem path after last session release
Date:   Mon, 28 Sep 2020 08:38:16 +0530
Message-Id: <1601262496-27026-5-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601262496-27026-1-git-send-email-mansur@codeaurora.org>
References: <1601262496-27026-1-git-send-email-mansur@codeaurora.org>
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
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 57877ea..0ebba8e 100644
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

