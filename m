Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A53FB5FFD74
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 08:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbiJPGPx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 02:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbiJPGPv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 02:15:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC19E3685D;
        Sat, 15 Oct 2022 23:15:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D09E2491;
        Sun, 16 Oct 2022 08:15:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665900949;
        bh=Sxn9akORqI6hGX8uM1EyevUEWtQBeJcY2vn2x5Q4QS4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dKZ6hqZjOzf/wrBaJOxlmi4ORjQ3yVu3bZiWO+dZ2L6HdS0C3uB9DFsZcexOlask6
         WYPK+gRLn9gSNFm6NbJh/T9Hl26pG6amtF0tQG24W2s/IwsK0JLWmeaJsxAGbsPswz
         CzTSEYQhRxEElh9LDxBQjvfyYyZAK4wyDs8NqV5w=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 01/20] media: dt-bindings: Convert imx290.txt to YAML
Date:   Sun, 16 Oct 2022 09:15:04 +0300
Message-Id: <20221016061523.30127-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
References: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the Sony IMX290 DT binding from text to YAML. Add Manivannan as
a maintainer given that he is listed in MAINTAINERS for the file, as
volunteering myself.

The name of the input clock, "xclk", is wrong as the hardware manual
names it INCK. As the device has a single clock, the name could be
omitted, but that would require a corresponding change to the driver and
is thus a candidate for further patches.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/media/i2c/imx290.txt  |  57 --------
 .../bindings/media/i2c/sony,imx290.yaml       | 129 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 130 insertions(+), 58 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml

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
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
new file mode 100644
index 000000000000..21377daae026
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx290.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX290 1/2.8-Inch CMOS Image Sensor
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+description: |-
+  The Sony IMX290 is a 1/2.8-Inch CMOS Solid-state image sensor with Square
+  Pixel for Color Cameras. It is programmable through I2C and 4-wire
+  interfaces. The sensor output is available via CMOS logic parallel SDR
+  output, Low voltage LVDS DDR output and CSI-2 serial data output. The CSI-2
+  bus is the default. No bindings have been defined for the other busses.
+
+properties:
+  compatible:
+    enum:
+      - sony,imx290
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    description: Input clock (37.125 MHz or 74.25 MHz)
+    items:
+      - const: xclk
+
+  clock-frequency:
+    description: Frequency of the xclk clock in Hz
+
+  vdda-supply:
+    description: Analog power supply (2.9V)
+
+  vddd-supply:
+    description: Digital core power supply (1.2V)
+
+  vdddo-supply:
+    description: Digital I/O power supply (1.8V)
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    description: |
+      Video output port
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            anyOf:
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+          link-frequencies: true
+
+        required:
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
+  - vdda-supply
+  - vddd-supply
+  - vdddo-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        imx290: camera-sensor@1a {
+            compatible = "sony,imx290";
+            reg = <0x1a>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&camera_rear_default>;
+
+            clocks = <&gcc 90>;
+            clock-names = "xclk";
+            clock-frequency = <37125000>;
+
+            vdddo-supply = <&camera_vdddo_1v8>;
+            vdda-supply = <&camera_vdda_2v8>;
+            vddd-supply = <&camera_vddd_1v5>;
+
+            reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
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
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 72b9654f764c..c431fd20e89b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18982,7 +18982,7 @@ M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/imx290.txt
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
 F:	drivers/media/i2c/imx290.c
 
 SONY IMX319 SENSOR DRIVER
-- 
Regards,

Laurent Pinchart

