Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4F3388E86
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 15:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353479AbhESNDI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 09:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240957AbhESNDH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 09:03:07 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1828BC06175F
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 06:01:47 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:c161:a89e:52bd:1787])
        by albert.telenet-ops.be with bizsmtp
        id 6d1n2500E446CkP06d1nqM; Wed, 19 May 2021 15:01:47 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ljLpb-007FKq-7q; Wed, 19 May 2021 15:01:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ljLpa-007dZC-7J; Wed, 19 May 2021 15:01:46 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: media: renesas,imr: Convert to json-schema
Date:   Wed, 19 May 2021 15:01:43 +0200
Message-Id: <353c2d181ceb6a5dfc553f88a201c6b18ee6914d.1621429265.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the Renesas R-Car Image Renderer Tree binding documentation to
json-schema.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I have listed Sergei as the maintainer, as he wrote the original
bindings.  Sergei: Please scream if this is inappropriate ;-)
---
 .../devicetree/bindings/media/renesas,imr.txt | 31 ---------
 .../bindings/media/renesas,imr.yaml           | 66 +++++++++++++++++++
 2 files changed, 66 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,imr.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,imr.yaml

diff --git a/Documentation/devicetree/bindings/media/renesas,imr.txt b/Documentation/devicetree/bindings/media/renesas,imr.txt
deleted file mode 100644
index b0614153ed3682eb..0000000000000000
--- a/Documentation/devicetree/bindings/media/renesas,imr.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Renesas R-Car Image Renderer (Distortion Correction Engine)
------------------------------------------------------------
-
-The image renderer, or the distortion correction engine, is a drawing processor
-with a simple instruction system capable of referencing video capture data or
-data in an external memory as 2D texture data and performing texture mapping
-and drawing with respect to any shape that is split into triangular objects.
-
-Required properties:
-
-- compatible: "renesas,<soctype>-imr-lx4", "renesas,imr-lx4" as a fallback for
-  the image renderer light extended 4 (IMR-LX4) found in the R-Car gen3 SoCs,
-  where the examples with <soctype> are:
-  - "renesas,r8a7795-imr-lx4" for R-Car H3,
-  - "renesas,r8a7796-imr-lx4" for R-Car M3-W.
-- reg: offset and length of the register block;
-- interrupts: single interrupt specifier;
-- clocks: single clock phandle/specifier pair;
-- power-domains: power domain phandle/specifier pair;
-- resets: reset phandle/specifier pair.
-
-Example:
-
-	imr-lx4@fe860000 {
-		compatible = "renesas,r8a7795-imr-lx4", "renesas,imr-lx4";
-		reg = <0 0xfe860000 0 0x2000>;
-		interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cpg CPG_MOD 823>;
-		power-domains = <&sysc R8A7795_PD_A3VC>;
-		resets = <&cpg 823>;
-	};
diff --git a/Documentation/devicetree/bindings/media/renesas,imr.yaml b/Documentation/devicetree/bindings/media/renesas,imr.yaml
new file mode 100644
index 0000000000000000..ea4579209e81660f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,imr.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/renesas,imr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car Image Renderer (Distortion Correction Engine)
+
+maintainers:
+  - Sergei Shtylyov <sergei.shtylyov@gmail.com>
+
+description:
+  The image renderer, or the distortion correction engine, is a drawing
+  processor with a simple instruction system capable of referencing video
+  capture data or data in an external memory as 2D texture data and performing
+  texture mapping and drawing with respect to any shape that is split into
+  triangular objects.
+  The image renderer light extended 4 (IMR-LX4) is found in R-Car Gen3 SoCs.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r8a7795-imr-lx4 # R-Car H3
+          - renesas,r8a7796-imr-lx4 # R-Car M3-W
+      - const: renesas,imr-lx4      # R-Car Gen3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7795-sysc.h>
+
+    imr-lx4@fe860000 {
+            compatible = "renesas,r8a7795-imr-lx4", "renesas,imr-lx4";
+            reg = <0xfe860000 0x2000>;
+            interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD 823>;
+            power-domains = <&sysc R8A7795_PD_A3VC>;
+            resets = <&cpg 823>;
+    };
-- 
2.25.1

