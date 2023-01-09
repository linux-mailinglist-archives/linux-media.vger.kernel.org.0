Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0339866263A
	for <lists+linux-media@lfdr.de>; Mon,  9 Jan 2023 13:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236585AbjAIMzM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Jan 2023 07:55:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236710AbjAIMxz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Jan 2023 07:53:55 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02D9167EF
        for <linux-media@vger.kernel.org>; Mon,  9 Jan 2023 04:53:46 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id g19-20020a05600c4ed300b003d9eb1dbc0aso3662740wmq.3
        for <linux-media@vger.kernel.org>; Mon, 09 Jan 2023 04:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDvyBGOGxxnDCc1Dw9lCfLpVZDhUmhTuEgqCyjZqWcQ=;
        b=aDVJ74Qj+yag2OIPErtDd1rSmMVYOkl1ZY9MsJfl7BFTw8zf55YII6Rylr72VYafFJ
         35JU/3St536Fm+xyvggEwOUaYmLo9bao+2zWWU/AWn0qL6jlBwN9s4pKEue8spJlRDfU
         qzF9ZsM8b6t0fPS97W4O7WwfGHS84V9mna5T8eP6jNn6Y5JdH1fXoAL1Kebgrb6JYSe9
         6ZrPvpAa4A40cLcYAprxx0E4r2Du6QH/1zHhXEPeZ8HMrjhSFOFXuNCGgl2Sy+Qr6Y56
         UnaAlgNo9LacWKBplD6U+fxNaKvflLVTiebI7+1F5cLrFwreF4dGS3HYO1I0sy6yPQXb
         x8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDvyBGOGxxnDCc1Dw9lCfLpVZDhUmhTuEgqCyjZqWcQ=;
        b=4sPIFUF6jDCEHMTfZtIJI56pXv4AIhbb2QNX9HVo/NGH6Tm363/Y9VRCc0HpYqKvW0
         oiZ9Ao0eXk1+mNcB5VLWf+MAX5SCw1oJ9EcMRu3w5mfntc4v0FBgzxoWPrBbWdq1oe8k
         jMr1WVwtXyvsSWqOEXFRdcFNHjcWgDH9S5LNsYgqqGy8xkgGjtZ+PIGPRpFhKkql0Aby
         Q6IipJtPDMkFjK5ziNWJEVYCBNULunyWA3SK+mmZkUwJEHzaEBLEcrSh+1WiTVLcWOtI
         gmbVxr+Tma8KWsPhZmisbHKpG7ZgvTOomnBlmC9ovx8mMZNYqC9wa6Q8H0l8wqvf2AwC
         +KVQ==
X-Gm-Message-State: AFqh2kq+3ex+WJx0YjglZ7QFslvGiVlh0H045Zv/HXVlY4cxu4r7UuQx
        b6dvTi37tQ3z/AUaMBpWA8CV6A==
X-Google-Smtp-Source: AMrXdXsvZ0K32fW7veYIM8wZMLJNnLqisx+xvWNu6XYBo9e2eJHZJi6EjXEgH2cz6hfQCKC8N2tDVw==
X-Received: by 2002:a05:600c:1e24:b0:3d3:5075:7526 with SMTP id ay36-20020a05600c1e2400b003d350757526mr47525802wmb.31.1673268826484;
        Mon, 09 Jan 2023 04:53:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id y7-20020a7bcd87000000b003d997e5e679sm12805667wmj.14.2023.01.09.04.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 04:53:46 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 09 Jan 2023 13:53:34 +0100
Subject: [PATCH v2 10/11] dt-bindings: PCI: convert amlogic,meson-pcie.txt to
 dt-schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221117-b4-amlogic-bindings-convert-v2-10-36ad050bb625@linaro.org>
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

Convert the Amlogic Meson AXG DWC PCIE SoC controller bindings to
dt-schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/pci/amlogic,axg-pcie.yaml  | 134 +++++++++++++++++++++
 .../devicetree/bindings/pci/amlogic,meson-pcie.txt |  70 -----------
 2 files changed, 134 insertions(+), 70 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml b/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
