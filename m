Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 561B8693158
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 14:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjBKNrn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 08:47:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjBKNrm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 08:47:42 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC5A2887A
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 05:47:41 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so8172353wmb.2
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 05:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNw2mod3gWtSxV8TGsOP4LskTXsTrjJuzsHKbwxb+uQ=;
        b=nP3MfXPXwSqRwAc+vIoE2dSrs3YZ1+8AUIZ7cWGqUlkZQYvs4YZTUnE07Pqco2oitB
         5yJURMsKyg4E7dRCx5QE3tQlVBIfX/k5nDmJeG7IKdq43V+VVWPUMJ/UW/9DScUvv55q
         5JwV51ALM8h+LjRngFHzhzi9alXxQ3kImHPYQ1/oNq4Gel5Fz3OnHipp/GVJZW1epSEr
         57Yt+O2hmgDbdHHGK6rquu5VmuMDr4eIpE6edCVROC4rIzEppanXF1twx5u+ppqAIrj1
         y0QU2v+uQCx8EeE7sjizYEjvPtxN0tEtlw57b2hbml5fO8CQ8HTQzrGM+LcL4vDq6L3u
         R/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNw2mod3gWtSxV8TGsOP4LskTXsTrjJuzsHKbwxb+uQ=;
        b=lbIUFJn21hZ/nSVemv6SnlbB8SS55CgPduhcxEKnjhcWHxgUbw2JwrCbVsaB+ZDRQS
         3GvBvASoTrmsKAIcuSIdfaFGaA5fy75M+/ID70E7e/GsForXBHRETglAEL+bw0aqMLWe
         ml7UXJjJQzx0z5+s/jLVA04gMEK8gRWzT6V8WdY4y2g5NJQARk4J9SzNNt5QgKS2ozOv
         +SDTSNC6tjBcUBlrLOdu//jWaXsZWdrLkqH+b/PXmFVdP9QEXXo2YVzDrM69dTK3WwVs
         3C5gtRu45S/0aaxaEmO7AvBoWhom2LNmizCAo+epKIMIsMs7lShjOIlqwl/EGex1GN80
         Wjig==
X-Gm-Message-State: AO0yUKVwpEDjH3cwzIceyYACHt3XGMUhxe1bfupzsxauKltzjr+pXaGu
        fGmXSkspq8+soJrN9+LbvYaAkA==
X-Google-Smtp-Source: AK7set/gA9F4rO7vw/m35L3ozxDwFR/WyvdGiXfXG/ffB/dutI9OO7WFUkGppG57qHHxnFT0lbrWOg==
X-Received: by 2002:a05:600c:3d98:b0:3e1:e149:b67b with SMTP id bi24-20020a05600c3d9800b003e1e149b67bmr1213952wmb.18.1676123259672;
        Sat, 11 Feb 2023 05:47:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y9-20020adfee09000000b002c550eb062fsm1118055wrn.14.2023.02.11.05.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 05:47:39 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] ARM: dts: exynos: drop unused samsung,camclk-out property in Midas
Date:   Sat, 11 Feb 2023 14:47:31 +0100
Message-Id: <20230211134731.85957-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230211134731.85957-1-krzysztof.kozlowski@linaro.org>
References: <20230211134731.85957-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The S5K6A3 camera sensor does not use nor allow samsung,camclk-out
property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-midas.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index 525f945c4b91..763bd3441c5b 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -592,7 +592,6 @@ image-sensor@10 {
 		/* CAM_B_CLKOUT */
 		clocks = <&camera 1>;
 		clock-names = "extclk";
-		samsung,camclk-out = <1>;
 		gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
 
 		port {
-- 
2.34.1

