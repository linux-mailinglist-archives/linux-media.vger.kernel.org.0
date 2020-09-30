Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38CC27F341
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 22:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730441AbgI3UTS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 16:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730117AbgI3UTR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 16:19:17 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB9A8C0613D2;
        Wed, 30 Sep 2020 13:19:16 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 74874634C8E;
        Wed, 30 Sep 2020 23:19:01 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [RESEND PATCH 023/100] dt-bindings: nokia,smia: Convert to YAML
Date:   Wed, 30 Sep 2020 23:19:11 +0300
Message-Id: <20200930201914.31377-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930201914.31377-1-sakari.ailus@linux.intel.com>
References: <20200930201914.31377-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert nokia,smia DT bindings to YAML.

Also add explicit license to bindings.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../bindings/media/i2c/nokia,smia.txt         |  68 --------
 .../bindings/media/i2c/nokia,smia.yaml        | 147 ++++++++++++++++++
 2 files changed, 147 insertions(+), 68 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt b/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
deleted file mode 100644
index 5ea4f799877b..000000000000
--- a/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
+++ /dev/null
@@ -1,68 +0,0 @@
-SMIA/SMIA++ sensor
-
-SMIA (Standard Mobile Imaging Architecture) is an image sensor standard
-defined jointly by Nokia and ST. SMIA++, defined by Nokia, is an extension
-of that. These definitions are valid for both types of sensors.
-
-More detailed documentation can be found in
-Documentation/devicetree/bindings/media/video-interfaces.txt .
-
-The device node should contain a "port" node which may contain one or more
-endpoint nodes, in accordance with video interface bindings defined in
-Documentation/devicetree/bindings/media/video-interfaces.txt .
-
-Mandatory properties
---------------------
-
-- compatible: "nokia,smia"
-- reg: I2C address (0x10, or an alternative address)
-- clocks: External clock to the sensor
-- clock-frequency: Frequency of the external clock to the sensor
-
-
-Optional properties
--------------------
-
-- reset-gpios: XSHUTDOWN GPIO
-- flash-leds: See ../video-interfaces.txt
-- lens-focus: See ../video-interfaces.txt
-- rotation: Integer property; valid values are 0 (sensor mounted upright)
-	    and 180 (sensor mounted upside down). See
-	    ../video-interfaces.txt .
-- vana-supply: Analogue voltage supply (VANA), typically 2,8 volts (sensor
-  dependent).
-
-
-Endpoint node mandatory properties
-----------------------------------
-
-- data-lanes: <1..n>
-- link-frequencies: List of allowed data link frequencies. An array of
-  64-bit elements.
-
-
-Example
--------
-
-&i2c2 {
-	clock-frequency = <400000>;
-
-	camera-sensor@10 {
-		compatible = "nokia,smia";
-		reg = <0x10>;
-		reset-gpios = <&gpio3 20 0>;
-		vana-supply = <&vaux3>;
-		clocks = <&omap3_isp 0>;
-		clock-frequency = <9600000>;
-		nokia,nvm-size = <512>; /* 8 * 64 */
-		port {
-			smiapp_ep: endpoint {
-				data-lanes = <1 2>;
-				remote-endpoint = <&csi2a_ep>;
-				link-frequencies =
-					/bits/ 64 <199200000 210000000
-						   499200000>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml b/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
new file mode 100644
index 000000000000..3d6f68b0e559
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2014--2020 Intel Corporation
+
+$id: http://devicetree.org/schemas/media/i2c/nokia,smia.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SMIA/SMIA++ sensor
+
+maintainers:
+  - Sakari Ailus <sakari.ailus@linux.intel.com>
+
+description:
+
+  SMIA (Standard Mobile Imaging Architecture) is an image sensor standard
+  defined jointly by Nokia and ST. SMIA++, defined by Nokia, is an extension of
+  that. These definitions are valid for both types of sensors.
+
+  More detailed documentation can be found in
+  Documentation/devicetree/bindings/media/video-interfaces.txt .
+
+properties:
+  compatible:
+    const: nokia,smia
+
+  reg:
+    maxItems: 1
+
+  vana-supply:
+    description: Analogue voltage supply (VANA), typically 2,8 volts (sensor
+      dependent).
+    maxItems: 1
+
+  clocks:
+    description: External clock to the sensor.
+    maxItems: 1
+
+  clock-frequency:
+    description: Frequency of the external clock to the sensor.
+
+  reset-gpios:
+    description: Reset GPIO. Also commonly called XSHUTDOWN in hardware
+      documentation.
+    maxItems: 1
+
+  flash-leds:
+    description: Flash LED phandles. See ../video-interfaces.txt for details.
+
+  lens-focus:
+    description: Lens focus controller phandles. See ../video-interfaces.txt
+      for details.
+
+  rotation:
+    description: Rotation; either 0 or 180 degrees.
+
+  port:
+    type: object
+    properties:
+      endpoint:
+        type: object
+        properties:
+          link-frequencies:
+            $ref: /schemas/types.yaml#/definitions/uint64-array
+            description: List of allowed data link frequencies. An array of
+              64-bit elements.
+          data-lanes:
+            oneOf:
+              - items:
+                - const: 1
+              - items:
+                - const: 1
+                - const: 2
+              - items:
+                - const: 1
+                - const: 2
+                - const: 3
+              - items:
+                - const: 1
+                - const: 2
+                - const: 3
+                - const: 4
+              - items:
+                - const: 1
+                - const: 2
+                - const: 3
+                - const: 4
+                - const: 5
+              - items:
+                - const: 1
+                - const: 2
+                - const: 3
+                - const: 4
+                - const: 5
+                - const: 6
+              - items:
+                - const: 1
+                - const: 2
+                - const: 3
+                - const: 4
+                - const: 5
+                - const: 6
+                - const: 7
+              - items:
+                - const: 1
+                - const: 2
+                - const: 3
+                - const: 4
+                - const: 5
+                - const: 6
+                - const: 7
+                - const: 8
+        required:
+          - link-frequencies
+          - data-lanes
+
+required:
+  - compatible
+  - reg
+  - clock-frequency
+  - clocks
+
+examples:
+  - |
+    i2c2 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        clock-frequency = <400000>;
+
+        camera-sensor@10 {
+            compatible = "nokia,smia";
+            reg = <0x10>;
+            reset-gpios = <&gpio3 20 0>;
+            vana-supply = <&vaux3>;
+            clocks = <&omap3_isp 0>;
+            clock-frequency = <9600000>;
+            nokia,nvm-size = <512>; /* 8 * 64 */
+            port {
+                smiapp_ep: endpoint {
+                    data-lanes = <1 2>;
+                    remote-endpoint = <&csi2a_ep>;
+                    link-frequencies = /bits/ 64 <199200000 210000000
+                                                  499200000>;
+                };
+            };
+        };
+    };
+...
-- 
2.27.0

