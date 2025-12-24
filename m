Return-Path: <linux-media+bounces-49435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 879F7CDB3CC
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 04:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6E7E3024E5C
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 03:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB9430F7FD;
	Wed, 24 Dec 2025 03:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Z5MS1C76"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2F722A4D8;
	Wed, 24 Dec 2025 03:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766546278; cv=none; b=DVPmCCHO+cTFusoOiekm7MwkpKjBrVjm8ooj8rUml+OIZaP8pykk3svxlHjdC6TjE+8YETw8Lb1ehzaI/WgKNuDUGGiXL7Ry3j4E2VN40eKusf+DHfVytb+vN9Ec/P+SVuXf2VZWGt9XLOVBfI0vW5/gugdZuM0EiJ8Y4f8TpEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766546278; c=relaxed/simple;
	bh=ZtWGLGkmOi7UqWql8rQSiZ7XHZ1PJIPzj/K8Sy/tBvE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g0AvwCXlCTpYlhvUp9Dtl9vh+WfGp2xhQLwstgTl5Owa+EtL3bNRi3GV5vKsp3Sn4OLmiiY6TQmhn6s3gQ5+Ntk0DiFZKSf4AiHdaLDM+sMOhff3QqjLYFkQwJXJ2i6KjNJHa0rwsgeVesMv5e9zZlRjCcHNX6HhdBR2jbASNf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Z5MS1C76; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1e0cbfdae07711f08a742f2735aaa5e5-20251224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NiZxc43IjHBA+/wzLD458ncrHI4s1rgsJ+lbgDIgSAE=;
	b=Z5MS1C76NWCkF79p8xWHdTrknhmgBXhNSWYUxQ7SF/XywUE818p9UF+Ud8Yc7JzupX6Dpuoc9OwvdW4+zNh/IQ53sMGnGQRr0Zr4xes4zwURFCz4qiRu5CZPCAhP4XNshfwj42gaqMp/YjiKML1fmQsGjqoMbLoDNID1eMtYLow=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:6a165091-3850-44cc-911e-df0db6d3b648,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:adc01b03-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1e0cbfdae07711f08a742f2735aaa5e5-20251224
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1137724256; Wed, 24 Dec 2025 11:17:45 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 11:17:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 24 Dec 2025 11:17:43 +0800
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
Subject: [PATCH v2 1/4] arm64: dts: mt8188: update JPEG encoder/decoder compatible
Date: Wed, 24 Dec 2025 11:17:18 +0800
Message-ID: <20251224031721.9942-2-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251224031721.9942-1-jianhua.lin@mediatek.com>
References: <20251224031721.9942-1-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The JPEG encoder and decoder of MT8188 share the same architecture
and features as those of MT8189, both use a 34-bit iova
address-space (16GB) and a single clock configuration.

Previously, MT8188 was incorrectly defined alongside SoCs with 32-bit
iova address-space (4GB), such as "mediatek,mt2701-jpgdec" and
"mediatek,mtk-jpgenc". This mismatch results in an ABI break,
as MT8188 cannot function correctly under the 32-bit iova
address-space (4GB) configuration.

Therefore, MT8188 needs to inherit from MT8189.
Update "mediatek,mtk-jpgenc" to "mediatek,mt8189-jpgenc",
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


