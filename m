Return-Path: <linux-media+bounces-32451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBD8AB6772
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 11:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDF117AD28C
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 09:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277B222A4EF;
	Wed, 14 May 2025 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Wh4sc9Qa"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BED227BA1;
	Wed, 14 May 2025 09:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747214591; cv=none; b=g3m8uTCYB8DYlYgl4k3p8CnI1z0Sm+Cv9e/S2UBhR25H95Jbbw0SQvJG2ZX/2B2gkyDexUN1kUInAebNeQlKCTXiDl5Sx+8U1uqWndtB+qX+f3JV4HKUvKq2O/OzbdFvY7YLjjItiy993zzTtKZELd0jTNNdgVpaN7gGEVqiNVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747214591; c=relaxed/simple;
	bh=+1pbbQr6IhaWYuDDxWS5O5XFpl8IElD/YxVqY/H8a60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dpcGRHrpyA8pp4cb4Hw0PG/wmDgGvW4Wpxnb5ZYVB7uposX6v2EXfPfCz7Prdh8m3lFXmAPioSjOefED1FMABcY0kQKlRpcM2iTFZMnTI5z5b1FODufRJjvqdLfi/fKCEIkLIro0D4NqNIv7w3OM2jLFmDmkqIV4X3TfvPgf4dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Wh4sc9Qa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747214587;
	bh=+1pbbQr6IhaWYuDDxWS5O5XFpl8IElD/YxVqY/H8a60=;
	h=From:To:Cc:Subject:Date:From;
	b=Wh4sc9Qa05xj4yd8MmneyFPg0FeSVWh+s//2l7EzCfr2FlhjG6lYhSXwNQ6xDkdgq
	 mQN/iujkehU5CGmkaIFjS3COdJDeqDdSPGOjwbDoRYSSfHkEAcprTHep4lk68ODHlE
	 ZWExgB1bdfoyMTfKW38EP+egdGFv9wJQnOJ0sCcldJCp/ZaH7UTUA+qq45S2oKlQqU
	 cPmXRma/D8g8kHkyskyvC0cftGa2qj0zi7i+NxODCKXxexOOlwyNa59H2/P3L7WhDq
	 e93+p/pdbx2EL2Q9avwLFq/70Ag5V/7V3wKFdEqh7a2sChQKNDRMW2PK9XLJvPVvhA
	 4K+LqYTed8WXQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AAD5217E04C0;
	Wed, 14 May 2025 11:23:06 +0200 (CEST)
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
Subject: [PATCH v2 1/3] dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
Date: Wed, 14 May 2025 11:22:57 +0200
Message-ID: <20250514092259.47035-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible strings for the AAL, COLOR, MERGE and PADDING
hardware components found in MediaTek's MT8188 SoC.

This hardware is compatible with MT8195.

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Acked-by: Chun-Kuang Hu <chunkuang.hu@mediatek.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/display/mediatek/mediatek,aal.yaml        |  4 ++++
 .../bindings/display/mediatek/mediatek,color.yaml      |  4 ++++
 .../bindings/display/mediatek/mediatek,merge.yaml      |  4 ++++
 .../bindings/display/mediatek/mediatek,padding.yaml    | 10 +++++++---
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 5d2089dc596e..daf90ebb39bf 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -25,6 +25,10 @@ properties:
           - mediatek,mt8173-disp-aal
           - mediatek,mt8183-disp-aal
           - mediatek,mt8195-mdp3-aal
+      - items:
+          - enum:
+              - mediatek,mt8188-mdp3-aal
+          - const: mediatek,mt8195-mdp3-aal
       - items:
           - enum:
               - mediatek,mt2712-disp-aal
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index 6160439ce4d7..5564f4063317 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -27,6 +27,10 @@ properties:
           - mediatek,mt8167-disp-color
           - mediatek,mt8173-disp-color
           - mediatek,mt8195-mdp3-color
+      - items:
+          - enum:
+              - mediatek,mt8188-mdp3-color
+          - const: mediatek,mt8195-mdp3-color
       - items:
           - enum:
               - mediatek,mt7623-disp-color
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index 0de9f64f3f84..3798a25402d3 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -25,6 +25,10 @@ properties:
           - mediatek,mt8173-disp-merge
           - mediatek,mt8195-disp-merge
           - mediatek,mt8195-mdp3-merge
+      - items:
+          - enum:
+              - mediatek,mt8188-mdp3-merge
+          - const: mediatek,mt8195-mdp3-merge
       - items:
           - const: mediatek,mt6795-disp-merge
           - const: mediatek,mt8173-disp-merge
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
index be07bbdc54e3..86787866ced0 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
@@ -20,9 +20,13 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8188-disp-padding
-      - mediatek,mt8195-mdp3-padding
+    oneOf:
+      - enum:
+          - mediatek,mt8188-disp-padding
+          - mediatek,mt8195-mdp3-padding
+      - items:
+          - const: mediatek,mt8188-mdp3-padding
+          - const: mediatek,mt8195-mdp3-padding
 
   reg:
     maxItems: 1
-- 
2.49.0


