Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D284388E81
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 15:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241137AbhESNCZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 09:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbhESNCY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 09:02:24 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71438C061761
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 06:01:03 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:c161:a89e:52bd:1787])
        by albert.telenet-ops.be with bizsmtp
        id 6d112500R446CkP06d11ib; Wed, 19 May 2021 15:01:01 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ljLor-007FKQ-3V; Wed, 19 May 2021 15:01:01 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ljLoq-007dWN-9R; Wed, 19 May 2021 15:01:00 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: media: renesas,jpu: Convert to json-schema
Date:   Wed, 19 May 2021 15:00:56 +0200
Message-Id: <ded1a61cbaa39fa7a15efdaa2fdfa4fdb307b930.1621429165.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the Renesas JPEG Processing Unit Device Tree binding
documentation to json-schema.

Document missing properties.
Update the example to match reality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I have listed Mikhail as the maintainer, as he wrote the original driver
and bindings.  Mikhail: Please scream if this is inappropriate ;-)
---
 .../devicetree/bindings/media/renesas,jpu.txt | 25 -------
 .../bindings/media/renesas,jpu.yaml           | 65 +++++++++++++++++++
 2 files changed, 65 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,jpu.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,jpu.yaml

diff --git a/Documentation/devicetree/bindings/media/renesas,jpu.txt b/Documentation/devicetree/bindings/media/renesas,jpu.txt
deleted file mode 100644
index d3436e5190f9196a..0000000000000000
--- a/Documentation/devicetree/bindings/media/renesas,jpu.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-* Renesas JPEG Processing Unit
-
-The JPEG processing unit (JPU) incorporates the JPEG codec with an encoding
-and decoding function conforming to the JPEG baseline process, so that the JPU
-can encode image data and decode JPEG data quickly.
-
-Required properties:
-- compatible: "renesas,jpu-<soctype>", "renesas,rcar-gen2-jpu" as fallback.
-	Examples with soctypes are:
-	  - "renesas,jpu-r8a7790" for R-Car H2
-	  - "renesas,jpu-r8a7791" for R-Car M2-W
-	  - "renesas,jpu-r8a7792" for R-Car V2H
-	  - "renesas,jpu-r8a7793" for R-Car M2-N
-
-  - reg: Base address and length of the registers block for the JPU.
-  - interrupts: JPU interrupt specifier.
-  - clocks: A phandle + clock-specifier pair for the JPU functional clock.
-
-Example: R8A7790 (R-Car H2) JPU node
-	jpeg-codec@fe980000 {
-		compatible = "renesas,jpu-r8a7790", "renesas,rcar-gen2-jpu";
-		reg = <0 0xfe980000 0 0x10300>;
-		interrupts = <0 272 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp1_clks R8A7790_CLK_JPU>;
-	};
diff --git a/Documentation/devicetree/bindings/media/renesas,jpu.yaml b/Documentation/devicetree/bindings/media/renesas,jpu.yaml
new file mode 100644
index 0000000000000000..2f55968e864fe2f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,jpu.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/renesas,jpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas JPEG Processing Unit
+
+maintainers:
+  - Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
+
+description:
+  The JPEG processing unit (JPU) incorporates the JPEG codec with an encoding
+  and decoding function conforming to the JPEG baseline process, so that the
+  JPU can encode image data and decode JPEG data quickly.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,jpu-r8a7790      # R-Car H2
+          - renesas,jpu-r8a7791      # R-Car M2-W
+          - renesas,jpu-r8a7792      # R-Car V2H
+          - renesas,jpu-r8a7793      # R-Car M2-N
+      - const: renesas,rcar-gen2-jpu # R-Car Gen2
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
+    #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7790-sysc.h>
+
+    jpeg-codec@fe980000 {
+            compatible = "renesas,jpu-r8a7790", "renesas,rcar-gen2-jpu";
+            reg = <0xfe980000 0x10300>;
+            interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD 106>;
+            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+            resets = <&cpg 106>;
+    };
-- 
2.25.1

