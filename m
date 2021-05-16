Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E4B381C08
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232318AbhEPCQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:16:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35538 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232108AbhEPCNE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:13:04 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3AFD29B9;
        Sun, 16 May 2021 03:45:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129519;
        bh=vPhj8oOE5+VmasAFg9Dggh377/Q8n12O4iqWnp6U4oI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q6rUuzbcj4gwIX3yMCtlYbBcypuKeg65KeQEdvF2LYBMLuynk2GYYROvg7R732090
         O9tE05dD1BZFLlgfKs2exoFavfpNT7i/v0NztQBXiroynFrAS2JdIaFJue2/JbyD/1
         r3tMhG5pU2j3DA0jTwjA8dK8fZ5mBQ9M5eOm3gOA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 23/25] dt-bindings: media: nxp,imx7-mipi-csi2: Add i.MX8MM support
Date:   Sun, 16 May 2021 04:44:39 +0300
Message-Id: <20210516014441.5508-24-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i.MX8MM integrates a newer version of the CSIS CSI-2 receiver as the
i.MX7 family. Differences in integration are are:

- An additional clock is required
- Up to 4 data lanes are supported
- No reset or PHY supply is present

Support it in the DT binding.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 109 +++++++++++++++---
 1 file changed, 95 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
index d8ed480482b9..7c09eec78ce5 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
@@ -4,15 +4,17 @@
 $id: http://devicetree.org/schemas/media/nxp,imx7-mipi-csi2.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: NXP i.MX7 MIPI CSI-2 receiver
+title: NXP i.MX7 and i.MX8 MIPI CSI-2 receiver
 
 maintainers:
   - Rui Miguel Silva <rmfrfs@gmail.com>
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 
 description: |-
-  The NXP i.MX7 SoC family includes a MIPI CSI-2 receiver IP core, documented
-  as "CSIS V3.3". The IP core seems to originate from Samsung, and may be
-  compatible with some of the Exynos4 ad S5P SoCs.
+  The NXP i.MX7 and i.MX8 families contain SoCs that include a MIPI CSI-2
+  receiver IP core named CSIS. The IP core originates from Samsung, and may be
+  compatible with some of the Exynos4 and S5P SoCs. i.MX7 SoCs use CSIS version
+  3.3, and i.MX8 SoCs use CSIS version 3.6.3.
 
   While the CSI-2 receiver is separate from the MIPI D-PHY IP core, the PHY is
   completely wrapped by the CSIS and doesn't expose a control interface of its
@@ -20,7 +22,9 @@ description: |-
 
 properties:
   compatible:
-    const: fsl,imx7-mipi-csi2
+    enum:
+      - fsl,imx7-mipi-csi2
+      - fsl,imx8mm-mipi-csi2
 
   reg:
     maxItems: 1
@@ -29,16 +33,20 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 3
     items:
       - description: The peripheral clock (a.k.a. APB clock)
       - description: The external clock (optionally used as the pixel clock)
       - description: The MIPI D-PHY clock
+      - description: The AXI clock
 
   clock-names:
+    minItems: 3
     items:
       - const: pclk
       - const: wrap
       - const: phy
+      - const: axi
 
   power-domains:
     maxItems: 1
@@ -71,16 +79,30 @@ properties:
 
             properties:
               data-lanes:
-                oneOf:
-                  - items:
-                      - const: 1
-                  - items:
-                      - const: 1
-                      - const: 2
+                items:
+                  minItems: 1
+                  maxItems: 4
+                  items:
+                    - const: 1
+                    - const: 2
+                    - const: 3
+                    - const: 4
 
             required:
               - data-lanes
 
+            allOf:
+              - if:
+                  properties:
+                    compatible:
+                      contains:
+                        const: fsl,imx7-mipi-csi2
+                then:
+                  properties:
+                    data-lanes:
+                      items:
+                        maxItems: 2
+
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description:
@@ -93,12 +115,29 @@ required:
   - clocks
   - clock-names
   - power-domains
-  - phy-supply
-  - resets
   - ports
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx7-mipi-csi2
+    then:
+      required:
+        - phy-supply
+        - resets
+    else:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+        phy-supply: false
+        resets: false
+
 examples:
   - |
     #include <dt-bindings/clock/imx7d-clock.h>
@@ -106,7 +145,7 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/reset/imx7-reset.h>
 
-    mipi_csi: mipi-csi@30750000 {
+    mipi-csi@30750000 {
         compatible = "fsl,imx7-mipi-csi2";
         reg = <0x30750000 0x10000>;
         interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
@@ -144,4 +183,46 @@ examples:
         };
     };
 
+  - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mipi-csi@32e30000 {
+        compatible = "fsl,imx8mm-mipi-csi2";
+        reg = <0x32e30000 0x1000>;
+        interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+        clock-frequency = <333000000>;
+        clocks = <&clk IMX8MM_CLK_DISP_APB_ROOT>,
+                 <&clk IMX8MM_CLK_CSI1_ROOT>,
+                 <&clk IMX8MM_CLK_CSI1_PHY_REF>,
+                 <&clk IMX8MM_CLK_DISP_AXI_ROOT>;
+        clock-names = "pclk", "wrap", "phy", "axi";
+        power-domains = <&mipi_pd>;
+
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
 ...
-- 
Regards,

Laurent Pinchart

