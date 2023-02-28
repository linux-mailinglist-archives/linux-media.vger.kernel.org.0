Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF706A5BCC
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 16:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbjB1PZs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 10:25:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbjB1PZZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 10:25:25 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D964311ED
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 07:24:58 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bi9so13731047lfb.2
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 07:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677597898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJjwnbg62VoIV+g3wGZJB6SG8RdF3Rb2KodyCGNCoVc=;
        b=cJfVw7oQOlKU4uqeWqmtJ5mDnND5Gv9eSCxPp0BsF5PoDjIjVMRJC2MxwQZSXgymI+
         dKLGvLOpWWq4rCY3ksf51uDjqPHyOYKZNMboWomL8t2gFZ0MvoEbesMBgzGD+NdkH+oI
         VQRyH6H7pU4aMb6H28lg6dlXhaRsDe67xkrJln6CAfm3PfR45iygkKA8oX6mAg595wva
         cLYBFWDgstzW3PAsHNuoIE86yox1/pB8lbGe7kyYsq3x1OM/6TJyAtBfy+yJpjtapSxZ
         aGEHL9VQu+EUnf37xz86UOrIfT8zpzS1TdbtytWkc25YUL7zsW52odFjqO9qZhFpd7dk
         dLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677597898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJjwnbg62VoIV+g3wGZJB6SG8RdF3Rb2KodyCGNCoVc=;
        b=sm47Y2VQ1AAEWrmmMHwQbkrvEUke5j4k3wPfZ+iqLWt3rCblETpsYvdaVB3Mq+N/Xh
         94LaB9PXrSldeg0lZRMUgDt5CIKlhiuUkxYhUszvsZDZDEOWrioJEbe+M0EIujRg82XV
         Rhs+85H4EkPKzazDhvztr7kH+p/6XEEwB7VcCIXsSZ62pU4dBM5Wcv7wKogVPcen0BUK
         RC2he76cvDXq7WjYwB1mUSanSMg5hTdrY34jO+bDBXeW2EHEjLtTIJVuKgsE1kXiByAm
         fAACSPF9417xQzUPPWfLZd6E+eiMY3ZexUzuBBcoOvw8bACvgxR64Fc9E+DfuzCJPWxK
         HMOw==
X-Gm-Message-State: AO0yUKWHwyZxq4AXvJGOTG5N4bBaZwCcLmFwoZZiQbsNQBOyuNUJiIqq
        HkwqNG0twL9h8lODS5PaBRb9Iw==
X-Google-Smtp-Source: AK7set8UYDVFnY2+lyiFY7qPi22KfVMPxTjtT30Ki4wGunWOCQOsWO3ZMXvyYbHOlXkTCUkSAm0Hzg==
X-Received: by 2002:ac2:5495:0:b0:4db:3ddf:2fc5 with SMTP id t21-20020ac25495000000b004db3ddf2fc5mr750310lfk.26.1677597898068;
        Tue, 28 Feb 2023 07:24:58 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id h17-20020ac250d1000000b004db3aa3c542sm1363688lfm.47.2023.02.28.07.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 07:24:57 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 28 Feb 2023 16:24:39 +0100
Subject: [PATCH 15/18] media: venus: Remap bufreq fields on HFI6XX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v1-15-58c2c88384e9@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677597872; l=1320;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Ipj+E/2GvopXMeiZXXenFNo3rbuaiPJoqniqEV4u6f4=;
 b=yYpFAHD9FEt/i9ifsU+1GvHIR8MWYsRt5J4PXpoTTHuH+fNa/f/UmbQduZ8iuroDwnbr9T8jzEte
 F9wZPOoRA4hpSNdmzRjSj7VBvuKLMUjW+xb+rmSqKHWb2KihgCFb
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

Similarly to HFI4XX, the fields are remapped on 6XX as well. Fix it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index d2d6719a2ba4..8d683a6e07af 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -1152,11 +1152,14 @@ struct hfi_buffer_display_hold_count_actual {
 
 /* HFI 4XX reorder the fields, use these macros */
 #define HFI_BUFREQ_HOLD_COUNT(bufreq, ver)	\
-	((ver) == HFI_VERSION_4XX ? 0 : (bufreq)->hold_count)
+	((ver) == HFI_VERSION_4XX || (ver) == HFI_VERSION_6XX \
+	? 0 : (bufreq)->hold_count)
 #define HFI_BUFREQ_COUNT_MIN(bufreq, ver)	\
-	((ver) == HFI_VERSION_4XX ? (bufreq)->hold_count : (bufreq)->count_min)
+	((ver) == HFI_VERSION_4XX || (ver) == HFI_VERSION_6XX \
+	? (bufreq)->hold_count : (bufreq)->count_min)
 #define HFI_BUFREQ_COUNT_MIN_HOST(bufreq, ver)	\
-	((ver) == HFI_VERSION_4XX ? (bufreq)->count_min : 0)
+	((ver) == HFI_VERSION_4XX || (ver) == HFI_VERSION_6XX \
+	? (bufreq)->count_min : 0)
 
 struct hfi_buffer_requirements {
 	u32 type;

-- 
2.39.2

