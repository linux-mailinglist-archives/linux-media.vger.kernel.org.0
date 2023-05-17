Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBC17073BA
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 23:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjEQVOz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 17:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbjEQVOm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 17:14:42 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B6688A6C
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 14:14:40 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ac8cc8829fso13409151fa.3
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 14:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684358078; x=1686950078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8al+fUYTJ6+PEz9NPDS7tqKtmY4QMGdOMScxyZdTNw=;
        b=x+Gfsd4ueg48vKx4TnKfLz/AwaIQz+3WaLfB0edEvFCJ6KjZp3mBk1PYpn0V4D9N0P
         XSVFtaEUsWL5fVkVJNFtt45wV5RsC1gHw90WwlVom79QDp3uJC5tqPlqUYdMDrmIy352
         8mRaq6f44b4qhrq7GzjNCb6r0UzNZtHQ55eqSByQpcwKxkCxyYVp799MJa+FRXSr3cr1
         zptJcnPDST4SusUTrzwyQ7uhBJjyST+Uaj0+vfPt0tp8Z4Et14Keb+AP57TVi8lH133c
         Bu0insZJ9lSSEctWwwQPrBykVhpCXJhor/iJH/AyV2OoxME9vOP1qmNaW1JOU3ymABQV
         uXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684358078; x=1686950078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8al+fUYTJ6+PEz9NPDS7tqKtmY4QMGdOMScxyZdTNw=;
        b=jhwwIJGT8KaLjKD/PS1mi9WlTSIsbnwTkAOn/KK7iWkEX6EB4SaURQF9a00mguMTm0
         mg33/IWcgQcQvBvor/77zqWOueenyhkY/khReWmhCZ7xoAZ9EUr5QXISI23BWwIrQs2C
         MtISMgB4k9ndZV8YCP0wUrPfElQEUd+2Z47m3KEHlG4Bk+Vou/n4bucirEybUsussjLB
         12XqJV99N9XmcR5j8YD0WSOPiZOZNN69N9e+peswWUHyYJzklYtpnhbRYvJFAeimqIlr
         gOBPJqJxut/jlJ0DAmZwRCcSTj1F255hOXDXNLKpCT08qFOvaRE/sDVFwVSFgKxErCxx
         ZfIQ==
X-Gm-Message-State: AC+VfDy5eaa7bPmZfmFq5PhYXsZmfudq8yB+C/MxVM1Bd/Q2FSyKBEIY
        KmW+anyu0f9B6R+E2TGcgiht+w==
X-Google-Smtp-Source: ACHHUZ4KD/Q/7xNrqQNz+v+qn4QbB81qLid14El4RbQB4wuevWByR/m1DU3ejSst4j+sKyUF1aZh5Q==
X-Received: by 2002:a05:651c:1045:b0:2aa:40dd:7a55 with SMTP id x5-20020a05651c104500b002aa40dd7a55mr10338038ljm.8.1684358078270;
        Wed, 17 May 2023 14:14:38 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8345000000b002ac88e29049sm4781142ljh.43.2023.05.17.14.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 14:14:37 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 17 May 2023 23:14:21 +0200
Subject: [PATCH v3 08/17] media: venus: hfi_venus: Sanitize
 venus_halt_axi() per-VPU-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v3-8-6092ae43b58f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684358064; l=1056;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Ec1MN/ZRnQHIQIjMUfVoLM7+Of/DpbtvAPWcmBv7Ia8=;
 b=4d0CN7DjxeqmKugz1Y1UNz7adTZVr0CiA2yKMw2Fwg3Zt0sjASvd+QBwHLV5vbO0pG6ZUs1I6
 Iwx0TvUt7cxApg5sSzXI4HW9fXzi93t7NY8PPAaA+veK0KpN4z1kMjz
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

Only IRIS2(_1) should enter the until-now-IS_V6() path and IRIS2_1
can be used instead of openly checking the number of VPP pipes.

Use VPU version comparison in both of these cases instead.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 5af24e98caf0..9082a2def687 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -549,10 +549,10 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
 	u32 mask_val;
 	int ret;
 
-	if (IS_V6(hdev->core)) {
+	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
 		writel(0x3, cpu_cs_base + CPU_CS_X2RPMH_V6);
 
-		if (hdev->core->res->num_vpp_pipes == 1)
+		if (IS_IRIS2_1(hdev->core))
 			goto skip_aon_mvp_noc;
 
 		writel(0x1, aon_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);

-- 
2.40.1

