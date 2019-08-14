Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9F968CEC3
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 10:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbfHNIrb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 04:47:31 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38794 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbfHNIra (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 04:47:30 -0400
Received: by mail-wr1-f66.google.com with SMTP id g17so110296750wrr.5
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2019 01:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nhBTzPiAh76rFSqD3RgV5Fc/Rc/js7/1NHg4vASXBMw=;
        b=vZG6kJJ57lN/wuH9pOAVOXk04wI6MnyqYfsOWZjtX01M20m3Pt7sQFUq73ecyR9Ze6
         EalGx44GFSlcYL1VritONa3K38M7p+vNRMSHgdb1qZGJ5nF20L8VpBGwMTBep20Buxqr
         ruNDytF+bHPXedIrJA8X7LDb2aVRZn7EHeuCenZkjETpIWEMtekULk8VWAZn7BuvCdRw
         OiPHd2itYiP/NstLtIdG3E5g0Kd4S+IMUyJXzqCYCeiJPOkdPWaHFgY9ePXL+uhpyqqd
         MOfWzCs0NvGaH+Qj6lSet8GdemyThteinc/u3hmiecjoe6oQWIG2uEV+njXEwElA2bq0
         W/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nhBTzPiAh76rFSqD3RgV5Fc/Rc/js7/1NHg4vASXBMw=;
        b=FnEIP97gEXxVWNvy4uGuWQh/PS0WW20nnrIulQCGO4axKXuxPnJm/c3jgokxbudAtB
         1llMPJ0clI2O9055oz5kHUQ5pgSCwY+ep+oJZ7EzZE5mtS9JyM7/1XZNd9H28tXsgvoT
         HoOL3bALy2Cp454nb8+Yw7t+cP2kfGNpGjguXpbgl0yM5pDXASEoAuGu18kYkiWiL8f9
         5KEQlVKpjwnCWXuRZ3rsmh0emmd4r6BsqMCUEiTJBF0/yE96WrLydD4Q0n+tMm+BpMfO
         6pdrifFjS5Hi53MFyPHvvbfvpLVc0dvfsiiyBXu7DRBskNiJZV36O2KM2aF/8j8hwNRL
         qypQ==
X-Gm-Message-State: APjAAAWfY2/Qd5Em+KkcCLm+DqBRmtdqyIoEp0VxLEQSE869JIph50MG
        UER/dIzyeQb9PE/QJwHMBnpA0OqbVG8=
X-Google-Smtp-Source: APXvYqwPy4/nNnF/P2QPC+b7hW+35G1ZNbv+yyUXYj8aXF5TDYG3p7yq3+9AENWy012wYSU5tnJ+tA==
X-Received: by 2002:adf:e4c3:: with SMTP id v3mr50762638wrm.107.1565772447225;
        Wed, 14 Aug 2019 01:47:27 -0700 (PDT)
Received: from mms-0440.qualcomm.mm-sol.com ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id u186sm7176141wmu.26.2019.08.14.01.47.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 01:47:26 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Aniket Masule <amasule@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 1/2] venus: use on-chip interconnect API
Date:   Wed, 14 Aug 2019 11:47:00 +0300
Message-Id: <20190814084701.25455-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814084701.25455-1-stanimir.varbanov@linaro.org>
References: <20190814084701.25455-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This aims to add a requests for bandwidth scaling depending
on the resolution and framerate (macroblocks per second). The
exact value ff the requested bandwidth is get from a
pre-calculated tables for encoder and decoder.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c    | 34 +++++++++++
 drivers/media/platform/qcom/venus/core.h    | 14 +++++
 drivers/media/platform/qcom/venus/helpers.c | 67 ++++++++++++++++++++-
 3 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 0acc7576cc58..19cbe9d5d028 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -5,6 +5,7 @@
  */
 #include <linux/clk.h>
 #include <linux/init.h>
+#include <linux/interconnect.h>
 #include <linux/ioctl.h>
 #include <linux/list.h>
 #include <linux/module.h>
@@ -239,6 +240,14 @@ static int venus_probe(struct platform_device *pdev)
 	if (IS_ERR(core->base))
 		return PTR_ERR(core->base);
 
+	core->video_path = of_icc_get(dev, "video-mem");
+	if (IS_ERR(core->video_path))
+		return PTR_ERR(core->video_path);
+
+	core->cpucfg_path = of_icc_get(dev, "cpu-cfg");
+	if (IS_ERR(core->cpucfg_path))
+		return PTR_ERR(core->cpucfg_path);
+
 	core->irq = platform_get_irq(pdev, 0);
 	if (core->irq < 0)
 		return core->irq;
