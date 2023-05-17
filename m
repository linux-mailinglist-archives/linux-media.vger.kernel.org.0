Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A27907073C6
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 23:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbjEQVPN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 17:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbjEQVOx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 17:14:53 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54EB903C
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 14:14:44 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2af12685274so5802211fa.2
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 14:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684358083; x=1686950083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAf0/qoqHKUIRtb0ngzMvnNiZNHVa6Jfr73oUt0pxKM=;
        b=FVnA6WsFW0zoAzCv6H+kbO9qraBaPBYxHMIKkzbr+A4UZdYwJCAxegNCMXkU3RVmfV
         ZFTz+XxYV2woaFChYQS6OGVtdO3DhC74kdmYxWG9gUWpeV/OaoXQQfF98vjG1DK4atAW
         3S/G9YiaiR12TsQuudU/mAa8g4PDor/ch2Ex9OE+O/UZIaTcYwXgKrMOSW0Jx/5aZLxI
         c9n703kwEtkI6+x2DJ2ntcOFcWX5C3ACg0oR6V8pTHli+PCXdrxb8rnCc67AcGyZbYJP
         S+6uqgYK7jqIrVWZWjM/dXJF7kgF/y0K6XSogSJXOe+oFjLg7YB4HgR8CXRXt/osgBJJ
         pEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684358083; x=1686950083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAf0/qoqHKUIRtb0ngzMvnNiZNHVa6Jfr73oUt0pxKM=;
        b=I5+x1u/NgyNiSG1deLQp9zqEH6BT2MFjE86DQOM03riaHo4ogBSTtxXk0feC1tk6cm
         XsMWaIaMkb7BaLUltlfUZwgpVGZ1xQfy3xt7O8YmHXmS70kw4NXqdnx/Mqy57MnNtvkr
         nlN4FcLJ8EG6LDM0ka4K8uGDbC+3dzvQS7IbO6J9N/I6M3XGHWv6RMxJEZx8/7bsHgT+
         2phHvp5vGE0kV5DXcf7iVBRRLox9R+Vmm0RMihKX4PyeXfvTRps2+2P+G50r4W1vfS4P
         UDkX+mPC/56SzJ1a8x1C8QXuF8ZFP5fW+360BT2KxpKf/SH72y22EtrFvp7tuzkMAvdS
         5w7g==
X-Gm-Message-State: AC+VfDxEafOXXmqYWwYqrGT+5gTiESxGPUGc1k5fXijInDGMa2UyxWUn
        fMITPG7k/EopskgN1AM5Cq+l0A==
X-Google-Smtp-Source: ACHHUZ5rRoX8gPjScShdz/mReax4WkVRDeJh8uSlCs+7I6yB2tMGKVvdW8+P+3Ns2nGjlTFTZ6+hGg==
X-Received: by 2002:a2e:b709:0:b0:2ad:f8d:dea with SMTP id j9-20020a2eb709000000b002ad0f8d0deamr10982653ljo.11.1684358082955;
        Wed, 17 May 2023 14:14:42 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8345000000b002ac88e29049sm4781142ljh.43.2023.05.17.14.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 14:14:42 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 17 May 2023 23:14:24 +0200
Subject: [PATCH v3 11/17] media: venus: hfi_venus: Sanitize
 venus_cpu_idle_and_pc_ready() per-VPU-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v3-11-6092ae43b58f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684358064; l=913;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=i7kHJHgzddaQidXryK/eoAjtHGCE1SThJBvwoun4KlE=;
 b=e+RcPjLVdkjjddFqjj7bF91NbgkvCaQSbjYiEeroR0nMP6OKy6b8cZbS93u9/4Grita12S1d7
 LJqrf41c3VXDnn8T0wdfZxe+4bbXeTQQZhgCPIn9YOG+wkTcBQogMUh
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

Replace the general IS_V6 checks with more specific VPU version checks.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 2db5361cd5df..105d49fb72be 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1557,7 +1557,7 @@ static bool venus_cpu_idle_and_pc_ready(struct venus_hfi_device *hdev)
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	u32 ctrl_status, cpu_status;
 
-	if (IS_V6(hdev->core))
+	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
 		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
 	else
 		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);

-- 
2.40.1

