Return-Path: <linux-media+bounces-18368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F0F97B7A3
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 08:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 208A528485B
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 06:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F181167271;
	Wed, 18 Sep 2024 06:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Naa6iSto"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663291487C8;
	Wed, 18 Sep 2024 06:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726639656; cv=none; b=kBrIQOCNG4H6CFOLVmQi70yW4YRdXmhERY18amqbJKPW9xR97FuqtgoyFo9AI4CJrNPb9WTeVK9cjbw+ctosuzkI/Tkzwd0mWmp4E6K7CyC5Agmmi3V+QVCvTAxiArfzfU8h4Ko60wA76w8XfuKyVPtiehWNBXrKPhCDXAmDHQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726639656; c=relaxed/simple;
	bh=S7H8RteIZLQMtGDDVuduQq47vIng75mdmxX/0yNcgZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GGXaDX82Xw2FU64IAxPWnMZCWmlQw10UJQ0XSVveCOQqFAg+1Wa55151Tc8ssa2JP7g7FxSSQyKjmLR7cxMKTmEYBdeMEe26upPcRsetjvJY0/5ldY83/Q17V86RDEBEWcaZd/VOOx2Hnh0fC5rGt/COLtWMAna8UERS0Wbait8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Naa6iSto; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08FA7C4CECE;
	Wed, 18 Sep 2024 06:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726639656;
	bh=S7H8RteIZLQMtGDDVuduQq47vIng75mdmxX/0yNcgZA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Naa6iStowYIEXclhPhmKll1v8awfT8EYhZp1+h+949KMRI54NW3QzDzvEdtEpPhzu
	 DG96fJb6HqHZXfK4d4E3OyMGRHNHZii/T+yAOuD/oPJz+olWHsF5mTrhBWx22hwl9e
	 OJYJ+KBr574hJ2QnW7GlpAjBug735eV7aKwbZFCJ+HpGoRaQwf+DUjRi86zQpm8kAw
	 5NFVmP3eacKldAKy6rm8LYE00cf4W0YOZTENRGHSYdSIVYemSlEpMjvQSj5oFxqZFs
	 jMetaPKX/K2fdGPYN8cFwOXOJs2TdqztH3cCaIg6rNS3iTUdo2fzTjLI+UPlzfe+U0
	 X0UQmNPuGCbXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF854C35FE7;
	Wed, 18 Sep 2024 06:07:35 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Wed, 18 Sep 2024 14:07:12 +0800
Subject: [PATCH v3 1/9] dt-bindings: media: Add amlogic,c3-mipi-csi2.yaml
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240918-c3isp-v3-1-f774a39e6774@amlogic.com>
References: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
In-Reply-To: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Keke Li <keke.li@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726639635; l=3682;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=iPGUT9TFuGPln+AVXqn/S4ILdZCHK59x4w+NVJkmgHQ=;
 b=/LTKu2iVPuQ7csNYYJYeKk5R/LGoTpbv3AxrJKpwcUfsRxDVzkEotR/CRGMHITED3M9G2QRPh
 +mjp+0faCrWBQbQMhCFYOmCrlOoTB+KtQL/eucYwS7iHTIx6dolwU1Q
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

c3-mipi-csi2 is used to receive mipi data from image sensor.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 .../bindings/media/amlogic,c3-mipi-csi2.yaml       | 124 +++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
new file mode 100644
index 000000000000..5cea06595205
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/amlogic,c3-mipi-csi2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic C3 MIPI CSI-2 receiver
+
+maintainers:
+  - Keke Li <keke.li@amlogic.com>
+
+description:
+  MIPI CSI-2 receiver contains CSI-2 RX PHY and host controller.
+  It receives the MIPI data from the image sensor and sends MIPI data
+  to MIPI adapter.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,c3-mipi-csi2
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: aphy
+      - const: dphy
+      - const: host
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: vapb
+      - const: phy0
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: input port node, connected to sensor.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: output port node
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/amlogic,c3-peripherals-clkc.h>
+    #include <dt-bindings/power/amlogic,c3-pwrc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        csi: csi@ff018000 {
+            compatible = "amlogic,c3-mipi-csi2";
+            reg = <0x0 0xff018000 0x0 0x400>,
+                  <0x0 0xff019000 0x0 0x300>,
+                  <0x0 0xff01a000 0x0 0x100>;
+            reg-names = "aphy", "dphy", "host";
+            power-domains = <&pwrc PWRC_C3_MIPI_ISP_WRAP_ID>;
+            clocks =  <&clkc_periphs CLKID_VAPB>,
+                      <&clkc_periphs CLKID_CSI_PHY0>;
+            clock-names = "vapb", "phy0";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    c3_mipi_csi_in: endpoint {
+                        remote-endpoint = <&imx290_out>;
+                        data-lanes = <1 2 3 4>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    c3_mipi_csi_out: endpoint {
+                        remote-endpoint = <&c3_adap_in>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.46.1



