Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F25CD17B66D
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 06:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgCFFeW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 00:34:22 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:37928 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725908AbgCFFeW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Mar 2020 00:34:22 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 Mar 2020 11:02:49 +0530
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 Mar 2020 11:02:40 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id B9DA52114D; Fri,  6 Mar 2020 11:02:39 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, mansur@codeaurora.org
Subject: [PATCH] venus: avoid extra locking in driver
Date:   Fri,  6 Mar 2020 11:02:36 +0530
Message-Id: <1583472756-7611-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This change will avoid extra locking in driver.

Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.c       |  2 +-
 drivers/media/platform/qcom/venus/core.h       |  2 +-
 drivers/media/platform/qcom/venus/helpers.c    | 11 +++++++++--
 drivers/media/platform/qcom/venus/pm_helpers.c |  8 ++++----
 4 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 194b10b9..75d38b8 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -447,7 +447,7 @@ static const struct freq_tbl sdm845_freq_table[] = {
 	{  244800, 100000000 },	/* 1920x1080@30 */
 };
 
-static struct codec_freq_data sdm845_codec_freq_data[] =  {
+static const struct codec_freq_data sdm845_codec_freq_data[] =  {
 	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },
 	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10 },
 	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 10 },
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index ab7c360..8c8d0e9 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -245,7 +245,7 @@ struct venus_buffer {
 struct clock_data {
 	u32 core_id;
 	unsigned long freq;
-	const struct codec_freq_data *codec_freq_data;
+	struct codec_freq_data codec_freq_data;
 };
 
 #define to_venus_buffer(ptr)	container_of(ptr, struct venus_buffer, vb)
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index bcc6038..550c4ff 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -807,6 +807,7 @@ int venus_helper_init_codec_freq_data(struct venus_inst *inst)
 	unsigned int i, data_size;
 	u32 pixfmt;
 	int ret = 0;
+	bool found = false;
 
 	if (!IS_V4(inst->core))
 		return 0;
@@ -816,16 +817,22 @@ int venus_helper_init_codec_freq_data(struct venus_inst *inst)
 	pixfmt = inst->session_type == VIDC_SESSION_TYPE_DEC ?
 			inst->fmt_out->pixfmt : inst->fmt_cap->pixfmt;
 
+	memset(&inst->clk_data.codec_freq_data, 0,
+		sizeof(inst->clk_data.codec_freq_data));
+
 	for (i = 0; i < data_size; i++) {
 		if (data[i].pixfmt == pixfmt &&
 		    data[i].session_type == inst->session_type) {
-			inst->clk_data.codec_freq_data = &data[i];
+			inst->clk_data.codec_freq_data = data[i];
+			found = true;
 			break;
 		}
 	}
 
-	if (!inst->clk_data.codec_freq_data)
+	if (!found) {
+		dev_err(inst->core->dev, "cannot find codec freq data\n");
 		ret = -EINVAL;
+	}
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index abf9315..240845e 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -496,7 +496,7 @@ min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load)
 	list_for_each_entry(inst_pos, &core->instances, list) {
 		if (inst_pos == inst)
 			continue;
-		vpp_freq = inst_pos->clk_data.codec_freq_data->vpp_freq;
+		vpp_freq = inst_pos->clk_data.codec_freq_data.vpp_freq;
 		coreid = inst_pos->clk_data.core_id;
 
 		mbs_per_sec = load_per_instance(inst_pos);
@@ -545,7 +545,7 @@ static int decide_core(struct venus_inst *inst)
 		return 0;
 
 	inst_load = load_per_instance(inst);
-	inst_load *= inst->clk_data.codec_freq_data->vpp_freq;
+	inst_load *= inst->clk_data.codec_freq_data.vpp_freq;
 	max_freq = core->res->freq_tbl[0].freq;
 
 	min_loaded_core(inst, &min_coreid, &min_load);
@@ -848,10 +848,10 @@ static unsigned long calculate_inst_freq(struct venus_inst *inst,
 
 	mbs_per_sec = load_per_instance(inst) / fps;
 
-	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
+	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data.vpp_freq;
 	/* 21 / 20 is overhead factor */
 	vpp_freq += vpp_freq / 20;
-	vsp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vsp_freq;
+	vsp_freq = mbs_per_sec * inst->clk_data.codec_freq_data.vsp_freq;
 
 	/* 10 / 7 is overhead factor */
 	if (inst->session_type == VIDC_SESSION_TYPE_ENC)
-- 
2.7.4

