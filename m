Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFCD116860
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 09:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfLIIjS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 03:39:18 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38879 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727313AbfLIIjS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 03:39:18 -0500
Received: by mail-lf1-f67.google.com with SMTP id r14so9993641lfm.5
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2019 00:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=He6t0UxaZpAmu7uu3983tFNonS2D3TSq+7lw5wWZaw4=;
        b=n7x3zaPSm+SIgfnAzqehPd0Ye77W1oBMZ+fQegdK/G4C876Be+fF7to+xe+rruMqRe
         mMGdAd+oVM3Yazdrr/HiYHoXNCXkyeyLlDLcgzhiNadMHJXRlSGDrkQaMStVrgLikPx5
         /ozr+FHlkpAHWtxCE5IjvPGqfIMwpXdi9nGmf6kuNuWHh/lSYIGUoQFesgyVJ/eJtfY+
         ewrjENNWNO+0CxJXhA9himGXPEiADgXVqu0rIZiZ2no6k9D2erRztT2huyF1JYjowwXM
         O7kO1KcHE//XCOVUai1xc6zB2RplnzZB7oF9XNtn+vC0Rlbe7JYQhKTbZrkHO9hJk4xP
         20YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=He6t0UxaZpAmu7uu3983tFNonS2D3TSq+7lw5wWZaw4=;
        b=YIXQh4md957pviPVMRDeAK3FgA5htV4hHJcHZvSlXJlpgn26MV83RepxhECJ2LVMb1
         MFGNX0Hv5XVRZs6Jz7w3f+qgvYuK8/nui8P36F6We/WnH9nYjRciOr5IoaobzVVDefcc
         MFxDv1H+qFdKMhgyhMyicU5cxfGAXc0TjzYZc8yCGxt92uJyToS3bnZJ+ctZhIKei36X
         744v8HFB9Zwoc8CL5+R92MTg1a7rlkeRetk8BRXseh6EfoQDueenp2bJCwV7lMTMSXFv
         2miGMXreaQsNDPXl4jhgM2l8iPORZsoCP/qNTbZk/ZzaK2iQcVewLQlZWpBHSY5B4Zx/
         7x8g==
X-Gm-Message-State: APjAAAXfaGjf+WjmEGThLy2z6A4cB7e3k7f4Ni8KSWQzp+Udg5pX1pUS
        HvGmM0vwzQsrmfNabt7JR2dGSXW2kks=
X-Google-Smtp-Source: APXvYqw6gCAmeY37IUgqCFSLI6hdINJc2uTYgcbpU0Rkqh28rA92VRdvnpBAh9VGyw4w5mrCv97zbQ==
X-Received: by 2002:a19:c3cc:: with SMTP id t195mr6029067lff.144.1575880755416;
        Mon, 09 Dec 2019 00:39:15 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id r26sm10438971lfm.82.2019.12.09.00.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 00:39:14 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Aniket Masule <amasule@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/6] media: venus: introduce core selection
Date:   Mon,  9 Dec 2019 10:38:20 +0200
Message-Id: <20191209083824.806-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209083824.806-1-stanimir.varbanov@linaro.org>
References: <20191209083824.806-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Aniket Masule <amasule@codeaurora.org>

Presently the core (vcodec pipelines) assignment is static. Here we
introduce dynamic load balancing across the cores depending on the
current session load. The load on earch core is calculated and core
with minimum load is assigned to given instance. This will be
applicable on Venus v4 with more than one vcodec cores.

Signed-off-by: Aniket Masule <amasule@codeaurora.org>
Co-developed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h      |   3 +
 drivers/media/platform/qcom/venus/helpers.c   |  17 +-
 drivers/media/platform/qcom/venus/helpers.h   |   1 -
 .../media/platform/qcom/venus/hfi_helper.h    |   1 +
 .../media/platform/qcom/venus/hfi_parser.h    |   5 +
 .../media/platform/qcom/venus/pm_helpers.c    | 173 ++++++++++++++++--
 .../media/platform/qcom/venus/pm_helpers.h    |  26 +++
 drivers/media/platform/qcom/venus/vdec.c      |  11 +-
 drivers/media/platform/qcom/venus/venc.c      |  10 +-
 9 files changed, 211 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 179ff861a618..7efa5669dda3 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -177,6 +177,8 @@ struct venus_core {
 	struct delayed_work work;
 	struct venus_caps caps[MAX_CODEC_NUM];
 	unsigned int codecs_count;
+	unsigned int core0_usage_count;
+	unsigned int core1_usage_count;
 };
 
 struct vdec_controls {
@@ -375,6 +377,7 @@ struct venus_inst {
 	const struct hfi_inst_ops *ops;
 	u32 session_type;
 	union hfi_get_property hprop;
+	unsigned int core_acquired: 1;
 };
 
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index cbeeaf6077e0..043e0d8705a8 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -723,21 +723,6 @@ int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode)
 }
 EXPORT_SYMBOL_GPL(venus_helper_set_work_mode);
 
