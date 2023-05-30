Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 995E2715F95
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 14:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbjE3Mbb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 08:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231524AbjE3MbZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 08:31:25 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 229A018E
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 05:30:58 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2af29e51722so47265751fa.1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 05:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685449842; x=1688041842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbfKhEi6AP8oogWxHIUjADOArHuCuwJja0KhM7U85+Y=;
        b=vRUpZqjHX8gIg96+0FXtOpJ2hZUbOQ3/nAAEOW3FU2s1Q6TOPRx8r50flnJZYZrNX2
         JVGKmM3YdFqHYHziwTHBrMk44DKqeWdhgsrPm4zPqVZaGl1FCX3icDyphQhKTUtIOjBv
         Rlk9TLhcEPzHkmVbtpPWzQvhDwvysNQHDWY8LqHkDBwX6lWA08/73Sl0mDuWhdxYouxR
         Gza9y3rf9IzmJObxzJ1FxbKTHvekPhgJ17SnZ2lkk+6RB1f410MbbO+hAyy2PoprH9Dd
         s/RiKpT2CLs4gKVr7fX0eKyz/ofuzJ+hLzQdFh43Z1Eiz48/gTkWZdpZNVWYwrXzHjMw
         Rczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685449842; x=1688041842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbfKhEi6AP8oogWxHIUjADOArHuCuwJja0KhM7U85+Y=;
        b=G9y0VlvLvGU9NewWVwFX2lHMLb1FSPEoYo4U613kaXflGn+Nafdrj0/vU5KvDdgWeC
         QFIKd4M3dDbEx1mXXp2wcoux0QAbUfBV6QAmfYq5CTS9E7+6X6PtIL0aved8g3MX6xlI
         TD8fG7q0sHDkW6oXMqGCbhq5FbzUhYraRa/LMSiXYiBRBmFCr4Bj+sPwRcZhro8Lo02Y
         LSCWtxxyqLHmTM2NQu/xeUur7Ey0HlvDufHcMkXXq1mEthI1f8WouSYVbuP7P8Cbgdjb
         v/RRStYDTnee64Is1Ve3WFkUbhI3e19pNE3IYuKF81RUAyA4awDXwd/vMAdkY2CYnFQp
         hJSQ==
X-Gm-Message-State: AC+VfDyAsbA5CPgu4X9K+FGvwiN+nSunBerYXlLqeAXlOh3ZwYtgCGsY
        FqRDlbAd/Wm9MblpCCxGFnPJbQ==
X-Google-Smtp-Source: ACHHUZ4fiaEB6l9xrvcHu6Ng1NM7TGxQ2cCfXI+eAVIk9J9KIJH3jnMej9GKtK0hJb/x9YP4CZlVsw==
X-Received: by 2002:a2e:2e16:0:b0:2af:22a0:81fd with SMTP id u22-20020a2e2e16000000b002af22a081fdmr689378lju.11.1685449841843;
        Tue, 30 May 2023 05:30:41 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id u18-20020a2e91d2000000b002a8b8baf542sm2854814ljg.126.2023.05.30.05.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 05:30:41 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 30 May 2023 14:30:36 +0200
Subject: [PATCH v4 02/17] media: venus: hfi_venus: Write to VIDC_CTRL_INIT
 after unmasking interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v4-2-feebb2f6e9b8@linaro.org>
References: <20230228-topic-venus-v4-0-feebb2f6e9b8@linaro.org>
In-Reply-To: <20230228-topic-venus-v4-0-feebb2f6e9b8@linaro.org>
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
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685449837; l=1518;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=6Tn8t8czcTnx35lpk52WIN8IiuX0IKqs1GzlBMeyKQk=;
 b=YkKhxl3/ihamy1BEEQDPatQ+JPwks7Lxn+y7kclMML3j/mWQMghtFGtL7R0Jo7xbdfhZcO5oh
 rBHg1+d4v0KCCYNwh4lBl8mllhLQJSFw+dUDchB/5jOADrNxIwG7Yzj
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The startup procedure shouldn't be started with interrupts masked, as that
may entail silent failures.

Kick off initialization only after the interrupts are unmasked.

Cc: stable@vger.kernel.org # v4.12+
Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 918a283bd890..5506a0d196ef 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -453,7 +453,6 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	void __iomem *wrapper_base = hdev->core->wrapper_base;
 	int ret = 0;
 
-	writel(BIT(VIDC_CTRL_INIT_CTRL_SHIFT), cpu_cs_base + VIDC_CTRL_INIT);
 	if (IS_V6(hdev->core)) {
 		mask_val = readl(wrapper_base + WRAPPER_INTR_MASK);
 		mask_val &= ~(WRAPPER_INTR_MASK_A2HWD_BASK_V6 |
@@ -464,6 +463,7 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	writel(mask_val, wrapper_base + WRAPPER_INTR_MASK);
 	writel(1, cpu_cs_base + CPU_CS_SCIACMDARG3);
 
+	writel(BIT(VIDC_CTRL_INIT_CTRL_SHIFT), cpu_cs_base + VIDC_CTRL_INIT);
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(cpu_cs_base + CPU_CS_SCIACMDARG0);
 		if ((ctrl_status & CPU_CS_SCIACMDARG0_ERROR_STATUS_MASK) == 4) {

-- 
2.40.1

