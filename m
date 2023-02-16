Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B01F69973A
	for <lists+linux-media@lfdr.de>; Thu, 16 Feb 2023 15:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbjBPOWh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Feb 2023 09:22:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbjBPOWd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Feb 2023 09:22:33 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9EA4DBF7
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 06:22:16 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id v11so953597edx.12
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 06:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DQF5KVG5EevX5bBo+bwgTJ+ckvV/pCVSvA1eWE2YXI=;
        b=b0+skQWrrjMbgYnwkSk0SYAhiArmMQ68ZeUgESI6NchuIoyf8Ky1vPgP64jI9cqNV+
         5GRlXmVokcrVpzlRwyfvNCIG0jNDhYUPlK+plJ/DyAQGL3YmPPDrWSXu52MlVz+pzyOw
         Zzm9gauD1jzjmVNG9gARQ8shd2fGIcVlzFZUwBisuFzRHujMCARbOG18giadh99NcUaR
         s0PZUZZnU1LTxUrNfuP9+am3u1tDwXl+u4AhkEBp6O6iLA4XdW8N6pp17sHf2Q0uoeht
         l0L5PXWgBlOe0SI2Q8K2xf58E7A7McWZa3vnN+F8f8l3kWAAMrtuL2w0WywPLHpHJaGX
         oNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7DQF5KVG5EevX5bBo+bwgTJ+ckvV/pCVSvA1eWE2YXI=;
        b=MnKuZ6xTM+5zFIpYEBbLr5lWJo8MyJwAavCxWuhQWbg6IRZ7UoTnm5i1seocdNdE26
         UvJGrLNhWZ7b+s/FxDJ2Z2x2VGoZ2X2e7nhiwp+3c4/w4Cra3MeY2Wf+s6WP1becELl9
         0q2QU5tEoIrkzebTX4U1lVJi5hFvXj4EkuT6PPR3EgS/Fl5ZZDqiPXSe3r5RXvzt/Q9H
         lErvOjVyTtwio3r+ZFCA9BDWB3SEREv7w/JB1fKHGlfDRTS4TYtNy7qZPVT9BWRFsI9X
         aqZp1r3lFj6xyQr4D4TDJHuLTybOF5HBiORW/C10eQRNlbFx1mr6ikpEJ9mGkRduscYV
         7z2g==
X-Gm-Message-State: AO0yUKUm0pq/ol5biv4Y2LTTueNhnAouKO522f7yCiIe26d6pLqktMSS
        VT3O3qH+q5fZe9WFGg+TBYTZjw==
X-Google-Smtp-Source: AK7set/QP6Y0fn7yoiCX9gqQxrhhgab0mf0S38v54Z4oqY5gmhYkFGJBgJcyS0NawB78u0LxXVci/g==
X-Received: by 2002:a17:906:6c87:b0:7d3:c516:6ef4 with SMTP id s7-20020a1709066c8700b007d3c5166ef4mr7020883ejr.20.1676557335188;
        Thu, 16 Feb 2023 06:22:15 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ad24-20020a170907259800b0087bdac06a3bsm884757ejc.2.2023.02.16.06.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:22:14 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 4/7] media: dt-bindings: samsung,exynos4212-fimc-lite: convert to dtschema
Date:   Thu, 16 Feb 2023 15:22:01 +0100
Message-Id: <20230216142204.48394-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216142204.48394-1-krzysztof.kozlowski@linaro.org>
References: <20230216142204.48394-1-krzysztof.kozlowski@linaro.org>
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

Convert the Samsung Exynos SoC series camera host interface (FIMC-LITE)
bindings to DT schema.  Changes during conversion - adjust to existing
DTS and Linux driver: add iommus and power-domains.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v2:
1. Add Rb tag.
---
 .../bindings/media/exynos-fimc-lite.txt       | 16 -----
 .../media/samsung,exynos4212-fimc-lite.yaml   | 63 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 64 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/exynos-fimc-lite.txt
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-lite.yaml

diff --git a/Documentation/devicetree/bindings/media/exynos-fimc-lite.txt b/Documentation/devicetree/bindings/media/exynos-fimc-lite.txt
deleted file mode 100644
index 0bf6fb7fbeab..000000000000
--- a/Documentation/devicetree/bindings/media/exynos-fimc-lite.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Exynos4x12/Exynos5 SoC series camera host interface (FIMC-LITE)
-
-Required properties:
-
-- compatible	: should be one of:
-		  "samsung,exynos4212-fimc-lite" for Exynos4212/4412 SoCs,
-		  "samsung,exynos5250-fimc-lite" for Exynos5250 compatible
-		   devices;
-- reg		: physical base address and size of the device memory mapped
-		  registers;
-- interrupts	: should contain FIMC-LITE interrupt;
-- clocks	: FIMC LITE gate clock should be specified in this property.
-- clock-names	: should contain "flite" entry.
-
-Each FIMC device should have an alias in the aliases node, in the form of
-fimc-lite<n>, where <n> is an integer specifying the IP block instance.
diff --git a/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-lite.yaml b/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-lite.yaml
new file mode 100644
index 000000000000..f80eca0a4f41
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-lite.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/samsung,exynos4212-fimc-lite.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC series camera host interface (FIMC-LITE)
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+description:
+  Each FIMC device should have an alias in the aliases node, in the form of
+  fimc-lite<n>, where <n> is an integer specifying the IP block instance.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos4212-fimc-lite
+      - samsung,exynos5250-fimc-lite
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: flite
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos4.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    fimc-lite@12390000 {
+        compatible = "samsung,exynos4212-fimc-lite";
+        reg = <0x12390000 0x1000>;
+        clocks = <&isp_clock CLK_ISP_FIMC_LITE0>;
+        clock-names = "flite";
+        interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&pd_isp>;
+        iommus = <&sysmmu_fimc_lite0>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0882e304c8f9..2789c436c875 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18466,6 +18466,7 @@ L:	linux-media@vger.kernel.org
 S:	Supported
 Q:	https://patchwork.linuxtv.org/project/linux-media/list/
 F:	Documentation/devicetree/bindings/media/samsung,exynos4210-csis.yaml
+F:	Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-lite.yaml
 F:	drivers/media/platform/samsung/exynos4-is/
 
 SAMSUNG SOC CLOCK DRIVERS
-- 
2.34.1

