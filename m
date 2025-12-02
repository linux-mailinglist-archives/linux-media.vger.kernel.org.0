Return-Path: <linux-media+bounces-48021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DD256C9A7FE
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C7B524E2CCC
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B7E30217F;
	Tue,  2 Dec 2025 07:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qBDx9+mR"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF192FF176;
	Tue,  2 Dec 2025 07:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661256; cv=none; b=NHS0Lc3us9d/TtqKKZlKC72TUeu62vpOPH+420pOvBBHh1oLhxf3JEzusOP8gQEmc8tO3GKWGfyfjalfL/AQduwKrdfdmXbXeN9bZxPDXQLlOeANJTJMsxidrFCWXSk804sRXp+prSvvz4gmtEdehi2PcWws5uhyixNfQ7soHdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661256; c=relaxed/simple;
	bh=s+fYGnA08QTeIzgiSM2+Kw5/k+uUaAOCCoUBmKF+exg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fIx80207+6dnVYRdR2FLH1BNduKgrgnMffajDfQHfAvCOXs8FRjnluB/a8UiDwPbefbEtfInvSTiJgO2njJTtRFO/MCZ/zCbxwODKYFwgDsxXnFCFVR7CVQ7+3quZBTBDKnWLi4uOiV3oy8X8PjOJ772Z9UFpcZAHd6Nz5II5U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=qBDx9+mR; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 35fdfd24cf5211f0b2bf0b349165d6e0-20251202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mDYeX9hnxM609HsQNMFBzZYeMea5lku9+jD+ltF6O3E=;
	b=qBDx9+mRgjdkS4H7macoW7Bg2iZu42uYIr+3wYBMXhemHfCNzQGwion65yDHDoroZ5rBSP++G3E1VjeAP9tVQZ0cwhMGZG5ZlRFwaWfjGR7we0kRhOxVu2jjWkHM8Gv2p+CUToklU+xHT2Ld3hGHOuUpyk258FsBzLSu8tV4K74=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:7997289f-4357-4add-9b9c-1c0f9338a2a6,IP:0,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:41bfbaa9-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 35fdfd24cf5211f0b2bf0b349165d6e0-20251202
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1126577580; Tue, 02 Dec 2025 15:40:44 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 2 Dec 2025 15:40:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 2 Dec 2025 15:40:42 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Subject: [PATCH v6 01/10] dt-bindings: media: mediatek: decoder: Add MT8189 mediatek,vcodec-decoder
Date: Tue, 2 Dec 2025 15:40:28 +0800
Message-ID: <20251202074038.3173-2-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251202074038.3173-1-kyrie.wu@mediatek.com>
References: <20251202074038.3173-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Add compatible for video decoder on MT8189 platform. Compared with
former ICs, the MT8189 decoder use iommu to instead of smmu, and
use scp architecture, the frequency is only 406MHZ, and cannot reach
more than 700MHZ. It used only one clock. At the same time, the decoder
supports the vp9 decoding protocol for the first time in single IC.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/mediatek,vcodec-subdev-decoder.yaml       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index 74e1d88d3056..ee2bbbdb2d50 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -75,6 +75,7 @@ properties:
       - mediatek,mt8192-vcodec-dec
       - mediatek,mt8186-vcodec-dec
       - mediatek,mt8188-vcodec-dec
+      - mediatek,mt8189-vcodec-dec
       - mediatek,mt8195-vcodec-dec
       - mediatek,mt8196-vcodec-dec
 
@@ -132,11 +133,11 @@ patternProperties:
           Refer to bindings/iommu/mediatek,iommu.yaml.
 
       clocks:
-        minItems: 4
+        minItems: 1
         maxItems: 5
 
       clock-names:
-        minItems: 4
+        minItems: 1
         maxItems: 5
 
       assigned-clocks:
-- 
2.45.2


