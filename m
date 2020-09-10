Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5468264BE0
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 19:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbgIJRlz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 13:41:55 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:52313 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgIJQQ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 12:16:28 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E32981BF20D;
        Thu, 10 Sep 2020 16:16:09 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5] dt-bindings: media: mt9v111: Convert to json-schema
Date:   Thu, 10 Sep 2020 18:19:49 +0200
Message-Id: <20200910161949.613922-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the mt9v111 bindings document to json-schema and update
the MAINTAINERS file accordingly.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
v4->v5:
- No changes, sent separately as other patches in the series have been
  under discussion while I think this one could be collected as is.

---
 .../bindings/media/i2c/aptina,mt9v111.txt     | 46 ------------
 .../bindings/media/i2c/aptina,mt9v111.yaml    | 75 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 76 insertions(+), 47 deletions(-)
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
index 000000000000..ff9546e95d05
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
@@ -0,0 +1,75 @@
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
+description: |
+  The Aptina MT9V111 is a 1/4-Inch VGA-format digital image sensor with a core
+  based on Aptina MT9V011 sensor and an integrated Image Flow Processor (IFP).
+
+  The sensor has an active pixel array of 640x480 pixels and can output a number
+  of image resolutions and formats controllable through a simple two-wires
+  interface.
+
+properties:
+  compatible:
+    const: aptina,mt9v111
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  enable-gpios:
+    description: Enable signal, pin name "OE#". Active low.
+    maxItems: 1
+
+  standby-gpios:
+    description: |
+      Low power state control signal, pin name "STANDBY". Active high.
+    maxItems: 1
+
+  reset-gpios:
+    description: Chip reset signal, pin name "RESET#". Active low.
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
+  - clocks
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
index 4e68598c16fa..355f9c04b56b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11823,7 +11823,7 @@ M:	Jacopo Mondi <jacopo@jmondi.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.txt
+F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
 F:	drivers/media/i2c/mt9v111.c

 MULTIFUNCTION DEVICES (MFD)
--
2.28.0

