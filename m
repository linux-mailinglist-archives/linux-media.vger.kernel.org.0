Return-Path: <linux-media+bounces-24519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 250B5A077AD
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 14:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1C193A9129
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 13:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97C121B8F6;
	Thu,  9 Jan 2025 13:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HlTtYUCT"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF344219A75;
	Thu,  9 Jan 2025 13:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429742; cv=none; b=bu8JS2bCJer3LlG7rYxO+qwTDT2br7ZPZPpls7CjyM74VdTnM7ZgysEaAIMRVwWKj8OrSuFtTH/Jx/z3g2q1yL7S5ZCc93xj06abE/WtEJOo2Ad5X6Bl+/IBVgcBIXioQXWNXonQ/m0Ghu5N3zyv16g+f8WfVsfB/06Bl0Lhhb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429742; c=relaxed/simple;
	bh=Uv3BOkq86ivdElOv1FmEJLIj/DyQHv0O6rzw4VN+2rg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J51cms0YtcVGZUbHfq4chGxE0Q0VccGk0aE0apOXSQQepldl6NGmwsAN2LV/5jm1y2MR3++q6fZzW5PS7Oq69uFFF1Odf/itsNeVVdU7rgqqoEnAz2mfmlysu5Qk40aDx32T69LOXAbZ6LS5v7oONq+EzWEdOO/qGp3T08yMsgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=HlTtYUCT; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9562fe74ce8e11efbd192953cf12861f-20250109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lrzYIFyifCtbZHsUemOiQJoI7KnUjzZR1eb6xjeltfw=;
	b=HlTtYUCTahFj15cR8wSx1y7PuHkzJMY6/vHgrwtRTD7BoM4/4Fq/3hCPOG2ovt+m19ohlvw6auwsIE0kzJzqPvO/aI2qquCZrzWKyB+kSjzd3dxg/ueC+wgXKUrvK5wvwn3bnQV5qQVbpb80CHxIpo41qLFTWW5ucCbdwcJtsDU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:53d8690c-98ec-448e-a9a9-07ecb9dc67b8,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:60aa074,CLOUDID:3496f5d1-15ca-4d8b-940c-bbea7162947b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 9562fe74ce8e11efbd192953cf12861f-20250109
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 825744239; Thu, 09 Jan 2025 21:35:25 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 9 Jan 2025 21:35:24 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 9 Jan 2025 21:35:23 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, kyrie.wu <kyrie.wu@mediatek.com>
Subject: [V1,01/12] dt-bindings: mediatek: Add mediatek, mt8196-jpgdec compatible
Date: Thu, 9 Jan 2025 21:35:01 +0800
Message-ID: <20250109133513.20151-2-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250109133513.20151-1-kyrie.wu@mediatek.com>
References: <20250109133513.20151-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Add mediatek,mt8196-jpgdec compatible to binding document.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 ...5-jpegdec.yaml => mediatek,multi-core-jpegdec.yaml} | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/media/{mediatek,mt8195-jpegdec.yaml => mediatek,multi-core-jpegdec.yaml} (95%)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,multi-core-jpegdec.yaml
similarity index 95%
rename from Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
rename to Documentation/devicetree/bindings/media/mediatek,multi-core-jpegdec.yaml
index e5448c60e3eb..5ec98ddad506 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,multi-core-jpegdec.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
+$id: http://devicetree.org/schemas/media/mediatek,multi-core-jpegdec.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek JPEG Decoder
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: mediatek,mt8195-jpgdec
+    enum:
+      - mediatek,mt8195-jpgdec
+      - mediatek,mt8196-jpgdec
 
   power-domains:
     maxItems: 1
@@ -44,7 +46,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: mediatek,mt8195-jpgdec-hw
+        enum:
+          - mediatek,mt8195-jpgdec-hw
+          - mediatek,mt8196-jpgdec-hw
 
       reg:
         maxItems: 1
-- 
2.46.0


