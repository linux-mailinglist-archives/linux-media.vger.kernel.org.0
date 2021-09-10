Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44EC640712F
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 20:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232878AbhIJSns (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 14:43:48 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:43991 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbhIJSng (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 14:43:36 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6E47F24000C;
        Fri, 10 Sep 2021 18:42:22 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 06/22] dt-bindings: media: Add Allwinner A31 MIPI CSI-2 bindings documentation
Date:   Fri, 10 Sep 2021 20:41:31 +0200
Message-Id: <20210910184147.336618-7-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This introduces YAML bindings documentation for the Allwinner A31 MIPI
CSI-2 controller.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../media/allwinner,sun6i-a31-mipi-csi2.yaml  | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
new file mode 100644
index 000000000000..09207904b6db
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allwinner,sun6i-a31-mipi-csi2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A31 MIPI CSI-2 Device Tree Bindings
+
+maintainers:
+  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun6i-a31-mipi-csi2
+      - items:
+          - const: allwinner,sun8i-v3s-mipi-csi2
+          - const: allwinner,sun6i-a31-mipi-csi2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
+
+  phys:
+    maxItems: 1
+    description: MIPI D-PHY
+
+  phy-names:
+    items:
+      - const: dphy
+
+  resets:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: Input port, connect to a MIPI CSI-2 sensor
+
+        properties:
+          reg:
+            const: 0
+
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+        additionalProperties: false
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: Output port, connect to a CSI controller
+
+        properties:
+          reg:
+            const: 1
+
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sun8i-v3s-ccu.h>
+    #include <dt-bindings/reset/sun8i-v3s-ccu.h>
+
+    mipi_csi2: csi@1cb1000 {
+        compatible = "allwinner,sun8i-v3s-mipi-csi2",
+                     "allwinner,sun6i-a31-mipi-csi2";
+        reg = <0x01cb1000 0x1000>;
+        interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_CSI>,
+                 <&ccu CLK_CSI1_SCLK>;
+        clock-names = "bus", "mod";
+        resets = <&ccu RST_BUS_CSI>;
+
+        phys = <&dphy>;
+        phy-names = "dphy";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            mipi_csi2_in: port@0 {
+                reg = <0>;
+
+                mipi_csi2_in_ov5648: endpoint {
+                    data-lanes = <1 2 3 4>;
+
+                    remote-endpoint = <&ov5648_out_mipi_csi2>;
+                };
+            };
+
+            mipi_csi2_out: port@1 {
+                reg = <1>;
+
+                mipi_csi2_out_csi0: endpoint {
+                    remote-endpoint = <&csi0_in_mipi_csi2>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.32.0

