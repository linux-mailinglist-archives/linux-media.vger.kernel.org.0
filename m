Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE355220EB8
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 16:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732041AbgGOOGf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 10:06:35 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:44711 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732039AbgGOOGf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 10:06:35 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5E5AFFF814;
        Wed, 15 Jul 2020 14:06:30 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org,
        Todor Tomov <todor.too@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/8] dt-bindings: media: ov5645: Convert to json-schema
Date:   Wed, 15 Jul 2020 16:09:45 +0200
Message-Id: <20200715140951.90753-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715140951.90753-1-jacopo+renesas@jmondi.org>
References: <20200715140951.90753-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the ov5645 bindings document to json-schema and update
the MAINTAINERS file accordingly, as the entry was not documented.

Add myself as maintainer for odd fixes only, as I don't have the
sensor to test with.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---

Hello Todor, Manivannan
   I've added in this patch an entry for ov5645 in the MAINTAINERS
file, and I've added myself as maintainers for Odd Fixes only.

As you seem to be the author and committers of this bindings respectively,
would you be interested in maintaining this driver ?

---
 .../devicetree/bindings/media/i2c/ov5645.txt  |  54 --------
 .../devicetree/bindings/media/i2c/ov5645.yaml | 123 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 3 files changed, 131 insertions(+), 54 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
deleted file mode 100644
index 72ad992f77be..000000000000
--- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
+++ /dev/null
@@ -1,54 +0,0 @@
-* Omnivision 1/4-Inch 5Mp CMOS Digital Image Sensor
-
-The Omnivision OV5645 is a 1/4-Inch CMOS active pixel digital image sensor with
-an active array size of 2592H x 1944V. It is programmable through a serial I2C
-interface.
-
-Required Properties:
-- compatible: Value should be "ovti,ov5645".
-- clocks: Reference to the xclk clock.
-- clock-names: Should be "xclk".
-- clock-frequency: Frequency of the xclk clock.
-- enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
-  to the hardware pin PWDNB which is physically active low.
-- reset-gpios: Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
-  the hardware pin RESETB.
-- vdddo-supply: Chip digital IO regulator.
-- vdda-supply: Chip analog regulator.
-- vddd-supply: Chip digital core regulator.
-
-The device node must contain one 'port' child node for its digital output
-video port, in accordance with the video interface bindings defined in
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Example:
-
-	&i2c1 {
-		...
-
-		ov5645: ov5645@3c {
-			compatible = "ovti,ov5645";
-			reg = <0x3c>;
-
-			enable-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
-			reset-gpios = <&gpio5 20 GPIO_ACTIVE_LOW>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&camera_rear_default>;
-
-			clocks = <&clks 200>;
-			clock-names = "xclk";
-			clock-frequency = <24000000>;
-
-			vdddo-supply = <&camera_dovdd_1v8>;
-			vdda-supply = <&camera_avdd_2v8>;
-			vddd-supply = <&camera_dvdd_1v2>;
-
-			port {
-				ov5645_ep: endpoint {
-					clock-lanes = <1>;
-					data-lanes = <0 2>;
-					remote-endpoint = <&csi0_ep>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.yaml b/Documentation/devicetree/bindings/media/i2c/ov5645.yaml
new file mode 100644
index 000000000000..ff52d0fffb74
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov5645.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ov5645.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OV5645 1/4 Inch 5Mp CMOS Digital Image Sensor
+
+maintainers:
+  - Jacopo Mondi <jacopo@jmondi.org>
+
+description: -|
+  The Omnivision OV5645 is a 1/4-Inch CMOS active pixel digital image sensor
+  with an active array size of 2592H x 1944V. It is programmable through a
+  serial I2C interface.
+
+properties:
+  compatible:
+    const: ovti,ov5645
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
+    description: Frequency of the xclk clock.
+
+  enable-gpios:
+    description: |
+      Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
+      to the hardware pin PWDNB which is physically active low.
+    maxItems: 1
+
+  reset-gpios:
+    description: |
+      Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
+      the hardware pin RESETB.
+    maxItems: 1
+
+  vdddo-supply:
+    description: Chip digital IO regulator.
+    maxItems: 1
+
+  vdda-supply:
+    description: Chip analog regulator.
+    maxItems: 1
+
+  vddd-supply:
+    description: Chip digital core regulator.
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
+            description: A phandle to the bus receiver's endpoint node.
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
+        camera@3c {
+            compatible = "ovti,ov5645";
+            reg = <0x3c>;
+
+            enable-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio5 20 GPIO_ACTIVE_LOW>;
+
+            clocks = <&clks 200>;
+            clock-names = "xclk";
+            clock-frequency = <24000000>;
+
+            vdddo-supply = <&camera_dovdd_1v8>;
+            vdda-supply = <&camera_avdd_2v8>;
+            vddd-supply = <&camera_dvdd_1v2>;
+
+            port {
+                ov5645_ep: endpoint {
+                    clock-lanes = <1>;
+                    data-lanes = <0 2>;
+                    remote-endpoint = <&csi0_ep>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 0160d7567ed3..bf8902ebbe30 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12607,6 +12607,14 @@ T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov5640.c
 F:	Documentation/devicetree/bindings/media/i2c/ov5640.yaml

+OMNIVISION OV5645 SENSOR DRIVER
+M:	Jacopo Mondi <jacopo@jmondi.org>
+L:	linux-media@vger.kernel.org
+S:	Odd Fixes
+T:	git git://linuxtv.org/media_tree.git
+F:	drivers/media/i2c/ov5645.c
+F:	Documentation/devicetree/bindings/media/i2c/ov5645.yaml
+
 OMNIVISION OV5647 SENSOR DRIVER
 M:	Jacopo Mondi <jacopo@jmondi.org>
 M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
--
2.27.0

