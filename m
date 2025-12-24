Return-Path: <linux-media+bounces-49436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF72CDB3DB
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 04:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C186C3095A2B
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 03:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E598730FC1B;
	Wed, 24 Dec 2025 03:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NXBATxqP"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99FD2F3624;
	Wed, 24 Dec 2025 03:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766546282; cv=none; b=t0P4zKH22t+0nRVTgpHk1Vnch4LZdaxoGr5O5kiDRycgWI4dsWqTHnu7gD0BhGrVSVYXkl9avzxXHJcN3Lwm/+Gr184AOW9AF9qWaQoS+ViQJzMfsjj2uww4bsPfV1jJ0JM0gCrmTwCuI/bvV4f+ZuFE5lVF7f7WnIsdVdQuHLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766546282; c=relaxed/simple;
	bh=x2Qz9fnqWW2ujyytawWHsSTpWVlY+EaQMCIFD1iQnQw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kk0QXezf1xPy8h2Q30hiepDQrRKod9hz24wVVMLNqdyrQJiWoh7cuA40xiVakpdDmDLVdvYuZjvY5HPievn/D3BdvoA9rNuZylEM7MzbYqbvelNBseZZ6YNdXfdu8MzkF7z+oUuyMhseIu7XpQWyt93utQ3fUzjiChJnLQHf1hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=NXBATxqP; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1f2f2236e07711f0b33aeb1e7f16c2b6-20251224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qSgk/ff5P9uae5l/SgNDf/rlxP+ki/jm4cke2+z9AIw=;
	b=NXBATxqPUeSg0DGuUehIpmVwWsl4yGuNpYaGj+bN8GiQIL+NuumywREhlxfBIxvJrR9XWPzveb8jg+jGgSiFEJ0h2MGf79O8uwmB41/uM7owShinw/430M2ohKmTB7w1ivBGHYaAd1o2/dOJdEPNO1YTlDtqmmgAoA83oa2mRns=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:a1d6779b-4fd9-4811-9fba-922e84d0d632,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:7fe587aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1f2f2236e07711f0b33aeb1e7f16c2b6-20251224
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2030907299; Wed, 24 Dec 2025 11:17:47 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 11:17:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 24 Dec 2025 11:17:45 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, Jianhua Lin <jianhua.lin@mediatek.com>
Subject: [PATCH v2 3/4] dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible string
Date: Wed, 24 Dec 2025 11:17:20 +0800
Message-ID: <20251224031721.9942-4-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251224031721.9942-1-jianhua.lin@mediatek.com>
References: <20251224031721.9942-1-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Compared to the previous generation IC, the MT8189 uses 34-bit iova
address-space (16GB)  and requires a single clock configuration.
Therefore, add "mediatek,mt8189-jpgenc" compatible to the binding document.
Additionally, it corrects the inheritance for MT8188, aligning it
with MT8189 due to their shared architecture and 34-bit iova address
space (16GB) requirements.
Previously, MT8188 was incorrectly defined alongside SoCs with 32-bit
iova address-space (4GB), such as "mediatek,mtk-jpgenc". This mismatch
results in an ABI break, as MT8188 cannot function correctly under
the 32-bit iova address-space (4GB) configuration.

Key changes include:
- Introducing "mediatek,mt8189-jpgenc" as a new compatible string to
  represent the correct architecture.
- Updating MT8188 to inherit from MT8189, ensuring proper support for
  34-bit iova address-space (16GB).
- Add property "mediatek,larb" for MT8189 requirements.
- Improved formatting for better readability and consistency.

These changes ensure that both MT8188 and MT8189 are correctly supported
with the necessary 34-bit iova address-space (16GB), while maintaining
compatibility with their shared architecture.

Extensive internal review and testing have been conducted to validate
these changes and ensure compliance with DT binding standards.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 .../bindings/media/mediatek-jpeg-encoder.yaml | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index 5b15f8977f67..3205ecbaa6c5 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -14,13 +14,24 @@ description: |-
 
 properties:
   compatible:
-    items:
-      - enum:
-          - mediatek,mt2701-jpgenc
-          - mediatek,mt8183-jpgenc
-          - mediatek,mt8186-jpgenc
-          - mediatek,mt8188-jpgenc
-      - const: mediatek,mtk-jpgenc
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mtk-jpgenc
+      - items:
+          - enum:
+              - mediatek,mt8189-jpgenc
+      - items:
+          - enum:
+              - mediatek,mt2701-jpgenc
+              - mediatek,mt8183-jpgenc
+              - mediatek,mt8186-jpgenc
+          - const: mediatek,mtk-jpgenc
+      - items:
+          - enum:
+              - mediatek,mt8188-jpgenc
+          - const: mediatek,mt8189-jpgenc
+
   reg:
     maxItems: 1
 
@@ -34,6 +45,10 @@ properties:
     items:
       - const: jpgenc
 
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: a phandle to the smi_larb node.
+
   power-domains:
     maxItems: 1
 
-- 
2.45.2


