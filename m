Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2174D47BC
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 14:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242289AbiCJNJt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 08:09:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233180AbiCJNJs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 08:09:48 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9EA644771;
        Thu, 10 Mar 2022 05:08:46 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id DBF4F20009;
        Thu, 10 Mar 2022 13:08:42 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER),
        robh@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/6] media: dt-bindings: i2c: Document ov5670
Date:   Thu, 10 Mar 2022 14:08:24 +0100
Message-Id: <20220310130829.96001-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310130829.96001-1-jacopo@jmondi.org>
References: <20220310130829.96001-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide the bindings documentation for Omnivision OV5670 image sensor.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../devicetree/bindings/media/i2c/ov5670.yaml | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5670.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ov5670.yaml
new file mode 100644
index 000000000000..dc4a3297bf6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov5670.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ov5670.yaml#
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
+  clock-frequency:
+    description: Frequency of the xclk clock.
+
+  pwdn-gpios:
+    description: Reference to the GPIO connected to the PWDNB pin. Active low.
+
+  reset-gpios:
+    description:
+      Reference to the GPIO connected to the XSHUTDOWN pin. Active low.
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
+              maximum: 2
+
+          clock-noncontinuous: true
+
+required:
+  - compatible
+  - reg
+  - clock-frequency
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
+
+            clock-frequency=<19200000>;
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
--
2.35.1

