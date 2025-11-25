Return-Path: <linux-media+bounces-47710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E282C856DE
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 15:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0B749350439
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 14:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FD832572F;
	Tue, 25 Nov 2025 14:30:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411C232573D
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 14:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764081029; cv=none; b=E4q2mkSbrYSYdOIif9KBiT6shYyT+GKPMKdNEET7hs4gJ3RThof347fuRU379qiBLH36A8d/xPU7ksoYOvZ3olgt+t13hNwkhjjuYKIMyD0gHaQEIYgdKQQ+yWKdgAx7zNG2x4ggU/nKRKgqAm5D6Ba32LjF7yb3B7j9SCBvP3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764081029; c=relaxed/simple;
	bh=uZBRPQ5WGIthBeiOLMwnjb+jL4a4Pk/TMRn12PU1J9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HuFrjxHhG0KhBb6NDfwOYS9uv2wLRcXC1JcZDt8/EuBsH/U8bx/tcK5Z7O9CnMdV+o0zfx9LiMnsoEzybLaZJNABgwZ/fqWPT+oIzlmrAiTKRvaCi0tjRYohVcxYwZjDvaTjQqSUMcgCHaJoMwwssefblebWj2ok4HBKVR0IBwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vNu3d-0003eq-M8; Tue, 25 Nov 2025 15:30:17 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Tue, 25 Nov 2025 15:29:54 +0100
Subject: [PATCH v4 1/4] media: dt-bindings: adi,adv7180: add VPP and CSI
 register maps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-b4-adv7180-vpp-sub-device-v4-1-c772b9a80916@pengutronix.de>
References: <20251125-b4-adv7180-vpp-sub-device-v4-0-c772b9a80916@pengutronix.de>
In-Reply-To: <20251125-b4-adv7180-vpp-sub-device-v4-0-c772b9a80916@pengutronix.de>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
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

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v4:
- drop unnecessary minItems properties
- change description of second reg to VPP or CSI register maps
Changes in v3:
- add minItems to all if:then: cases
- make enums with one item const
Changes in v2:
- document backwards compatibility in commit message
- extend register maps in top level and define limits per variant
- define additional register maps for all variants
- document, why the programmable addresses are hardware description
---
 .../devicetree/bindings/media/i2c/adi,adv7180.yaml | 97 +++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
index dee8ce7cb7ba..5f8f3b3dea76 100644
--- a/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adi,adv7180.yaml
@@ -30,7 +30,27 @@ properties:
           - adi,adv7282-m
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: main register map
+      - description: VPP or CSI register map
+      - description: CSI register map
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
+      - const: csi
 
   powerdown-gpios:
     maxItems: 1
@@ -138,6 +158,62 @@ allOf:
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
+          minItems: 1
+          maxItems: 2
+
+        reg-names:
+          minItems: 1
+          items:
+            - const: main
+            - const: csi
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
+          minItems: 1
+          maxItems: 2
+
+        reg-names:
+          minItems: 1
+          items:
+            - const: main
+            - const: vpp
+
 examples:
   - |
     i2c {
@@ -187,3 +263,22 @@ examples:
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


