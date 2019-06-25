Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0C7E5547C
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 18:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731039AbfFYQ2F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 12:28:05 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33234 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbfFYQ2E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 12:28:04 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A08E260A33; Tue, 25 Jun 2019 16:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561480083;
        bh=j/aLZ2K7OgmMaNVxH2S9Nhs4Qa7kXy1oBXUzvQqtdHQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FlTvnMVjXKX0VHF5UznPuF7KW+/C5SPfoPIDIKYQxd2VYEfTi+vXlKREl2EljqhRT
         wv40AcspTR0DnTGQNa5iORoC4117irZn9/7p2zoxKNVP7Yl1Rz2mNAuqkziYCndulb
         XXmsuBb21c6/BaHp9L3bGmIhD2G4Hx9WQNkDUuz8=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 10C9E60E57;
        Tue, 25 Jun 2019 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561480082;
        bh=j/aLZ2K7OgmMaNVxH2S9Nhs4Qa7kXy1oBXUzvQqtdHQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NZ8NhzBZ26XY9rmA3LJoAb9HetwUoDYZyRT19C8xWbH/RE6nqXTSFY2WWlJmer5+2
         AoX3aL9ghVCRSKCbWuTAHltuw99FZZXvV9UHlGxBzQj8E/fvJY+Aq2oXSoX79ctUIS
         AXhIACc2MrotVlT2zI+z4c1nGRqe/gvK+jArTyS8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 10C9E60E57
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH v3 4/4] media: venus: Update core selection
Date:   Tue, 25 Jun 2019 21:57:24 +0530
Message-Id: <1561480044-11834-5-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561480044-11834-1-git-send-email-amasule@codeaurora.org>
References: <1561480044-11834-1-git-send-email-amasule@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Present core assignment is static. Introduced load balancing
across the cores. Load on earch core is calculated and core
with minimum load is assigned to given instance.

Signed-off-by: Aniket Masule <amasule@codeaurora.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 52 +++++++++++++++++++++++++----
 drivers/media/platform/qcom/venus/helpers.h |  2 +-
 drivers/media/platform/qcom/venus/vdec.c    |  2 +-
 drivers/media/platform/qcom/venus/venc.c    |  2 +-
 4 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index b79e83a..ef35fd8 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -498,6 +498,16 @@ static int load_scale_clocks(struct venus_inst *inst)
 	return scale_clocks(inst);
 }
 
+int set_core_usage(struct venus_inst *inst, u32 usage)
+{
+	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
+	struct hfi_videocores_usage_type cu;
+
+	cu.video_core_enable_mask = usage;
+
+	return hfi_session_set_property(inst, ptype, &cu);
+}
+
 static void fill_buffer_desc(const struct venus_buffer *buf,
 			     struct hfi_buffer_desc *bd, bool response)
 {
@@ -801,19 +811,49 @@ int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode)
 }
 EXPORT_SYMBOL_GPL(venus_helper_set_work_mode);
 
-int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage)
+int venus_helper_set_core(struct venus_inst *inst)
 {
-	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
-	struct hfi_videocores_usage_type cu;
+	struct venus_core *core = inst->core;
+	u32 min_core_id = 0, core0_load = 0, core1_load = 0;
+	unsigned long min_load, max_freq, cur_inst_load;
+	u32 cores_max;
+	int ret;
 
 	if (!IS_V4(inst->core))
 		return 0;
 
-	cu.video_core_enable_mask = usage;
+	core0_load = load_per_core(core, VIDC_CORE_ID_1);
+	core1_load = load_per_core(core, VIDC_CORE_ID_2);
 
-	return hfi_session_set_property(inst, ptype, &cu);
+	min_core_id = core0_load < core1_load ? VIDC_CORE_ID_1 : VIDC_CORE_ID_2;
+	min_load = min(core0_load, core1_load);
+	cores_max = core_num_max(inst);
+
+	if (cores_max < VIDC_CORE_ID_2) {
+		min_core_id = VIDC_CORE_ID_1;
+		min_load = core0_load;
+	}
+
+	cur_inst_load = load_per_instance(inst) *
+		inst->clk_data.codec_freq_data->vpp_freq;
+	max_freq = core->res->freq_tbl[0].freq;
+
+	if ((cur_inst_load + min_load)	> max_freq) {
+		dev_warn(core->dev, "HW is overloaded, needed: %lu max: %lu\n",
+			 cur_inst_load, max_freq);
+		return -EINVAL;
+	}
+
+	ret = set_core_usage(inst, min_core_id);
+
+	if (ret)
+		return ret;
+
+	inst->clk_data.core_id = min_core_id;
+
+	return 0;
 }
-EXPORT_SYMBOL_GPL(venus_helper_set_core_usage);
+EXPORT_SYMBOL_GPL(venus_helper_set_core);
 
 int venus_helper_init_codec_freq_data(struct venus_inst *inst)
 {
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 2c13245..1034111 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -42,7 +42,7 @@ int venus_helper_set_output_resolution(struct venus_inst *inst,
 				       u32 buftype);
 int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode);
 int venus_helper_init_codec_freq_data(struct venus_inst *inst);
-int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage);
+int venus_helper_set_core(struct venus_inst *inst);
 int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
 			      unsigned int output_bufs,
 			      unsigned int output2_bufs);
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index d037f80..620e060 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -551,7 +551,7 @@ static int vdec_output_conf(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
-	ret = venus_helper_set_core_usage(inst, VIDC_CORE_ID_1);
+	ret = venus_helper_set_core(inst);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index cdddc82..28e76cc 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -660,7 +660,7 @@ static int venc_set_properties(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
-	ret = venus_helper_set_core_usage(inst, VIDC_CORE_ID_2);
+	ret = venus_helper_set_core(inst);
 	if (ret)
 		return ret;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

