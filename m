Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18F2840C4D9
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 14:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237873AbhIOMFM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 08:05:12 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46772 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237834AbhIOMEv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 08:04:51 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18FC3R5w066510;
        Wed, 15 Sep 2021 07:03:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1631707407;
        bh=vTvtlpflSxIHLgiIUmQ7qVkhakZbTnWnNKgslc6WBI8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=l46h7pRx4pXZzGMty2wRkPhvh+ls5KzESCm04oTiJi8NgA2S+H666Fr/siz1zJs0l
         LmvswBCP+4rEqjF/iULEQ3GYQWtkOPSws6GCrh3oMgza3QkG1jXj2uiQOTUorSuiv7
         ZxtX3D/R+jMr7kw+smUmaJ/qN70EemsTVMXNb/vU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18FC3R2B100415
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Sep 2021 07:03:27 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 15
 Sep 2021 07:03:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 15 Sep 2021 07:03:26 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18FC2fDB019246;
        Wed, 15 Sep 2021 07:03:23 -0500
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>
Subject: [PATCH v4 10/11] media: dt-bindings: Add DT bindings for TI J721E CSI2RX driver
Date:   Wed, 15 Sep 2021 17:32:39 +0530
Message-ID: <20210915120240.21572-11-p.yadav@ti.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915120240.21572-1-p.yadav@ti.com>
References: <20210915120240.21572-1-p.yadav@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

TI's J721E uses the Cadence CSI2RX and DPHY peripherals to facilitate
capture over a CSI-2 bus. The TI CSI2RX platform driver glues all the
parts together.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

---

(no changes since v2)

Changes in v2:
- Rename to ti,j721e-csi2rx.yaml
- Add an entry in MAINTAINERS.
- Add a description for the binding.
- Change compatible to ti,j721e-csi2rx to make it SoC specific.
- Remove description from dmas, reg, power-domains.
- Remove a limit of 2 from #address-cells and #size-cells.
- Fix add ^ to csi-bridge subnode regex.
- Make ranges mandatory.
- Add unit address in example.
- Add a reference to cdns,csi2rx in csi-bridge subnode.
- Expand the example to include the csi-bridge subnode as well.
- Re-order subject prefixes.

 .../bindings/media/ti,j721e-csi2rx.yaml       | 101 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml

diff --git a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml
new file mode 100644
index 000000000000..db87cfd65bed
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/ti,j721e-csi2rx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI J721E CSI2RX Wrapper Device Tree Bindings
+
+description: |
+  The TI J721E CSI2RX Wrapper is a wrapper around Cadence CSI2RX bridge that
+  enables sending captured frames to memory over PSI-L DMA. In the J721E
+  Technical Reference Manual (SPRUIL1B) it is referred to as "SHIM" under the
+  CSI_RX_IF section.
+
+maintainers:
+  - Pratyush Yadav <p.yadav@ti.com>
+
+properties:
+  compatible:
+    items:
+      - const: ti,j721e-csi2rx
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    items:
+      - const: rx0
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ranges: true
+
+  "#address-cells": true
+
+  "#size-cells": true
+
+patternProperties:
+  "^csi-bridge@":
+    type: object
+    description: CSI2 bridge node.
+    $ref: cdns,csi2rx.yaml#
+
+required:
+  - compatible
+  - reg
+  - dmas
+  - dma-names
+  - power-domains
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    ti_csi2rx0: ticsi2rx@4500000 {
+        compatible = "ti,j721e-csi2rx";
+        dmas = <&main_udmap 0x4940>;
+        dma-names = "rx0";
+        reg = <0x4500000 0x1000>;
+        power-domains = <&k3_pds 26 TI_SCI_PD_EXCLUSIVE>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        cdns_csi2rx: csi-bridge@4504000 {
+            compatible = "cdns,csi2rx";
+            reg = <0x4504000 0x1000>;
+            clocks = <&k3_clks 26 2>, <&k3_clks 26 0>, <&k3_clks 26 2>,
+              <&k3_clks 26 2>, <&k3_clks 26 3>, <&k3_clks 26 3>;
+            clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
+              "pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
+            phys = <&dphy0>;
+            phy-names = "dphy";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                csi2_0: port@0 {
+
+                    reg = <0>;
+
+                    csi2rx0_in_sensor: endpoint {
+                        remote-endpoint = <&csi2_cam0>;
+                        bus-type = <4>; /* CSI2 DPHY. */
+                        clock-lanes = <0>;
+                        data-lanes = <1 2>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 7ee236cbd016..7b3e557c9d3b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18716,6 +18716,7 @@ TI J721E CSI2RX DRIVER
 M:	Pratyush Yadav <p.yadav@ti.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
+F:	Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml
 F:	drivers/media/platform/ti/j721e-csi2rx/
 
 TI DAVINCI MACHINE SUPPORT
-- 
2.33.0

