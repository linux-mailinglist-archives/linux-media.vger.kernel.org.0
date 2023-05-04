Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CEC26F6693
	for <lists+linux-media@lfdr.de>; Thu,  4 May 2023 10:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjEDIB7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 May 2023 04:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbjEDIBt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 May 2023 04:01:49 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA9C3C34
        for <linux-media@vger.kernel.org>; Thu,  4 May 2023 01:01:38 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2a8a5f6771fso1969941fa.3
        for <linux-media@vger.kernel.org>; Thu, 04 May 2023 01:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683187297; x=1685779297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PaAO6KbucUD7sHLqAUICCg61yVdFTkFkYPZOacYDIUA=;
        b=YWeqp4eIilP1QTmr9LlCR+XFh3h3RwZBNg5GrOa6+n2wSitL7fNb6un47ABP5pOMNP
         l9bc4Z0eg4If7ffQ5viyJTDrmfU7j/SwxH9hCwRZMJdjZZnqGRoHZKEkI4Tj4pziN3AU
         CWl4mQJUHJxDUqT9plBZ5V5NFMrSlo5vTq/0Z8R2EnqtO3lBGk/atYmsAT8mzn9rpwOR
         z75CgJlCX0pql/9uw4X5BxWgptsA3axkYUCtHO9yZDFXJhgbqA00OyntjWrBcP7wKxuH
         QM13MJy8Er0UV4o0IbFy4Sw3A8yK0kJwBo00tH1eNEfAqzG1j6+8WkI6MQXvN8/6cTbM
         kkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683187297; x=1685779297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PaAO6KbucUD7sHLqAUICCg61yVdFTkFkYPZOacYDIUA=;
        b=A0wTEymzJxDvIgDThDXP0/7plY/KJoA7T4AEJp5GlQiKAJxxj2E3hbwFmqNn8+XqSX
         qwoEYSR5HCgeET5YTav9v8AKjkTSroUKRlcxw7ERrvymLNVKt5pPYApz0PL3uTAbSe5L
         al6PljkT/PR97oEeOuCFzl+f5Qj79NB+o7DX8E9aCcZwJKk1EuaxNhjt4r/jKqtBzKiQ
         qCOGnPIKSQjV0ot3z9PhY8rfWX8yHGUz6auCIncZu1pNuaYv27LjGo93kxAIfOdijp6d
         bXVYGGd7XZjRYNBN56CQzZGxJZxe73Tdv/YPcneXt2vlEEZtu1mDAH/ZgN59ROMkNyMy
         VJSg==
X-Gm-Message-State: AC+VfDxf05QxFacFrfj/lDgyIA4/dacbQi+KpyWXbam3YvvSulqtuxL0
        H09nZylr7UdNlhHcdRQffyuNtNly7xkksFY1g3U=
X-Google-Smtp-Source: ACHHUZ69PmJuZEEsn/7Rao4cWdVRqYPLQ+gr+DPp0icoV/BNUsb++4UpSyuhJyrWdiN6ylRL46IW5A==
X-Received: by 2002:ac2:5551:0:b0:4ec:85f6:5bf4 with SMTP id l17-20020ac25551000000b004ec85f65bf4mr1560630lfk.67.1683187297204;
        Thu, 04 May 2023 01:01:37 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id n26-20020ac2491a000000b004edc512515fsm917165lfi.47.2023.05.04.01.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 01:01:36 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 04 May 2023 10:01:03 +0200
Subject: [PATCH v2 07/18] media: venus: hfi_venus: Sanitize
 venus_boot_core() per-VPU-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v2-7-d95d14949c79@linaro.org>
References: <20230228-topic-venus-v2-0-d95d14949c79@linaro.org>
In-Reply-To: <20230228-topic-venus-v2-0-d95d14949c79@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683187284; l=1840;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=jgU7eoLOdocZ2/cCE0wfh1hS/YMFv/9bQw2DJ7khniY=;
 b=rkj9z6gxfeKGh/ipIT6gpC8Zndl9khftLdh9zsxLYTn3gIX2EfNqR3vjS9w7D4yFoUzHe/ewq
 vWfYg/7gh4uB37EtSzzr325y6WxIgn4XLTvdbNyRTrgJ/txsIqG8841
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

The current assumption of IS_V6 is overgeneralized. Adjust the logic
to take the VPU hardware version into account.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 8fc8f46dc390..9b840440a115 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -447,19 +447,20 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 {
 	struct device *dev = hdev->core->dev;
 	static const unsigned int max_tries = 100;
-	u32 ctrl_status = 0, mask_val;
+	u32 ctrl_status = 0, mask_val = 0;
 	unsigned int count = 0;
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	void __iomem *wrapper_base = hdev->core->wrapper_base;
 	int ret = 0;
 
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
 
@@ -479,10 +480,11 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
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
2.40.1

