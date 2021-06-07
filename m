Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D126B39DA31
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 12:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbhFGKyb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 06:54:31 -0400
Received: from comms.puri.sm ([159.203.221.185]:53050 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230519AbhFGKya (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Jun 2021 06:54:30 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 4847FE0053;
        Mon,  7 Jun 2021 03:52:39 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id v42KR8C6YYmv; Mon,  7 Jun 2021 03:52:34 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm, krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, pavel@ucw.cz
Cc:     devicetree@vger.kernel.org, kernel@puri.sm,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnx.tu@intel.com
Subject: [PATCH v4 2/5] dt-bindings: media: document SK Hynix Hi-846 MIPI CSI-2 8M pixel sensor
Date:   Mon,  7 Jun 2021 12:52:10 +0200
Message-Id: <20210607105213.1211722-3-martin.kepplinger@puri.sm>
In-Reply-To: <20210607105213.1211722-1-martin.kepplinger@puri.sm>
References: <20210607105213.1211722-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the bindings used for the SK Hynix Hi-846 CMOS camera driver.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 .../bindings/media/i2c/hynix,hi846.yaml       | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
new file mode 100644
index 000000000000..19825392fb1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
@@ -0,0 +1,105 @@
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
+  reset-gpios:
+    description: Reference to the GPIO connected to the RESETB pin. Active low.
+    maxItems: 1
+
+  shutdown-gpios:
+    description: Reference to the GPIO connected to the XSHUTDOWN pin. Active low.
+    maxItems: 1
+
+  vddi-supply:
+    description: Definition of the regulator used for the 1.8V or 2.8V I/O power supply.
+
+  vdda-supply:
+    description: Definition of the regulator used for the 2.8V analog power supply.
+
+  vddd-supply:
+    description: Definition of the regulator used for the 1.2V core power supply.
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
+  - vddi-supply
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
+            clocks = <&clk>;
+            vddi-supply = <&reg_camera_pwr_en>;
+            vdda-supply = <&reg_camera_pwr_en>;
+            vddd-supply = <&reg_camera_pwr_en>;
+            reset-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
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

