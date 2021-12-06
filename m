Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4B946AE40
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 00:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377255AbhLFXLV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Dec 2021 18:11:21 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43936 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359736AbhLFXLU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Dec 2021 18:11:20 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C15325B0;
        Tue,  7 Dec 2021 00:07:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638832070;
        bh=q+AMizLoXhwZxiPiUU1JaaX3rPzBtb6E+zTyec+rhvI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DWaJBQLQV8atR4afzBD4DbVVk6EF6yc2Zug0CLHUIu79LGzwIhGyqyiAM7rovczUP
         cWty5qXmk0lPPspuu7poZcXoQB+apNnUfs5gnON2jK6OikIQHTtO3gHFUsQ/THQ1xN
         kYafVP2xtTY6gc6pdoumQyqjZKHSaf0vj+XfBgmI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Benoit Parrot <bparrot@ti.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: media: Add bindings for OmniVision OV1063x sensors
Date:   Tue,  7 Dec 2021 01:07:16 +0200
Message-Id: <20211206230717.5836-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206230717.5836-1-laurent.pinchart@ideasonboard.com>
References: <20211206230717.5836-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Benoit Parrot <bparrot@ti.com>

Add device tree bindings for the OmniVision OV10633 and OV10635 camera
sensors.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v1:

- Rename file with ovti, prefix
- Fix clock-names property
- Fix references to port and video-interfaces schemas
---
 .../bindings/media/i2c/ovti,ov1063x.yaml      | 97 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 2 files changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov1063x.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov1063x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov1063x.yaml
new file mode 100644
index 000000000000..893adfe75a7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov1063x.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov1063x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV10633/OV1035 Camera Sensor
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+description: |-
+  The OmniVision OV1063x is a 720p camera sensor which supports resolutions up
+  to 1280x800 and 8- and 10-bit YUV output formats.
+
+properties:
+  compatible:
+    enum:
+      - ovti,ov10633
+      - ovti,ov10635
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: xvclk
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      Specifier for the GPIO connected to the RESETB pin.
+
+  powerdown-gpios:
+    maxItems: 1
+    description:
+      Specifier for the GPIO connected to the PWDN pin.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          hsync-active: true
+          vsync-active: true
+          pclk-sample: true
+          bus-width:
+            enum: [ 8, 10 ]
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        clock-frequency = <400000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@37 {
+            compatible = "ovti,ov10633";
+            reg = <0x37>;
+
+            clocks = <&fixed_clock>;
+            clock-names = "xvclk";
+
+            reset-gpios = <&gpio4 17 GPIO_ACTIVE_HIGH>;
+            powerdown-gpios = <&gpio5 11 GPIO_ACTIVE_HIGH>;
+
+            port {
+                camera1: endpoint {
+                     remote-endpoint = <&vin1a_ep>;
+                     hsync-active = <1>;
+                     vsync-active = <1>;
+                     pclk-sample = <0>;
+                     bus-width = <8>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 8eea24d54624..9c7748b160dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14038,6 +14038,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
 F:	drivers/media/i2c/ov02a10.c
 
+OMNIVISION OV10633 SENSOR DRIVER
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/ov1063x.yaml
+
 OMNIVISION OV13858 SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
-- 
Regards,

Laurent Pinchart

