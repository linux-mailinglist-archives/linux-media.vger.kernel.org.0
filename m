Return-Path: <linux-media+bounces-24112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF219FD0CF
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 08:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ABE73A0550
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 07:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3971494BF;
	Fri, 27 Dec 2024 07:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/iVW3Rg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E45713DDD3;
	Fri, 27 Dec 2024 07:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735283377; cv=none; b=hnkUyexchG4fv4oRC7J971D13QCIGRdT0kg8VnPyVzB4M2fg9DxY9O8jBIoc4Bx15QdQMWCGTWyV75f9yQsQBb5Qc4HgIDyObuNkzMclUQrtpd7m0Nh5nte0Oeyb2VIs1/cejwghgeyWwsY+KZA4iasNPjY/+7v0Ch2bEA2VZ58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735283377; c=relaxed/simple;
	bh=WVyXGXDLn1agM04aAKCvM95ighMkwQ+w3r3BgWh/q20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XMBaNIM0cIWR/8SGRD5krC3X/ymI5uJcChygHB3gRt3L+5bbowIuRzMDotkAp+kyQmAPcOC/3e/k0rPTECkAxWNx2pZbPnVSTRfJbbi5kbcRsVfHuWQy9RR6FwyAFFzlGadnjfC/zlgz0n0w1jv7eGyQT3jdG2+/eGci3cVChZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/iVW3Rg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10BB0C4CEE0;
	Fri, 27 Dec 2024 07:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735283377;
	bh=WVyXGXDLn1agM04aAKCvM95ighMkwQ+w3r3BgWh/q20=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=A/iVW3RgK+v089uXeJh5QayaYkPJMhhDSvJPIZjQQR9B/2GXOBBuIGcubG6mLOTmD
	 BL3QSKfPdumxOfvAyVI9fi7ASZKNVxMaRrLt7/tbpvyjm7ykuwQkhTOQB/NCyEs/oD
	 ZuKicQVHMkAYeGdD8U3rYC+R1HLSJ3fwYS4iYv0G7d8OLFIAG04514ErPofZ8+p5Ps
	 QaXpKvKCb7io5B9Xt4ZB3oXtcVEQvJZuR824FFClsGxesqrypNzbox7cshhB0X5+/k
	 RrxDrBx1DeGFkdqCAXat88ViXguejCTygudp/tXrDDCn4jmyDtV6qxzTQ4nWxa39ws
	 rv27mDfd93Uuw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0695CE7718F;
	Fri, 27 Dec 2024 07:09:37 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Fri, 27 Dec 2024 15:09:12 +0800
Subject: [PATCH v5 03/10] dt-bindings: media: Add
 amlogic,c3-mipi-adapter.yaml
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-c3isp-v5-3-c7124e762ff6@amlogic.com>
References: <20241227-c3isp-v5-0-c7124e762ff6@amlogic.com>
In-Reply-To: <20241227-c3isp-v5-0-c7124e762ff6@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 jacopo.mondi@ideasonboard.com, Keke Li <keke.li@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735283374; l=4070;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=o6Q1zuPq4y0enxVfoRdd9v721QVLXCRWjLLI5Pa3BnE=;
 b=zRJP4N49WZCSmXx7+8JnJ3u/fiteMZz6eT8suUZiULry8J6plAJ/7k7iWj94LpedtQtyCqZVq
 x89YGlhcCvHAPRd0X9uuNIX7z0/y5wskr3QP86gKd8sBKDmLUsflF70
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

c3-mipi-adapter is used to organize mipi data and
send raw data to ISP module.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 .../bindings/media/amlogic,c3-mipi-adapter.yaml    | 115 +++++++++++++++++++++
 MAINTAINERS                                        |   6 ++
 2 files changed, 121 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
new file mode 100644
index 000000000000..1105fee2d7a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/amlogic,c3-mipi-adapter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic C3 MIPI adapter receiver
+
+maintainers:
+  - Keke Li <keke.li@amlogic.com>
+
+description:
+  MIPI adapter is used to convert the MIPI CSI-2 data
+  into an ISP supported data format.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,c3-mipi-adapter
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: top
+      - const: fd
+      - const: rd
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
+      - const: isp0
+
+  assigned-clocks: true
+
+  assigned-clock-rates: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: input port node.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: output port node.
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
+        adap: adap@ff010000 {
+            compatible = "amlogic,c3-mipi-adapter";
+            reg = <0x0 0xff010000 0x0 0x100>,
+                  <0x0 0xff01b000 0x0 0x100>,
+                  <0x0 0xff01d000 0x0 0x200>;
+            reg-names = "top", "fd", "rd";
+            power-domains = <&pwrc PWRC_C3_ISP_TOP_ID>;
+            clocks = <&clkc_periphs CLKID_VAPB>,
+                     <&clkc_periphs CLKID_ISP0>;
+            clock-names = "vapb", "isp0";
+            assigned-clocks = <&clkc_periphs CLKID_VAPB>,
+                              <&clkc_periphs CLKID_ISP0>;
+            assigned-clock-rates = <0>, <400000000>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    c3_adap_in: endpoint {
+                        remote-endpoint = <&c3_mipi_csi_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    c3_adap_out: endpoint {
+                        remote-endpoint = <&c3_isp_in>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 1d1416b15570..af4239f2f3fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1243,6 +1243,12 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC MIPI ADAPTER DRIVER
+M:	Keke Li <keke.li@amlogic.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
+
 AMLOGIC MIPI CSI2 DRIVER
 M:	Keke Li <keke.li@amlogic.com>
 L:	linux-media@vger.kernel.org

-- 
2.47.1



