Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2170BC17C
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 07:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409088AbfIXFsR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 01:48:17 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40682 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409084AbfIXFsQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 01:48:16 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E6B676115D; Tue, 24 Sep 2019 05:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569304094;
        bh=7qG8iDzio8rryd0akFpqKeVAR7pJj3BxUWNbO5DZmog=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JdsThZSnachWMXw4ACn41JHqUBQ3EqxblGAjsuOwyust/U93141jZYdH7PT0n/J6v
         WRZBguNmjGZZPMOfiy5qugJWlQgxL7rl9DtKs7mvOctTSMQx4tkG7a1rwvwKekl5Qy
         fkxvhsgoit9tEYw7z6RS4Ze+u/uIRaQqOwo21bF4=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3802160AA2;
        Tue, 24 Sep 2019 05:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569304094;
        bh=7qG8iDzio8rryd0akFpqKeVAR7pJj3BxUWNbO5DZmog=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JdsThZSnachWMXw4ACn41JHqUBQ3EqxblGAjsuOwyust/U93141jZYdH7PT0n/J6v
         WRZBguNmjGZZPMOfiy5qugJWlQgxL7rl9DtKs7mvOctTSMQx4tkG7a1rwvwKekl5Qy
         fkxvhsgoit9tEYw7z6RS4Ze+u/uIRaQqOwo21bF4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3802160AA2
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [RESEND v7 2/2] media: venus: Update clock scaling
Date:   Tue, 24 Sep 2019 11:17:49 +0530
Message-Id: <1569304069-20713-3-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1569304069-20713-1-git-send-email-amasule@codeaurora.org>
References: <1569304069-20713-1-git-send-email-amasule@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Current clock scaling calculations are same for vpu4 and
previous versions. For vpu4, Clock scaling calculations
are updated with cycles/mb and bitrate. This helps in
getting precise clock required.

Signed-off-by: Aniket Masule <amasule@codeaurora.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 157 ++++++++++++++++++++++++----
 drivers/media/platform/qcom/venus/helpers.h |   2 +-
 drivers/media/platform/qcom/venus/vdec.c    |   4 +-
 3 files changed, 140 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 71af237..e8476f5 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -448,12 +448,32 @@ static int load_scale_bw(struct venus_core *core)
 	return icc_set_bw(core->video_path, total_avg, total_peak);
 }
 
-int venus_helper_load_scale_clocks(struct venus_core *core)
+static int set_clk_freq(struct venus_core *core, unsigned long freq)
 {
+	struct clk *clk = core->clks[0];
+	int ret;
+
+	ret = clk_set_rate(clk, freq);
+	if (ret)
+		return ret;
+
+	ret = clk_set_rate(core->core0_clk, freq);
+	if (ret)
+		return ret;
+
+	ret = clk_set_rate(core->core1_clk, freq);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int scale_clocks(struct venus_inst *inst)
+{
+	struct venus_core *core = inst->core;
 	const struct freq_tbl *table = core->res->freq_tbl;
 	unsigned int num_rows = core->res->freq_tbl_size;
 	unsigned long freq = table[0].freq;
-	struct clk *clk = core->clks[0];
 	struct device *dev = core->dev;
 	u32 mbs_per_sec;
 	unsigned int i;
@@ -479,28 +499,123 @@ int venus_helper_load_scale_clocks(struct venus_core *core)
 
 set_freq:
 
-	ret = clk_set_rate(clk, freq);
-	if (ret)
-		goto err;
+	ret = set_clk_freq(core, freq);
+	if (ret) {
+		dev_err(dev, "failed to set clock rate %lu (%d)\n",
+			freq, ret);
+		return ret;
+	}
 
-	ret = clk_set_rate(core->core0_clk, freq);
-	if (ret)
-		goto err;
+	ret = load_scale_bw(core);
+	if (ret) {
+		dev_err(dev, "failed to set bandwidth (%d)\n",
+			ret);
+		return ret;
+	}
 
-	ret = clk_set_rate(core->core1_clk, freq);
-	if (ret)
-		goto err;
+	return 0;
+}
+
+static unsigned long calculate_inst_freq(struct venus_inst *inst,
+					 unsigned long filled_len)
+{
+	unsigned long vpp_freq = 0, vsp_freq = 0;
+	u64 fps = inst->fps;
+	u32 mbs_per_sec;
+
+	mbs_per_sec = load_per_instance(inst) / inst->fps;
+	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
+	/* 21 / 20 is overhead factor */
+	vpp_freq += vpp_freq / 20;
+	vsp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vsp_freq;
+
+	/* 10 / 7 is overhead factor */
+	if (inst->session_type == VIDC_SESSION_TYPE_ENC)
+		vsp_freq += (inst->controls.enc.bitrate * 10) / 7;
+	else
+		vsp_freq += ((fps * filled_len * 8) * 10) / 7;
+
+	return max(vpp_freq, vsp_freq);
+}
+
+static int scale_clocks_v4(struct venus_inst *inst)
+{
+	struct venus_core *core = inst->core;
+	const struct freq_tbl *table = core->res->freq_tbl;
+	unsigned int num_rows = core->res->freq_tbl_size;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct device *dev = core->dev;
+	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
+	unsigned long filled_len = 0;
+	struct venus_buffer *buf, *n;
+	struct vb2_buffer *vb;
+	int i, ret;
+
+	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
+		vb = &buf->vb.vb2_buf;
+		filled_len = max(filled_len, vb2_get_plane_payload(vb, 0));
+	}
+
+	if (inst->session_type == VIDC_SESSION_TYPE_DEC && !filled_len)
+		return 0;
+
+	freq = calculate_inst_freq(inst, filled_len);
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
+	if (freq >= table[0].freq) {
+		freq = table[0].freq;
+		dev_warn(dev, "HW is overloaded, needed: %lu max: %lu\n",
+			 freq, table[0].freq);
+		goto set_freq;
+	}
+
+	for (i = num_rows - 1 ; i >= 0; i--) {
+		if (freq <= table[i].freq) {
+			freq = table[i].freq;
+			break;
+		}
+	}
+
+set_freq:
+
+	ret = set_clk_freq(core, freq);
+	if (ret) {
+		dev_err(dev, "failed to set clock rate %lu (%d)\n",
+			freq, ret);
+		return ret;
+	}
 
 	ret = load_scale_bw(core);
-	if (ret)
-		goto err;
+	if (ret) {
+		dev_err(dev, "failed to set bandwidth (%d)\n",
+			ret);
+		return ret;
+	}
 
 	return 0;
+}
 
