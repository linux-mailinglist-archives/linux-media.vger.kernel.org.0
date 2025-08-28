Return-Path: <linux-media+bounces-41225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DB1B397A3
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 10:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E13B7AB255
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 08:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703982EE616;
	Thu, 28 Aug 2025 08:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FHkLhmcR"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34FF2ECE9E
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 08:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756371572; cv=none; b=EZdGjJp0fJJUInFs1e9k0LLfyxcTrNi8ersxdESucxn5jaCRfjrwrR6vsWo6R8mKVOiV4gORRXgZpkjJDqnKAAkVI7ggmYpUM7GB8GwM8QM+zgI8b9E++aKTZEz5Km8if29d0wTilHemjFEsr9XK1DeL3BpKKGBu7munXFpfG5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756371572; c=relaxed/simple;
	bh=dQvNhzCuQBbDzPTHUgUTSzIHMORb3jTRG7p6bMnYcPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=eJMjMkN09tSAVJ1K6Q2TO0g+HT+48VwscrQedU7sdgRtLJ8gEVfqrZpZDymvzYRG9BUdz3t435MqM33fIahK+qwYI58HXrVvQsIDeKaI1o8PPQ7wZD2unmZgMsAu2tDM+m8Kom7c+txl/FrisufHJ20C3oxU3JDOFOUw8RLBBPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=FHkLhmcR; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250828085928epoutp0402ed1d5b0f9a6a06f12afb517f9259f8~f4qLjhuPL2673226732epoutp04H
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 08:59:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250828085928epoutp0402ed1d5b0f9a6a06f12afb517f9259f8~f4qLjhuPL2673226732epoutp04H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756371568;
	bh=Nh+NV/RCQEe7YpPNjzL9CCS4Sy68m8a+56F+E9QurCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FHkLhmcR1r597S1wksvh9dJ25IOlg8H66lwtNHHyS6dMC8Y25dIfXxWyuNk7xk03m
	 kSqiVaEAPRubOUHPXOA+zMhM1y6PGGS9feTRAH3Ct1CkG71EpsOxnLqVi7gVC7P7tv
	 zrp9m1ACpvcU9YYIvv2DZgZEKqRXAYF0T5YkFziY=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250828085928epcas5p13a4867c73b3c3e4ba4afbd9dd228c504~f4qK_IiF00547205472epcas5p1w;
	Thu, 28 Aug 2025 08:59:28 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cCFhH2CZWz2SSKZ; Thu, 28 Aug
	2025 08:59:27 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250828085926epcas5p1b82576210280fb44c6c7f02851da71c6~f4qJgV6OG0547105471epcas5p1m;
	Thu, 28 Aug 2025 08:59:26 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250828085923epsmtip25f82c5e1bb289e9b9357c0b6a86fd6d4~f4qG3h2CV0309203092epsmtip2h;
	Thu, 28 Aug 2025 08:59:23 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
	ravi.patel@samsung.com, shradha.t@samsung.com, Inbaraj E
	<inbaraj.e@samsung.com>
Subject: [PATCH v3 1/7] dt-bindings: media: nxp: Add support for FSD SoC
Date: Thu, 28 Aug 2025 14:29:05 +0530
Message-ID: <20250828085911.81266-2-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250828085911.81266-1-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250828085926epcas5p1b82576210280fb44c6c7f02851da71c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250828085926epcas5p1b82576210280fb44c6c7f02851da71c6
References: <20250828085911.81266-1-inbaraj.e@samsung.com>
	<CGME20250828085926epcas5p1b82576210280fb44c6c7f02851da71c6@epcas5p1.samsung.com>

The Tesla FSD CSIS link controller is used to configure MIPI CSI-2
Rx link operations.

The Tesla FSD SoC include a MIPI CSI-2 Rx IP core named CSIS, which is
compatible with the CSIS IP found in NXP i.MX7 and i.MX8 SoCs. Add the
compatible string "tesla,fsd-mipi-csi2" to support the MIPI CSI-2 Rx
link operation on the Tesla FSD SoC.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 .../bindings/media/nxp,imx-mipi-csi2.yaml     | 91 +++++++++++++++----
 1 file changed, 71 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
