Return-Path: <linux-media+bounces-24553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 478C2A084C2
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 02:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 638533A8BE2
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 01:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A95731C5F37;
	Fri, 10 Jan 2025 01:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="g1ZghWJH"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9147D6EB7D;
	Fri, 10 Jan 2025 01:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736472482; cv=none; b=QcJEmJspjILM/7d2T8Ur98D9ENdmexGdB1LGYEZcPvM4B3yAdYFB4lUmR2VPJIguNiT47mSj2yCL/qGi/zzRgVPZUHC3sHtovxS3Z0hBZRK9cD8cscO4O5kDYktPzVD6Oo5gP7TdfYAtRC9v+3qnWGmVjr3eoCEw+KxT+hKN2eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736472482; c=relaxed/simple;
	bh=HnKLoCqjcBGXT6XLyxoUqpfJDEjIS2DzPuw62/qZQYA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fEn79ahufmAbiWurRKNPklPgDqFLv1JN5iiEpbPPUeL2S2vZijLpMjhuCSs9ygjtyQVbeQ4ZS/zD3aLFCG87Jym+wtXdyTK1bdnF/7j44qVd85UoJp0oECqP6CkZyqTGk5kqcamdTIiTTOzxAhK4u9GstzkzjljMtMlBrL8rn3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=g1ZghWJH; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1e3914becef211ef99858b75a2457dd9-20250110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6aiosGM/Jx8tp2Lbvpfk5lrngpwFhb4lMnj7UTJX0G8=;
	b=g1ZghWJHzHlAH8b3dJ0j2Cy3AXCZg20ZRlnxd53kuKycWlRt+ZMtv6PDk5xqjwLMDlxK0Z7ucVTDZfrMmMJrTXpxqGe+HBVKwJDqrvtH5mYksUlvAAta5QVNb0iDC7tQzxlddllXWDNCB2sO6PYbnJSXSpUNjDE8RKJTXzAYmAE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:983b63a8-f423-4991-9575-ea58327a8f21,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:60aa074,CLOUDID:56cda637-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 1e3914becef211ef99858b75a2457dd9-20250110
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1838062169; Fri, 10 Jan 2025 09:27:55 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 09:27:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 09:27:53 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	kyrie.wu <kyrie.wu@mediatek.com>
Subject: [RESEND,V1,02/12] dt-bindings: mediatek: Add mediatek, mt8196-jpgenc compatible
Date: Fri, 10 Jan 2025 09:27:39 +0800
Message-ID: <20250110012749.30072-3-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250110012749.30072-1-kyrie.wu@mediatek.com>
References: <20250110012749.30072-1-kyrie.wu@mediatek.com>
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


