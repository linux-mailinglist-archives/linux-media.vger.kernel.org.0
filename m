Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A39D86F66B6
	for <lists+linux-media@lfdr.de>; Thu,  4 May 2023 10:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbjEDIDL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 May 2023 04:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbjEDICb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 May 2023 04:02:31 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E66119B7
        for <linux-media@vger.kernel.org>; Thu,  4 May 2023 01:01:56 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4ec9c7c6986so183608e87.0
        for <linux-media@vger.kernel.org>; Thu, 04 May 2023 01:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683187314; x=1685779314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/UccTAcuhBCUZ5FF6aUwvykUnIdd379ssRafTBI8b8=;
        b=k2wfBVJ9WXNUj0tgbgW8gkMU+/1meB/9vIXZndgxm10dezJlhYaNqAPsHBh9q1qZXh
         Kuzy0NH+RKCmcAn0b/jTlJi0hdiXCA3gFuqeN9yHD5AccDS8ZPHDOGwV0/CpD6CpSVeb
         k7iUiSekl9SQqyFw58h/RnWjkyaeBgx9MPRTqAjdLjYST/x9x4IJv/EMWxMHjF5vOBjK
         WnhfME2HEuhEMZEKe3g26jLri7ePZ7f3r05v2O3ejxVPa/+HQ1GN44m8ljadhbrCAa0C
         sSMWTn65rUyY8YDNDnJvpVAyibwd/Z6wyf5b7wy+e4Tz53+i8b1Pc0ZV4+XGst10qHFg
         hVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683187314; x=1685779314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/UccTAcuhBCUZ5FF6aUwvykUnIdd379ssRafTBI8b8=;
        b=LkcrTw6JFHwGognlTb/HJ0/oEIc1hr+98BLbDCcKFH7kwNDDpfvxi8BTietbtVHCYN
         8VKDxGyCw1EneKO7NRmleP4p0brusuDPaqooZnbgiKPlnyxzQTOpCDK6P/YKmSZnv4GW
         NTRhVsUmCc0ydXAqH0n2/7pzu/0UO7X+tq7F4NgbyiUsvldrsSMGMRaajq8rkSVpZnOO
         o9Q0MGOdMlQyK7VtdqPWH18SSgUFW/pTM+3kmsoOIxhQovozT8NNLk0oUn+SdRsJ0Lpl
         dWwV1YLkf7nOEfSKQ7DGcUHAtK8/K6ESB4b9Q//0s0RwVdZs5hndj21XYsX7fGiNryWq
         w9WQ==
X-Gm-Message-State: AC+VfDyJutHyILkBephqlIPar2t8vvnIYRns0aqn+9+EDaeIu1FCYpxW
        vseAuGp+FU61uTtBRz4PQaGjCw==
X-Google-Smtp-Source: ACHHUZ6vO4z0T75jgR0++P5IOouAIDe27JjNuh4RcoH0KoDzBwzm0rdiclGAxrYSwR2VBML3esgORw==
X-Received: by 2002:a19:ac08:0:b0:4ef:e990:8a53 with SMTP id g8-20020a19ac08000000b004efe9908a53mr1563858lfc.18.1683187314397;
        Thu, 04 May 2023 01:01:54 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id n26-20020ac2491a000000b004edc512515fsm917165lfi.47.2023.05.04.01.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 01:01:54 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 04 May 2023 10:01:14 +0200
Subject: [PATCH v2 18/18] media: venus: hfi_venus: Restrict writing
 SCIACMDARG3 to Venus V1/V2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v2-18-d95d14949c79@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683187284; l=1033;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Heez1R9g/upp/lte+28AqBemWtRoQ6abP6tBXj2nEJo=;
 b=dlplnoZoob7e3VzE6E58BXJl+xaZE0aZvFCtEc6T9JXS3KuWqNZRqSdT20GugI1L0NPZI0gc8
 ikoGUOm0MXWB6U7pfzKbOSW8+HPXRQE4CGqJwARcFQfYAN/c1rUZA2G
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

This write was last present on msm-3.10, which means before HFI3XX
platforms were introduced. Guard it with an appropriate if condition.

Does not seem to have any adverse effects on at least SM8250.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index d6df99a921bb..6405771568d1 100644
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

