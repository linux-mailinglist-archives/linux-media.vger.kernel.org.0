Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C17E199786
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 15:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731027AbgCaNd7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 09:33:59 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37395 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731000AbgCaNd7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 09:33:59 -0400
Received: by mail-wr1-f66.google.com with SMTP id w10so26051168wrm.4
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2020 06:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nW0Q9tddO1TQwMe/6Sxs0mws5s6HTicDjbPL5GWcTfM=;
        b=vN0Lq4PoSUCgwTZFIwoomfjq/gMvf6CJLO+56ryNRCdWLX85QayyrvQ4Ow8LR1M/W3
         +xfETMsgc/ESrIp18kWsegvwcaSFWV2teZ7XkSOoxw2g7pOBJ8z7R9K/8jtnyznbMOZb
         4ZowSKl4taiuNtC0minEncGPpIyItLBbW7uzi1WUHARq5QQekmCHyXHFD3Wsew9Ydl3l
         lpFNVDF0m2+PF0FZ/WNWNr6bU4vaKkNy+UQMF7dvz9PhQhaeonGjwrpVx1tzkpzdD4by
         /onq5r2n9EGwKg6qmQROUHrEcBxNCz6M4lBFbiTLxCspmouK3eV9TLaJS4QPuJgsqqqL
         uEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nW0Q9tddO1TQwMe/6Sxs0mws5s6HTicDjbPL5GWcTfM=;
        b=UfdUC0dr1w3VI3c75b3Z85b4slRsSDK6eLkj7s80Ener/A6MvKQr8+SOyzv+yzH+9Q
         9XmmvDYFFAL8KF/Z+G1cg20vuiAbJqEeNNlfRhXmZ3bN7zF0CtE/TYcFMWOSOgbcaI7R
         l7gHE1H1P9gnEHPCKrVo533TaccWDb24XPcQ+iN2Cuc8J+oGFhVIfPBvnw5ALiGc2uOl
         Ouq0dKze/cDovK247Y2MWtBhmnnf61CBszhPqRNbeSBh6X9pRWyOZcFMw4tS0UbGN8L2
         vbfV07t8LNszhWwj4O3OBAdMTX8QALzSUoi3MNUV7WDdKgCJUAHL3vo+7fodJYpaeLDC
         yF5g==
X-Gm-Message-State: ANhLgQ1vwr1TbEJ8VMK6uF1LWKHSy9PKVgUYP8Az+/BJnXQqU2A9puEf
        UEvmZpJe62mZUB0s0pn9N40EXg==
X-Google-Smtp-Source: ADFU+vup82VG95GD/mSQV2aDWAVY3NVVevW5FpzCgJSYqYy0/+aFDQpRoopEVo9XTGqdi//VSIymGw==
X-Received: by 2002:adf:afdb:: with SMTP id y27mr20804472wrd.208.1585661637198;
        Tue, 31 Mar 2020 06:33:57 -0700 (PDT)
Received: from localhost.localdomain ([37.120.50.78])
        by smtp.gmail.com with ESMTPSA id 61sm28623081wrn.82.2020.03.31.06.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 06:33:56 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v6 1/3] media: dt-bindings: ov8856: Document YAML bindings
Date:   Tue, 31 Mar 2020 15:33:44 +0200
Message-Id: <20200331133346.372517-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200331133346.372517-1-robert.foss@linaro.org>
References: <20200331133346.372517-1-robert.foss@linaro.org>
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

 .../devicetree/bindings/media/i2c/ov8856.yaml | 150 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 151 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
new file mode 100644
index 000000000000..beeddfbb8709
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
@@ -0,0 +1,150 @@
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
+  clock-frequency:
+    description:
+      Frequency of the xvclk clock in Hertz.
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
+  - clock-frequency
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
+    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
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
+            clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
+            clock-names = "xvclk";
+            clock-frequency = <19200000>;
+            assigned-clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
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
index a6fbdf354d34..0f99e863978a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12355,6 +12355,7 @@ L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	drivers/media/i2c/ov8856.c
+F:	Documentation/devicetree/bindings/media/i2c/ov8856.yaml
 
 OMNIVISION OV9650 SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-- 
2.25.1

