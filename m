Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F25816191D1
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 08:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiKDH0T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 03:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbiKDH0S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 03:26:18 -0400
Received: from out29-73.mail.aliyun.com (out29-73.mail.aliyun.com [115.124.29.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCAD92792D;
        Fri,  4 Nov 2022 00:26:15 -0700 (PDT)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1124278|-1;BR=01201311R191S10rulernew998_84748_2000303;CH=blue;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0170385-0.00343638-0.979525;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047190;MF=lee@arducam.com;NM=1;PH=DS;RN=6;RT=6;SR=0;TI=SMTPD_---.Q.Cujoe_1667546762;
Received: from localhost(mailfrom:lee@arducam.com fp:SMTPD_---.Q.Cujoe_1667546762)
          by smtp.aliyun-inc.com;
          Fri, 04 Nov 2022 15:26:03 +0800
Date:   Fri, 4 Nov 2022 15:26:01 +0800
From:   lee <lee@arducam.com>
To:     linux-media@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX519 CMOS sensor
 binding
Message-ID: <20221104152601.000035fd@arducam.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add YAML device tree binding for IMX519 CMOS image sensor, and
the relevant MAINTAINERS entries.

Signed-off-by: Lee Jackson <lee@arducam.com>
---
 .../bindings/media/i2c/sony,imx519.yaml       | 107 ++++++++++++++++++
 MAINTAINERS                                   |   9 ++
 2 files changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
new file mode 100644
index 000000000000..9b6cda96f613
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx519.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony 1/2.5-Inch 16Mpixel CMOS Digital Image Sensor
+
+maintainers:
+  - Lee Jackson <lee@arducam.com>
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
+port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            description: |-
+              The driver only supports two-lane operation.
+            items:
+              - const: 1
+              - const: 2
+
+          clock-noncontinuous: true
+          link-frequencies: true
+
+        required:
+          - data-lanes
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
index e04d944005ba..5a617ab8c9b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19236,6 +19236,15 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
 F:	drivers/media/i2c/imx412.c
 
+SONY IMX519 SENSOR DRIVER
+M:	Arducam Kernel Maintenance <info@arducam.com>
+M:	Lee Jackson <lee@arducam.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
+F:	drivers/media/i2c/imx519.c
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>
-- 
2.25.1
