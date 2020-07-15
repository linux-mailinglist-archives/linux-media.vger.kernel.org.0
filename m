Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8D1220EC2
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 16:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732061AbgGOOGl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 10:06:41 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:59171 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732042AbgGOOGj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 10:06:39 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 475DFFF81A;
        Wed, 15 Jul 2020 14:06:35 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 4/8] dt-bindings: media: imx290: Convert to json-schema
Date:   Wed, 15 Jul 2020 16:09:47 +0200
Message-Id: <20200715140951.90753-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715140951.90753-1-jacopo+renesas@jmondi.org>
References: <20200715140951.90753-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the imx290 bindings document to json-schema and update
the MAINTAINERS file accordingly.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../devicetree/bindings/media/i2c/imx290.txt  |  57 --------
 .../devicetree/bindings/media/i2c/imx290.yaml | 124 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 125 insertions(+), 58 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/imx290.txt b/Documentation/devicetree/bindings/media/i2c/imx290.txt
deleted file mode 100644
index a3cc21410f7c..000000000000
--- a/Documentation/devicetree/bindings/media/i2c/imx290.txt
+++ /dev/null
@@ -1,57 +0,0 @@
-* Sony IMX290 1/2.8-Inch CMOS Image Sensor
-
-The Sony IMX290 is a 1/2.8-Inch CMOS Solid-state image sensor with
-Square Pixel for Color Cameras. It is programmable through I2C and 4-wire
-interfaces. The sensor output is available via CMOS logic parallel SDR output,
-Low voltage LVDS DDR output and CSI-2 serial data output. The CSI-2 bus is the
-default. No bindings have been defined for the other busses.
-
-Required Properties:
-- compatible: Should be "sony,imx290"
-- reg: I2C bus address of the device
-- clocks: Reference to the xclk clock.
-- clock-names: Should be "xclk".
-- clock-frequency: Frequency of the xclk clock in Hz.
-- vdddo-supply: Sensor digital IO regulator.
-- vdda-supply: Sensor analog regulator.
-- vddd-supply: Sensor digital core regulator.
-
-Optional Properties:
-- reset-gpios: Sensor reset GPIO
-
-The imx290 device node should contain one 'port' child node with
-an 'endpoint' subnode. For further reading on port node refer to
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Required Properties on endpoint:
-- data-lanes: check ../video-interfaces.txt
-- link-frequencies: check ../video-interfaces.txt
-- remote-endpoint: check ../video-interfaces.txt
-
-Example:
-	&i2c1 {
-		...
-		imx290: camera-sensor@1a {
-			compatible = "sony,imx290";
-			reg = <0x1a>;
-
-			reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&camera_rear_default>;
-
-			clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
-			clock-names = "xclk";
-			clock-frequency = <37125000>;
-
-			vdddo-supply = <&camera_vdddo_1v8>;
-			vdda-supply = <&camera_vdda_2v8>;
-			vddd-supply = <&camera_vddd_1v5>;
-
-			port {
-				imx290_ep: endpoint {
-					data-lanes = <1 2 3 4>;
-					link-frequencies = /bits/ 64 <445500000>;
-					remote-endpoint = <&csiphy0_ep>;
-				};
-			};
-		};
diff --git a/Documentation/devicetree/bindings/media/i2c/imx290.yaml b/Documentation/devicetree/bindings/media/i2c/imx290.yaml
new file mode 100644
index 000000000000..f40e349d4b70
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imx290.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/imx290.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX290 1/2.8-Inch CMOS Image Sensor
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description: -|
+  The Sony IMX290 is a 1/2.8-Inch CMOS Solid-state image sensor with
+  Square Pixel for Color Cameras. It is programmable through I2C and 4-wire
+  interfaces. The sensor output is available via CMOS logic parallel SDR output,
+  Low voltage LVDS DDR output and CSI-2 serial data output. The CSI-2 bus is the
+  default. No bindings have been defined for the other busses.
+
+properties:
+  compatible:
+    const: sony,imx290
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  clocks:
+    description: Reference to the xclk clock.
+    maxItems: 1
+
+  clock-names:
+    description: Should be "xclk".
+    maxItems: 1
+
+  clock-frequency:
+    description: Frequency of the xclk clock in Hz.
+
+  reset-gpios:
+    description: Sensor reset GPIO.
+    maxItems: 1
+
+  vdddo-supply:
+    description: Sensor digital IO regulator.
+    maxItems: 1
+
+  vdda-supply:
+    description: Sensor analog regulator.
+    maxItems: 1
+
+  vddd-supply:
+    description: Sensor digital core regulator.
+    maxItems: 1
+
+  port:
+    type: object
+    description: |
+      The device node must contain one 'port' child node for its digital output
+      video port, in accordance with the video interface bindings defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+    properties:
+      endpoint:
+        type: object
+        properties:
+          remote-endpoint:
+            description: check ../video-interfaces.txt
+
+          data-lanes:
+            description: check ../video-interfaces.txt
+
+          link-frequencies:
+            description: check ../video-interfaces.txt
+
+        required:
+          - remote-endpoint
+          - data-lanes
+          - link-frequencies
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - clock-frequency
+  - vdddo-supply
+  - vdda-supply
+  - vddd-supply
+  - port
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        imx290: camera-sensor@1a {
+            compatible = "sony,imx290";
+            reg = <0x1a>;
+
+            reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
+
+            clocks = <&camera_clk>;
+            clock-names = "xclk";
+            clock-frequency = <37125000>;
+
+            vdddo-supply = <&camera_vdddo_1v8>;
+            vdda-supply = <&camera_vdda_2v8>;
+            vddd-supply = <&camera_vddd_1v5>;
+
+            port {
+                imx290_ep: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <445500000>;
+                    remote-endpoint = <&csiphy0_ep>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 895fff95fd32..8f9b94aaea84 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15930,7 +15930,7 @@ M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/imx290.txt
+F:	Documentation/devicetree/bindings/media/i2c/imx290.yaml
 F:	drivers/media/i2c/imx290.c

 SONY IMX319 SENSOR DRIVER
--
2.27.0

