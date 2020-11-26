Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9702C5843
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 16:29:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391336AbgKZP3s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 10:29:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391362AbgKZP3r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 10:29:47 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 098AEC061A49
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 07:29:47 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kiJDL-000808-N9; Thu, 26 Nov 2020 16:29:45 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kiJDL-00G3Fx-17; Thu, 26 Nov 2020 16:29:43 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     kernel@pengutronix.de, robh+dt@kernel.org,
        hverkuil-cisco@xs4all.nl,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu, 26 Nov 2020 16:29:39 +0100
Message-Id: <20201126152941.3825721-3-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201126152941.3825721-1-m.tretter@pengutronix.de>
References: <20201126152941.3825721-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
        version=3.4.2
Subject: [PATCH 2/4] dt-bindings: media: allegro,al5e: Convert to YAML
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the Allegro DVT video IP codec text binding to Yaml.

Add the converted binding to the MAINTAINERS file.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../bindings/media/allegro,al5e.yaml          | 95 +++++++++++++++++++
 .../devicetree/bindings/media/allegro.txt     | 43 ---------
 MAINTAINERS                                   |  1 +
 3 files changed, 96 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allegro,al5e.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/allegro.txt

diff --git a/Documentation/devicetree/bindings/media/allegro,al5e.yaml b/Documentation/devicetree/bindings/media/allegro,al5e.yaml
new file mode 100644
index 000000000000..1ac698772fa0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allegro,al5e.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allegro,al5e.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allegro DVT Video IP Codecs Device Tree Bindings
+
+maintainers:
+  - Michael Tretter <m.tretter@pengutronix.de>
+
+description: |-
+  Allegro DVT video IP codecs present in the Xilinx ZynqMP SoC. The IP core may
+  either be a H.264/H.265 encoder or H.264/H.265 decoder ip core.
+
+  Each actual codec engine is controlled by a microcontroller (MCU). Host
+  software uses a provided mailbox interface to communicate with the MCU. The
+  MCUs share an interrupt.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - const: allegro,al5e-1.1
+        - const: allegro,al5e
+      - items:
+        - const: allegro,al5d-1.1
+        - const: allegro,al5d
+
+  reg:
+    items:
+      - description: The registers
+      - description: The SRAM
+
+  reg-names:
+    items:
+      - const: regs
+      - const: sram
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core clock
+      - description: MCU clock
+      - description: Core AXI master port clock
+      - description: MCU AXI master port clock
+      - description: AXI4-Lite slave port clock
+
+  clock-names:
+    items:
+      - const: core_clk
+      - const: mcu_clk
+      - const: m_axi_core_aclk
+      - const: m_axi_mcu_aclk
+      - const: s_axi_lite_aclk
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: False
+
+examples:
+  - |
+    al5e: video-codec@a0009000 {
+        compatible = "allegro,al5e-1.1", "allegro,al5e";
+        reg = <0 0xa0009000 0 0x1000>,
+              <0 0xa0000000 0 0x8000>;
+        reg-names = "regs", "sram";
+        interrupts = <0 96 4>;
+        clocks = <&xlnx_vcu 0>, <&xlnx_vcu 1>,
+                 <&clkc 71>, <&clkc 71>, <&clkc 71>;
+        clock-names = "core_clk", "mcu_clk", "m_axi_core_aclk",
+                      "m_axi_mcu_aclk", "s_axi_lite_aclk";
+      };
+  - |
+    al5d: video-codec@a0029000 {
+        compatible = "allegro,al5d-1.1", "allegro,al5d";
+        reg = <0 0xa0029000 0 0x1000>,
+              <0 0xa0020000 0 0x8000>;
+        reg-names = "regs", "sram";
+        interrupts = <0 96 4>;
+        clocks = <&xlnx_vcu 2>, <&xlnx_vcu 3>,
+                 <&clkc 71>, <&clkc 71>, <&clkc 71>;
+        clock-names = "core_clk", "mcu_clk", "m_axi_core_aclk",
+        "m_axi_mcu_aclk", "s_axi_lite_aclk";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/media/allegro.txt b/Documentation/devicetree/bindings/media/allegro.txt
deleted file mode 100644
index a92e2fbf26c9..000000000000
--- a/Documentation/devicetree/bindings/media/allegro.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-Device-tree bindings for the Allegro DVT video IP codecs present in the Xilinx
-ZynqMP SoC. The IP core may either be a H.264/H.265 encoder or H.264/H.265
-decoder ip core.
-
-Each actual codec engines is controlled by a microcontroller (MCU). Host
-software uses a provided mailbox interface to communicate with the MCU. The
-MCU share an interrupt.
-
-Required properties:
-  - compatible: value should be one of the following
-    "allegro,al5e-1.1", "allegro,al5e": encoder IP core
-    "allegro,al5d-1.1", "allegro,al5d": decoder IP core
-  - reg: base and length of the memory mapped register region and base and
-    length of the memory mapped sram
-  - reg-names: must include "regs" and "sram"
-  - interrupts: shared interrupt from the MCUs to the processing system
-  - clocks: must contain an entry for each entry in clock-names
-  - clock-names: must include "core_clk", "mcu_clk", "m_axi_core_aclk",
-    "m_axi_mcu_aclk", "s_axi_lite_aclk"
-
-Example:
-	al5e: video-codec@a0009000 {
-		compatible = "allegro,al5e-1.1", "allegro,al5e";
-		reg = <0 0xa0009000 0 0x1000>,
-		      <0 0xa0000000 0 0x8000>;
-		reg-names = "regs", "sram";
-		interrupts = <0 96 4>;
-		clocks = <&xlnx_vcu 0>, <&xlnx_vcu 1>,
-			 <&clkc 71>, <&clkc 71>, <&clkc 71>;
-		clock-names = "core_clk", "mcu_clk", "m_axi_core_aclk",
-			      "m_axi_mcu_aclk", "s_axi_lite_aclk"
-	};
-	al5d: video-codec@a0029000 {
-		compatible = "allegro,al5d-1.1", "allegro,al5d";
-		reg = <0 0xa0029000 0 0x1000>,
-		      <0 0xa0020000 0 0x8000>;
-		reg-names = "regs", "sram";
-		interrupts = <0 96 4>;
-		clocks = <&xlnx_vcu 2>, <&xlnx_vcu 3>,
-			 <&clkc 71>, <&clkc 71>, <&clkc 71>;
-		clock-names = "core_clk", "mcu_clk", "m_axi_core_aclk",
-			      "m_axi_mcu_aclk", "s_axi_lite_aclk"
-	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 64f355e3bdc7..76bb63c5bebf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -699,6 +699,7 @@ M:	Michael Tretter <m.tretter@pengutronix.de>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
 F:	drivers/media/platform/allegro-dvt/
 
 ALLWINNER A10 CSI DRIVER
-- 
2.20.1