index 41ad5b84eaeb..39b9447fd40c 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
@@ -14,7 +14,7 @@ description: |-
   The NXP i.MX7 and i.MX8 families contain SoCs that include a MIPI CSI-2
   receiver IP core named CSIS. The IP core originates from Samsung, and may be
   compatible with some of the Exynos4 and S5P SoCs. i.MX7 SoCs use CSIS version
-  3.3, and i.MX8 SoCs use CSIS version 3.6.3.
+  3.3, i.MX8 SoCs use CSIS version 3.6.3 and FSD SoC uses CSIS version 4.3.
 
   While the CSI-2 receiver is separate from the MIPI D-PHY IP core, the PHY is
   completely wrapped by the CSIS and doesn't expose a control interface of its
@@ -26,6 +26,7 @@ properties:
       - enum:
           - fsl,imx7-mipi-csi2
           - fsl,imx8mm-mipi-csi2
+          - tesla,fsd-mipi-csi2
       - items:
           - enum:
               - fsl,imx8mp-mipi-csi2
@@ -38,24 +39,21 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 3
-    items:
-      - description: The peripheral clock (a.k.a. APB clock)
-      - description: The external clock (optionally used as the pixel clock)
-      - description: The MIPI D-PHY clock
-      - description: The AXI clock
+    minItems: 2
+    maxItems: 4
 
   clock-names:
-    minItems: 3
-    items:
-      - const: pclk
-      - const: wrap
-      - const: phy
-      - const: axi
+    minItems: 2
+    maxItems: 4
 
   power-domains:
     maxItems: 1
 
+  tesla,syscon-csis:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Syscon used to hold and release the reset of MIPI D-PHY
+
   phy-supply:
     description: The MIPI D-PHY digital power supply
 
@@ -93,7 +91,8 @@ properties:
             properties:
               data-lanes:
                 description:
-                  Note that 'fsl,imx7-mipi-csi2' only supports up to 2 data lines.
+                  Note that 'fsl,imx7-mipi-csi2' only supports up to 2 data
+                  lines.
                 minItems: 1
                 items:
                   - const: 1
@@ -115,7 +114,6 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - power-domains
   - ports
 
 additionalProperties: false
@@ -124,20 +122,73 @@ allOf:
   - if:
       properties:
         compatible:
-          contains:
-            const: fsl,imx7-mipi-csi2
+          const: fsl,imx7-mipi-csi2
     then:
+      properties:
+        clocks:
+          items:
+            - description: The peripheral clock (a.k.a. APB clock)
+            - description: The external clock (optionally used as the pixel
+                clock)
+            - description: The MIPI D-PHY clock
+        clock-names:
+          items:
+            - const: pclk
+            - const: wrap
+            - const: phy
+        tesla,syscon-csis: false
+        fsl,num-channels: false
       required:
+        - power-domains
         - phy-supply
         - resets
-    else:
+
+  - if:
+      properties:
+        compatible:
+          const: fsl,imx8mm-mipi-csi2
+    then:
       properties:
         clocks:
-          minItems: 4
+          items:
+            - description: The peripheral clock (a.k.a. APB clock)
+            - description: The external clock (optionally used as the pixel
+                clock)
+            - description: The MIPI D-PHY clock
+            - description: The AXI clock
         clock-names:
-          minItems: 4
+          items:
+            - const: pclk
+            - const: wrap
+            - const: phy
+            - const: axi
+        tesla,syscon-csis: false
+        fsl,num-channels: false
         phy-supply: false
         resets: false
+      required:
+        - power-domains
+
+  - if:
+      properties:
+        compatible:
+          const: tesla,fsd-mipi-csi2
+    then:
+      properties:
+        clocks:
+          items:
+            - description: The peripheral clock (a.k.a. APB clock)
+            - description: The DMA clock
+        clocks-names:
+          items:
+            - const: pclk
+            - const: aclk
+        phy-supply: false
+        resets: false
+        power-domains: false
+      required:
+        - tesla,syscon-csis
+        - fsl,num-channels
 
 examples:
   - |
-- 
2.49.0


