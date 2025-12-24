Return-Path: <linux-media+bounces-49437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2B1CDB3CF
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 04:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DE2A230215BC
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 03:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748D030E83A;
	Wed, 24 Dec 2025 03:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TTTMzjes"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898E430C60E;
	Wed, 24 Dec 2025 03:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766546284; cv=none; b=W8uiUdpb3liwlaU6y0Ol+EEOC6cBBDn6EbgGQrkRpZkPdqVMxZp9WLNkB0aZXnC5pJFoCiyMRRyh4hq02NeWdNAJ1j4s4i2d1yD17sPoG4VLfc43JDKqNlJOHMzt/pj0Zs/+tGSkczoqXC7pqESnpyRcVMiNV8aNJBjIwmQEzKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766546284; c=relaxed/simple;
	bh=pSGIlmkIQKrPG5nJDHC8rJrBg1mffCpJF05XgpGx0do=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pddkKjGPkBDjKsAQrVsI/RdTsKcue8EpU86ojwnjeZ+hlHZTLEAVWW5SgUjSDiXTYAzGQDJRl9wIXV/mTsskVtGsvkRe3Zfj65PycmU8r1W58ZCCL1AuJ36A0KLofwb0+wxpRn8tnLL48P4D+LaPxano3KDiAt0XGjB2aWLQabs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=TTTMzjes; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1ead81d6e07711f0b33aeb1e7f16c2b6-20251224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rM+YHKGVmwJ/Pk2fHwI/gsJzacwSeKmWBO+yWoQfwt0=;
	b=TTTMzjesyBvW7MrwJgss81m43HKcrP5+bg3iQ+li8v32vojoQ8dTWmg4ASlyljRRtcrfNMjwT/MI055IB+qUuwL0bgeoSMJHGYSYbjwqDdqYjI4gQ1uKRPa8JEMupeyTAYMtE2Kgaybwb41C3dVXLGWOXXSBwF3LAoLYc49UEoI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:5cd12d11-93d0-4946-8813-bfdf2c683680,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:80e587aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1ead81d6e07711f0b33aeb1e7f16c2b6-20251224
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 423097831; Wed, 24 Dec 2025 11:17:46 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 24 Dec 2025 11:17:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 24 Dec 2025 11:17:44 +0800
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
Subject: [PATCH v2 2/4] dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible string
Date: Wed, 24 Dec 2025 11:17:19 +0800
Message-ID: <20251224031721.9942-3-jianhua.lin@mediatek.com>
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
address-space (16GB) and requires a single clock configuration.
Therefore, add "mediatek,mt8189-jpgdec" compatible to the binding document.
Additionally, it corrects the inheritance for MT8188, aligning it
with MT8189 due to their shared architecture and 34-bit iova address
space (16GB) and singlesingle clock requirement.
Previously, MT8188 was incorrectly defined alongside SoCs with 32-bit
iova address-space (4GB), such as "mediatek,mt2701-jpgdec". This mismatch
results in an ABI break, as MT8188 cannot function correctly under
the 32-bit iova address-space (4GB) configuration.

Key changes include:
- Introducing "mediatek,mt8189-jpgdec" as a new compatible string to
  represent the correct architecture.
- Updating MT8188 to inherit from MT8189, ensuring proper support for
  34-bit iova address-space (16GB) and simplifying clock configuration.
- Add property "mediatek,larb" for MT8189 requirements.
- Improved formatting for better readability and consistency.

These changes ensure that both MT8188 and MT8189 are correctly supported
with the necessary 34-bit iova address-space (16GB), while maintaining
compatibility with their shared architecture.

Extensive internal review and testing have been conducted to validate
these changes and ensure compliance with DT binding standards.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 .../bindings/media/mediatek-jpeg-decoder.yaml | 50 ++++++++++++++++---
 1 file changed, 44 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
index a4aacd3eb189..814b53ef46e7 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -17,13 +17,19 @@ properties:
     oneOf:
       - items:
           - enum:
-              - mediatek,mt8173-jpgdec
               - mediatek,mt2701-jpgdec
+              - mediatek,mt8173-jpgdec
+      - items:
+          - enum:
+              - mediatek,mt8189-jpgdec
       - items:
           - enum:
               - mediatek,mt7623-jpgdec
-              - mediatek,mt8188-jpgdec
           - const: mediatek,mt2701-jpgdec
+      - items:
+          - enum:
+              - mediatek,mt8188-jpgdec
+          - const: mediatek,mt8189-jpgdec
 
   reg:
     maxItems: 1
@@ -32,13 +38,16 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 1
     maxItems: 2
-    minItems: 2
 
   clock-names:
-    items:
-      - const: jpgdec-smi
-      - const: jpgdec
+    minItems: 1
+    maxItems: 2
+
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: a phandle to the smi_larb node.
 
   power-domains:
     maxItems: 1
@@ -51,6 +60,35 @@ properties:
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
       Ports are according to the HW.
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt2701-jpgdec
+              - mediatek,mt8173-jpgdec
+
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: jpgdec-smi
+            - const: jpgdec
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8189-jpgdec
+
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: jpgdec
+
 required:
   - compatible
   - reg
-- 
2.45.2


