Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21485246B7D
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 17:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388068AbgHQP4V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 11:56:21 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:52387 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388029AbgHQPzl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 11:55:41 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 772B524000E;
        Mon, 17 Aug 2020 15:55:35 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: media: ov772x: Convert to json-schema
Date:   Mon, 17 Aug 2020 17:59:08 +0200
Message-Id: <20200817155910.255883-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200817155910.255883-1-jacopo+renesas@jmondi.org>
References: <20200817155910.255883-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the ov772x binding document to json-schema and update
the MAINTAINERS file accordingly.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../devicetree/bindings/media/i2c/ov772x.txt  | 40 ---------
 .../devicetree/bindings/media/i2c/ov772x.yaml | 84 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 85 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.txt b/Documentation/devicetree/bindings/media/i2c/ov772x.txt
deleted file mode 100644
index 0b3ede5b8e6a..000000000000
--- a/Documentation/devicetree/bindings/media/i2c/ov772x.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-* Omnivision OV7720/OV7725 CMOS sensor
-
-The Omnivision OV7720/OV7725 sensor supports multiple resolutions output,
-such as VGA, QVGA, and any size scaling down from CIF to 40x30. It also can
-support the YUV422, RGB565/555/444, GRB422 or raw RGB output formats.
-
-Required Properties:
-- compatible: shall be one of
-	"ovti,ov7720"
-	"ovti,ov7725"
-- clocks: reference to the xclk input clock.
-
-Optional Properties:
-- reset-gpios: reference to the GPIO connected to the RSTB pin which is
-  active low, if any.
-- powerdown-gpios: reference to the GPIO connected to the PWDN pin which is
-  active high, if any.
-
-The device node shall contain one 'port' child node with one child 'endpoint'
-subnode for its digital output video port, in accordance with the video
-interface bindings defined in Documentation/devicetree/bindings/media/
-video-interfaces.txt.
-
-Example:
-
-&i2c0 {
-	ov772x: camera@21 {
-		compatible = "ovti,ov7725";
-		reg = <0x21>;
-		reset-gpios = <&axi_gpio_0 0 GPIO_ACTIVE_LOW>;
-		powerdown-gpios = <&axi_gpio_0 1 GPIO_ACTIVE_LOW>;
-		clocks = <&xclk>;
-
-		port {
-			ov772x_0: endpoint {
-				remote-endpoint = <&vcap1_in0>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
new file mode 100644
index 000000000000..2b84fefeb4aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ov772x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title:  Omnivision OV7720/OV7725 CMOS sensor
+
+maintainers:
+  - Jacopo Mondi <jacopo@jmondi.org>
+
+description: -|
+  The Omnivision OV7720/OV7725 sensor supports multiple resolutions output,
+  such as VGA, QVGA, and any size scaling down from CIF to 40x30. It also can
+  support the YUV422, RGB565/555/444, GRB422 or raw RGB output formats.
+
+properties:
+  compatible:
+    enum:
+      - ovti,ov7720
+      - ovti,ov7725
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  reset-gpios:
+    description: -|
+      Reference to the GPIO connected to the RSTB pin which is active low.
+    maxItems: 1
+
+  powerdown-gpios:
+    description: -|
+      Reference to the GPIO connected to the PWDN pin which is active high.
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
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - reset-gpios
+  - powerdown-gpios
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        ov772x: camera@21 {
+            compatible = "ovti,ov7725";
+            reg = <0x21>;
+            reset-gpios = <&axi_gpio_0 0 GPIO_ACTIVE_LOW>;
+            powerdown-gpios = <&axi_gpio_0 1 GPIO_ACTIVE_LOW>;
+            clocks = <&xclk>;
+
+            port {
+                ov772x_0: endpoint {
+                    remote-endpoint = <&vcap1_in0>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index d1a6173d3b64..d0a20214eaaf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12666,7 +12666,7 @@ M:	Jacopo Mondi <jacopo@jmondi.org>
 L:	linux-media@vger.kernel.org
 S:	Odd fixes
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/ov772x.txt
+F:	Documentation/devicetree/bindings/media/i2c/ov772x.yaml
 F:	drivers/media/i2c/ov772x.c
 F:	include/media/i2c/ov772x.h
 
-- 
2.27.0

