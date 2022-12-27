Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 508AB656C13
	for <lists+linux-media@lfdr.de>; Tue, 27 Dec 2022 15:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbiL0OlY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Dec 2022 09:41:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232059AbiL0OlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Dec 2022 09:41:14 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C98AB5D
        for <linux-media@vger.kernel.org>; Tue, 27 Dec 2022 06:41:12 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id g13so19846937lfv.7
        for <linux-media@vger.kernel.org>; Tue, 27 Dec 2022 06:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMIPCZBPAJbPHdaYpEb21ij1Gr+2U7vISZ96ujzhb+k=;
        b=oCaSA6KYm6+JS+1myWLbkwehYAAnDeWFRSaV7ofI0q/1Z3HkjwuWSAZxgSbZXPbsrM
         /zZmrjMd4MJ/lPJnL2pGHyUtJwv92+EU9sbj7Vw5TwYi0DA0wS+tZ+jWKYZPBiCaHrK1
         kiTflcxJMc1K+r5zP1IgIdvQDZRmUj4qtGlWkEx/TGp7R8wqaAQPaUrY0UP/gnLQr0Co
         5Lwy3DO82tW5I5obxe5GkQomTSAwgcWn8jwNfIsvh/8p5dw9xqMUYyVyc+87k751gRSl
         Vpg262j9l/J6FeCaB9KOpHVUpPDCpMMmVj/75l0QkAxpu0cahqcuncnNuYZkymaHFKQa
         lqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMIPCZBPAJbPHdaYpEb21ij1Gr+2U7vISZ96ujzhb+k=;
        b=6Ci8X2WG7VBhuTjQn+QNmV/fU5ttHrxAIcRSM2OWp4fzmALSzaaNd4ZNRuwJPhaNdO
         oUKAGTZhLauK4GxPXFedIBMuri6SNQ09vGAzGSXX9eL3a/d3b/0w60mLUnOqjC1idV+b
         smE2JxQ/q16Q+Dbcv4/va4peWNb2cO3D3aL8AV5Kq0w2cNLodu9hGVHeUTXEU2mFURYD
         4nnOaC2zS78vQzu2ea+iNRMCGmpderWBjuw8UMa0NHGv5lLGvWZWCuDM1ZZ/W/7F9lj0
         xHADPhY8If3wz6M6nyq/zTvBeMPstaw9ZHqYB49lu6tKu9HUUPMJFJeDWGv2+hI1Xce2
         4lYQ==
X-Gm-Message-State: AFqh2krXBQXyiCxo4dGGtoaYI1Z4DXv3gkgJpbSQ/Z6ftUaf2AE1nZQC
        cPqU2ZsM/NiEHLBvqUKfzG2Unw==
X-Google-Smtp-Source: AMrXdXt2G8Ihf6hCznyK4FUCSE7a+knTpxPTLZ7awITRGTKz2jzurvRbMpte+o+o30OGjISL89pC4w==
X-Received: by 2002:a05:6512:b90:b0:4a4:68b7:d63e with SMTP id b16-20020a0565120b9000b004a468b7d63emr6975859lfv.37.1672152070456;
        Tue, 27 Dec 2022 06:41:10 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s1-20020a056512214100b004b5853f0fc6sm2261126lfr.246.2022.12.27.06.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 06:41:10 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 6/8] media: dt-bindings: qcom,sdm845-venus-v2: document OPP table
Date:   Tue, 27 Dec 2022 15:41:00 +0100
Message-Id: <20221227144102.79391-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221227144102.79391-1-krzysztof.kozlowski@linaro.org>
References: <20221227144102.79391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Venus on Qualcomm SDM845 uses Operating Performance Points (in Linux driver).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/qcom,sdm845-venus-v2.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
index 0840ad0f642b..d5f80976f4cf 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
@@ -48,6 +48,10 @@ properties:
   iommus:
     maxItems: 2
 
+  operating-points-v2: true
+  opp-table:
+    type: object
+
   video-core0:
     type: object
 
-- 
2.34.1

