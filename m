Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1193439F3D6
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 12:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbhFHKog (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 06:44:36 -0400
Received: from comms.puri.sm ([159.203.221.185]:55688 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231579AbhFHKod (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Jun 2021 06:44:33 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id BF431DF8E2;
        Tue,  8 Jun 2021 03:42:10 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oflxc5DVEij8; Tue,  8 Jun 2021 03:42:05 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm, festevam@gmail.com, krzk@kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de, kernel@puri.sm,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mchehab@kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnguo@kernel.org,
        slongerbeam@gmail.com
Subject: [PATCH v3 1/3] dt-bindings: media: document the nxp,imx8mq-mipi-csi2 receiver phy and controller
Date:   Tue,  8 Jun 2021 12:41:26 +0200
Message-Id: <20210608104128.1616028-2-martin.kepplinger@puri.sm>
In-Reply-To: <20210608104128.1616028-1-martin.kepplinger@puri.sm>
References: <20210608104128.1616028-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i.MX8MQ SoC integrates a different MIPI CSI receiver as the i.MX8MM so
describe the DT bindings for it.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  | 161 ++++++++++++++++++
 1 file changed, 161 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
new file mode 100644
index 000000000000..6eafdf803d36
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -0,0 +1,161 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,imx8mq-mipi-csi2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8MQ MIPI CSI-2 receiver
+
+maintainers:
+  - Martin Kepplinger <martin.kepplinger@puri.sm>
+
+description: |-
+  This binding covers the CSI-2 RX PHY and host controller included in the
+  NXP i.MX8MQ SoC. It handles the sensor/image input and process for all the
+  input imaging devices.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mq-mipi-csi2
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: core is the RX Controller Core Clock input. This clock
+                     must be exactly equal to or faster than the receive
+                     byteclock from the RX DPHY.
+      - description: esc is the Rx Escape Clock. This must be the same escape
+                     clock that the RX DPHY receives.
+      - description: pxl is the pixel clock (phy_ref up to 333Mhz).
+      - description: clko2 is the CLKO2 clock root.
+                     See the reference manual for details.
+
+  clock-names:
+    items:
+      - const: core
+      - const: esc
+      - const: pxl
+      - const: clko2
+
+  power-domains:
+    maxItems: 1
+
+  reset:
+    description:
+      The phandle to the imx8mq reset-controller.
+    maxItems: 1
+
+  phy:
+    description:
+      The phandle to the imx8mq syscon iomux-gpr.
+    maxItems: 1
+
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    const: dram
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port node, single endpoint describing the CSI-2 transmitter.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                items:
+                  minItems: 1
+                  maxItems: 4
+                  items:
+                    - const: 1
+                    - const: 2
+                    - const: 3
+                    - const: 4
+
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port node
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - reset
+  - phy
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/interconnect/imx8mq.h>
+
+    csi@30a70000 {
+        compatible = "fsl,imx8mq-mipi-csi2";
+        reg = <0x30a70000 0x1000>;
+        clocks = <&clk IMX8MQ_CLK_CSI1_CORE>,
+                 <&clk IMX8MQ_CLK_CSI1_ESC>,
+                 <&clk IMX8MQ_CLK_CSI1_PHY_REF>,
+                 <&clk IMX8MQ_CLK_CLKO2>;
+        clock-names = "core", "esc", "pxl", "clko2";
+        assigned-clocks = <&clk IMX8MQ_CLK_CSI1_CORE>,
+                          <&clk IMX8MQ_CLK_CSI1_PHY_REF>,
+                          <&clk IMX8MQ_CLK_CSI1_ESC>;
+        assigned-clock-rates = <266000000>, <200000000>, <66000000>;
+        assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_266M>,
+                                 <&clk IMX8MQ_SYS2_PLL_1000M>,
+                                 <&clk IMX8MQ_SYS1_PLL_800M>;
+        power-domains = <&pgc_mipi_csi1>;
+        reset = <&src>;
+        phy = <&iomuxc_gpr>;
+        interconnects = <&noc IMX8MQ_ICM_CSI1 &noc IMX8MQ_ICS_DRAM>;
+        interconnect-names = "dram";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                imx8mm_mipi_csi_in: endpoint {
+                    remote-endpoint = <&imx477_out>;
+                    data-lanes = <1 2 3 4>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                imx8mm_mipi_csi_out: endpoint {
+                    remote-endpoint = <&csi_in>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.30.2

