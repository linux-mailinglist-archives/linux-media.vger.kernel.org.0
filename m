Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 771C4422033
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233382AbhJEINC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 04:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233321AbhJEINA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 04:13:00 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4371C061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 01:11:09 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id b8so40628588edk.2
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 01:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yiKrIzBiKlW3d0EztEYlz/TsXaJItbUI5JDPiVLlN/g=;
        b=YmIChPJXJMaKsNpip6EixH2hiIiMBjlqpIVxWPX4NrD1wNja+xWPabsHk8wLRgNtjc
         yjbqkxRmJCOcI0yOjaxlJ2Y+yrNSr5WqpSNCLeIaKsqrl91e+PzDxJ1/Q4Pzz91XaWa3
         jzO4KM0zkTIKH28RAtZ+tDkkam1rWSM1TCJ86zpwMf2cGHo8Z7IVv4mgYuD6Sh+dG6a+
         VrE2cFJM4aF7BXW7eSfWaQM2c26pwvqbWTYrvdeM8t6d6+V7uTfgjHn5sJaQfZrsQde8
         vF2LURw1AzgGzdIMm4h3nsX3+8caNM25fgYOiNMPCB5S9B79IT4AZHoGnPx1657jMHEp
         k4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yiKrIzBiKlW3d0EztEYlz/TsXaJItbUI5JDPiVLlN/g=;
        b=jDkz4qb2ZpufuEekQUxRMmqUDkQBtkQJyF/vvWJ2zA1L+6/W/atYuiuJ8E6eRMWhy7
         7V/JuMzofvvAmp4uTI/95i74YYcXhzc1fFjGSVAuNUNcS5Jaez3CgX5oHXd9+t5C5ohi
         iVXxXRv/l5DwjHD/2QlV3ojAJ35s039fGElaaWE4zLPi9ubHPAKC6xmEHSaWkv1wSwzk
         6n5453SeNMa5ZUaIyUc+7E8tUwxQXhohm2hV0MxRVb499pK8CgAlr/O0K7Wggi8Y5qqv
         wc8HkHvf7NfJ1wtj4YUKKeuyi4cDp8KfX9MoAlZgeD3FZAawbuMtbEDvmXbjSNkgKc5I
         GkRw==
X-Gm-Message-State: AOAM5321+hm8OHKmNcgIbKEDTVO5RH2vBDbJAj20dTVlc6wVaJKS4b4D
        okkirxlKraLBTwvWhpSBNYINpMI1lubf5g==
X-Google-Smtp-Source: ABdhPJwJhu3jjo/3YXeQJcXgRFl6tItMWzZAqXsrRZo1PPfuyGlAD0IoFfE1hMBVYWR+E7TfseDzSQ==
X-Received: by 2002:a17:906:c18d:: with SMTP id g13mr22603666ejz.518.1633421468198;
        Tue, 05 Oct 2021 01:11:08 -0700 (PDT)
Received: from localhost.localdomain ([84.238.208.199])
        by smtp.gmail.com with ESMTPSA id f1sm3096258edz.47.2021.10.05.01.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 01:11:07 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 3/7] media: venus: Add num_vpp_pipes to resource structure
Date:   Tue,  5 Oct 2021 11:10:44 +0300
Message-Id: <20211005081048.3095252-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005081048.3095252-1-stanimir.varbanov@linaro.org>
References: <20211005081048.3095252-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

