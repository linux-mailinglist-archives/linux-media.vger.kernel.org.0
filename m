Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C196929769E
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 20:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754529AbgJWSM5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 14:12:57 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:54454 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754481AbgJWSMm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 14:12:42 -0400
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id B37C93B1A9D;
        Fri, 23 Oct 2020 17:50:20 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id AB82640008;
        Fri, 23 Oct 2020 17:49:58 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add OV5648 bindings documentation
Date:   Fri, 23 Oct 2020 19:49:43 +0200
Message-Id: <20201023174944.504358-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023174944.504358-1-paul.kocialkowski@bootlin.com>
References: <20201023174944.504358-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This introduces YAML bindings documentation for the OV5648
image sensor.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../bindings/media/i2c/ovti,ov5648.yaml       | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
new file mode 100644
index 000000000000..347af925b450
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov5648.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV5648 Image Sensor Device Tree Bindings
+
+maintainers:
+  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+
+properties:
+  compatible:
+    const: ovti,ov5648
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XVCLK Clock
+
+  clock-names:
+    items:
+      - const: xvclk
+
+  dvdd-supply:
+    description: Digital Domain Power Supply
+
+  avdd-supply:
+    description: Analog Domain Power Supply (internal AVDD is used if missing)
+
+  dovdd-supply:
+    description: I/O Domain Power Supply
+
+  powerdown-gpios:
+    maxItems: 1
+    description: Power Down Pin GPIO Control (active low)
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active low)
+
+  port:
+    type: object
+    description: Input port, connect to a MIPI CSI-2 receiver
+
+    properties:
+      endpoint:
+        type: object
+
+        properties:
+          remote-endpoint: true
+
+          bus-type:
+            const: 4
+
+          clock-lanes:
+            maxItems: 1
+
+          data-lanes:
+            minItems: 1
+            maxItems: 2
+
+        required:
+          - bus-type
+          - data-lanes
+          - remote-endpoint
+
+        additionalProperties: false
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - dvdd-supply
+  - dovdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun8i-v3s-ccu.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ov5648: camera@36 {
+            compatible = "ovti,ov5648";
+            reg = <0x36>;
+
+            dvdd-supply = <&ov5648_dvdd>;
+            avdd-supply = <&ov5648_avdd>;
+            dovdd-supply = <&ov5648_dovdd>;
+            clocks = <&ov5648_xvclk 0>;
+            clock-names = "xvclk";
+
+            ov5648_out: port {
+                ov5648_out_mipi_csi2: endpoint {
+                    bus-type = <4>; /* MIPI CSI-2 D-PHY */
+                    clock-lanes = <0>;
+                    data-lanes = <1 2>;
+
+                    remote-endpoint = <&mipi_csi2_in_ov5648>;
+                };
+            };
+        };
+    };
-- 
2.28.0

