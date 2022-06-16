Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51D3A54E984
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 20:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234114AbiFPSh1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 14:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347806AbiFPShY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 14:37:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D0D53E2F;
        Thu, 16 Jun 2022 11:37:23 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D09F3BC0;
        Thu, 16 Jun 2022 20:37:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655404636;
        bh=6zhorOMHMcApn1JCVBnoz1jaHDN+7f/JdyrBu4DYqwk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NO8oPlRMQNSNGRdWmSlx5vb1Dawh9CRALtrGySRAQTJSdcrQaXMwGsc7Ffx3eu7ex
         JT4ctUJrQ66xftEOGK9afBp90RMIfuXHig7WBcUa9wscR6JwOAi9eMG/lGId2ZMF7O
         kbjxc7/zp+YlJZfDtlIt91Bi0Oxe+L7UVo+Sxz8Y=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 6/7] dt-bindings: media: Add i.MX8 ISI DT bindings
Date:   Thu, 16 Jun 2022 21:36:55 +0300
Message-Id: <20220616183656.19089-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616183656.19089-1-laurent.pinchart@ideasonboard.com>
References: <20220616183656.19089-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
---
 .../bindings/media/nxp,imx8-isi.yaml          | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
new file mode 100644
index 000000000000..6812c66fa49d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
@@ -0,0 +1,146 @@
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
+  power-domains: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      Ports represent the Pixel Link inputs to the ISI. Their number and
+      assignment are model-dependent. Each port shall have a single endpoint.
+
+    patternProperties:
+      "^port@[0-9]$":
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
+
+    unevaluatedProperties: false
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
+            const: nxp,imx8mn-isi
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
+            const: nxp,imx8mp-isi
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
+
+...
-- 
Regards,

Laurent Pinchart

