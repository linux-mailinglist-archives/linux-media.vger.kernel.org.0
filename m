Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0C76124826
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 14:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbfLRNX7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 08:23:59 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37991 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbfLRNX7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 08:23:59 -0500
Received: by mail-lf1-f68.google.com with SMTP id r14so1691491lfm.5
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2019 05:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NVL5+pBVbAL5rpEkMW1hQcPnra9m/vRP70pZvH2RbgM=;
        b=TP/W6hrWPtyhXCnkJ/M9rO3u+zLh3YW8407ypXPQ0jPTnR218QRgcQEVS8vVPruxsJ
         b5iwm5Q3gQnNMqIY88TBmzVs2o3mwbIN+y+oXlF7OuTSeTHfB1isqtaI4Ln9XLACWMZm
         NPzC9Mh4i89TNToP9uCHGuInBM9Ec6CGNNt7ZG/AMWhruQEkhnQgpDzIA1IDfpSVCFuF
         TmKl2ATKudd2O2B4a3xB+L696oTUIm0K0e2jqliW3KMsB3heYCGcDZzCuA/+e34tMaZX
         +AmSE8c3El6Pb3H7UGz8qauHmaIKIkkawsaTaYVE9wXgB62Xk/Jyi2ilR2Qki6i9Tvi7
         ZbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NVL5+pBVbAL5rpEkMW1hQcPnra9m/vRP70pZvH2RbgM=;
        b=bHfkYyhlPq3o4oVILKhM1JWPEpyRRE/R5ar5pgf0j3D/tpimJ5mA/6BMkXuBdMkOIE
         5IS1BqjaPvBy4PtIqvmUL7cK4gNYQrVhL1VCmsFlcmmMe7LvUBPCYRCnnZpL7pBQShhx
         JyI4cx6Er4a+Ry+4m82t/MARF8sV+RNaIskTnKqan0JJEo1GhUbsgFbYTO+y+eOO2Qeq
         /wQKCGXthZw4x7ugT5sV5Gl73g9V32h7jS8pDgEvF+C07XpmzUgdMAf3gyhgyt1mApV5
         VRR9xmkq//PiL18AB9NtHDGWVPdGxRyrGDOXqwIjhGk1aMhNhpx4HWC54VM7qWquEtLL
         hHyA==
X-Gm-Message-State: APjAAAVJlj8sJkyw81HB68+UWMzf2OC95GuJtamF4jC9e/e27u0Wy100
        3lI7lR07T32InxD/mBebP7gN/A==
X-Google-Smtp-Source: APXvYqyEV2zH52TJucpVEAfjbOlJ0yPikw57AriZ+ObO+Ogbx38H64kV+wagfc75Q8ubHSaVt/OKTw==
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr1699990lfp.133.1576675436728;
        Wed, 18 Dec 2019 05:23:56 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id z7sm1440667lfa.81.2019.12.18.05.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 05:23:56 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Aniket Masule <amasule@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 02/12] media: venus: introduce core selection
Date:   Wed, 18 Dec 2019 15:22:41 +0200
Message-Id: <20191218132251.24161-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218132251.24161-1-stanimir.varbanov@linaro.org>
References: <20191218132251.24161-1-stanimir.varbanov@linaro.org>
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
 .../media/platform/qcom/venus/pm_helpers.c    | 183 ++++++++++++++++--
 .../media/platform/qcom/venus/pm_helpers.h    |  26 +++
 drivers/media/platform/qcom/venus/vdec.c      |  11 +-
 drivers/media/platform/qcom/venus/venc.c      |  10 +-
 9 files changed, 221 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index c66763e1b8f1..bfbd4a1ba089 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -181,6 +181,8 @@ struct venus_core {
 	struct delayed_work work;
 	struct venus_caps caps[MAX_CODEC_NUM];
 	unsigned int codecs_count;
+	unsigned int core0_usage_count;
+	unsigned int core1_usage_count;
 };
 
 struct vdec_controls {
@@ -379,6 +381,7 @@ struct venus_inst {
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
index 9531c01f067b..46d9d2fb5e23 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -14,6 +14,7 @@
 #include <media/v4l2-mem2mem.h>
 
 #include "core.h"
+#include "hfi_parser.h"
 #include "hfi_venus_io.h"
 #include "pm_helpers.h"
 
@@ -480,6 +481,173 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
 	return 0;
 }
 
+static void
+min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load)
+{
+	u32 mbs_per_sec, load, core1_load = 0, core2_load = 0;
+	u32 cores_max = core_num_max(inst);
+	struct venus_core *core = inst->core;
+	struct venus_inst *inst_pos;
+	unsigned long vpp_freq;
+	u32 coreid;
+
+	mutex_lock(&core->lock);
+
+	list_for_each_entry(inst_pos, &core->instances, list) {
+		if (inst_pos == inst)
+			continue;
+		vpp_freq = inst_pos->clk_data.codec_freq_data->vpp_freq;
+		coreid = inst_pos->clk_data.core_id;
+
+		mbs_per_sec = load_per_instance(inst_pos);
+		load = mbs_per_sec * vpp_freq;
+
+		if ((coreid & VIDC_CORE_ID_3) == VIDC_CORE_ID_3) {
+			core1_load += load / 2;
+			core2_load += load / 2;
+		} else if (coreid & VIDC_CORE_ID_1) {
+			core1_load += load;
+		} else if (coreid & VIDC_CORE_ID_2) {
+			core2_load += load;
+		}
+	}
+
+	*min_coreid = core1_load <= core2_load ?
+			VIDC_CORE_ID_1 : VIDC_CORE_ID_2;
+	*min_load = min(core1_load, core2_load);
+
+	if (cores_max < VIDC_CORE_ID_2 || core->res->vcodec_num < 2) {
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
+	unsigned int coreid_mask = 0;
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
+	unsigned int coreid_mask = 0;
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
+	struct venus_core *core = inst->core;
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
+		mutex_lock(&core->lock);
+		ret = acquire_core(inst);
+		mutex_unlock(&core->lock);
+	} else {
+		mutex_lock(&core->lock);
+		ret = release_core(inst);
+		mutex_unlock(&core->lock);
+	}
+
+	return ret;
+}
+
 static int vdec_get_v4(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -661,22 +829,12 @@ static void core_put_v4(struct device *dev)
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
@@ -786,6 +944,7 @@ static const struct venus_pm_ops pm_ops_v4 = {
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

