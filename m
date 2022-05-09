Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C939052003B
	for <lists+linux-media@lfdr.de>; Mon,  9 May 2022 16:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237630AbiEIOvZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 May 2022 10:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237674AbiEIOvW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 May 2022 10:51:22 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B32224BB27
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 07:47:27 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id g6so27315365ejw.1
        for <linux-media@vger.kernel.org>; Mon, 09 May 2022 07:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mjrvp1Hm7vOindUfGtrE7gurv1Xo3OI98bE9K/MwSFs=;
        b=GrpaA/8vdoQ0feSdPdXYv/uw6XfWC1FuzNh2IOeG7iyRn6cCulGzW/oyDovSCHjX4U
         lhH1h/GcPPy/XQKpdDjwZy71iS4HDrZYz1ft6hbApC2eUkFhFnSTVEHCvOY02CFx2DVB
         WIxptKgEp5wHXcmDflRJjL0jv3y3RbBO/FN+on09ULb7t45iDVrQBMhPJp9pQky7un1Y
         hHjupf/To+xpulFQVg7f5toTR2Inmkh8eykR3Q73l8NnZJHQhq2EecnNC8zLThUocm0E
         +gVOLicDKMEvQCeeoL+93JH0xPuXNVILC9ItVU7dImsqfU3HFoTFM778IAAcWaN/TueS
         65og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mjrvp1Hm7vOindUfGtrE7gurv1Xo3OI98bE9K/MwSFs=;
        b=qyT/v0UVfrA9HnOR5zLFKyMiIp96PCScNVaCOAm7mKUUzxJBfDqBv2IvFzYEJKZQdC
         kDmdA7gw9r16dT9Em9Q9QDNu6z5/KEbMWsU8NtTzCIHWnxUfnijMn7ftSI3CJxHznpxw
         oGh6Nbl75pL8Z5QKiDB+xAOGGTxg9leIFrJzKPf2gRb23IoBiUPevDyxsncsASCOjTsJ
         JYjctTMkf3z4H9YCdBVlESw9DNagEsIt4KfO0x1b0hpToZj5vv2/acAfpizu/GKvzUcV
         p6yc6B6A/DPbL3+v0v4dR2qCt9wPewn9sp6VSpmp9VvZUO6lOyfulqxRScQt6podfaWJ
         0Lwg==
X-Gm-Message-State: AOAM532albxvda7DMUHXI3/2A0/7PIbZ+bL7kDQoSghtYU+9R8N3gxtP
        W3y3qXZdmLoXM+hJGVGzRxE+nA==
X-Google-Smtp-Source: ABdhPJyV85p3CRvl/hPJcJeHo3iJvQ+mcdXiasUjKX53LqOQ9TCcXbuwVG86Cb92HrSh1QPu6SWsjA==
X-Received: by 2002:a17:907:1625:b0:6f4:55aa:4213 with SMTP id hb37-20020a170907162500b006f455aa4213mr15254274ejc.594.1652107645930;
        Mon, 09 May 2022 07:47:25 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u9-20020a05640207c900b0042617ba637bsm6451828edy.5.2022.05.09.07.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 07:47:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] arm64: dts: qcom: sdm630: order regs according to bindings
Date:   Mon,  9 May 2022 16:47:13 +0200
Message-Id: <20220509144714.144154-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220509144714.144154-1-krzysztof.kozlowski@linaro.org>
References: <20220509144714.144154-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CAMSS DTSI device node, which came after the bindings were merged,
got the regs ordered differently then specified in the bindings:

  sdm636-sony-xperia-ganges-mermaid.dtb: camss@ca00000: reg-names:0: 'csi_clk_mux' was expected

Reordering them to match bindings should not cause ABI issues, because
the driver relies on names, not ordering.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 8f623238c238..594a802e9429 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1842,32 +1842,32 @@ pil-reloc@94c {
 
 		camss: camss@ca00000 {
 			compatible = "qcom,sdm660-camss";
-			reg = <0x0c824000 0x1000>,
+			reg = <0x0ca00020 0x10>,
+			      <0x0ca30000 0x100>,
+			      <0x0ca30400 0x100>,
+			      <0x0ca30800 0x100>,
+			      <0x0ca30c00 0x100>,
+			      <0x0c824000 0x1000>,
 			      <0x0ca00120 0x4>,
 			      <0x0c825000 0x1000>,
 			      <0x0ca00124 0x4>,
 			      <0x0c826000 0x1000>,
 			      <0x0ca00128 0x4>,
-			      <0x0ca30000 0x100>,
-			      <0x0ca30400 0x100>,
-			      <0x0ca30800 0x100>,
-			      <0x0ca30c00 0x100>,
 			      <0x0ca31000 0x500>,
-			      <0x0ca00020 0x10>,
 			      <0x0ca10000 0x1000>,
 			      <0x0ca14000 0x1000>;
-			reg-names = "csiphy0",
+			reg-names = "csi_clk_mux",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid3",
+				    "csiphy0",
 				    "csiphy0_clk_mux",
 				    "csiphy1",
 				    "csiphy1_clk_mux",
 				    "csiphy2",
 				    "csiphy2_clk_mux",
-				    "csid0",
-				    "csid1",
-				    "csid2",
-				    "csid3",
 				    "ispif",
-				    "csi_clk_mux",
 				    "vfe0",
 				    "vfe1";
 			interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
-- 
2.32.0

