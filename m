Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70752220EB5
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 16:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732038AbgGOOGd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 10:06:33 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:38631 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732029AbgGOOGc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 10:06:32 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 53E28FF80E;
        Wed, 15 Jul 2020 14:06:28 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH 1/8] dt-bindings: media: ov5640: Convert to json-schema
Date:   Wed, 15 Jul 2020 16:09:44 +0200
Message-Id: <20200715140951.90753-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715140951.90753-1-jacopo+renesas@jmondi.org>
References: <20200715140951.90753-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the ov5640 bindings document to json-schema and update
the MAINTAINERS file accordingly.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
Hi Steve,
  I've added myself as maintainer in the bindings, with your ack
I would be happy to add myself as maintainer or reviewer for this driver
in MAINTAINERS, as I've recently been looking after this driver, mostly
for the MIPI CSI-2 interface part.

Thanks
  j

---
 .../devicetree/bindings/media/i2c/ov5640.txt  |  92 ---------
 .../devicetree/bindings/media/i2c/ov5640.yaml | 181 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 3 files changed, 182 insertions(+), 92 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.txt b/Documentation/devicetree/bindings/media/i2c/ov5640.txt
deleted file mode 100644
index c97c2f2da12d..000000000000
--- a/Documentation/devicetree/bindings/media/i2c/ov5640.txt
+++ /dev/null
@@ -1,92 +0,0 @@
-* Omnivision OV5640 MIPI CSI-2 / parallel sensor
-
-Required Properties:
-- compatible: should be "ovti,ov5640"
-- clocks: reference to the xclk input clock.
-- clock-names: should be "xclk".
-- DOVDD-supply: Digital I/O voltage supply, 1.8 volts
-- AVDD-supply: Analog voltage supply, 2.8 volts
-- DVDD-supply: Digital core voltage supply, 1.5 volts
-
-Optional Properties:
-- reset-gpios: reference to the GPIO connected to the reset pin, if any.
-	       This is an active low signal to the OV5640.
-- powerdown-gpios: reference to the GPIO connected to the powerdown pin,
-		   if any. This is an active high signal to the OV5640.
-- rotation: as defined in
-	    Documentation/devicetree/bindings/media/video-interfaces.txt,
-	    valid values are 0 (sensor mounted upright) and 180 (sensor
-	    mounted upside down).
-
-The device node must contain one 'port' child node for its digital output
-video port, in accordance with the video interface bindings defined in
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-OV5640 can be connected to a MIPI CSI-2 bus or a parallel bus endpoint.
-
-Endpoint node required properties for CSI-2 connection are:
-- remote-endpoint: a phandle to the bus receiver's endpoint node.
-- clock-lanes: should be set to <0> (clock lane on hardware lane 0)
-- data-lanes: should be set to <1> or <1 2> (one or two CSI-2 lanes supported)
-
-Endpoint node required properties for parallel connection are:
-- remote-endpoint: a phandle to the bus receiver's endpoint node.
-- bus-width: shall be set to <8> for 8 bits parallel bus
-	     or <10> for 10 bits parallel bus
-- data-shift: shall be set to <2> for 8 bits parallel bus
-	      (lines 9:2 are used) or <0> for 10 bits parallel bus
-- hsync-active: active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
-- vsync-active: active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
-- pclk-sample: sample data on rising (1) or falling (0) edge of the pixel clock
-	       signal.
-
-Examples:
-
-&i2c1 {
-	ov5640: camera@3c {
-		compatible = "ovti,ov5640";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_ov5640>;
-		reg = <0x3c>;
-		clocks = <&clks IMX6QDL_CLK_CKO>;
-		clock-names = "xclk";
-		DOVDD-supply = <&vgen4_reg>; /* 1.8v */
-		AVDD-supply = <&vgen3_reg>;  /* 2.8v */
-		DVDD-supply = <&vgen2_reg>;  /* 1.5v */
-		powerdown-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
-		rotation = <180>;
-
-		port {
-			/* MIPI CSI-2 bus endpoint */
-			ov5640_to_mipi_csi2: endpoint {
-				remote-endpoint = <&mipi_csi2_from_ov5640>;
-				clock-lanes = <0>;
-				data-lanes = <1 2>;
-			};
-		};
-	};
-};
-
-&i2c1 {
-	ov5640: camera@3c {
-		compatible = "ovti,ov5640";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_ov5640>;
-		reg = <0x3c>;
-		clocks = <&clk_ext_camera>;
-		clock-names = "xclk";
-
-		port {
-			/* Parallel bus endpoint */
-			ov5640_to_parallel: endpoint {
-				remote-endpoint = <&parallel_from_ov5640>;
-				bus-width = <8>;
-				data-shift = <2>; /* lines 9:2 are used */
-				hsync-active = <0>;
-				vsync-active = <0>;
-				pclk-sample = <1>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
new file mode 100644
index 000000000000..9c32262a3621
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
@@ -0,0 +1,181 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ov5640.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OV5640 MIPI CSI-2 / parallel sensor
+
+maintainers:
+  - Steve Longerbeam <slongerbeam@gmail.com>
+  - Jacopo Mondi <jacopo@jmondi.org>
+
+description: -|
+  OV5640 is a 5 megapixels image sensor capable of producing images in RBG, RAW,
+  YUV and compressed formats. It features a MIPI CSI-2 and a parallel data
+  interface and an I2C-compatible (CCI) control interface.
+
+properties:
+  compatible:
+    const: ovti,ov5640
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  clocks:
+    description: Reference to the xclk input clock.
+    maxItems: 1
+
+  clock-names:
+    description: Should be "xclk".
+    maxItems: 1
+
+  DOVDD-supply:
+    description: Digital I/O voltage supply, 1.8 volts.
+    maxItems: 1
+
+  AVDD-supply:
+    description: Analog voltage supply, 2.8 volts.
+    maxItems: 1
+
+  DVDD-supply:
+    description: Digital core voltage supply.
+    maxItems: 1
+
+  reset-gpios:
+    description: |
+      Reference to the GPIO connected to the reset pin, if any. This is an
+      active low signal to the OV5640.
+    maxItems: 1
+
+  powerdown-gpios:
+    description: |
+      Reference tot he GPIO connected to the powerdown pin, if any. This is an
+      active high signal to the OV5640.
+    maxItems: 1
+
+  rotation:
+    description: |
+      As defined in Documentation/devicetree/bindings/media/video-interfaces.txt,
+      valid values are 0 (sensor mounted upright) and 180 (sensor mounted upside
+      down).
+
+  port:
+    type: object
+    description: |
+      The device node must contain one 'port' child node for its digital output
+      video port, in accordance with the video interface bindings defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+      OV5640 can be connected to a MIPI CSI-2 bus or a parallel bus endpoint.
+
+    properties:
+      endpoint:
+        type: object
+        properties:
+          remote-endpoint:
+            description: A phandle to the bus receiver's endpoint node.
+
+          clock-lanes:
+            description: Should be set to 0 (clock lane on hardware lane 0).
+
+          data-lanes:
+            description: |
+              Should be set to <1> or <1 2> (one or two CSI-2 lanes supported).
+
+          bus-width:
+            description: |
+              Shall be set to <8> for 8 bits parallel bus or <10> for 10 bits
+              parallel bus.
+
+          data-shift:
+            description: |
+              Shall be set to <2> for 8 bits parallel bus (lines 9:2 are used) or
+              <0> for 10 bits parallel bus.
+
+          hsync-active:
+            description: |
+              Active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
+
+          vsync-active:
+            description: |
+              Active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
+
+          pclk-sample:
+            description: |
+              Sample data on rising (1) or falling (0) edge of the pixel clock
+              signal.
+
+        required:
+          - remote-endpoint
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - DOVDD-supply
+  - AVDD-supply
+  - DVDD-supply
+  - port
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/clock/imx6qdl-clock.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@3c {
+            compatible = "ovti,ov5640";
+            reg = <0x3c>;
+            clocks = <&clks IMX6QDL_CLK_CKO>;
+            clock-names = "xclk";
+            DOVDD-supply = <&vgen4_reg>; /* 1.8v */
+            AVDD-supply = <&vgen3_reg>;  /* 2.8v */
+            DVDD-supply = <&vgen2_reg>;  /* 1.5v */
+            powerdown-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
+            rotation = <180>;
+
+            port {
+                ov5640_to_mipi_csi2: endpoint {
+                    remote-endpoint = <&mipi_csi2_from_ov5640>;
+                    clock-lanes = <0>;
+                    data-lanes = <1 2>;
+                };
+            };
+        };
+    };
+
+    i2c1 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@3c {
+            compatible = "ovti,ov5640";
+            reg = <0x3c>;
+            clocks = <&clks IMX6QDL_CLK_CKO>;
+            clock-names = "xclk";
+            DOVDD-supply = <&vgen4_reg>; /* 1.8v */
+            AVDD-supply = <&vgen3_reg>;  /* 2.8v */
+            DVDD-supply = <&vgen2_reg>;  /* 1.5v */
+            powerdown-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
+            rotation = <180>;
+
+            port {
+                ov5640_to_parallel: endpoint {
+                    remote-endpoint = <&parallel_from_ov5640>;
+                    bus-width = <8>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index c74d25c58e1a..0160d7567ed3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12605,6 +12605,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov5640.c
+F:	Documentation/devicetree/bindings/media/i2c/ov5640.yaml

 OMNIVISION OV5647 SENSOR DRIVER
 M:	Jacopo Mondi <jacopo@jmondi.org>
--
2.27.0

