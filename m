Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0CB76FBCF
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 11:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728770AbfGVJIC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 05:08:02 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39838 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728722AbfGVJIB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 05:08:01 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D7985616B9; Mon, 22 Jul 2019 09:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563786480;
        bh=C0Reu/Foyv5XofFdWplCK7R/JSEE5/EvcLOz0IpHnqA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xi7g8N82YlefhnEq5WL3wkmvioqrCYY5u4k3kRMhNVFEKFkrACMe+pAM4RC6vctSU
         1VPneeFAdH8L+Frq70YGsS4CXlW7uP0DczgMj6C2XgdYACKXhTmgnz3PFBUJ45mgPQ
         b6xy4eYIPEg6Za78PBp1FfFagCtn/+hLVwyJ8k4c=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AD272616B9;
        Mon, 22 Jul 2019 09:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563786479;
        bh=C0Reu/Foyv5XofFdWplCK7R/JSEE5/EvcLOz0IpHnqA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NmsWGpEb/1aKJ8I+CuVnXXMyfcOTccckMLoBT/z/WkW9OUsu1+hkjddqI1SGRtNGo
         Xmc6+FInfBxFRvjwoJr+wuPML6xQVNqRz2qI8+kIKSZFBTO+msu0p+ui4nOqcPrOvh
         BwLNImWiP5PMO3Hk1Ndj1gkXrIOIE+RhoP5GMXmc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AD272616B9
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH v6 4/4] media: venus: Update core selection
Date:   Mon, 22 Jul 2019 14:37:32 +0530
Message-Id: <1563786452-22188-4-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1563786452-22188-1-git-send-email-amasule@codeaurora.org>
References: <1563786452-22188-1-git-send-email-amasule@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Present core assignment is static. Introduced load balancing
across the cores. Load on earch core is calculated and core
with minimum load is assigned to given instance.

Signed-off-by: Aniket Masule <amasule@codeaurora.org>
---
 drivers/media/platform/qcom/venus/helpers.c    | 69 +++++++++++++++++++++++---
 drivers/media/platform/qcom/venus/helpers.h    |  2 +-
 drivers/media/platform/qcom/venus/hfi_helper.h |  1 +
 drivers/media/platform/qcom/venus/hfi_parser.h |  5 ++
 drivers/media/platform/qcom/venus/vdec.c       |  2 +-
 drivers/media/platform/qcom/venus/venc.c       |  2 +-
 6 files changed, 72 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index edf403d..3b6cbbf 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -26,6 +26,7 @@
 #include "helpers.h"
 #include "hfi_helper.h"
 #include "hfi_venus_io.h"
+#include "hfi_parser.h"
 
 struct intbuf {
 	struct list_head list;
@@ -331,6 +332,24 @@ static u32 load_per_instance(struct venus_inst *inst)
 	return mbs * inst->fps;
 }
 
+static u32 load_per_core(struct venus_core *core, u32 core_id)
+{
+	struct venus_inst *inst = NULL;
+	u32 mbs_per_sec = 0, load = 0;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(inst, &core->instances, list) {
+		if (inst->clk_data.core_id != core_id)
+			continue;
+
+		mbs_per_sec = load_per_instance(inst);
+		load += mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
+	}
+	mutex_unlock(&core->lock);
+
+	return load;
+}
+
 static u32 load_per_type(struct venus_core *core, u32 session_type)
 {
 	struct venus_inst *inst = NULL;
@@ -505,6 +524,16 @@ static int load_scale_clocks(struct venus_inst *inst)
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
@@ -808,19 +837,47 @@ int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode)
 }
 EXPORT_SYMBOL_GPL(venus_helper_set_work_mode);
 
-int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage)
+int venus_helper_set_core(struct venus_inst *inst)
 {
-	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
-	struct hfi_videocores_usage_type cu;
+	struct venus_core *core = inst->core;
+	u32 min_core_id = 0, core1_load = 0, core2_load = 0;
+	unsigned long min_load, max_freq, cur_inst_load;
+	u32 cores_max;
+	int ret;
 
 	if (!IS_V4(inst->core))
 		return 0;
 
-	cu.video_core_enable_mask = usage;
+	core1_load = load_per_core(core, VIDC_CORE_ID_1);
+	core2_load = load_per_core(core, VIDC_CORE_ID_2);
+	min_core_id = core1_load < core2_load ? VIDC_CORE_ID_1 : VIDC_CORE_ID_2;
+	min_load = min(core1_load, core2_load);
+	cores_max = core_num_max(inst);
 
-	return hfi_session_set_property(inst, ptype, &cu);
+	if (cores_max < VIDC_CORE_ID_2) {
+		min_core_id = VIDC_CORE_ID_1;
+		min_load = core1_load;
+	}
+
+	cur_inst_load = load_per_instance(inst) *
+		inst->clk_data.codec_freq_data->vpp_freq;
+	max_freq = core->res->freq_tbl[0].freq;
+
+	if ((cur_inst_load + min_load) > max_freq) {
+		dev_warn(core->dev, "HW is overloaded, needed: %lu max: %lu\n",
+			 cur_inst_load, max_freq);
+		return -EINVAL;
+	}
+
+	ret = set_core_usage(inst, min_core_id);
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
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 34ea503..f3d1018 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -559,6 +559,7 @@ struct hfi_bitrate {
 #define HFI_CAPABILITY_LCU_SIZE				0x14
 #define HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS	0x15
 #define HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE		0x16
+#define HFI_CAPABILITY_MAX_VIDEOCORES		0x2B
 
 struct hfi_capability {
 	u32 capability_type;
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.h b/drivers/media/platform/qcom/venus/hfi_parser.h
index 3e931c7..264e6dd 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.h
+++ b/drivers/media/platform/qcom/venus/hfi_parser.h
@@ -107,4 +107,9 @@ static inline u32 frate_step(struct venus_inst *inst)
 	return cap_step(inst, HFI_CAPABILITY_FRAMERATE);
 }
 
+static inline u32 core_num_max(struct venus_inst *inst)
+{
+	return cap_max(inst, HFI_CAPABILITY_MAX_VIDEOCORES);
+}
+
 #endif
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

