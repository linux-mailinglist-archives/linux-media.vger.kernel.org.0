Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6A14D890A
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 17:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242994AbiCNQ2l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 12:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241796AbiCNQ2k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 12:28:40 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E898BC06;
        Mon, 14 Mar 2022 09:27:28 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id DA521240009;
        Mon, 14 Mar 2022 16:27:24 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER),
        robh@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/8] media: dt-bindings: i2c: Document ov5670
Date:   Mon, 14 Mar 2022 17:27:07 +0100
Message-Id: <20220314162714.153970-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314162714.153970-1-jacopo@jmondi.org>
References: <20220314162714.153970-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide the bindings documentation for Omnivision OV5670 image sensor.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

---
v1->v2 (comments from Krzysztof)

- Rename to include manufacturer name
- Add entry to MAINTAINERS
- Add maxItems: to -gpios properties
- Use common clock properties
- Use enum: [1, 2] for data lanes
- Fix whitespace issue in example
---

 .../bindings/media/i2c/ovti,ov5670.yaml       | 99 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
new file mode 100644
index 000000000000..73cf72203f17
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov5670.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OV5670 5 Megapixels raw image sensor
+
+maintainers:
+  - Jacopo Mondi <jacopo@jmondi.org>
+
+description: |-
+  The OV5670 is a 5 Megapixels raw image sensor which provides images in 10-bits
+  RAW BGGR Bayer format on a 2 data lanes MIPI CSI-2 serial interface and is
+  controlled through an I2C compatible control bus.
+
+properties:
+  compatible:
+    const: ovti,ov5670
+
+  reg:
+    maxItems: 1
+
+  assigned-clocks: true
+  assigned-clock-parents: true
+  assigned-clock-rates: true
+
+  clocks:
+    description: System clock. From 6 to 27 MHz.
+    maxItems: 1
+
+  pwdn-gpios:
+    description: Reference to the GPIO connected to the PWDNB pin. Active low.
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      Reference to the GPIO connected to the XSHUTDOWN pin. Active low.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog circuit power. Typically 2.8V.
+
+  dvdd-supply:
+    description: Digital circuit power. Typically 1.2V.
+
+  dovdd-supply:
+    description: Digital I/O circuit power. Typically 2.8V or 1.8V.
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
+            description: The sensor supports 1 or 2 data lanes operations.
+            minItems: 1
+            maxItems: 2
+            items:
+              enum: [1, 2]
+
+          clock-noncontinuous: true
+
+required:
+  - compatible
+  - reg
+  - clocks
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
+        ov5670: sensor@36 {
+            compatible = "ovti,ov5670";
+            reg = <0x36>;
+            clocks = <&sensor_xclk>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&csi_ep>;
+                    data-lanes = <1 2>;
+                    clock-noncontinuous;
+                };
+            };
+        };
+    };
+
+...
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 83d27b57016f..6aa32609a3cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14259,6 +14259,7 @@ M:	Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
 F:	drivers/media/i2c/ov5670.c

 OMNIVISION OV5675 SENSOR DRIVER
--
2.35.1

