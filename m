Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87F777073C2
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 23:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbjEQVPE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 17:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbjEQVOw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 17:14:52 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50DF59EFF
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 14:14:43 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ac7f53ae44so13736481fa.2
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 14:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684358081; x=1686950081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGodNVX/frMkABBLHr47hHKAI4yOnNqADEGr8yuNWnc=;
        b=HilD8Z6Yn8MXx1FuSrj/gfL3Z2QlQ7NM05MZGgj+CHNjuUzXCbigE/ZtaU57VO9oFi
         9I0Gf5M8/8DnVfzrUf+/NUlBhTObJhIDTJqh3KFI7wF5ZgOnbw40WbLI5hXMfDc8dGUN
         6F7RPF4g5YeUbFilMkniHtDCJTY4iUlaJpd+oKTULXGZpJFO2ZHwJKdf0p0Y2o9iFnud
         J+srixZripfOyfj75nEbsAg/QxOyXwEZDtcDBAAY+d/Oek+ZNAeZ+awLYG4GiHbKiJJX
         SwFaTsdpbLrf8ss3wFALVPIFtHd9Chp3DU188UVW0lfgpOGILagi0P9ngYHSEaQDTbOl
         /Aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684358081; x=1686950081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGodNVX/frMkABBLHr47hHKAI4yOnNqADEGr8yuNWnc=;
        b=KAHzoLvKP9zusoohPJTQgTSk/Lp45O1UW5fx+2g63KqD48gPSFyIOFH+B3ClqJR9oO
         apNMrLckpGCh+dADtY78hhQ3pe/LBBVp6ycGWyFNkYsfrT41zC341Ad82zj2AHvWBR9d
         aVJyxJbZhlElQcxnb2B/nDx0zqw0Zng4XjlZkNLroOCQdktwHwJd8PqVTq+akgTAn1kz
         dZul8JZ7VOtvQq8q6DoHzk5DV0SWZ4SpXx66cU+VG1VM0p7tHHA6HaTIKeReWcLkb4j9
         yvfhmpp5NBYi8bS7Qop1rfstNtMnH8hQjqQ0SnNc7pdAYFIyD/3FZ8wixKQzvcqXccsI
         cUKA==
X-Gm-Message-State: AC+VfDwym384i4/8oR0w2uptYgpZX0QyDu6QlUK3GNm4xB8FJGSTim8i
        0pMnAqMIwQFHdLBcG1TRKciopQ==
X-Google-Smtp-Source: ACHHUZ4Pk7gv9/u3lGdJcdqYx3cDDJLUZRjzAiiB+N8Lbi0NEpOHL+DnmVQUi7y5k8kAuMPJ3mT0BA==
X-Received: by 2002:a2e:90ca:0:b0:2a7:f1e8:b08 with SMTP id o10-20020a2e90ca000000b002a7f1e80b08mr9439220ljg.19.1684358081314;
        Wed, 17 May 2023 14:14:41 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8345000000b002ac88e29049sm4781142ljh.43.2023.05.17.14.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 14:14:41 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 17 May 2023 23:14:23 +0200
Subject: [PATCH v3 10/17] media: venus: hfi_venus: Sanitize
 venus_cpu_and_video_core_idle() per-VPU-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v3-10-6092ae43b58f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684358064; l=915;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=7JZorB0pUApJvhWmRa0skblAX3OBAMRX8izC1hetESc=;
 b=bGbLMrqhUnj1TC2JbGm2E6a72BDHCzqWi7diiqThBzkw8Y3vPQ3eeUHJxDo5bclivNhQGqp82
 FowJwNNcqK5CXa97p/DP8DXQIs3IJ9ufutXfgg7d2HHhhZX2fHk2D4R
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
index 9665fdcfe8b2..2db5361cd5df 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1537,7 +1537,7 @@ static bool venus_cpu_and_video_core_idle(struct venus_hfi_device *hdev)
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	u32 ctrl_status, cpu_status;
 
-	if (IS_V6(hdev->core))
+	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
 		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
 	else
 		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);

-- 
2.40.1

