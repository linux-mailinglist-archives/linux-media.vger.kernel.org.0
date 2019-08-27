Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE5F19DD91
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 08:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbfH0GUf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 02:20:35 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56856 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfH0GUe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 02:20:34 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 05BB160E40; Tue, 27 Aug 2019 06:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566886834;
        bh=DWiUZ0h0oKq+88OUYVKweLryQ+oqXke10jLm3RzR10s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O9e+0NN4JqBQyK5vUOiB9HNsweYOhC8Q50310R6gbr8MYLcCppJDawyYF4bqZSK4u
         0amV1PwO0exEhiPH85e0ADuOXiplOJnP9/I3IKbmZmmNcODhjRwIm3oDXopoJnUJOf
         670EFS0X4Eug6A+zwQfBBZn0HktxvGxdFziJ6y14=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6200F60E3E;
        Tue, 27 Aug 2019 06:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566886833;
        bh=DWiUZ0h0oKq+88OUYVKweLryQ+oqXke10jLm3RzR10s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NRqnrGsf2p0BriQBwoB7R9kt+YU3o49SHHA2R6ZTDarEPB/CFh/soc7px1jlh2rVC
         P1X5390i7KjibJlf/z1E6t8Uk1hbsY4VmXVkAxOlakYSbUcPzox7pOvR966SJvyKI2
         rXFjmTsrSKI68KPH/LJO+BUEQAiEZ4cln5lVueAw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6200F60E3E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH 3/3] media: venus: Update to bitrate based clock scaling
Date:   Tue, 27 Aug 2019 11:49:42 +0530
Message-Id: <1566886782-9406-4-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566886782-9406-1-git-send-email-amasule@codeaurora.org>
References: <1566886782-9406-1-git-send-email-amasule@codeaurora.org>
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
 drivers/media/platform/qcom/venus/helpers.c | 33 ++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 4ed630b..8fee0ef 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -516,17 +516,26 @@ static int scale_clocks(struct venus_inst *inst)
 	return 0;
 }
 
-static unsigned long calculate_vpp_freq(struct venus_inst *inst)
+static unsigned long calculate_inst_freq(struct venus_inst *inst,
+					 unsigned long filled_len)
 {
-	unsigned long vpp_freq = 0;
+	unsigned long vpp_freq = 0, vsp_freq = 0;
+	u64 fps = inst->fps;
 	u32 mbs_per_sec;
 
-	mbs_per_sec = load_per_instance(inst);
+	mbs_per_sec = load_per_instance(inst) / inst->fps;
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
@@ -534,12 +543,24 @@ static int scale_clocks_v4(struct venus_inst *inst)
 	struct venus_core *core = inst->core;
 	const struct freq_tbl *table = core->res->freq_tbl;
 	unsigned int num_rows = core->res->freq_tbl_size;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
 	struct device *dev = core->dev;
 	unsigned int i;
 	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
+	unsigned long filled_len = 0;
+	struct venus_buffer *buf, *n;
+	struct vb2_buffer *vb;
 	int ret;
 
-	freq = calculate_vpp_freq(inst);
+	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
+		vb = &buf->vb.vb2_buf;
+		filled_len = max(filled_len, vb2_get_plane_payload(vb, 0));
+	}
+
+	if (inst->session_type == VIDC_SESSION_TYPE_DEC && !filled_len)
+		return 0;
+
+	freq = calculate_inst_freq(inst, filled_len);
 	inst->clk_data.freq = freq;
 
 	mutex_lock(&core->lock);
@@ -701,6 +722,8 @@ void venus_helper_get_ts_metadata(struct venus_inst *inst, u64 timestamp_us,
 
 		if (inst->session_type == VIDC_SESSION_TYPE_DEC)
 			put_ts_metadata(inst, vbuf);
+
+		venus_helper_load_scale_clocks(inst);
 	} else if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		if (inst->session_type == VIDC_SESSION_TYPE_ENC)
 			fdata.buffer_type = HFI_BUFFER_OUTPUT;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

