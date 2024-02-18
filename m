Return-Path: <linux-media+bounces-5388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 601FF859950
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 21:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92FFA1C20BA6
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 20:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3487318F;
	Sun, 18 Feb 2024 20:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nrWuTgYJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AD96D1AB;
	Sun, 18 Feb 2024 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708289038; cv=none; b=p34MuAz68QytKFE4PnAqY8yo8cQgPCPh2HVQkJdzZDFZiVm5/bB8D9NOAUrXPUNohTWhwdLisEWJxnjMfI6bbQVbH24KjBhMTaMpCZ+jusQJ9ThaAAo3bk1Ai6PGhPyYhx/c0oltZcQxwHqbUBAxyLiTvrUUcdaMw/ds2vlvClw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708289038; c=relaxed/simple;
	bh=u90wLGprkGpwaExqMaeqL6l7HK3cieRM+mZlNVWMJLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LiLRSEVkZwtekRwDyfUXcoV6adTOj0Rz5QE7hvPW1m2iE3rHKHzE4yfdpdRBDcUImyp06wBr+sYrW14cclabLk+8dmj9kuVJJT+X8dxFM9pZqb4RONuLPv8BFxiTmH/jMnl5YM0BsRgcs0xFZUrJw41SDmc/+5YPoerWtucT3hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nrWuTgYJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77695975;
	Sun, 18 Feb 2024 21:43:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708289027;
	bh=u90wLGprkGpwaExqMaeqL6l7HK3cieRM+mZlNVWMJLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nrWuTgYJoP5rJfqnLyekskV2aOFAOZ/aNXllar2d4UBSLiUWIGVs++/m4bUfDoDKi
	 sgEc9/V3mluewtfV6VXLmtaJXS0MsD02Fq38MJUrWvIfojVqVcyx7faurzfguvHY29
	 XZjGiS2krxycF7CuemHEAOR97ZlsW9+tA28nXXac=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	Adam Ford <aford173@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Helen Koike <helen.koike@collabora.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v13 05/12] dt-bindings: media: rkisp1: Add i.MX8MP ISP to compatible
Date: Sun, 18 Feb 2024 22:43:43 +0200
Message-ID: <20240218204350.10916-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240218204350.10916-1-laurent.pinchart@ideasonboard.com>
References: <20240218204350.10916-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Elder <paul.elder@ideasonboard.com>

The i.MX8MP ISP is compatbile with the rkisp1 driver. Add it to the list
of compatible strings. While at it, expand on the description of the
clocks to make it clear which clock in the i.MX8MP ISP they map to,
based on the names from the datasheet.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Tested-by: Adam Ford <aford173@gmail.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Add fsl,blk-ctrl property
- Make iommus, phys and phy-names conditional on compatible
---
 .../bindings/media/rockchip-isp1.yaml         | 37 ++++++++++++++++---
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index afcaa427d48b..6be00aca4181 100644
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
 
@@ -113,9 +121,6 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - iommus
-  - phys
-  - phy-names
   - power-domains
   - ports
 
@@ -143,6 +148,26 @@ allOf:
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
Regards,

Laurent Pinchart


