Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B92EB30628E
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 18:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344172AbhA0RtH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 12:49:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:47146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236425AbhA0RrX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 12:47:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FC2664DA9;
        Wed, 27 Jan 2021 17:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611769601;
        bh=CCX+neJn8LWpzHutvQfEetSBvNki1BwD4apsi+C/Li4=;
        h=From:To:Cc:Subject:Date:From;
        b=YogTGizub1soKfk5p71LJStPcogFfP8Pwu5Wn9QV0Q1MIXkoq1Qr2qwPMcuVWI0C4
         sGyTQLe9Qlh+wJFUrrLbCS/uHD7raLDY1Cpn7/AKG9tDEC145hXc7CIhiwqLXmgU8h
         7VBVmuH6xZ/koFTKvSwpMwYgMFudYjOtKtrUCFPlgoSYl9pUlk4oOMOt6BD3Nvzc29
         Zvxm1YeyDjOM39lhsLMw1iLKHU4yn9u/I9qe/eMsXka6lpNldk6bSdWmazAW/JgDcT
         OYuC1o9romsp0JuvUl2/ogsq9hc0iCKAYv9SqAaP6wVZ3WolcpzYYERf76o0VhnS8h
         GfjYjmspFCrpg==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v7 1/4] dt-bindings: media: imx258: add bindings for IMX258 sensor
Date:   Wed, 27 Jan 2021 18:46:32 +0100
Message-Id: <20210127174635.3596-1-krzk@kernel.org>
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

Changes since v6:
1. Drop clock-lanes property.

Changes since v5:
1. None

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
 .../devicetree/bindings/media/i2c/imx258.yaml | 134 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx258.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/imx258.yaml b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
new file mode 100644
index 000000000000..eaf77866ed9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
@@ -0,0 +1,134 @@
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
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <633600000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index e651c9651a87..5aa8813b0d9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16530,6 +16530,7 @@ M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/imx258.yaml
 F:	drivers/media/i2c/imx258.c
 
 SONY IMX274 SENSOR DRIVER
-- 
2.25.1

