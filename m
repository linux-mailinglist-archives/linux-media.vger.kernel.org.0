Return-Path: <linux-media+bounces-29288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A721A79D29
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 09:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 032D917432E
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 07:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE092417D8;
	Thu,  3 Apr 2025 07:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fnI9m/2g"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944FB24061F;
	Thu,  3 Apr 2025 07:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743666019; cv=none; b=B2rFeGSwB7J7K47ZjfelDBNd4Ezvf8C5wx2q54Ntpy6TzmCRfr97hcpPgCBQDqC7NMrs8uEb50DZoicBLRNeCCKtLi1eTiryZrEKTLoZKg4iAP/tpdBWtM8rH0St0uvEg5JIvdwLPq/fKm3h4mQ23FhKt5gY/ZLHEDr85Um74TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743666019; c=relaxed/simple;
	bh=Zp+lED4XMAGo51yGbpjeGaSYJTsRyBDIK6FZtZPAyqQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HTR+3Q6MhWkSInJ9BzveOegYZsiT1eNjq/p+dXwkPjY1JpCqX+2Yiu3J+TLfEKZVD306u/edPTHONiA5lZetJCvGNn0Gi4EXo9stwlno8geeJEkgT2xKQryDXDeGzCC7Snw4cawpYh6v8OYEbKDcm9CQSAGgHrzw9GxCXPqXS20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=fnI9m/2g; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: dedd638e105e11f0aae1fd9735fae912-20250403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+jeXEcVs1W9fNf4p4JHwGukyDUXKxMmPPhb4qarKAQ8=;
	b=fnI9m/2gQpFb4pwQ5JGg/BgQwPCJFhp4IwIyUUcQo2II32LMpaYCNATQLpw7+kizadY4K9l7wy8ydemSV4/jtcHQaU2d7xarl/avv194EM4ixVf61O81A+VHzm5uuvsfQ3nYzvOuRvjJ1WL7IWcophwpaJbjztn6YRxLPQCLdo0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b86875c9-a75b-4bcb-8d05-7cbe54339fac,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:f9d524c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dedd638e105e11f0aae1fd9735fae912-20250403
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <bo.kong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1047789726; Thu, 03 Apr 2025 15:40:10 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 3 Apr 2025 15:40:09 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 3 Apr 2025 15:40:08 +0800
From: bo.kong <bo.kong@mediatek.com>
To: Rob Herring <robh@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, mtk29348 <Bo.Kong@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <zhaoyuan.chen@mediatek.com>, <Teddy.Chen@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5 2/4] arm64: dts: mt8188: add aie node
Date: Thu, 3 Apr 2025 15:38:34 +0800
Message-ID: <20250403074005.21472-3-bo.kong@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250403074005.21472-1-bo.kong@mediatek.com>
References: <20250403074005.21472-1-bo.kong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Bo Kong <Bo.Kong@mediatek.com>

Add aie node and related node

Signed-off-by: Bo Kong <Bo.Kong@mediatek.com>
---
Changes in v5:
1.Modify the name of clock, change _ to -.

Changes in v4:
None

Changes in v3:
1. Remove dts non-MMIO nodes

Changes in v2:
1. Add AIE node and related node
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 69a8423d3858..641de110321a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2330,12 +2330,45 @@ imgsys_wpe1: clock-controller@15220000 {
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
+			clock-names = "img-ipe",
+				      "ipe-fdvt",
+				      "ipe-smi-larb12",
+				      "ipe-top";
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


