Return-Path: <linux-media+bounces-35773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FB6AE6529
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 14:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73FE3188A941
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AAF291C09;
	Tue, 24 Jun 2025 12:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dyuXmmP1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF9127A929;
	Tue, 24 Jun 2025 12:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768572; cv=none; b=ZG03W0IBi9LVPnYGjOQG/Ke7sCyACF+M3Nn/VAzDYkpVRvuNd6TeuwxaG5FZ4rJgF4Gr8TtOAPORbq5HW7iuze8gTiXeBFIOpojCPKs0gJzYEnxOtcJVONR3uv4Vj1D1vLHttShZ0dLhV3EhdAXzem3xGTuJi3TT3gO0k0Le5Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768572; c=relaxed/simple;
	bh=/OpeAPRRqo5VAW6buBekfligD+DiH5uVKr4nRH8bLH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q+UfoNhwoa+LIcUffJvxJOTvHcfeWqBSNP6QCNWAyRRoLMniidjIp3uIJ7+Yge3snU8O9zMowkuRlC5q5TFnIHWZmEX3+1ThQMPrv4OSNer9lQVbND1fQ52k+QxQOBijO6Sg9Jn5Cnkv9tjmA94kALp7V6bpFkKLA3NhVS0XL0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dyuXmmP1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70040134A;
	Tue, 24 Jun 2025 14:35:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750768551;
	bh=/OpeAPRRqo5VAW6buBekfligD+DiH5uVKr4nRH8bLH0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dyuXmmP1CEOgoKJxcel34GPGGwQ+AG/DXOy4BcWWq/KE221NsAfZpWNhnLVqo78Ck
	 32kgvBgaanO1Rss+L0vV7iXbvBOVZypo7ZdLMSsWryrkAiMy1oALISB3KWrVw1Z0u7
	 UEFP+SxQsb5NTx8lH9u12zzSXaXYUpnRvxa5EphU=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 13:35:58 +0100
Subject: [PATCH v2 1/3] dt-bindings: media: Add bindings for the RZ/V2H IVC
 block
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-ivc-v2-1-e4ecdddb0a96@ideasonboard.com>
References: <20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com>
In-Reply-To: <20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3311;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=/OpeAPRRqo5VAW6buBekfligD+DiH5uVKr4nRH8bLH0=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWpu3CClN8hmMhKTEcoId9Mktru3c1k1xnPx6o
 eJUn7Hzdk6JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFqbtwAKCRDISVd6bEV1
 MtQ6D/9c22J5++xNibzhMpFDtYvlz2LUrbDulqcR+8W6Ks1nOoehhC+z5PZCWJZnxkgL/uKXmRN
 g7b1661g/qAMJTfhzMsoQ3LCNismTSeqfF7ERPClu8ZSdABv0HcRn/F1eprvTuwEtpaJF1QnSn8
 i54S4P07aBypYkyJreKndIACzlaMqts+kqa0SF4FcMrOBrCPbuJ3eRwci8DNUGkHbFQJK10qpIL
 sAE5Y4JNrROR8ePP1Hkx9WrqFCWEmwpaQ6OOrn+o8OM02xOFFkYqXDjYf1DFG3fW1aPdfZ9bEJ4
 F9YUgX5RbrnQt8uYUszT/95VKsKayUNDFERW4SkL71/yXczQGW74BXOQP8yx9FAbMOIydP5SZku
 1NwlIZ+euRnKUuLoHhiMiAckx7ZXiXxEgHNqbwursnH9j0Q1ezO1ayJN+LaQUw4l0zT4r1kFvBC
 mroAZLqdjurlNhKP7SnHptpnYmGxiRTMqXiokkAWbECIVnp5SY+R34KL1aIvkWwCf1raAG0UwiX
 ZKdoa5TakolPrwtDEXa2tkFRrM4H6Ew3hgUFDjWDWK4ll2N214ZycYJQg7xvUwKb47o60fJAf6s
 OjBvQ8I01Shir5gChh+669MXV3cr025xGat997qf2TeDc+mmEXDGM55VErtygCSftGaeZl5EjlO
 mGImz5PXx33CQEw==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

The RZ/V2H SoC has a block called the Input Video Control block which
feeds image data into the Image Signal Processor. Add dt bindings to
describe the IVC.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v2:

	- compatible matches filename
	- Added power-domains
	- Aligned clock and reset entries on opening "<"
	- Removed status = "okay"; from example
---
 .../bindings/media/renesas,rzv2h-ivc.yaml          | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml b/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ee0849eeeaba840cf43c81d69449c631ad1c6a6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/renesas,rzv2h-ivc.yaml#
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
+    const: renesas,rzv2h-ivc
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
+      - const: pclk
+      - const: vin_aclk
+      - const: sclk
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
+      - const: presetn
+      - const: vin_aresetn
+      - const: sresetn
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
+      compatible = "renesas,rzv2h-ivc";
+      reg = <0x16040000 0x230>;
+
+      clocks = <&cpg CPG_MOD 0xe3>,
+               <&cpg CPG_MOD 0xe4>,
+               <&cpg CPG_MOD 0xe5>;
+      clock-names = "pclk", "vin_aclk", "sclk";
+
+      power-domains = <&cpg>;
+
+      resets = <&cpg 0xd4>,
+               <&cpg 0xd1>,
+               <&cpg 0xd3>;
+      reset-names = "presetn", "vin_aresetn", "sresetn";
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


