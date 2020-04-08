Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2AF41A1F6B
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 13:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728327AbgDHLIa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 07:08:30 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51700 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbgDHLI2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 07:08:28 -0400
Received: by mail-wm1-f68.google.com with SMTP id z7so4717718wmk.1
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 04:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EOnNa/TLh6h6HNgX41DYotN/L8BySvP3U4vrVfk7o6Y=;
        b=O2ny8JKGUSOuz/60vCEy24Z2F71bpl9WsZ1e1tuYDus2ZF4FzzrO3XhUleYtj7jH6l
         KaCI6/4ClgphAIuccqIzWvMi7JCridrNIfslRWmZYfceqr4F5fjdRmPLpsJzq7Jrar+b
         QY+9PTmBe0ZdlkzQhxwF3FAO51PbDJBEHM6DaytPjZHiP65zhc6QIKr5FhHVYTUp/2Gt
         uBcSpt9Ucz22AtBI+ajLPYxJc709g1VompPqnBKcIRo5MnaFk3tNOuq4MfPTfW7CHMT7
         f8DFa5vpZkBHu4wJmlXw5x+fVhKcKvLUmWEQL3ii5529+kLh7RQaAfii7omMdLSDe3PE
         LEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EOnNa/TLh6h6HNgX41DYotN/L8BySvP3U4vrVfk7o6Y=;
        b=BuUo34v98V9K1er49qj8hPr1LxX1e4+RjRrGdEJMaocFPw9DJCeOm6eAe7JsHTyWrK
         1Xz5zXRa5fyDoZrWX9p6nkNtjfKmKBIOhLlc2vqyrdyYFNdrwvm+7nUQEX6L0YCmSAw/
         QBem87U43rqGVKCEp4m8J521u7ke7JLK+wEFP0d3ZEqpOYaOq9KNO3cSpNFLSehUvZc3
         Wu7Bnt9xHjsL39djMpI0AP4uJ/ELvqxs/LUvdeagA8NknCuwXqpIiDKpucpdlSqsrt2Z
         GtiNbtKu6WZUHFty5qMPnmQsBxEV5tcBAtufvNnwWf6Q9S1r2M9zwlExynkhERm3Cvm2
         7Ebg==
X-Gm-Message-State: AGi0Pua7vDmm9Id3Wop0onZ9m0CboEwzsM+JoIo3eincQw40bk3OIbQA
        Y192LpqKXaytOQKhHlwRvATUYw==
X-Google-Smtp-Source: APiQypJ8psA8kj8RYG+w7ZqInsqVOLVF9bsnw1TmjHbXUxzjvKohVvAbjzHiJOBlAF+tzflddAC89A==
X-Received: by 2002:a1c:e914:: with SMTP id q20mr4038768wmc.105.1586344104561;
        Wed, 08 Apr 2020 04:08:24 -0700 (PDT)
Received: from localhost.localdomain ([37.120.50.78])
        by smtp.gmail.com with ESMTPSA id i8sm37596253wrb.41.2020.04.08.04.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 04:08:24 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v7 1/3] media: dt-bindings: ov8856: Document YAML bindings
Date:   Wed,  8 Apr 2020 13:08:14 +0200
Message-Id: <20200408110816.2712841-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408110816.2712841-1-robert.foss@linaro.org>
References: <20200408110816.2712841-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dongchun Zhu <dongchun.zhu@mediatek.com>

This patch adds documentation of device tree in YAML schema for the
OV8856 CMOS image sensor.

Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

- Changes since v6:
  * Marco: remove qcom specifics from DT example
   
- Changes since v5:
  * Add assigned-clocks and assigned-clock-rates
  * robher: dt-schema errors

- Changes since v4:
  * Fabio: Change reset-gpio to GPIO_ACTIVE_LOW, explain in description
  * Add clock-lanes property to example
  * robher: Fix syntax error in devicetree example

- Changes since v3:
  * robher: Fix syntax error
  * robher: Removed maxItems
  * Fixes yaml 'make dt-binding-check' errors

- Changes since v2:
  Fixes comments from from Andy, Tomasz, Sakari, Rob.
  * Convert text documentation to YAML schema.

- Changes since v1:
  Fixes comments from Sakari, Tomasz
  * Add clock-frequency and link-frequencies in DT

 .../devicetree/bindings/media/i2c/ov8856.yaml | 143 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
new file mode 100644
index 000000000000..96bef5403d7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
@@ -0,0 +1,143 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2019 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OV8856 CMOS Sensor Device Tree Bindings
+
+maintainers:
+  - Ben Kao <ben.kao@intel.com>
+  - Dongchun Zhu <dongchun.zhu@mediatek.com>
+
+description: |-
+  The Omnivision OV8856 is a high performance, 1/4-inch, 8 megapixel, CMOS
+  image sensor that delivers 3264x2448 at 30fps. It provides full-frame,
+  sub-sampled, and windowed 10-bit MIPI images in various formats via the
+  Serial Camera Control Bus (SCCB) interface. This chip is programmable
+  through I2C and two-wire SCCB. The sensor output is available via CSI-2
+  serial data output (up to 4-lane).
+
+properties:
+  compatible:
+    const: ovti,ov8856
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    description:
+      Input clock for the sensor.
+    items:
+      - const: xvclk
+
+  assigned-clocks:
+    description:
+      Input clock for the sensor.
+
+  assigned-clock-rates:
+    description:
+      Frequency of the xvclk clock in Hertz.
+
+  dovdd-supply:
+    description:
+      Definition of the regulator used as interface power supply.
+
+  avdd-supply:
+    description:
+      Definition of the regulator used as analog power supply.
+
+  dvdd-supply:
+    description:
+      Definition of the regulator used as digital power supply.
+
+  reset-gpios:
+    description:
+      The phandle and specifier for the GPIO that controls sensor reset.
+      This corresponds to the hardware pin XSHUTDOWN which is physically
+      active low.
+
+  port:
+    type: object
+    additionalProperties: false
+    description:
+      A node containing input and output port nodes with endpoint definitions
+      as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+
+    properties:
+      endpoint:
+        type: object
+
+        properties:
+          clock-lanes:
+            maxItems: 1
+
+          data-lanes:
+            maxItems: 1
+
+          remote-endpoint: true
+
+        required:
+          - clock-lanes
+          - data-lanes
+          - remote-endpoint
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-rates
+  - dovdd-supply
+  - avdd-supply
+  - dvdd-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ov8856: camera@10 {
+            compatible = "ovti,ov8856";
+            reg = <0x10>;
+
+            reset-gpios = <&pio 111 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&clk_24m_cam>;
+
+            clocks = <&cam_osc>;
+            clock-names = "xvclk";
+            assigned-clocks = <&cam_osc>;
+            assigned-clock-rates = <19200000>;
+
+            avdd-supply = <&mt6358_vcama2_reg>;
+            dvdd-supply = <&mt6358_vcamd_reg>;
+            dovdd-supply = <&mt6358_vcamio_reg>;
+
+            port {
+                wcam_out: endpoint {
+                    remote-endpoint = <&mipi_in_wcam>;
+                    clock-lanes = <0>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <360000000 180000000>;
+                };
+            };
+        };
+    };
+...
\ No newline at end of file
diff --git a/MAINTAINERS b/MAINTAINERS
index 534a8dc4f84a..3f35c6e9700a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12465,6 +12465,7 @@ L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	drivers/media/i2c/ov8856.c
+F:	Documentation/devicetree/bindings/media/i2c/ov8856.yaml
 
 OMNIVISION OV9650 SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-- 
2.25.1

