Return-Path: <linux-media+bounces-39886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 650C8B25FF4
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 11:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C88F73B0CBD
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 09:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9C92FA0C7;
	Thu, 14 Aug 2025 08:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uBIKVPLO"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190FB2ED145;
	Thu, 14 Aug 2025 08:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161824; cv=none; b=YN1L7omi8h0HZNYrnqHkmwI/wkkIHOqEz3zM2JsWcUc/hXIiGy5z6Vz3S5BgOEE5////eBzJzrfCOVl1gCsPmc9snWcAPgyiQXbPQZ3QrEDDyPkcEEv4DP3vstu8XEMNbN7Cb6D1GW50RAv9z/AsEBPhUgq+TzasTS9PLyzM0PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161824; c=relaxed/simple;
	bh=JCTlREKyNXwdQLadt3n8fORdC/gDF8tU9q7h9z4W7lU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i6sEc0T5av/IVyvAMVqrD20py7f18zeiRJG+m17R3zylegoXog9zt4BgVqvRHed+/plgbPKtKWg9DvF3g018aHPzks3P77uODo/Ge63eWGihCVhvrTzGtNiLlZOPftgXYolESIk3r9dTuQbL/MEQW43oOlASFarv69ZTPwpvLx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=uBIKVPLO; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a134b82478ec11f08729452bf625a8b4-20250814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zyU1/gM/4DdNITtAZs6eAmEy7lTt65l2krk5mmdGuas=;
	b=uBIKVPLOs54WKrZztzWZ+5ogvv4kGBMnv3fHjmv3YQzpFgtkRxSHEgFHO7/iJo7xlG7n4u2x4puDFV35o7xtursofWnJCK3W5ELdEr1l+odT6DWq2/XlQpA6GQUik+QubHavnbqJ6NL3UNFN5JzgLS8+tpmui5wfjqx+X0/Gvx0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:9bafa670-c566-4ae4-9a6a-438774927eef,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:30a3edf3-66cd-4ff9-9728-6a6f64661009,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a134b82478ec11f08729452bf625a8b4-20250814
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 378272689; Thu, 14 Aug 2025 16:56:56 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 14 Aug 2025 16:56:53 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 14 Aug 2025 16:56:53 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>
Subject: [PATCH v3 5/6] dt-bindings: media: Add MT8196 mediatek,vcodec-encoder
Date: Thu, 14 Aug 2025 16:56:41 +0800
Message-ID: <20250814085642.17343-6-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250814085642.17343-1-kyrie.wu@mediatek.com>
References: <20250814085642.17343-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Irui Wang <irui.wang@mediatek.com>

Add MT8196 encoder compatible string, which will reference VCP device.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../bindings/media/mediatek,vcodec-encoder.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index ebc615584f92..bb4dbf23ccc5 100644
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
@@ -58,6 +59,11 @@ properties:
     description:
       Describes point to scp.
 
+  mediatek,vcp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Describes point to vcp.
+
   power-domains:
     maxItems: 1
 
@@ -76,6 +82,17 @@ required:
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
2.46.0


