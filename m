Return-Path: <linux-media+bounces-23696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D82779F63E8
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 11:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 935B41611E6
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 10:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E965F1A2391;
	Wed, 18 Dec 2024 10:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dsqlH2sq"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED4919D071;
	Wed, 18 Dec 2024 10:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734519216; cv=none; b=B5ziV5K/+jkAZwa31mbJBPUp1FIxOreOF+9jtKQPU43SlRnHz7wInaumtF/pzIETU6o1Kr/s/pS4KC6OPqNjdT4UNSWtmjUvX4esil6hHRLuZXwREYzvx1JG0nZVkmJHF875uSHHGWFTVgUBlz7+uvGxa/1Bvh8hJ3pyFWn0Lds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734519216; c=relaxed/simple;
	bh=N3yE4+/zUzwrZLGitsLbjb1957m/tWo8jToq6NvN4nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iZl+oWxcX7AC2ms4KSFN5vMnj3y8q5i8VpcOJSNGrMFnlp9+BdoA57TbvLSf7VcbuaUGWrJDwwblVE+yES42nZj62/Pnj47jtIXzBNX23jg4ohnZaKD/+OQbZ0vuY3/NKKP08MocuVfQfVPUOEoTkVu8JXk/WZEQQhvIKrmUqBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dsqlH2sq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734519212;
	bh=N3yE4+/zUzwrZLGitsLbjb1957m/tWo8jToq6NvN4nw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dsqlH2sqPyC5sMeSdb2HtWuMk8PfpABN0cFtmBSr5jxlJkyu+KbdCvyuLt30cUfBD
	 cDpqob/Bq7y000yGqhTzmF1j6B10Wgwo/tZbMt4nVlgeCDGXmVta9t5JqqHlZeKsu6
	 9luviBTwwQKo5ArPLUgv/o0KEB8tDavGN4u7jtnwgOhN3Fq6lBn8mjQN6RTUmQ4SEV
	 vXH7RyBRYUhIGsKs1yNiMO6ENfEdG06yM2DqVQMOAMZhT3jDZm0BxXSRcGIvYa1oUM
	 eEfWQbdECOxhs5JPUB7qvAr6NQjLAOIoCuYBo/GYqtMjpMaSq/E4BltP05fVFCvk5c
	 1rRA1If0ACoPA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3752617E3613;
	Wed, 18 Dec 2024 11:53:31 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	moudy.ho@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	sebastian.fricke@collabora.com,
	macpaul.lin@mediatek.com
Subject: [PATCH v1 1/3] dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
Date: Wed, 18 Dec 2024 11:53:18 +0100
Message-ID: <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/display/mediatek/mediatek,aal.yaml        |  4 ++++
 .../bindings/display/mediatek/mediatek,color.yaml      |  4 ++++
 .../bindings/display/mediatek/mediatek,merge.yaml      |  4 ++++
 .../bindings/display/mediatek/mediatek,padding.yaml    | 10 +++++++---
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index cf24434854ff..1479035da409 100644
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
index 7df786bbad20..799c0b8fc1f9 100644
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
index dae839279950..415a25bc18fa 100644
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
2.46.1


