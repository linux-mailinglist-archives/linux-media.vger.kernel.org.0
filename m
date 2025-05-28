Return-Path: <linux-media+bounces-33495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D767FAC620A
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 08:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F29D9E744E
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 06:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5D8246769;
	Wed, 28 May 2025 06:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cxiNx2TT"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781D1243364;
	Wed, 28 May 2025 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748414215; cv=none; b=TayqK6BfAeCf66QAAGfXNOj5qrRCTPnW/H8blxoX88tpKDs6bBCO1rVs4wG8w1fz2+sb1mD18D0fOxv78WFlAo2SGu3gwrBJSHnoopcLqtjyxoyL/3Z0AbO/cMrB/9z625fA+lt6zZ5p95x8zPjbkHlhXyOGGAC1xekgSmFliMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748414215; c=relaxed/simple;
	bh=xlwCThLAP2eOGW4RL4vnd1ykVmVFgBc2MN7o0xmVnKw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pThsI3MkJEWZf8SXDrKtwvnvR9zKPdmjpqf2hH395tEDY/LbAeCOppkCKx0dYA0IeK2rETtpvdj61kRCFpoz/IaHnF3wqU0M6WHdepai9spDXcpEJATkAf8guK4fv0jijpt9l8o9S89sMenMUpv/2OYaNrGTsb61blv8a3p80JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=cxiNx2TT; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 20c8f5ba3b8e11f082f7f7ac98dee637-20250528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PPgLQxbZMPX+YEJqn6qREiV9HQdeWS+Rmggk937j+b8=;
	b=cxiNx2TTv0ehx26NZzPhEdwzA3RFMkcQqtj8YVtdK/kIdkPRsLvyswt+eAWxoViyTAr2QiqnFzSaRTVjNUSQpqp5HAszeWuV9O7NeWbwtKszqo7tn9Wss+XqswjkbnFywwc7rZATZcocJJEbFKos9oyJDs07mHXKwOpVc/zj6W4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b83ad55c-0e69-455a-bd2d-fb7fa727888a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:57675df1-2ded-45ed-94e2-b3e9fa87100d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 20c8f5ba3b8e11f082f7f7ac98dee637-20250528
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 38019597; Wed, 28 May 2025 14:36:46 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 28 May 2025 14:36:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 28 May 2025 14:36:44 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	Longfei Wang <longfei.wang@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
Subject: [PATCH v2 5/6] dt-bindings: media: mediatek: encoder: Add encoder dt-bindings for MT8196
Date: Wed, 28 May 2025 14:36:31 +0800
Message-ID: <20250528063633.14054-6-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250528063633.14054-1-irui.wang@mediatek.com>
References: <20250528063633.14054-1-irui.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Add MT8196 encoder compatible string, which will reference VCP device.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../bindings/media/mediatek,vcodec-encoder.yaml      | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index ebc615584f92..7675391d7eb0 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -24,6 +24,7 @@ properties:
               - mediatek,mt8188-vcodec-enc
               - mediatek,mt8192-vcodec-enc
               - mediatek,mt8195-vcodec-enc
+              - mediatek,mt8196-vcodec-enc
       - items:
           - const: mediatek,mt8186-vcodec-enc
           - const: mediatek,mt8183-vcodec-enc
@@ -76,6 +77,17 @@ required:
   - iommus
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8196-vcodec-enc
+
+    then:
+      required:
+        - mediatek,vcp
+
   - if:
       properties:
         compatible:
-- 
2.45.2


