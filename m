Return-Path: <linux-media+bounces-24516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8112BA07794
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 14:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FE85160F36
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 13:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68B921A424;
	Thu,  9 Jan 2025 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SD74bni0"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB42E218E9E;
	Thu,  9 Jan 2025 13:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429740; cv=none; b=qMc8UMgFlQN4QILLt5QYstijI9dQRtVRCSrhoRhYsq6If7A7LS0TtqfFYRc9xaQoR3BccwoV5W+fv46HidMRAMmOwi6yfl/6qd7UjWL8CsxgEam1v7jt8xjnv5zNzj4DasJJd0IVTScQ1htB3Sk6w0BH2ADRTjpyCvor0W7p5nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429740; c=relaxed/simple;
	bh=HnKLoCqjcBGXT6XLyxoUqpfJDEjIS2DzPuw62/qZQYA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GkD3H9usITcxRcXz8RQMqWkYl+f56Yir1HmnNQlSy+ZMoH4VnKEXKXEuJU22pWHElKXTn6YQXpYaEXbPpHRYBcjf6hwSrgrjeGwDedpJJdP2H0LEp5dYrChlrJeuk+ioVaudQVgSL/tUr73Rc8KRgjVgEX+MIVlBJvmChQb08AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=SD74bni0; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 95fa9dbace8e11efbd192953cf12861f-20250109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6aiosGM/Jx8tp2Lbvpfk5lrngpwFhb4lMnj7UTJX0G8=;
	b=SD74bni0K46vdf8iN66Z8xQKp9wV2MZZJNVhq1gXUoMGK0whY9vlBOW1rpHzYHAqtqIZypJ4owa3vLBxX+26UnwvYLEWCVJBd39GNpSoALXzNpwIH3zer5PeY1pkP5rR08yHxpVmnCLxs2sSQo9BEw20MNBUqLkKJ65BVUeMGG8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:cb315a95-efb9-4aa7-9992-a9f8c03481a6,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:60aa074,CLOUDID:3596f5d1-15ca-4d8b-940c-bbea7162947b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 95fa9dbace8e11efbd192953cf12861f-20250109
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1600973999; Thu, 09 Jan 2025 21:35:26 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 9 Jan 2025 21:35:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 9 Jan 2025 21:35:24 +0800
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
Subject: [V1,02/12] dt-bindings: mediatek: Add mediatek, mt8196-jpgenc compatible
Date: Thu, 9 Jan 2025 21:35:02 +0800
Message-ID: <20250109133513.20151-3-kyrie.wu@mediatek.com>
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

Add mediatek,mt8196-jpgenc compatible to binding document.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 ...5-jpegenc.yaml => mediatek,multi-core-jpegenc.yaml} | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/media/{mediatek,mt8195-jpegenc.yaml => mediatek,multi-core-jpegenc.yaml} (94%)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,multi-core-jpegenc.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
rename to Documentation/devicetree/bindings/media/mediatek,multi-core-jpegenc.yaml
index 596186497b68..5d3f2adf3a3a 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,multi-core-jpegenc.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
+$id: http://devicetree.org/schemas/media/mediatek,multi-core-jpegenc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek JPEG Encoder
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: mediatek,mt8195-jpgenc
+    enum:
+      - mediatek,mt8195-jpgenc
+      - mediatek,mt8196-jpgenc
 
   power-domains:
     maxItems: 1
@@ -44,7 +46,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: mediatek,mt8195-jpgenc-hw
+        enum:
+          - mediatek,mt8195-jpgenc-hw
+          - mediatek,mt8196-jpgenc-hw
 
       reg:
         maxItems: 1
-- 
2.46.0


