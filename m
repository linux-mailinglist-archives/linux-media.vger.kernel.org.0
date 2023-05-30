Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B742715FB8
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 14:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbjE3Mcb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 08:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231917AbjE3Mb6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 08:31:58 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E97F2198
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 05:31:36 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2af2d092d7aso46171331fa.2
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 05:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685449855; x=1688041855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFh246SoG2jAhae1NbkulRcn/T0bmO2nXKY2ZVK5ddw=;
        b=kzsdELY83WMHUr3TgkmSvPNGp5L7NnLmYAy70Y9nga0RiFlkzkUvLCvQkDD1VLFwGT
         jX8Gk/l9fDOkKAuG98Kk27xM3S0QrgxI+cYP4Hl63IEhoKLrbrCMPrnhHsWEW2pwKfnF
         m2tW12N+fqxGkCnUWSQ1qBQdopPew7WBCvWpf3Z5GYic05Y864iIBSzBct05tBlaQ8uD
         uTMEb9LjpxdVmjHQEeFrCbmBSqrR52plkHAaqDaXN9UqOf8ETaFl9o7UVA2GWF3j5w2T
         g0tJWvXM4eRU4slDIHLOpdJ/wrzzUseWg51dddjydoisxqEF9ju0+ZErkdQLMB3YUXrU
         Eeqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685449855; x=1688041855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFh246SoG2jAhae1NbkulRcn/T0bmO2nXKY2ZVK5ddw=;
        b=Q5+8RRm41QkhjT0sVIVSeSD1PkQCkx72JDqiNvEHTZq9iyHZz5xUKEQiuhQT4QlFgP
         m5exsLPvtRGuNGPhAhQCSA66Y104waZIPC85ISb4qlbCZQlLbgKAj7YaCrPqn9ki1vFU
         HkAqj5JX0hdPEO5R0IU/XFP+Z7CGHWVqfxap9kYtwIZXhKSjsi2llrFASdw8juriCUYe
         FCzTp893AWIrvPT8XtpQB8hdbfz5OZkAuBF1hHdx2gKhSCWbtzCY5++mcqRh7QzYlVeH
         uUlWRdR0oRmvbpiQah1sVVYE5xwYbf8VPXTily6BeIk8qnqOp8YRMwsBfXNoIPRc9G4K
         lHQg==
X-Gm-Message-State: AC+VfDzNfTptGIhxHY5AuIvk7sB/1P9JbH931GaSOY9PfzITI8nflSZo
        +9LlfsaFhj1AMXNl/wucPTDoDA==
X-Google-Smtp-Source: ACHHUZ6FBBh+TYL3Qj4k12t8psjYlzNX4e+y/EFOteibMR3kVjbmUNjmRNVXbUTH3uIjFA91gixbJA==
X-Received: by 2002:a2e:3a04:0:b0:2b0:790e:95ab with SMTP id h4-20020a2e3a04000000b002b0790e95abmr679359lja.31.1685449855058;
        Tue, 30 May 2023 05:30:55 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id u18-20020a2e91d2000000b002a8b8baf542sm2854814ljg.126.2023.05.30.05.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 05:30:54 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 30 May 2023 14:30:45 +0200
Subject: [PATCH v4 11/17] media: venus: hfi_venus: Sanitize
 venus_cpu_idle_and_pc_ready() per-VPU-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v4-11-feebb2f6e9b8@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685449837; l=913;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=dir0ijhcjSzkrYz9ZlGYapAdRHdLVbJO06zeci6np7c=;
 b=wmAExUeiOkcUBkOn2uQmzgB+NkMlejP+e/YYR69HkfqIy+ssD9bcow7EML253GozmhgB2BqGf
 f8sqybGMqZHC61+jX+8T9TL0s7i5+cweIwY77aIPQjuGHbOHaNtEMAr
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
index b5d7aab03bca..82854553f99e 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1536,7 +1536,7 @@ static bool venus_cpu_idle_and_pc_ready(struct venus_hfi_device *hdev)
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	u32 ctrl_status, cpu_status;
 
-	if (IS_V6(hdev->core))
+	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
 		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
 	else
 		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);

-- 
2.40.1

