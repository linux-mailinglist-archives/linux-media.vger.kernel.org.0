Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586962B8587
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 21:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgKRU1W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 15:27:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:48198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726397AbgKRU1W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 15:27:22 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 718B42145D;
        Wed, 18 Nov 2020 20:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605731241;
        bh=xGqFTU1c3nMS4sK//AsayXJdmZp/WwlprTJ6hOsciYM=;
        h=From:To:Cc:Subject:Date:From;
        b=T6Q2+obxsKVgN/X259eH8PAXLe46chX/tWmeD4hKzYcnVMWvF9yhGlT927hCLMnG/
         CbXJz3s0e4JESNh30gGHrtXxVcP4+WMyEPPo4IcvqeZl+og4i2kQUFNu0SiOeTMAkc
         1KcqgJpbxR25lehL9zxc4RFJ3+7OA2cLZ5N4XEf4=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/4] dt-bindings: media: imx258: add bindings for IMX258 sensor
Date:   Wed, 18 Nov 2020 21:27:12 +0100
Message-Id: <20201118202715.6692-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings for the IMX258 camera sensor.  The bindings, just like the
driver, are quite limited, e.g. do not support regulator supplies.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v4:
1. Add clock-lanes,
2. Add Rob's review,
3. Add one more example and extend existing one,
4. Add common clock properties (assigned-*).

Changes since v3:
1. Document also two lane setup.

Changes since v2:
1. Remove clock-frequency, add reset GPIOs, add supplies.
2. Use additionalProperties.

Changes since v1:
1. None
---
 .../devicetree/bindings/media/i2c/imx258.yaml | 140 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx258.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/imx258.yaml b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
new file mode 100644
index 000000000000..4a3471fb88a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/imx258.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX258 13 Mpixel CMOS Digital Image Sensor
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description: |-
+  IMX258 is a diagonal 5.867mm (Type 1/3.06) 13 Mega-pixel CMOS active pixel
+  type stacked image sensor with a square pixel array of size 4208 x 3120. It
+  is programmable through I2C interface.  Image data is sent through MIPI
+  CSI-2.
+
+properties:
+  compatible:
+    const: sony,imx258
+
+  assigned-clocks: true
+  assigned-clock-parents: true
+  assigned-clock-rates: true
+
+  clocks:
+    description:
+      Clock frequency from 6 to 27 MHz.
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    description: |-
+      Reference to the GPIO connected to the XCLR pin, if any.
+
+  vana-supply:
+    description:
+      Analog voltage (VANA) supply, 2.7 V
+
+  vdig-supply:
+    description:
+      Digital I/O voltage (VDIG) supply, 1.2 V
+
+  vif-supply:
+    description:
+      Interface voltage (VIF) supply, 1.8 V
+
+  # See ../video-interfaces.txt for more details
+  port:
+    type: object
+    properties:
+      endpoint:
+        type: object
+        properties:
+          clock-lanes:
+            const: 0
+
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
+
+          link-frequencies:
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint64-array
+            description:
+              Allowed data bus frequencies.
+
+        required:
+          - clock-lanes
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@6c {
+            compatible = "sony,imx258";
+            reg = <0x6c>;
+            clocks = <&imx258_clk>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&csi1_ep>;
+                    clock-lanes = <0>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <320000000>;
+                };
+            };
+        };
+    };
+
+    /* Oscillator on the camera board */
+    imx258_clk: clk {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <19200000>;
+    };
+
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@6c {
+            compatible = "sony,imx258";
+            reg = <0x6c>;
+            clocks = <&imx258_clk>;
+
+            assigned-clocks = <&imx258_clk>;
+            assigned-clock-rates = <19200000>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&csi1_ep>;
+                    clock-lanes = <0>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <633600000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 82ea6867ac2e..96ca9d2857db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16395,6 +16395,7 @@ M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/imx258.yaml
 F:	drivers/media/i2c/imx258.c
 
 SONY IMX274 SENSOR DRIVER
-- 
2.25.1