-err:
-	dev_err(dev, "failed to set clock rate %lu or bandwidth (%d)\n",
-		freq, ret);
-	return ret;
+int venus_helper_load_scale_clocks(struct venus_inst *inst)
+{
+	if (IS_V4(inst->core))
+		return scale_clocks_v4(inst);
+
+	return scale_clocks(inst);
 }
 EXPORT_SYMBOL_GPL(venus_helper_load_scale_clocks);
 
@@ -606,6 +721,8 @@ void venus_helper_get_ts_metadata(struct venus_inst *inst, u64 timestamp_us,
 
 		if (inst->session_type == VIDC_SESSION_TYPE_DEC)
 			put_ts_metadata(inst, vbuf);
+
+		venus_helper_load_scale_clocks(inst);
 	} else if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		if (inst->session_type == VIDC_SESSION_TYPE_ENC)
 			fdata.buffer_type = HFI_BUFFER_OUTPUT;
@@ -874,6 +991,7 @@ int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage)
 	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
 	struct hfi_videocores_usage_type cu;
 
+	inst->clk_data.core_id = usage;
 	if (!IS_V4(inst->core))
 		return 0;
 
@@ -1235,7 +1353,7 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
 
 		venus_helper_free_dpb_bufs(inst);
 
-		venus_helper_load_scale_clocks(core);
+		venus_helper_load_scale_clocks(inst);
 		INIT_LIST_HEAD(&inst->registeredbufs);
 	}
 
@@ -1288,7 +1406,6 @@ int venus_helper_process_initial_out_bufs(struct venus_inst *inst)
 
 int venus_helper_vb2_start_streaming(struct venus_inst *inst)
 {
-	struct venus_core *core = inst->core;
 	int ret;
 
 	ret = venus_helper_intbufs_alloc(inst);
@@ -1299,7 +1416,7 @@ int venus_helper_vb2_start_streaming(struct venus_inst *inst)
 	if (ret)
 		goto err_bufs_free;
 
-	venus_helper_load_scale_clocks(core);
+	venus_helper_load_scale_clocks(inst);
 
 	ret = hfi_session_load_res(inst);
 	if (ret)
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index ba44a28..934ac0f 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -61,7 +61,7 @@ int venus_helper_power_enable(struct venus_core *core, u32 session_type,
 int venus_helper_intbufs_realloc(struct venus_inst *inst);
 int venus_helper_queue_dpb_bufs(struct venus_inst *inst);
 int venus_helper_unregister_bufs(struct venus_inst *inst);
-int venus_helper_load_scale_clocks(struct venus_core *core);
+int venus_helper_load_scale_clocks(struct venus_inst *inst);
 int venus_helper_process_initial_cap_bufs(struct venus_inst *inst);
 int venus_helper_process_initial_out_bufs(struct venus_inst *inst);
 void venus_helper_get_ts_metadata(struct venus_inst *inst, u64 timestamp_us,
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 3261657..73325ed 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -857,7 +857,7 @@ static int vdec_start_capture(struct venus_inst *inst)
 	if (ret)
 		goto free_dpb_bufs;
 
-	venus_helper_load_scale_clocks(inst->core);
+	venus_helper_load_scale_clocks(inst);
 
 	ret = hfi_session_continue(inst);
 	if (ret)
@@ -1065,7 +1065,7 @@ static void vdec_session_release(struct venus_inst *inst)
 		hfi_session_abort(inst);
 
 	venus_helper_free_dpb_bufs(inst);
-	venus_helper_load_scale_clocks(core);
+	venus_helper_load_scale_clocks(inst);
 	INIT_LIST_HEAD(&inst->registeredbufs);
 
 	mutex_unlock(&inst->lock);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

