Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C39B419FAA2
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729738AbgDFQnS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:43:18 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:57420 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729533AbgDFQnR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Apr 2020 12:43:17 -0400
X-IronPort-AV: E=Sophos;i="5.72,351,1580742000"; 
   d="scan'208";a="43857586"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Apr 2020 01:43:16 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8C21240065D4;
        Tue,  7 Apr 2020 01:43:12 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 5/5] media: dt-bindings: media: i2c: convert ov5645 bindings to json-schema
Date:   Mon,  6 Apr 2020 17:42:41 +0100
Message-Id: <1586191361-16598-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert ov5645 bindings to json-schema.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/media/i2c/ov5645.txt  |  52 --------
 .../devicetree/bindings/media/i2c/ov5645.yaml | 126 ++++++++++++++++++
 2 files changed, 126 insertions(+), 52 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
deleted file mode 100644
index a55bb728ea48..000000000000
--- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
+++ /dev/null
@@ -1,52 +0,0 @@
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
index 000000000000..d5cdcf9a1c76
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov5645.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ov5645.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision 1/4-Inch 5MP CMOS Digital Image Sensor
+
+maintainers:
+  - Sakari Ailus <sakari.ailus@linux.intel.com>
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+
+description: |-
+ The Omnivision OV5645 is a 1/4-Inch CMOS active pixel digital image sensor with
+ an active array size of 2592H x 1944V. It is programmable through a serial I2C
+ interface.
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
+    description: External clock frequency should range between 6MHz to 27MHz.
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: xclk
+
+  enable-gpios:
+    description: |-
+      Chip enable GPIO. This corresponds to the hardware pin PWDNB which is
+      physically active low.
+
+  reset-gpios:
+    description: Chip reset GPIO. This corresponds to the hardware pin RESETB.
+
+  vdddo-supply:
+    description: Chip digital IO regulator.
+
+  vdda-supply:
+    description: Chip analog regulator.
+
+  vddd-supply:
+    description: Chip digital core regulator.
+
+  # See ../video-interfaces.txt for more details
+  port:
+    type: object
+    properties:
+      endpoint:
+        type: object
+
+        properties:
+          data-lanes:
+            description: |-
+              The sensor supports either one-lane, or two-lane operation.
+              For one-lane operation the property must be set to <1> and
+              for two-lane operation the property must be set to <1 2>.
+            items:
+              - const: 1
+              - const: 2
+
+          clock-lanes:
+            description:
+              should be set to <0> (clock lane on hardware lane 0).
+            items:
+              - const: 0
+
+          remote-endpoint: true
+
+        required:
+          - data-lanes
+          - clock-lanes
+          - remote-endpoint
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - enable-gpios
+  - reset-gpios
+  - vdddo-supply
+  - vdda-supply
+  - vddd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ov5645: sensor@3c {
+            compatible = "ovti,ov5645";
+            reg = <0x3c>;
+            clocks = <&ov5645_cl>;
+            clock-names = "xclk";
+            enable-gpios = <&gpio1 6 /* GPIO_ACTIVE_HIGH */>;
+            reset-gpios = <&gpio5 20 /* GPIO_ACTIVE_LOW */>;
+            vdddo-supply = <&camera_dovdd_1v8>;
+            vdda-supply = <&camera_avdd_2v8>;
+            vddd-supply = <&camera_dvdd_1v2>;
+
+            port {
+                ov5645_0: endpoint {
+                    remote-endpoint = <&csi1_ep>;
+                    clock-lanes = <0>;
+                    data-lanes = <1 2>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.20.1

