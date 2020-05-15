Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36C2C1D42D5
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 03:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728201AbgEOBYs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 21:24:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54610 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727799AbgEOBYr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 21:24:47 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5B079C5;
        Fri, 15 May 2020 03:24:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589505885;
        bh=a2HFcLZAoRMx4SY/FmPDndHpSCMfzSNRyltMegzXPpM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cumggNLR72QiVqjsEEuWtCJmXJe5Fp17vvHxvDM96InEC+nHMqWtZsr32ghM3BAwd
         QcvPLnMKDgdBeesbtzbgps5fLFgT6TGsQ88e31J3LCeLAFFI2QJUh/8wpgqIYW3Psi
         mP+dFDLIJuBU77WMZMPRqEvuuKmX7GaXqw+JvtkA=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/8] dt-bindings: media: renesas,fcp: Convert binding to YAML
Date:   Fri, 15 May 2020 04:24:25 +0300
Message-Id: <20200515012432.31326-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the Renesas R-Car FCP text binding to YAML.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../devicetree/bindings/media/renesas,fcp.txt | 34 -----------
 .../bindings/media/renesas,fcp.yaml           | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.yaml

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt b/Documentation/devicetree/bindings/media/renesas,fcp.txt
deleted file mode 100644
index 79c37395b396..000000000000
--- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-Renesas R-Car Frame Compression Processor (FCP)
------------------------------------------------
-
-The FCP is a companion module of video processing modules in the Renesas R-Car
-Gen3 and RZ/G2 SoCs. It provides data compression and decompression, data
-caching, and conversion of AXI transactions in order to reduce the memory
-bandwidth.
-
-There are three types of FCP: FCP for Codec (FCPC), FCP for VSP (FCPV) and FCP
-for FDP (FCPF). Their configuration and behaviour depend on the module they
-are paired with. These DT bindings currently support the FCPV and FCPF.
-
- - compatible: Must be one or more of the following
-
-   - "renesas,fcpv" for generic compatible 'FCP for VSP'
-   - "renesas,fcpf" for generic compatible 'FCP for FDP'
-
- - reg: the register base and size for the device registers
- - clocks: Reference to the functional clock
-
-Optional properties:
- - power-domains : power-domain property defined with a power domain specifier
-		   to respective power domain.
-
-
-Device node example
--------------------
-
-	fcpvd1: fcp@fea2f000 {
-		compatible = "renesas,fcpv";
-		reg = <0 0xfea2f000 0 0x200>;
-		clocks = <&cpg CPG_MOD 602>;
-		power-domains = <&sysc R8A7795_PD_A3VP>;
-	};
diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
new file mode 100644
index 000000000000..be085fb398fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car Frame Compression Processor (FCP)
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+description: |
+  The FCP is a companion module of video processing modules in the Renesas
+  R-Car Gen3 and RZ/G2 SoCs. It provides data compression and decompression,
+  data caching, and conversion of AXI transactions in order to reduce the
+  memory bandwidth.
+
+  There are three types of FCP: FCP for Codec (FCPC), FCP for VSP (FCPV) and
+  FCP for FDP (FCPF). Their configuration and behaviour depend on the module
+  they are paired with. These DT bindings currently support the FCPV and FCPF.
+
+properties:
+  compatible:
+    enum:
+      - renesas,fcpv # for 'FCP for VSP'
+      - renesas,fcpf # for 'FCP for FDP'
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  # R8A7790 (R-Car H2) VSP1-S
+  - |
+    #include <dt-bindings/clock/renesas-cpg-mssr.h>
+    #include <dt-bindings/power/r8a7795-sysc.h>
+
+    fcp@fea2f000 {
+        compatible = "renesas,fcpv";
+        reg = <0xfea2f000 0x200>;
+        clocks = <&cpg CPG_MOD 602>;
+        power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+    };
+...
-- 
Regards,

Laurent Pinchart

