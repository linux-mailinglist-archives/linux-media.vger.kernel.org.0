Return-Path: <linux-media+bounces-4124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42075839E08
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 02:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12B4E1C223F6
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 01:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3B02914;
	Wed, 24 Jan 2024 01:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BqkZWoS6"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C0B10F2;
	Wed, 24 Jan 2024 01:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706058912; cv=none; b=HJq2mhZOAxCN2zUSn6zoPNxj5icRyRdVS2QaW54dteFE8M3oNalFaKSZa4UUtEPuJLzWexw538T5xnzTFvOLKTG9/hSo6ev61WAWrhiH/GF/v+88sOv6DbEz61vfh8WJ/n+gbD/uTsCAbQguuR2dSbHCELsFq3+Iv8MJim+8DbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706058912; c=relaxed/simple;
	bh=lK0EKJdNbCtyvc+pE5i4hq+kv4Koy12TCfdhluUxKQU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SQIPBhC0CNEy5Z22ye/Rijp0a17mdb3EcwGbg5xGj2ZBXe1mqMXLht9xJmX11uYhDPXp/xkdvHiboRauhx/RaqBVhM0qfiSMjyCYgrCXvk2WDB4V4bhxz1IfqPJfv0wO6HpOD4aDRPt/8/9nFc8LiZsIOnfZSVWNB5ipxncne3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=BqkZWoS6; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ffa68a2eba5511ee9e680517dc993faa-20240124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=V1GLezVzlI0B4Ea93s4uw+zU0Rzwjn1x+KJdcWtXBeY=;
	b=BqkZWoS6WDw1+tsxpKMdNAAP+5fBx68eoqR6kc7p2Orh1ThQrhPDxn+7ehmlnCqxDjCuKJWQJ6NwMIzQrHsNgsMMuve2O0P1pTYG2yfnzGzOT420RvTcRK6nliDHn7+BjGsPSrFyW8IDc7PYPDBhGwLzc8aIC9cWCBU8PnzuIww=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:aff49dbc-0c86-4513-bd4d-d8c69fd7cad7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6e16cf4,CLOUDID:11422e83-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ffa68a2eba5511ee9e680517dc993faa-20240124
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 561397659; Wed, 24 Jan 2024 09:15:01 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 24 Jan 2024 09:15:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 24 Jan 2024 09:15:00 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Fei Shao
	<fshao@chromium.org>
Subject: [PATCH v4 2/3] dt-bindings: media: mediatek: mdp: Change mediatek,gce-events to reference
Date: Wed, 24 Jan 2024 09:14:58 +0800
Message-ID: <20240124011459.12204-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
References: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

Change mediatek,gce-events property to reference mediatek,gce-props.yaml
instead of defining itself.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/media/mediatek,mdp3-rdma.yaml           | 11 +++--------
 .../devicetree/bindings/media/mediatek,mdp3-rsz.yaml | 12 ++++--------
 .../bindings/media/mediatek,mdp3-wrot.yaml           | 12 ++++--------
 3 files changed, 11 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
index 59db8306485b..4a286d46c8ee 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
@@ -44,13 +44,6 @@ properties:
       4 arguments defined in this property. Each GCE subsys id is mapping to
       a client defined in the header include/dt-bindings/gce/<chip>-gce.h.
 
-  mediatek,gce-events:
-    description:
-      The event id which is mapping to the specific hardware event signal
-      to gce. The event id is defined in the gce header
-      include/dt-bindings/gce/<chip>-gce.h of each chips.
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-
   mediatek,scp:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -96,6 +89,8 @@ required:
   - '#dma-cells'
 
 allOf:
+  - $ref: /schemas/mailbox/mediatek,gce-props.yaml
+
   - if:
       properties:
         compatible:
@@ -142,7 +137,7 @@ allOf:
         clocks:
           maxItems: 1
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
index f5676bec4326..4774fdde1a1b 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
@@ -38,13 +38,6 @@ properties:
       4 arguments defined in this property. Each GCE subsys id is mapping to
       a client defined in the header include/dt-bindings/gce/<chip>-gce.h.
 
-  mediatek,gce-events:
-    description:
-      The event id which is mapping to the specific hardware event signal
-      to gce. The event id is defined in the gce header
-      include/dt-bindings/gce/<chip>-gce.h of each chips.
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-
   clocks:
     minItems: 1
 
@@ -55,7 +48,10 @@ required:
   - mediatek,gce-events
   - clocks
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/mailbox/mediatek,gce-props.yaml
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
index 53a679338402..a31f3f5aea96 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
@@ -38,13 +38,6 @@ properties:
       4 arguments defined in this property. Each GCE subsys id is mapping to
       a client defined in the header include/dt-bindings/gce/<chip>-gce.h.
 
-  mediatek,gce-events:
-    description:
-      The event id which is mapping to the specific hardware event signal
-      to gce. The event id is defined in the gce header
-      include/dt-bindings/gce/<chip>-gce.h of each chips.
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-
   power-domains:
     maxItems: 1
 
@@ -67,7 +60,10 @@ required:
   - iommus
   - '#dma-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/mailbox/mediatek,gce-props.yaml
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.18.0


