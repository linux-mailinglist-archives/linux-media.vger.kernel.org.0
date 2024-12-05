Return-Path: <linux-media+bounces-22678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 437279E509B
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 10:05:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE04E286FB8
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D901DA0E0;
	Thu,  5 Dec 2024 09:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbPb8fjF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B83D1D6DA1;
	Thu,  5 Dec 2024 09:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733389474; cv=none; b=nhZ7EwEog7P3zmBBTFRzmqtEVzC4V99VXMnX/Uhl+MsbGcqu2PrZ20IbGryt2AsKpXAyF/9VPol5rKcB13Rhs2WYID9cL09V4GFVuSskct3ZZeIJ5bUk8zAxBgc34h4cPalTT3o+b1C8P/lPAwKefR/obPYuC6BZihCQqcA3Ky8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733389474; c=relaxed/simple;
	bh=engeRqUqkZRi8/m1/Fms/7kHYYC/wYekRK9BwUj45Vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ub433XFQmsr8/UahwY+ZX4dG8Sn2Dw3ZIhYMPeqPejnGN1aaewiC655fWwQyL1OUvAebdA3FCjzmESAdk+ZRdPT/p+aDj9ENhSyv2r6E0BfD2IEzttj+f3T5Sfu0f1pN5pA6cxVogI4BMD+HnsyPcdFalRnE5EamQAMB1o5wkkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbPb8fjF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3CB0C4CEE6;
	Thu,  5 Dec 2024 09:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733389473;
	bh=engeRqUqkZRi8/m1/Fms/7kHYYC/wYekRK9BwUj45Vg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BbPb8fjFwiVKZ1ePp3MtTIB1NUCROOqGwJBtw0EEat59O1D2RiPBkIJ2vSerCQYmd
	 e4oplnvGVRooVxiLKd1eM4gKKdQVcC2T2i+P5mauicmY4NsKPz/c1/QfiU7MSoeley
	 xhq4CG/6wcOtvfWGxl3COpgJ2zQxLVgTHkC6EgReuoCnE5ssZWzY6Ac81Y7eMKtbAt
	 y8D7XZjHHQvTOsz+zq8GtjYBBmagrMIOf1mWh6yrP7Yu6BNm1vL7xuv3woholsz8N0
	 dRHLL4iZCA4VOIOPWMhqz7hSQeyHhDDnjjiHxaoqtgTmC6bJ+GlacojeSBWrVRoXbO
	 RFZNRABVD0jlw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3D4E77176;
	Thu,  5 Dec 2024 09:04:33 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Thu, 05 Dec 2024 17:04:29 +0800
Subject: [PATCH v4 03/10] dt-bindings: media: Add
 amlogic,c3-mipi-adapter.yaml
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-c3isp-v4-3-cb1868be0105@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733389471; l=3217;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=oQKgLFSQv2ZOWq3/s1BJFoqtISPznrmPYphWMWhQl0k=;
 b=v1Wvtucu51zYOr7yLrADPshLimANI2ESEtc3DxMq4bgaHob+r2lBxiYy4ODfdTvfmbN0Y3YkW
 3ZwAcq3lzJKA3mGEYUH5upAja0BHjqNVv9SdEu+O8tWIQFX3TtkeCsY
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
 .../bindings/media/amlogic,c3-mipi-adapter.yaml    | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
new file mode 100644
index 000000000000..d900ff9df61b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
@@ -0,0 +1,108 @@
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

-- 
2.47.0



