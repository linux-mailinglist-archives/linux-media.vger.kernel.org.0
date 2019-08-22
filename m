Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE5FB98D77
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 10:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732247AbfHVIVZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 04:21:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:59922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731236AbfHVIVZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 04:21:25 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8ADD423789;
        Thu, 22 Aug 2019 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566462084;
        bh=f8j7I5KwhPb1GbkLiR+cP7zhHOjl6O5Wk6ZpFXz7Az8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DxEaxiq7tt5hguqkguIq9KJ5jC6JIhaOOzK7KqBrMB0XNGgdUQbHL7KIvt9CMMdAe
         c1yvvBSyQFnlAuBxtbnXpT19GmWMmX9WrflFZRbH4Qp+DHHyj/fkGqcWO7wgDFX3Tc
         DD42fChtO1MJ6a5uoIdFTyurLtpW5+xcaEGJAQQU=
From:   Maxime Ripard <mripard@kernel.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v8 1/5] dt-bindings: media: Add Allwinner A10 CSI binding
Date:   Thu, 22 Aug 2019 10:21:12 +0200
Message-Id: <653cf26a28d5446dd44784092c60df0ae98d59dd.1566462064.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.85d78dd1a3b44fe4cde1b65a9b1eb3b95daea7cc.1566462064.git-series.maxime.ripard@bootlin.com>
References: <cover.85d78dd1a3b44fe4cde1b65a9b1eb3b95daea7cc.1566462064.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Ripard <maxime.ripard@bootlin.com>

The Allwinner A10 CMOS Sensor Interface is a camera capture interface also
used in later (A10s, A13, A20, R8 and GR8) SoCs.

On some SoCs, like the A10, there's multiple instances of that controller,
with one instance supporting more channels and having an ISP.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 107 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 MAINTAINERS                                                          |   7 +++++-
 2 files changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
new file mode 100644
index 000000000000..c994a4092a4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/allwinner,sun4i-a10-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 CMOS Sensor Interface (CSI) Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+description: |-
+  The Allwinner A10 and later has a CMOS Sensor Interface to retrieve
+  frames from a parallel or BT656 sensor.
+
+properties:
+  compatible:
+    const: allwinner,sun7i-a20-csi0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The CSI interface clock
+      - description: The CSI module clock
+      - description: The CSI ISP clock
+      - description: The CSI DRAM clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
+      - const: isp
+      - const: ram
+
+  resets:
+    maxItems: 1
+
+  # See ./video-interfaces.txt for details
+  port:
+    type: object
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        properties:
+          bus-width:
+            enum: [8, 16]
+
+          data-active: true
+          hsync-active: true
+          pclk-sample: true
+          remote-endpoint: true
+          vsync-active: true
+
+        required:
+          - bus-width
+          - data-active
+          - hsync-active
+          - pclk-sample
+          - remote-endpoint
+          - vsync-active
+
+    required:
+      - endpoint
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sun7i-a20-ccu.h>
+    #include <dt-bindings/reset/sun4i-a10-ccu.h>
+
+    csi0: csi@1c09000 {
+        compatible = "allwinner,sun7i-a20-csi0";
+        reg = <0x01c09000 0x1000>;
+        interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI0>,
+                 <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
+        clock-names = "bus", "mod", "isp", "ram";
+        resets = <&ccu RST_CSI0>;
+
+        port {
+            csi_from_ov5640: endpoint {
+                remote-endpoint = <&ov5640_to_csi>;
+                bus-width = <8>;
+                hsync-active = <1>; /* Active high */
+                vsync-active = <0>; /* Active low */
+                data-active = <1>;  /* Active high */
+                pclk-sample = <1>;  /* Rising */
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 30bf852e6d6b..65af586defcc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1420,6 +1420,13 @@ F:	drivers/pinctrl/sunxi/
 F:	drivers/soc/sunxi/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git
 
+Allwinner A10 CSI driver
+M:	Maxime Ripard <mripard@kernel.org>
+L:	linux-media@vger.kernel.org
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
+S:	Maintained
+
 ARM/Amlogic Meson SoC CLOCK FRAMEWORK
 M:	Neil Armstrong <narmstrong@baylibre.com>
 M:	Jerome Brunet <jbrunet@baylibre.com>
-- 
git-series 0.9.1
