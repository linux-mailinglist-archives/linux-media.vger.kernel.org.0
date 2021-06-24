Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C01D33B36E4
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 21:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232897AbhFXTZ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 15:25:26 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48102 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232905AbhFXTZS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 15:25:18 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15OJMuJZ089523;
        Thu, 24 Jun 2021 14:22:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1624562576;
        bh=FdQX90GiXd3myju8xVM4U8B2Nc97WDDrUkPR3o8EX0k=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=yt/iY6qoz9OhyItEuuCINwZ1LVyVs8pgKFZF9Hn56wQ7u1rvDGWHn5RpPGjqcQ11h
         4I//eOyMK6m96mMQAdHqQAj+AoERACXFjGeBSajV3L6u2yLBU91pUqdEXuiFhk7HJ4
         uPeSTfjVG0laqrXrN3mYTrsIMFd/AnhNAUW3jYXI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15OJMuuZ086307
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 24 Jun 2021 14:22:56 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 24
 Jun 2021 14:22:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 24 Jun 2021 14:22:55 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15OJM14R120548;
        Thu, 24 Jun 2021 14:22:52 -0500
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v3 11/11] media: dt-bindings: Convert Cadence CSI2RX binding to YAML
Date:   Fri, 25 Jun 2021 00:52:00 +0530
Message-ID: <20210624192200.22559-12-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210624192200.22559-1-p.yadav@ti.com>
References: <20210624192200.22559-1-p.yadav@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the Cadence CSI2RX binding to use YAML schema.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

---

Changes in v3:
- Add compatible: contains: const: cdns,csi2rx to allow SoC specific
  compatible.
- Add more constraints for data-lanes property.

Changes in v2:
- New in v2.

 .../devicetree/bindings/media/cdns,csi2rx.txt | 100 -----------
 .../bindings/media/cdns,csi2rx.yaml           | 169 ++++++++++++++++++
 2 files changed, 169 insertions(+), 100 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/cdns,csi2rx.txt
 create mode 100644 Documentation/devicetree/bindings/media/cdns,csi2rx.yaml

diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
deleted file mode 100644
index 6b02a0657ad9..000000000000
--- a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
+++ /dev/null
@@ -1,100 +0,0 @@
-Cadence MIPI-CSI2 RX controller
-===============================
-
-The Cadence MIPI-CSI2 RX controller is a CSI-2 bridge supporting up to 4 CSI
-lanes in input, and 4 different pixel streams in output.
-
-Required properties:
-  - compatible: must be set to "cdns,csi2rx" and an SoC-specific compatible
-  - reg: base address and size of the memory mapped region
-  - clocks: phandles to the clocks driving the controller
-  - clock-names: must contain:
-    * sys_clk: main clock
-    * p_clk: register bank clock
-    * pixel_if[0-3]_clk: pixel stream output clock, one for each stream
-                         implemented in hardware, between 0 and 3
-
-Optional properties:
-  - phys: phandle to the external D-PHY, phy-names must be provided
-  - phy-names: must contain "dphy", if the implementation uses an
-               external D-PHY
-
-Required subnodes:
-  - ports: A ports node with one port child node per device input and output
-           port, in accordance with the video interface bindings defined in
-           Documentation/devicetree/bindings/media/video-interfaces.txt. The
-           port nodes are numbered as follows:
-
-           Port Description
-           -----------------------------
-           0    CSI-2 input
-           1    Stream 0 output
-           2    Stream 1 output
-           3    Stream 2 output
-           4    Stream 3 output
-
-           The stream output port nodes are optional if they are not
-           connected to anything at the hardware level or implemented
-           in the design.Since there is only one endpoint per port,
-           the endpoints are not numbered.
-
-
-Example:
-
-csi2rx: csi-bridge@0d060000 {
-	compatible = "cdns,csi2rx";
-	reg = <0x0d060000 0x1000>;
-	clocks = <&byteclock>, <&byteclock>
-		 <&coreclock>, <&coreclock>,
-		 <&coreclock>, <&coreclock>;
-	clock-names = "sys_clk", "p_clk",
-		      "pixel_if0_clk", "pixel_if1_clk",
-		      "pixel_if2_clk", "pixel_if3_clk";
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			csi2rx_in_sensor: endpoint {
-				remote-endpoint = <&sensor_out_csi2rx>;
-				clock-lanes = <0>;
-				data-lanes = <1 2>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-
-			csi2rx_out_grabber0: endpoint {
-				remote-endpoint = <&grabber0_in_csi2rx>;
-			};
-		};
-
-		port@2 {
-			reg = <2>;
-
-			csi2rx_out_grabber1: endpoint {
-				remote-endpoint = <&grabber1_in_csi2rx>;
-			};
-		};
-
-		port@3 {
-			reg = <3>;
-
-			csi2rx_out_grabber2: endpoint {
-				remote-endpoint = <&grabber2_in_csi2rx>;
-			};
-		};
-
-		port@4 {
-			reg = <4>;
-
-			csi2rx_out_grabber3: endpoint {
-				remote-endpoint = <&grabber3_in_csi2rx>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
new file mode 100644
index 000000000000..8e42c9fdaaa3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cdns,csi2rx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence MIPI-CSI2 RX controller
+
+description: |
+  The Cadence MIPI-CSI2 RX controller is a CSI-2 bridge supporting up to 4 CSI
+  lanes in input, and 4 different pixel streams in output.
+
+maintainers:
+  - Pratyush Yadav <p.yadav@ti.com>
+
+properties:
+  compatible:
+    contains:
+      const: cdns,csi2rx
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+    maxItems: 6
+
+  clock-names:
+    minItems: 3
+    maxItems: 6
+    items:
+      - const: sys_clk # main clock
+      - const: p_clk # register bank clock
+      - const: pixel_if0_clk # pixel stream 0 output clock
+      - const: pixel_if1_clk # pixel stream 1 output clock
+      - const: pixel_if2_clk # pixel stream 2 output clock
+      - const: pixel_if3_clk # pixel stream 3 output clock
+
+  phys:
+    maxItems: 1
+    description: phandle to the external D-PHY
+
+  phy-names:
+    items:
+      - const: dphy
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI-2 input
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                minItems: 1
+                maxItems: 4
+                uniqueItems: true
+                items:
+                  maximum: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Stream 0 output
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Stream 1 output
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Stream 2 output
+
+      port@4:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Stream 3 output
+
+    required:
+      - port@0
+
+
+dependencies:
+  phys: [ 'phy-names' ]
+  phy-names: [ 'phys' ]
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    csi2rx: csi-bridge@d060000 {
+      compatible = "cdns,csi2rx";
+      reg = <0x0d060000 0x1000>;
+      clocks = <&byteclock>, <&byteclock>,
+        <&coreclock>, <&coreclock>,
+        <&coreclock>, <&coreclock>;
+      clock-names = "sys_clk", "p_clk",
+              "pixel_if0_clk", "pixel_if1_clk",
+              "pixel_if2_clk", "pixel_if3_clk";
+      phys = <&dphy0>;
+      phy-names = "dphy";
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+
+          csi2rx_in_sensor: endpoint {
+            remote-endpoint = <&sensor_out_csi2rx>;
+            clock-lanes = <0>;
+            data-lanes = <1 2>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+
+          csi2rx_out_grabber0: endpoint {
+            remote-endpoint = <&grabber0_in_csi2rx>;
+          };
+        };
+
+        port@2 {
+          reg = <2>;
+
+          csi2rx_out_grabber1: endpoint {
+            remote-endpoint = <&grabber1_in_csi2rx>;
+          };
+        };
+
+        port@3 {
+          reg = <3>;
+
+          csi2rx_out_grabber2: endpoint {
+            remote-endpoint = <&grabber2_in_csi2rx>;
+          };
+        };
+
+        port@4 {
+          reg = <4>;
+
+          csi2rx_out_grabber3: endpoint {
+            remote-endpoint = <&grabber3_in_csi2rx>;
+          };
+        };
+      };
+    };
-- 
2.30.0

