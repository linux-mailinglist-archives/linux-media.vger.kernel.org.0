Return-Path: <linux-media+bounces-22676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBF89E5095
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 10:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0304316A952
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9E81D90DD;
	Thu,  5 Dec 2024 09:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFp7cab8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7D61D4612;
	Thu,  5 Dec 2024 09:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733389474; cv=none; b=upTGJbzE1iN1j0c0kvBqx9KyblX4KfWikNLN7n4vPk4wkuindhVtoQXrJ6XzFj2iqcL8f7sVqkN14/rwoxookhRHRypJPfhRGN2vhPx4eIeio3+HG6EXNL201U7sP4rTXVjumr7ETt88zWYvQ2ljim3iCIwfzSh2IXI3llLmOt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733389474; c=relaxed/simple;
	bh=3UBbd9aH5OtdWK3hJf93umdL7TwPMi+yulKK7jsseAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tl+kHeHPv9FYmrORYJ/jRw+Vu6yzREsmarRIvZLuZDONZUjJ9sPncXlLLXFSFYMKSczXcgslQx8a30qTyy9NttwVa1X9CStf3YmGKGUxztAayYAJpIWASzP09sBh+AcYhAS55hDHQWtytF7pQSOOv/tNpoUsOK6AtRKVI6iNToY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFp7cab8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84460C4CEE0;
	Thu,  5 Dec 2024 09:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733389473;
	bh=3UBbd9aH5OtdWK3hJf93umdL7TwPMi+yulKK7jsseAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WFp7cab8XQTzfNg5SZUmMSQS9VbH4CZLPXm/6V5hCBDSAc19AlJYc2qzYRUmPMOdu
	 aX11mAhjBplNI3yNHCPwh+6CbHlMdZm2NvYPqbrReD0LuVKY1fvwK1Tdw4cHd+D5qR
	 qYSDAy8F8stO+gI6aMLYh3PxiZL0DNLcZZkEg/kkAjnmFoA3C5DU3mrcOhjIQoE2AW
	 rvGqKI80vIdNfbqgNWZ9zrJ+0we4vgZ6YSZXuymfjfL3LcG7Ao+einnWHE7JDZPzfd
	 8GB6mNJX8lkRH+MXt0nyhARrXAkirAapthDjcyybhkv6F7Og1+xLvLl75/lQ/dSFbL
	 RwG4XJ+/RpYkg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE34E77173;
	Thu,  5 Dec 2024 09:04:33 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Thu, 05 Dec 2024 17:04:27 +0800
Subject: [PATCH v4 01/10] dt-bindings: media: Add amlogic,c3-mipi-csi2.yaml
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-c3isp-v4-1-cb1868be0105@amlogic.com>
References: <20241205-c3isp-v4-0-cb1868be0105@amlogic.com>
In-Reply-To: <20241205-c3isp-v4-0-cb1868be0105@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Keke Li <keke.li@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733389471; l=3682;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=e1IGpGN+wHotbP8zryXe8HZri1SkTJ/xRQNjX3mihjg=;
 b=dhB9wejkKzE+HrOAvh2njbgvE8glJAAeYWitkEXUl/3USN/0v68VzJLsQZM6lCDySbSu340JK
 IADjRB81n6mAeL2+Yj+V+oKEWrHOT7PWiRFhRJZKtNp0gDS49Bo+h97
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
2.47.0



