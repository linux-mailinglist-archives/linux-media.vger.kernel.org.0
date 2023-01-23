Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED1356778B6
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 11:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbjAWKKd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 05:10:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbjAWKKV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 05:10:21 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AD7F1E1CB
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 02:10:09 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso8125051wms.3
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 02:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QnuhptbipJYdHWSiiqtgEE8IRm3fj6CX7C8k1jBDlQ=;
        b=D2y6U13jAntOiII5Aj+46tSWmTvxoLNv6sysz+VOmfozTTtUplEHw/9zJLa/WQFN4b
         z6MDrnXxEpjFTbleI8OQga5JOVXSc5MQrAHEjm4F5lIELUOklfl2pVTVWBqYLTpAZWnq
         +gHsMkk8a0sgdaCXNIh4/hLYh2fGtRSNjYfNBqqmHn/+PYmkBuOt7Dag3uuoruiOpF5G
         +/6ZCncD01okOf0tQRspFteJ1WszTHPskrSwrNboikKlj0lOxNhwwWA+uZ5gJjKhebZ6
         dKD0KuLRHj63x0REhkpGva8rSPkVla8xTKleOMeKYrIk2jgClPNA/DyLOBdsF3+ZXgIt
         SHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QnuhptbipJYdHWSiiqtgEE8IRm3fj6CX7C8k1jBDlQ=;
        b=ZgnL5yXthIundqWKKw9MHeUBmAuy2vHi5U9qZAhmjTUWhZCgBOykooA9ZIXVqJspmq
         dHQ2GkxPk7VaMv7n/FkTa3fmCERWsjQZWIdkMZ/v6ixG4h208KwpULxNVQFLPIUhPNqa
         mCYxEedyv6MhzW3UyM05BtZGy9GxVxRDHOnHHJBYtg4nlKi+vtifp7nl5XaT9pPdyQrR
         rkg0HI+LLhO1unmHcAjs2TOdgE1r33xoyg7dvxH66KI3dlSf8X0XHHR5i+g/JjQnB+lj
         5TztopoD6vUROyT8jGGxw169CLyS8YtR2gENCecevkGSItpUEZ0PuO/diZo5uJrkI1Lw
         3vsQ==
X-Gm-Message-State: AFqh2kqG2EADwEU4Evwkk2eHoqt9oF1NBcC3QR3hpYnb5VTnKCiom10f
        V0Wu6KQsWUppDKTe5Uk92r7+3g==
X-Google-Smtp-Source: AMrXdXuisOGGyFDugQEwjFlEIch7Uu3cTCmEFJEDE/gOYH0HI8ybTMIZvmf5kg2eaSJaUpWRvoxCng==
X-Received: by 2002:a05:600c:2284:b0:3d3:5c21:dd9d with SMTP id 4-20020a05600c228400b003d35c21dd9dmr23604933wmf.19.1674468608355;
        Mon, 23 Jan 2023 02:10:08 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m9-20020a056000024900b002bdec340a1csm22670403wrz.110.2023.01.23.02.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 02:10:08 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 23 Jan 2023 11:10:03 +0100
Subject: [PATCH v3 6/7] dt-bindings: mmc: convert amlogic,meson-gx.txt to
 dt-schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221117-b4-amlogic-bindings-convert-v3-6-e28dd31e3bed@linaro.org>
References: <20221117-b4-amlogic-bindings-convert-v3-0-e28dd31e3bed@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v3-0-e28dd31e3bed@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org
X-Mailer: b4 0.12.0
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
 .../bindings/mmc/amlogic,meson-gx-mmc.yaml         | 73 ++++++++++++++++++++++
 .../devicetree/bindings/mmc/amlogic,meson-gx.txt   | 39 ------------
 2 files changed, 73 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
new file mode 100644
index 000000000000..46e235bf228b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
@@ -0,0 +1,73 @@
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
+      - const: amlogic,meson-axg-mmc
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
+        compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
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

