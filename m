Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC802FE299
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 07:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbhAUGTw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 01:19:52 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:44704 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727037AbhAUGTK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 01:19:10 -0500
X-UUID: b392672ebd184d6ca71847278aa8c80b-20210121
X-UUID: b392672ebd184d6ca71847278aa8c80b-20210121
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 314996866; Thu, 21 Jan 2021 14:18:12 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Jan 2021 14:18:10 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Jan 2021 14:18:09 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>
CC:     Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 2/3] arm64: dts: mt8173: Separating mtk-vcodec-enc device node
Date:   Thu, 21 Jan 2021 14:18:03 +0800
Message-ID: <20210121061804.26423-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210121061804.26423-1-irui.wang@mediatek.com>
References: <20210121061804.26423-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are two separate hardware encoder blocks inside MT8173.
Split the current mtk-vcodec-enc node to match the hardware architecture.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
Signed-off-by: Irui Wang <irui.wang@mediatek.com>

---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 60 ++++++++++++------------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 7fa870e4386a..d667b296c512 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1459,13 +1459,10 @@
 		};
 
 		vcodec_enc: vcodec@18002000 {
-			compatible = "mediatek,mt8173-vcodec-enc";
-			reg = <0 0x18002000 0 0x1000>,	/* VENC_SYS */
-			      <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
-			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>,
-				     <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
-			mediatek,larb = <&larb3>,
-					<&larb5>;
+			compatible = "mediatek,mt8173-vcodec-avc-enc";
+			reg = <0 0x18002000 0 0x1000>;	/* VENC_SYS */
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,larb = <&larb3>;
 			iommus = <&iommu M4U_PORT_VENC_RCPU>,
 				 <&iommu M4U_PORT_VENC_REC>,
 				 <&iommu M4U_PORT_VENC_BSDMA>,
@@ -1476,29 +1473,12 @@
 				 <&iommu M4U_PORT_VENC_REF_LUMA>,
 				 <&iommu M4U_PORT_VENC_REF_CHROMA>,
 				 <&iommu M4U_PORT_VENC_NBM_RDMA>,
-				 <&iommu M4U_PORT_VENC_NBM_WDMA>,
-				 <&iommu M4U_PORT_VENC_RCPU_SET2>,
-				 <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
-				 <&iommu M4U_PORT_VENC_BSDMA_SET2>,
-				 <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
-				 <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
-				 <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
-				 <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
-				 <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
-				 <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
+				 <&iommu M4U_PORT_VENC_NBM_WDMA>;
 			mediatek,vpu = <&vpu>;
-			clocks = <&topckgen CLK_TOP_VENCPLL_D2>,
-				 <&topckgen CLK_TOP_VENC_SEL>,
-				 <&topckgen CLK_TOP_UNIVPLL1_D2>,
-				 <&topckgen CLK_TOP_VENC_LT_SEL>;
-			clock-names = "venc_sel_src",
-				      "venc_sel",
-				      "venc_lt_sel_src",
-				      "venc_lt_sel";
-			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>,
-					  <&topckgen CLK_TOP_VENC_LT_SEL>;
-			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>,
-						 <&topckgen CLK_TOP_VCODECPLL_370P5>;
+			clocks = <&topckgen CLK_TOP_VENC_SEL>;
+			clock-names = "venc_sel";
+			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
 		};
 
 		jpegdec: jpegdec@18004000 {
@@ -1530,5 +1510,27 @@
 				 <&vencltsys CLK_VENCLT_CKE0>;
 			clock-names = "apb", "smi";
 		};
+
+		vcodec_enc_lt: vcodec@19002000 {
+			compatible = "mediatek,mt8173-vcodec-vp8-enc";
+			reg =  <0 0x19002000 0 0x1000>; /* VENC_LT_SYS */
+			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
+				 <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
+				 <&iommu M4U_PORT_VENC_BSDMA_SET2>,
+				 <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
+				 <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
+				 <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
+				 <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
+				 <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
+				 <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
+			mediatek,larb = <&larb5>;
+			mediatek,vpu = <&vpu>;
+			clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
+			clock-names = "venc_lt_sel";
+			assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
+			assigned-clock-parents =
+				 <&topckgen CLK_TOP_VCODECPLL_370P5>;
+		};
 	};
 };
-- 
2.18.0

