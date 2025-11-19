Return-Path: <linux-media+bounces-47393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 12573C7033D
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 17:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CD2093539E7
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 16:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B34936B051;
	Wed, 19 Nov 2025 16:26:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FBB341041
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 16:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569568; cv=none; b=ho37ykTVmRohoUXx+Xp2kApXjbBv/OjDZ624R446ByRpNrhTvb5Ic64AK/0fjzBuzBkPo0uyyoI93Dusd98kJ7NMV1ARsXO4MIYZP1UJ1EKzYz+Zwnv0EMbk0pFc7P3FMWkAm+5ZU2M6bNQKlGe9Y+boWcyzbwXuIRvqpKYibIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569568; c=relaxed/simple;
	bh=ixGQGAvYHnV5hkDZO543CAZBJOvZi3Bqsm1+A8S9KqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W6mrLE16WDx6afUKE/jUntwnsRhnnVY3Lm2S91XaflrKL59SngjrUNRaP96F0BzUDBBd2ytorQK3+xeEeb/TNl2nAHDulcXdMpiDaqHQ+EX0BkrtclmksJHNA27RVzLKosmT5HSWpMKSUMObOzxYBu0P5sBmQY5lb/bfYH3ub1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vLl0L-0000aE-5t; Wed, 19 Nov 2025 17:26:01 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Wed, 19 Nov 2025 17:25:51 +0100
Subject: [PATCH v2 1/4] media: dt-bindings: adi,adv7180: add VPP and CSI
 register maps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-b4-adv7180-vpp-sub-device-v2-1-86a7790b63ab@pengutronix.de>
References: <20251119-b4-adv7180-vpp-sub-device-v2-0-86a7790b63ab@pengutronix.de>
In-Reply-To: <20251119-b4-adv7180-vpp-sub-device-v2-0-86a7790b63ab@pengutronix.de>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Different variants of the ADV7280 chip have up to three register maps.
The availability of the CSI and VPP register maps depends on the chip
variant. The address of the additional register maps depends on the
board design and other chips on the I2C but. They may be programmed via
registers in the main register map.

Allow to specify the addresses of the VPP and CSI register maps in the
device tree to solve I2C address conflicts on a board level.

The CSI and VPP register maps are always optional to allow backwards
compatibility with existing device trees which may rely on the default
address.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- document backwards compatibility in commit message
- extend register maps in top level and define limits per variant
- define additional register maps for all variants
- document, why the programmable addresses are hardware description
---
 .../devicetree/bindings/media/i2c/adi,adv7180.yaml | 93 +++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
index dee8ce7cb7ba..dbbbe76291bc 100644
--- a/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
@@ -30,7 +30,27 @@ properties:
           - adi,adv7282-m
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: main register map
+      - description: CSI register map
+      - description: VPP register map
+    description:
+      The ADV7180 family may have up to three register maps. All chips have
+      the main register map. The availability of the CSI and VPP register maps
+      depends on the chip variant.
+
+      The addresses of the CSI and VPP register maps are programmable by
+      software. They depend on the board layout and other devices on the I2C
+      bus and are determined by the hardware designer to avoid address
+      conflicts on the I2C bus.
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: main
+      - enum: [ csi, vpp ]
+      - enum: [ csi, vpp ]
 
   powerdown-gpios:
     maxItems: 1
@@ -138,6 +158,58 @@ allOf:
       required:
         - ports
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,adv7180
+              - adi,adv7180cp
+              - adi,adv7180st
+              - adi,adv7182
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        reg-names:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,adv7281
+              - adi,adv7281-m
+              - adi,adv7281-ma
+    then:
+      properties:
+        reg:
+          maxItems: 2
+
+        reg-names:
+          items:
+            - const: main
+            - enum: [ csi ]
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,adv7280
+              - adi,adv7282
+    then:
+      properties:
+        reg:
+          maxItems: 2
+
+        reg-names:
+          items:
+            - const: main
+            - enum: [ vpp ]
+
 examples:
   - |
     i2c {
@@ -187,3 +259,22 @@ examples:
                     };
             };
     };
+
+  - |
+    i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            composite-in@20 {
+                    compatible = "adi,adv7280-m";
+                    reg = <0x20>, <0x42>, <0x44>;
+                    reg-names = "main", "vpp", "csi";
+
+                    port {
+                            adv7280_out: endpoint {
+                                    bus-width = <8>;
+                                    remote-endpoint = <&vin1ep>;
+                            };
+                    };
+            };
+    };

-- 
2.47.3


