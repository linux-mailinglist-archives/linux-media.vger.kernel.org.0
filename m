Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6673194CC2
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 20:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728260AbfHSS02 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 14:26:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:51816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727970AbfHSS01 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 14:26:27 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66F6022CF7;
        Mon, 19 Aug 2019 18:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566239187;
        bh=ADme5Wo3JeD5c8RZL82Aoo/RC8TvZRLkDiLpQHUrIZ0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y351sX1nqzokzUqSkoy5thHOF2QwhY4pA4hb0wnSLbuDx+BXZ3kUpoqexM3YgTcbK
         qDL7NpTJNF4HbQpHivU3RI7JNJhSDj1XEX3tdxtZ9IXi+8tIlCLIbuB4In3bHATic4
         HwVLBXcqhTgfgJ11oEFOJ+bL9PVd6UdEEN0MCNsc=
From:   Maxime Ripard <mripard@kernel.org>
To:     mchehab@kernel.org, sean@mess.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/2] dt-bindings: media: Convert Allwinner A10 IR to a schema
Date:   Mon, 19 Aug 2019 20:26:19 +0200
Message-Id: <20190819182619.29065-2-mripard@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190819182619.29065-1-mripard@kernel.org>
References: <20190819182619.29065-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Ripard <maxime.ripard@bootlin.com>

The older Allwinner SoCs have a IR receiver supported in Linux, with a
matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../media/allwinner,sun4i-a10-ir.yaml         | 80 +++++++++++++++++++
 .../devicetree/bindings/media/sunxi-ir.txt    | 35 --------
 2 files changed, 80 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/sunxi-ir.txt

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
new file mode 100644
index 000000000000..98c1bdde9a86
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allwinner,sun4i-a10-ir.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 Infrared Controller Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+allOf:
+  - $ref: "rc.yaml#"
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun4i-a10-ir
+      - const: allwinner,sun5i-a13-ir
+      - items:
+          - const: allwinner,sun8i-a83t-ir
+          - const: allwinner,sun6i-a31-ir
+      - const: allwinner,sun6i-a31-ir
+      - items:
+          - const: allwinner,sun50i-a64-ir
+          - const: allwinner,sun6i-a31-ir
+      - items:
+          - const: allwinner,sun50i-h6-ir
+          - const: allwinner,sun6i-a31-ir
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: ir
+
+  resets:
+    maxItems: 1
+
+  clock-frequency:
+    default: 8000000
+    description:
+      IR Receiver clock frequency, in Hertz.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+# FIXME: We should set it, but it would report all the generic
+# properties as additional properties.
+# additionalProperties: false
+
+examples:
+  - |
+      ir0: ir@1c21800 {
+          compatible = "allwinner,sun4i-a10-ir";
+          clocks = <&apb0_gates 6>, <&ir0_clk>;
+          clock-names = "apb", "ir";
+          clock-frequency = <3000000>;
+          resets = <&apb0_rst 1>;
+          interrupts = <0 5 1>;
+          reg = <0x01C21800 0x40>;
+          linux,rc-map-name = "rc-rc6-mce";
+      };
+
+...
diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt b/Documentation/devicetree/bindings/media/sunxi-ir.txt
deleted file mode 100644
index 81eaf95fb764..000000000000
--- a/Documentation/devicetree/bindings/media/sunxi-ir.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Device-Tree bindings for SUNXI IR controller found in sunXi SoC family
-
-Required properties:
-- compatible	    :
-	"allwinner,sun4i-a10-ir"
-	"allwinner,sun5i-a13-ir"
-	"allwinner,sun6i-a31-ir"
-	"allwinner,sun50i-a64-ir", "allwinner,sun6i-a31-ir"
-	"allwinner,sun50i-h6-ir", "allwinner,sun6i-a31-ir"
-- clocks	    : list of clock specifiers, corresponding to
-		      entries in clock-names property;
-- clock-names	    : should contain "apb" and "ir" entries;
-- interrupts	    : should contain IR IRQ number;
-- reg		    : should contain IO map address for IR.
-
-Required properties since A31:
-- resets	    : phandle + reset specifier pair
-
-Optional properties:
-- linux,rc-map-name: see rc.txt file in the same directory.
-- clock-frequency  : IR Receiver clock frequency, in Hertz. Defaults to 8 MHz
-		     if missing.
-
-Example:
-
-ir0: ir@1c21800 {
-	compatible = "allwinner,sun4i-a10-ir";
-	clocks = <&apb0_gates 6>, <&ir0_clk>;
-	clock-names = "apb", "ir";
-	clock-frequency = <3000000>;
-	resets = <&apb0_rst 1>;
-	interrupts = <0 5 1>;
-	reg = <0x01C21800 0x40>;
-	linux,rc-map-name = "rc-rc6-mce";
-};
-- 
2.21.0

