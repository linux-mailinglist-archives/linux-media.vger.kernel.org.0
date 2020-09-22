Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B732741B0
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 14:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgIVMAO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 08:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbgIVMAO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 08:00:14 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31ED3C061755
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 05:00:14 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kKgxw-00063c-LV; Tue, 22 Sep 2020 14:00:12 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH] media: dt-bindings: convert CODA VPU bindings to yaml
Date:   Tue, 22 Sep 2020 14:00:07 +0200
Message-Id: <20200922120007.12766-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert to YAML, add missing "fsl,imx6dl-vpu", "cnm,coda960"
compatible, and specify the power-domain property for i.MX6.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 .../devicetree/bindings/media/coda.txt        |  31 -----
 .../devicetree/bindings/media/coda.yaml       | 109 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 110 insertions(+), 32 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/coda.txt
 create mode 100644 Documentation/devicetree/bindings/media/coda.yaml

diff --git a/Documentation/devicetree/bindings/media/coda.txt b/Documentation/devicetree/bindings/media/coda.txt
deleted file mode 100644
index 90eb74cc1993..000000000000
--- a/Documentation/devicetree/bindings/media/coda.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Chips&Media Coda multi-standard codec IP
-========================================
-
-Coda codec IPs are present in i.MX SoCs in various versions,
-called VPU (Video Processing Unit).
-
-Required properties:
-- compatible : should be "fsl,<chip>-src" for i.MX SoCs:
-  (a) "fsl,imx27-vpu" for CodaDx6 present in i.MX27
-  (b) "fsl,imx51-vpu" for CodaHx4 present in i.MX51
-  (c) "fsl,imx53-vpu" for CODA7541 present in i.MX53
-  (d) "fsl,imx6q-vpu" for CODA960 present in i.MX6q
-- reg: should be register base and length as documented in the
-  SoC reference manual
-- interrupts : Should contain the VPU interrupt. For CODA960,
-  a second interrupt is needed for the MJPEG unit.
-- clocks : Should contain the ahb and per clocks, in the order
-  determined by the clock-names property.
-- clock-names : Should be "ahb", "per"
-- iram : phandle pointing to the SRAM device node
-
-Example:
-
-vpu: vpu@63ff4000 {
-	compatible = "fsl,imx53-vpu";
-	reg = <0x63ff4000 0x1000>;
-	interrupts = <9>;
-	clocks = <&clks 63>, <&clks 63>;
-	clock-names = "ahb", "per";
-	iram = <&ocram>;
-};
diff --git a/Documentation/devicetree/bindings/media/coda.yaml b/Documentation/devicetree/bindings/media/coda.yaml
new file mode 100644
index 000000000000..c32415b46761
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/coda.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/coda.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chips&Media Coda multi-standard codec IP
+
+maintainers:
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |-
+  Coda codec IPs are present in i.MX SoCs in various versions,
+  called VPU (Video Processing Unit).
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: fsl,imx27-vpu
+          - const: cnm,codadx6
+      - items:
+          - const: fsl,imx51-vpu
+          - const: cnm,codahx4
+      - items:
+          - const: fsl,imx53-vpu
+          - const: cnm,coda7541
+      - items:
+          - enum:
+              - fsl,imx6dl-vpu
+              - fsl,imx6q-vpu
+          - const: cnm,coda960
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PER clock
+      - description: AHB interface clock
+
+  clock-names:
+    items:
+      - const: per
+      - const: ahb
+
+  resets:
+    maxItems: 1
+
+  iram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle pointing to the SRAM device node
+    maxItems: 1
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
+            const: cnm,coda960
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: BIT processor interrupt
+            - description: JPEG unit interrupt
+
+        interrupt-names:
+          items:
+            - const: bit
+            - const: jpeg
+    else:
+      properties:
+        interrupts:
+          items:
+            - description: BIT processor interrupt
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx6dl-vpu
+              - fsl,imx6q-vpu
+    then:
+      properties:
+        power-domains:
+          $ref: /schemas/types.yaml#/definitions/phandle
+          description: phandle pointing to the PU power domain
+          maxItems: 1
+
+examples:
+  - |
+    vpu: video-codec@63ff4000 {
+        compatible = "fsl,imx53-vpu", "cnm,coda7541";
+        reg = <0x63ff4000 0x1000>;
+        interrupts = <9>;
+        clocks = <&clks 63>, <&clks 63>;
+        clock-names = "ahb", "per";
+        iram = <&ocram>;
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index d3126fc2cca2..01be39a3265e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4332,7 +4332,7 @@ CODA V4L2 MEM2MEM DRIVER
 M:	Philipp Zabel <p.zabel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/coda.txt
+F:	Documentation/devicetree/bindings/media/coda.yaml
 F:	drivers/media/platform/coda/
 
 CODE OF CONDUCT
-- 
2.20.1