-int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage)
-{
-	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
-	struct hfi_videocores_usage_type cu;
-
-	inst->clk_data.core_id = usage;
-	if (!IS_V4(inst->core))
-		return 0;
-
-	cu.video_core_enable_mask = usage;
-
-	return hfi_session_set_property(inst, ptype, &cu);
-}
-EXPORT_SYMBOL_GPL(venus_helper_set_core_usage);
-
 int venus_helper_init_codec_freq_data(struct venus_inst *inst)
 {
 	const struct codec_freq_data *data;
@@ -1101,6 +1086,8 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
 	else
 		inst->streamon_cap = 0;
 
+	venus_pm_release_core(inst);
+
 	mutex_unlock(&inst->lock);
 }
 EXPORT_SYMBOL_GPL(venus_helper_vb2_stop_streaming);
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 44b50914cd12..b64875564064 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -34,7 +34,6 @@ int venus_helper_set_output_resolution(struct venus_inst *inst,
 				       u32 buftype);
 int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode);
 int venus_helper_init_codec_freq_data(struct venus_inst *inst);
-int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage);
 int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
 			      unsigned int output_bufs,
 			      unsigned int output2_bufs);
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index b70551e296b7..2a47f6c0a07a 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -550,6 +550,7 @@ struct hfi_bitrate {
 #define HFI_CAPABILITY_LCU_SIZE				0x14
 #define HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS	0x15
 #define HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE		0x16
+#define HFI_CAPABILITY_MAX_VIDEOCORES			0x2b
 
 struct hfi_capability {
 	u32 capability_type;
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.h b/drivers/media/platform/qcom/venus/hfi_parser.h
index 3e931c747e19..264e6dd2415f 100644
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
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 4e4aace2d8c8..794c9210ea46 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -14,6 +14,7 @@
 #include <media/v4l2-mem2mem.h>
 
 #include "core.h"
+#include "hfi_parser.h"
 #include "hfi_venus_io.h"
 #include "pm_helpers.h"
 
@@ -450,6 +451,163 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
 	return 0;
 }
 
+static void
+min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load)
+{
+	u32 mbs_per_sec, load, core1_load = 0, core2_load = 0;
+	u32 cores_max = core_num_max(inst);
+	struct venus_core *core = inst->core;
+	struct venus_inst *inst_pos;
+
+	mutex_lock(&core->lock);
+
+	list_for_each_entry(inst_pos, &core->instances, list) {
+		if (inst_pos == inst)
+			continue;
+		mbs_per_sec = load_per_instance(inst_pos);
+		load = mbs_per_sec *
+			inst_pos->clk_data.codec_freq_data->vpp_freq;
+		if (inst_pos->clk_data.core_id & VIDC_CORE_ID_3) {
+			core1_load += load / 2;
+			core2_load += load / 2;
+		} else if (inst_pos->clk_data.core_id & VIDC_CORE_ID_1) {
+			core1_load += load;
+		} else if (inst_pos->clk_data.core_id & VIDC_CORE_ID_2) {
+			core2_load += load;
+		}
+	}
+
+	*min_coreid = core1_load <= core2_load ?
+			VIDC_CORE_ID_1 : VIDC_CORE_ID_2;
+	*min_load = min(core1_load, core2_load);
+
+	if (cores_max < VIDC_CORE_ID_2) {
+		*min_coreid = VIDC_CORE_ID_1;
+		*min_load = core1_load;
+	}
+
+	mutex_unlock(&core->lock);
+}
+
+static int decide_core(struct venus_inst *inst)
+{
+	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
+	struct venus_core *core = inst->core;
+	u32 min_coreid, min_load, inst_load;
+	struct hfi_videocores_usage_type cu;
+	unsigned long max_freq;
+
+	if (legacy_binding) {
+		if (inst->session_type == VIDC_SESSION_TYPE_DEC)
+			cu.video_core_enable_mask = VIDC_CORE_ID_1;
+		else
+			cu.video_core_enable_mask = VIDC_CORE_ID_2;
+
+		goto done;
+	}
+
+	if (inst->clk_data.core_id != VIDC_CORE_ID_DEFAULT)
+		return 0;
+
+	inst_load = load_per_instance(inst);
+	inst_load *= inst->clk_data.codec_freq_data->vpp_freq;
+	max_freq = core->res->freq_tbl[0].freq;
+
+	min_loaded_core(inst, &min_coreid, &min_load);
+
+	if ((inst_load + min_load) > max_freq) {
+		dev_warn(core->dev, "HW is overloaded, needed: %u max: %lu\n",
+			 inst_load, max_freq);
+		return -EINVAL;
+	}
+
+	inst->clk_data.core_id = min_coreid;
+	cu.video_core_enable_mask = min_coreid;
+
+done:
+	return hfi_session_set_property(inst, ptype, &cu);
+}
+
+static int acquire_core(struct venus_inst *inst)
+{
+	struct venus_core *core = inst->core;
+	unsigned int coreid_mask;
+
+	if (inst->core_acquired)
+		return 0;
+
+	inst->core_acquired = true;
+
+	if (inst->clk_data.core_id & VIDC_CORE_ID_1) {
+		if (core->core0_usage_count++)
+			return 0;
+
+		coreid_mask = VIDC_CORE_ID_1;
+	}
+
+	if (inst->clk_data.core_id & VIDC_CORE_ID_2) {
+		if (core->core1_usage_count++)
+			return 0;
+
+		coreid_mask |= VIDC_CORE_ID_2;
+	}
+
+	return poweron_coreid(core, coreid_mask);
+}
+
+static int release_core(struct venus_inst *inst)
+{
+	struct venus_core *core = inst->core;
+	unsigned int coreid_mask;
+	int ret;
+
+	if (!inst->core_acquired)
+		return 0;
+
+	if (inst->clk_data.core_id & VIDC_CORE_ID_1) {
+		if (--core->core0_usage_count)
+			goto done;
+
+		coreid_mask = VIDC_CORE_ID_1;
+	}
+
+	if (inst->clk_data.core_id & VIDC_CORE_ID_2) {
+		if (--core->core1_usage_count)
+			goto done;
+
+		coreid_mask |= VIDC_CORE_ID_2;
+	}
+
+	ret = poweroff_coreid(core, coreid_mask);
+	if (ret)
+		return ret;
+
+done:
+	inst->clk_data.core_id = VIDC_CORE_ID_DEFAULT;
+	inst->core_acquired = false;
+	return 0;
+}
+
+static int coreid_power_v4(struct venus_inst *inst, int on)
+{
+	int ret;
+
+	if (legacy_binding)
+		return 0;
+
+	if (on == POWER_ON) {
+		ret = decide_core(inst);
+		if (ret)
+			return ret;
+
+		ret = acquire_core(inst);
+	} else {
+		ret = release_core(inst);
+	}
+
+	return ret;
+}
+
 static int vdec_get_v4(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -654,22 +812,12 @@ static void core_put_v4(struct device *dev)
 static int core_power_v4(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
-	const unsigned int coreid_mask = VIDC_CORE_ID_1 | VIDC_CORE_ID_2;
 	int ret = 0;
 
-	if (on == POWER_ON) {
+	if (on == POWER_ON)
 		ret = core_clks_enable(core);
-		if (ret)
-			return ret;
-
-		if (!legacy_binding)
-			ret = poweron_coreid(core, coreid_mask);
-	} else {
-		if (!legacy_binding)
-			ret = poweroff_coreid(core, coreid_mask);
-
+	else
 		core_clks_disable(core);
-	}
 
 	return ret;
 }
@@ -779,6 +927,7 @@ static const struct venus_pm_ops pm_ops_v4 = {
 	.venc_get = venc_get_v4,
 	.venc_put = venc_put_v4,
 	.venc_power = venc_power_v4,
+	.coreid_power = coreid_power_v4,
 	.load_scale = load_scale_v4,
 };
 
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.h b/drivers/media/platform/qcom/venus/pm_helpers.h
index d98b6dc20740..aa2f6afa2354 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.h
+++ b/drivers/media/platform/qcom/venus/pm_helpers.h
@@ -21,6 +21,8 @@ struct venus_pm_ops {
 	void (*venc_put)(struct device *dev);
 	int (*venc_power)(struct device *dev, int on);
 
+	int (*coreid_power)(struct venus_inst *inst, int on);
+
 	int (*load_scale)(struct venus_inst *inst);
 };
 
@@ -36,4 +38,28 @@ static inline int venus_pm_load_scale(struct venus_inst *inst)
 	return core->pm_ops->load_scale(inst);
 }
 
