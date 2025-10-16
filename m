Return-Path: <linux-media+bounces-44678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7083FBE1A98
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 08:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C50219C74CA
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 06:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751A727B4E1;
	Thu, 16 Oct 2025 06:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="d9oDm6OR"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC95242D70;
	Thu, 16 Oct 2025 06:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760594905; cv=none; b=ZhQdvJ7CGVerqgA9lEnV3qo9ASBVCR+zj5+pCQQ9fg08Eva61faPHNfZTMqzG+TFSlqdU+LfbQEjKZNM6tEU70lvCty1nwunvWPdCsrJXRz/2JXqozzeUeJeQL8UWR2ik5pkY/Tbh3jyiZeri/uoTFx1P/wyVyFTuEIdq+1bWcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760594905; c=relaxed/simple;
	bh=uBAPD0r48okEw2Y5txdfAVkz53JrPObIETlGRNFSrYY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R/YFJre4z/mHvvIFKpAM61Npf1xMWopC3VM6jYR9M2mqGLBnp7jiwOYrf7AcQ0CpFX1iIcC57kwLVzhbn0YffkNRxinp9p0idOVkF+hUmz+AvNFqJKaUPDl7Xd/EhseqbrVJgYdy+LvZcIJ4wYkWXMFT4zjdEcUwoGivQGR8ekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=d9oDm6OR; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7e555106aa5611f0b33aeb1e7f16c2b6-20251016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qZPJA+GKSfS6A3u4jgkqnZAkiPeOjVCRngtZ24Z+P+I=;
	b=d9oDm6ORssSS6J24WWc8CRUw+s15q+qL67R+a+3kuI9WSSnAkQy3qiPUrr9epBZjPes5u7gzhSkKUe1JEPv2i8SxR8Ukp7z1F6db/Md9XwvVb4KAkTr0aQWKtZG95BA8/LvQe8USIZC7fjngBWSlks3LH0B0XlvgBGPLwdGZrh8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:6e7c7fc3-daf9-4757-b8ad-238128fe9649,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:82ad7202-eaf8-4c8c-94de-0bc39887e077,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7e555106aa5611f0b33aeb1e7f16c2b6-20251016
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1849091306; Thu, 16 Oct 2025 14:08:11 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 16 Oct 2025 14:08:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Thu, 16 Oct 2025 14:08:08 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 7/8] dt-bindings: media: Add MT8189 mediatek,vcodec-encoder
Date: Thu, 16 Oct 2025 14:07:45 +0800
Message-ID: <20251016060747.20648-8-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251016060747.20648-1-kyrie.wu@mediatek.com>
References: <20251016060747.20648-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Add MT8189 encoder compatible string to distinguish former ICs
MTK's. Compared with MT8196, the maximum resolution of MT8189
encoder is only 4K, and the fps is only 30, which cannot reach
the highest parameter of MT8196: level6.2, 8K@60fps.
Compared with MT8188, the level can only support 5.1, which is less
than 5.2 of MT8188. But the maximum bitrate is 100Mbps, which is twice
that of MT8188. And MT8189 could support NBM mode.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index bb4dbf23ccc5..7f355470b63c 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -22,6 +22,7 @@ properties:
               - mediatek,mt8173-vcodec-enc
               - mediatek,mt8183-vcodec-enc
               - mediatek,mt8188-vcodec-enc
+              - mediatek,mt8189-vcodec-enc
               - mediatek,mt8192-vcodec-enc
               - mediatek,mt8195-vcodec-enc
               - mediatek,mt8196-vcodec-enc
@@ -100,6 +101,7 @@ allOf:
             enum:
               - mediatek,mt8183-vcodec-enc
               - mediatek,mt8188-vcodec-enc
+              - mediatek,mt8189-vcodec-enc
               - mediatek,mt8192-vcodec-enc
               - mediatek,mt8195-vcodec-enc
 
-- 
2.45.2


