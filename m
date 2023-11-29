Return-Path: <linux-media+bounces-1328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF9B7FD2A0
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 10:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AD09B20CBA
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 09:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3B4156FD;
	Wed, 29 Nov 2023 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sTT5MvtA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4DA2108;
	Wed, 29 Nov 2023 01:28:50 -0800 (PST)
Received: from pyrite.hamster-moth.ts.net (h175-177-049-135.catv02.itscom.jp [175.177.49.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A74A32B6;
	Wed, 29 Nov 2023 10:28:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701250093;
	bh=yeDPN9oGkesAazzCi9HQ+rTaGgXNlCyocQHZh8/QGks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sTT5MvtAsPer5EX+3DkssuQuiTyU6eu29lIu1aDBXh/yy6n0fSxV0CHbx8t7O4as9
	 65Yg3jCqiXBAhMGTGLzOfFFA+E2bsegjSjdwiqXuv9QH0VIAFAZgbxuMi2D4S8I87z
	 sZJUzhRebfJVrM6T8OkUQGQ8vGG0/aAnENdEPqHg=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	aford173@gmail.com,
	Paul Elder <paul.elder@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Helen Koike <helen.koike@collabora.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 06/11] dt-bindings: media: rkisp1: Add i.MX8MP ISP to compatible
Date: Wed, 29 Nov 2023 18:27:54 +0900
Message-Id: <20231129092759.242641-7-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231129092759.242641-1-paul.elder@ideasonboard.com>
References: <20231129092759.242641-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX8MP ISP is compatbile with the rkisp1 driver. Add it to the list
of compatible strings. While at it, expand on the description of the
clocks to make it clear which clock in the i.MX8MP ISP they map to,
based on the names from the datasheet (which are confusing).

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v1:

- Add fsl,blk-ctrl property
- Make iommus, phys and phy-names conditional on compatible

 .../bindings/media/rockchip-isp1.yaml         | 37 ++++++++++++++++---
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index e466dff8286d..b9c812b81389 100644
--- a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -16,6 +16,7 @@ description: |
 properties:
   compatible:
     enum:
+      - fsl,imx8mp-isp
       - rockchip,px30-cif-isp
       - rockchip,rk3399-cif-isp
 
@@ -36,9 +37,9 @@ properties:
     minItems: 3
     items:
       # isp0 and isp1
-      - description: ISP clock
-      - description: ISP AXI clock
-      - description: ISP AHB clock
+      - description: ISP clock (for imx8mp, clk)
+      - description: ISP AXI clock (for imx8mp, m_hclk)
+      - description: ISP AHB clock (for imx8mp, hclk)
       # only for isp1
       - description: ISP Pixel clock
 
@@ -52,6 +53,13 @@ properties:
       # only for isp1
       - const: pclk
 
+  fsl,blk-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+    description:
+      A phandle to the media block control for the ISP, followed by a cell
+      containing the index of the gasket.
+
   iommus:
     maxItems: 1
 
@@ -112,9 +120,6 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - iommus
-  - phys
-  - phy-names
   - power-domains
   - ports
 
@@ -142,6 +147,26 @@ allOf:
       required:
         - interrupt-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8mp-isp
+    then:
+      properties:
+        iommus: false
+        phys: false
+        phy-names: false
+      required:
+        - fsl,blk-ctrl
+    else:
+      properties:
+        fsl,blk-ctrl: false
+      required:
+        - iommus
+        - phys
+        - phy-names
+
 additionalProperties: false
 
 examples:
-- 
2.39.2


