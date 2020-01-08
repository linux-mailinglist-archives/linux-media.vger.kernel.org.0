Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5B4134F23
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 22:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgAHVwZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 16:52:25 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:2895 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726758AbgAHVwZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Jan 2020 16:52:25 -0500
X-Halon-ID: 200c5d8a-3261-11ea-a00b-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac5d7b.dip0.t-ipconnect.de [84.172.93.123])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 200c5d8a-3261-11ea-a00b-005056917a89;
        Wed, 08 Jan 2020 22:52:22 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] dt-bindings: rcar-csi2: Convert bindings to json-schema
Date:   Wed,  8 Jan 2020 22:52:09 +0100
Message-Id: <20200108215209.1825544-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert Renesas R-Car MIPI CSI-2 receiver bindings documentation to
json-schema.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../bindings/media/renesas,csi2.txt           | 107 ----------
 .../bindings/media/renesas,csi2.yaml          | 198 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 199 insertions(+), 108 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,csi2.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,csi2.yaml

diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.txt b/Documentation/devicetree/bindings/media/renesas,csi2.txt
deleted file mode 100644
index 2da6f60b2b5659f6..0000000000000000
--- a/Documentation/devicetree/bindings/media/renesas,csi2.txt
+++ /dev/null
@@ -1,107 +0,0 @@
-Renesas R-Car MIPI CSI-2
-------------------------
-
-The R-Car CSI-2 receiver device provides MIPI CSI-2 capabilities for the
-Renesas R-Car and RZ/G2 family of devices. It is used in conjunction with the
-R-Car VIN module, which provides the video capture capabilities.
-
-Mandatory properties
---------------------
- - compatible: Must be one or more of the following
-   - "renesas,r8a774a1-csi2" for the R8A774A1 device.
-   - "renesas,r8a774b1-csi2" for the R8A774B1 device.
-   - "renesas,r8a774c0-csi2" for the R8A774C0 device.
-   - "renesas,r8a7795-csi2" for the R8A7795 device.
-   - "renesas,r8a7796-csi2" for the R8A7796 device.
-   - "renesas,r8a77965-csi2" for the R8A77965 device.
-   - "renesas,r8a77970-csi2" for the R8A77970 device.
-   - "renesas,r8a77980-csi2" for the R8A77980 device.
-   - "renesas,r8a77990-csi2" for the R8A77990 device.
-
- - reg: the register base and size for the device registers
- - interrupts: the interrupt for the device
- - clocks: A phandle + clock specifier for the module clock
- - resets: A phandle + reset specifier for the module reset
-
-The device node shall contain two 'port' child nodes according to the
-bindings defined in Documentation/devicetree/bindings/media/
-video-interfaces.txt. port@0 shall connect to the CSI-2 source. port@1
-shall connect to all the R-Car VIN modules that have a hardware
-connection to the CSI-2 receiver.
-
-- port@0- Video source (mandatory)
-	- endpoint@0 - sub-node describing the endpoint that is the video source
-
-- port@1 - VIN instances (optional)
-	- One endpoint sub-node for every R-Car VIN instance which is connected
-	  to the R-Car CSI-2 receiver.
-
-Example:
-
-	csi20: csi2@fea80000 {
-		compatible = "renesas,r8a7796-csi2";
-		reg = <0 0xfea80000 0 0x10000>;
-		interrupts = <0 184 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cpg CPG_MOD 714>;
-		power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
-		resets = <&cpg 714>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				reg = <0>;
-
-				csi20_in: endpoint@0 {
-					reg = <0>;
-					clock-lanes = <0>;
-					data-lanes = <1>;
-					remote-endpoint = <&adv7482_txb>;
-				};
-			};
-
-			port@1 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				reg = <1>;
-
-				csi20vin0: endpoint@0 {
-					reg = <0>;
-					remote-endpoint = <&vin0csi20>;
-				};
-				csi20vin1: endpoint@1 {
-					reg = <1>;
-					remote-endpoint = <&vin1csi20>;
-				};
-				csi20vin2: endpoint@2 {
-					reg = <2>;
-					remote-endpoint = <&vin2csi20>;
-				};
-				csi20vin3: endpoint@3 {
-					reg = <3>;
-					remote-endpoint = <&vin3csi20>;
-				};
-				csi20vin4: endpoint@4 {
-					reg = <4>;
-					remote-endpoint = <&vin4csi20>;
-				};
-				csi20vin5: endpoint@5 {
-					reg = <5>;
-					remote-endpoint = <&vin5csi20>;
-				};
-				csi20vin6: endpoint@6 {
-					reg = <6>;
-					remote-endpoint = <&vin6csi20>;
-				};
-				csi20vin7: endpoint@7 {
-					reg = <7>;
-					remote-endpoint = <&vin7csi20>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
new file mode 100644
index 0000000000000000..408442a0c389a5d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
@@ -0,0 +1,198 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2020 Renesas Electronics Corp.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/renesas,csi2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car MIPI CSI-2 receiver
+
+maintainers:
+  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
+
+description:
+  The R-Car CSI-2 receiver device provides MIPI CSI-2 capabilities for the
+  Renesas R-Car and RZ/G2 family of devices. It is used in conjunction with the
+  R-Car VIN module, which provides the video capture capabilities.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - renesas,r8a774a1-csi2 # RZ/G2M
+        - renesas,r8a774b1-csi2 # RZ/G2N
+        - renesas,r8a774c0-csi2 # RZ/G2E
+        - renesas,r8a7795-csi2  # R-Car H3
+        - renesas,r8a7796-csi2  # R-Car M3-W
+        - renesas,r8a77965-csi2 # R-Car M3-N
+        - renesas,r8a77970-csi2 # R-Car V3M
+        - renesas,r8a77980-csi2 # R-Car V3H
+        - renesas,r8a77990-csi2 # R-Car E3
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
+  ports:
+    type: object
+    description:
+      A node containing input and output port nodes with endpoint definitions
+      as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+
+    properties:
+      port@0:
+        type: object
+        description:
+          Input port node, single endpoint describing the CSI-2 transmitter.
+
+        properties:
+          reg:
+            const: 0
+
+          endpoint:
+            type: object
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                maxItems: 1
+
+              remote-endpoint: true
+
+            required:
+              - clock-lanes
+              - data-lanes
+              - remote-endpoint
+
+            additionalProperties: false
+
+        additionalProperties: false
+
+      port@1:
+        type: object
+        description:
+          Output port node, multiple endpoints describing all the R-Car VIN
+          modules connected the CSI-2 receiver.
+
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+          reg:
+            const: 1
+
+        patternProperties:
+          "^endpoint@[0-9a-f]$":
+            type: object
+
+            properties:
+              reg:
+                maxItems: 1
+
+              remote-endpoint: true
+
+            required:
+              - reg
+              - remote-endpoint
+
+            additionalProperties: false
+
+        additionalProperties: false
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
+    #include <dt-bindings/clock/r8a7796-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7796-sysc.h>
+
+    csi20: csi2@fea80000 {
+            compatible = "renesas,r8a7796-csi2";
+            reg = <0 0xfea80000 0 0x10000>;
+            interrupts = <0 184 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD 714>;
+            power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+            resets = <&cpg 714>;
+
+            ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                            reg = <0>;
+
+                            csi20_in: endpoint {
+                                    clock-lanes = <0>;
+                                    data-lanes = <1>;
+                                    remote-endpoint = <&adv7482_txb>;
+                            };
+                    };
+
+                    port@1 {
+                            #address-cells = <1>;
+                            #size-cells = <0>;
+
+                            reg = <1>;
+
+                            csi20vin0: endpoint@0 {
+                                    reg = <0>;
+                                    remote-endpoint = <&vin0csi20>;
+                            };
+                            csi20vin1: endpoint@1 {
+                                    reg = <1>;
+                                    remote-endpoint = <&vin1csi20>;
+                            };
+                            csi20vin2: endpoint@2 {
+                                    reg = <2>;
+                                    remote-endpoint = <&vin2csi20>;
+                            };
+                            csi20vin3: endpoint@3 {
+                                    reg = <3>;
+                                    remote-endpoint = <&vin3csi20>;
+                            };
+                            csi20vin4: endpoint@4 {
+                                    reg = <4>;
+                                    remote-endpoint = <&vin4csi20>;
+                            };
+                            csi20vin5: endpoint@5 {
+                                    reg = <5>;
+                                    remote-endpoint = <&vin5csi20>;
+                            };
+                            csi20vin6: endpoint@6 {
+                                    reg = <6>;
+                                    remote-endpoint = <&vin6csi20>;
+                            };
+                            csi20vin7: endpoint@7 {
+                                    reg = <7>;
+                                    remote-endpoint = <&vin7csi20>;
+                            };
+                    };
+            };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0dd2431bf239110d..c0d5c37c7f7b3b1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10309,7 +10309,7 @@ L:	linux-media@vger.kernel.org
 L:	linux-renesas-soc@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Supported
-F:	Documentation/devicetree/bindings/media/renesas,csi2.txt
+F:	Documentation/devicetree/bindings/media/renesas,csi2.yaml
 F:	Documentation/devicetree/bindings/media/renesas,vin.txt
 F:	drivers/media/platform/rcar-vin/
 
-- 
2.24.1

