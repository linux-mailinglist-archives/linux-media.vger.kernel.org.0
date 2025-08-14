Return-Path: <linux-media+bounces-40064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E0FB29860
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E21D85E0AC9
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 04:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A77264F85;
	Mon, 18 Aug 2025 04:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FzpKJhAW"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7018D262FD8
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491866; cv=none; b=ZkSJi9O3QCz+bXwmpS/CEQIdkHNRIyagR+nnSR4pxv+j1sVycxXcMphhHbErRIFEfWQUme8Rod0zHAJZeO0vDrAEB1UzTw34NRilKRRYNihLEyRYilW+4SNw5GMI5zyB0K3D+ked11aZo7oav8fllPvNoUZvxVldTH8Jb4MHYMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491866; c=relaxed/simple;
	bh=BRlrK/ozaCrJ1HJ9q0xSMFv5wXoRugsg6jAewKZt9vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=F9uQZbzjpJ7dsfRhNNsq4W9C/BUo7EaifKh5DxZVUSit91C3moGV+q+C2mzkWb3B7UBumKTOy46ingx45LoO9RISU4TGJQF08hkk0P0Rg3nLycrQD06hPGpZjXx7PaoLznmdmrCH1+7cF87gD1gAMKRm3DW80HtUr2Mp6xtMF/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=FzpKJhAW; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250818043742epoutp0298a115a09c100a83b090e383e7a4ce50~cwoxT_oRC1608316083epoutp028
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:37:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250818043742epoutp0298a115a09c100a83b090e383e7a4ce50~cwoxT_oRC1608316083epoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491862;
	bh=t2ssHoU0LlSLJn81mT3BTJVhAxgpHc/CvHKSl7Yo5G8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FzpKJhAWKWc8fFYnbJLfbiol/2wEehvagk1s9zWhgvGPKCIxHUakU4YUQYpDa5bSH
	 qnXyngrwnI7MStMJZJuI+Y3RasJSLg43iO75BrWz21JSfPnQYCX8BYMAHCcm/2RxWk
	 kTrvYChx3LmKcI2q3Cjb5dM6lJXzuThzXtD3wkJ4=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250818043742epcas5p235a9682aefa4ebfb5a1dd91873fb3b20~cwowpsO6F0138801388epcas5p2d;
	Mon, 18 Aug 2025 04:37:42 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.86]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c50Lr6rlzz6B9m9; Mon, 18 Aug
	2025 04:37:40 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250814141014epcas5p410d41ede7e8ae4f3cf8db6d041d03946~bp3g-24j41288712887epcas5p4w;
	Thu, 14 Aug 2025 14:10:14 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141010epsmtip2d3fa3e0416c211931a50ce9066ad1416~bp3dKpZXp1817818178epsmtip2k;
	Thu, 14 Aug 2025 14:10:10 +0000 (GMT)
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
Subject: [PATCH v2 03/12] dt-bindings: media: nxp: Add support for FSD SoC
Date: Thu, 14 Aug 2025 19:39:34 +0530
Message-ID: <20250814140943.22531-4-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141014epcas5p410d41ede7e8ae4f3cf8db6d041d03946
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141014epcas5p410d41ede7e8ae4f3cf8db6d041d03946
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141014epcas5p410d41ede7e8ae4f3cf8db6d041d03946@epcas5p4.samsung.com>

Document the MIPI CSI2 controller device tree bindings for Tesla
FSD SoC

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 .../bindings/media/nxp,imx-mipi-csi2.yaml     | 88 ++++++++++++++-----
 1 file changed, 68 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
index 03a23a26c4f3..802fb1bd150d 100644
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
 
+  samsung,syscon-csis:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Syscon used to hold and release the reset of MIPI D-PHY
+
   phy-supply:
     description: The MIPI D-PHY digital power supply
 
@@ -85,7 +83,8 @@ properties:
             properties:
               data-lanes:
                 description:
-                  Note that 'fsl,imx7-mipi-csi2' only supports up to 2 data lines.
+                  Note that 'fsl,imx7-mipi-csi2' only supports up to 2 data
+                  lines.
                 minItems: 1
                 items:
                   - const: 1
@@ -107,7 +106,6 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - power-domains
   - ports
 
 additionalProperties: false
@@ -116,20 +114,70 @@ allOf:
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
+        samsung,syscon-csis: false
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
+        samsung,syscon-csis: false
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
+        - samsung,syscon-csis
 
 examples:
   - |
-- 
2.49.0


