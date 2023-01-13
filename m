Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD52B66936A
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 10:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241216AbjAMJ5U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 04:57:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241230AbjAMJ46 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 04:56:58 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE12365AF0
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 01:54:12 -0800 (PST)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1pGGlG-0003cp-Kg; Fri, 13 Jan 2023 10:54:10 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 13 Jan 2023 10:54:07 +0100
Subject: [PATCH v2 01/16] dt-bindings: media: fsl-pxp: convert to yaml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230112-imx-pxp-v2-1-e2281da1db55@pengutronix.de>
References: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
In-Reply-To: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.11.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the bindings of the Freescale Pixel Pipeline to YAML.

The conversion drops the previously listed compatibles for several SoCs.
It is unclear, if the PXP on these SoCs is compatible to any of the PXPs
on the existing SoCs and would allow to reuse the already defined
compatibles. The missing compatibles should be brought back when the
support for the PXP on these SoCs is added.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v2:

- add fsl,imx6sll-pxp and fsl,imx6sx-pxp compatibles
- restrict number of interrupts per variant
- cleanup syntax
---
 .../devicetree/bindings/media/fsl,imx6ull-pxp.yaml | 82 ++++++++++++++++++++++
 .../devicetree/bindings/media/fsl-pxp.txt          | 26 -------
 2 files changed, 82 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
new file mode 100644
index 000000000000..c1232689a261
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx6ull-pxp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Pixel Pipeline
+
+maintainers:
+  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Michael Tretter <m.tretter@pengutronix.de>
+
+description:
+  The Pixel Pipeline (PXP) is a memory-to-memory graphics processing engine
+  that supports scaling, colorspace conversion, alpha blending, rotation, and
+  pixel conversion via lookup table. Different versions are present on various
+  i.MX SoCs from i.MX23 to i.MX7.
+
+properties:
+  compatible:
+    oneOf:
+      - const: fsl,imx6ul-pxp
+      - const: fsl,imx6ull-pxp
+      - const: fsl,imx7d-pxp
+      - items:
+          - enum:
+              - fsl,imx6sll-pxp
+              - fsl,imx6sx-pxp
+          - const: fsl,imx6ull-pxp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: axi
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx6sx-pxp
+    then:
+      properties:
+        interrupts:
+          numItems: 1
+    else:
+      properties:
+        interrupts:
+          numItems: 2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx6ul-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pxp: pxp@21cc000 {
+        compatible = "fsl,imx6ull-pxp";
+        reg = <0x021cc000 0x4000>;
+        interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+        clock-names = "axi";
+        clocks = <&clks IMX6UL_CLK_PXP>;
+    };
diff --git a/Documentation/devicetree/bindings/media/fsl-pxp.txt b/Documentation/devicetree/bindings/media/fsl-pxp.txt
deleted file mode 100644
index f8090e06530d..000000000000
--- a/Documentation/devicetree/bindings/media/fsl-pxp.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Freescale Pixel Pipeline
-========================
-
-The Pixel Pipeline (PXP) is a memory-to-memory graphics processing engine
-that supports scaling, colorspace conversion, alpha blending, rotation, and
-pixel conversion via lookup table. Different versions are present on various
-i.MX SoCs from i.MX23 to i.MX7.
-
-Required properties:
-- compatible: should be "fsl,<soc>-pxp", where SoC can be one of imx23, imx28,
-  imx6dl, imx6sl, imx6sll, imx6ul, imx6sx, imx6ull, or imx7d.
-- reg: the register base and size for the device registers
-- interrupts: the PXP interrupt, two interrupts for imx6ull and imx7d.
-- clock-names: should be "axi"
-- clocks: the PXP AXI clock
-
-Example:
-
-pxp@21cc000 {
-	compatible = "fsl,imx6ull-pxp";
-	reg = <0x021cc000 0x4000>;
-	interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
-	clock-names = "axi";
-	clocks = <&clks IMX6UL_CLK_PXP>;
-};

-- 
2.30.2
