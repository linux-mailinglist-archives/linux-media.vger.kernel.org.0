Return-Path: <linux-media+bounces-2342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADC68110FA
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 13:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E17A7B21050
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 12:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C2628E0C;
	Wed, 13 Dec 2023 12:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JS2mVMjI"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8FC1E4;
	Wed, 13 Dec 2023 04:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702470032;
	bh=BYmcEgaBo5I1IXZr2Bp32/w8YdhWfM9/oRB+PHkjY7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JS2mVMjISMIkLCwLDBK+frDTRB6utKwa+Cz7KGcUHrevMT1OIAO1bimOhP3kAa/Z0
	 J4kYwPCiOy6V/xClOuS3wtnjLSEW/Y+liR3MecZhpsoXm5nXRvYOv6buyq+f0tNYDE
	 bSvZeoqf//eX9EQWfhwGXv0FA+gHddeqgBQ0wYSWrVsIGVcphglJkFsr8xkN7/UA9i
	 +sAsblsELT4GxZhUNniDZQ8VKN74hWP46gtpXTy3KVEniKIoav2vHt0n+kAKfnmLKX
	 SR+XPbXDCqpM+k1FEtD+MGvD31J+ZTha+jvSKVfUHO/YsqN3a1R4S5gYjWnOZatFgQ
	 ElRalFyb5YGMw==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 396543781488;
	Wed, 13 Dec 2023 12:20:31 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	kernel@collabora.com,
	eugen.hristev@collabora.com,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com,
	Kyrie Wu <kyrie.wu@mediatek.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8186: Add venc node
Date: Wed, 13 Dec 2023 14:20:17 +0200
Message-Id: <20231213122017.102100-4-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231213122017.102100-1-eugen.hristev@collabora.com>
References: <20231213122017.102100-1-eugen.hristev@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kyrie Wu <kyrie.wu@mediatek.com>

Add video encoder node.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
[eugen.hristev@collabora.com: minor cleanup]
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 66ead3f23336..8535ff2b44e9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1993,6 +1993,30 @@ larb7: smi@17010000 {
 			power-domains = <&spm MT8186_POWER_DOMAIN_VENC>;
 		};
 
+		venc: venc@17020000 {
+			compatible = "mediatek,mt8183-vcodec-enc";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			reg = <0 0x17020000 0 0x2000>;
+			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&iommu_mm IOMMU_PORT_L7_VENC_RCPU>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_REC>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_BSDMA>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_SV_COMV>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_RD_COMV>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_CUR_LUMA>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_CUR_CHROMA>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_REF_LUMA>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_REF_CHROMA>;
+			dma-ranges = <0x1 0x0 0x1 0x0 0x1 0x0>;
+			mediatek,scp = <&scp>;
+			clocks = <&vencsys CLK_VENC_CKE1_VENC>;
+			clock-names = "MT_CG_VENC";
+			assigned-clocks = <&topckgen CLK_TOP_VENC>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D3>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_VENC>;
+		};
+
 		camsys: clock-controller@1a000000 {
 			compatible = "mediatek,mt8186-camsys";
 			reg = <0 0x1a000000 0 0x1000>;
-- 
2.34.1


