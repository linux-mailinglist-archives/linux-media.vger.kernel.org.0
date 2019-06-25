Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73E2255475
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 18:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729721AbfFYQ1x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 12:27:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:32938 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbfFYQ1x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 12:27:53 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D9A9F60DAD; Tue, 25 Jun 2019 16:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561480071;
        bh=/OlTaIbYmMzVi7h+oy3kmu3TL7g6ullRXjS2Vv957fU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=faoAkiYfAN7ZvIMqs1w+35mjGlJKltRVImJLmN590kn498bpkYIp5gnQPNaA0itNF
         L+O0b8qZ/ybc1Vn0m7tMKaqls7bckJjR53Sa/3ZKGh7v+It7L+8zkiz/JgQ16UzLfB
         O9Ae7xjaPDCwUHHCcSLbqinDoemPqpqLobscf/yY=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8FED860CF1;
        Tue, 25 Jun 2019 16:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561480069;
        bh=/OlTaIbYmMzVi7h+oy3kmu3TL7g6ullRXjS2Vv957fU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XZpArkCBb6U3sAvX0Cf3BCF5RNkZJlzG326JWyIIougdaYeNoCskYXWfrSyRw5loO
         OUi0aLe5h8p2p9+DNMHdIh6UWkj4vJr9ekeT9kwivF2uhbXOyJgkqzVagN26y8lJut
         G5GyBj9Gu1MIbRn9XKPpmG9xqZ12XOtVwAZtpbQ8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8FED860CF1
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH v3 2/4] media: venus: Update clock scaling
Date:   Tue, 25 Jun 2019 21:57:22 +0530
Message-Id: <1561480044-11834-3-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561480044-11834-1-git-send-email-amasule@codeaurora.org>
References: <1561480044-11834-1-git-send-email-amasule@codeaurora.org>
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
 drivers/media/platform/qcom/venus/helpers.c | 111 ++++++++++++++++++++++++----
 drivers/media/platform/qcom/venus/helpers.h |   2 +-
 drivers/media/platform/qcom/venus/vdec.c    |   2 +-
 drivers/media/platform/qcom/venus/venc.c    |   2 +-
 4 files changed, 99 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index f7f724b..e1a0247 100644
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
@@ -398,6 +399,86 @@ static int load_scale_clocks(struct venus_core *core)
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
+
+	struct clk *clk = core->clks[0];
+	struct device *dev = core->dev;
+	unsigned int i;
+	unsigned long freq = 0, freq_core0 = 0, freq_core1 = 0;
+	int ret;
+
+	freq = calculate_vpp_freq(inst);
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
+	if (IS_V4(inst->core))
+		return scale_clocks_v4(inst);
+
+	return scale_clocks(inst);
+}
+
 static void fill_buffer_desc(const struct venus_buffer *buf,
 			     struct hfi_buffer_desc *bd, bool response)
 {
@@ -715,35 +796,36 @@ int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage)
 }
 EXPORT_SYMBOL_GPL(venus_helper_set_core_usage);
 
-int venus_helper_init_codec_data(struct venus_inst *inst)
+int venus_helper_init_codec_freq_data(struct venus_inst *inst)
 {
-	const struct codec_data *codec_data;
-	unsigned int i, codec_data_size;
+	const struct codec_freq_data *codec_freq_data;
+	unsigned int i, codec_freq_data_size;
 	u32 pixfmt;
 	int ret = 0;
 
 	if (!IS_V4(inst->core))
 		return 0;
 
-	codec_data = inst->core->res->codec_data;
-	codec_data_size = inst->core->res->codec_data_size;
+	codec_freq_data = inst->core->res->codec_freq_data;
+	codec_freq_data_size = inst->core->res->codec_freq_data_size;
 	pixfmt = inst->session_type == VIDC_SESSION_TYPE_DEC ?
 			inst->fmt_out->pixfmt : inst->fmt_cap->pixfmt;
 
-	for (i = 0; i < codec_data_size; i++) {
-		if (codec_data[i].pixfmt == pixfmt &&
-		    codec_data[i].session_type == inst->session_type) {
-			inst->clk_data.codec_data = &codec_data[i];
+	for (i = 0; i < codec_freq_data_size; i++) {
+		if (codec_freq_data[i].pixfmt == pixfmt &&
+		    codec_freq_data[i].session_type == inst->session_type) {
+			inst->clk_data.codec_freq_data =
+				&codec_freq_data[i];
 			break;
 		}
 	}
 
-	if (!inst->clk_data.codec_data)
+	if (!inst->clk_data.codec_freq_data)
 		ret = -EINVAL;
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(venus_helper_init_codec_data);
+EXPORT_SYMBOL_GPL(venus_helper_init_codec_freq_data);
 
 int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
 			      unsigned int output_bufs,
@@ -1053,7 +1135,7 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
 
 		venus_helper_free_dpb_bufs(inst);
 
-		load_scale_clocks(core);
+		load_scale_clocks(inst);
 		INIT_LIST_HEAD(&inst->registeredbufs);
 	}
 
@@ -1070,7 +1152,6 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
 
 int venus_helper_vb2_start_streaming(struct venus_inst *inst)
 {
-	struct venus_core *core = inst->core;
 	int ret;
 
 	ret = intbufs_alloc(inst);
@@ -1081,7 +1162,7 @@ int venus_helper_vb2_start_streaming(struct venus_inst *inst)
 	if (ret)
 		goto err_bufs_free;
 
-	load_scale_clocks(core);
+	load_scale_clocks(inst);
 
 	ret = hfi_session_load_res(inst);
 	if (ret)
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index f9360a8..2c13245 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -41,7 +41,7 @@ int venus_helper_set_output_resolution(struct venus_inst *inst,
 				       unsigned int width, unsigned int height,
 				       u32 buftype);
 int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode);
-int venus_helper_init_codec_data(struct venus_inst *inst);
+int venus_helper_init_codec_freq_data(struct venus_inst *inst);
 int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage);
 int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
 			      unsigned int output_bufs,
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 51795fd..d037f80 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -660,7 +660,7 @@ static int vdec_init_session(struct venus_inst *inst)
 	if (ret)
 		goto deinit;
 
-	ret = venus_helper_init_codec_data(inst);
+	ret = venus_helper_init_codec_freq_data(inst);
 	if (ret)
 		goto deinit;
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 792cdce..cdddc82 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -847,7 +847,7 @@ static int venc_init_session(struct venus_inst *inst)
 	if (ret)
 		goto deinit;
 
-	ret = venus_helper_init_codec_data(inst);
+	ret = venus_helper_init_codec_freq_data(inst);
 	if (ret)
 		goto deinit;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

