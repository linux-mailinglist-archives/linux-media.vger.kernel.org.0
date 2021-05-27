Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C099E392A56
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 11:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235680AbhE0JPF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 05:15:05 -0400
Received: from comms.puri.sm ([159.203.221.185]:58028 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235658AbhE0JO5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 05:14:57 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 7576EE2056;
        Thu, 27 May 2021 02:12:54 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id w9B1I3lAtCYE; Thu, 27 May 2021 02:12:50 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     mchehab@kernel.org, robh@kernel.org,
        krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com
Cc:     kernel@puri.sm, paul.kocialkowski@bootlin.com, shawnx.tu@intel.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 2/4] dt-bindings: media: document SK Hynix Hi-846 MIPI CSI-2 8M pixel sensor
Date:   Thu, 27 May 2021 11:12:19 +0200
Message-Id: <20210527091221.3335998-3-martin.kepplinger@puri.sm>
In-Reply-To: <20210527091221.3335998-1-martin.kepplinger@puri.sm>
References: <20210527091221.3335998-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the bindings used for the SK Hynix Hi-846 CMOS camera driver.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 .../bindings/media/i2c/hynix,hi846.yaml       | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
new file mode 100644
index 000000000000..1ce601d25079
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/hynix,hi846.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SK Hynix Hi-846 1/4" 8M Pixel MIPI CSI-2 sensor
+
+maintainers:
+  - Martin Kepplinger <martin.kepplinger@puri.sm>
+
+description: |-
+  The Hi-846 is a raw image sensor with an MIPI CSI-2 image data
+  interface and CCI (I2C compatible) control bus. The output format
+  is 10bit Bayer.
+
+properties:
+  compatible:
+    const: hynix,hi846
+
+  reg:
+    description: I2C device address.
+    maxItems: 1
+
+  clocks:
+    description: Reference to the mclk clock.
+    maxItems: 1
+
+  clock-names:
+    const: mclk
+
+  rst-gpios:
+    description: Reference to the GPIO connected to the reset pin. Active low.
+    maxItems: 1
+
+  vdd-supply:
+    description: Definition of the regulator used as 1.8V digital power supply.
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            - oneOf:
+              - items:
+                - const: 1
+                - const: 2
+                - const: 3
+                - const: 4
+              - items:
+                - const: 1
+                - const: 2
+
+        required:
+          - data-lanes
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - rst-gpios
+  - vdd-supply
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
+        hi846: camera@20 {
+            compatible = "hynix,hi846";
+            reg = <0x20>;
+            clocks = <&clk>;
+            clock-names = "mclk";
+            vdd-supply = <&reg_camera_pwr_en>; /* 1.8v */
+            rst-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
+
+            port {
+                camera_out: endpoint {
+                    remote-endpoint = <&csi1_ep1>;
+                    data-lanes = <1 2>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.30.2

