Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0C04220EBC
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 16:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732047AbgGOOGi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 10:06:38 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:35925 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732029AbgGOOGh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 10:06:37 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 351C7FF819;
        Wed, 15 Jul 2020 14:06:33 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/8] dt-bindings: media: mt9v111: Convert to json-schema
Date:   Wed, 15 Jul 2020 16:09:46 +0200
Message-Id: <20200715140951.90753-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715140951.90753-1-jacopo+renesas@jmondi.org>
References: <20200715140951.90753-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the mt9v111 bindings document to json-schema and update
the MAINTAINERS file accordingly.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/media/i2c/aptina,mt9v111.txt     | 46 ----------
 .../bindings/media/i2c/aptina,mt9v111.yaml    | 87 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 88 insertions(+), 47 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.txt b/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.txt
deleted file mode 100644
index bd896e9f67d1..000000000000
--- a/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-* Aptina MT9V111 CMOS sensor
-----------------------------
-
-The Aptina MT9V111 is a 1/4-Inch VGA-format digital image sensor with a core
-based on Aptina MT9V011 sensor and an integrated Image Flow Processor (IFP).
-
-The sensor has an active pixel array of 640x480 pixels and can output a number
-of image resolution and formats controllable through a simple two-wires
-interface.
-
-Required properties:
---------------------
-
-- compatible: shall be "aptina,mt9v111".
-- clocks: reference to the system clock input provider.
-
-Optional properties:
---------------------
-
-- enable-gpios: output enable signal, pin name "OE#". Active low.
-- standby-gpios: low power state control signal, pin name "STANDBY".
-  Active high.
-- reset-gpios: chip reset signal, pin name "RESET#". Active low.
-
-The device node must contain one 'port' child node with one 'endpoint' child
-sub-node for its digital output video port, in accordance with the video
-interface bindings defined in:
-Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
---------
-
-        &i2c1 {
-                camera@48 {
-                        compatible = "aptina,mt9v111";
-                        reg = <0x48>;
-
-                        clocks = <&camera_clk>;
-
-                        port {
-                                mt9v111_out: endpoint {
-                                        remote-endpoint = <&ceu_in>;
-                                };
-                        };
-                };
-        };
diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
new file mode 100644
index 000000000000..c8c86d959d50
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/aptina,mt9v111.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aptina MT9V111 CMOS sensor
+
+maintainers:
+  - Jacopo Mondi <jacopo@jmondi.org>
+
+description: -|
+  The Aptina MT9V111 is a 1/4-Inch VGA-format digital image sensor with a core
+  based on Aptina MT9V011 sensor and an integrated Image Flow Processor (IFP).
+
+  The sensor has an active pixel array of 640x480 pixels and can output a number
+  of image resolution and formats controllable through a simple two-wires
+  interface.
+
+properties:
+  compatible:
+    const: aptina,mt9v111
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  clocks:
+    description: Reference to the system clock provider.
+    maxItems: 1
+
+  enable-gpios:
+    description: Enable signal, pin name "OE#". Active low.
+    maxItems: 1
+
+  standby-gpios:
+    description: Low power state control signal, pin name "STANBY". Active high.
+    maxItems: 1
+
+  reset-gpios:
+    description: Chip reset signal, pin name "RESET#". Active low.
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
+        required:
+          - remote-endpoint
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@48 {
+            compatible = "aptina,mt9v111";
+            reg = <0x48>;
+            clocks = <&camera_clk>;
+
+            port {
+                mt9v111_out: endpoint {
+                    remote-endpoint = <&ceu_in>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index bf8902ebbe30..895fff95fd32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11670,7 +11670,7 @@ M:	Jacopo Mondi <jacopo@jmondi.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.txt
+F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
 F:	drivers/media/i2c/mt9v111.c
 
 MULTIFUNCTION DEVICES (MFD)
-- 
2.27.0

