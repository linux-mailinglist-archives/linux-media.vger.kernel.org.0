Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A021CE93D
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 01:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgEKXfI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 19:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725828AbgEKXfI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 19:35:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D47DC061A0C
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 16:35:08 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95B2333E;
        Tue, 12 May 2020 01:35:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589240105;
        bh=sRsjOh0RLsFmWwyrY+o4wQpsZ3VCgSySJime40cRfV8=;
        h=From:To:Cc:Subject:Date:From;
        b=TOtKPBSqwL02Tj8vbMg9151K6eYFTajvDGuWoS6JBRRPuNBO4UoSAixyT0zN9kTtu
         T9oFaNtsuuine8a9+h3M65zw6hKvk04jh6vGDzmMuVrlNkdMGaDhO6sD+NiF/sEzDx
         ZBhjwEqDtsiTMyR7RMt2mteH39FcRejPrsPw0JQ4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 1/2] media: dt-bindings: media: i2c: Add MT9M114 camera sensor binding
Date:   Tue, 12 May 2020 02:34:55 +0300
Message-Id: <20200511233456.9722-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add device tree binding for the ON Semiconductor MT9M114 CMOS camera
sensor.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/media/i2c/onnn,mt9m114.yaml      | 188 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 195 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
new file mode 100644
index 000000000000..2c3c691aacfd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
@@ -0,0 +1,188 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/onnn,mt9m114.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ON Semiconductor 1/6-inch 720p CMOS Digital Image Sensor
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+description: |-
+  The ON Semiconductor MT9M114 is a 1/6-inch 720p (1.26 Mp) CMOS digital image
+  sensor with an active pixel-array size of 1296H x 976V. It is programmable
+  through an I2C interface and outputs image data over a 8-bit parallel or
+  1-lane MIPI CSI-2 connection.
+
+properties:
+  compatible:
+    const: onnn,mt9m114
+
+  reg:
+    description: I2C device address
+    enum:
+      - 0x48
+      - 0x5d
+
+  clocks:
+    description: EXTCLK clock signal
+    maxItems: 1
+
+  vdd-supply:
+    description:
+      Core digital voltage supply, 1.8V
+
+  vddio-supply:
+    description:
+      I/O digital voltage supply, 1.8V or 2.8V
+
+  vaa-supply:
+    description:
+      Analog voltage supply, 2.8V
+
+  reset-gpios:
+    description: |-
+      Reference to the GPIO connected to the RESET_BAR pin, if any (active
+      low).
+
+  # See ../video-interfaces.txt for more details
+  port:
+    type: object
+    properties:
+      endpoint:
+        type: object
+        properties:
+          bus-type:
+            enum: [4, 5, 6]
+
+          clock-lanes:
+            items:
+              - const: 0
+
+          data-lanes:
+            items:
+              - const: 1
+
+          bus-width:
+            items:
+              - const: 8
+
+          hsync-active:
+            items:
+              - const: 1
+
+          vsync-active:
+            items:
+              - const: 1
+
+        required:
+          - bus-type
+
+        allOf:
+          - if:
+              properties:
+                bus-type:
+                  const: 4
+            then:
+              properties:
+                bus-width: false
+                hsync-active: false
+                vsync-active: false
+
+          - if:
+              properties:
+                bus-type:
+                  const: 5
+            then:
+              properties:
+                clock-lanes: false
+                data-lanes: false
+
+          - if:
+              properties:
+                bus-type:
+                  const: 6
+            then:
+              properties:
+                clock-lanes: false
+                data-lanes: false
+                hsync-active: false
+                vsync-active: false
+
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vdd-supply
+  - vddio-supply
+  - vaa-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@48 {
+            compatible = "onnn,mt9m114";
+            reg = <0x48>;
+
+            clocks = <&clk24m 0>;
+
+            reset-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
+
+            vddio-supply = <&reg_cam_1v8>;
+            vdd-supply = <&reg_cam_1v8>;
+            vaa-supply = <&reg_2p8v>;
+
+            port {
+                endpoint {
+                    bus-type = <4>;
+                    clock-lanes = <0>;
+                    data-lanes = <1>;
+                    remote-endpoint = <&mipi_csi_in>;
+                };
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@5d {
+            compatible = "onnn,mt9m114";
+            reg = <0x5d>;
+
+            clocks = <&clk24m 0>;
+
+            reset-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
+
+            vddio-supply = <&reg_cam_1v8>;
+            vdd-supply = <&reg_cam_1v8>;
+            vaa-supply = <&reg_2p8v>;
+
+            port {
+                endpoint {
+                    bus-type = <5>;
+                    bus-width = <8>;
+                    hsync-active = <1>;
+                    vsync-active = <1>;
+                    remote-endpoint = <&parallel_in>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 091ec22c1a23..61d2fb6d049e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11457,6 +11457,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/mt9m032.c
 F:	include/media/i2c/mt9m032.h
 
+MT9M114 ON SEMICONDUCTOR SENSOR DRIVER
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c.onnn,mt9m114.yaml
+
 MT9P031 APTINA CAMERA SENSOR
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:	linux-media@vger.kernel.org
-- 
Regards,

Laurent Pinchart

