Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E59DA116850
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 09:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727330AbfLIIjT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 03:39:19 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39977 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727299AbfLIIjS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 03:39:18 -0500
Received: by mail-lf1-f67.google.com with SMTP id y5so9995899lfy.7
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2019 00:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=luQuoQiHyFLGPHFoUQ2T7meQcoSWdh7qwynN1/AVI+o=;
        b=Ei4mo98z/YBtmh4KvnpFOL1Yrazpxj+X+XpbMBwWfjgdiDdhJtLVCHcW6fJnW5iAvd
         H27DInbdx4eW2HNosf3UhYmyMxxYDypEe5aJK77Jh3c9yB09DAn/BvDm/Moep8Y7zpjI
         GuxGqggdUdJUYV2p1CxnNOawbe3bOUW8j/bo4jBvTx272ExNdGf6TPBM7jHmzQBGbAQP
         64S6k3synHm5bi6GFEGLYPBG0njLq4sH6ncGJeCwmdPHNCgmQWQqfr1Bkt2DB214z/PL
         lls3Ycv3cZzOBx7Auiqn9535OhKMlHn2GmnLVuemjii/0agoDA3gdzzHAJJv8SdM0sT4
         KdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=luQuoQiHyFLGPHFoUQ2T7meQcoSWdh7qwynN1/AVI+o=;
        b=IdRLbufYw1adxpne9tUgDcU04xiXNLR0Wq8POtFepYuoPiqyIWX1jll+mh78xL56zx
         3d9OD0ggeobHI3fFm2N3rpJA6qztnwCiLxdpZQIAEnd2am0lq3Sn9I0948X8UqfL/Gq2
         DmOi7rB5AG2cjjIpFz4x2fKAMbw+wc1/7URrGU6erV75suMg9pB1PtUue2unoacnm3sc
         Y4IoAtm8Dy8wro0zefQmKY+X6Sr9CIBvIqYb57V7i5aSLkS+XD5nFJCTxA2lUCsMy53H
         sSgQ8jtNsDZvv223jaBI0rK+6kdevuQg9O1wOM2bSw74sddB21UXEZI5tHqfTIBetOmh
         ticA==
X-Gm-Message-State: APjAAAX6LVmAZbs7ha+MYOVyL2TJtoh8GyTy+cwcYxuVGz2qnbS/ld21
        HmPX+0O63bsWnQjADmJ3i0rSKASm9NU=
X-Google-Smtp-Source: APXvYqzydkfOnplODtEK1VOBvjVKD5LzDO5B9Td01bPXy+bi/+B4ZcKE163pTGKpN63Fdbhc3iIlVg==
X-Received: by 2002:a19:4b87:: with SMTP id y129mr8734703lfa.32.1575880753378;
        Mon, 09 Dec 2019 00:39:13 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id r26sm10438971lfm.82.2019.12.09.00.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 00:39:12 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 1/6] venus: redesign clocks and pm domains control
Date:   Mon,  9 Dec 2019 10:38:19 +0200
Message-Id: <20191209083824.806-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209083824.806-1-stanimir.varbanov@linaro.org>
References: <20191209083824.806-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Redesign core (vcodec) clock control to give the venus core more
freedom to control them in order to make possible to use core
selection feature on Venus IP v4.

Move all clock and pmdomain functions in separate file and abstract
power control with common operations per Venus IP version.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/Makefile    |   2 +-
 drivers/media/platform/qcom/venus/core.c      |  89 +-
 drivers/media/platform/qcom/venus/core.h      |   5 +
 drivers/media/platform/qcom/venus/helpers.c   | 321 +------
 drivers/media/platform/qcom/venus/helpers.h   |   3 -
 .../media/platform/qcom/venus/pm_helpers.c    | 798 ++++++++++++++++++
 .../media/platform/qcom/venus/pm_helpers.h    |  39 +
 drivers/media/platform/qcom/venus/vdec.c      |  69 +-
 drivers/media/platform/qcom/venus/venc.c      |  65 +-
 9 files changed, 911 insertions(+), 480 deletions(-)
 create mode 100644 drivers/media/platform/qcom/venus/pm_helpers.c
 create mode 100644 drivers/media/platform/qcom/venus/pm_helpers.h

diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
index b44b11b03e12..64af0bc1edae 100644
--- a/drivers/media/platform/qcom/venus/Makefile
+++ b/drivers/media/platform/qcom/venus/Makefile
@@ -3,7 +3,7 @@
 
 venus-core-objs += core.o helpers.o firmware.o \
 		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
-		   hfi_parser.o
+		   hfi_parser.o pm_helpers.o
 
 venus-dec-objs += vdec.o vdec_ctrls.o
 venus-enc-objs += venc.o venc_ctrls.o
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 07312a2fab24..49d1e9c6481c 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
  * Copyright (C) 2017 Linaro Ltd.
  */
-#include <linux/clk.h>
 #include <linux/init.h>
 #include <linux/interconnect.h>
 #include <linux/ioctl.h>
@@ -19,9 +18,8 @@
 #include <media/v4l2-ioctl.h>
 
 #include "core.h"
-#include "vdec.h"
-#include "venc.h"
 #include "firmware.h"
+#include "pm_helpers.h"
 
 static void venus_event_notify(struct venus_core *core, u32 event)
 {
@@ -100,50 +98,6 @@ static void venus_sys_error_handler(struct work_struct *work)
 	mutex_unlock(&core->lock);
 }
 
