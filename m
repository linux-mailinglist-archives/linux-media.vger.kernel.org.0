Return-Path: <linux-media+bounces-50611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C76D1B5A7
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 22:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5B08303C23D
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 21:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5398132D0E1;
	Tue, 13 Jan 2026 21:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wa7cshPq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFDB318EC9;
	Tue, 13 Jan 2026 21:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768338580; cv=none; b=uRTG5/H5N9E+5Nh724Ly11BEaXOrHuUIfOEjk7ICLXz6Q9bV0H0rEHSPsbEJPP5W0Zx2cLfaCgCLM0F6N8L5kBTklnLovfPpTiPsjNBEnWTyxS8oL/doYKFgllgDYR0JGLZFWE2yP1YS7JMA46+YoyH5TD5610AnE9XnxcJGqBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768338580; c=relaxed/simple;
	bh=KzvcJrPkjxLQ6Z7jX8EbkSwIjfIaDVYOPsYxxZYUcLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mOYkd61jeDNDbmUHwA6iQvFTGj/ZmbqfasUsblNUPJ4xYjHzzeRyafgw9MBZHqXIdqC2H4QcmdElTghLSmlklmUJAGf9pzuf2Hx55m6H8HofuZLop1lk7ozyfXpKpnQd3Yj6gzhsuoWktJWxkMGSNtzNh+APw439Ba+wzUkNwYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wa7cshPq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52A3CC19423;
	Tue, 13 Jan 2026 21:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768338580;
	bh=KzvcJrPkjxLQ6Z7jX8EbkSwIjfIaDVYOPsYxxZYUcLU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Wa7cshPqtdCUWeX3muOyz91lt+w0IUy6gd24zvMbPBeMY2irJ6icvL+bKQfcY2xey
	 8/lrm0hLveW3neRAkVi9JY4+ngVXpnfLk0ttbTEnlPwNHr4U7gdiW4WywssVzeUj1b
	 WcCyf6me499UzwUVihWWBIQDMbjyY8lJ3U8fdBpvpv+S3Qgjhs7oMWJzEJgsDbM/dN
	 hQ4EYAFnZTRZ/cY2+ejbefcKjztPDahX3Omkt7eCNDHZ0QZPKUu/oJgY3So1yErUFr
	 msTYJq0Tu9fqYk6ZTgZbs1EUgkxoIh9furKXoOG8HXhvtrrdilPDhdf7naw1SLaMLB
	 dD3e5HIpXrBYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B1FD30CC3;
	Tue, 13 Jan 2026 21:09:40 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 13 Jan 2026 22:09:27 +0100
Subject: [PATCH v3 1/3] media: dt-bindings: add rockchip mipi csi-2
 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-rockchip-mipi-receiver-v3-1-16e83aa7f395@collabora.com>
References: <20251114-rockchip-mipi-receiver-v3-0-16e83aa7f395@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v3-0-16e83aa7f395@collabora.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768338578; l=5373;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=YiATaUtIUr4MrRpJpU3Wq3Y+VV09qyPFQQR7+zuX0zg=;
 b=zztIh3w0DnVYcShoXLigW0Zkd6Kg/GbjzarWzQaIo7Xu19xvVWTTgtWzFU9t1H4NMp9bDf96M
 1a30mWUwkgMD6+mCMydUUkQqB7KgP7y0WbucJDqW93jl1AykjvhC0Hx
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

Add documentation for the Rockchip MIPI CSI-2 Receiver.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 146 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 152 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
new file mode 100644
index 000000000000..52fe959af8f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip MIPI CSI-2 Receiver
+
+maintainers:
+  - Michael Riesch <michael.riesch@collabora.com>
+
+description:
+  The Rockchip MIPI CSI-2 Receiver is a CSI-2 bridge with one input port and
+  one output port. It receives the data with the help of an external MIPI PHY
+  (C-PHY or D-PHY) and passes it to the Rockchip RK3568 Video Capture (VICAP)
+  block.
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
+            interrupt-names = "err1", "err2";
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
index 752ccaea38b0..dafa8ef7a000 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22636,6 +22636,12 @@ F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
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



