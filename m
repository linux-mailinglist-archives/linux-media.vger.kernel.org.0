Return-Path: <linux-media+bounces-24054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0428A9FC453
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 10:01:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C20DD16175A
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 09:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC2E1714B7;
	Wed, 25 Dec 2024 09:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Fymu8Zdv"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEC3139E;
	Wed, 25 Dec 2024 09:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735117292; cv=none; b=FYUMniWYImXgmgWmsX6yD/UIpJ3c9fZ6s9is8hpvJCZTYAZ4nkh7XRNm+eTGu3A/hBupFTQNaCE8xAEEeUvbx28hp5FEO6b2SCBq8Vt3FjdUfSql+iHKAck6xQ1gU4rIp+F5/JMlrkcqRCJb8L9xq8e1j+mDRf6+p2DZM3d8ifE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735117292; c=relaxed/simple;
	bh=t5Pqo4KCetD1n71iU557+0BwL7RfnGVjwY/y4YCzvYU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gamb0ooQMnueXtsZPL07Ax4a8EpBgjL+hQOvFp7kP69e3LWPlEbfMFoSKtFRUTKiI8W/CRnCk85TgycY5nR2yMqOa6Zhrqwd9Q7p74t6ho5DbAfG4cDE6zQDwsDWaSZu4Y5r1EIj2yjct1a00xCJFq0zMcklbAdpvBczB/dutbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Fymu8Zdv; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: cc34c97ec29e11efbd192953cf12861f-20241225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NIyxzXd5d6ZouA8qCbnBtazDyt0DrETGp9j8R7tiAm4=;
	b=Fymu8Zdvua5KDL+eehPyxiWt5VBTz0YiND4nRyBrEFt2nZWxFqR27lGj+lpAeWOny4Wn1SPe32o1pSDTEkiZYRfqnkikEIuuFkHUHAWJWYwLUcaNSw7Q/loNVnZcsolmtdoB9p7sbNB29dQ0rB08McLuHme+oxBKw97iy705U2k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:e87e0452-3e1d-4679-bce3-28f43fe92ffe,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:fd822b25-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cc34c97ec29e11efbd192953cf12861f-20241225
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <bo.kong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 654261302; Wed, 25 Dec 2024 17:01:15 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Dec 2024 17:01:15 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Dec 2024 17:01:15 +0800
From: bo.kong <bo.kong@mediatek.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>
CC: <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <Bo.Kong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 1/4] arm64: dts: mt8188: add aie node
Date: Wed, 25 Dec 2024 17:00:20 +0800
Message-ID: <20241225090113.17027-2-bo.kong@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241225090113.17027-1-bo.kong@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Bo Kong <Bo.Kong@mediatek.com>

Add aie node and related node.

Signed-off-by: Bo Kong <Bo.Kong@mediatek.com>
---

Changes in v3:
1. Remove dts non-MMIO nodes

Changes in v2:
1. Add AIE node and related node
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index faccc7f16259..d41f5bea3e65 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2270,12 +2270,45 @@ imgsys_wpe1: clock-controller@15220000 {
 			#clock-cells = <1>;
 		};
 
+		aie: aie@15310000 {
+			compatible = "mediatek,mt8188-aie";
+			reg = <0 0x15310000 0 0x1000>;
+			interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,larb = <&larb12>;
+			iommus = <&vpp_iommu M4U_PORT_L12_FDVT_RDA_0>,
+				 <&vpp_iommu M4U_PORT_L12_FDVT_RDB_0>,
+				 <&vpp_iommu M4U_PORT_L12_FDVT_WRA_0>,
+				 <&vpp_iommu M4U_PORT_L12_FDVT_WRB_0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_IPE>;
+			clocks = <&imgsys CLK_IMGSYS_MAIN_IPE>,
+				 <&ipesys CLK_IPE_FDVT>,
+				 <&ipesys CLK_IPE_SMI_LARB12>,
+				 <&ipesys CLK_IPESYS_TOP>;
+			clock-names = "img_ipe",
+				      "ipe_fdvt",
+				      "ipe_smi_larb12",
+				      "ipe_top";
+		};
+
 		ipesys: clock-controller@15330000 {
 			compatible = "mediatek,mt8188-ipesys";
 			reg = <0 0x15330000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb12: larb@15340000 {
+			compatible = "mediatek,mt8188-smi-larb";
+			reg = <0 0x15340000 0 0x1000>;
+			mediatek,larb-id = <SMI_L12_ID>;
+			mediatek,smi = <&vpp_smi_common>;
+			mediatek,smi-sub-comm = <&smi_img1>;
+			mediatek,smi-sub-comm-inport = <0>;
+			clocks = <&imgsys CLK_IMGSYS_MAIN_IPE>,
+				 <&ipesys CLK_IPE_SMI_LARB12>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8188_POWER_DOMAIN_IPE>;
+		};
+
 		imgsys_wpe2: clock-controller@15520000 {
 			compatible = "mediatek,mt8188-imgsys-wpe2";
 			reg = <0 0x15520000 0 0x1000>;
-- 
2.45.2


