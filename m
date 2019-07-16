Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B08186A1BF
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 07:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733209AbfGPFJm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 01:09:42 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58526 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfGPFJm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 01:09:42 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DDF1E618EF; Tue, 16 Jul 2019 05:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563253780;
        bh=pPd3WTwY7870EasNoe5YLiqpf057/4E2YiY+ke5Oj8A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZiSMhxwt1EX16Rp4WmsYJr5mtyyz1HmXyP3uRuvIn70JLdvCDm5vL4oCJDtXRwgz4
         wZk2SkD2MiaJjO1pqJqkvQQWNZ02RjxvsoQ5jwTrxR/onc572LJpnnbU3s3s8tJJrc
         SQjjjc18SaZK9nn3h0bi4nhbEwMV17H5nATeHRwU=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8D048618DA;
        Tue, 16 Jul 2019 05:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563253780;
        bh=pPd3WTwY7870EasNoe5YLiqpf057/4E2YiY+ke5Oj8A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZiSMhxwt1EX16Rp4WmsYJr5mtyyz1HmXyP3uRuvIn70JLdvCDm5vL4oCJDtXRwgz4
         wZk2SkD2MiaJjO1pqJqkvQQWNZ02RjxvsoQ5jwTrxR/onc572LJpnnbU3s3s8tJJrc
         SQjjjc18SaZK9nn3h0bi4nhbEwMV17H5nATeHRwU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8D048618DA
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH v5 3/4] media: venus: Update to bitrate based clock scaling
Date:   Tue, 16 Jul 2019 10:39:13 +0530
Message-Id: <1563253754-12003-4-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1563253754-12003-1-git-send-email-amasule@codeaurora.org>
References: <1563253754-12003-1-git-send-email-amasule@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduced clock scaling using bitrate, preavious
calculations consider only the cycles per mb.
Also, clock scaling is now triggered before every
buffer being queued to the device. This helps in
deciding precise clock cycles required.

Signed-off-by: Aniket Masule <amasule@codeaurora.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 33 +++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 2c976e4..edf403d 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -399,17 +399,26 @@ static int scale_clocks(struct venus_inst *inst)
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
 
-	return vpp_freq;
+	/* 10 / 7 is overhead factor */
+	if (inst->session_type == VIDC_SESSION_TYPE_ENC)
+		vsp_freq += (inst->controls.enc.bitrate * 10) / 7;
+	else
+		vsp_freq += ((fps * filled_len * 8) * 10) / 7;
+
+	return max(vpp_freq, vsp_freq);
 }
 
 static int scale_clocks_v4(struct venus_inst *inst)
@@ -417,13 +426,27 @@ static int scale_clocks_v4(struct venus_inst *inst)
 	struct venus_core *core = inst->core;
 	const struct freq_tbl *table = core->res->freq_tbl;
 	unsigned int num_rows = core->res->freq_tbl_size;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
 	struct clk *clk = core->clks[0];
 	struct device *dev = core->dev;
 	unsigned int i;
 	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
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
+	if (inst->session_type == VIDC_SESSION_TYPE_DEC && !filled_len)
+		return 0;
+
+	freq = calculate_inst_freq(inst, filled_len);
 
 	if (freq > table[0].freq)
 		dev_warn(dev, "HW is overloaded, needed: %lu max: %lu\n",
@@ -1093,6 +1116,8 @@ void venus_helper_vb2_buf_queue(struct vb2_buffer *vb)
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

