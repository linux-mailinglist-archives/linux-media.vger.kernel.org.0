Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6DC55B2D1
	for <lists+linux-media@lfdr.de>; Sun, 26 Jun 2022 18:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbiFZQdJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jun 2022 12:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiFZQdH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jun 2022 12:33:07 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEBD360C1
        for <linux-media@vger.kernel.org>; Sun, 26 Jun 2022 09:33:04 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id u15so14317673ejc.10
        for <linux-media@vger.kernel.org>; Sun, 26 Jun 2022 09:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hB1/nxGV8qsZiY8aZhrRp6a1Tsyj5sJFWV1lzltoTWk=;
        b=OacIlK6GSGCwnH8lqTDMoLwxuj0g69SiZ+/ofQzy7s8mF0vGtBWxV1bVhwZF6Xt60A
         rfjMf4BjBXKrujw+O8QWesWK0batSE4JfAGdBS/Dd3vGwOtIPSLYH0SIFkuj5IbkkHVh
         eWwv1qi96RBKPfn9bx+lWNbwofn9yaVGpAqnh4+lVud7dd8aBb6R6w1lhK3IHrWGCyMk
         FjU2twV10er2KtPl0gSfS/D/fOcTuhp1Uw6aJZCn3ZRdSXaIH/bsBcGGba4UvMjf7Che
         IKxPG0IDynyvheD8pp44x3LAD5jXOFqvUQGM5svGEf6kPpe8EYpnNxOTl/jM59wE0Upo
         +9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hB1/nxGV8qsZiY8aZhrRp6a1Tsyj5sJFWV1lzltoTWk=;
        b=YIvR3zDVEubl3PQblWsIBj3c54AKkoFwZHuc8oU9XGRUCmFRhZ9BuIPII246nDLsyA
         9gWp1i+3NEmYMfT5wEkQaVO9O+zVRvaCpjbmSBfiLSwymUw/FNmp/35jorCltTlL46NW
         g7JwfjzDzFO68+bPlI39xnAPfS+oLjaTtkaoewHbYckBOi0BqNDWVh+3vyPrMc07224i
         3/4VCie5f0YJsTuiFs3Pf5AwkGfbA2PRIRjilZMoDwZZdZyXLIzjgyq7D1CqXAQO+xGK
         ak3Tw+vZXtBdFf0iVgUS6FnY2IrAyzGxzz0uMdDN2+2Bq6gPEixe8sYcpi7XJpMvu64q
         vK6A==
X-Gm-Message-State: AJIora9vBaTlP8r4uBUs813yUBpDCtBzscBfJCXIz7bRxJCp5F8PdoBA
        ZOiEUhNNwt1wPu1ShIyB/ZJCdQ==
X-Google-Smtp-Source: AGRyM1uzDIyih5ar9W3rE94lRN0L8WXSa5mqvZd9HRog//U5hNVHbIyQECpwBSHMCeGshA6Ir+wovA==
X-Received: by 2002:a17:907:8a01:b0:726:2c8e:4cad with SMTP id sc1-20020a1709078a0100b007262c8e4cadmr8513580ejc.611.1656261183403;
        Sun, 26 Jun 2022 09:33:03 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h7-20020a1709070b0700b00711d8696de9sm3913361ejl.70.2022.06.26.09.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 09:33:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: media: samsung,exynos5250-gsc: convert to dtschema
Date:   Sun, 26 Jun 2022 18:33:00 +0200
Message-Id: <20220626163300.6271-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the Samsung Exynos SoC G-Scaler bindings to DT schema.

Changes done during conversion:
1. A typical (already used) properties like clocks, iommus and
   power-domains.
2. Require clocks, because they are essential for the block to operate.
3. Describe the differences in clocks between the Exynos5250/5420 and
   the Exynos5433 G-Scalers.  This includes the fifth Exynos5433 clock
   "gsd" (GSCL Smart Deck) which was added to the DTS, but not to the
   bindings and Linux driver.  Similarly to Exynos5433 DECON change [1],
   the clock should be used.

[1] https://lore.kernel.org/all/6270db2d-667d-8d6f-9289-be92da486c25@samsung.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Remove Joonyoung Shim from maintainers (emails bounce).
---
 .../devicetree/bindings/media/exynos5-gsc.txt |  38 ------
 .../media/samsung,exynos5250-gsc.yaml         | 109 ++++++++++++++++++
 2 files changed, 109 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/exynos5-gsc.txt
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml

diff --git a/Documentation/devicetree/bindings/media/exynos5-gsc.txt b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
deleted file mode 100644
index 1872688fa408..000000000000
--- a/Documentation/devicetree/bindings/media/exynos5-gsc.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-* Samsung Exynos5 G-Scaler device
-
-G-Scaler is used for scaling and color space conversion on Exynos5 SoCs.
-
-Required properties:
-- compatible: should be one of
-	      "samsung,exynos5250-gsc"
-	      "samsung,exynos5420-gsc"
-	      "samsung,exynos5433-gsc"
-	      "samsung,exynos5-gsc" (deprecated)
-- reg: should contain G-Scaler physical address location and length.
-- interrupts: should contain G-Scaler interrupt number
-
-Optional properties:
-- samsung,sysreg: handle to syscon used to control the system registers to
-  set writeback input and destination
-
-Example:
-
-gsc_0:  gsc@13e00000 {
-	compatible = "samsung,exynos5250-gsc";
-	reg = <0x13e00000 0x1000>;
-	interrupts = <0 85 0>;
-};
-
-Aliases:
-Each G-Scaler node should have a numbered alias in the aliases node,
-in the form of gscN, N = 0...3. G-Scaler driver uses these aliases
-to retrieve the device IDs using "of_alias_get_id()" call.
-
-Example:
-
-aliases {
-	gsc0 =&gsc_0;
-	gsc1 =&gsc_1;
-	gsc2 =&gsc_2;
-	gsc3 =&gsc_3;
-};
diff --git a/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml b/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
new file mode 100644
index 000000000000..878397830a4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/samsung,exynos5250-gsc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC G-Scaler
+
+maintainers:
+  - Inki Dae <inki.dae@samsung.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Seung-Woo Kim <sw0312.kim@samsung.com
+
+description:
+  G-Scaler is used for scaling and color space conversion on Samsung Exynos
+  SoCs.
+
+  Each G-Scaler node should have a numbered alias in the aliases node, in the
+  form of gscN, N = 0...3.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - samsung,exynos5250-gsc
+              - samsung,exynos5420-gsc
+          - const: samsung,exynos5-gsc
+      - enum:
+          - samsung,exynos5433-gsc
+      - const: samsung,exynos5-gsc
+        deprecated: True
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
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
+  reg:
+    maxItems: 1
+
+  samsung,sysreg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Syscon used to control the system registers to set writeback input and destination.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - interrupts
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos5-gsc
+              - samsung,exynos5250-gsc
+              - samsung,exynos5420-gsc
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: gscl
+    else:
+      properties:
+        clocks:
+          minItems: 5
+        clock-names:
+          items:
+            - const: pclk
+            - const: aclk
+            - const: aclk_xiu
+            - const: aclk_gsclbend
+            - const: gsd
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    video-scaler@13e00000 {
+        compatible = "samsung,exynos5250-gsc", "samsung,exynos5-gsc";
+        reg = <0x13e00000 0x1000>;
+        interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&pd_gsc>;
+        clocks = <&clock CLK_GSCL0>;
+        clock-names = "gscl";
+        iommus = <&sysmmu_gsc0>;
+    };
-- 
2.34.1

