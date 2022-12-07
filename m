Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF636457A1
	for <lists+linux-media@lfdr.de>; Wed,  7 Dec 2022 11:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbiLGKXS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Dec 2022 05:23:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbiLGKXC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Dec 2022 05:23:02 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0827C1571A
        for <linux-media@vger.kernel.org>; Wed,  7 Dec 2022 02:23:00 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id f16so8699862ljc.8
        for <linux-media@vger.kernel.org>; Wed, 07 Dec 2022 02:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AxgtdSHYHP1YbbzJqlPfT18aEYuRk09InbeSd0JHNg=;
        b=tOruhaPzNOR3bQD/ouWBj+2tp/tUN/H/5pGNgjSe2ABiV3vA61PRSLsVlqeAvI3Oro
         vHe3xvQC6FSO988F88LJTaSEr7beyBCC0Xr5mjSQNDZchgwGX/zzIK/HzVUFQm9VSFme
         1SwIrYDkMGRN9sZr262zvK3Rqvw0K0UZRe3qgHO2FEKAoLEeQbmgdeRgDgkeB2V1Z9KU
         ymxi4wc9pFKvlNmuXwlViGvq4nf0puoGFSzB+NSl2FGkbWnZ1skK7Dng2cwxys79bQBL
         B2o3FQDAN5bNXMdZu277dHREbYgTFCPcottzQGS2KMyJNymjfRP+abAi8h8GpG1+lETO
         jymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AxgtdSHYHP1YbbzJqlPfT18aEYuRk09InbeSd0JHNg=;
        b=oqQ+gVxmPhpRjObJDeHokTbLAYcmECn0nyhY/zmPQfpxFITlOTIenNs1Sa2f6tTA61
         bJUzq5NtE6Q9a5xZafvHoWfxw1++wrYKD3W2/atAtNPxpLUtO/10hfUByJLZg79jEma4
         348oXiq+u4v8rxXchuYh3ZUsrXD2EqRQMgZ8igFt0RVUFoWWKtNGguluRvDlIlKiBmkA
         THVG59/SaVckUfgAOUMcc6SIQj40XtvkNJd9jpgzkMG8IJz7IAS/mHn0pGG0Z4WDgdBT
         Amjtlt0NCnY48apQKaoJnVvZRBCqfn1LW33EefQOQG/1dzp3LzF60EF6YyuYyPsoy8cE
         C70Q==
X-Gm-Message-State: ANoB5pksQhO1Go1Y+KERU88Zi0AUW8QBwcu02/J3cs4w3u5gCJ7yq/Gq
        0EkEmolz3gvvQxflL5KC5aKCfQ==
X-Google-Smtp-Source: AA0mqf77/+pUWb1Bn4v6zLGZhuX5q4wF2Fzv0XKIu9nI2Iw4J7TFxfO02J2gesAVCe0NSJikkfILHA==
X-Received: by 2002:a2e:87d5:0:b0:27a:1ce7:bbcb with SMTP id v21-20020a2e87d5000000b0027a1ce7bbcbmr369003ljj.420.1670408578398;
        Wed, 07 Dec 2022 02:22:58 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bu31-20020a056512169f00b00499b27a329esm1953183lfb.300.2022.12.07.02.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 02:22:58 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Joe Tessler <jrt@google.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/9] media: dt-bindings: amlogic,meson-gx-ao-cec: move to cec subfolder
Date:   Wed,  7 Dec 2022 11:22:45 +0100
Message-Id: <20221207102253.26663-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
References: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
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

Move amlogic,meson-gx-ao-cec.yaml bindings to cec subfolder and drop
unneeded quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml     | 4 ++--
 MAINTAINERS                                                   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml (93%)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
similarity index 93%
rename from Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
rename to Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
index 8d844f4312d1..f65c9681a9f7 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 BayLibre, SAS
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/media/amlogic,meson-gx-ao-cec.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/media/cec/amlogic,meson-gx-ao-cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Meson AO-CEC Controller
 
diff --git a/MAINTAINERS b/MAINTAINERS
index e3f3c3e53f77..07cb85cac4c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13553,7 +13553,7 @@ L:	linux-amlogic@lists.infradead.org
 S:	Supported
 W:	http://linux-meson.com/
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
+F:	Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
 F:	drivers/media/cec/platform/meson/ao-cec-g12a.c
 F:	drivers/media/cec/platform/meson/ao-cec.c
 
-- 
2.34.1

