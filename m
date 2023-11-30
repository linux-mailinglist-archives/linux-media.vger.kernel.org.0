Return-Path: <linux-media+bounces-1423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4F07FF849
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 18:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B230DB2119A
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 17:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E250558104;
	Thu, 30 Nov 2023 17:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JSjg4uu3"
X-Original-To: linux-media@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8372C10F0;
	Thu, 30 Nov 2023 09:31:51 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E007E000C;
	Thu, 30 Nov 2023 17:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701365510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XSLxrMVxqm0ziB4mZr5w55OetSeMAMYektM6V59JEDg=;
	b=JSjg4uu3lqiaDzoe8ywFFM1CktkTSJWnkfCCxkGewcoJDORSKcnX5+NdnCcXQJQ67DRcDF
	PdGrU/UingPm6De6vsuoSZTr68QpNvAgXEiAxFJW8TIvLprBawiBW30iMmVcYJ42p6Zaya
	LrAcWCaAJ+YxnDNQuMIDT8rdemjBdB3LzVi16+RTWYwVjGZh2U7FxYHXqRqxl0Tp2dlwcw
	wkkmLkEgLYQap+W0crJAbFyTO2t3IZbo3hrGRJSimz/wiXhhcxeFTqGfqWJl8kBQ054dU1
	+e2kVcPz1L+D4FsWvR1LlqSo/u6qgCRF3pIXvo7yJ4U1j7zw15UK+sCGuhBEoQ==
From: Mehdi Djait <mehdi.djait@bootlin.com>
To: mchehab@kernel.org,
	heiko@sntech.de,
	hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	alexandre.belloni@bootlin.com,
	maxime.chevallier@bootlin.com,
	paul.kocialkowski@bootlin.com,
	michael.riesch@wolfvision.net,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V12 1/3] media: dt-bindings: media: add bindings for Rockchip CIF
Date: Thu, 30 Nov 2023 18:31:44 +0100
Message-ID: <30f115aa43786f14b8a32e046c69e7f4ddd1f524.1701364052.git.mehdi.djait@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1701364052.git.mehdi.djait@bootlin.com>
References: <cover.1701364052.git.mehdi.djait@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: mehdi.djait@bootlin.com

Add a documentation for the Rockchip Camera Interface binding.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
---
 .../bindings/media/rockchip,px30-vip.yaml     | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml

diff --git a/Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml b/Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
new file mode 100644
index 000000000000..6af4a9b6774a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,px30-vip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip Camera Interface (CIF)
+
+maintainers:
+  - Mehdi Djait <mehdi.djait@bootlin.com>
+
+description:
+  CIF is a camera interface present on some Rockchip SoCs. It receives the data
+  from Camera sensor or CCIR656 encoder and transfers it into system main memory
+  by AXI bus.
+
+properties:
+  compatible:
+    const: rockchip,px30-vip
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
+      - description: PCLK
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: pclk
+
+  resets:
+    items:
+      - description: AXI
+      - description: AHB
+      - description: PCLK IN
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+      - const: pclkin
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
+        description: input port on the parallel interface
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                enum: [5, 6]
+
+            required:
+              - bus-type
+
+    required:
+      - port@0
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
+    #include <dt-bindings/clock/px30-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/power/px30-power.h>
+
+    parent {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        video-capture@ff490000 {
+            compatible = "rockchip,px30-vip";
+            reg = <0x0 0xff490000 0x0 0x200>;
+            interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>;
+            clock-names = "aclk", "hclk", "pclk";
+            power-domains = <&power PX30_PD_VI>;
+            resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
+            reset-names = "axi", "ahb", "pclkin";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    cif_in: endpoint {
+                        remote-endpoint = <&tw9900_out>;
+                        bus-type = <MEDIA_BUS_TYPE_BT656>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.41.0


