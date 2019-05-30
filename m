Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA4A2FCCD
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 15:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbfE3N7I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 09:59:08 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46546 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfE3N7I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 09:59:08 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6DC3A6087B; Thu, 30 May 2019 13:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559224746;
        bh=kW/yCGwNEKbklqD5qFu0UiMJZe2xtWTKbyDGLSimCdg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Zv+CAlCTnd51SXy0NqOXePRSFjphCZjaC4xn8RvymAFRPqzzHUbMzdOQlust93P0M
         jyprsQiY0O9Wcaq0anWsECjS2DhlP+Fu/3XVnjNyafwqj34GrfHF1fz3gEomdwyZLw
         QKRgTodk/iIB6GCoactioNJ9ZSTwsx0Vz4vUU3n4=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AE16760A33;
        Thu, 30 May 2019 13:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559224745;
        bh=kW/yCGwNEKbklqD5qFu0UiMJZe2xtWTKbyDGLSimCdg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PQ8TEPgAOg/ATzjV5nSQ2gslzmbPafyAaJ7qCTWgWMhObwt4IbT7WbYloaWCaDKOZ
         w+fPIaYREfdio4+K75ggMuicB0wAXwIEKoirL6Qvjm4dQTcPzpfUcRkommaJS2P4RC
         eTNvO7XLWUPKf2yk6T/CrWVhlsHG6FMP3HC1cO+I=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AE16760A33
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH 3/5] media: venus: Update clock scaling
Date:   Thu, 30 May 2019 19:28:26 +0530
Message-Id: <1559224708-6039-4-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559224708-6039-1-git-send-email-amasule@codeaurora.org>
References: <1559224708-6039-1-git-send-email-amasule@codeaurora.org>
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
index f7f724b..f2470af 100644
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
 
+static unsigned long calculate_inst_freq(struct venus_inst *inst,
+					 u32 filled_len)
+{
+	unsigned long vpp_cycles = 0;
+	u32 mbs_per_sec;
+
+	mbs_per_sec = load_per_instance(inst);
+	vpp_cycles = mbs_per_sec * inst->clk_data.codec_data->vpp_cycles;
+	/* 21 / 20 is overhead factor */
+	vpp_cycles += vpp_cycles / 20;
+
+	return vpp_cycles;
+}
+
+static int scale_clocks_vpu4(struct venus_inst *inst)
+{
+	struct venus_core *core = inst->core;
+	const struct freq_tbl *table = core->res->freq_tbl;
+	unsigned int num_rows = core->res->freq_tbl_size;
+
+	struct clk *clk = core->clks[0];
+	struct device *dev = core->dev;
+
+	unsigned int i;
+	u32 filled_len = 0;
+	unsigned long freq = 0, freq_core0 = 0, freq_core1 = 0;
+	int ret;
+
+	freq = calculate_inst_freq(inst, filled_len);
+
+	if (freq > table[0].freq)
+		goto err;
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
+			freq_core0 += inst->clk_data.freq;
+		} else if (inst->clk_data.core_id == VIDC_CORE_ID_2) {
+			freq_core1 += inst->clk_data.freq;
+		} else if (inst->clk_data.core_id == VIDC_CORE_ID_3) {
+			freq_core0 += inst->clk_data.freq;
+			freq_core1 += inst->clk_data.freq;
+		}
+	}
+	mutex_unlock(&core->lock);
+
+	freq = max(freq_core0, freq_core1);
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
+	if (IS_V3(inst->core) || IS_V1(inst->core))
+		return scale_clocks(inst);
+	else
+		return scale_clocks_vpu4(inst);
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

