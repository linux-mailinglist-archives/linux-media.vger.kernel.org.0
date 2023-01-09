Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38128662641
	for <lists+linux-media@lfdr.de>; Mon,  9 Jan 2023 13:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236796AbjAIMzP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Jan 2023 07:55:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236667AbjAIMxy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Jan 2023 07:53:54 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56190167C9
        for <linux-media@vger.kernel.org>; Mon,  9 Jan 2023 04:53:45 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id m3so6202315wmq.0
        for <linux-media@vger.kernel.org>; Mon, 09 Jan 2023 04:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xnGne0AIOrRCEdGHKqqNZ0QfLFzf5T0LDCMO8FL2j20=;
        b=tdRA/XNZo1N4yOReT2anVcAvsngzTiSAw3nqQ7nz8qE+yWDxA+c4TNXZu0951C6Y3g
         tXZ7nAQ6DThzdBdWJ+J+XgGMYKRlKudJlKv2oHnRKMSnicLhKRvdmPmR6paMvZtvQqtU
         ofNw04nMx9CV3c0RE34fXv8TKK5+yC2TKT6dAP3bBSR57X+VZTqCc7JEzRDJPv6heHNE
         vLW8YyrXazDN0oJ/2GlinhzM0xS30ZT6MImLX0iFv13ThJRSM3pq2tBcHtBKDOKNL7cP
         4FF4sr35FWkGNVzUjLuPadwthZarBwzKDbwQhpWz9CynHd1WynmOKmfUUIHQnOfTuV9H
         wgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xnGne0AIOrRCEdGHKqqNZ0QfLFzf5T0LDCMO8FL2j20=;
        b=wal+PF8jW76jlsb2NZXM46IgHFglkX0TrEnzd+IwOW6DVlrl3hEVjAhCBWVBkAm2Hm
         oG446eIw5wF12hKK4EOy/QZjASMjt8ZL52RayWoBHWBEESqkknm2IL/zBTFV/x2eQV9d
         LZJKhHAPzZCdCtWveCrIpf6JE0vcRVG3mSKM+KSl5XllTDpY84XPtF9bda6r2JH3U9vq
         Po4vC5llWw7MEil2//Gtfx5wFcFyuMfgp4JSgaHEOUMqyINlxsvSSiq/SaW/GU1Y1RfL
         +sgNFXtvgnsR9msCA/Nn8bz5ZTnKWJVySb9Lhn26Umwp/7HTzxULRdkVC0xqQCRuy4C7
         JCOg==
X-Gm-Message-State: AFqh2koktd6910vevBLv3+XO0PnXU2LUYGP+3hm+iAOyTEgP/Vqhxto0
        iOTzoVqFsbBSWx37XhAJ5fXy3w==
X-Google-Smtp-Source: AMrXdXtSCFttOui0qa5LKd97wrkCdtisGa/3lKZHafkOyyzh4CULuBVHJr8agyQdCGKPyuHcPd1xDQ==
X-Received: by 2002:a05:600c:1e8c:b0:3d6:2952:679b with SMTP id be12-20020a05600c1e8c00b003d62952679bmr46035669wmb.34.1673268824876;
        Mon, 09 Jan 2023 04:53:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id y7-20020a7bcd87000000b003d997e5e679sm12805667wmj.14.2023.01.09.04.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 04:53:44 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 09 Jan 2023 13:53:33 +0100
Subject: [PATCH v2 09/11] dt-bindings: mmc: convert amlogic,meson-gx.txt to dt-schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221117-b4-amlogic-bindings-convert-v2-9-36ad050bb625@linaro.org>
References: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org,
        netdev@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the Amlogic SD / eMMC controller for S905/GXBB family SoCs
to dt-schema.

Take in account the used variant with amlogic,meson-gx-mmc.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/mmc/amlogic,meson-gx-mmc.yaml         | 75 ++++++++++++++++++++++
 .../devicetree/bindings/mmc/amlogic,meson-gx.txt   | 39 -----------
 2 files changed, 75 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
new file mode 100644
index 000000000000..30228964fd9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/amlogic,meson-gx-mmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic SD / eMMC controller for S905/GXBB family SoCs
+
+description:
+  The MMC 5.1 compliant host controller on Amlogic provides the
+  interface for SD, eMMC and SDIO devices
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: mmc-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - amlogic,meson-gx-mmc
+          - amlogic,meson-axg-mmc
+      - items:
+          - const: amlogic,meson-gx-mmc
+          - const: amlogic,meson-gxbb-mmc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: clkin0
+      - const: clkin1
+
+  resets:
+    maxItems: 1
+
+  amlogic,dram-access-quirk:
+    type: boolean
+    description:
+      set when controller's internal DMA engine cannot access the DRAM memory,
+      like on the G12A dedicated SDIO controller.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mmc@70000 {
+        compatible = "amlogic,meson-gx-mmc";
+        reg = <0x70000 0x2000>;
+        interrupts = <GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clk_mmc>, <&xtal>, <&clk_div>;
+        clock-names = "core", "clkin0", "clkin1";
+        pinctrl-0 = <&emm_pins>;
+        resets = <&reset_mmc>;
+    };
diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
deleted file mode 100644
index ccc5358db131..000000000000
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-Amlogic SD / eMMC controller for S905/GXBB family SoCs
-
-The MMC 5.1 compliant host controller on Amlogic provides the
-interface for SD, eMMC and SDIO devices.
-
-This file documents the properties in addition to those available in
-the MMC core bindings, documented by mmc.txt.
-
-Required properties:
-- compatible : contains one of:
-  - "amlogic,meson-gx-mmc"
-  - "amlogic,meson-gxbb-mmc"
-  - "amlogic,meson-gxl-mmc"
-  - "amlogic,meson-gxm-mmc"
-  - "amlogic,meson-axg-mmc"
-- clocks     : A list of phandle + clock-specifier pairs for the clocks listed in clock-names.
-- clock-names: Should contain the following:
-	"core" - Main peripheral bus clock
-	"clkin0" - Parent clock of internal mux
-	"clkin1" - Other parent clock of internal mux
-  The driver has an internal mux clock which switches between clkin0 and clkin1 depending on the
-  clock rate requested by the MMC core.
-- resets     : phandle of the internal reset line
-
-Optional properties:
-- amlogic,dram-access-quirk: set when controller's internal DMA engine cannot access the
-  DRAM memory, like on the G12A dedicated SDIO controller.
-
-Example:
-
-	sd_emmc_a: mmc@70000 {
-		compatible = "amlogic,meson-gxbb-mmc";
-		reg = <0x0 0x70000 0x0 0x2000>;
-		interrupts = < GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;
-		clocks = <&clkc CLKID_SD_EMMC_A>, <&xtal>, <&clkc CLKID_FCLK_DIV2>;
-		clock-names = "core", "clkin0", "clkin1";
-		pinctrl-0 = <&emmc_pins>;
-		resets = <&reset RESET_SD_EMMC_A>;
-	};

-- 
2.34.1
