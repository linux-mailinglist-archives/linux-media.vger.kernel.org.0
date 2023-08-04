Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9558077097D
	for <lists+linux-media@lfdr.de>; Fri,  4 Aug 2023 22:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbjHDUJr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Aug 2023 16:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbjHDUJa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Aug 2023 16:09:30 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A1D3C23
        for <linux-media@vger.kernel.org>; Fri,  4 Aug 2023 13:09:24 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b9cf2b1309so31077501fa.0
        for <linux-media@vger.kernel.org>; Fri, 04 Aug 2023 13:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691179763; x=1691784563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBO4Vdvml2SYBdu5NUZqbYfg4CTImrGpccpVKF2w13k=;
        b=V4iAp70pVK1GSSuJGqjPoX5t5a8sfEZUzvv4C5LhZAE3lnSAEvm0R9B7CW+/wjn79P
         VHtTsJqwUtdGcRZsmf2uMt3D+FmAwjMRQFxrxQGZQIooNyq0DCDKwUszEr+w1Mlily8B
         9LmYDkegkCDEfQtLLX6qqvX+BBFvPN7hQ128FvZ9jg1PkCWSWnLTDl9/yJFXaW02221b
         nlK1GyUoS/TSSQa82DBXCfx7uLVdtLvbvj8W4Waj6e6AWwCaUh18/30luXux1hofiMkz
         jjG0NKu0/B7BzDWyjxsHoLt9lNmic3FlvD1RLG1mKnvW3npKH6U1RFCBmVcFD+A5/p9l
         uEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691179763; x=1691784563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBO4Vdvml2SYBdu5NUZqbYfg4CTImrGpccpVKF2w13k=;
        b=hITq5jC3wWwEuhfjgr1eXKnOqV4OoIvP42bWd5G7YVTItTZOCNH1jCC1sKioDQnmNT
         ufFINVMOTLM/nj3guNaHnSP8MuO/fakT1Y8x4nLr3OT/RHSsDo5qbhXs9iFSP4Afl/7F
         Jjr91GzMZNtLEa8ivXzZJE0RtiqnfA6QtZ5bwkBKg8luh5XLnIq181HlvgIHpxiPEkZd
         +YQ4IQppYaM4L6pFpd4XoWKGsXOiUXufrUEiTNZ7QzigGnL6yHBG3l4tvac2MBvJ1X7f
         yM7r6tV+NPvHL8W+lmvAPRxwfI9IlNJL1FSIpPcr0C7hXst5uUPNjPAhtqK0gjTzNkey
         gG/Q==
X-Gm-Message-State: AOJu0YxQph1//ZZSKbyo0aSi3r7MXgwgrGvx5MVqZsucTvJFwHLIp+q6
        FOngbpUfTiDuV0EvSN1Ki3T4Gg==
X-Google-Smtp-Source: AGHT+IF1LO/hbzvuESlETKCXdfFSJUHe89V8P1OfbYwQw47k8P77yEV7r273idGHjzzYnXtKFj32Hw==
X-Received: by 2002:a05:651c:200a:b0:2ba:1286:d99e with SMTP id s10-20020a05651c200a00b002ba1286d99emr207090ljo.1.1691179763173;
        Fri, 04 Aug 2023 13:09:23 -0700 (PDT)
Received: from [192.168.1.101] (abym15.neoplus.adsl.tpnet.pl. [83.9.32.15])
        by smtp.gmail.com with ESMTPSA id m8-20020a2e97c8000000b002b6fed37b18sm580048ljj.101.2023.08.04.13.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 13:09:22 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 04 Aug 2023 22:09:13 +0200
Subject: [PATCH 6/6] media: venus: core: Add SC8280XP resource struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230731-topic-8280_venus-v1-6-8c8bbe1983a5@linaro.org>
References: <20230731-topic-8280_venus-v1-0-8c8bbe1983a5@linaro.org>
In-Reply-To: <20230731-topic-8280_venus-v1-0-8c8bbe1983a5@linaro.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691179750; l=2590;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ha53B+QQKlS6cZf/sln/5h8cUTUGAcICl3MpcEH5dmg=;
 b=K0lLgvFpQKiaTwNfLvVCPicVclZYdtr9Z1AYSsOZjtnhAZ8bWA0srGRdn3PHL4aiex9Wgf8NH
 yBYG0oPN5KuBUbFehP3gGMXykbemozZD3aTwqLkLRQYJT1lLyPV2E8w
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add SC8280XP configuration data and related compatible.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 45 ++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 5f285ae75e9d..32591b624a36 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -940,6 +940,50 @@ static const struct venus_resources sc7280_res = {
 	.fwname = "qcom/vpu-2.0/venus.mbn",
 };
 
+static const struct freq_tbl sc8280xp_freq_table[] = {
+	{ 0, 239999999 },
+	{ 0, 338000000 },
+	{ 0, 366000000 },
+	{ 0, 444000000 },
+	{ 0, 533000000 },
+	{ 0, 560000000 },
+};
+
+static const struct venus_resources sc8280xp_res = {
+	.freq_tbl = sc8280xp_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(sc8280xp_freq_table),
+	.reg_tbl = sm8350_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(sm8350_reg_preset),
+	.bw_tbl_enc = sm8250_bw_table_enc,
+	.bw_tbl_enc_size = ARRAY_SIZE(sm8250_bw_table_enc),
+	.bw_tbl_dec = sm8250_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
+	.clks = { "core", "iface" },
+	.clks_num = 2,
+	.resets = { "core" },
+	.resets_num = 1,
+	.vcodec0_clks = { "vcodec0_core" },
+	.vcodec_clks_num = 1,
+	.vcodec_pmdomains = { "venus", "vcodec0" },
+	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "mx", NULL },
+	.vcodec_num = 1,
+	.max_load = 7833600, /* 7680x4320@60fps */
+	.hfi_version = HFI_VERSION_6XX,
+	.vpu_version = VPU_VERSION_IRIS2,
+	.num_vpp_pipes = 4,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = GENMASK(31, 29) - 1,
+	.cp_start = 0,
+	.cp_size = 0x25800000,
+	.cp_nonpixel_start = 0x1000000,
+	.cp_nonpixel_size = 0x24800000,
+	.fwname = "qcom/vpu-2.0/venus.mbn",
+};
+
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res },
@@ -948,6 +992,7 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2 },
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res },
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res },
+	{ .compatible = "qcom,sc8280xp-venus", .data = &sc8280xp_res },
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res },
 	{ .compatible = "qcom,sm8350-venus", .data = &sm8350_res },
 	{ }

-- 
2.41.0

