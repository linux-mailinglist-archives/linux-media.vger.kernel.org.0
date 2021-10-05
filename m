Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E60AF422449
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234502AbhJELCh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 5 Oct 2021 07:02:37 -0400
Received: from ni.piap.pl ([195.187.100.5]:46666 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234504AbhJELCI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Oct 2021 07:02:08 -0400
From:   Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
To:     devicetree@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v5] dt-binding: media: document ON Semi AR0521 sensor bindings
Date:   Tue, 05 Oct 2021 13:00:15 +0200
Message-ID: <m3ilybohxc.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This file documents DT bindings for the AR0521 camera sensor driver.

Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
changes from v4: none

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
new file mode 100644
index 000000000000..b617cc5c6a9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/onnn,ar0521.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ON Semiconductor AR0521 MIPI CSI-2 sensor
+
+maintainers:
+  - Krzysztof Hałasa <khalasa@piap.pl>
+
+description: |-
+  The AR0521 is a raw CMOS image sensor with MIPI CSI-2 and
+  I2C-compatible control interface.
+
+properties:
+  compatible:
+    const: onnn,ar0521
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: extclk
+
+  vaa-supply:
+    description:
+      Definition of the regulator used as analog (2.7 V) voltage supply.
+
+  vdd-supply:
+    description:
+      Definition of the regulator used as digital core (1.2 V) voltage supply.
+
+  vdd_io-supply:
+    description:
+      Definition of the regulator used as digital I/O (1.8 V) voltage supply.
+
+  reset-gpios:
+    description: reset GPIO, usually active low
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: |
+      Video output port.
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-type:
+            const: 4
+          data-lanes:
+            anyOf:
+              - items:
+                  - const: 1
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - vaa-supply
+  - vdd-supply
+  - vdd_io-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/clock/imx6qdl-clock.h>
+
+    i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ar0521: camera-sensor@36 {
+                    compatible = "onnn,ar0521";
+                    reg = <0x36>;
+                    pinctrl-names = "default";
+                    pinctrl-0 = <&pinctrl_mipi_camera>;
+                    clocks = <&clks IMX6QDL_CLK_CKO>;
+                    clock-names = "extclk";
+                    reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+                    vaa-supply = <&reg_2p7v>;
+                    vdd-supply = <&reg_1p2v>;
+                    vdd_io-supply = <&reg_1p8v>;
+
+                    port {
+                           mipi_camera_to_mipi_csi2: endpoint {
+                                    remote-endpoint = <&mipi_csi2_in>;
+                                    data-lanes = <1 2 3 4>;
+                            };
+                    };
+            };
+    };

-- 
Krzysztof "Chris" Hałasa

Sieć Badawcza Łukasiewicz
Przemysłowy Instytut Automatyki i Pomiarów PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
