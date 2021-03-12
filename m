Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0AF3394BB
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232547AbhCLR3Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232699AbhCLR3Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:16 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE30C061574
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:15 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so12670655wmj.2
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=baSMqShP5W3Zw4aCNa6SmZHYgWuL3HOZVO7fD1Vf2tE=;
        b=vJbQeEtgWffYfC76tfsRRXDyRunGoQ9OEzeUIvqGIs5LcGGKUsiLM9qB8Z9P77MbMg
         s2II+y/1YfzFDyASjsdZWkkqlphNtPYRBg5MoMgQGk5yqLo2NrRTXmBuoEBwRgNg823H
         YPUX9Irmj7IXY0YQuljuSR5JNTbM2mPftGKOSu1IuDyM9H7vgR1IjyBRv4nzSffmSOs7
         rZXswmreap1fWnqzODpt7R6lMixzJMiUcoFKBENuPY+wbUYdJ6Em0QUPMH8t6QZND6Lg
         SAknNepQ6ICiA7bfLoFY3tcabjLCjkZ7wEuyKH+AAndWkC48cyZlwp25VpUYZKzA62ZD
         i80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=baSMqShP5W3Zw4aCNa6SmZHYgWuL3HOZVO7fD1Vf2tE=;
        b=XKsAMs/BCVp1C9XElZdV4Rms1t0js4J7oL4WBPQm7vv+ZZ4Ny176XsqjIJlEI/HYin
         bfZUQJ/y70wO1m7xm+AmCuZsSDDmbvpl4OxxBQiE/M0zriWmBW5uc0wVCR92QesmFdJZ
         E13FowXcS7TdlJcew79txhra4sgUjLogyVLEgEWIS+5SIb2B+TLfiwKgaADkctOvLPxY
         EmEmcsIRtu0ORpPCk7yD7Dz0tZQrQz6yw5muZRNKUcxkKMZ+75w1LTTV7fJlqQr6wVBp
         o9GhfPSYDDTB7QS/yy2n0Bx+Lru8rg5lKb58aUF6+0TYA87hjd3t8Rbq+3Uhtr5/JWtE
         FJBA==
X-Gm-Message-State: AOAM530t91cQK3RDKxcpUpFTEV4hSJIu8wzBSfE6Ql7qvB59h8cg+SgY
        43esA9qbHBrhn/J3IC8jan6BrA==
X-Google-Smtp-Source: ABdhPJxIQzskz/wpOX+mqjsXcZKy0Qv27wRkR2vwVT5CCI/jSTzFAjaqYVqSoc50SvNwe/H73DjncQ==
X-Received: by 2002:a1c:7210:: with SMTP id n16mr13783227wmc.13.1615570154629;
        Fri, 12 Mar 2021 09:29:14 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:14 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 03/25] media: venus: core: add sm8250 DT compatible and resource data
Date:   Fri, 12 Mar 2021 17:30:17 +0000
Message-Id: <20210312173039.1387617-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds an sm8250 compatible binding to the venus core.

Co-developed-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Co-developed-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 54 ++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 00d6883d3859..68358a9f3cda 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -627,12 +627,66 @@ static const struct venus_resources sc7180_res = {
 	.fwname = "qcom/venus-5.4/venus.mdt",
 };
 
+static const struct freq_tbl sm8250_freq_table[] = {
+	{ 0, 444000000 },
+	{ 0, 366000000 },
+	{ 0, 338000000 },
+	{ 0, 240000000 },
+};
+
+static const struct bw_tbl sm8250_bw_table_enc[] = {
+	{ 1944000, 1954000, 0, 3711000, 0 },	/* 3840x2160@60 */
+	{  972000,  996000, 0, 1905000, 0 },	/* 3840x2160@30 */
+	{  489600,  645000, 0,  977000, 0 },	/* 1920x1080@60 */
+	{  244800,  332000, 0,	498000, 0 },	/* 1920x1080@30 */
+};
+
+static const struct bw_tbl sm8250_bw_table_dec[] = {
+	{ 2073600, 2403000, 0, 4113000, 0 },	/* 4096x2160@60 */
+	{ 1036800, 1224000, 0, 2079000, 0 },	/* 4096x2160@30 */
+	{  489600,  812000, 0,  998000, 0 },	/* 1920x1080@60 */
+	{  244800,  416000, 0,  509000, 0 },	/* 1920x1080@30 */
+};
+
+static const struct reg_val sm8250_reg_preset[] = {
+	{ 0xb0088, 0 },
+};
+
+static const struct venus_resources sm8250_res = {
+	.freq_tbl = sm8250_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(sm8250_freq_table),
+	.reg_tbl = sm8250_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(sm8250_reg_preset),
+	.bw_tbl_enc = sm8250_bw_table_enc,
+	.bw_tbl_enc_size = ARRAY_SIZE(sm8250_bw_table_enc),
+	.bw_tbl_dec = sm8250_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
+	.clks = {"core", "iface"},
+	.clks_num = 2,
+	.resets = { "bus", "core" },
+	.resets_num = 2,
+	.vcodec0_clks = { "vcodec0_core" },
+	.vcodec_clks_num = 1,
+	.vcodec_pmdomains = { "venus", "vcodec0" },
+	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "mx", NULL },
+	.vcodec_num = 1,
+	.max_load = 7833600,
+	.hfi_version = HFI_VERSION_6XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/sm8250/venus.mdt",
+};
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
+	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
-- 
2.30.1