@@ -273,6 +282,10 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
+	if (ret)
+		return ret;
+
 	ret = hfi_create(core, &venus_core_ops);
 	if (ret)
 		return ret;
@@ -355,6 +368,9 @@ static int venus_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 
+	icc_put(core->video_path);
+	icc_put(core->cpucfg_path);
+
 	v4l2_device_unregister(&core->v4l2_dev);
 
 	return ret;
@@ -464,9 +480,27 @@ static const struct freq_tbl sdm845_freq_table[] = {
 	{  244800, 100000000 },	/* 1920x1080@30 */
 };
 
+static const struct bw_tbl sdm845_bw_table_enc[] = {
+	{ 1944000, 1612000, 0, 2416000, 0 },	/* 3840x2160@60 */
+	{  972000,  951000, 0, 1434000, 0 },	/* 3840x2160@30 */
+	{  489600,  723000, 0,  973000, 0 },	/* 1920x1080@60 */
+	{  244800,  370000, 0,	495000, 0 },	/* 1920x1080@30 */
+};
+
+static const struct bw_tbl sdm845_bw_table_dec[] = {
+	{ 2073600, 3929000, 0, 5551000, 0 },	/* 4096x2160@60 */
+	{ 1036800, 1987000, 0, 2797000, 0 },	/* 4096x2160@30 */
+	{  489600, 1040000, 0, 1298000, 0 },	/* 1920x1080@60 */
+	{  244800,  530000, 0,  659000, 0 },	/* 1920x1080@30 */
+};
+
 static const struct venus_resources sdm845_res = {
 	.freq_tbl = sdm845_freq_table,
 	.freq_tbl_size = ARRAY_SIZE(sdm845_freq_table),
+	.bw_tbl_enc = sdm845_bw_table_enc,
+	.bw_tbl_enc_size = ARRAY_SIZE(sdm845_bw_table_enc),
+	.bw_tbl_dec = sdm845_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sdm845_bw_table_dec),
 	.clks = {"core", "iface", "bus" },
 	.clks_num = 3,
 	.max_load = 3110400,	/* 4096x2160@90 */
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 959eaa550f4e..4b0eb4627ba0 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -26,10 +26,22 @@ struct reg_val {
 	u32 value;
 };
 
+struct bw_tbl {
+	u32 mbs_per_sec;
+	u32 avg;
+	u32 peak;
+	u32 avg_10bit;
+	u32 peak_10bit;
+};
+
 struct venus_resources {
 	u64 dma_mask;
 	const struct freq_tbl *freq_tbl;
 	unsigned int freq_tbl_size;
+	const struct bw_tbl *bw_tbl_enc;
+	unsigned int bw_tbl_enc_size;
+	const struct bw_tbl *bw_tbl_dec;
+	unsigned int bw_tbl_dec_size;
 	const struct reg_val *reg_tbl;
 	unsigned int reg_tbl_size;
 	const char * const clks[VIDC_CLKS_NUM_MAX];
@@ -114,6 +126,8 @@ struct venus_core {
 	struct clk *core1_clk;
 	struct clk *core0_bus_clk;
 	struct clk *core1_bus_clk;
+	struct icc_path *video_path;
+	struct icc_path *cpucfg_path;
 	struct video_device *vdev_dec;
 	struct video_device *vdev_enc;
 	struct v4l2_device v4l2_dev;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 1ad96c25ab09..f18458921f5d 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -5,6 +5,7 @@
  */
 #include <linux/clk.h>
 #include <linux/iopoll.h>
+#include <linux/interconnect.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/pm_runtime.h>
@@ -388,6 +389,65 @@ static u32 load_per_type(struct venus_core *core, u32 session_type)
 	return mbs_per_sec;
 }
 
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
 int venus_helper_load_scale_clocks(struct venus_core *core)
 {
 	const struct freq_tbl *table = core->res->freq_tbl;
@@ -431,10 +491,15 @@ int venus_helper_load_scale_clocks(struct venus_core *core)
 	if (ret)
 		goto err;
 
+	ret = load_scale_bw(core);
+	if (ret)
+		goto err;
+
 	return 0;
 
 err:
-	dev_err(dev, "failed to set clock rate %lu (%d)\n", freq, ret);
+	dev_err(dev, "failed to set clock rate %lu or bandwidth (%d)\n",
+		freq, ret);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(venus_helper_load_scale_clocks);
-- 
2.17.1

