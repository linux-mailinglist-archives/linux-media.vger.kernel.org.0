Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA9EF11B9B5
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 18:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730618AbfLKRK6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 12:10:58 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:60313 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729512AbfLKRK5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 12:10:57 -0500
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id DE8F710000F;
        Wed, 11 Dec 2019 17:10:53 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, mark.rutland@arm.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: media: renesas,ceu: Convert to yaml
Date:   Wed, 11 Dec 2019 18:13:00 +0100
Message-Id: <20191211171300.87023-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the Renesas CEU bindings description to yaml schema and remove
the existing textual bindings document.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

---
v1 -> v2:
- Dual license as suggested by Rob
- Fix compatible string for r7s72100-ceu
- Add 'default' to bus-width endpoint property

Thanks
   j
---
 .../devicetree/bindings/media/renesas,ceu.txt | 86 -------------------
 .../bindings/media/renesas,ceu.yaml           | 78 +++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 79 insertions(+), 87 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,ceu.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,ceu.yaml

diff --git a/Documentation/devicetree/bindings/media/renesas,ceu.txt b/Documentation/devicetree/bindings/media/renesas,ceu.txt
deleted file mode 100644
index 3e2a2652eb19..000000000000
--- a/Documentation/devicetree/bindings/media/renesas,ceu.txt
+++ /dev/null
@@ -1,86 +0,0 @@
-Renesas Capture Engine Unit (CEU)
-----------------------------------------------
-
-The Capture Engine Unit is the image capture interface found in the Renesas
-SH Mobile, R-Mobile and RZ SoCs.
-
-The interface supports a single parallel input with data bus width of 8 or 16
-bits.
-
-Required properties:
-- compatible: Shall be one of the following values:
-	"renesas,r7s72100-ceu" for CEU units found in RZ/A1H and RZ/A1M SoCs
-	"renesas,r8a7740-ceu" for CEU units found in R-Mobile A1 R8A7740 SoCs
-- reg: Registers address base and size.
-- interrupts: The interrupt specifier.
-
-The CEU supports a single parallel input and should contain a single 'port'
-subnode with a single 'endpoint'. Connection to input devices are modeled
-according to the video interfaces OF bindings specified in:
-[1] Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Optional endpoint properties applicable to parallel input bus described in
-the above mentioned "video-interfaces.txt" file are supported.
-
-- hsync-active: See [1] for description. If property is not present,
-  default is active high.
-- vsync-active: See [1] for description. If property is not present,
-  default is active high.
-- bus-width: See [1] for description. Accepted values are '8' and '16'.
-  If property is not present, default is '8'.
-- field-even-active: See [1] for description. If property is not present,
-  an even field is identified by a logic 0 (active-low signal).
-
-Example:
-
-The example describes the connection between the Capture Engine Unit and an
-OV7670 image sensor connected to i2c1 interface.
-
-ceu: ceu@e8210000 {
-	reg = <0xe8210000 0x209c>;
-	compatible = "renesas,r7s72100-ceu";
-	interrupts = <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&vio_pins>;
-
-	status = "okay";
-
-	port {
-		ceu_in: endpoint {
-			remote-endpoint = <&ov7670_out>;
-
-			hsync-active = <1>;
-			vsync-active = <0>;
-		};
-	};
-};
-
-i2c1: i2c@fcfee400 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c1_pins>;
-
-	status = "okay";
-
-	clock-frequency = <100000>;
-
-	ov7670: camera@21 {
-		compatible = "ovti,ov7670";
-		reg = <0x21>;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&vio_pins>;
-
-		reset-gpios = <&port3 11 GPIO_ACTIVE_LOW>;
-		powerdown-gpios = <&port3 12 GPIO_ACTIVE_HIGH>;
-
-		port {
-			ov7670_out: endpoint {
-				remote-endpoint = <&ceu_in>;
-
-				hsync-active = <1>;
-				vsync-active = <0>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/media/renesas,ceu.yaml b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
new file mode 100644
index 000000000000..8e9251a0f9ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/renesas,ceu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Capture Engine Unit (CEU) Bindings
+
+maintainers:
+  - Jacopo Mondi <jacopo+renesas@jmondi.org>
+  - linux-renesas-soc@vger.kernel.org
+
+description: |+
+  The Capture Engine Unit is the image capture interface found in the Renesas SH
+  Mobile, R-Mobile and RZ SoCs. The interface supports a single parallel input
+  with data bus width of 8 or 16 bits.
+
+properties:
+  compatible:
+    enum:
+      - renesas,r7s72100-ceu
+      - renesas,r8a7740-ceu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  port:
+    type: object
+    additionalProperties: false
+
+    properties:
+       endpoint:
+         type: object
+         additionalProperties: false
+
+         # Properties described in
+         # Documentation/devicetree/bindings/media/video-interfaces.txt
+         properties:
+           remote-endpoint: true
+           hsync-active: true
+           vsync-active: true
+           field-even-active: false
+           bus-width:
+             enum: [8, 16]
+             default: 8
+
+         required:
+           - remote-endpoint
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - port
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ceu: ceu@e8210000 {
+        reg = <0xe8210000 0x209c>;
+        compatible = "renesas,r7s72100-ceu";
+        interrupts = <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+
+        port {
+            ceu_in: endpoint {
+                remote-endpoint = <&ov7670_out>;
+                hsync-active = <1>;
+                vsync-active = <0>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index eefa1e066655..df75855839f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10276,7 +10276,7 @@ L:	linux-media@vger.kernel.org
 L:	linux-renesas-soc@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Supported
-F:	Documentation/devicetree/bindings/media/renesas,ceu.txt
+F:	Documentation/devicetree/bindings/media/renesas,ceu.yaml
 F:	drivers/media/platform/renesas-ceu.c
 F:	include/media/drv-intf/renesas-ceu.h

--
2.24.0

