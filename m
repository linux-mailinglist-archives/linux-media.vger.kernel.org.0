Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E851E56476
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 10:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfFZIX4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 04:23:56 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57714 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfFZIXz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 04:23:55 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E525D60AA8; Wed, 26 Jun 2019 08:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561537434;
        bh=GQNcLhByL0BEPPkfGDxgHcRx/KIyGZMnjQCWcWMLvZg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SWD4mTxXnPsVZTapMkgY6uFHdjnk6z5jH58wJbpRY9aOitl0c43wWvrWohwp/3TFN
         EMvCDlGhcl7W5lbJktK7Gg+YpbFb4MRlGu7GSio75Km/ec4nTyZb35fPU/7DSDCH7c
         pJAjxjy4SJGTTLiWxl2Sgvk4afI2BCh+HzzNVK6g=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 95F69607CA;
        Wed, 26 Jun 2019 08:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561537433;
        bh=GQNcLhByL0BEPPkfGDxgHcRx/KIyGZMnjQCWcWMLvZg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BenseZD4Zs/BdEFndqpUmPydWGQKl8I2cnV50HkaFBG/eEfHr8t/aDAk1QE5r6KXO
         BTEBxHJVUBpMxXUJQaVk4LY+GzawPhfLT0RkiYoatjTODS4AgD92JYDaXy35mQaU+J
         T/eCZFtWXokJ5uapYK2H4AjZE1iu2nE3wAbYpvDY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 95F69607CA
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH] media: venus: Update to bitrate based clock scaling
Date:   Wed, 26 Jun 2019 13:53:36 +0530
Message-Id: <1561537416-2067-2-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561537416-2067-1-git-send-email-amasule@codeaurora.org>
References: <1561537416-2067-1-git-send-email-amasule@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduced clock scaling using bitrate, current
calculations consider only the cycles per mb.
Also, clock scaling is now triggered before every
buffer being queued to the device. This helps in
deciding precise clock cycles required.

Signed-off-by: Aniket Masule <amasule@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.c    | 16 +++++------
 drivers/media/platform/qcom/venus/core.h    |  1 +
 drivers/media/platform/qcom/venus/helpers.c | 43 +++++++++++++++++++++++++----
 3 files changed, 47 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index f1597d6..ad6bb74 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -474,14 +474,14 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
 };
 
 static struct codec_freq_data sdm845_codec_freq_data[] =  {
-	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675 },
-	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675 },
-	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675 },
-	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200 },
-	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200 },
-	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200 },
-	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200 },
-	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200 },
+	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },
+	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10 },
+	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 10 },
+	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200, 10 },
+	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200, 10 },
+	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200, 10 },
+	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200, 10 },
+	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10 },
 };
 
 static const struct venus_resources sdm845_res = {
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 2ed6496..b964b7c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -39,6 +39,7 @@ struct codec_freq_data {
 	u32 pixfmt;
 	u32 session_type;
 	unsigned int vpp_freq;
+	unsigned int vsp_freq;
 };
 
 struct venus_resources {
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index ef35fd8..634778a 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -379,6 +379,9 @@ static int scale_clocks(struct venus_inst *inst)
 	unsigned int i;
 	int ret;
 
+	if (inst->state == INST_START)
+		return 0;
+
 	mbs_per_sec = load_per_type(core, VIDC_SESSION_TYPE_ENC) +
 		      load_per_type(core, VIDC_SESSION_TYPE_DEC);
 
@@ -418,17 +421,26 @@ static int scale_clocks(struct venus_inst *inst)
 	return ret;
 }
 
-static unsigned long calculate_vpp_freq(struct venus_inst *inst)
+static unsigned long calculate_inst_freq(struct venus_inst *inst,
+					 unsigned long filled_len)
 {
-	unsigned long vpp_freq = 0;
+	unsigned long vpp_freq = 0, vsp_freq = 0;
+	u64 fps = inst->fps;
 	u32 mbs_per_sec;
 
 	mbs_per_sec = load_per_instance(inst);
 	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
 	/* 21 / 20 is overhead factor */
 	vpp_freq += vpp_freq / 20;
+	vsp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vsp_freq;
+
+	/* 10 / 7 is overhead factor */
+	if (inst->session_type == VIDC_SESSION_TYPE_ENC)
+		vsp_freq = (inst->controls.enc.bitrate * 10) / 7;
+	else
+		vsp_freq = ((fps * filled_len * 8) * 10) / 7;
 
-	return vpp_freq;
+	return max(vpp_freq, vsp_freq);
 }
 
 static int scale_clocks_v4(struct venus_inst *inst)
@@ -436,14 +448,30 @@ static int scale_clocks_v4(struct venus_inst *inst)
 	struct venus_core *core = inst->core;
 	const struct freq_tbl *table = core->res->freq_tbl;
 	unsigned int num_rows = core->res->freq_tbl_size;
-
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
 	struct clk *clk = core->clks[0];
 	struct device *dev = core->dev;
+
 	unsigned int i;
 	unsigned long freq = 0, freq_core0 = 0, freq_core1 = 0;
+	unsigned long filled_len = 0;
+	struct venus_buffer *buf, *n;
+	struct vb2_buffer *vb;
 	int ret;
 
-	freq = calculate_vpp_freq(inst);
+	mutex_lock(&inst->lock);
+	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
+		vb = &buf->vb.vb2_buf;
+		filled_len = max(filled_len, vb2_get_plane_payload(vb, 0));
+	}
+	mutex_unlock(&inst->lock);
+
+	if (inst->session_type == VIDC_SESSION_TYPE_DEC && !filled_len) {
+		dev_dbg(dev, "%s: No input to the session\n", __func__);
+		return 0;
+	}
+
+	freq = calculate_inst_freq(inst, filled_len);
 
 	if (freq > table[0].freq)
 		goto err;
@@ -471,6 +499,9 @@ static int scale_clocks_v4(struct venus_inst *inst)
 
 	freq = max(freq_core0, freq_core1);
 
+	if (clk_get_rate(clk) == freq)
+		return 0;
+
 	ret = clk_set_rate(clk, freq);
 	if (ret)
 		goto err;
@@ -1150,6 +1181,8 @@ void venus_helper_vb2_buf_queue(struct vb2_buffer *vb)
 	if (ret)
 		goto unlock;
 
+	load_scale_clocks(inst);
+
 	ret = session_process_buf(inst, vbuf);
 	if (ret)
 		return_buf_error(inst, vbuf);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

