Return-Path: <linux-media+bounces-40071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A076B29877
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3538E3B1717
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 04:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A06D263F43;
	Mon, 18 Aug 2025 04:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="me7YHKXs"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D73D26E715
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491902; cv=none; b=WEeJ1+lR39ywI+GOkgcBQsRaj7eovp6OpContIXGWbvQZRp1+j/yBvcAhHC80tgADTTGbQ1Go/9U2M4kduh5KZspH0IF5+Wjf5TgJ5YTYeIHm7/D/WUITWmt8mckC6N4EC7juUkZkdkp3TJVRo+WpcGD8qa1Jj6x7l8G6FzywvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491902; c=relaxed/simple;
	bh=+QgrRc118sq87VC0EYge42BjFmEO605zL56aM/XF3dE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Re31VIsiPsy2eOD/H48XdZYa7IRrlaqSfKAQiRGESVFvBJh24j6ba6U5H+DKNwlbYhykO01OeAzEs3zmE9TVBD2FkkIitEIXCP/+o0dcPCHEyp1K8xOXiFf2W5VZdyiW/+71dUkdH2XWw9pA3Cow9HKf1HQhgZJhZGWTpb5w7k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=me7YHKXs; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250818043818epoutp026aee57d8db119e4ce22275ee71f71644~cwpSzPlyb1603616036epoutp02j
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:38:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250818043818epoutp026aee57d8db119e4ce22275ee71f71644~cwpSzPlyb1603616036epoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491898;
	bh=tTdlHyy4zL51FrYWXTe3WQyidqS2LdEHrq0CGLTDvFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=me7YHKXslWt0eYyoysKKW5LNb72EYcy4nVq2bASIhoMBWS8N0qdhg8sXZKdAaFdnS
	 dXGfZbLbjA9APBajysxWiCq/RoHojMoOsgU0hJRot+sGHBrcjuJhliI6uwX1+OvnZk
	 BY+laXbkA1eIW2v7D5Fb2Adj7KfQYdC0/8cHLHsM=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818043817epcas5p4c97abb05eac0e9315746e0dd1152fd16~cwpSAY67t2156321563epcas5p4N;
	Mon, 18 Aug 2025 04:38:17 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c50MX2Hv0z2SSKh; Mon, 18 Aug
	2025 04:38:16 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250814141051epcas5p14dccee388087372973988aeebcb872cf~bp4DUyPvU0355803558epcas5p1l;
	Thu, 14 Aug 2025 14:10:51 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141047epsmtip2d40283acf8de0531ae8149c6c2120968~bp3-gNYA41818718187epsmtip2a;
	Thu, 14 Aug 2025 14:10:47 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Inbaraj E <inbaraj.e@samsung.com>
Subject: [PATCH v2 10/12] dt-bindings: media: fsd: Document CSIS DMA
 controller
Date: Thu, 14 Aug 2025 19:39:41 +0530
Message-ID: <20250814140943.22531-11-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141051epcas5p14dccee388087372973988aeebcb872cf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141051epcas5p14dccee388087372973988aeebcb872cf
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141051epcas5p14dccee388087372973988aeebcb872cf@epcas5p1.samsung.com>

Document bindings for the FSD CSIS DMA controller.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 .../bindings/media/tesla,fsd-csis-media.yaml  | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml

diff --git a/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml b/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
new file mode 100644
index 000000000000..ce6c2e58ed4e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/tesla,fsd-csis-media.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tesla FSD SoC MIPI CSI-2 DMA (Bridge device) receiver
+
+maintainers:
+  - Inbaraj E <inbaraj.e@samsung.com>
+
+description: |-
+  The FSD MIPI CSI-2 (Camera Serial Interface 2) have internal DMA engine to
+  capture frames originating from the sensor.
+
+properties:
+  compatible:
+    const: tesla,fsd-csis-media
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: pclk
+      - const: pll
+
+  iommus:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - iommus
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/fsd-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    csi0: csi@12641000 {
+        compatible = "tesla,fsd-csis-media";
+        reg = <0x12661000 0x44c>;
+        interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock_csi CAM_CSI0_0_IPCLKPORT_I_ACLK>,
+                 <&clock_csi CAM_CSI0_0_IPCLKPORT_I_PCLK>,
+                 <&clock_csi CAM_CSI_PLL>;
+        clock-names = "aclk", "pclk", "pll";
+        iommus = <&smmu_isp 0x0 0x0>;
+
+        port {
+            csi_in_0: endpoint {
+                remote-endpoint = <&mipi_csis_0_out>;
+            };
+        };
+    };
+
+...
-- 
2.49.0


