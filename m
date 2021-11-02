Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F03C0442936
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 09:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbhKBIVy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 2 Nov 2021 04:21:54 -0400
Received: from out28-195.mail.aliyun.com ([115.124.28.195]:58029 "EHLO
        out28-195.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhKBIVt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 04:21:49 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1790368|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0124239-0.0022158-0.98536;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047202;MF=info@arducam.com;NM=1;PH=DS;RN=2;RT=2;SR=0;TI=SMTPD_---.LmBj75k_1635841153;
Received: from smtpclient.apple(mailfrom:info@arducam.com fp:SMTPD_---.LmBj75k_1635841153)
          by smtp.aliyun-inc.com(10.147.41.158);
          Tue, 02 Nov 2021 16:19:13 +0800
From:   Arducam info <info@arducam.com>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add IMX519 CMOS sensor binding 
Message-Id: <38FCC5C9-9D03-4C8B-9ADF-896AE2BD90DE@arducam.com>
Date:   Tue, 2 Nov 2021 16:19:12 +0800
Cc:     Arducam info <info@arducam.com>
To:     linux-media@vger.kernel.org
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add YAML device tree binding for IMX519 CMOS image sensor, and
the relevant MAINTAINERS entries.

Signed-off-by: Lee Jackson <info@arducam.com>
---
 .../devicetree/bindings/media/i2c/imx519.yaml | 113 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 2 files changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx519.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/imx519.yaml b/Documentation/devicetree/bindings/media/i2c/imx519.yaml
new file mode 100644
index 000000000000..717230a21764
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imx519.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/imx519.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony 1/2.5-Inch 16Mpixel CMOS Digital Image Sensor
+
+maintainers:
+  - Lee Jackson <info@arducam.com>
+
+description: |-
+  The Sony IMX519 is a 1/2.5-inch CMOS active pixel digital image sensor
+  with an active array size of 4656H x 3496V. It is programmable through
+  I2C interface. The I2C address is fixed to 0x1A as per sensor data sheet.
+  Image data is sent through MIPI CSI-2, which is configured as either 2 or
+  4 data lanes.
+
+properties:
+  compatible:
+    const: sony,imx519
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  VDIG-supply:
+    description:
+      Digital I/O voltage supply, 1.05 volts
+
+  VANA-supply:
+    description:
+      Analog voltage supply, 2.8 volts
+
+  VDDL-supply:
+    description:
+      Digital core voltage supply, 1.8 volts
+
+  reset-gpios:
+    description: |-
+      Reference to the GPIO connected to the xclr pin, if any.
+      Must be released (set high) after all supplies and INCK are applied.
+
+  # See ../video-interfaces.txt for more details
+  port:
+    type: object
+    properties:
+      endpoint:
+        type: object
+        properties:
+          data-lanes:
+            description: |-
+              The sensor supports either two-lane, or four-lane operation.
+              For two-lane operation the property must be set to <1 2>.
+            items:
+              - const: 1
+              - const: 2
+
+          clock-noncontinuous:
+            type: boolean
+            description: |-
+              MIPI CSI-2 clock is non-continuous if this property is present,
+              otherwise it's continuous.
+
+          link-frequencies:
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint64-array
+            description:
+              Allowed data bus frequencies.
+
+        required:
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - VANA-supply
+  - VDIG-supply
+  - VDDL-supply
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
+        imx519: sensor@1a {
+            compatible = "sony,imx519";
+            reg = <0x1a>;
+            clocks = <&imx519_clk>;
+            VANA-supply = <&imx519_vana>;   /* 2.8v */
+            VDIG-supply = <&imx519_vdig>;   /* 1.05v */
+            VDDL-supply = <&imx519_vddl>;   /* 1.8v */
+
+            port {
+                imx519_0: endpoint {
+                    remote-endpoint = <&csi1_ep>;
+                    data-lanes = <1 2>;
+                    clock-noncontinuous;
+                    link-frequencies = /bits/ 64 <493500000>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ee91c5472bc1..5db23bde7e73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17492,6 +17492,14 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
 F:	drivers/media/i2c/imx412.c
 
+SONY IMX519 SENSOR DRIVER
+M:	Arducam Kernel Maintenance <info@arducam.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/imx519.yaml
+F:	drivers/media/i2c/imx519.c
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>
-- 
2.17.1

