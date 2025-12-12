Return-Path: <linux-media+bounces-48674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3635CB7975
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 02:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75AB2304D57D
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 01:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53116270557;
	Fri, 12 Dec 2025 01:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JAKG7Qa/"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891E22749E6;
	Fri, 12 Dec 2025 01:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765504552; cv=none; b=i+H9aQcrUrO3Dn1PNVyt/zLbUqLMDLEvpPjLa+hEbToRZL3JJpBSZrkIPn5CQyPpNcuyejPUOsbM5DP0n2l2Ky6jF8BqUs+/cCT7vHoJzGMmB3siWTfgQaOCbfxqd93zw+xNVLynFEjffYisN8K50cvHw9uULlaPYB+cFlxKJAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765504552; c=relaxed/simple;
	bh=iMAUNnpquENj84/Ef6CTi/nJcEYA8hA00RdwrLfKmR4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KmRdWSAvJ7n3a2qjH/KZPB/qs3tX2EyXgms2fQ7pe+aCCq+zZoOuRLEKnYTRUNvy9ur06CTCP2d6kKXQbnGUhhJuS+djNEOjLwcpsvkgo05DxDknmUfp9jAIHrRyzO3ubZYXi6zwl7mFDU58jhrMmkfGOviL9gKujq9xz/sMFK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=JAKG7Qa/; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ab966dcad6fd11f0b33aeb1e7f16c2b6-20251212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oF16yjec0U2hPWO234TiLbnbeacjQRJiyg4yfuPwCmk=;
	b=JAKG7Qa/dwisk5SURwRqDWSrhYi8ypeUXKy3KPp/+GGrKb6v+XI5yhiHT8XXS8DMHtq/QHDCe3ReuJr+knHVKNUYswdcGkoc3A0Euj5TB85V7eSWibyF3K8ysiOXxHP/BB8JZbhxBX9pEO3gGK2SHJOaq6cKIPzjylMXKzOo8Nw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:15629e06-1144-4757-b233-d066e972ab2d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:8cf419aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab966dcad6fd11f0b33aeb1e7f16c2b6-20251212
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1724738794; Fri, 12 Dec 2025 09:55:44 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 12 Dec 2025 09:55:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 12 Dec 2025 09:55:42 +0800
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
Subject: [PATCH 2/4] dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible string
Date: Fri, 12 Dec 2025 09:52:16 +0800
Message-ID: <20251212015218.4689-3-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251212015218.4689-1-jianhua.lin@mediatek.com>
References: <20251212015218.4689-1-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Compared to the previous generation IC, the MT8189 uses 34-bit
iova address-space. Therefore, add "mediatek,mt8189-jpgdec"
compatible to the binding document.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 .../bindings/media/mediatek-jpeg-decoder.yaml | 46 +++++++++++++++++--
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
index a4aacd3eb189..935a908465c8 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -19,11 +19,15 @@ properties:
           - enum:
               - mediatek,mt8173-jpgdec
               - mediatek,mt2701-jpgdec
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
@@ -32,13 +36,16 @@ properties:
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
@@ -51,6 +58,35 @@ properties:
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
       Ports are according to the HW.
 
+allOf:
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
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8173-jpgdec
+              - mediatek,mt2701-jpgdec
+
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: jpgdec-smi
+            - const: jpgdec
+
 required:
   - compatible
   - reg
-- 
2.45.2


