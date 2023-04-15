Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCA76E322D
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 17:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjDOP4a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 11:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjDOP43 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 11:56:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE80A49F4
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 08:56:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF12F1F8;
        Sat, 15 Apr 2023 17:56:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681574182;
        bh=Fwlnf1nO/Z07gTS6SQyXkaqfhR6iKnfr0hQsagcVdB4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fzoXnp/LBer8oMs3xHchFr7TIMxZu+8YVffz2e86jaeY9mwrsXo7JWPHJlEqcN60m
         ++C6637W00VR3vM5VgkX5DDWyrS0ov7H1g/gz6zQBFP5Uv405wpco9Ea99lqAXG6IC
         4Er0y8ZIqCx2Wm/XDuq/FoEwOjcWnzPEhBhZsXbg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH v5 1/5] dt-bindings: media: Add i.MX8 ISI DT bindings
Date:   Sat, 15 Apr 2023 18:56:26 +0300
Message-Id: <20230415155630.7492-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230415155630.7492-1-laurent.pinchart@ideasonboard.com>
References: <20230415155630.7492-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Image Sensing Interface (ISI) combines image processing pipelines
with DMA engines to process and capture frames originating from a
variety of sources. The inputs to the ISI go through Pixel Link
interfaces, and their number and nature is SoC-dependent. They cover
both capture interfaces (MIPI CSI-2 RX, HDMI RX) and memory inputs.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v3:

- Drop patternProperties for ports node
- Add i.MX8MN example

Changes since v2:

- Describe the interrupts property
- Set global minItems and maxItems for interrupts
- Set maxItems for power-domains

Changes since v1:

- Fix compatible string checks in conditional schema
- Fix interrupts property handling
---
 .../bindings/media/nxp,imx8-isi.yaml          | 173 ++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
new file mode 100644
index 000000000000..6038b9b5ab36
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,imx8-isi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX8 Image Sensing Interface
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+description: |
+  The Image Sensing Interface (ISI) combines image processing pipelines with
+  DMA engines to process and capture frames originating from a variety of
+  sources. The inputs to the ISI go through Pixel Link interfaces, and their
+  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
+  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mn-isi
+      - fsl,imx8mp-isi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The AXI clock
+      - description: The APB clock
+      # TODO: Check if the per-channel ipg_proc_clk clocks need to be specified
+      # as well, in case some SoCs have the ability to control them separately.
+      # This may be the case of the i.MX8[DQ]X(P)
+
+  clock-names:
+    items:
+      - const: axi
+      - const: apb
+
+  fsl,blk-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle referencing the block control that contains the CSIS to ISI
+      gasket.
+
+  interrupts:
+    description: Processing pipeline interrupts, one per pipeline
+    minItems: 1
+    maxItems: 2
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      Ports represent the Pixel Link inputs to the ISI. Their number and
+      assignment are model-dependent. Each port shall have a single endpoint.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - fsl,blk-ctrl
+  - ports
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8mn-isi
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
+        ports:
+          properties:
+            port@0:
+              description: MIPI CSI-2 RX
+          required:
+            - port@0
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8mp-isi
+    then:
+      properties:
+        interrupts:
+          maxItems: 2
+        ports:
+          properties:
+            port@0:
+              description: MIPI CSI-2 RX 0
+            port@1:
+              description: MIPI CSI-2 RX 1
+          required:
+            - port@0
+            - port@1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mn-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/imx8mn-power.h>
+
+    isi@32e20000 {
+        compatible = "fsl,imx8mn-isi";
+        reg = <0x32e20000 0x100>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk IMX8MN_CLK_DISP_AXI_ROOT>,
+                 <&clk IMX8MN_CLK_DISP_APB_ROOT>;
+        clock-names = "axi", "apb";
+        fsl,blk-ctrl = <&disp_blk_ctrl>;
+        power-domains = <&disp_blk_ctrl IMX8MN_DISPBLK_PD_ISI>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                isi_in: endpoint {
+                    remote-endpoint = <&mipi_csi_out>;
+                };
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    isi@32e00000 {
+        compatible = "fsl,imx8mp-isi";
+        reg = <0x32e00000 0x4000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
+                 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
+        clock-names = "axi", "apb";
+        fsl,blk-ctrl = <&media_blk_ctrl>;
+        power-domains = <&mediamix_pd>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                isi_in_0: endpoint {
+                    remote-endpoint = <&mipi_csi_0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                isi_in_1: endpoint {
+                    remote-endpoint = <&mipi_csi_1_out>;
+                };
+            };
+        };
+    };
+...
-- 
Regards,

Laurent Pinchart

