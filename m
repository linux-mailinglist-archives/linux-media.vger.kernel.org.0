Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE42520046
	for <lists+linux-media@lfdr.de>; Mon,  9 May 2022 16:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237697AbiEIOv0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 May 2022 10:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237710AbiEIOvW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 May 2022 10:51:22 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F0C424BB29
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 07:47:28 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id n10so27307525ejk.5
        for <linux-media@vger.kernel.org>; Mon, 09 May 2022 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YReIlo2SA3OXXKOlZqVzpBGAEFmTXwOCuNhJW0SaYWY=;
        b=y0ykTPwUXzT2B12UESk2c0mNSFQvN19HIPC41BgWOWm9eApr1uFuPMRCsUTLEs11CI
         muoGtMrqLjqf5PFE0+nt1zB/vVkfRloOupyM7xusCrQWJi+ynB9xH2wA6Wvsmpm0+PLg
         nsBUUB+OA7phZqFyQEUOieLzoNavymWASJaVSaveRwZGAwERjslwj6Z+qc62VqsVnr84
         Nx3wJJs9GBiHVjxLFT+vk05g48a+flBS/lMy/MNEJK86ZAS0I961yNQglucmXV1YNix1
         bggkMitanpVmRFCJ1KAg9t2SU7fCqKhhqzIFzqtA7+H5v9sHkRMN+pm2RwjSGlj++0O5
         8zMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YReIlo2SA3OXXKOlZqVzpBGAEFmTXwOCuNhJW0SaYWY=;
        b=U3dcDuRLtB6my77q78RncQxIcuHf+INZ0h4N8TiIa4Ym5TPQbXcO8ke91rXLkL0h5H
         hxG0+cVAuH+nhrj1M1mRrwAtthpPl5BDEX1caRLPChNckArPFsmElFCjF2466Nee8RZ+
         VPHIORbBM52ajAjOmJQYbUWH9BAGtTT/MK5wWviziub0P5MW2U+JlITNDBm8RJNhN9Z6
         GWqpOLHr07k7CT2/3O2pYCFY5UHLLfFdyskzqs7rB01J9cO0y5Xd+/fcDqyJkyEPSbBM
         B/EfwaFEn5kcp7WnniXb3YuEdNyaY4Sf0rsPAN6EHRlznRdS2sq1OduPuXAU7cS+vPX7
         gpCA==
X-Gm-Message-State: AOAM531pF7+BtK4UzNcD0LW4aADZ5HFAsUdWG06nQ+gzBdeIAAqDlODG
        X5KjHZxvvOEVY+Q5tHfKuolFnA==
X-Google-Smtp-Source: ABdhPJwUe+Mhortp2BoeLfOz+JnBpHFhsaIHaA71zlpV1VUi6ZcfHMF4GT0uGgC1stNA9o4EZpyHQw==
X-Received: by 2002:a17:906:ece3:b0:6f3:da10:138a with SMTP id qt3-20020a170906ece300b006f3da10138amr15043405ejb.438.1652107646916;
        Mon, 09 May 2022 07:47:26 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u9-20020a05640207c900b0042617ba637bsm6451828edy.5.2022.05.09.07.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 07:47:26 -0700 (PDT)
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
Subject: [PATCH 4/4] arm64: dts: qcom: sdm630: order interrupts according to bindings
Date:   Mon,  9 May 2022 16:47:14 +0200
Message-Id: <20220509144714.144154-4-krzysztof.kozlowski@linaro.org>
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
got the interrupts ordered differently then specified in the bindings:

  sdm630-sony-xperia-nile-pioneer.dtb: camss@ca00000: interrupt-names:0: 'csid0' was expected

Reordering them to match bindings should not cause ABI issues, because
the driver relies on names, not ordering.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 594a802e9429..2c540476a8be 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1870,23 +1870,23 @@ camss: camss@ca00000 {
 				    "ispif",
 				    "vfe0",
 				    "vfe1";
-			interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 80 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 296 IRQ_TYPE_EDGE_RISING>,
+			interrupts = <GIC_SPI 296 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 297 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 298 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 299 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 80 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 314 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 315 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "csiphy0",
-					  "csiphy1",
-					  "csiphy2",
-					  "csid0",
+			interrupt-names = "csid0",
 					  "csid1",
 					  "csid2",
 					  "csid3",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
 					  "ispif",
 					  "vfe0",
 					  "vfe1";
-- 
2.32.0

