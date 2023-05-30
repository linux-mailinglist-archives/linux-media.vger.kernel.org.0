Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D798C715FCD
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 14:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232039AbjE3MdI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 08:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbjE3Mcl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 08:32:41 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6B1E4D
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 05:32:07 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2af2c7f2883so45882021fa.3
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 05:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685449864; x=1688041864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=473x+lqpzUfA2jtVVPxgqLYhChW/9qnAzMi0phiVfDU=;
        b=SbDg3Cb800/J9YKHr/9xr/So94j1gdK2pCQq2DpZwtW0XYNJzdyj3g+EeFYCuKOswg
         V5g0jjllzu2HJqYY0SRrnpBMVkKsess1Ix85hkjezHpB4EXgk5CuWhzYuDk5A9ovS+HQ
         INCMunxkw/qkfq3euvf7XnrI3JgXorAG6UYdxl0p3pPqYl+io5+JoB24t0JJLX0W6wou
         AEFX7VHeDctfIiLhMkzRYEmR4KlD9p4TAYpz8fKAQyiY6OvGqbNOS8djWboPNLJaukdA
         mj1DcJVsvifEBc2p7JppBBDnL+xWOXUgmd9wqs1TwzdG+xo8+2IGcQzS+Hrckkmzl5t+
         XWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685449864; x=1688041864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=473x+lqpzUfA2jtVVPxgqLYhChW/9qnAzMi0phiVfDU=;
        b=JoYxsI2DS+Z/OM6vBurXfZneBF5sA/gpjcRREcupkv9tirfUMn2zC7d81QCDYSG18r
         HRoeygP8MBZ4pG5oquVEFv/1aDr0pC+t1SaQmY91OnceHugdmqqkIfDbZNuVU6fSBQAZ
         QxgdLaSt39kA2aCHCNVqHwxLHqHuTTag6j4Qq+NF2k1IRFH1sf1VRxzQO8ajSxfoZtNZ
         oYVgNdG9TcU7ZLaxDcxcL+qeDl18w8BOQZsWnDGigs9WLkqGNEuQ74liPTo//5g7O1B7
         sLxVzDek5qTdbGdJpzlpN5S4gs5QrpKdVHeEx6OYtJMCdKChyrohZV15RXZBkk1slg3x
         6p1A==
X-Gm-Message-State: AC+VfDyrdWjQimtbF8hgCczRq1XIcQXThbjR5BFD/QVDkOz82eMxdCe8
        mDTqlw1V/GiSCSX5r3DNU3yWxg==
X-Google-Smtp-Source: ACHHUZ7/QXbo3yHpNDSE14vxr/l3CfeUgwZfQCqZydr5pHp063/LWEiSvqmesyK56npYxU0ALEC2dw==
X-Received: by 2002:a2e:93d5:0:b0:2ac:5905:eff9 with SMTP id p21-20020a2e93d5000000b002ac5905eff9mr690143ljh.6.1685449863993;
        Tue, 30 May 2023 05:31:03 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id u18-20020a2e91d2000000b002a8b8baf542sm2854814ljg.126.2023.05.30.05.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 05:31:03 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 30 May 2023 14:30:51 +0200
Subject: [PATCH v4 17/17] media: venus: hfi_venus: Restrict writing
 SCIACMDARG3 to Venus V1/V2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v4-17-feebb2f6e9b8@linaro.org>
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
        Vikash Garodia <quic_vgarodia@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685449837; l=1033;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=oNIm1Wj0FhsO3S/n6eYL1/VajszUoAmbnQl8ZF5tL0I=;
 b=EE9MNWA8F4kINCga1/UXPCIhBDawDBerb3GjKdXmHwemGRPPenW+uzKGjJDlutvnjbhxRuBrL
 n2qOIG5TDzJBQ2xwNRHxcaDBE2ggs1hhafCeMzDCs4pTESJoU7Dx3gQ
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

This write was last present on msm-3.10, which means before HFI3XX
platforms were introduced. Guard it with an appropriate if condition.

Does not seem to have any adverse effects on at least SM8250.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 82854553f99e..19fc6575a489 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -462,7 +462,8 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	}
 
 	writel(mask_val, wrapper_base + WRAPPER_INTR_MASK);
-	writel(1, cpu_cs_base + CPU_CS_SCIACMDARG3);
+	if (IS_V1(hdev->core))
+		writel(1, cpu_cs_base + CPU_CS_SCIACMDARG3);
 
 	writel(BIT(VIDC_CTRL_INIT_CTRL_SHIFT), cpu_cs_base + VIDC_CTRL_INIT);
 	while (!ctrl_status && count < max_tries) {

-- 
2.40.1

