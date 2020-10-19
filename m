Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79C5D2921AD
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 06:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgJSETT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 00:19:19 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:54575 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgJSETS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 00:19:18 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 18 Oct 2020 21:19:18 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 18 Oct 2020 21:19:17 -0700
X-QCInternal: smtphost
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg01-blr.qualcomm.com with ESMTP; 19 Oct 2020 09:49:08 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id E8FD121E1F; Mon, 19 Oct 2020 09:49:06 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, swboyd@chromium.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH v4 4/4] venus: put dummy vote on video-mem path after last session release
Date:   Mon, 19 Oct 2020 09:48:14 +0530
Message-Id: <1603081094-17223-5-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603081094-17223-1-git-send-email-mansur@codeaurora.org>
References: <1603081094-17223-1-git-send-email-mansur@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As per current implementation, video driver is unvoting "videom-mem" path
for last video session during vdec_session_release().
While video playback when we try to suspend device, we see video clock
warnings since votes are already removed during vdec_session_release().

corrected this by putting dummy vote on "video-mem" after last video
session release and unvoting it during suspend.

Fixes: 07f8f22a33a9e ("media: venus: core: remove CNOC voting while device
suspend")
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
Changes in v4:
- As per Stanimir's comments, corrected fixes tag

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

