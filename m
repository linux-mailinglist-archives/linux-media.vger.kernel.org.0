Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4234F2C7089
	for <lists+linux-media@lfdr.de>; Sat, 28 Nov 2020 19:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733202AbgK1SAW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Nov 2020 13:00:22 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:40678 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729856AbgK1R6U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Nov 2020 12:58:20 -0500
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 938E93B5436;
        Sat, 28 Nov 2020 14:34:19 +0000 (UTC)
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id A7D2D240003;
        Sat, 28 Nov 2020 14:33:57 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: media: i2c: Add OV5648 bindings documentation
Date:   Sat, 28 Nov 2020 15:33:49 +0100
Message-Id: <20201128143350.531460-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201128143350.531460-1-paul.kocialkowski@bootlin.com>
References: <20201128143350.531460-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This introduces YAML bindings documentation for the OV5648
image sensor.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/i2c/ovti,ov5648.yaml       | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
new file mode 100644
index 000000000000..f8783f77cc54
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
@@ -0,0 +1,115 @@
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
+          link-frequencies:
+            $ref: /schemas/types.yaml#/definitions/uint64-array
+            description: Allowed MIPI CSI-2 link frequencies
+
+          data-lanes:
+            minItems: 1
+            maxItems: 2
+
+        required:
+          - data-lanes
+          - link-frequencies
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
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <210000000 168000000>;
+
+                    remote-endpoint = <&mipi_csi2_in_ov5648>;
+                };
+            };
+        };
+    };
-- 
2.29.2

