Return-Path: <linux-media+bounces-48673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5505ECB795A
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 02:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 789DC3005D10
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 01:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A7A2749E6;
	Fri, 12 Dec 2025 01:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PjAJxWk5"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3C42264DC;
	Fri, 12 Dec 2025 01:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765504539; cv=none; b=Q1kdp3Nl8j8ZnFZK7Hsgk5HCAv9FLFtLtHNFT0mmErFhShOp1OpyXIWp9Qxt5bVDLYOL7sfaEwxndjwv5Tsyi7wyQ4x3ogTpZxyTLZfwTMEiLW8bYoNJuFY7n9Zt/Zs2mtcwUe50k5pD6iyoGZ+RsUeK/UNYuzKnbXBF6JOaH3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765504539; c=relaxed/simple;
	bh=d6H3JFzokyuqppIpDbc8+H+Ubi1SPEQ0S2yoOQLdQoM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gygc5jA3+8xvQXzuoCJjgb4dvHUf2kHMXlLuKDISL95xgvq1kwkfoHyD53n/cBFLbKFYsI+A7tiMzcAFiBgZR8I8FwWpmIJ9zxOHi9v2y0OA0+KuWrFSYyjDI7VwQT9R95aj8UZky7NwIBeM/IhGQB/+KGVLrd32pGrw863S9pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=PjAJxWk5; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a3ede904d6fd11f0b2bf0b349165d6e0-20251212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vn1+uxQ75dbbmV2dRI5/x9CSVqd+ehRMgd9rT1S4f14=;
	b=PjAJxWk5Q97XPV7R9JTVr3GJX+s6td1y63FGA4QiUIdqg4hXDyMbESuibl2jz6IDULXoMfB+f/GsqZxp6ab+Kj+D8wZv0sKchlhPVNb7Homv8/XLRPaXpq9mT7TOgOzJDjLuBqnYavSVvRRfBGj1pzlsHxkZq8xcAy5qCEDQw7g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:1aa530af-6a9b-4e44-8b5d-a38712ae51f2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:876159c6-8a73-4871-aac2-7b886d064f36,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a3ede904d6fd11f0b2bf0b349165d6e0-20251212
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 95134555; Fri, 12 Dec 2025 09:55:31 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 12 Dec 2025 09:55:30 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 12 Dec 2025 09:55:29 +0800
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
Subject: [PATCH 1/4] arm64: dts: mt8188: update JPEG encoder/decoder compatible
Date: Fri, 12 Dec 2025 09:52:15 +0800
Message-ID: <20251212015218.4689-2-jianhua.lin@mediatek.com>
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

The MT8188 JPEG encoder and decoder shares the same architecture
and features as the MT8189 JPEG encoder and decoder.
This improvement enables the MT8188 JPEG encoder and decoder to
support a 34-bit iova address-space.
Therefore, update "mediatek,mtk-jpgenc" to "mediatek,mt8189-jpgenc",
update "mediatek,mt2701-jpgdec" to "mediatek,mt8189-jpgdec".

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 90c388f1890f..ff9a774f5911 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2846,7 +2846,7 @@ video_encoder: video-encoder@1a020000 {
 		};
 
 		jpeg_encoder: jpeg-encoder@1a030000 {
-			compatible = "mediatek,mt8188-jpgenc", "mediatek,mtk-jpgenc";
+			compatible = "mediatek,mt8188-jpgenc", "mediatek,mt8189-jpgenc";
 			reg = <0 0x1a030000 0 0x10000>;
 			clocks = <&vencsys CLK_VENC1_JPGENC>;
 			clock-names = "jpgenc";
@@ -2859,11 +2859,10 @@ jpeg_encoder: jpeg-encoder@1a030000 {
 		};
 
 		jpeg_decoder: jpeg-decoder@1a040000 {
-			compatible = "mediatek,mt8188-jpgdec", "mediatek,mt2701-jpgdec";
+			compatible = "mediatek,mt8188-jpgdec", "mediatek,mt8189-jpgdec";
 			reg = <0 0x1a040000 0 0x10000>;
-			clocks = <&vencsys CLK_VENC1_LARB>,
-				 <&vencsys CLK_VENC1_JPGDEC>;
-			clock-names = "jpgdec-smi", "jpgdec";
+			clocks = <&vencsys CLK_VENC1_JPGDEC>;
+			clock-names = "jpgdec";
 			interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH 0>;
 			iommus = <&vdo_iommu M4U_PORT_L19_JPGDEC_WDMA_0>,
 				 <&vdo_iommu M4U_PORT_L19_JPGDEC_BSDMA_0>,
-- 
2.45.2


