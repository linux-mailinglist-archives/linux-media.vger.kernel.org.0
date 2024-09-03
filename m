Return-Path: <linux-media+bounces-17429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0AA969444
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 08:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 825E228357D
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 06:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01431D6C64;
	Tue,  3 Sep 2024 06:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPUP5dF+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5591D54CD;
	Tue,  3 Sep 2024 06:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725346638; cv=none; b=sCw5A3ByNs/DSTfbNHrE3h1r+hDE+48BK5F6F0Aw6CDNEVmU2rVv7hqmT/K59HEXlyp+xRhpqE0FyDBFjFYiF5HqnsUFaUpPxrEre4ElqLHcy94czbNWtXAP2G7/mrnGvDbqnu1aBfBD0jJzE3Ii6jXZvkiMxqcxNbQoydtbVdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725346638; c=relaxed/simple;
	bh=QKKlUBADiIsbsgfJTLbGBzCQO11T0Vm94vx5XrVrxcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M1oM9f0vAZVJScXGpxkP+FOuIoqSD5J6hEq3mgOcTkpAwbQ4APa19dc2aSFv9cCA8rZdvnZkhYqwp+Cb1tB/VyOU4TQGXjQrHNG9lOQ9ujRubvAROfApbrUjRDx2J3mOLhjoUuEb4gUalz8oOl5R0jnRbldM3Iebj9ipPcvAXZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPUP5dF+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8ACD3C4CEC8;
	Tue,  3 Sep 2024 06:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725346637;
	bh=QKKlUBADiIsbsgfJTLbGBzCQO11T0Vm94vx5XrVrxcM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZPUP5dF+eRcvUXUNRni8C69U0fdD8O4n7XhUZBrt9LyKce/nfdWPYlmSbbBahim6w
	 hJG90ZeAqPF3/KthGqFGKhEcI0Qo0MlCwOiZt49kMsn4AZxhvPVfq2WgUY7XCtEJQf
	 y9cuvLFJy9fyS73g1dO5NOOmLlmmMgJM0aLWs9KiDSCkTK0mksNFv1+66taLfFPoyd
	 I4EgT6E5TbfOCxJZN2zqz06VHHAIdtDt83Bp8m/NrTyP0CZvEfNEVmHl9qCptuiOAa
	 34ohrxKv0bJJ72LsgAIhkX4svRpKIWaWYr/XwSdXMMJ7f9GHAXs8zSqQHX8VMYr6XZ
	 iJtMspkAqHsvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733F5CD342D;
	Tue,  3 Sep 2024 06:57:17 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Tue, 03 Sep 2024 14:57:05 +0800
Subject: [PATCH 1/9] dt-bindings: media: Add amlogic,c3-mipi-csi2.yaml
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-c3isp-v1-1-8af0edcc13c8@amlogic.com>
References: <20240903-c3isp-v1-0-8af0edcc13c8@amlogic.com>
In-Reply-To: <20240903-c3isp-v1-0-8af0edcc13c8@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725346629; l=3684;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=BdP+/5BjAsMXQCbNluBrVl9aVK7l3wSMYOlPPRhLBQk=;
 b=LjgV7sBuhNlmOQWox04jNfMdvWljjEiwl6vgkosyXOiv6TlqMD+kteoKWTd2DKdAI6GzcJMHU
 YFxfVz24HjLDkdXpHDdIOsZw9f3caXMKSua5uxAZWDPLh6r+pv3PySm
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

c3-mipi-csi2 is used to receive mipi data
from image sensor.

Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 .../bindings/media/amlogic,c3-mipi-csi2.yaml       | 130 +++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
new file mode 100644
index 000000000000..85d3088d6f9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
@@ -0,0 +1,130 @@
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
+description: |-
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
+    minItems: 3
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: csi_aphy
+      - const: csi_dphy
+      - const: csi_host
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: vapb
+      - const: csi_phy0
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
+
+            reg = <0x0 0xff018000 0x0 0x400>,
+                  <0x0 0xff019000 0x0 0x300>,
+                  <0x0 0xff01a000 0x0 0x100>;
+
+            reg-names = "csi_aphy", "csi_dphy", "csi_host";
+
+            power-domains = <&pwrc PWRC_C3_MIPI_ISP_WRAP_ID>;
+
+            clocks =  <&clkc_periphs CLKID_VAPB>,
+                      <&clkc_periphs CLKID_CSI_PHY0>;
+
+            clock-names = "vapb", "csi_phy0";
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
2.45.2



