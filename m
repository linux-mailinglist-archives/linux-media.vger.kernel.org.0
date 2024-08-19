Return-Path: <linux-media+bounces-16454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D277295653F
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 10:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ABF8281C10
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 08:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA4C15B57F;
	Mon, 19 Aug 2024 08:09:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8881A15B12D;
	Mon, 19 Aug 2024 08:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724054952; cv=none; b=n5BLJjz2eXXJ2COxmX057+vbVknKRAeEzfqW4X92tCHBxOfLdE5GIMrzMhuo6IGOuTez3rs+lA9yBibuSgh7KAVarXbqSxrnrAp+3fzT9Cgy/sNoG/ULMQT1A6iWm7s29pooe5wmh00UDRhBcOZ+mtaxbg9Q3ffO83BQY0S9yUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724054952; c=relaxed/simple;
	bh=Cu134Z0n0KqoTdtF9jtkclTURJ6Ki0ju6Wn86h01uyc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ok7AT9MZ/quKxAplKpoAlEYufBJsDk/It8f7CehoATZ76OpgWgWWIaTZlcr7JSWw2LkX2OShbZSfO+lJHtJnLFO2jwViKMaZ2okOWS4Z55I1DHE5HvAZAxFbyDU3ux5ctryiOAmwuxVC9DieC2vX5D46v94QYO8lOIbTVYvbE04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 19 Aug
 2024 16:08:59 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 19 Aug 2024 16:08:59 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <robh@kernel.org>, <conor+dt@kernel.org>, <eajames@linux.ibm.com>,
	<mchehab@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<hverkuil@xs4all.nl>, <pmenzel@molgen.mpg.de>, <krzk+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/2] dt-bindings: arm: aspeed: Add aspeed,video binding
Date: Mon, 19 Aug 2024 16:08:58 +0800
Message-ID: <20240819080859.1304671-2-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240819080859.1304671-1-jammy_huang@aspeedtech.com>
References: <20240819080859.1304671-1-jammy_huang@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The Video Engine block in ASPEED Silicon SoCs is responsible for video
compressions with a wide range of video quality and compression
ratio options. It can capture and compress video data from digital or
analog sources.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 .../bindings/arm/aspeed/aspeed,video.yaml     | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/aspeed/aspeed,video.yaml

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed,video.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed,video.yaml
new file mode 100644
index 000000000000..bef7bd2f310a
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed,video.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/aspeed/aspeed,video.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED Video Engine
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+  - Jammy Huang <jammy_huang@aspeedtech.com>
+
+description: |
+  The ASPEED video engine can be configured to capture and compress video
+  data from digital or analog sources.
+
+select:
+  properties:
+    compatible:
+      pattern: "^aspeed,ast[0-9]+-video-engine$"
+  required:
+    - compatible
+
+properties:
+  compatible:
+    oneOf:
+      - description: Preferred naming style for compatibles of video components
+        pattern: "^aspeed,ast[0-9]+-video-engine$"
+
+      - enum:
+          - aspeed,ast2400-video-engine
+          - aspeed,ast2500-video-engine
+          - aspeed,ast2600-video-engine
+
+  reg:
+    minItems: 1
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: vclk
+      - const: eclk
+
+  interrupts:
+    minItems: 1
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
+additionalProperties: true
+
+examples:
+  - |
+    video: video@1e700000 {
+          	compatible = "aspeed,ast2600-video-engine";
+          	reg = <0x1e700000 0x1000>;
+          	clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
+          	         <&syscon ASPEED_CLK_GATE_ECLK>;
+          	clock-names = "vclk", "eclk";
+          	interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+          	aspeed,scu = <&syscon>;
+          	aspeed,gfx = <&gfx>;
+    };
-- 
2.25.1


