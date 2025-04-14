Return-Path: <linux-media+bounces-30099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B98B5A87905
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6265170E5C
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 07:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1313268FF6;
	Mon, 14 Apr 2025 07:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MC7VDOE8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75281265CBE;
	Mon, 14 Apr 2025 07:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616125; cv=none; b=UOuhHxzNz49R23bUs8idI9o5sSSx23hv9iSCb1oqlBCdOKR7b4qpAOdB/yXO453WVvFl47N0KFEIn92joxBE9UT1s1mvzSbRMyGyrVf59O8MqMehabnWSYlg/2BCBI6UI6iNH0o8jBaSMYMiJSiA9g7+F5EU9l38AdDmH+cxhzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616125; c=relaxed/simple;
	bh=prSbHO4o/ZT1OZ8wcxml8Os9tC9B1/rIGUn1Z6E8HbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dqokpRg0joPX38D2myKIrjtROtXRp3rt44q1s+BqNEAQu//B6/SaWUI8GopYjmq13HwilI5gvH42RBg6u16MG2AN+E3JzeLnYw8Y4Ay9lz34kM/cs9hyIPDu0mQN/w56m12t6ROnxXqrScEesNSNprhSzo99CrpNCVgLT/aZ2FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MC7VDOE8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B74D4C4CEF6;
	Mon, 14 Apr 2025 07:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744616124;
	bh=prSbHO4o/ZT1OZ8wcxml8Os9tC9B1/rIGUn1Z6E8HbA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MC7VDOE8IB8iXd5BU2H/Nmlziz9wFCaRTV/R/erRM0Zk/rabcu87TSNPDX3VXl0dK
	 gK5haaZQ+89+OMY2p2AOVuPTAiCDQWd0E3/mbDQE9S9VWuqq9mTxxn4Dy2KGI/OonD
	 Hsf5D3MxLJBecTlLorVfQAz0y2nDf5gjSdl78ARAZbMOua9NbGj65TpPKmI9C124vX
	 P3z3M3mOQkL5TKm62qKYUC0mdJo18ODhZpGcxCobGAxlgJS6lFjrmmLD4H+BmwYPnB
	 kiwyeAxW67muyTd4j5zscA6BUBgCwzb6ZPhA5glOfnPtZz66TIVFNDj9bMlP7BoPjh
	 xb5T6rH8RIMRw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA333C369B7;
	Mon, 14 Apr 2025 07:35:24 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Mon, 14 Apr 2025 15:35:18 +0800
Subject: [PATCH v8 05/10] dt-bindings: media: Add amlogic,c3-isp.yaml
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-c3isp-v8-5-9f89e537494e@amlogic.com>
References: <20250414-c3isp-v8-0-9f89e537494e@amlogic.com>
In-Reply-To: <20250414-c3isp-v8-0-9f89e537494e@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 jacopo.mondi@ideasonboard.com, Keke Li <keke.li@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744616122; l=3274;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=du1+aR7+sBHc7Hax20qHaAgFO3FnpZKvHRbOQ/i7Smc=;
 b=vwsI3TuGo6yoqJHVN0x+dEou/xIYlmL8ctyIbtQ1js+PBCWxUzkLUuQSwc/VBdckd9DqmjScW
 sYxYTVS9k4hDRNktA19Wj77hfNOmiFmRA4yINuyUXXx+/f34/A5PVTl
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

c3-isp is used to process raw image.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 .../devicetree/bindings/media/amlogic,c3-isp.yaml  | 88 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
new file mode 100644
index 000000000000..123bf462f098
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/amlogic,c3-isp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic C3 Image Signal Processing Unit
+
+maintainers:
+  - Keke Li <keke.li@amlogic.com>
+
+description:
+  Amlogic ISP is the RAW image processing module
+  and supports three channels image output.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,c3-isp
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: isp
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
+  interrupts:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: input port node.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - clocks
+  - clock-names
+  - interrupts
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/amlogic,c3-peripherals-clkc.h>
+    #include <dt-bindings/power/amlogic,c3-pwrc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp: isp@ff000000 {
+            compatible = "amlogic,c3-isp";
+            reg = <0x0 0xff000000 0x0 0xf000>;
+            reg-names = "isp";
+            power-domains = <&pwrc PWRC_C3_ISP_TOP_ID>;
+            clocks = <&clkc_periphs CLKID_VAPB>,
+                     <&clkc_periphs CLKID_ISP0>;
+            clock-names = "vapb", "isp0";
+            assigned-clocks = <&clkc_periphs CLKID_VAPB>,
+                              <&clkc_periphs CLKID_ISP0>;
+            assigned-clock-rates = <0>, <400000000>;
+            interrupts = <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>;
+
+            port {
+                c3_isp_in: endpoint {
+                    remote-endpoint = <&c3_adap_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 6d69206979b2..a0d93c00b949 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1255,6 +1255,12 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC ISP DRIVER
+M:	Keke Li <keke.li@amlogic.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
+
 AMLOGIC MIPI ADAPTER DRIVER
 M:	Keke Li <keke.li@amlogic.com>
 L:	linux-media@vger.kernel.org

-- 
2.49.0



