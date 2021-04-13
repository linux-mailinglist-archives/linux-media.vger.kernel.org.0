Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328E535E500
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 19:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232455AbhDMR1n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 13:27:43 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:24281 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230035AbhDMR1n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 13:27:43 -0400
X-Halon-ID: 7e8e8836-9c7d-11eb-a9ab-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 7e8e8836-9c7d-11eb-a9ab-0050569116f7;
        Tue, 13 Apr 2021 19:27:22 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: dt-bindings: media: renesas,isp: Add bindings for ISP Channel Selector
Date:   Tue, 13 Apr 2021 19:27:08 +0200
Message-Id: <20210413172708.2519173-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings for Renesas R-Car ISP Channel Selector IP. The ISP is
responsible for filtering the MIPI CSI-2 bus and directing the different
CSI-2 virtual channels to different R-Car VIN instances (DMA engines)
for capture.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../bindings/media/renesas,isp.yaml           | 197 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 198 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/renesas,isp.yaml

diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
new file mode 100644
index 0000000000000000..99a1556d21d00106
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
@@ -0,0 +1,197 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (C) 2021 Renesas Electronics Corp.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/renesas,isp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car ISP Channel Selector
+
+maintainers:
+  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
+
+description:
+  The R-Car ISP Channel Selector provides MIPI CSI-2 VC and DT filtering
+  capabilities for the Renesas R-Car family of devices. It is used in
+  conjunction with the R-Car VIN and CSI-2 modules, which provides the video
+  capture capabilities.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,isp-r8a779a0 # V3U
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
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Input port node, multiple endpoints describing the connected R-Car
+          CSI-2 receivers.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Single endpoint describing the R-Car VIN connected to output port 0.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Single endpoint describing the R-Car VIN connected to output port 1.
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Single endpoint describing the R-Car VIN connected to output port 2.
+
+      port@4:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Single endpoint describing the R-Car VIN connected to output port 3.
+
+      port@5:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Single endpoint describing the R-Car VIN connected to output port 4.
+
+      port@6:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Single endpoint describing the R-Car VIN connected to output port 5.
+
+      port@7:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Single endpoint describing the R-Car VIN connected to output port 6.
+
+      port@8:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Single endpoint describing the R-Car VIN connected to output port 7.
+
+    required:
+      - port@0
+      - port@1
+      - port@2
+      - port@3
+      - port@4
+      - port@5
+      - port@6
+      - port@7
+      - port@8
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - power-domains
+  - resets
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a779a0-sysc.h>
+
+    isp1: isp@fed20000 {
+            compatible = "renesas,isp-r8a779a0";
+            reg = <0xfed20000 0x10000>;
+            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD 613>;
+            power-domains = <&sysc R8A779A0_PD_A3ISP01>;
+            resets = <&cpg 613>;
+            status = "disabled";
+
+            ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                            #address-cells = <1>;
+                            #size-cells = <0>;
+
+                            reg = <0>;
+                            isp1csi41: endpoint@1 {
+                                    reg = <1>;
+                                    remote-endpoint = <&csi41isp1>;
+                            };
+                    };
+
+                    port@1 {
+                            reg = <1>;
+                            isp1vin08: endpoint {
+                                    remote-endpoint = <&vin08isp1>;
+                            };
+                    };
+
+                    port@2 {
+                            reg = <2>;
+                            isp1vin09: endpoint {
+                                    remote-endpoint = <&vin09isp1>;
+                            };
+                    };
+
+                    port@3 {
+                            reg = <3>;
+                            isp1vin10: endpoint {
+                                    remote-endpoint = <&vin10isp1>;
+                            };
+                    };
+
+                    port@4 {
+                            reg = <4>;
+                            isp1vin11: endpoint {
+                                    remote-endpoint = <&vin11isp1>;
+                            };
+                    };
+
+                    port@5 {
+                            reg = <5>;
+                            isp1vin12: endpoint {
+                                    remote-endpoint = <&vin12isp1>;
+                            };
+                    };
+
+                    port@6 {
+                            reg = <6>;
+                            isp1vin13: endpoint {
+                                    remote-endpoint = <&vin13isp1>;
+                            };
+                    };
+
+                    port@7 {
+                            reg = <7>;
+                            isp1vin14: endpoint {
+                                    remote-endpoint = <&vin14isp1>;
+                            };
+                    };
+
+                    port@8 {
+                            reg = <8>;
+                            isp1vin15: endpoint {
+                                    remote-endpoint = <&vin15isp1>;
+                            };
+                    };
+            };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b265a7ba60e709f3..e125d0eed7b021a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11144,6 +11144,7 @@ L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/renesas,csi2.yaml
+F:	Documentation/devicetree/bindings/media/renesas,isp.yaml
 F:	Documentation/devicetree/bindings/media/renesas,vin.yaml
 F:	drivers/media/platform/rcar-vin/
 
-- 
2.31.1

