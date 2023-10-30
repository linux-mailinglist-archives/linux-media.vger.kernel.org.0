Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 101B97DBACE
	for <lists+linux-media@lfdr.de>; Mon, 30 Oct 2023 14:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233465AbjJ3Ncs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Oct 2023 09:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233389AbjJ3Ncr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Oct 2023 09:32:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70475CC;
        Mon, 30 Oct 2023 06:32:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9774D75B;
        Mon, 30 Oct 2023 14:32:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698672747;
        bh=w/kUjJtGbF0kHtt8zvglqPzCRzWWaMmv7WKE26WiqNg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a34cTksB4Arf9zE738jlMdrJ2fPHJySX3C6Ic45+k1iLOQ2Nyx0tfG8MroXqcP85v
         yyddi4gTa91fvC7tBrLk9U8Kiv5pbLy0zVVMLTGpBOQxs8yXwuPqqpBxfoC1+FqCZn
         xQ+tZvGOFI4bmA6Mjb3i4mi3oHtrvCym86cihX5M=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Julien Stephan <jstephan@baylibre.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-mediatek@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: media: Add bindings for THine THP7312 ISP
Date:   Mon, 30 Oct 2023 15:32:45 +0200
Message-ID: <20231030133247.11243-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231030133247.11243-1-laurent.pinchart@ideasonboard.com>
References: <20231030133247.11243-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Paul Elder <paul.elder@ideasonboard.com>

The THP7312 is an external ISP from THine. Add DT bindings for it.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v4:

- Add bus-type property

Changes since v2:

- Drop description of reg property
- Improve thine,boot-mode property documentation
- Making thine,boot-mode property optional
- Don't use underscores in supplies names
---
 .../bindings/media/i2c/thine,thp7312.yaml     | 231 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 238 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
new file mode 100644
index 000000000000..a576a8669644
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
@@ -0,0 +1,231 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 Ideas on Board
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/thine,thp7312.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: THine THP7312
+
+maintainers:
+  - Paul Elder <paul.elder@@ideasonboard.com>
+
+description:
+  The THP7312 is a standalone ISP controlled over i2c, and is capable of
+  various image processing and correction functions, including 3A control. It
+  can be connected to CMOS image sensors from various vendors, supporting both
+  MIPI CSI-2 and parallel interfaces. It can also output on either MIPI CSI-2
+  or parallel. The hardware is capable of transmitting and receiving MIPI
+  interlaved data strams with data types or multiple virtual channel
+  identifiers.
+
+allOf:
+  - $ref: ../video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: thine,thp7312
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: CLKI clock input
+
+  thine,boot-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 1
+    default: 1
+    description:
+      Boot mode of the THP7312, reflecting the value of the BOOT[0] pin strap.
+      0 is for the SPI/2-wire slave boot, 1 is for the SPI master boot (from
+      external flash ROM).
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      Reference to the GPIO connected to the RESET_N pin, if any.
+      Must be released (set high) after all supplies are applied.
+
+  vddcore-supply:
+    description:
+      1.2V supply for core, PLL, MIPI rx and MIPI tx.
+
+  vhtermrx-supply:
+    description:
+      Supply for input (RX). 1.8V for MIPI, or 1.8/2.8/3.3V for parallel.
+
+  vddtx-supply:
+    description:
+      Supply for output (TX). 1.8V for MIPI, or 1.8/2.8/3.3V for parallel.
+
+  vddhost-supply:
+    description:
+      Supply for host interface. 1.8V, 2.8V, or 3.3V.
+
+  vddcmos-supply:
+    description:
+      Supply for sensor interface. 1.8V, 2.8V, or 3.3V.
+
+  vddgpio-0-supply:
+    description:
+      Supply for GPIO_0. 1.8V, 2.8V, or 3.3V.
+
+  vddgpio-1-supply:
+    description:
+      Supply for GPIO_1. 1.8V, 2.8V, or 3.3V.
+
+  orientation: true
+  rotation: true
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
+          bus-type:
+            const: 4 # CSI-2 D-PHY
+
+          data-lanes:
+            description:
+              This property is for lane reordering between the THP7312 and the
+              SoC. The sensor supports either two-lane, or four-lane operation.
+              If this property is omitted four-lane operation is assumed. For
+              two-lane operation the property must be set to <1 2>.
+            minItems: 2
+            maxItems: 4
+            items:
+              maximum: 4
+
+  sensors:
+    type: object
+    description: List of connected sensors
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^sensor@[01]":
+        type: object
+        description:
+          Sensors connected to the first and second input, with one node per
+          sensor.
+
+        properties:
+          thine,model:
+            $ref: /schemas/types.yaml#/definitions/string
+            description:
+              Model of the connected sensors. Must be a valid compatible string.
+
+          reg:
+            maxItems: 1
+            description: THP7312 input port number
+
+          data-lanes:
+            $ref: /schemas/media/video-interfaces.yaml#/properties/data-lanes
+            items:
+              maxItems: 4
+            description:
+              This property is for lane reordering between the THP7312 and the imaging
+              sensor that it is connected to.
+
+        patternProperties:
+          ".*-supply":
+            description: Power supplies for the sensor
+
+        required:
+          - reg
+          - data-lanes
+
+        additionalProperties: false
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - clocks
+  - vddcore-supply
+  - vhtermrx-supply
+  - vddtx-supply
+  - vddhost-supply
+  - vddcmos-supply
+  - vddgpio-0-supply
+  - vddgpio-1-supply
+  - sensors
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@61 {
+            compatible = "thine,thp7312";
+            reg = <0x61>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam1_pins_default>;
+
+            reset-gpios = <&pio 119 GPIO_ACTIVE_LOW>;
+            clocks = <&camera61_clk>;
+
+            vddcore-supply = <&vsys_v4p2>;
+            vhtermrx-supply = <&vsys_v4p2>;
+            vddtx-supply = <&vsys_v4p2>;
+            vddhost-supply = <&vsys_v4p2>;
+            vddcmos-supply = <&vsys_v4p2>;
+            vddgpio-0-supply = <&vsys_v4p2>;
+            vddgpio-1-supply = <&vsys_v4p2>;
+
+            orientation = <0>;
+            rotation = <0>;
+
+            sensors {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                sensor@0 {
+                    thine,model = "sony,imx258";
+                    reg = <0>;
+
+                    data-lanes = <4 1 3 2>;
+
+                    dovdd-supply = <&vsys_v4p2>;
+                    avdd-supply = <&vsys_v4p2>;
+                    dvdd-supply = <&vsys_v4p2>;
+                };
+            };
+
+            port {
+                thp7312_2_endpoint: endpoint {
+                    remote-endpoint = <&mipi_thp7312_2>;
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                    data-lanes = <4 2 1 3>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index f3e6dbbbbccb..2e094a7e7d07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21448,6 +21448,13 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
 F:	drivers/platform/x86/think-lmi.?
 
+THP7312 ISP DRIVER
+M:	Paul Elder <paul.elder@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
+
 THUNDERBOLT DMA TRAFFIC TEST DRIVER
 M:	Isaac Hazan <isaac.hazan@intel.com>
 L:	linux-usb@vger.kernel.org
-- 
Regards,

Laurent Pinchart

