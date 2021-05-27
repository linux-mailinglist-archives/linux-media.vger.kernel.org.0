Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC62C3928FE
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 09:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235103AbhE0H4j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 03:56:39 -0400
Received: from comms.puri.sm ([159.203.221.185]:53450 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235111AbhE0H4S (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 03:56:18 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 56AE0E204E;
        Thu, 27 May 2021 00:54:46 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id AvVzDm61ahfv; Thu, 27 May 2021 00:54:45 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh@kernel.org
Cc:     shawnguo@kernel.org, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, slongerbeam@gmail.com, kernel@puri.sm,
        krzk@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 1/3] dt-bindings: media: document the nxp,imx8mq-mipi-csi2 receiver phy and controller
Date:   Thu, 27 May 2021 09:54:05 +0200
Message-Id: <20210527075407.3180744-2-martin.kepplinger@puri.sm>
In-Reply-To: <20210527075407.3180744-1-martin.kepplinger@puri.sm>
References: <20210527075407.3180744-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i.MX8MQ SoC integrates a different MIPI CSI receiver as the i.MX8MM so
describe the DT bindings for it.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
new file mode 100644
index 000000000000..823609ac4cf5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -0,0 +1,163 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,imx8mq-mipi-csi2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP and i.MX8MQ MIPI CSI-2 receiver
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
+    minItems: 4
+
+  clock-names:
+    minItems: 4
+    items:
+      - const: core
+      - const: esc
+      - const: pxl
+      - const: clko2
+
+  assigned-clocks:
+    maxItems: 3
+
+  assigned-clock-rates:
+    maxItems: 3
+
+  assigned-clock-parents:
+    maxItems: 3
+
+  power-domains:
+    maxItems: 1
+
+  phy-reset:
+    description:
+      The phandle to the imx8mq reset-controller.
+    maxItems: 1
+
+  phy-gpr:
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
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-rates
+  - assigned-clock-parents
+  - power-domains
+  - phy-reset
+  - phy-gpr
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/interconnect/imx8mq.h>
+
+    mipi_csi1@30a70000 {
+        compatible = "fsl,imx8mq-mipi-csi2";
+        reg = <0x30a70000 0x1000>; /* MIPI CSI1 Controller base addr */
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
+        phy-reset = <&src>;
+        phy-gpr = <&iomuxc_gpr>;
+        interconnects = <&noc IMX8MQ_ICM_CSI1 &noc IMX8MQ_ICS_DRAM>;
+        interconnect-names = "dram";
+        status = "disabled";
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

