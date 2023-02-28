Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACAF16A5BB5
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 16:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbjB1PY6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 10:24:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbjB1PYn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 10:24:43 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E349027D50
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 07:24:41 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id t11so13741046lfr.1
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 07:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677597881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XR97t0vv1eCXn18PURYfzYkLTv3CB1qpCk7uOk1LjA4=;
        b=j7igxwPlJ9BZPas8I+MoCiShBmXS/UAf/QUDhGhej2SAJ4CambOCAU2pbuaHfzxlR2
         vwyl7zMF6TZDUTImvA/++pkTUaXGKkHoPPx/nGljXhZ3zj+/GlBrEQC+yRuIdL5g234Z
         FS+PBZL1AAtQynHPBtzi1sSL6cFws0lfp5lB61NSrij9qKbi3hbOKgvSaZ1oSqiiVxSo
         OZJxhUGHfECFRvLDXPPMMc7HqFwpjK8DnQkuJTnuZKCn3fbj5r9c2W0/dLHN1cwfVs9V
         eCBVLcdVSfFpANSRgAEy0HxLEstzZOiEdfL+ay5bGhMMuXwCtZZNyFQa3RvxXPvSmBwq
         RjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677597881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XR97t0vv1eCXn18PURYfzYkLTv3CB1qpCk7uOk1LjA4=;
        b=6HH3i67WFv+SS5A+P/1qIgwK8cbjuuRbfi4gJ/tH21SfBdSX5r4y7fu06Nxcl2eOyn
         QYqUskZEhoKkKxtZ1XeLqOBFPwz9xNZikLOtBuM+p2ohl91C3jnqYb66e16JRlTx8AL6
         OZmOxkbrWUAnIlFBscOAjb+sJOn728uKJB70Aw7rb2HfI66PLmvvqYHvBAGCvKgG+0C9
         N6PWUPg7pg99uWd1//94RGA1/tVaNE0O6l4vuf3DrxhN2KSKJX/FIgmU8m/jZOJqk1qZ
         2Fnv5Y7rEBm7oMQckHGrZD6NIcYrBbDiqmZmktMzV35DQtiHif3r4DL6In5JPzREa679
         ocYA==
X-Gm-Message-State: AO0yUKV1zCWmx/LGU32y+5MQAGdhuRvb70k8YDS8n2v3tu60vgwCMeUZ
        b4B8lrpfT4IJMBi269mDEYGlZA==
X-Google-Smtp-Source: AK7set83w32q2oxDqzKgIwmoyEnUeJXEwvj8k44uOTUziukjlsVg1GWPGZNRNHe/VolkWn6yZQ4vCw==
X-Received: by 2002:ac2:4c26:0:b0:4db:2cdf:4c12 with SMTP id u6-20020ac24c26000000b004db2cdf4c12mr702484lfq.43.1677597881420;
        Tue, 28 Feb 2023 07:24:41 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id h17-20020ac250d1000000b004db3aa3c542sm1363688lfm.47.2023.02.28.07.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 07:24:41 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 28 Feb 2023 16:24:29 +0100
Subject: [PATCH 05/18] media: venus: hfi_venus: Sanitize venus_boot_core()
 per-VPU-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v1-5-58c2c88384e9@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677597872; l=1913;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=8YSW7Fu2jndgl/WxEEUigTPoBYrgxNe8jMMj7hfx/lY=;
 b=eZ46AiY3nhnu+cy0+y1yQj4bdcJFZ1gHXkkMCflRQXkQ3MH8Q0iTHj3iMafScPFEp64ToPtdlzJH
 4WenP9s0DhOZrMVabSSDtUsxV662HGzrEnYhfRGAm3SNPsOH/R3+
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current assumption of IS_V6 is overgeneralized. Adjust the logic
to take the VPU hardware version into account.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 4ccf31147c2a..772e5e9cf127 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -448,20 +448,21 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 {
 	struct device *dev = hdev->core->dev;
 	static const unsigned int max_tries = 100;
-	u32 ctrl_status = 0, mask_val;
+	u32 ctrl_status = 0, mask_val = 0;
 	unsigned int count = 0;
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	void __iomem *wrapper_base = hdev->core->wrapper_base;
 	int ret = 0;
 
 	writel(BIT(VIDC_CTRL_INIT_CTRL_SHIFT), cpu_cs_base + VIDC_CTRL_INIT);
-	if (IS_V6(hdev->core)) {
+	if (IS_IRIS1(hdev->core) || IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
 		mask_val = readl(wrapper_base + WRAPPER_INTR_MASK);
 		mask_val &= ~(WRAPPER_INTR_MASK_A2HWD_BASK_V6 |
 			      WRAPPER_INTR_MASK_A2HCPU_MASK);
 	} else {
 		mask_val = WRAPPER_INTR_MASK_A2HVCODEC_MASK;
 	}
+
 	writel(mask_val, wrapper_base + WRAPPER_INTR_MASK);
 	writel(1, cpu_cs_base + CPU_CS_SCIACMDARG3);
 
@@ -480,10 +481,11 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	if (count >= max_tries)
 		ret = -ETIMEDOUT;
 
-	if (IS_V6(hdev->core)) {
+	if (IS_AR50_LITE(hdev->core) || IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
 		writel(0x1, cpu_cs_base + CPU_CS_H2XSOFTINTEN_V6);
+
+	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
 		writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
-	}
 
 	return ret;
 }

-- 
2.39.2

