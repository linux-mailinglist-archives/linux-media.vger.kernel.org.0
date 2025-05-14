Return-Path: <linux-media+bounces-32452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44243AB676D
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 11:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5779D1B65993
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 09:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39C022B598;
	Wed, 14 May 2025 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="U0+11kFA"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AE6227B94;
	Wed, 14 May 2025 09:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747214592; cv=none; b=hXpTIzcSoKgy4keDevEFInrtksrvpyzfhGLLwcIMhNWEWla3nf7bOxZiYCE1djeccLN2qLQUShLObdOd/NJioMCESwnpVNDTWlL3WNEhXuN7O6D6vsgwLiUnnxZ+rvwN1WVh+3EM02ZJq1eA/G6Ujhsh9GEX4RPtQvGeLci7TU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747214592; c=relaxed/simple;
	bh=3oP+sXzBifYxFBF4SGDb4wLTHsf6AsJAT8aubEwsuoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rflIrQgrLyAGJllprCHs0qDWKrVfADSSNCXZZ/Doy3g9qQ38xtxDJ9OOGmLlxKfad27ck7YMPHQMBRNsg8tpWgoV6TNpMmBVJLKqZCoPwqFM4s+isBiFrIH7KNtkimcSDTgHSnYa43C54KcjF+yllsm5z3xNW+wUAG+Fk5MxwLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=U0+11kFA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747214588;
	bh=3oP+sXzBifYxFBF4SGDb4wLTHsf6AsJAT8aubEwsuoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U0+11kFAAisqULu24JiHete1De9FBeai9DmTfPutCACRxV7aKFLfHmCANafkDbErB
	 Cy90YyA3RZEAaxxo3C/a1hETf3dhlZN6PKV9uWq6Bx91i5DyQqDckv8mvMKjTi1r7e
	 gBBIdrEWJ+Y8+S/kfTViqOESpwNl4SbhDkfwWwtRoP9IJaJercKP5NnW0T5D9RT6gY
	 eUPK8e7RzN8g6yK1SN23ovcJLYPijfDrVvlN8/eHsF0oHOQjx3SXSzo87siXKe70D7
	 onm0DDGSnv6VN0yDjDeEdCiWufoo6/gm2V8Kng9MsXgXjHAI9qF/CUblqJmmjmsqrW
	 9FMv0Pp1EF4jA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7AF1D17E07F2;
	Wed, 14 May 2025 11:23:07 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@mediatek.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/3] dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
Date: Wed, 14 May 2025 11:22:58 +0200
Message-ID: <20250514092259.47035-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514092259.47035-1-angelogioacchino.delregno@collabora.com>
References: <20250514092259.47035-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible strings for the FG, HDR, RSZ, STITCH, TCC, TDSHP
and WROT hardware components found in MediaTek's MT8188 SoC.

This hardware is compatible with MT8195.

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/media/mediatek,mdp3-fg.yaml       | 8 ++++++--
 .../devicetree/bindings/media/mediatek,mdp3-hdr.yaml      | 8 ++++++--
 .../devicetree/bindings/media/mediatek,mdp3-rsz.yaml      | 1 +
 .../devicetree/bindings/media/mediatek,mdp3-stitch.yaml   | 8 ++++++--
 .../devicetree/bindings/media/mediatek,mdp3-tcc.yaml      | 8 ++++++--
 .../devicetree/bindings/media/mediatek,mdp3-tdshp.yaml    | 8 ++++++--
 .../devicetree/bindings/media/mediatek,mdp3-wrot.yaml     | 1 +
 7 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
index 03f31b009085..40fda59fa8a8 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
@@ -16,8 +16,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8195-mdp3-fg
+    oneOf:
+      - enum:
+          - mediatek,mt8195-mdp3-fg
+      - items:
+          - const: mediatek,mt8188-mdp3-fg
+          - const: mediatek,mt8195-mdp3-fg
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
index d4609bba6578..d9f926c20220 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
@@ -16,8 +16,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8195-mdp3-hdr
+    oneOf:
+      - enum:
+          - mediatek,mt8195-mdp3-hdr
+      - items:
+          - const: mediatek,mt8188-mdp3-hdr
+          - const: mediatek,mt8195-mdp3-hdr
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
index f5676bec4326..8124c39d73e9 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
@@ -20,6 +20,7 @@ properties:
           - mediatek,mt8183-mdp3-rsz
       - items:
           - enum:
+              - mediatek,mt8188-mdp3-rsz
               - mediatek,mt8195-mdp3-rsz
           - const: mediatek,mt8183-mdp3-rsz
 
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
index d815bea29154..1d8e7e202c42 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
@@ -16,8 +16,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8195-mdp3-stitch
+    oneOf:
+      - enum:
+          - mediatek,mt8195-mdp3-stitch
+      - items:
+          - const: mediatek,mt8188-mdp3-stitch
+          - const: mediatek,mt8195-mdp3-stitch
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
index 14ea556d4f82..6cff7c073ce4 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
@@ -17,8 +17,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8195-mdp3-tcc
+    oneOf:
+      - enum:
+          - mediatek,mt8195-mdp3-tcc
+      - items:
+          - const: mediatek,mt8188-mdp3-tcc
+          - const: mediatek,mt8195-mdp3-tcc
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
index 8ab7f2d8e148..cdfa27324738 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
@@ -16,8 +16,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8195-mdp3-tdshp
+    oneOf:
+      - enum:
+          - mediatek,mt8195-mdp3-tdshp
+      - items:
+          - const: mediatek,mt8188-mdp3-tdshp
+          - const: mediatek,mt8195-mdp3-tdshp
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
index 53a679338402..b6269f4f9fd6 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
@@ -20,6 +20,7 @@ properties:
           - mediatek,mt8183-mdp3-wrot
       - items:
           - enum:
+              - mediatek,mt8188-mdp3-wrot
               - mediatek,mt8195-mdp3-wrot
           - const: mediatek,mt8183-mdp3-wrot
 
-- 
2.49.0


