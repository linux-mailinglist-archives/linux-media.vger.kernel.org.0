Return-Path: <linux-media+bounces-25792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E339A2C045
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 11:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DE563A5AF1
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 10:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F901DE4EA;
	Fri,  7 Feb 2025 10:15:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E961DDC20;
	Fri,  7 Feb 2025 10:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738923304; cv=none; b=I51nItyGDK0boxQhXMrjhd4qJgJeH0bx57oCAfcTAN5B0p5/MBqKgPFlxTxONx895OPz+rgPyAjvzzEuadYOrkoo++T4ZQStlf1aj8+LwEZwtGtnW5u+7P1QKIb92k4WzFaZHc+YGJzx2rnz2iQcdsD5DERHUtvM+wuVt7nsdXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738923304; c=relaxed/simple;
	bh=Vas5Ja7/xbuXDFcYg6gSsVbvwhR4H4G6LbPrh3aaN3Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EIZoaqQom0g0RG1VftAx73EnMxtchqqRo0io3f00IuXe+t2jK1vcyWjCP3ckkhUvZPthu6U+QG+Lf0yS1O1ZpQpjQsUGwA0ZSPP4sSQYFuOYGnT6eWOXygaUG0L46+WTomZVQpFwmRcK73cRbZD1UGipeRbPv20aAd8VaGu6Un4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 7 Feb
 2025 18:14:58 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 7 Feb 2025 18:14:58 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@aj.id.au>, <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4] media: dt-bindings: aspeed,video-engine: Convert to json schema
Date: Fri, 7 Feb 2025 18:14:58 +0800
Message-ID: <20250207101458.3757723-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Convert aspeed-video.txt to yaml format.
Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.

Additional changes:
- Two phandle properties, 'aspeed,scu' and 'aspeed,gfx', are added for
  video engine to capture video from sources other than VGA.
- Update examples and include appropriate file directives to resolve
  errors identified by `dt_binding_check` and `dtbs_check`.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 v4:
  - Keep | after phandle description to fix dt_binding_check error.

 v3:
  - Add Additional changes into comments.
  - Remove | after phandle description

 v2:
  - Update patch subject
  - Add NOTE for false positive warning
---
 .../bindings/media/aspeed,video-engine.yaml   | 84 +++++++++++++++++++
 .../bindings/media/aspeed-video.txt           | 33 --------
 MAINTAINERS                                   |  2 +-
 3 files changed, 85 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/aspeed-video.txt

diff --git a/Documentation/devicetree/bindings/media/aspeed,video-engine.yaml b/Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
new file mode 100644
index 000000000000..4edfbeaa5dc9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/aspeed,video-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED Video Engine
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+description:
+  The Video Engine (VE) embedded in the ASPEED SOCs can be configured to
+  capture and compress video data from digital or analog sources.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2400-video-engine
+      - aspeed,ast2500-video-engine
+      - aspeed,ast2600-video-engine
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: vclk
+      - const: eclk
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+    description: |
+      Phandle to the reserved memory nodes to be associated with the
+      VE. VE will acquires memory space for 3 purposes:
+        1. JPEG header
+        2. Compressed result
+        3. Temporary transformed image data
+
+  aspeed,scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Specifies the scu node that is needed if video wants to capture
+      from sources other than Host VGA.
+
+  aspeed,gfx:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Specifies the Soc Display(gfx) node that needs to be queried to get
+      related information if video wants to use gfx as capture source.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/ast2600-clock.h>
+
+    video@1e700000 {
+        compatible = "aspeed,ast2600-video-engine";
+        reg = <0x1e700000 0x1000>;
+        clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
+                 <&syscon ASPEED_CLK_GATE_ECLK>;
+        clock-names = "vclk", "eclk";
+        interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+        aspeed,scu = <&syscon>;
+        aspeed,gfx = <&gfx>;
+    };
diff --git a/Documentation/devicetree/bindings/media/aspeed-video.txt b/Documentation/devicetree/bindings/media/aspeed-video.txt
deleted file mode 100644
index d2ca32512272..000000000000
--- a/Documentation/devicetree/bindings/media/aspeed-video.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-* Device tree bindings for Aspeed Video Engine
-
-The Video Engine (VE) embedded in the Aspeed AST2400/2500/2600 SOCs can
-capture and compress video data from digital or analog sources.
-
-Required properties:
- - compatible:		"aspeed,ast2400-video-engine" or
-			"aspeed,ast2500-video-engine" or
-			"aspeed,ast2600-video-engine"
- - reg:			contains the offset and length of the VE memory region
- - clocks:		clock specifiers for the syscon clocks associated with
-			the VE (ordering must match the clock-names property)
- - clock-names:		"vclk" and "eclk"
- - resets:		reset specifier for the syscon reset associated with
-			the VE
- - interrupts:		the interrupt associated with the VE on this platform
-
-Optional properties:
- - memory-region:
-	phandle to a memory region to allocate from, as defined in
-	Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
-
-Example:
-
-video-engine@1e700000 {
-    compatible = "aspeed,ast2500-video-engine";
-    reg = <0x1e700000 0x20000>;
-    clocks = <&syscon ASPEED_CLK_GATE_VCLK>, <&syscon ASPEED_CLK_GATE_ECLK>;
-    clock-names = "vclk", "eclk";
-    resets = <&syscon ASPEED_RESET_VIDEO>;
-    interrupts = <7>;
-    memory-region = <&video_engine_memory>;
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..7e59daa1e89d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3549,7 +3549,7 @@ M:	Eddie James <eajames@linux.ibm.com>
 L:	linux-media@vger.kernel.org
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/aspeed-video.txt
+F:	Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
 F:	drivers/media/platform/aspeed/
 
 ASUS EC HARDWARE MONITOR DRIVER

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.25.1


