Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E943255AFE
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 15:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729507AbgH1NMT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 09:12:19 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:38783 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729410AbgH1NLq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 09:11:46 -0400
X-Originating-IP: 90.89.180.255
Received: from lhopital-XPS-13-9360.home (lfbn-tou-1-1372-bdcst.w90-89.abo.wanadoo.fr [90.89.180.255])
        (Authenticated sender: kevin.lhopital@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPA id D7B93C0012;
        Fri, 28 Aug 2020 13:11:42 +0000 (UTC)
From:   =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mripard@kernel.org, wens@csie.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com,
        =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
Subject: [PATCH v2 1/3] dt-bindings: media: i2c: Add documentation for ov8865
Date:   Fri, 28 Aug 2020 15:11:32 +0200
Message-Id: <20200828131134.12113-2-kevin.lhopital@bootlin.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828131134.12113-1-kevin.lhopital@bootlin.com>
References: <20200828131134.12113-1-kevin.lhopital@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a documentation for the sensor ov8865 from Omnivision.

Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
---
 .../devicetree/bindings/media/i2c/ov8865.yaml | 165 ++++++++++++++++++
 1 file changed, 165 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8865.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ov8865.yaml
new file mode 100644
index 000000000000..468ddfd48c7a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov8865.yaml
@@ -0,0 +1,165 @@
+# SPDX-License-Identifier: (GPL-2.0 0R BSD-2-Clause)
+# Copyright (C) 2020 Kévin L'hôpital
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ov8865.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OV8865 Sensor Device Tree Bindings
+
+maintainers:
+  - Kévin L'hôpital <kevin.lhopital@bootlin.com>
+
+description: |-
+  The Omnivision OV8865 is a image sensor that supports up to 3264x2448. It
+  provides a 10 bits output format and a MIPI CSI2 interface (up to 4-lane).
+  This chip is programmable through I2C.
+
+properties:
+  compatible:
+    const: ovti,ov8865
+
+  reg:
+    maxItems: 1
+
+  pinctrl-names:
+    description:
+      Default name for the ov8865 pinctrl.
+
+  pinctrl-0:
+    description:
+      Pinctrl for the ov8865.
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    description:
+      Input clock name for the sensor.
+
+    items:
+      - const: xclk
+
+  avdd-supply:
+    description:
+      Definition of the regulator used as analog power supply.
+
+  dovdd-supply:
+    description:
+      Definition of the regulator used as interface power supply.
+
+  vdd2-supply:
+    description:
+      Definition of the regulator used as digital power supply
+
+  afvdd-supply:
+    description:
+      Definition of the regulator used as actuator power supply.
+
+  powerdown-gpios:
+    description:
+      reference to the GPIO connceted to the powerdown pin. This is an active
+      low signal on the OV8865.
+
+  reset-gpios:
+    description:
+      Reference to the GPIO connected to the reset pin. This is an active low
+      signal for the OV8865.
+
+  rotation:
+    description:
+      Position of the sensor, the valid values are 0 (sensor mounted upright)
+      and 180 (sensor mounted upside down).
+
+  port:
+    type: object
+    additionalProperties: false
+    description:
+      A node containing an output port node with an endpoint definition as
+      documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+
+    properties:
+      endpoint:
+        type: object
+
+        properties:
+          data-lanes:
+            description:
+              The driver only supports four-lane operation.
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+
+          clock-lanes:
+            items:
+              const: 0
+
+          bus-type:
+            description:
+              The driver only supports the MIPI CSI2
+            items:
+              const: 4
+
+        required:
+          - data-lanes
+          - clock-lanes
+          - bus-type
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - pinctrl-names
+  - pinctrl-0
+  - clocks
+  - clock-names
+  - avdd-supply
+  - dovdd-supply
+  - vdd2-supply
+  - afvdd-supply
+  - powerdown-gpios
+  - reset-gpios
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
+         #address-cells = <1>;
+         #size-cells = <0>;
+          ov8865: camera@36 {
+                 compatible = "ovti,ov8865";
+                 reg = <0x36>;
+                 pinctrl-names = "default";
+                 pinctrl-0 = <&csi_mclk_pin>; 
+                 clocks = <&ccu CLK_CSI_MCLK>;
+                 clock-names ="xclk";
+                 avdd-supply = <&reg_ov8865_avdd>;
+                 dovdd-supply = <&reg_ov8865_dovdd>;
+                 vdd2-supply = <&reg_ov8865_vdd2>;
+                 afvdd-supply = <&reg_ov8865_afvdd>;
+                 powerdown-gpios = <&pio 4 17 GPIO_ACTIVE_LOW>; /* PE17 */
+                 reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
+                 rotation = <180>;
+
+                 port {
+                      ov8865_to_mipi_csi2: endpoint {
+                                 remote-endpoint = <&mipi_csi2_from_ov8865>;
+                                 data-lanes = <1 2 3 4>;
+                                 clock-lanes = <0>;
+                                 bus-type = <4>; /* V4L2_FWNODE_BUS_TYPE_CSI2_DPHY */
+                      };
+                 };
+           };
+    };
+
+...
-- 
2.17.1