V6 HW can have vpp pipes as 1 or 4, add num_vpp_pipes
to resource struture to differentiate.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c            |  2 ++
 drivers/media/platform/qcom/venus/core.h            |  1 +
 drivers/media/platform/qcom/venus/helpers.c         |  2 +-
 drivers/media/platform/qcom/venus/hfi_platform.c    | 13 -------------
 drivers/media/platform/qcom/venus/hfi_platform.h    |  2 --
 drivers/media/platform/qcom/venus/hfi_platform_v6.c |  6 ------
 6 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index e5af4d74e504..de7b32caa8b8 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -727,6 +727,7 @@ static const struct venus_resources sm8250_res = {
 	.vcodec_num = 1,
 	.max_load = 7833600,
 	.hfi_version = HFI_VERSION_6XX,
+	.num_vpp_pipes = 4,
 	.vmem_id = VIDC_RESOURCE_NONE,
 	.vmem_size = 0,
 	.vmem_addr = 0,
@@ -778,6 +779,7 @@ static const struct venus_resources sc7280_res = {
 	.opp_pmdomain = (const char *[]) { "cx", NULL },
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_6XX,
+	.num_vpp_pipes = 1,
 	.vmem_id = VIDC_RESOURCE_NONE,
 	.vmem_size = 0,
 	.vmem_addr = 0,
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 5ec851115eca..62228cc6b032 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -68,6 +68,7 @@ struct venus_resources {
 	const char * const resets[VIDC_RESETS_NUM_MAX];
 	unsigned int resets_num;
 	enum hfi_version hfi_version;
+	u8 num_vpp_pipes;
 	u32 max_load;
 	unsigned int vmem_id;
 	u32 vmem_size;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 8012f5c7bf34..1f46a6f4456a 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -583,7 +583,7 @@ static int platform_get_bufreq(struct venus_inst *inst, u32 buftype,
 		return -EINVAL;
 
 	params.version = version;
-	params.num_vpp_pipes = hfi_platform_num_vpp_pipes(version);
+	params.num_vpp_pipes = inst->core->res->num_vpp_pipes;
 
 	if (is_dec) {
 		params.width = inst->width;
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
index f5b4e1f4764f..f16f8962273c 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform.c
@@ -66,16 +66,3 @@ hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec, u32 session_
 	return freq;
 }
 
-u8 hfi_platform_num_vpp_pipes(enum hfi_version version)
-{
-	const struct hfi_platform *plat;
-
-	plat = hfi_platform_get(version);
-	if (!plat)
-		return 0;
-
-	if (plat->num_vpp_pipes)
-		return plat->num_vpp_pipes();
-
-	return 0;
-}
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
index 2dbe608c53af..1dcf4085928c 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.h
+++ b/drivers/media/platform/qcom/venus/hfi_platform.h
@@ -52,7 +52,6 @@ struct hfi_platform {
 	unsigned long (*codec_lp_freq)(u32 session_type, u32 codec);
 	void (*codecs)(u32 *enc_codecs, u32 *dec_codecs, u32 *count);
 	const struct hfi_plat_caps *(*capabilities)(unsigned int *entries);
-	u8 (*num_vpp_pipes)(void);
 	int (*bufreq)(struct hfi_plat_buffers_params *params, u32 session_type,
 		      u32 buftype, struct hfi_buffer_requirements *bufreq);
 };
@@ -67,5 +66,4 @@ unsigned long hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 code
 					      u32 session_type);
 unsigned long hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec,
 					     u32 session_type);
-u8 hfi_platform_num_vpp_pipes(enum hfi_version version);
 #endif
diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6.c b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
index d8243b22568a..c10618e44f5d 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_v6.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
@@ -322,17 +322,11 @@ static unsigned long codec_lp_freq(u32 session_type, u32 codec)
 	return 0;
 }
 
-static u8 num_vpp_pipes(void)
-{
-	return 4;
-}
-
 const struct hfi_platform hfi_plat_v6 = {
 	.codec_vpp_freq = codec_vpp_freq,
 	.codec_vsp_freq = codec_vsp_freq,
 	.codec_lp_freq = codec_lp_freq,
 	.codecs = get_codecs,
 	.capabilities = get_capabilities,
-	.num_vpp_pipes = num_vpp_pipes,
 	.bufreq = hfi_plat_bufreq_v6,
 };
-- 
2.25.1

