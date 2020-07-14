Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 960F621F3FA
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 16:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728345AbgGNOZj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 10:25:39 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:48025 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgGNOZj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 10:25:39 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 8261E24000E;
        Tue, 14 Jul 2020 14:25:34 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        dave.stevenson@raspberrypi.com, dongchun.zhu@mediatek.com,
        linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, Rob Herring <robh@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v2 1/3] dt-bindings: media: ov5647: Convert to json-schema
Date:   Tue, 14 Jul 2020 16:28:54 +0200
Message-Id: <20200714142856.58365-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714142856.58365-1-jacopo+renesas@jmondi.org>
References: <20200714142856.58365-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the ov5647 image sensor bindings to DT schema and add
the file entry to MAINTAINERS.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../devicetree/bindings/media/i2c/ov5647.txt  | 35 --------
 .../devicetree/bindings/media/i2c/ov5647.yaml | 82 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 83 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.txt b/Documentation/devicetree/bindings/media/i2c/ov5647.txt
deleted file mode 100644
index 22e44945b661..000000000000
--- a/Documentation/devicetree/bindings/media/i2c/ov5647.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Omnivision OV5647 raw image sensor
----------------------------------
-
-OV5647 is a raw image sensor with MIPI CSI-2 and CCP2 image data interfaces
-and CCI (I2C compatible) control bus.
-
-Required properties:
-
-- compatible		: "ovti,ov5647".
-- reg			: I2C slave address of the sensor.
-- clocks		: Reference to the xclk clock.
-
-The common video interfaces bindings (see video-interfaces.txt) should be
-used to specify link to the image data receiver. The OV5647 device
-node should contain one 'port' child node with an 'endpoint' subnode.
-
-Endpoint node mandatory properties:
-
-- remote-endpoint: A phandle to the bus receiver's endpoint node.
-
-Example:
-
-	i2c@2000 {
-		...
-		ov: camera@36 {
-			compatible = "ovti,ov5647";
-			reg = <0x36>;
-			clocks = <&camera_clk>;
-			port {
-				camera_1: endpoint {
-					remote-endpoint = <&csi1_ep1>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
new file mode 100644
index 000000000000..067e222e0c7c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ov5647.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OV5647 raw image sensor
+
+maintainers:
+  - Dave Stevenson <dave.stevenson@raspberrypi.com>
+
+description: |-
+  OV5647 is a raw image sensor with MIPI CSI-2 and CCP2 image data interfaces
+  and CCI (I2C compatible) control bus.
+
+properties:
+  compatible:
+    const: ovti,ov5647
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  clocks:
+    description: Reference to the xclk clock
+    maxItems: 1
+
+  port:
+    type: object
+    description: |-
+      Should contain one endpoint sub-node used to model connection to the
+      video receiver according to the specification defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+
+    properties:
+      endpoint:
+        type: object
+
+        properties:
+          remote-endpoint:
+            description: |-
+              phandle to the video receiver input port
+
+        required:
+          - remote-endpoint
+
+        additionalProperties: false
+
+    required:
+      - endpoint
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ov5647: camera@36 {
+            compatible = "ovti,ov5647";
+            reg = <0x36>;
+            clocks = <&camera_clk>;
+
+            port {
+                camera_out: endpoint {
+                    remote-endpoint = <&csi1_ep1>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 2730af1265ea..1742fa1a88cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12612,6 +12612,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov5647.c
+F:	Documentation/devicetree/bindings/media/i2c/ov5647.yaml
 
 OMNIVISION OV5670 SENSOR DRIVER
 M:	Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
-- 
2.27.0

