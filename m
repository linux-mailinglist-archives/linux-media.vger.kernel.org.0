Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22BD3285ABA
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727668AbgJGIpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgJGIpJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:45:09 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA28AC061755;
        Wed,  7 Oct 2020 01:45:08 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id C64EF634C8E;
        Wed,  7 Oct 2020 11:44:24 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v2 023/106] dt-bindings: nokia,smia: Convert to YAML
Date:   Wed,  7 Oct 2020 11:45:00 +0300
Message-Id: <20201007084505.25761-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert nokia,smia DT bindings to YAML.

Also add explicit license to bindings.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../bindings/media/i2c/nokia,smia.txt         |  67 -----------
 .../bindings/media/i2c/nokia,smia.yaml        | 106 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 107 insertions(+), 68 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt b/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
deleted file mode 100644
index 5f39a7070c51..000000000000
--- a/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
+++ /dev/null
@@ -1,67 +0,0 @@
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
index 000000000000..ee552489fa2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
@@ -0,0 +1,106 @@
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
+    description: Frequency of the external clock to the sensor in Hz.
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
+    description: Rotation of the sensor.  See ../video-interfaces.txt for
+      details.
+    enum: [ 0, 180 ]
+
+  port:
+    type: object
+    properties:
+      endpoint:
+        type: object
+        properties:
+          link-frequencies:
+            $ref: /schemas/types.yaml#/definitions/uint64-array
+            description: List of allowed data link frequencies.
+          data-lanes:
+            minItems: 1
+            maxItems: 8
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
+additionalProperties: false
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
diff --git a/MAINTAINERS b/MAINTAINERS
index f604993cead9..ec99e94e2273 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11564,7 +11564,7 @@ MIPI CCS, SMIA AND SMIA++ IMAGE SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
+F:	Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
 F:	drivers/media/i2c/ccs/
 F:	drivers/media/i2c/smiapp-pll.c
 F:	drivers/media/i2c/smiapp-pll.h
-- 
2.27.0

