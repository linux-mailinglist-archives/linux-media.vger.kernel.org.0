Return-Path: <linux-media+bounces-44420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5367ABD987D
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 15:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E27D01885FBF
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 13:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429EA314B87;
	Tue, 14 Oct 2025 13:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3WEITIN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5908628C864;
	Tue, 14 Oct 2025 13:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760446966; cv=none; b=gzaM5ycar6P6kBw6NigaOezrBvyFHsoN624IcQNip7nhJXV22ZnsAeGdx7KrDFChQW96d5reKqaEoIf2mJcsVtDwxY9kw8+KefsM9nxe1eBmf4r+o6KFsjl5wBwzZ2ZS7p/bSy6Pp6fxiOf03UdgYcjVEPwvBLC646OA1fte10A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760446966; c=relaxed/simple;
	bh=iLVrgnoNAIX6LpwkGMjLfqduvy/ORi17JgCwVam9qtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T14VuGeuGSxgQP6ycJSHb6h2zCxYClVeCo+YmfNOX3KrwyFwue39Rxe/Q4/mU5L846fyjSd0u0UcrWx4QAlHp63qhpg8M4BzQ7fMkk3uBO5zPyjNTpEKCL3i5hnf8KbzOZ58VT1ied/8f+HiMUsYyG9eIv+2a0H0yhZK8Jg10Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3WEITIN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFE63C19422;
	Tue, 14 Oct 2025 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760446966;
	bh=iLVrgnoNAIX6LpwkGMjLfqduvy/ORi17JgCwVam9qtI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U3WEITINWlauPdlFFrwr5w1mDG/L+UFAPLWSZgxnFaI7RKgqv5GQHnmKnxchPKdgz
	 Fug8I6IQEmlNba2tS0uWEI0Endd+j3NuW0naFU3rVCmKjg4dWt04GCEAJHDsTHErzw
	 AW470bZelrMQQYGr5uvge79c/Yx1qXj8gIL/WLYRkptOjOklRsS+tu3hPg+b1X5KsA
	 LoTVSH2b7Uqf4B/oazlRDt72/NibTuFGN60N6UNfHhOGoZPdcSGJn5dg0aeZCOSrV0
	 dRo6jKZKSfN9z+vU+0U/99OYVMu/lQAZTk86Aj+P91W7OB5eR9tqpUSR86CZAFoZ8M
	 TSiDgmdg8ggrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51CBCCD193;
	Tue, 14 Oct 2025 13:02:45 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 14 Oct 2025 15:01:50 +0200
Subject: [PATCH v12 04/18] media: dt-bindings: add rockchip rk3568 vicap
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v12-4-c6dbece6bb98@collabora.com>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760446963; l=6341;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=ApGomEP0EDWVXOAytTfWUAEqsMWcd4NfvmEbgm55yzU=;
 b=JJpE1O0LSCSiG2Q8GQHOUFeNf2Ws81eKyHZ0wVmZ+rjAJSp9udxwDEWL5XLCrSHSpkTk1G/rY
 FgEwaTufz53ASpKvE5gUr+mj2/iw9Q2qU6Q/4qzPkdwI7QjK1GBET8N
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 172 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 173 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
new file mode 100644
index 000000000000..18cd0a5a5318
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
@@ -0,0 +1,172 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3568-vicap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3568 Video Capture (VICAP)
+
+maintainers:
+  - Michael Riesch <michael.riesch@collabora.com>
+
+description:
+  The Rockchip RK3568 Video Capture (VICAP) block features a digital video
+  port (DVP, a parallel video interface) and a MIPI CSI-2 port. It receives
+  the data from camera sensors, video decoders, or other companion ICs and
+  transfers it into system main memory by AXI bus.
+
+properties:
+  compatible:
+    const: rockchip,rk3568-vicap
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ACLK
+      - description: HCLK
+      - description: DCLK
+      - description: ICLK
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: dclk
+      - const: iclk
+
+  iommus:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: ARST
+      - description: HRST
+      - description: DRST
+      - description: PRST
+      - description: IRST
+
+  reset-names:
+    items:
+      - const: arst
+      - const: hrst
+      - const: drst
+      - const: prst
+      - const: irst
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to general register file used for video input block control.
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: The digital video port (DVP, a parallel video interface).
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                enum:
+                  - 5 # MEDIA_BUS_TYPE_PARALLEL
+                  - 6 # MEDIA_BUS_TYPE_BT656
+
+              rockchip,dvp-clk-delay:
+                $ref: /schemas/types.yaml#/definitions/uint32
+                default: 0
+                minimum: 0
+                maximum: 127
+                description:
+                  Delay the DVP path clock input to align the sampling phase,
+                  only valid in dual edge sampling mode. Delay is zero by
+                  default and can be adjusted optionally.
+
+            required:
+              - bus-type
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Port connected to the MIPI CSI-2 receiver output.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/rk3568-power.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        vicap: video-capture@fdfe0000 {
+            compatible = "rockchip,rk3568-vicap";
+            reg = <0x0 0xfdfe0000 0x0 0x200>;
+            interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+            assigned-clocks = <&cru DCLK_VICAP>;
+            assigned-clock-rates = <300000000>;
+            clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
+                     <&cru DCLK_VICAP>, <&cru ICLK_VICAP_G>;
+            clock-names = "aclk", "hclk", "dclk", "iclk";
+            iommus = <&vicap_mmu>;
+            power-domains = <&power RK3568_PD_VI>;
+            resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
+                     <&cru SRST_D_VICAP>, <&cru SRST_P_VICAP>,
+                     <&cru SRST_I_VICAP>;
+            reset-names = "arst", "hrst", "drst", "prst", "irst";
+            rockchip,grf = <&grf>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                vicap_dvp: port@0 {
+                    reg = <0>;
+
+                    vicap_dvp_input: endpoint {
+                        bus-type = <MEDIA_BUS_TYPE_BT656>;
+                        bus-width = <16>;
+                        pclk-sample = <MEDIA_PCLK_SAMPLE_DUAL_EDGE>;
+                        remote-endpoint = <&it6801_output>;
+                    };
+                };
+
+                vicap_mipi: port@1 {
+                    reg = <1>;
+
+                    vicap_mipi_input: endpoint {
+                        remote-endpoint = <&csi_output>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 416cfb7e24f6..56d3016385c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22217,6 +22217,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/rkcif*
 F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
+F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
 
 ROCKCHIP CRYPTO DRIVERS
 M:	Corentin Labbe <clabbe@baylibre.com>

-- 
2.39.5



