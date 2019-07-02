Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 313D35D202
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 16:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfGBOrH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 10:47:07 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45816 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbfGBOrG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 10:47:06 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C449F6016D; Tue,  2 Jul 2019 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562078825;
        bh=UeDyAtIWpA7gei3U6JuRRJQg255isa7UX8RScXF9Kpw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OAq5mzzs3TZJM84pb2+eHe5+uok11f+MEvhSCYS5OK+a58MysKtgHGfe06KJ5aQ/E
         mATXmXURpMEjcH4Dv7nAm2QvZtqySCkVvh2FUA68pzvP+YlkwtWFuhpS9wEbIAaz0I
         iTCptAIWEv2TOew8BbT7jp2fiFYvWV7vtUw1BrjA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from amasule-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: amasule@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F1F27608FF;
        Tue,  2 Jul 2019 14:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562078824;
        bh=UeDyAtIWpA7gei3U6JuRRJQg255isa7UX8RScXF9Kpw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JtHp7ojNOx1MMS6QmDhCyiWgT8ahd6RhrrWRelSHjyaassgpS3GKmnZcnWgwR8TTJ
         rvXl33wTUfUQweey0jmXbtRhX5DGMIuQZhdC343VG1S1kEgInLB7oP3XFd/NTpKBLx
         5KMjliu9Tr/nc7h5LCwRgv5CBS8fJ7pC4cm9yUEw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F1F27608FF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH v4 2/4] media: venus: Update clock scaling
Date:   Tue,  2 Jul 2019 20:16:25 +0530
Message-Id: <1562078787-516-3-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1562078787-516-1-git-send-email-amasule@codeaurora.org>
References: <1562078787-516-1-git-send-email-amasule@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Current clock scaling calculations are same for vpu4 and
previous versions. For vpu4, Clock scaling calculations
are updated with cycles/mb. This helps in getting precise
clock required.

Signed-off-by: Aniket Masule <amasule@codeaurora.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 91 +++++++++++++++++++++++++++--
 1 file changed, 87 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 7492373..2c976e4 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -348,8 +348,9 @@ static u32 load_per_type(struct venus_core *core, u32 session_type)
 	return mbs_per_sec;
 }
 
-static int load_scale_clocks(struct venus_core *core)
+static int scale_clocks(struct venus_inst *inst)
 {
+	struct venus_core *core = inst->core;
 	const struct freq_tbl *table = core->res->freq_tbl;
 	unsigned int num_rows = core->res->freq_tbl_size;
 	unsigned long freq = table[0].freq;
@@ -398,6 +399,89 @@ static int load_scale_clocks(struct venus_core *core)
 	return ret;
 }
 
+static unsigned long calculate_vpp_freq(struct venus_inst *inst)
+{
+	unsigned long vpp_freq = 0;
+	u32 mbs_per_sec;
+
+	mbs_per_sec = load_per_instance(inst);
+	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
+	/* 21 / 20 is overhead factor */
+	vpp_freq += vpp_freq / 20;
+
+	return vpp_freq;
+}
+
+static int scale_clocks_v4(struct venus_inst *inst)
+{
+	struct venus_core *core = inst->core;
+	const struct freq_tbl *table = core->res->freq_tbl;
+	unsigned int num_rows = core->res->freq_tbl_size;
+	struct clk *clk = core->clks[0];
+	struct device *dev = core->dev;
+	unsigned int i;
+	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
+	int ret;
+
+	freq = calculate_vpp_freq(inst);
+
+	if (freq > table[0].freq)
+		dev_warn(dev, "HW is overloaded, needed: %lu max: %lu\n",
+			 freq, table[0].freq);
+
+	for (i = 0; i < num_rows; i++) {
+		if (freq > table[i].freq)
+			break;
+		freq = table[i].freq;
+	}
+
+	inst->clk_data.freq = freq;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(inst, &core->instances, list) {
+		if (inst->clk_data.core_id == VIDC_CORE_ID_1) {
+			freq_core1 += inst->clk_data.freq;
+		} else if (inst->clk_data.core_id == VIDC_CORE_ID_2) {
+			freq_core2 += inst->clk_data.freq;
+		} else if (inst->clk_data.core_id == VIDC_CORE_ID_3) {
+			freq_core1 += inst->clk_data.freq;
+			freq_core2 += inst->clk_data.freq;
+		}
+	}
+	mutex_unlock(&core->lock);
+
+	freq = max(freq_core1, freq_core2);
+
+	ret = clk_set_rate(clk, freq);
+	if (ret)
+		goto err;
+
+	ret = clk_set_rate(core->core0_clk, freq);
+	if (ret)
+		goto err;
+
+	ret = clk_set_rate(core->core1_clk, freq);
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	dev_err(dev, "failed to set clock rate %lu (%d)\n", freq, ret);
+	return ret;
+}
+
+static int load_scale_clocks(struct venus_inst *inst)
+{
+	if (IS_V4(inst->core))
+		return scale_clocks_v4(inst);
+
+	if (inst->state == INST_START)
+		return 0;
+
+	return scale_clocks(inst);
+}
+
 static void fill_buffer_desc(const struct venus_buffer *buf,
 			     struct hfi_buffer_desc *bd, bool response)
 {
@@ -1053,7 +1137,7 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
 
 		venus_helper_free_dpb_bufs(inst);
 
-		load_scale_clocks(core);
+		load_scale_clocks(inst);
 		INIT_LIST_HEAD(&inst->registeredbufs);
 	}
 
@@ -1070,7 +1154,6 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
 
 int venus_helper_vb2_start_streaming(struct venus_inst *inst)
 {
-	struct venus_core *core = inst->core;
 	int ret;
 
 	ret = intbufs_alloc(inst);
@@ -1081,7 +1164,7 @@ int venus_helper_vb2_start_streaming(struct venus_inst *inst)
 	if (ret)
 		goto err_bufs_free;
 
-	load_scale_clocks(core);
+	load_scale_clocks(inst);
 
 	ret = hfi_session_load_res(inst);
 	if (ret)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

