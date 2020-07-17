Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7F4C223C6D
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 15:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgGQNZl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 09:25:41 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:36237 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbgGQNZk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 09:25:40 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 63C811C000D;
        Fri, 17 Jul 2020 13:25:36 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 01/13] dt-bindings: media: ov5640: Convert to json-schema
Date:   Fri, 17 Jul 2020 15:28:47 +0200
Message-Id: <20200717132859.237120-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the ov5640 bindings document to json-schema.

This commit ports the existing bindings, clean up patches
will follow.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../devicetree/bindings/media/i2c/ov5640.txt  |  92 ---------
 .../devicetree/bindings/media/i2c/ov5640.yaml | 181 ++++++++++++++++++
 2 files changed, 181 insertions(+), 92 deletions(-)
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
index 000000000000..ceeacc91c801
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
+
+description: -|
+  The OV5640 is a 5 megapixels image sensor capable of producing images in RGB,
+  RAW, YUV and compressed formats. It features a MIPI CSI-2 and a parallel data
+  interface and an I2C-compatible (CCI) control interface.
+
+properties:
+  compatible:
+    const: ovti,ov5640
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: xclk
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
+      As defined in Documentation/devicetree/bindings/media/video-interfaces.txt
+    enum: [0, 180]
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
+            const: 0
+
+          data-lanes:
+            description: |
+              Should be set to <1> or <1 2> (one or two CSI-2 lanes supported).
+            oneOf:
+              - items:
+                - const: 1
+              - items:
+                - const: 1
+                - const: 2
+
+          bus-width:
+            description: |
+              Shall be set to <8> for 8 bits parallel bus or <10> for 10 bits
+              parallel bus.
+            enum: [8, 10]
+
+          data-shift:
+            description: |
+              Shall be set to <2> for 8 bits parallel bus (lines 9:2 are used) or
+              <0> for 10 bits parallel bus.
+            enum: [0, 2]
+
+          hsync-active:
+            enum: [0, 1]
+
+          vsync-active:
+            enum: [0, 1]
+
+          pclk-sample:
+            enum: [0, 1]
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
+                    bus-width = <10>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.27.0