-static int venus_clks_get(struct venus_core *core)
-{
-	const struct venus_resources *res = core->res;
-	struct device *dev = core->dev;
-	unsigned int i;
-
-	for (i = 0; i < res->clks_num; i++) {
-		core->clks[i] = devm_clk_get(dev, res->clks[i]);
-		if (IS_ERR(core->clks[i]))
-			return PTR_ERR(core->clks[i]);
-	}
-
-	return 0;
-}
-
-static int venus_clks_enable(struct venus_core *core)
-{
-	const struct venus_resources *res = core->res;
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < res->clks_num; i++) {
-		ret = clk_prepare_enable(core->clks[i]);
-		if (ret)
-			goto err;
-	}
-
-	return 0;
-err:
-	while (i--)
-		clk_disable_unprepare(core->clks[i]);
-
-	return ret;
-}
-
-static void venus_clks_disable(struct venus_core *core)
-{
-	const struct venus_resources *res = core->res;
-	unsigned int i = res->clks_num;
-
-	while (i--)
-		clk_disable_unprepare(core->clks[i]);
-}
-
 static u32 to_v4l2_codec_type(u32 codec)
 {
 	switch (codec) {
@@ -256,9 +210,15 @@ static int venus_probe(struct platform_device *pdev)
 	if (!core->res)
 		return -ENODEV;
 
-	ret = venus_clks_get(core);
-	if (ret)
-		return ret;
+	core->pm_ops = venus_pm_get(core->res->hfi_version);
+	if (!core->pm_ops)
+		return -ENODEV;
+
+	if (core->pm_ops->core_get) {
+		ret = core->pm_ops->core_get(dev);
+		if (ret)
+			return ret;
+	}
 
 	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
 	if (ret)
@@ -350,6 +310,7 @@ static int venus_probe(struct platform_device *pdev)
 static int venus_remove(struct platform_device *pdev)
 {
 	struct venus_core *core = platform_get_drvdata(pdev);
+	const struct venus_pm_ops *pm_ops = core->pm_ops;
 	struct device *dev = core->dev;
 	int ret;
 
@@ -368,6 +329,9 @@ static int venus_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 
+	if (pm_ops->core_put)
+		pm_ops->core_put(dev);
+
 	icc_put(core->video_path);
 	icc_put(core->cpucfg_path);
 
@@ -379,11 +343,15 @@ static int venus_remove(struct platform_device *pdev)
 static __maybe_unused int venus_runtime_suspend(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
+	const struct venus_pm_ops *pm_ops = core->pm_ops;
 	int ret;
 
 	ret = hfi_core_suspend(core);
+	if (ret)
+		return ret;
 
-	venus_clks_disable(core);
+	if (pm_ops->core_power)
+		ret = pm_ops->core_power(dev, POWER_OFF);
 
 	return ret;
 }
@@ -391,21 +359,16 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
 static __maybe_unused int venus_runtime_resume(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
+	const struct venus_pm_ops *pm_ops = core->pm_ops;
 	int ret;
 
-	ret = venus_clks_enable(core);
-	if (ret)
-		return ret;
-
-	ret = hfi_core_resume(core, false);
-	if (ret)
-		goto err_clks_disable;
-
-	return 0;
+	if (pm_ops->core_power) {
+		ret = pm_ops->core_power(dev, POWER_ON);
+		if (ret)
+			return ret;
+	}
 
-err_clks_disable:
-	venus_clks_disable(core);
-	return ret;
+	return hfi_core_resume(core, false);
 }
 
 static const struct dev_pm_ops venus_pm_ops = {
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 11585fb3cae3..179ff861a618 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -138,6 +138,10 @@ struct venus_core {
 	struct clk *core1_bus_clk;
 	struct icc_path *video_path;
 	struct icc_path *cpucfg_path;
+	struct device *pd_core;
+	struct device_link *pd_dl_venus;
+	struct device *pd_core0;
+	struct device *pd_core1;
 	struct video_device *vdev_dec;
 	struct video_device *vdev_enc;
 	struct v4l2_device v4l2_dev;
@@ -159,6 +163,7 @@ struct venus_core {
 	unsigned int error;
 	bool sys_error;
 	const struct hfi_core_ops *core_ops;
+	const struct venus_pm_ops *pm_ops;
 	unsigned long enc_codecs;
 	unsigned long dec_codecs;
 	unsigned int max_sessions_supported;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index a172f1ac0b35..cbeeaf6077e0 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -3,12 +3,8 @@
  * Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
  * Copyright (C) 2017 Linaro Ltd.
  */
-#include <linux/clk.h>
-#include <linux/iopoll.h>
-#include <linux/interconnect.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
-#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <media/videobuf2-dma-sg.h>
 #include <media/v4l2-mem2mem.h>
@@ -17,7 +13,7 @@
 #include "core.h"
 #include "helpers.h"
 #include "hfi_helper.h"
-#include "hfi_venus_io.h"
+#include "pm_helpers.h"
 
 struct intbuf {
 	struct list_head list;
@@ -360,266 +356,6 @@ int venus_helper_intbufs_realloc(struct venus_inst *inst)
 }
 EXPORT_SYMBOL_GPL(venus_helper_intbufs_realloc);
 
-static u32 load_per_instance(struct venus_inst *inst)
-{
-	u32 mbs;
-
-	if (!inst || !(inst->state >= INST_INIT && inst->state < INST_STOP))
-		return 0;
-
-	mbs = (ALIGN(inst->width, 16) / 16) * (ALIGN(inst->height, 16) / 16);
-
-	return mbs * inst->fps;
-}
-
-static u32 load_per_type(struct venus_core *core, u32 session_type)
-{
-	struct venus_inst *inst = NULL;
-	u32 mbs_per_sec = 0;
-
-	mutex_lock(&core->lock);
-	list_for_each_entry(inst, &core->instances, list) {
-		if (inst->session_type != session_type)
-			continue;
-
-		mbs_per_sec += load_per_instance(inst);
-	}
-	mutex_unlock(&core->lock);
-
-	return mbs_per_sec;
-}
-
-static void mbs_to_bw(struct venus_inst *inst, u32 mbs, u32 *avg, u32 *peak)
-{
-	const struct venus_resources *res = inst->core->res;
-	const struct bw_tbl *bw_tbl;
-	unsigned int num_rows, i;
-
-	*avg = 0;
-	*peak = 0;
-
-	if (mbs == 0)
-		return;
-
-	if (inst->session_type == VIDC_SESSION_TYPE_ENC) {
-		num_rows = res->bw_tbl_enc_size;
-		bw_tbl = res->bw_tbl_enc;
-	} else if (inst->session_type == VIDC_SESSION_TYPE_DEC) {
-		num_rows = res->bw_tbl_dec_size;
-		bw_tbl = res->bw_tbl_dec;
-	} else {
-		return;
-	}
-
-	if (!bw_tbl || num_rows == 0)
-		return;
-
-	for (i = 0; i < num_rows; i++) {
-		if (mbs > bw_tbl[i].mbs_per_sec)
-			break;
-
-		if (inst->dpb_fmt & HFI_COLOR_FORMAT_10_BIT_BASE) {
-			*avg = bw_tbl[i].avg_10bit;
-			*peak = bw_tbl[i].peak_10bit;
-		} else {
-			*avg = bw_tbl[i].avg;
-			*peak = bw_tbl[i].peak;
-		}
-	}
-}
-
-static int load_scale_bw(struct venus_core *core)
-{
-	struct venus_inst *inst = NULL;
-	u32 mbs_per_sec, avg, peak, total_avg = 0, total_peak = 0;
-
-	mutex_lock(&core->lock);
-	list_for_each_entry(inst, &core->instances, list) {
-		mbs_per_sec = load_per_instance(inst);
-		mbs_to_bw(inst, mbs_per_sec, &avg, &peak);
-		total_avg += avg;
-		total_peak += peak;
-	}
-	mutex_unlock(&core->lock);
-
-	dev_dbg(core->dev, "total: avg_bw: %u, peak_bw: %u\n",
-		total_avg, total_peak);
-
-	return icc_set_bw(core->video_path, total_avg, total_peak);
-}
-
-static int set_clk_freq(struct venus_core *core, unsigned long freq)
-{
-	struct clk *clk = core->clks[0];
-	int ret;
-
-	ret = clk_set_rate(clk, freq);
-	if (ret)
-		return ret;
-
-	ret = clk_set_rate(core->core0_clk, freq);
-	if (ret)
-		return ret;
-
-	ret = clk_set_rate(core->core1_clk, freq);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-static int scale_clocks(struct venus_inst *inst)
-{
-	struct venus_core *core = inst->core;
-	const struct freq_tbl *table = core->res->freq_tbl;
-	unsigned int num_rows = core->res->freq_tbl_size;
-	unsigned long freq = table[0].freq;
-	struct device *dev = core->dev;
-	u32 mbs_per_sec;
-	unsigned int i;
-	int ret;
-
-	mbs_per_sec = load_per_type(core, VIDC_SESSION_TYPE_ENC) +
-		      load_per_type(core, VIDC_SESSION_TYPE_DEC);
-
-	if (mbs_per_sec > core->res->max_load)
-		dev_warn(dev, "HW is overloaded, needed: %d max: %d\n",
-			 mbs_per_sec, core->res->max_load);
-
-	if (!mbs_per_sec && num_rows > 1) {
-		freq = table[num_rows - 1].freq;
-		goto set_freq;
-	}
-
-	for (i = 0; i < num_rows; i++) {
-		if (mbs_per_sec > table[i].load)
-			break;
-		freq = table[i].freq;
-	}
-
-set_freq:
-
-	ret = set_clk_freq(core, freq);
-	if (ret) {
-		dev_err(dev, "failed to set clock rate %lu (%d)\n",
-			freq, ret);
-		return ret;
-	}
-
-	ret = load_scale_bw(core);
-	if (ret) {
-		dev_err(dev, "failed to set bandwidth (%d)\n",
-			ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-static unsigned long calculate_inst_freq(struct venus_inst *inst,
-					 unsigned long filled_len)
-{
-	unsigned long vpp_freq = 0, vsp_freq = 0;
-	u32 fps = (u32)inst->fps;
-	u32 mbs_per_sec;
-
-	mbs_per_sec = load_per_instance(inst) / fps;
-
-	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
-	/* 21 / 20 is overhead factor */
-	vpp_freq += vpp_freq / 20;
-	vsp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vsp_freq;
-
-	/* 10 / 7 is overhead factor */
-	if (inst->session_type == VIDC_SESSION_TYPE_ENC)
-		vsp_freq += (inst->controls.enc.bitrate * 10) / 7;
-	else
-		vsp_freq += ((fps * filled_len * 8) * 10) / 7;
-
-	return max(vpp_freq, vsp_freq);
-}
-
-static int scale_clocks_v4(struct venus_inst *inst)
-{
-	struct venus_core *core = inst->core;
-	const struct freq_tbl *table = core->res->freq_tbl;
-	unsigned int num_rows = core->res->freq_tbl_size;
-	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
-	struct device *dev = core->dev;
-	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
-	unsigned long filled_len = 0;
-	struct venus_buffer *buf, *n;
-	struct vb2_buffer *vb;
-	int i, ret;
-
-	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
-		vb = &buf->vb.vb2_buf;
-		filled_len = max(filled_len, vb2_get_plane_payload(vb, 0));
-	}
-
-	if (inst->session_type == VIDC_SESSION_TYPE_DEC && !filled_len)
-		return 0;
-
-	freq = calculate_inst_freq(inst, filled_len);
-	inst->clk_data.freq = freq;
-
-	mutex_lock(&core->lock);
-	list_for_each_entry(inst, &core->instances, list) {
-		if (inst->clk_data.core_id == VIDC_CORE_ID_1) {
-			freq_core1 += inst->clk_data.freq;
-		} else if (inst->clk_data.core_id == VIDC_CORE_ID_2) {
-			freq_core2 += inst->clk_data.freq;
-		} else if (inst->clk_data.core_id == VIDC_CORE_ID_3) {
-			freq_core1 += inst->clk_data.freq;
-			freq_core2 += inst->clk_data.freq;
-		}
-	}
-	mutex_unlock(&core->lock);
-
-	freq = max(freq_core1, freq_core2);
-
-	if (freq >= table[0].freq) {
-		freq = table[0].freq;
-		dev_warn(dev, "HW is overloaded, needed: %lu max: %lu\n",
-			 freq, table[0].freq);
-		goto set_freq;
-	}
-
-	for (i = num_rows - 1 ; i >= 0; i--) {
-		if (freq <= table[i].freq) {
-			freq = table[i].freq;
-			break;
-		}
-	}
-
-set_freq:
-
-	ret = set_clk_freq(core, freq);
-	if (ret) {
-		dev_err(dev, "failed to set clock rate %lu (%d)\n",
-			freq, ret);
-		return ret;
-	}
-
-	ret = load_scale_bw(core);
-	if (ret) {
-		dev_err(dev, "failed to set bandwidth (%d)\n",
-			ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-int venus_helper_load_scale_clocks(struct venus_inst *inst)
-{
-	if (IS_V4(inst->core))
-		return scale_clocks_v4(inst);
-
-	return scale_clocks(inst);
-}
-EXPORT_SYMBOL_GPL(venus_helper_load_scale_clocks);
-
 static void fill_buffer_desc(const struct venus_buffer *buf,
 			     struct hfi_buffer_desc *bd, bool response)
 {
@@ -723,7 +459,7 @@ session_process_buf(struct venus_inst *inst, struct vb2_v4l2_buffer *vbuf)
 		if (inst->session_type == VIDC_SESSION_TYPE_DEC)
 			put_ts_metadata(inst, vbuf);
 
-		venus_helper_load_scale_clocks(inst);
+		venus_pm_load_scale(inst);
 	} else if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		if (inst->session_type == VIDC_SESSION_TYPE_ENC)
 			fdata.buffer_type = HFI_BUFFER_OUTPUT;
@@ -1354,7 +1090,7 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
 
 		venus_helper_free_dpb_bufs(inst);
 
-		venus_helper_load_scale_clocks(inst);
+		venus_pm_load_scale(inst);
 		INIT_LIST_HEAD(&inst->registeredbufs);
 	}
 
@@ -1417,7 +1153,7 @@ int venus_helper_vb2_start_streaming(struct venus_inst *inst)
 	if (ret)
 		goto err_bufs_free;
 
-	venus_helper_load_scale_clocks(inst);
+	venus_pm_load_scale(inst);
 
 	ret = hfi_session_load_res(inst);
 	if (ret)
@@ -1542,52 +1278,3 @@ int venus_helper_get_out_fmts(struct venus_inst *inst, u32 v4l2_fmt,
 	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(venus_helper_get_out_fmts);
-
-int venus_helper_power_enable(struct venus_core *core, u32 session_type,
-			      bool enable)
-{
-	void __iomem *ctrl, *stat;
-	u32 val;
-	int ret;
-
-	if (!IS_V3(core) && !IS_V4(core))
-		return 0;
-
-	if (IS_V3(core)) {
-		if (session_type == VIDC_SESSION_TYPE_DEC)
-			ctrl = core->base + WRAPPER_VDEC_VCODEC_POWER_CONTROL;
-		else
-			ctrl = core->base + WRAPPER_VENC_VCODEC_POWER_CONTROL;
-		if (enable)
-			writel(0, ctrl);
-		else
-			writel(1, ctrl);
-
-		return 0;
-	}
-
-	if (session_type == VIDC_SESSION_TYPE_DEC) {
-		ctrl = core->base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
-		stat = core->base + WRAPPER_VCODEC0_MMCC_POWER_STATUS;
-	} else {
-		ctrl = core->base + WRAPPER_VCODEC1_MMCC_POWER_CONTROL;
-		stat = core->base + WRAPPER_VCODEC1_MMCC_POWER_STATUS;
-	}
-
-	if (enable) {
-		writel(0, ctrl);
-
-		ret = readl_poll_timeout(stat, val, val & BIT(1), 1, 100);
-		if (ret)
-			return ret;
-	} else {
-		writel(1, ctrl);
-
-		ret = readl_poll_timeout(stat, val, !(val & BIT(1)), 1, 100);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(venus_helper_power_enable);
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 34dcd0c13f06..44b50914cd12 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -53,14 +53,11 @@ int venus_helper_get_out_fmts(struct venus_inst *inst, u32 fmt, u32 *out_fmt,
 			      u32 *out2_fmt, bool ubwc);
 int venus_helper_alloc_dpb_bufs(struct venus_inst *inst);
 int venus_helper_free_dpb_bufs(struct venus_inst *inst);
-int venus_helper_power_enable(struct venus_core *core, u32 session_type,
-			      bool enable);
 int venus_helper_intbufs_alloc(struct venus_inst *inst);
 int venus_helper_intbufs_free(struct venus_inst *inst);
 int venus_helper_intbufs_realloc(struct venus_inst *inst);
 int venus_helper_queue_dpb_bufs(struct venus_inst *inst);
 int venus_helper_unregister_bufs(struct venus_inst *inst);
-int venus_helper_load_scale_clocks(struct venus_inst *inst);
 int venus_helper_process_initial_cap_bufs(struct venus_inst *inst);
 int venus_helper_process_initial_out_bufs(struct venus_inst *inst);
 void venus_helper_get_ts_metadata(struct venus_inst *inst, u64 timestamp_us,
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
new file mode 100644
index 000000000000..4e4aace2d8c8
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -0,0 +1,798 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Linaro Ltd.
+ *
+ * Author: Stanimir Varbanov <stanimir.varbanov@linaro.org>
+ */
+#include <linux/clk.h>
+#include <linux/interconnect.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/types.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "core.h"
+#include "hfi_venus_io.h"
+#include "pm_helpers.h"
+
+static bool legacy_binding;
+
+static int core_clks_get(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+	struct device *dev = core->dev;
+	unsigned int i;
+
+	for (i = 0; i < res->clks_num; i++) {
+		core->clks[i] = devm_clk_get(dev, res->clks[i]);
+		if (IS_ERR(core->clks[i]))
+			return PTR_ERR(core->clks[i]);
+	}
+
+	return 0;
+}
+
+static int core_clks_enable(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < res->clks_num; i++) {
+		ret = clk_prepare_enable(core->clks[i]);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+err:
+	while (i--)
+		clk_disable_unprepare(core->clks[i]);
+
+	return ret;
+}
+
+static void core_clks_disable(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+	unsigned int i = res->clks_num;
+
+	while (i--)
+		clk_disable_unprepare(core->clks[i]);
+}
+
+static int core_clks_set_rate(struct venus_core *core, unsigned long freq)
+{
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
+static u32 load_per_instance(struct venus_inst *inst)
+{
+	u32 mbs;
+
+	if (!inst || !(inst->state >= INST_INIT && inst->state < INST_STOP))
+		return 0;
+
+	mbs = (ALIGN(inst->width, 16) / 16) * (ALIGN(inst->height, 16) / 16);
+
+	return mbs * inst->fps;
+}
+
+static u32 load_per_type(struct venus_core *core, u32 session_type)
+{
+	struct venus_inst *inst = NULL;
+	u32 mbs_per_sec = 0;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(inst, &core->instances, list) {
+		if (inst->session_type != session_type)
+			continue;
+
+		mbs_per_sec += load_per_instance(inst);
+	}
+	mutex_unlock(&core->lock);
+
+	return mbs_per_sec;
+}
+
+static void mbs_to_bw(struct venus_inst *inst, u32 mbs, u32 *avg, u32 *peak)
+{
+	const struct venus_resources *res = inst->core->res;
+	const struct bw_tbl *bw_tbl;
+	unsigned int num_rows, i;
+
+	*avg = 0;
+	*peak = 0;
+
+	if (mbs == 0)
+		return;
+
+	if (inst->session_type == VIDC_SESSION_TYPE_ENC) {
+		num_rows = res->bw_tbl_enc_size;
+		bw_tbl = res->bw_tbl_enc;
+	} else if (inst->session_type == VIDC_SESSION_TYPE_DEC) {
+		num_rows = res->bw_tbl_dec_size;
+		bw_tbl = res->bw_tbl_dec;
+	} else {
+		return;
+	}
+
+	if (!bw_tbl || num_rows == 0)
+		return;
+
+	for (i = 0; i < num_rows; i++) {
+		if (mbs > bw_tbl[i].mbs_per_sec)
+			break;
+
+		if (inst->dpb_fmt & HFI_COLOR_FORMAT_10_BIT_BASE) {
+			*avg = bw_tbl[i].avg_10bit;
+			*peak = bw_tbl[i].peak_10bit;
+		} else {
+			*avg = bw_tbl[i].avg;
+			*peak = bw_tbl[i].peak;
+		}
+	}
+}
+
+static int load_scale_bw(struct venus_core *core)
+{
+	struct venus_inst *inst = NULL;
+	u32 mbs_per_sec, avg, peak, total_avg = 0, total_peak = 0;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(inst, &core->instances, list) {
+		mbs_per_sec = load_per_instance(inst);
+		mbs_to_bw(inst, mbs_per_sec, &avg, &peak);
+		total_avg += avg;
+		total_peak += peak;
+	}
+	mutex_unlock(&core->lock);
+
+	dev_dbg(core->dev, "total: avg_bw: %u, peak_bw: %u\n",
+		total_avg, total_peak);
+
+	return icc_set_bw(core->video_path, total_avg, total_peak);
+}
+
+static int load_scale_v1(struct venus_inst *inst)
+{
+	struct venus_core *core = inst->core;
+	const struct freq_tbl *table = core->res->freq_tbl;
+	unsigned int num_rows = core->res->freq_tbl_size;
+	unsigned long freq = table[0].freq;
+	struct device *dev = core->dev;
+	u32 mbs_per_sec;
+	unsigned int i;
+	int ret;
+
+	mbs_per_sec = load_per_type(core, VIDC_SESSION_TYPE_ENC) +
+		      load_per_type(core, VIDC_SESSION_TYPE_DEC);
+
+	if (mbs_per_sec > core->res->max_load)
+		dev_warn(dev, "HW is overloaded, needed: %d max: %d\n",
+			 mbs_per_sec, core->res->max_load);
+
+	if (!mbs_per_sec && num_rows > 1) {
+		freq = table[num_rows - 1].freq;
+		goto set_freq;
+	}
+
+	for (i = 0; i < num_rows; i++) {
+		if (mbs_per_sec > table[i].load)
+			break;
+		freq = table[i].freq;
+	}
+
+set_freq:
+
+	ret = core_clks_set_rate(core, freq);
+	if (ret) {
+		dev_err(dev, "failed to set clock rate %lu (%d)\n",
+			freq, ret);
+		return ret;
+	}
+
+	ret = load_scale_bw(core);
+	if (ret) {
+		dev_err(dev, "failed to set bandwidth (%d)\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int core_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return core_clks_get(core);
+}
+
+static int core_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (on == POWER_ON)
+		ret = core_clks_enable(core);
+	else
+		core_clks_disable(core);
+
+	return ret;
+}
+
+static const struct venus_pm_ops pm_ops_v1 = {
+	.core_get = core_get_v1,
+	.core_power = core_power_v1,
+	.load_scale = load_scale_v1,
+};
+
+static void
+vcodec_control_v3(struct venus_core *core, u32 session_type, bool enable)
+{
+	void __iomem *ctrl;
+
+	if (session_type == VIDC_SESSION_TYPE_DEC)
+		ctrl = core->base + WRAPPER_VDEC_VCODEC_POWER_CONTROL;
+	else
+		ctrl = core->base + WRAPPER_VENC_VCODEC_POWER_CONTROL;
+
+	if (enable)
+		writel(0, ctrl);
+	else
+		writel(1, ctrl);
+}
+
+static int vdec_get_v3(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	core->core0_clk = devm_clk_get(dev, "core");
+	if (IS_ERR(core->core0_clk))
+		return PTR_ERR(core->core0_clk);
+
+	return 0;
+}
+
+static int vdec_power_v3(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	vcodec_control_v3(core, VIDC_SESSION_TYPE_DEC, true);
+
+	if (on == POWER_ON)
+		ret = clk_prepare_enable(core->core0_clk);
+	else
+		clk_disable_unprepare(core->core0_clk);
+
+	vcodec_control_v3(core, VIDC_SESSION_TYPE_DEC, false);
+
+	return ret;
+}
+
+static int venc_get_v3(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	core->core1_clk = devm_clk_get(dev, "core");
+	if (IS_ERR(core->core1_clk))
+		return PTR_ERR(core->core1_clk);
+
+	return 0;
+}
+
+static int venc_power_v3(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	vcodec_control_v3(core, VIDC_SESSION_TYPE_ENC, true);
+
+	if (on == POWER_ON)
+		ret = clk_prepare_enable(core->core1_clk);
+	else
+		clk_disable_unprepare(core->core1_clk);
+
+	vcodec_control_v3(core, VIDC_SESSION_TYPE_ENC, false);
+
+	return ret;
+}
+
+static const struct venus_pm_ops pm_ops_v3 = {
+	.core_get = core_get_v1,
+	.core_power = core_power_v1,
+	.vdec_get = vdec_get_v3,
+	.vdec_power = vdec_power_v3,
+	.venc_get = venc_get_v3,
+	.venc_power = venc_power_v3,
+	.load_scale = load_scale_v1,
+};
+
+static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool enable)
+{
+	void __iomem *ctrl, *stat;
+	u32 val;
+	int ret;
+
+	if (coreid == VIDC_CORE_ID_1) {
+		ctrl = core->base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
+		stat = core->base + WRAPPER_VCODEC0_MMCC_POWER_STATUS;
+	} else {
+		ctrl = core->base + WRAPPER_VCODEC1_MMCC_POWER_CONTROL;
+		stat = core->base + WRAPPER_VCODEC1_MMCC_POWER_STATUS;
+	}
+
+	if (enable) {
+		writel(0, ctrl);
+
+		ret = readl_poll_timeout(stat, val, val & BIT(1), 1, 100);
+		if (ret)
+			return ret;
+	} else {
+		writel(1, ctrl);
+
+		ret = readl_poll_timeout(stat, val, !(val & BIT(1)), 1, 100);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
+{
+	int ret;
+
+	if (coreid_mask & VIDC_CORE_ID_1) {
+		ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
+		if (ret)
+			return ret;
+
+		clk_disable_unprepare(core->core0_bus_clk);
+		clk_disable_unprepare(core->core0_clk);
+
+		ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
+		if (ret)
+			return ret;
+
+		ret = pm_runtime_put_sync(core->pd_core0);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (coreid_mask & VIDC_CORE_ID_2) {
+		ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
+		if (ret)
+			return ret;
+
+		clk_disable_unprepare(core->core1_bus_clk);
+		clk_disable_unprepare(core->core1_clk);
+
+		ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
+		if (ret)
+			return ret;
+
+		ret = pm_runtime_put_sync(core->pd_core1);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
+{
+	int ret;
+
+	if (coreid_mask & VIDC_CORE_ID_1) {
+		ret = pm_runtime_get_sync(core->pd_core0);
+		if (ret < 0)
+			return ret;
+
+		ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
+		if (ret)
+			return ret;
+
+		ret = clk_prepare_enable(core->core0_clk);
+		if (ret)
+			return ret;
+
+		ret = clk_prepare_enable(core->core0_bus_clk);
+		if (ret)
+			return ret;
+
+		ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (coreid_mask & VIDC_CORE_ID_2) {
+		ret = pm_runtime_get_sync(core->pd_core1);
+		if (ret < 0)
+			return ret;
+
+		ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
+		if (ret)
+			return ret;
+
+		ret = clk_prepare_enable(core->core1_clk);
+		if (ret)
+			return ret;
+
+		ret = clk_prepare_enable(core->core1_bus_clk);
+		if (ret)
+			return ret;
+
+		ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int vdec_get_v4(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	if (!legacy_binding)
+		return 0;
+
+	core->core0_clk = devm_clk_get(dev, "core");
+	if (IS_ERR(core->core0_clk))
+		return PTR_ERR(core->core0_clk);
+
+	core->core0_bus_clk = devm_clk_get(dev, "bus");
+	if (IS_ERR(core->core0_bus_clk))
+		return PTR_ERR(core->core0_bus_clk);
+
+	return 0;
+}
+
+static void vdec_put_v4(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	if (!legacy_binding)
+		return;
+
+	core->core0_clk = NULL;
+	core->core0_bus_clk = NULL;
+}
+
+static int vdec_power_v4(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret;
+
+	if (!legacy_binding)
+		return 0;
+
+	ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
+	if (ret)
+		return ret;
+
+	if (on == POWER_ON) {
+		ret = clk_prepare_enable(core->core0_clk);
+		if (ret)
+			goto disable;
+
+		ret = clk_prepare_enable(core->core0_bus_clk);
+	} else {
+		clk_disable_unprepare(core->core0_bus_clk);
+		clk_disable_unprepare(core->core0_clk);
+	}
+
+disable:
+	vcodec_control_v4(core, VIDC_CORE_ID_1, false);
+
+	return ret;
+}
+
+static int venc_get_v4(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	if (!legacy_binding)
+		return 0;
+
+	core->core1_clk = devm_clk_get(dev, "core");
+	if (IS_ERR(core->core1_clk))
+		return PTR_ERR(core->core1_clk);
+
+	core->core1_bus_clk = devm_clk_get(dev, "bus");
+	if (IS_ERR(core->core1_bus_clk))
+		return PTR_ERR(core->core1_bus_clk);
+
+	return 0;
+}
+
+static void venc_put_v4(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	if (!legacy_binding)
+		return;
+
+	core->core1_clk = NULL;
+	core->core1_bus_clk = NULL;
+}
+
+static int venc_power_v4(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret;
+
+	if (!legacy_binding)
+		return 0;
+
+	ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
+	if (ret)
+		return ret;
+
+	if (on == POWER_ON) {
+		ret = clk_prepare_enable(core->core1_clk);
+		if (ret)
+			goto disable;
+
+		ret = clk_prepare_enable(core->core1_bus_clk);
+	} else {
+		clk_disable_unprepare(core->core1_bus_clk);
+		clk_disable_unprepare(core->core1_clk);
+	}
+
+disable:
+	vcodec_control_v4(core, VIDC_CORE_ID_2, false);
+
+	return ret;
+}
+
+static int vcodec_clks_domains(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	core->core0_clk = devm_clk_get(dev, "vcodec0_core");
+	if (IS_ERR(core->core0_clk))
+		return PTR_ERR(core->core0_clk);
+
+	core->core0_bus_clk = devm_clk_get(dev, "vcodec0_bus");
+	if (IS_ERR(core->core0_bus_clk))
+		return PTR_ERR(core->core0_bus_clk);
+
+	core->core1_clk = devm_clk_get(dev, "vcodec1_core");
+	if (IS_ERR(core->core1_clk))
+		return PTR_ERR(core->core1_clk);
+
+	core->core1_bus_clk = devm_clk_get(dev, "vcodec1_bus");
+	if (IS_ERR(core->core1_bus_clk))
+		return PTR_ERR(core->core1_bus_clk);
+
+	core->pd_core = dev_pm_domain_attach_by_name(dev, "venus");
+	if (IS_ERR(core->pd_core))
+		return PTR_ERR(core->pd_core);
+
+	core->pd_core0 = dev_pm_domain_attach_by_name(dev, "vcodec0");
+	if (IS_ERR(core->pd_core0))
+		return PTR_ERR(core->pd_core0);
+
+	core->pd_core1 = dev_pm_domain_attach_by_name(dev, "vcodec1");
+	if (IS_ERR(core->pd_core1))
+		return PTR_ERR(core->pd_core1);
+
+	core->pd_dl_venus = device_link_add(dev, core->pd_core,
+					    DL_FLAG_PM_RUNTIME |
+					    DL_FLAG_STATELESS |
+					    DL_FLAG_RPM_ACTIVE);
+	if (!core->pd_dl_venus)
+		return -ENODEV;
+
+	return 0;
+}
+
+static int core_get_v4(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret;
+
+	ret = core_clks_get(core);
+	if (ret)
+		return ret;
+
+	ret = vcodec_clks_domains(dev);
+	if (ret == -EPROBE_DEFER) {
+		return ret;
+	} else if (ret) {
+		core->core0_clk = NULL;
+		core->core0_bus_clk = NULL;
+		core->core1_clk = NULL;
+		core->core1_bus_clk = NULL;
+		legacy_binding = true;
+	}
+
+	return 0;
+}
+
+static void core_put_v4(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	if (legacy_binding)
+		return;
+
+	if (core->pd_dl_venus)
+		device_link_del(core->pd_dl_venus);
+
+	if (!IS_ERR_OR_NULL(core->pd_core))
+		dev_pm_domain_detach(core->pd_core, true);
+
+	if (!IS_ERR_OR_NULL(core->pd_core0))
+		dev_pm_domain_detach(core->pd_core0, true);
+
+	if (!IS_ERR_OR_NULL(core->pd_core1))
+		dev_pm_domain_detach(core->pd_core1, true);
+}
+
+static int core_power_v4(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	const unsigned int coreid_mask = VIDC_CORE_ID_1 | VIDC_CORE_ID_2;
+	int ret = 0;
+
+	if (on == POWER_ON) {
+		ret = core_clks_enable(core);
+		if (ret)
+			return ret;
+
+		if (!legacy_binding)
+			ret = poweron_coreid(core, coreid_mask);
+	} else {
+		if (!legacy_binding)
+			ret = poweroff_coreid(core, coreid_mask);
+
+		core_clks_disable(core);
+	}
+
+	return ret;
+}
+
+static unsigned long calculate_inst_freq(struct venus_inst *inst,
+					 unsigned long filled_len)
+{
+	unsigned long vpp_freq = 0, vsp_freq = 0;
+	u32 fps = (u32)inst->fps;
+	u32 mbs_per_sec;
+
+	mbs_per_sec = load_per_instance(inst) / fps;
+
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
+static int load_scale_v4(struct venus_inst *inst)
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
+	ret = core_clks_set_rate(core, freq);
+	if (ret) {
+		dev_err(dev, "failed to set clock rate %lu (%d)\n",
+			freq, ret);
+		return ret;
+	}
+
+	ret = load_scale_bw(core);
+	if (ret) {
+		dev_err(dev, "failed to set bandwidth (%d)\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct venus_pm_ops pm_ops_v4 = {
+	.core_get = core_get_v4,
+	.core_put = core_put_v4,
+	.core_power = core_power_v4,
+	.vdec_get = vdec_get_v4,
+	.vdec_put = vdec_put_v4,
+	.vdec_power = vdec_power_v4,
+	.venc_get = venc_get_v4,
+	.venc_put = venc_put_v4,
+	.venc_power = venc_power_v4,
+	.load_scale = load_scale_v4,
+};
+
+const struct venus_pm_ops *venus_pm_get(enum hfi_version version)
+{
+	switch (version) {
+	case HFI_VERSION_1XX:
+	default:
+		return &pm_ops_v1;
+	case HFI_VERSION_3XX:
+		return &pm_ops_v3;
+	case HFI_VERSION_4XX:
+		return &pm_ops_v4;
+	}
+
+	return NULL;
+}
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.h b/drivers/media/platform/qcom/venus/pm_helpers.h
new file mode 100644
index 000000000000..d98b6dc20740
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/pm_helpers.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2019 Linaro Ltd. */
+#ifndef __VENUS_PM_HELPERS_H__
+#define __VENUS_PM_HELPERS_H__
+
+struct device;
+
+#define POWER_ON	1
+#define POWER_OFF	0
+
+struct venus_pm_ops {
+	int (*core_get)(struct device *dev);
+	void (*core_put)(struct device *dev);
+	int (*core_power)(struct device *dev, int on);
+
+	int (*vdec_get)(struct device *dev);
+	void (*vdec_put)(struct device *dev);
+	int (*vdec_power)(struct device *dev, int on);
+
+	int (*venc_get)(struct device *dev);
+	void (*venc_put)(struct device *dev);
+	int (*venc_power)(struct device *dev, int on);
+
+	int (*load_scale)(struct venus_inst *inst);
+};
+
+const struct venus_pm_ops *venus_pm_get(enum hfi_version version);
+
+static inline int venus_pm_load_scale(struct venus_inst *inst)
+{
+	struct venus_core *core = inst->core;
+
+	if (!core->pm_ops || !core->pm_ops->load_scale)
+		return 0;
+
+	return core->pm_ops->load_scale(inst);
+}
+
+#endif
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 8feaf5daece9..83ce30516591 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -20,6 +20,7 @@
 #include "core.h"
 #include "helpers.h"
 #include "vdec.h"
+#include "pm_helpers.h"
 
 /*
  * Three resons to keep MPLANE formats (despite that the number of planes
@@ -868,7 +869,7 @@ static int vdec_start_capture(struct venus_inst *inst)
 	if (ret)
 		goto free_dpb_bufs;
 
-	venus_helper_load_scale_clocks(inst);
+	venus_pm_load_scale(inst);
 
 	ret = hfi_session_continue(inst);
 	if (ret)
@@ -1076,7 +1077,7 @@ static void vdec_session_release(struct venus_inst *inst)
 		hfi_session_abort(inst);
 
 	venus_helper_free_dpb_bufs(inst);
-	venus_helper_load_scale_clocks(inst);
+	venus_pm_load_scale(inst);
 	INIT_LIST_HEAD(&inst->registeredbufs);
 
 	mutex_unlock(&inst->lock);
@@ -1432,20 +1433,14 @@ static int vdec_probe(struct platform_device *pdev)
 	if (!core)
 		return -EPROBE_DEFER;
 
-	if (IS_V3(core) || IS_V4(core)) {
-		core->core0_clk = devm_clk_get(dev, "core");
-		if (IS_ERR(core->core0_clk))
-			return PTR_ERR(core->core0_clk);
-	}
+	platform_set_drvdata(pdev, core);
 
-	if (IS_V4(core)) {
-		core->core0_bus_clk = devm_clk_get(dev, "bus");
-		if (IS_ERR(core->core0_bus_clk))
-			return PTR_ERR(core->core0_bus_clk);
+	if (core->pm_ops->vdec_get) {
+		ret = core->pm_ops->vdec_get(dev);
+		if (ret)
+			return ret;
 	}
 
-	platform_set_drvdata(pdev, core);
-
 	vdev = video_device_alloc();
 	if (!vdev)
 		return -ENOMEM;
@@ -1482,57 +1477,33 @@ static int vdec_remove(struct platform_device *pdev)
 	video_unregister_device(core->vdev_dec);
 	pm_runtime_disable(core->dev_dec);
 
+	if (core->pm_ops->vdec_put)
+		core->pm_ops->vdec_put(core->dev_dec);
+
 	return 0;
 }
 
 static __maybe_unused int vdec_runtime_suspend(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
-	int ret;
-
-	if (IS_V1(core))
-		return 0;
-
-	ret = venus_helper_power_enable(core, VIDC_SESSION_TYPE_DEC, true);
-	if (ret)
-		return ret;
-
-	if (IS_V4(core))
-		clk_disable_unprepare(core->core0_bus_clk);
+	const struct venus_pm_ops *pm_ops = core->pm_ops;
+	int ret = 0;
 
-	clk_disable_unprepare(core->core0_clk);
+	if (pm_ops->vdec_power)
+		ret = pm_ops->vdec_power(dev, POWER_OFF);
 
-	return venus_helper_power_enable(core, VIDC_SESSION_TYPE_DEC, false);
+	return ret;
 }
 
 static __maybe_unused int vdec_runtime_resume(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
-	int ret;
-
-	if (IS_V1(core))
-		return 0;
-
-	ret = venus_helper_power_enable(core, VIDC_SESSION_TYPE_DEC, true);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(core->core0_clk);
-	if (ret)
-		goto err_power_disable;
-
-	if (IS_V4(core))
-		ret = clk_prepare_enable(core->core0_bus_clk);
-
-	if (ret)
-		goto err_unprepare_core0;
+	const struct venus_pm_ops *pm_ops = core->pm_ops;
+	int ret = 0;
 
-	return venus_helper_power_enable(core, VIDC_SESSION_TYPE_DEC, false);
+	if (pm_ops->vdec_power)
+		ret = pm_ops->vdec_power(dev, POWER_ON);
 
-err_unprepare_core0:
-	clk_disable_unprepare(core->core0_clk);
-err_power_disable:
-	venus_helper_power_enable(core, VIDC_SESSION_TYPE_DEC, false);
 	return ret;
 }
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 453edf966d4f..5fa1724cb537 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -20,6 +20,7 @@
 #include "core.h"
 #include "helpers.h"
 #include "venc.h"
+#include "pm_helpers.h"
 
 #define NUM_B_FRAMES_MAX	4
 
@@ -1255,20 +1256,14 @@ static int venc_probe(struct platform_device *pdev)
 	if (!core)
 		return -EPROBE_DEFER;
 
-	if (IS_V3(core) || IS_V4(core)) {
-		core->core1_clk = devm_clk_get(dev, "core");
-		if (IS_ERR(core->core1_clk))
-			return PTR_ERR(core->core1_clk);
-	}
+	platform_set_drvdata(pdev, core);
 
-	if (IS_V4(core)) {
-		core->core1_bus_clk = devm_clk_get(dev, "bus");
-		if (IS_ERR(core->core1_bus_clk))
-			return PTR_ERR(core->core1_bus_clk);
+	if (core->pm_ops->venc_get) {
+		ret = core->pm_ops->venc_get(dev);
+		if (ret)
+			return ret;
 	}
 
-	platform_set_drvdata(pdev, core);
-
 	vdev = video_device_alloc();
 	if (!vdev)
 		return -ENOMEM;
@@ -1305,57 +1300,33 @@ static int venc_remove(struct platform_device *pdev)
 	video_unregister_device(core->vdev_enc);
 	pm_runtime_disable(core->dev_enc);
 
+	if (core->pm_ops->venc_put)
+		core->pm_ops->venc_put(core->dev_enc);
+
 	return 0;
 }
 
 static __maybe_unused int venc_runtime_suspend(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
-	int ret;
-
-	if (IS_V1(core))
-		return 0;
-
-	ret = venus_helper_power_enable(core, VIDC_SESSION_TYPE_ENC, true);
-	if (ret)
-		return ret;
-
-	if (IS_V4(core))
-		clk_disable_unprepare(core->core1_bus_clk);
+	const struct venus_pm_ops *pm_ops = core->pm_ops;
+	int ret = 0;
 
-	clk_disable_unprepare(core->core1_clk);
+	if (pm_ops->venc_power)
+		ret = pm_ops->venc_power(dev, POWER_OFF);
 
-	return venus_helper_power_enable(core, VIDC_SESSION_TYPE_ENC, false);
+	return ret;
 }
 
 static __maybe_unused int venc_runtime_resume(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
-	int ret;
-
-	if (IS_V1(core))
-		return 0;
-
-	ret = venus_helper_power_enable(core, VIDC_SESSION_TYPE_ENC, true);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(core->core1_clk);
-	if (ret)
-		goto err_power_disable;
-
-	if (IS_V4(core))
-		ret = clk_prepare_enable(core->core1_bus_clk);
-
-	if (ret)
-		goto err_unprepare_core1;
+	const struct venus_pm_ops *pm_ops = core->pm_ops;
+	int ret = 0;
 
-	return venus_helper_power_enable(core, VIDC_SESSION_TYPE_ENC, false);
+	if (pm_ops->venc_power)
+		ret = pm_ops->venc_power(dev, POWER_ON);
 
-err_unprepare_core1:
-	clk_disable_unprepare(core->core1_clk);
-err_power_disable:
-	venus_helper_power_enable(core, VIDC_SESSION_TYPE_ENC, false);
 	return ret;
 }
 
-- 
2.17.1

