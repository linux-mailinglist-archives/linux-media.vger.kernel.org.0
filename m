Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6300A2B2169
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 18:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbgKMRE2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 12:04:28 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:60233 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbgKMRE1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 12:04:27 -0500
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id ECDB7E0010;
        Fri, 13 Nov 2020 17:04:22 +0000 (UTC)
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
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
Subject: [PATCH v2 1/3] dt-bindings: media: i2c: Add OV8865 bindings documentation
Date:   Fri, 13 Nov 2020 18:03:42 +0100
Message-Id: <20201113170344.2252234-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201113170344.2252234-1-paul.kocialkowski@bootlin.com>
References: <20201113170344.2252234-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This introduces YAML bindings documentation for the OV8865
image sensor.

Co-developed-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../bindings/media/i2c/ovti,ov8865.yaml       | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
new file mode 100644
index 000000000000..47af90d6ebea
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov8865.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV8865 Image Sensor Device Tree Bindings
+
+maintainers:
+  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+
+properties:
+  compatible:
+    const: ovti,ov8865
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: EXTCLK Clock
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
+            maxItems: 4
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
+    #include <dt-bindings/clock/sun8i-a83t-ccu.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c2 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ov8865: camera@36 {
+            compatible = "ovti,ov8865";
+            reg = <0x36>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&csi_mclk_pin>;
+
+            clocks = <&ccu CLK_CSI_MCLK>;
+            assigned-clocks = <&ccu CLK_CSI_MCLK>;
+            assigned-clock-rates = <24000000>;
+
+            avdd-supply = <&reg_ov8865_avdd>;
+            dovdd-supply = <&reg_ov8865_dovdd>;
+            dvdd-supply = <&reg_ov8865_dvdd>;
+
+            powerdown-gpios = <&pio 4 17 GPIO_ACTIVE_LOW>; /* PE17 */
+            reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
+
+            port {
+                ov8865_out_mipi_csi2: endpoint {
+                    bus-type = <4>; /* MIPI CSI-2 D-PHY */
+                    clock-lanes = <0>;
+                    data-lanes = <1 2 3 4>;
+
+                    remote-endpoint = <&mipi_csi2_in_ov8865>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.28.0

