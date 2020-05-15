Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 858EA1D42DF
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 03:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728270AbgEOBYw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 21:24:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54656 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728228AbgEOBYw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 21:24:52 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B098BA24;
        Fri, 15 May 2020 03:24:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589505887;
        bh=3Yje2hcQgIpc6nSo15FfU+b7I6MM2KT2k9pL8zJHcAE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KRm7B569e4u1RDjj8aUcLZO1Lwt8i+xfO3Zn/tnhjJxXrQ44vCR52CT5b2b2iHrnu
         qKpYkSBk/x2uCFJ54eHXsYCnGHP2LFjwmleAbNIEToNqngdSzeTSP5X8Yf3oORMPir
         Dodr4rRMzL83hQ+BBoosnzVMNe6NdDobR68sWj1Q=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 4/8] dt-bindings: media: renesas,fdp1: Convert binding to YAML
Date:   Fri, 15 May 2020 04:24:28 +0300
Message-Id: <20200515012432.31326-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the Renesas R-Car FDP1 text binding to YAML.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../bindings/media/renesas,fdp1.txt           | 37 -----------
 .../bindings/media/renesas,fdp1.yaml          | 63 +++++++++++++++++++
 2 files changed, 63 insertions(+), 37 deletions(-)
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
-- 
Regards,

Laurent Pinchart