new file mode 100644
index 000000000000..a08f15fe9a9a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/amlogic,axg-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson AXG DWC PCIE SoC controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  Amlogic Meson PCIe host controller is based on the Synopsys DesignWare PCI core.
+
+allOf:
+  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
+
+# We need a select here so we don't match all nodes with 'snps,dw-pcie'
+select:
+  properties:
+    compatible:
+      enum:
+        - amlogic,axg-pcie
+        - amlogic,g12a-pcie
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - amlogic,axg-pcie
+          - amlogic,g12a-pcie
+      - const: snps,dw-pcie
+
+  reg:
+    items:
+      - description: External local bus interface registers
+      - description: Meson designed configuration registers
+      - description: PCIe configuration space
+
+  reg-names:
+    items:
+      - const: elbi
+      - const: cfg
+      - const: config
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PCIe GEN 100M PLL clock
+      - description: PCIe RC clock gate
+      - description: PCIe PHY clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: port
+      - const: general
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: pcie
+
+  resets:
+    items:
+      - description: Port Reset
+      - description: Shared APB reset
+
+  reset-names:
+    items:
+      - const: port
+      - const: apb
+
+  num-lanes:
+    const: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clock
+  - clock-names
+  - "#address-cells"
+  - "#size-cells"
+  - "#interrupt-cells"
+  - interrupt-map
+  - interrupt-map-mask
+  - ranges
+  - bus-range
+  - device_type
+  - num-lanes
+  - phys
+  - phy-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pcie: pcie@f9800000 {
+        compatible = "amlogic,axg-pcie", "snps,dw-pcie";
+        reg = <0xf9800000 0x400000>, <0xff646000 0x2000>, <0xf9f00000 0x100000>;
+        reg-names = "elbi", "cfg", "config";
+        interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&pclk>, <&clk_port>, <&clk_phy>;
+        clock-names = "pclk", "port", "general";
+        resets = <&reset_pcie_port>, <&reset_pcie_apb>;
+        reset-names = "port", "apb";
+        phys = <&pcie_phy>;
+        phy-names = "pcie";
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0 0 0 0>;
+        interrupt-map = <0 0 0 0 &gic GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+        bus-range = <0x0 0xff>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        num-lanes = <1>;
+        ranges = <0x82000000 0 0 0xf9c00000 0 0x00300000>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt b/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
deleted file mode 100644
index c3a75ac6e59d..000000000000
--- a/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
+++ /dev/null
@@ -1,70 +0,0 @@
-Amlogic Meson AXG DWC PCIE SoC controller
-
-Amlogic Meson PCIe host controller is based on the Synopsys DesignWare PCI core.
-It shares common functions with the PCIe DesignWare core driver and
-inherits common properties defined in
-Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml.
-
-Additional properties are described here:
-
-Required properties:
-- compatible:
-	should contain :
-	- "amlogic,axg-pcie" for AXG SoC Family
-	- "amlogic,g12a-pcie" for G12A SoC Family
-	to identify the core.
-- reg:
-	should contain the configuration address space.
-- reg-names: Must be
-	- "elbi"	External local bus interface registers
-	- "cfg"		Meson specific registers
-	- "config"	PCIe configuration space
-- reset-gpios: The GPIO to generate PCIe PERST# assert and deassert signal.
-- clocks: Must contain an entry for each entry in clock-names.
-- clock-names: Must include the following entries:
-	- "pclk"       PCIe GEN 100M PLL clock
-	- "port"       PCIe_x(A or B) RC clock gate
-	- "general"    PCIe Phy clock
-- resets: phandle to the reset lines.
-- reset-names: must contain "port" and "apb"
-       - "port"        Port A or B reset
-       - "apb"         Share APB reset
-- phys: should contain a phandle to the PCIE phy
-- phy-names: must contain "pcie"
-
-- device_type:
-	should be "pci". As specified in snps,dw-pcie.yaml
-
-
-Example configuration:
-
-	pcie: pcie@f9800000 {
-			compatible = "amlogic,axg-pcie", "snps,dw-pcie";
-			reg = <0x0 0xf9800000 0x0 0x400000
-					0x0 0xff646000 0x0 0x2000
-					0x0 0xf9f00000 0x0 0x100000>;
-			reg-names = "elbi", "cfg", "config";
-			reset-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_HIGH>;
-			interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 0>;
-			interrupt-map = <0 0 0 0 &gic GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
-			bus-range = <0x0 0xff>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			device_type = "pci";
-			ranges = <0x82000000 0 0 0x0 0xf9c00000 0 0x00300000>;
-
-			clocks = <&clkc CLKID_USB
-					&clkc CLKID_PCIE_A
-					&clkc CLKID_PCIE_CML_EN0>;
-			clock-names = "general",
-					"pclk",
-					"port";
-			resets = <&reset RESET_PCIE_A>,
-				<&reset RESET_PCIE_APB>;
-			reset-names = "port",
-					"apb";
-			phys = <&pcie_phy>;
-			phy-names = "pcie";
-	};

-- 
2.34.1
