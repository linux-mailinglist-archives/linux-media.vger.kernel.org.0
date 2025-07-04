Return-Path: <linux-media+bounces-36828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C33AF9166
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 13:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA7551BC6381
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CDC2C3749;
	Fri,  4 Jul 2025 11:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E3Mrx2iP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9292C326B;
	Fri,  4 Jul 2025 11:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751628048; cv=none; b=HlS7IWbUTM27IgZi5M9MKQaQx+/kWD2z+f1CB02nXFHtqHEjSFNlq2KTXcJcfjiUbWnz21WxgxSaJCubIPLx9ElXyXoR8uY0KIJ1J4nGU6GByanOWhc8LMr+ZeRS8JnUTgj0WjUqlStCTN40GtRpOJMPcONhSUHEcO0vXPu4to4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751628048; c=relaxed/simple;
	bh=Ft++2HZAxYHWyfdgSxO325+s+H9eRG5EihvFUEQBdic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Moz0Czjs6m+Wdr7YKnFBYCzSt/Lm6oOS6op7CWlgZPRtu7tW7+R3sZnEp6BDQXl6WK6Bb7kKTXeRdAquwtcffpTinacmVqVeTGlfgJQrq/Bt24ILPpq1GZzCGaBx/jmfS/f5mO5h22WcTSR8t5l5ce5d77idl/IbYvG8bYjrroY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E3Mrx2iP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E00D6F3;
	Fri,  4 Jul 2025 13:20:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751628018;
	bh=Ft++2HZAxYHWyfdgSxO325+s+H9eRG5EihvFUEQBdic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E3Mrx2iPxGuKF9MkULOCdm0TE97JkSjX/80xQ6JEL/BF56FFa80IDb2isaKReYaoH
	 V3jzHaf26tU3sI7jZn2bbIkZMMYUG/uDMXokDNHeGtZooIT+Aqr3yipAo/hM+AWG5b
	 G4kp7/CJ5NG0CH2hHNggfu9qikk5C2IR9QsxijOk=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Fri, 04 Jul 2025 12:20:20 +0100
Subject: [PATCH v3 3/5] dt-bindings: media: Add bindings for the RZ/V2H IVC
 block
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-ivc-v3-3-5c45d936ef2e@ideasonboard.com>
References: <20250704-ivc-v3-0-5c45d936ef2e@ideasonboard.com>
In-Reply-To: <20250704-ivc-v3-0-5c45d936ef2e@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3395;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=Ft++2HZAxYHWyfdgSxO325+s+H9eRG5EihvFUEQBdic=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoZ7kHfz6J1EawGCfldJDGFDef86twyntS770or
 s2himtrZG+JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaGe5BwAKCRDISVd6bEV1
 Ml+TD/4vNRfUSPd6EhjsT3vidNeKy3bd4GYvjKKNfA1l21JznxUxyv+fvLoIf264I+WXqqTCI5l
 mtVTirl7C0TWQ1endPivHAMa3zhwhIs24IeztqKITmyMnTju/Eyo8ZkrKIqMdNQdiiYTjuDTB7Y
 N3O0hjN2gHYelxSkG+uj0MVTQ/rP8lFgn3lc/KmXTQtQ+EiKoKbueD9scmcqfeQQRe5NLTezBsm
 vnN+Mg3Q0qmNKeILozRv7xi3QvlmmkXiaadVCtwYeOxGcJACc6Tz+d04j5y0nEWRIQ65PtlFc3q
 IZ9UQ87z8J01+0xE2d2wFD49LvB8o9pSZRnMnlhRZkzO64BQINhR1JBeuHHMYmr+4nw/N/H30+S
 4HZdDFHD5+rqv6aFPDuZeEdFCgtL7scyAGf7ZYahpmIaV1L/S6vhZVrvZKMMvd3v4KOHLa2HD1O
 Am71vM/gWECu0NXo7DJYhGl1iVyxqoKnQ7QgWun9uABWQYFB77aVc0sdNEIP7yebmG7v99ZnrYf
 NA7LgqJnEpVbciMGGcPbH+YEkyh+mNWzhjYzosXUEd3XUf2Y4FYZ39K1lXJwlMhFH83373LrDym
 bsdMVth6mCh/WxAUAgpiWeQj9Kdkd2gy8KgcSopXF8AoPPY/YN8xE9IL+RFg3bf8cBbcOB0InmA
 FhSnWrhG3BadzLQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

The RZ/V2H SoC has a block called the Input Video Control block which
feeds image data into the Image Signal Processor. Add dt bindings to
describe the IVC.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3:

	- Rename from rzv2h-ivc.yaml to r9a09g057-ivc.yaml
	- Update clock and reset names

Changes in v2:

	- compatible matches filename
	- Added power-domains
	- Aligned clock and reset entries on opening "<"
	- Removed status = "okay"; from example
---
 .../bindings/media/renesas,r9a09g057-ivc.yaml      | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3ecccf0a4b05ffcf90c130924bfe50065b06f87e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/renesas,r9a09g057-ivc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/V2H Input Video Control Block
+
+maintainers:
+  - Daniel Scally <dan.scally@ideasonboard.com>
+
+description:
+  The IVC block is a module that takes video frames from memory and feeds them
+  to the Image Signal Processor for processing.
+
+properties:
+  compatible:
+    const: renesas,r9a09g057-ivc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Input Video Control block register access clock
+      - description: Video input data AXI bus clock
+      - description: ISP system clock
+
+  clock-names:
+    items:
+      - const: reg
+      - const: axi
+      - const: isp
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: Input Video Control block register access reset
+      - description: Video input data AXI bus reset
+      - description: ISP core reset
+
+  reset-names:
+    items:
+      - const: reg
+      - const: axi
+      - const: isp
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Output parallel video bus
+
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+  - reset-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    isp-input@16040000 {
+      compatible = "renesas,r9a09g057-ivc";
+      reg = <0x16040000 0x230>;
+
+      clocks = <&cpg CPG_MOD 0xe3>,
+               <&cpg CPG_MOD 0xe4>,
+               <&cpg CPG_MOD 0xe5>;
+      clock-names = "reg", "axi", "isp";
+
+      power-domains = <&cpg>;
+
+      resets = <&cpg 0xd4>,
+               <&cpg 0xd1>,
+               <&cpg 0xd3>;
+      reset-names = "reg", "axi", "isp";
+
+      interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
+
+      port {
+        ivc_out: endpoint {
+          remote-endpoint = <&isp_in>;
+        };
+      };
+    };
+...

-- 
2.34.1


