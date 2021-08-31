Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6271F3FC88F
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 15:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239537AbhHaNpD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Aug 2021 09:45:03 -0400
Received: from comms.puri.sm ([159.203.221.185]:59018 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238052AbhHaNpB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Aug 2021 09:45:01 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 38A66DFF0F;
        Tue, 31 Aug 2021 06:44:06 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id q330EN20N7dm; Tue, 31 Aug 2021 06:44:01 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm
Cc:     devicetree@vger.kernel.org, kernel@puri.sm,
        krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, pavel@ucw.cz,
        phone-devel@vger.kernel.org, robh@kernel.org, sakari.ailus@iki.fi,
        shawnx.tu@intel.com
Subject: [PATCH v8 2/4] dt-bindings: media: document SK Hynix Hi-846 MIPI CSI-2 8M pixel sensor
Date:   Tue, 31 Aug 2021 15:43:42 +0200
Message-Id: <20210831134344.1673318-3-martin.kepplinger@puri.sm>
In-Reply-To: <20210831134344.1673318-1-martin.kepplinger@puri.sm>
References: <20210831134344.1673318-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the bindings used for the SK Hynix Hi-846 CMOS camera driver.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/i2c/hynix,hi846.yaml       | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
new file mode 100644
index 000000000000..85a8877c2f38
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
@@ -0,0 +1,120 @@
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
+  is raw Bayer.
+
+properties:
+  compatible:
+    const: hynix,hi846
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Reference to the mclk clock.
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
+
+  reset-gpios:
+    description: Reference to the GPIO connected to the RESETB pin. Active low.
+    maxItems: 1
+
+  shutdown-gpios:
+    description: Reference to the GPIO connected to the XSHUTDOWN pin. Active low.
+    maxItems: 1
+
+  vddio-supply:
+    description: Definition of the regulator used for the VDDIO power supply.
+
+  vdda-supply:
+    description: Definition of the regulator used for the VDDA power supply.
+
+  vddd-supply:
+    description: Definition of the regulator used for the VDDD power supply.
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
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
+        required:
+          - data-lanes
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - assigned-clocks
+  - assigned-clock-rates
+  - vddio-supply
+  - vdda-supply
+  - vddd-supply
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
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_csi1>;
+            clocks = <&clk 0>;
+            assigned-clocks = <&clk 0>;
+            assigned-clock-rates = <25000000>;
+            vdda-supply = <&reg_camera_vdda>;
+            vddd-supply = <&reg_camera_vddd>;
+            vddio-supply = <&reg_camera_vddio>;
+            reset-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
+            shutdown-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
+
+            port {
+                camera_out: endpoint {
+                    remote-endpoint = <&csi1_ep1>;
+                    link-frequencies = /bits/ 64
+                        <80000000 200000000>;
+                    data-lanes = <1 2>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.30.2

