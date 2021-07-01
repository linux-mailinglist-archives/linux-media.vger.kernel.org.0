Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3E543B915C
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 13:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236322AbhGAL7K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 07:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236287AbhGAL7K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 07:59:10 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCBB2C0617AD
        for <linux-media@vger.kernel.org>; Thu,  1 Jul 2021 04:56:39 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:445e:1c3:be41:9e10])
        by andre.telenet-ops.be with bizsmtp
        id Pnwd2500A474TTe01nwdQA; Thu, 01 Jul 2021 13:56:37 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lyvJ6-005M6V-Kv; Thu, 01 Jul 2021 13:56:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lyvJ5-00EXKO-PO; Thu, 01 Jul 2021 13:56:35 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2] dt-bindings: media: renesas,imr: Convert to json-schema
Date:   Thu,  1 Jul 2021 13:56:34 +0200
Message-Id: <eb0f8a890450d0cf155c7595c5e514c8f877c4c0.1625140547.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the Renesas R-Car Image Renderer Device Tree binding
documentation to json-schema.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
I have listed Sergei as the maintainer, as he wrote the original
bindings.  Sergei: Please scream if this is inappropriate ;-)

v2:
  - Add blank line between paragraphs in description,
  - Add "|" to preserve description formatting,
  - Add Reviewed-by,
  - s/Tree/Device Tree/ in description.
---
 .../devicetree/bindings/media/renesas,imr.txt | 31 ---------
 .../bindings/media/renesas,imr.yaml           | 67 +++++++++++++++++++
 2 files changed, 67 insertions(+), 31 deletions(-)
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
index 0000000000000000..512f57417fd87b7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,imr.yaml
@@ -0,0 +1,67 @@
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
+description: |
+  The image renderer, or the distortion correction engine, is a drawing
+  processor with a simple instruction system capable of referencing video
+  capture data or data in an external memory as 2D texture data and performing
+  texture mapping and drawing with respect to any shape that is split into
+  triangular objects.
+
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

