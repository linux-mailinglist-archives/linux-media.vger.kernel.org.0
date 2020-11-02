Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B544B2A282D
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 11:25:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728442AbgKBKYz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 05:24:55 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:25653 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728415AbgKBKYy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 05:24:54 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 02 Nov 2020 02:24:54 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 02 Nov 2020 02:24:52 -0800
X-QCInternal: smtphost
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 02 Nov 2020 15:54:39 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 32E3D2111B; Mon,  2 Nov 2020 15:54:39 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH] venus: fix calculating mbps in calculate_inst_freq()
Date:   Mon,  2 Nov 2020 15:54:34 +0530
Message-Id: <1604312674-1621-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently in calculate_inst_freq() video driver is calculating
macro blocks per frame in steam of macro blocks per second(mpbs).
Which results frequency is always setting to lower frequency (150MB)
as per frequency table for sc7180. Hence the playback is not smooth.

Corrected this by correcting the mbps calculation.

Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 57877ea..001513f 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -928,7 +928,7 @@ static unsigned long calculate_inst_freq(struct venus_inst *inst,
 	u32 fps = (u32)inst->fps;
 	u32 mbs_per_sec;
 
-	mbs_per_sec = load_per_instance(inst) / fps;
+	mbs_per_sec = load_per_instance(inst);
 
 	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
 	/* 21 / 20 is overhead factor */
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

