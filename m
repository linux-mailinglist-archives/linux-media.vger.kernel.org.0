Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C499647AF5
	for <lists+linux-media@lfdr.de>; Fri,  9 Dec 2022 01:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbiLIAtC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Dec 2022 19:49:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbiLIAs5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Dec 2022 19:48:57 -0500
Received: from out28-74.mail.aliyun.com (out28-74.mail.aliyun.com [115.124.28.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D60A5045;
        Thu,  8 Dec 2022 16:48:55 -0800 (PST)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.0852604|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0155697-0.00428494-0.980145;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047201;MF=lee.jackson@arducam.com;NM=0;PH=DS;RN=6;RT=5;SR=0;TI=SMTPD_---.QRbCchF_1670546913;
Received: from localhost(mailfrom:lee.jackson@arducam.com fp:SMTPD_---.QRbCchF_1670546913)
          by smtp.aliyun-inc.com;
          Fri, 09 Dec 2022 08:48:33 +0800
Date:   Fri, 9 Dec 2022 08:48:31 +0800
From:   Lee Jackson <lee.jackson@arducam.com>
To:     linux-media@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de
Subject: [PATCH v5 1/2] dt-bindings: media: i2c: Add IMX519 CMOS sensor
 binding
Message-ID: <20221209084831.000048ab@arducam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,FROM_WSP_TRAIL,
        HEADER_FROM_DIFFERENT_DOMAINS,INVALID_MSGID,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Add YAML device tree binding for IMX519 CMOS image sensor, and
the relevant MAINTAINERS entries.

Signed-off-by: Lee Jackson <lee.jackson@arducam.com>
---
 .../bindings/media/i2c/sony,imx519.yaml       | 107 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 2 files changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
new file mode 100644
index 000000000000..d7ca16cfbacc
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
+  - Lee Jackson <lee.jackson@arducam.com>
+
+description: 
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
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  vdig-supply:
+    description:
+      Digital I/O voltage supply, 1.05 volts
+
+  vana-supply:
+    description:
+      Analog voltage supply, 2.8 volts
+
+  vddl-supply:
+    description:
+      Digital core voltage supply, 1.8 volts
+
+  reset-gpios:
+    description: 
+      Reference to the GPIO connected to the xclr pin, if any.
+      Must be released (set high) after all supplies and INCK are applied.
+
+  port:
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
+            anyOf:
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vana-supply
+  - vdig-supply
+  - vddl-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        imx519: sensor@1a {
+            compatible = "sony,imx519";
+            reg = <0x1a>;
+            clocks = <&imx519_clk>;
+            vana-supply = <&imx519_vana>;   /* 2.8v */
+            vdig-supply = <&imx519_vdig>;   /* 1.05v */
+            vddl-supply = <&imx519_vddl>;   /* 1.8v */
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
index 046ff06ff97f..1fe906632209 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19232,6 +19232,14 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
 F:	drivers/media/i2c/imx412.c
 
+SONY IMX519 SENSOR DRIVER
+M:	Arducam Kernel Maintenance <info@arducam.com>
+M:	Lee Jackson <lee.jackson@arducam.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>
-- 
2.34.1
