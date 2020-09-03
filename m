Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE9225C4A6
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 17:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729162AbgICPNO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 11:13:14 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:56703 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728677AbgICLsq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 07:48:46 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B0BA81BF216;
        Thu,  3 Sep 2020 11:48:08 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Leon Luo <leonl@leopardimaging.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 2/3] dt-bindings: media: imx274: Convert to json-schema
Date:   Thu,  3 Sep 2020 13:51:42 +0200
Message-Id: <20200903115143.13717-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903115143.13717-1-jacopo+renesas@jmondi.org>
References: <20200903115143.13717-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the imx274 bindings document to json-schema and update
the MAINTAINERS file accordingly.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../devicetree/bindings/media/i2c/imx274.txt  | 38 ------------
 .../bindings/media/i2c/sony,imx274.yaml       | 59 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 60 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/imx274.txt b/Documentation/devicetree/bindings/media/i2c/imx274.txt
deleted file mode 100644
index 0727079d2410..000000000000
--- a/Documentation/devicetree/bindings/media/i2c/imx274.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-* Sony 1/2.5-Inch 8.51Mp CMOS Digital Image Sensor
-
-The Sony imx274 is a 1/2.5-inch CMOS active pixel digital image sensor with
-an active array size of 3864H x 2202V. It is programmable through I2C
-interface. The I2C address is fixed to 0x1a as per sensor data sheet.
-Image data is sent through MIPI CSI-2, which is configured as 4 lanes
-at 1440 Mbps.
-
-
-Required Properties:
-- compatible: value should be "sony,imx274" for imx274 sensor
-- reg: I2C bus address of the device
-
-Optional Properties:
-- reset-gpios: Sensor reset GPIO
-- clocks: Reference to the input clock.
-- clock-names: Should be "inck".
-- VANA-supply: Sensor 2.8v analog supply.
-- VDIG-supply: Sensor 1.8v digital core supply.
-- VDDL-supply: Sensor digital IO 1.2v supply.
-
-The imx274 device node should contain one 'port' child node with
-an 'endpoint' subnode. For further reading on port node refer to
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Example:
-	sensor@1a {
-		compatible = "sony,imx274";
-		reg = <0x1a>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reset-gpios = <&gpio_sensor 0 0>;
-		port {
-			sensor_out: endpoint {
-				remote-endpoint = <&csiss_in>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
new file mode 100644
index 000000000000..f757ce380cb2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx274.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony 1/2.5-Inch 8.51MP CMOS Digital Image Sensor
+
+maintainers:
+  - Leon Luo <leonl@leopardimaging.com>
+
+description: |
+  The Sony IMX274 is a 1/2.5-inch CMOS active pixel digital image sensor with an
+  active array size of 3864H x 2202V. It is programmable through I2C interface.
+  Image data is sent through MIPI CSI-2, which is configured as 4 lanes at 1440
+  Mbps.
+
+properties:
+  compatible:
+    const: sony,imx274
+
+  reg:
+    const: 0x1a
+
+  reset-gpios:
+    maxItems: 1
+
+  port:
+    type: object
+    description: |
+      Output video port. See ../video-interfaces.txt.
+
+required:
+  - compatible
+  - reg
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        imx274: camera-sensor@1a {
+            compatible = "sony,imx274";
+            reg = <0x1a>;
+            reset-gpios = <&gpio_sensor 0 0>;
+
+            port {
+                sensor_out: endpoint {
+                    remote-endpoint = <&csiss_in>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 3f8f093268b7..093a54ae1527 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16127,7 +16127,7 @@ M:	Leon Luo <leonl@leopardimaging.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/imx274.txt
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
 F:	drivers/media/i2c/imx274.c

 SONY IMX290 SENSOR DRIVER
--
2.28.0

