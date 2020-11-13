Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B102B213F
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 18:01:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgKMRBW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 12:01:22 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:37627 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgKMRBW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 12:01:22 -0500
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 71953E000B;
        Fri, 13 Nov 2020 17:01:17 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: Add OV5648 bindings documentation
Date:   Fri, 13 Nov 2020 18:01:03 +0100
Message-Id: <20201113170104.2252046-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201113170104.2252046-1-paul.kocialkowski@bootlin.com>
References: <20201113170104.2252046-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This introduces YAML bindings documentation for the OV5648
image sensor.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../bindings/media/i2c/ovti,ov5648.yaml       | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
new file mode 100644
index 000000000000..e259f5fab6ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
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
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
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
+    description: MIPI CSI-2 transmitter port
+
+    properties:
+      endpoint:
+        type: object
+
+        properties:
+          remote-endpoint: true
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
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - assigned-clocks
+  - assigned-clock-rates
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
+            assigned-clocks = <&ov5648_xvclk 0>;
+            assigned-clock-rates = <24000000>;
+
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

