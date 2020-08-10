Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3904624128D
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 23:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgHJVwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 17:52:20 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:52953 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgHJVwU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 17:52:20 -0400
X-Originating-IP: 82.52.18.94
Received: from uno.homenet.telecomitalia.it (host-82-52-18-94.retail.telecomitalia.it [82.52.18.94])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E41234000A;
        Mon, 10 Aug 2020 21:52:14 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        dave.stevenson@raspberrypi.com, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/4] dt-bindings: media: ov5647: Convert to json-schema
Date:   Mon, 10 Aug 2020 23:55:40 +0200
Message-Id: <20200810215543.113206-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200810215543.113206-1-jacopo+renesas@jmondi.org>
References: <20200810215543.113206-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the ov5647 image sensor bindings to DT schema and add
the file entry to MAINTAINERS.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../devicetree/bindings/media/i2c/ov5647.txt  | 35 ---------
 .../devicetree/bindings/media/i2c/ov5647.yaml | 77 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 78 insertions(+), 35 deletions(-)
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
index 000000000000..1c1d94e805d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
@@ -0,0 +1,77 @@
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
+  - Jacopo Mondi <jacopo@jmondi.org>
+
+description: |-
+  The OV5647 is a raw image sensor with MIPI CSI-2 and CCP2 image data
+  interfaces and CCI (I2C compatible) control bus.
+
+properties:
+  compatible:
+    const: ovti,ov5647
+
+  reg:
+    description: I2C device address.
+    maxItems: 1
+
+  clocks:
+    description: Reference to the xclk clock.
+    maxItems: 1
+
+  port:
+    type: object
+    description: |-
+      Should contain one endpoint sub-node used to model connection to the
+      video receiver according to the specification defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+    properties:
+      endpoint:
+        type: object
+
+        properties:
+          remote-endpoint:
+            description: |-
+              phandle to the video receiver input port.
+
+        additionalProperties: false
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
index 5392f00cec46..21e6c3120152 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12629,6 +12629,7 @@ M:	Luis Oliveira <lolivei@synopsys.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/ov5647.yaml
 F:	drivers/media/i2c/ov5647.c

 OMNIVISION OV5670 SENSOR DRIVER
--
2.27.0

