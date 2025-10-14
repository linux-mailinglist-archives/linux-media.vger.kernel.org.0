Return-Path: <linux-media+bounces-44425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C43BD9853
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 15:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DEF784FEC38
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 13:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B62315D2D;
	Tue, 14 Oct 2025 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hREcnn60"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCA5313E1D;
	Tue, 14 Oct 2025 13:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760446966; cv=none; b=lTmlZLIYLxVI4jktBCiSRT+WyWe3/9bRhK69sJSN6PnqSRM7F8y21M+vusOSzeiXhFHPaGRMpjlLqX5B7L0LjHHF615H/cDQk4Nap7t3IzUmaxDIV5D7XQrPTVB/HyBw/uJTxbqFNRqseQ3J1ar0ZI8+sWVzxG+yDwU2YWIXAt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760446966; c=relaxed/simple;
	bh=xh2ye8cXilkDYb1lwzG53o9kzbj+pdmzcc0n3BpyQIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LGzJnk75l2W1j9phT73tP631bJmcpg/Qc+VofDNVwHZzIehd8vDY49R8ho7KYltLkU0l9Eda8S5DU4gk58BNM9b0aLdDiDO/fxFTcGqJMVcdOT93vwZ855Wlj0Gx3ieDr0zRp2zyhK00FHoXaDrg9Oa+Y9kJzfCQhypEvYF+i7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hREcnn60; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CC12C2BC9E;
	Tue, 14 Oct 2025 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760446966;
	bh=xh2ye8cXilkDYb1lwzG53o9kzbj+pdmzcc0n3BpyQIM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hREcnn60ukDyDPWZwjB4vOKrZDbatE+VRRfLttIBhGkwUVBu/E0jc0yskaLOL/jSx
	 fDLFN/WMY3kL/CO7/gTCwKbGQFjPJa7NAJf0iZ4CicEueu8LrGavI8cSZem9qWnuOw
	 jc//sysqInbgj7QDwMzhAL14JW5SlxQXBJfCczVgU28XTfq9nMi8plAgyiquHgkN90
	 ZuNTkv0AjMdnM6OofHm0ZmMkKjM3a11PBYpBD7QGtOOo04VS3H+y/NsYZOJGlrmS0N
	 kwcBCiZU3XCyjP4yWgaW4Lj6Mpl2W4X4ailPRh/6t7IzNRttWSgAUK2sQpyHeiJ9YS
	 bmLisrb6jwKBA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F7CCCD184;
	Tue, 14 Oct 2025 13:02:46 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 14 Oct 2025 15:01:51 +0200
Subject: [PATCH v12 05/18] media: dt-bindings: add rockchip rk3568 mipi
 csi-2 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v12-5-c6dbece6bb98@collabora.com>
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
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760446963; l=5382;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=tM38h+6PffENI+1e6TbrgDsvOXPZS+ShMDTJir6YK78=;
 b=cuWpQRgfBwsdR/9lMQ0KNzcMSvozIFAvN8Kv+OYh9i0UEfaPIQstbzz35DsDmZ+VRbNlK8E2g
 +j/8Ll1e4AzAuXYNI1Q83aEzCh6EDXqa8ghS+cmSfVPpyP1ZwsiQN0i
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 146 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 152 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
new file mode 100644
index 000000000000..4c94a59cd106
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
@@ -0,0 +1,146 @@
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
+      - const: err1
+      - const: err2
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
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
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
index 56d3016385c7..6d79fded8e3d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22245,6 +22245,12 @@ F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
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



