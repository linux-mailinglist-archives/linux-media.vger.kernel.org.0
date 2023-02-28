Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9A996A5BAF
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 16:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbjB1PZE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 10:25:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbjB1PYr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 10:24:47 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB8324115
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 07:24:44 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id i28so971422lfv.0
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 07:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677597883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4xuvAnYE2JZwfKFXp7AV+YC6//bPuJqtQS+4kWNGBM=;
        b=EZ2y2iBNaR+gVD9Ez/YMS/EJijOdC3Fep1XtCvcrLkyiJ1L+rjamEbj055LVNVS/+P
         C23M6BNJV3xNALvnMI+ZJKsfNEdYtGgsvc9hUNsJgkauUMEtj+Ag2tRpFVbqGWcVywm2
         SU/LHyGPIkYSYzzEpMZRQvXTUGngjc/TZthmUJOSMhis6zk+q7pulNReWj9WxnPo9INP
         YKYsWEi+/WGNFXqbiM9BpHyjkZSuvlb8hSwZ/EzJTzGFyRvMgI5QTOM6PHsnzwPj+Kya
         I45qAhzyChisUPYNIU9kTkB36hCRq1ADNrKdWDyGLVg4ZLEgJT4GDhb6SVTp+UJDJmHf
         gCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677597883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4xuvAnYE2JZwfKFXp7AV+YC6//bPuJqtQS+4kWNGBM=;
        b=1rBjlg8YkJA9ebQmlFPajjxk7oqODRudiVgMbguyI0e9mPIZs1bYWycNgMdCS1ksfm
         V6/pXboGpY+PTIMpzVozLMwBm98N97u7rABdwGiy62SD7W5cjnDhQKUOlXcNeQfEzaXN
         YXqh2XbaHug8X7Fl5Ga1OT2RMHc6MMDOmKDbyo1QAA+9is6uXE+vV3naa811jDPK9azf
         OLC4ci27fXBoWdlc7pPUeIbDlVfIs+2YmZVReg7J/BvMUxCsKRHw2bbmAQ1aUn4r+F8B
         h1Er3JRgQNdUtBFLYi+h+C01/oazWGIrCvlPI61rzCWdOqJ0WN8qtRsW3MgjKVQAbdKL
         os7g==
X-Gm-Message-State: AO0yUKULm86NMLJ83AHxIXnT6ochOQLtfkEoCTbmCb+lhTz3G+28KFjk
        Y2227DLhgTiiXRHHWX9znVjY3w==
X-Google-Smtp-Source: AK7set9Nx09q1xk3UMtxKXhFCB8Jru+j76Kv0PINz7jERmz0uIcjocFFwO4OgZenXTVeACxtmgyBnQ==
X-Received: by 2002:ac2:539b:0:b0:4dd:821c:3688 with SMTP id g27-20020ac2539b000000b004dd821c3688mr754024lfh.66.1677597882849;
        Tue, 28 Feb 2023 07:24:42 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id h17-20020ac250d1000000b004db3aa3c542sm1363688lfm.47.2023.02.28.07.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 07:24:42 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 28 Feb 2023 16:24:30 +0100
Subject: [PATCH 06/18] media: venus: hfi_venus: Write to VIDC_CTRL_INIT
 after unmasking interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v1-6-58c2c88384e9@linaro.org>
References: <20230228-topic-venus-v1-0-58c2c88384e9@linaro.org>
In-Reply-To: <20230228-topic-venus-v1-0-58c2c88384e9@linaro.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677597872; l=1424;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=4cqdrxrrUgh13B8sLIuOgZXxifYwhKNgm7jLLB9azJ0=;
 b=B8st5MyNmMBX79EtSQ6MZuilPEoKwlnJ0Rs0FLW47HrlhaXrxRM6spie1IVShxpnLMDf1R4BW8jF
 9PWFeIsyDn7dNIV63jc3/QbMaq8OINVGSmzY++FcZ6+EZGg9DLkZ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The downstream driver signals the hardware to be enabled only after the
interrupts are unmasked, which... makes sense. Follow suit.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 772e5e9cf127..4d785e53aa0b 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -454,7 +454,6 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	void __iomem *wrapper_base = hdev->core->wrapper_base;
 	int ret = 0;
 
-	writel(BIT(VIDC_CTRL_INIT_CTRL_SHIFT), cpu_cs_base + VIDC_CTRL_INIT);
 	if (IS_IRIS1(hdev->core) || IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
 		mask_val = readl(wrapper_base + WRAPPER_INTR_MASK);
 		mask_val &= ~(WRAPPER_INTR_MASK_A2HWD_BASK_V6 |
@@ -466,6 +465,7 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	writel(mask_val, wrapper_base + WRAPPER_INTR_MASK);
 	writel(1, cpu_cs_base + CPU_CS_SCIACMDARG3);
 
+	writel(BIT(VIDC_CTRL_INIT_CTRL_SHIFT), cpu_cs_base + VIDC_CTRL_INIT);
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(cpu_cs_base + CPU_CS_SCIACMDARG0);
 		if ((ctrl_status & CPU_CS_SCIACMDARG0_ERROR_STATUS_MASK) == 4) {

-- 
2.39.2

