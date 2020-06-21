Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6982027B8
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2020 02:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729092AbgFUAsJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jun 2020 20:48:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60972 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729079AbgFUAsI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jun 2020 20:48:08 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19F00817;
        Sun, 21 Jun 2020 02:48:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592700484;
        bh=5jOr66uIBXjaqfUkt5cbU7pT1vaCReFDDMq995VLLQw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k/pYNUELg8KmV6QrUTJA9qEKHmwqkQOob3RYOEY50cFJZ5gRJQsZK8n4oD73k4dg5
         m9LChgC2CbCgUpItBA/C5vPpe8VxfMcsK+lLfYU1kdjmuRJGxjbh+tailZJ/HhfWLQ
         640nnilzviX0tNenUkEe5ZqP4q4o9xHU1VqmVDp4=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 4/8] dt-bindings: media: renesas,fdp1: Convert binding to YAML
Date:   Sun, 21 Jun 2020 03:47:30 +0300
Message-Id: <20200621004734.28602-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the Renesas R-Car FDP1 text binding to YAML.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes since v1:

- Update MAINTAINERS
---
 .../bindings/media/renesas,fdp1.txt           | 37 -----------
 .../bindings/media/renesas,fdp1.yaml          | 63 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 64 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.yaml

diff --git a/Documentation/devicetree/bindings/media/renesas,fdp1.txt b/Documentation/devicetree/bindings/media/renesas,fdp1.txt
deleted file mode 100644
index 8dd1007bb573..000000000000
--- a/Documentation/devicetree/bindings/media/renesas,fdp1.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Renesas R-Car Fine Display Processor (FDP1)
--------------------------------------------
-
-The FDP1 is a de-interlacing module which converts interlaced video to
-progressive video. It is capable of performing pixel format conversion between
-YCbCr/YUV formats and RGB formats. Only YCbCr/YUV formats are supported as
-an input to the module.
-
-Required properties:
-
- - compatible: must be "renesas,fdp1"
- - reg: the register base and size for the device registers
- - interrupts : interrupt specifier for the FDP1 instance
- - clocks: reference to the functional clock
-
-Optional properties:
-
- - power-domains: reference to the power domain that the FDP1 belongs to, if
-                  any.
- - renesas,fcp: a phandle referencing the FCP that handles memory accesses
-                for the FDP1. Not needed on Gen2, mandatory on Gen3.
-
-Please refer to the binding documentation for the clock and/or power domain
-providers for more details.
-
-
-Device node example
--------------------
-
-	fdp1@fe940000 {
-		compatible = "renesas,fdp1";
-		reg = <0 0xfe940000 0 0x2400>;
-		interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cpg CPG_MOD 119>;
-		power-domains = <&sysc R8A7795_PD_A3VP>;
-		renesas,fcp = <&fcpf0>;
-	};
diff --git a/Documentation/devicetree/bindings/media/renesas,fdp1.yaml b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
new file mode 100644
index 000000000000..f4db96a1f53c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/renesas,fdp1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car Fine Display Processor (FDP1)
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+description:
+  The FDP1 is a de-interlacing module which converts interlaced video to
+  progressive video. It is capable of performing pixel format conversion
+  between YCbCr/YUV formats and RGB formats. Only YCbCr/YUV formats are
+  supported as an input to the module.
+
+properties:
+  compatible:
+    enum:
+      - renesas,fdp1
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
+  renesas,fcp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle referencing the FCP that handles memory accesses for the FDP1.
+      Not allowed on R-Car Gen2, mandatory on R-Car Gen3.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7795-sysc.h>
+
+    fdp1@fe940000 {
+        compatible = "renesas,fdp1";
+        reg = <0xfe940000 0x2400>;
+        interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 119>;
+        power-domains = <&sysc R8A7795_PD_A3VP>;
+        renesas,fcp = <&fcpf0>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 660ed6606de2..7383dfa510a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10710,7 +10710,7 @@ L:	linux-media@vger.kernel.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/renesas,fdp1.txt
+F:	Documentation/devicetree/bindings/media/renesas,fdp1.yaml
 F:	drivers/media/platform/rcar_fdp1.c
 
 MEDIA DRIVERS FOR RENESAS - VIN
-- 
Regards,

Laurent Pinchart

