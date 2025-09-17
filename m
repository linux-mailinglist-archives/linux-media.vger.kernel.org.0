Return-Path: <linux-media+bounces-42681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB95B80A91
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 17:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 221D94A1296
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 15:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271E337C106;
	Wed, 17 Sep 2025 15:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DfXuKAS2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C5B34F49E;
	Wed, 17 Sep 2025 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758123533; cv=none; b=gxFyrNjT/0dicrRpwFY05g/uclrA7OZUFYYD1nuc0j8z2gAMOW24oq87JeuwKqDYFNdwR1r5dmSjnI72tGxFkW9oKwpYr+qxnVBIOPOS02iXwi99822NWhL6QcfYkaXkXTBuh9YVF3iL7+GEr3x7RoaFMFwgai3hLn3lU4ztxxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758123533; c=relaxed/simple;
	bh=1EKN9MsXMbcjtZnN7x+BaMlAtUL3lucJQZbiNEd9GSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TzQDYh4b4wT+43A7siuQ18DGP+MiPaxrAVqknsy14vbMoLRQw2qYUHJwzRhCsaoY7hAWulME1Yo6n7z+AGmvqYuNA4uVRwH0NLmqPstkBXALI037+UPiDKgY+Q+jqTkhdcW0Kd5yqlCB6eX1+4xRiEZaXOzzzIpIoF+m2GTqUiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DfXuKAS2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0910CC4CEFC;
	Wed, 17 Sep 2025 15:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758123533;
	bh=1EKN9MsXMbcjtZnN7x+BaMlAtUL3lucJQZbiNEd9GSI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DfXuKAS2bDvCkteGxoJosgDhAwEP/a1yMmrazhJHIU7crQrl4p2yEIEz49cNPQeyE
	 OXF4mQD6kj5S5IRjd0233RYS+A9MC1/259cTipvJFB3BnHY7GvR4UwWKFuGf40dzzn
	 l7T7SF8fw1xuNYi4xssqbdY2q5Dgde6ozQZRXNTtdT5Y0rSJnGHVMtNlQT0CzWzHIu
	 XDOtGSz11KHQTmYIYFZ/kVm2MOYIEMa+icE0HCMqWvve9ko/vp67g7PiVLzBRojYjp
	 WQHCPcSc/mDNkcnwks+KSQgPJG+BjgwOVkYGZBvSXmXO4SDmr8wrY82tqp7POH4gyq
	 fNN3oxZ1vgcJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FCECAC5A0;
	Wed, 17 Sep 2025 15:38:52 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 17 Sep 2025 17:38:45 +0200
Subject: [PATCH v11 05/17] media: dt-bindings: add rockchip rk3568 mipi
 csi-2 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v11-5-af0eada54e5d@collabora.com>
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758123529; l=5237;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=J2i98vmRYOFVa2kLJ0UO+lSVvV9exfVIQEAilCZiNbg=;
 b=IGHH3NHFt54UxcmZ93RSHlmj+PU+EmQre/WwGcgoG9Iq6hlnHe8bSvr3F+E7mnyqkiBOQi9k7
 BOLMPAKFcfUCut+YVAYoNUxlO0o7+/49mAm81W6KYmiG5wU9gLf+u1F
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

Add documentation for the Rockchip RK3568 MIPI CSI-2 Receiver.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 144 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 150 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
new file mode 100644
index 000000000000..8cbab93b4b85
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3568 MIPI CSI-2 Receiver
+
+maintainers:
+  - Michael Riesch <michael.riesch@collabora.com>
+
+description:
+  The Rockchip RK3568 MIPI CSI-2 Receiver is a CSI-2 bridge with one input port
+  and one output port. It receives the data with the help of an external
+  MIPI PHY (C-PHY or D-PHY) and passes it to the Rockchip RK3568 Video Capture
+  (VICAP) block.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - rockchip,rk3588-mipi-csi
+          - const: rockchip,rk3568-mipi-csi
+      - const: rockchip,rk3568-mipi-csi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Interrupt that signals changes in CSI2HOST_ERR1.
+      - description: Interrupt that signals changes in CSI2HOST_ERR2.
+
+  interrupt-names:
+    items:
+      - const: irq1
+      - const: irq2
+
+  clocks:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+    description: MIPI C-PHY or D-PHY.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Input port node. Connect to e.g., a MIPI CSI-2 image sensor.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                enum: [1, 4]
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - bus-type
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output port connected to a RK3568 VICAP port.
+
+    required:
+      - port@0
+      - port@1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - phys
+  - ports
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/power/rk3568-power.h>
+
+    soc {
+        interrupt-parent = <&gic>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        csi: csi@fdfb0000 {
+            compatible = "rockchip,rk3568-mipi-csi";
+            reg = <0x0 0xfdfb0000 0x0 0x10000>;
+            interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "irq1", "irq2";
+            clocks = <&cru PCLK_CSI2HOST1>;
+            phys = <&csi_dphy>;
+            power-domains = <&power RK3568_PD_VI>;
+            resets = <&cru SRST_P_CSI2HOST1>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                csi_in: port@0 {
+                    reg = <0>;
+
+                    csi_input: endpoint {
+                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&imx415_output>;
+                    };
+                };
+
+                csi_out: port@1 {
+                    reg = <1>;
+
+                    csi_output: endpoint {
+                        remote-endpoint = <&vicap_mipi_input>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 4c39b9fd80bb..2ac4b7a5b255 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21797,6 +21797,12 @@ F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
 F:	drivers/media/platform/rockchip/rkisp1
 F:	include/uapi/linux/rkisp1-config.h
 
+ROCKCHIP MIPI CSI-2 RECEIVER DRIVER
+M:	Michael Riesch <michael.riesch@collabora.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
+
 ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
 M:	Daniel Golle <daniel@makrotopia.org>
 M:	Aurelien Jarno <aurelien@aurel32.net>

-- 
2.39.5