+static inline int venus_pm_acquire_core(struct venus_inst *inst)
+{
+	struct venus_core *core = inst->core;
+	const struct venus_pm_ops *pm_ops = core->pm_ops;
+	int ret = 0;
+
+	if (pm_ops && pm_ops->coreid_power)
+		ret = pm_ops->coreid_power(inst, POWER_ON);
+
+	return ret;
+}
+
+static inline int venus_pm_release_core(struct venus_inst *inst)
+{
+	struct venus_core *core = inst->core;
+	const struct venus_pm_ops *pm_ops = core->pm_ops;
+	int ret = 0;
+
+	if (pm_ops && pm_ops->coreid_power)
+		ret = pm_ops->coreid_power(inst, POWER_OFF);
+
+	return ret;
+}
+
 #endif
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 83ce30516591..7b7a4f3377cf 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -579,10 +579,6 @@ static int vdec_output_conf(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
-	ret = venus_helper_set_core_usage(inst, VIDC_CORE_ID_1);
-	if (ret)
-		return ret;
-
 	if (core->res->hfi_version == HFI_VERSION_1XX) {
 		ptype = HFI_PROPERTY_PARAM_VDEC_CONTINUE_DATA_TRANSFER;
 		ret = hfi_session_set_property(inst, ptype, &en);
@@ -951,6 +947,10 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	mutex_lock(&inst->lock);
 
+	ret = venus_pm_acquire_core(inst);
+	if (ret)
+		return ret;
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
 		ret = vdec_start_capture(inst);
 	else
@@ -1078,6 +1078,7 @@ static void vdec_session_release(struct venus_inst *inst)
 
 	venus_helper_free_dpb_bufs(inst);
 	venus_pm_load_scale(inst);
+	venus_pm_release_core(inst);
 	INIT_LIST_HEAD(&inst->registeredbufs);
 
 	mutex_unlock(&inst->lock);
@@ -1337,6 +1338,8 @@ static int vdec_open(struct file *file)
 	inst->num_output_bufs = 1;
 	inst->codec_state = VENUS_DEC_STATE_DEINIT;
 	inst->buf_count = 0;
+	inst->clk_data.core_id = VIDC_CORE_ID_DEFAULT;
+	inst->core_acquired = false;
 	init_waitqueue_head(&inst->reconf_wait);
 	venus_helper_init_instance(inst);
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 5fa1724cb537..4f594fe4b661 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -656,10 +656,6 @@ static int venc_set_properties(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
-	ret = venus_helper_set_core_usage(inst, VIDC_CORE_ID_2);
-	if (ret)
-		return ret;
-
 	ptype = HFI_PROPERTY_CONFIG_FRAME_RATE;
 	frate.buffer_type = HFI_BUFFER_OUTPUT;
 	frate.framerate = inst->fps * (1 << 16);
@@ -992,6 +988,10 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret)
 		goto bufs_done;
 
+	ret = venus_pm_acquire_core(inst);
+	if (ret)
+		goto deinit_sess;
+
 	ret = venc_set_properties(inst);
 	if (ret)
 		goto deinit_sess;
@@ -1160,6 +1160,8 @@ static int venc_open(struct file *file)
 
 	inst->core = core;
 	inst->session_type = VIDC_SESSION_TYPE_ENC;
+	inst->clk_data.core_id = VIDC_CORE_ID_DEFAULT;
+	inst->core_acquired = false;
 
 	venus_helper_init_instance(inst);
 
-- 
2.17.1

