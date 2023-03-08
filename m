Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B95F66B08D4
	for <lists+linux-media@lfdr.de>; Wed,  8 Mar 2023 14:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbjCHN3Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Mar 2023 08:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbjCHN2u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Mar 2023 08:28:50 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A527359831
        for <linux-media@vger.kernel.org>; Wed,  8 Mar 2023 05:27:39 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id az36so9815392wmb.1
        for <linux-media@vger.kernel.org>; Wed, 08 Mar 2023 05:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678282058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRiMwFjCYTBiVehS5Zjzxk4QhzySk5Q8XvQ2DTwvGYo=;
        b=M13CIKtbt6NdnMF3xUVK+U+fIwa5lvxX7UMTgBXkq9LltkKeHAyVwTCDF/go/LFD8U
         6bug2hBb9pxq16K9n/VVCT/PKd3mY+caJksEYqlWyTlUA6l55FmWHpX/nfPNAXGjeIFB
         Fhd7eUiXeSdq+HfeAFF36WX7dEdR3NydVV3LDdKmukSbQGKapP3NVvfhwnh3i/Opkt/x
         hqmL+tZiIIdW8tA1EzdlHziQ/coCtLM13Lbe4DVPZH0f6gZNWXZzmuAaZyxDJ6ebtngS
         cENJUlpWFd85+3HKL7nLdnxp8GvpH3CJtA++mRQHthCLRUQEO7jFPMraW+1V2rkZU9l3
         x8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678282058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRiMwFjCYTBiVehS5Zjzxk4QhzySk5Q8XvQ2DTwvGYo=;
        b=n2iLMXovwZjx/sqFSLYUycFH4hFYjy3/XB3YB7+AcvK+TcHOdx/01kuuX29F3npeMv
         /OH91tjijMLvXjJ8Wi8cXBPme+DsL+s0NqzhamEl+4D2aTav+Reblzctp7vfT4EJwN8i
         RzaAHXsROF61cjxQuviZz9S8vTYfJ09SAioLw4FBSeTw14BgAyW11jr6a953SRzzRFXZ
         hCuKgutBem/q7LF78AhCuEyQo3RRrwA8hBiMJ1gr9xuWO8lqVl+DqyNT0tjrjplIDSog
         mS0qkLEP815mDoqpkHoxL4P3+b8n5sH5KtH96NQxMKpQ5bx+on4t98MOhT+5A7erhQ5q
         ZB4A==
X-Gm-Message-State: AO0yUKX9dm949XsYHguXAB61Tw2yqCPdbAfbBP+zlLFzZAwLXQAGvNe1
        Bg6eEnDwArNn7b6PKi/KvDI5tA==
X-Google-Smtp-Source: AK7set951sS/BhgEGaC8nI1yOV82Lm95r8nqh+ea9T47x6/Z1PG+rb2KYuae4aHocOJmhElbdw+z8w==
X-Received: by 2002:a05:600c:a09:b0:3ea:c100:e974 with SMTP id z9-20020a05600c0a0900b003eac100e974mr17176799wmp.26.1678282058156;
        Wed, 08 Mar 2023 05:27:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b003daffc2ecdesm20631491wmo.13.2023.03.08.05.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 05:27:37 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 08 Mar 2023 14:27:32 +0100
Subject: [PATCH v4 4/5] dt-bindings: timer: convert
 timer/amlogic,meson6-timer.txt to dt-schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221117-b4-amlogic-bindings-convert-v4-4-34e623dbf789@linaro.org>
References: <20221117-b4-amlogic-bindings-convert-v4-0-34e623dbf789@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v4-0-34e623dbf789@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the Amlogic Meson6 SoCs Timer Controller bindings to dt-schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/timer/amlogic,meson6-timer.txt        | 22 ---------
 .../bindings/timer/amlogic,meson6-timer.yaml       | 54 ++++++++++++++++++++++
 2 files changed, 54 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt b/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt
deleted file mode 100644
index a9da22bda912..000000000000
--- a/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Amlogic Meson6 SoCs Timer Controller
-
-Required properties:
-
-- compatible : should be "amlogic,meson6-timer"
-- reg : Specifies base physical address and size of the registers.
-- interrupts : The four interrupts, one for each timer event
-- clocks : phandles to the pclk (system clock) and XTAL clocks
-- clock-names : must contain "pclk" and "xtal"
-
-Example:
-
-timer@c1109940 {
-	compatible = "amlogic,meson6-timer";
-	reg = <0xc1109940 0x14>;
-	interrupts = <GIC_SPI 10 IRQ_TYPE_EDGE_RISING>,
-		     <GIC_SPI 11 IRQ_TYPE_EDGE_RISING>,
-		     <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>,
-		     <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
-	clocks = <&xtal>, <&clk81>;
-	clock-names = "xtal", "pclk";
-};
diff --git a/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.yaml b/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.yaml
new file mode 100644
index 000000000000..8381a5404ef7
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/amlogic,meson6-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson6 SoCs Timer Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+properties:
+  compatible:
+    const: amlogic,meson6-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 4
+    description: per-timer event interrupts
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: xtal
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    timer@c1109940 {
+        compatible = "amlogic,meson6-timer";
+        reg = <0xc1109940 0x14>;
+        interrupts = <GIC_SPI 10 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 11 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&xtal>, <&clk81>;
+        clock-names = "xtal", "pclk";
+    };

-- 
2.34.1

