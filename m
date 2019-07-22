Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 255F96FBC4
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 11:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728704AbfGVJHu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 05:07:50 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39552 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728021AbfGVJHu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 05:07:50 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 012996178B; Mon, 22 Jul 2019 09:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563786469;
        bh=w+/eBIzrpt3OyUu4hVcL4bF6SRMbjgzEylM6+Ge1s2E=;
        h=From:To:Cc:Subject:Date:From;
        b=GyxJPfFUMISss26yL0gRJJiE8R9l+QP0Ql5TPBRXeeytgdJ6zsPbfHCFC/7AW96EO
         gI+4X4gsDPKQdagDebjBFGd8Nk1AKkkoVPHrSiuh44iilJkeXsJr116zRsjr2ntX3y
         Gax84ydV4JItup3blsgugJkmSNoC/cSUrwxaq03g=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 832B96119F;
        Mon, 22 Jul 2019 09:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563786468;
        bh=w+/eBIzrpt3OyUu4hVcL4bF6SRMbjgzEylM6+Ge1s2E=;
        h=From:To:Cc:Subject:Date:From;
        b=X6hSVJWbaXkMFZbm+HlDMSY2gtexmE4gXxXWTXb7evVuUkRtXNllkcmDFNxLCFfPp
         i5nvXJ0Kn9q+rQKP0/0zHWvgoOF5sGq0VRqgfZG9BcigR+jrbcckQUSW84jp6R34Wf
         yAHB+il2+09Jl3g4S3jXy0N4ryAfs/DvnYFMSCmQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 832B96119F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH v6 1/4] media: venus: Add codec data table
Date:   Mon, 22 Jul 2019 14:37:29 +0530
Message-Id: <1563786452-22188-1-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add vpp cycles for different types of codec.
It indicates the cycles required by video hardware
to process each macroblock. Add vsp cycles, cycles
required by stream processor. Initialize the codec
data with core resources.

Signed-off-by: Aniket Masule <amasule@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.c    | 13 +++++++++++++
 drivers/media/platform/qcom/venus/core.h    | 16 +++++++++++++++
 drivers/media/platform/qcom/venus/helpers.c | 30 +++++++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/helpers.h |  1 +
 drivers/media/platform/qcom/venus/vdec.c    |  4 ++++
 drivers/media/platform/qcom/venus/venc.c    |  4 ++++
 6 files changed, 68 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7393667..ad6bb74 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -473,9 +473,22 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
 	{  244800, 100000000 },	/* 1920x1080@30 */
 };
 
+static struct codec_freq_data sdm845_codec_freq_data[] =  {
+	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },
+	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10 },
+	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 10 },
+	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200, 10 },
+	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200, 10 },
+	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200, 10 },
+	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200, 10 },
+	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10 },
+};
+
 static const struct venus_resources sdm845_res = {
 	.freq_tbl = sdm845_freq_table,
 	.freq_tbl_size = ARRAY_SIZE(sdm845_freq_table),
+	.codec_freq_data = sdm845_codec_freq_data,
+	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
 	.clks = {"core", "iface", "bus" },
 	.clks_num = 3,
 	.max_load = 2563200,
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7a3feb5..b8aef19 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -35,12 +35,21 @@ struct reg_val {
 	u32 value;
 };
 
+struct codec_freq_data {
+	u32 pixfmt;
+	u32 session_type;
+	unsigned long vpp_freq;
+	unsigned long vsp_freq;
+};
+
 struct venus_resources {
 	u64 dma_mask;
 	const struct freq_tbl *freq_tbl;
 	unsigned int freq_tbl_size;
 	const struct reg_val *reg_tbl;
 	unsigned int reg_tbl_size;
+	const struct codec_freq_data *codec_freq_data;
+	unsigned int codec_freq_data_size;
 	const char * const clks[VIDC_CLKS_NUM_MAX];
 	unsigned int clks_num;
 	enum hfi_version hfi_version;
@@ -216,6 +225,12 @@ struct venus_buffer {
 	struct list_head ref_list;
 };
 
+struct clock_data {
+	u32 core_id;
+	unsigned long freq;
+	const struct codec_freq_data *codec_freq_data;
+};
+
 #define to_venus_buffer(ptr)	container_of(ptr, struct venus_buffer, vb)
 
 /**
@@ -275,6 +290,7 @@ struct venus_inst {
 	struct list_head list;
 	struct mutex lock;
 	struct venus_core *core;
+	struct clock_data clk_data;
 	struct list_head dpbbufs;
 	struct list_head internalbufs;
 	struct list_head registeredbufs;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 5cad601..7492373 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -715,6 +715,36 @@ int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage)
 }
 EXPORT_SYMBOL_GPL(venus_helper_set_core_usage);
 
+int venus_helper_init_codec_freq_data(struct venus_inst *inst)
+{
+	const struct codec_freq_data *data;
+	unsigned int i, data_size;
+	u32 pixfmt;
+	int ret = 0;
+
+	if (!IS_V4(inst->core))
+		return 0;
+
+	data = inst->core->res->codec_freq_data;
+	data_size = inst->core->res->codec_freq_data_size;
+	pixfmt = inst->session_type == VIDC_SESSION_TYPE_DEC ?
+			inst->fmt_out->pixfmt : inst->fmt_cap->pixfmt;
+
+	for (i = 0; i < data_size; i++) {
+		if (data[i].pixfmt == pixfmt &&
+		    data[i].session_type == inst->session_type) {
+			inst->clk_data.codec_freq_data = &data[i];
+			break;
+		}
+	}
+
+	if (!inst->clk_data.codec_freq_data)
+		ret = -EINVAL;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(venus_helper_init_codec_freq_data);
+
 int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
 			      unsigned int output_bufs,
 			      unsigned int output2_bufs)
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 2475f284..2c13245 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -41,6 +41,7 @@ int venus_helper_set_output_resolution(struct venus_inst *inst,
 				       unsigned int width, unsigned int height,
 				       u32 buftype);
 int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode);
+int venus_helper_init_codec_freq_data(struct venus_inst *inst);
 int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage);
 int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
 			      unsigned int output_bufs,
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 282de21..d037f80 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -660,6 +660,10 @@ static int vdec_init_session(struct venus_inst *inst)
 	if (ret)
 		goto deinit;
 
+	ret = venus_helper_init_codec_freq_data(inst);
+	if (ret)
+		goto deinit;
+
 	return 0;
 deinit:
 	hfi_session_deinit(inst);
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 32cff29..cdddc82 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -847,6 +847,10 @@ static int venc_init_session(struct venus_inst *inst)
 	if (ret)
 		goto deinit;
 
+	ret = venus_helper_init_codec_freq_data(inst);
+	if (ret)
+		goto deinit;
+
 	ret = venc_set_properties(inst);
 	if (ret)
 		goto deinit;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

