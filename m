Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 539E85D200
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 16:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbfGBOrC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 10:47:02 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45672 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbfGBOrB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 10:47:01 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 996FE607B9; Tue,  2 Jul 2019 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562078819;
        bh=w+/eBIzrpt3OyUu4hVcL4bF6SRMbjgzEylM6+Ge1s2E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Mt/boFoNFLmt3IaVuvMYt1rWou8g8av9dyev8dfIk+Hd2d6DCS0T7cS0XtNVgbCoF
         u+YnDgH7V2/JLqfNbfyCUR+Ias90rbJJRsYZzgk5j30PkjmqNDOSQHvJyzzQU/gvrj
         PMG3yH/fB36Z2V2Bs9Th2WgRe50oBudvCi5zc48o=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 110C76025A;
        Tue,  2 Jul 2019 14:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562078819;
        bh=w+/eBIzrpt3OyUu4hVcL4bF6SRMbjgzEylM6+Ge1s2E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Mt/boFoNFLmt3IaVuvMYt1rWou8g8av9dyev8dfIk+Hd2d6DCS0T7cS0XtNVgbCoF
         u+YnDgH7V2/JLqfNbfyCUR+Ias90rbJJRsYZzgk5j30PkjmqNDOSQHvJyzzQU/gvrj
         PMG3yH/fB36Z2V2Bs9Th2WgRe50oBudvCi5zc48o=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 110C76025A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH v4 1/4] media: venus: Add codec data table
Date:   Tue,  2 Jul 2019 20:16:24 +0530
Message-Id: <1562078787-516-2-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1562078787-516-1-git-send-email-amasule@codeaurora.org>
References: <1562078787-516-1-git-send-email-amasule@codeaurora.org>
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

