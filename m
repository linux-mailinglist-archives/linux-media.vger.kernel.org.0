Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2AD77073AF
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 23:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjEQVOk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 17:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjEQVOg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 17:14:36 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D631D83F3
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 14:14:33 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ac8ee9cf7aso13433841fa.2
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 14:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684358072; x=1686950072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umRAJMqKc5zF6FOAntGSMEcHnMlgnfWakGEzWkoJKuw=;
        b=xCQfwTscEvtS2rrOux3FRlqc0g861cQHp8W+wx4MmACk6AbBbjvABF7ylMkB1utg2w
         iepKJ3Xe9+zKqFIvFu7T4N4ZOxfQZtFAJZHN2AAseg3aVfwMb56JDEz4f5oPCSZcU7yc
         mfAQmN3xhtCVo+1x/UKM/UJxXIxdcqzyKI12LH7OmLTecgSbPFbwJZQ5PamRAqhzz9Ua
         WARLlGezEb9UlUS15/atY9lZ10pDG4k06zgo6t8LQjIzcHPgpUjTYfk8El1vJcKGyVMO
         /XVh9H07d9UzUJ8hUHPxnK40T2DeFmGcleRB1g57ia59asuZVf47cROmRJzVBXGM9LrJ
         2raQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684358072; x=1686950072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umRAJMqKc5zF6FOAntGSMEcHnMlgnfWakGEzWkoJKuw=;
        b=k3W4WPOb8l12ZaNdIAIjjm0XBIxKikK0s/sNLWsrFT/6sE7hJcLsb/4EWn/FX6IFwP
         27/LaM6cYdM8erlr7y3AJ8T3lw2gY1VgygnZJxR28UnxCeroxcSOHCjp5LWkf44ZIHfJ
         ayIpZm0mS6IEH7VmKfd35Vbn2sAvnSS2og/21uH+TeBcgp6ewWaI9bhwj5eLap9Qy6M+
         /9GT43TMFK441pdF03AgkPbhrKVym8dNLJP0SI4N2k6gHDEeCx0v1ZaHOsEvndUBGDEt
         4nEBlY0HkAA8Ujzhs8XQ4le6lqtYSmFv72KNNOnzb5KHo29RYb5iz0nSsDCZuWMcqzXk
         DS1A==
X-Gm-Message-State: AC+VfDyJU7WL13y58bwfn/KSn+vHY06oOK5yBN7/xecuwIuK16516H9S
        EZkvFpwGOL0CFzt9LSShiDV9FA==
X-Google-Smtp-Source: ACHHUZ6bRdZiWx4+kMVTtpzPkUtuso8ZdtBEASLvPQSebYOcaJbFL78oPbNh4Blk6kyNIKYSua7MvA==
X-Received: by 2002:a2e:3201:0:b0:2ad:8f4a:1e52 with SMTP id y1-20020a2e3201000000b002ad8f4a1e52mr9502642ljy.30.1684358072091;
        Wed, 17 May 2023 14:14:32 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8345000000b002ac88e29049sm4781142ljh.43.2023.05.17.14.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 14:14:31 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 17 May 2023 23:14:17 +0200
Subject: [PATCH v3 04/17] media: venus: Add vpu_version to most SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v3-4-6092ae43b58f@linaro.org>
References: <20230228-topic-venus-v3-0-6092ae43b58f@linaro.org>
In-Reply-To: <20230228-topic-venus-v3-0-6092ae43b58f@linaro.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684358064; l=2055;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=nc30HaKHpy9R0tdyW3Z01908RNfbGE4dIZSAtIHTLSQ=;
 b=YXKIWgtmy6cmCJsJJvLU4SOyJogiI+vvX3h3IUV8wCW9zGscSByxBEcJEZbzB8DDLQbVhwW+j
 xKexNN9dYTyBNpkvH74EMqflr76LpD6nvs/cJ+BMjqxephMCpvg/TqE
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add vpu_version where I was able to retrieve the information to
allow for more precise hardware-specific code path matching.

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 2ae867cb4c48..01671dd23888 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -684,6 +684,7 @@ static const struct venus_resources sdm845_res = {
 	.vcodec_clks_num = 2,
 	.max_load = 3110400,	/* 4096x2160@90 */
 	.hfi_version = HFI_VERSION_4XX,
+	.vpu_version = VPU_VERSION_AR50,
 	.vmem_id = VIDC_RESOURCE_NONE,
 	.vmem_size = 0,
 	.vmem_addr = 0,
@@ -709,6 +710,7 @@ static const struct venus_resources sdm845_res_v2 = {
 	.vcodec_num = 2,
 	.max_load = 3110400,	/* 4096x2160@90 */
 	.hfi_version = HFI_VERSION_4XX,
+	.vpu_version = VPU_VERSION_AR50,
 	.vmem_id = VIDC_RESOURCE_NONE,
 	.vmem_size = 0,
 	.vmem_addr = 0,
@@ -756,6 +758,7 @@ static const struct venus_resources sc7180_res = {
 	.opp_pmdomain = (const char *[]) { "cx", NULL },
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_4XX,
+	.vpu_version = VPU_VERSION_AR50,
 	.vmem_id = VIDC_RESOURCE_NONE,
 	.vmem_size = 0,
 	.vmem_addr = 0,
@@ -809,6 +812,7 @@ static const struct venus_resources sm8250_res = {
 	.vcodec_num = 1,
 	.max_load = 7833600,
 	.hfi_version = HFI_VERSION_6XX,
+	.vpu_version = VPU_VERSION_IRIS2,
 	.num_vpp_pipes = 4,
 	.vmem_id = VIDC_RESOURCE_NONE,
 	.vmem_size = 0,
@@ -866,6 +870,7 @@ static const struct venus_resources sc7280_res = {
 	.opp_pmdomain = (const char *[]) { "cx", NULL },
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_6XX,
+	.vpu_version = VPU_VERSION_IRIS2_1,
 	.num_vpp_pipes = 1,
 	.vmem_id = VIDC_RESOURCE_NONE,
 	.vmem_size = 0,

-- 
2.40.1

