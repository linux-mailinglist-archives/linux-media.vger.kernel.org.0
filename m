Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66CE12E9031
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 06:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727733AbhADFkp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 00:40:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727317AbhADFkp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 00:40:45 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5A1C061795;
        Sun,  3 Jan 2021 21:40:04 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C3025B4;
        Mon,  4 Jan 2021 06:40:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609738802;
        bh=kP98S8lkebWLhqEgkmSsmpb34HDFpNGDG2kO6EP1xeM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ia6LTt6R9IQUyduyqOSmcLHx29uAPk2GtTBdS3kVkeV4ivSUiFBj3vl06ZP2ZH4uX
         gbcTTo2xO+cnonHTsqUknL9Yncn8TBUkmO1N5KPHtGHHzkaQxJFpFEtYqIQohqJYhW
         9jkBs7QFP8IsccVfU+MiMia7IVNaEEpY4sI2Lyxw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benoit Parrot <bparrot@ti.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: media: Add bindings for OmniVision OV1063x sensors
Date:   Mon,  4 Jan 2021 07:39:44 +0200
Message-Id: <20210104053945.12409-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210104053945.12409-1-laurent.pinchart@ideasonboard.com>
References: <20210104053945.12409-1-laurent.pinchart@ideasonboard.com>
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
---
 .../bindings/media/i2c/ov1063x.yaml           | 97 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 2 files changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov1063x.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ov1063x.yaml b/Documentation/devicetree/bindings/media/i2c/ov1063x.yaml
new file mode 100644
index 000000000000..b5e08dd2f496
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov1063x.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ov1063x.yaml#
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
+  clocks-names:
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
+    $ref: /schemas/graph.yaml#/properties/port
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: ../video-interfaces.yaml#
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
+  - clocks-names
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
+            clocks-names = "xvclk";
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
index 281de213ef47..9dc3a7d75460 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12867,6 +12867,13 @@ M:	Harald Welte <laforge@gnumonks.org>
 S:	Maintained
 F:	drivers/char/pcmcia/cm4040_cs.*
 
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

