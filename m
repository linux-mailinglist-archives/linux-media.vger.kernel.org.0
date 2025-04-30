Return-Path: <linux-media+bounces-31408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A72EAA471F
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEC351BC1896
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 09:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E68F23C4F8;
	Wed, 30 Apr 2025 09:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s026m/9/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECFF235057;
	Wed, 30 Apr 2025 09:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746005265; cv=none; b=HVMTALKIW+FlUHFrVHrWkvJoSaDK3OnCCEIUKvvHcoWNZMGihkF4Q4qMN6+5SSnbREP7u0kawsYqn7gKpq9lUZNUOI4MA/1xN7NcMAa7PKw2tE0ClktK/zwYm3QAwYIhuiGHL4+KPo9ToRe+/LSLY9tR8BmCtpDUGl5BaMzqJBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746005265; c=relaxed/simple;
	bh=49h1rHH1l95eRvXgL44+SjOnzyJk7C6+C5QAKAcnGLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=inblFPuSXbSxbZ5uHTxoAxyqhaVMYqULPIXyUOunp4ZAJB+tkMQg4MN0fQMm0HrRrERgb0jQC1t+65NlfKCLqCkVPh00wPQ38mhGsSsH/8RdIPHXLH7dlfseH6EEAmBp9wtc/sfMIg0shJ1kH7xXIcT1vrNhEq3v1hEoZuYvypI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s026m/9/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4E66C4CEF6;
	Wed, 30 Apr 2025 09:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746005265;
	bh=49h1rHH1l95eRvXgL44+SjOnzyJk7C6+C5QAKAcnGLc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s026m/9/R2t5t6T6PGtwokv5F5tLFBeh/DGP7zuSn3ibU6QI59plB4nhWAS30ghzF
	 XsnFz8TRL1yT4OGugTnxf87sqrYwCkFWimP2w27yfnLsQU9mEZPRP8hpUn9z9jfy7a
	 8cSp48bfXPIOsJt4j3UzYbzS0lqFamSHHH7eNwnCTV5D8Q9TYkDaG4wdQNu/Opn1kp
	 L2wG1BOvMT22/AADRs7TQa+GsUkgRV8XZZtf5al1sfJHRVU3YH8wrnFwO/LPebfjA8
	 cDw/fr/1uygdVnf+Ri4xs3p1X1oSeucNtU1ysc9wNZC/o5bSZEdexuqVHuu1oiXvAE
	 6P/tFTBnZkifg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCD2C3ABAF;
	Wed, 30 Apr 2025 09:27:44 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 30 Apr 2025 11:15:54 +0200
Subject: [PATCH v6 05/13] media: dt-bindings: add rockchip rk3568 mipi csi
 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v6-5-d2f5fbee1551@collabora.com>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
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
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746004564; l=3953;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=zyT1eAXmxyVat8/AdLWgnEsFTp49/649sAMCNnvHFJA=;
 b=lSPcQ5F+ADQ+I0JoC0QUxxfd7DUIWunIiXoeBrjt8CsuYgGbjlB9lV92PyUN5JhKCvtJc0aIm
 tODuULO0vltARJ6S7UXggy37MqNRxlUNZ+VmgPI4yGR1W9lxEIdU9W2
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@wolfvision.net>

Add documentation for the Rockchip RK3568 MIPI CSI-2 Receiver.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 113 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 114 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
new file mode 100644
index 000000000000..d5004cb288dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
@@ -0,0 +1,113 @@
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
+    const: rockchip,rk3568-mipi-csi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+    description: MIPI C-PHY or D-PHY.
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
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
+            required:
+              - bus-type
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output port connected to a RK3568 VICAP port.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - phys
+  - phy-names
+  - ports
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/power/rk3568-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        csi: csi@fdfb0000 {
+            compatible = "rockchip,rk3568-mipi-csi";
+            reg = <0x0 0xfdfb0000 0x0 0x10000>;
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
index 99a29a905cae..e993ef6f8771 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20866,6 +20866,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/rkcif*
 F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
+F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
 F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
 
 ROCKCHIP CRYPTO DRIVERS

-- 
2.39.5



