Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3534D3BE30A
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 08:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbhGGGZW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 02:25:22 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:50232 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230362AbhGGGZN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 02:25:13 -0400
X-UUID: b651278a62e14732b0590ef2b5e681b5-20210707
X-UUID: b651278a62e14732b0590ef2b5e681b5-20210707
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 19315582; Wed, 07 Jul 2021 14:22:25 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 14:22:21 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 14:22:19 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1, 04/14] dt-bindings: media: mtk-vcodec: Separate video encoder and decoder dt-bindings
Date:   Wed, 7 Jul 2021 14:21:47 +0800
Message-ID: <20210707062157.21176-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210707062157.21176-1-yunfei.dong@mediatek.com>
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Decoder will use component framework to manage hardware, it is big
difference with encoder.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/mediatek-vcodec-decoder.txt         | 169 ++++++++++++++++++
 .../media/mediatek-vcodec-encoder.txt         |  73 ++++++++
 2 files changed, 242 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt
new file mode 100644
index 000000000000..e09c1d0b6820
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt
@@ -0,0 +1,169 @@
+Mediatek Video Decoder
+
+Mediatek Video Decoder is the video decode hw present in Mediatek SoCs which
+supports high resolution decoding functionalities. With component framework
+require master and component node properties:
+
+Required properties(no component framework):
+- compatible : must be one of the following string:
+  "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
+  "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
+- reg : Physical base address of the video decoder registers and length of
+  memory mapped region.
+- interrupts : interrupt number to the cpu.
+- mediatek,larb : must contain the local arbiters in the current Socs.
+- clocks : list of clock specifiers, corresponding to entries in
+  the clock-names property.
+- clock-names: must contain "vcodecpll", "univpll_d2", "clk_cci400_sel"
+  "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel", "vdec_bus_clk_src".
+- iommus : should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+- dma-ranges : describes the dma address range space that the codec hw access.
+One of the two following nodes:
+- mediatek,vpu : the node of the video processor unit, if using VPU.
+- mediatek,scp : the node of the SCP unit, if using SCP.
+
+Master properties(component framework):
+- compatible :
+  "mediatek,mt8192-vcodec-dec" for MT8192 decoder.
+- reg : Physical base address of the video decoder registers and length of
+  memory mapped region.
+- iommus : should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+One of the two following nodes:
+- mediatek,vpu : the node of the video processor unit, if using VPU.
+- mediatek,scp : the node of the SCP unit, if using SCP.
+
+component properties(lat/core):
+- compatible :
+   "mediatek,mtk-vcodec-lat" for lat hardware decoder.
+  "mediatek,mtk-vcodec-core" core hardware decoder
+- reg : Physical base address of the video decoder registers and length of
+  memory mapped region.
+- interrupts : interrupt number to the cpu.
+- clocks : list of clock specifiers, corresponding to entries in
+  the clock-names property.
+- clock-names: "vdec-soc-vdec", "vdec-soc-lat", "vdec-vdec", "vdec-top".
+- iommus : should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+One of the two following nodes:
+- mediatek,vpu : the node of the video processor unit, if using VPU.
+- mediatek,scp : the node of the SCP unit, if using SCP.
+
+Example:
+
+No component framework:
+vcodec_dec: vcodec@16000000 {
+    compatible = "mediatek,mt8173-vcodec-dec";
+    reg = <0 0x16000000 0 0x100>,   /*VDEC_SYS*/
+          <0 0x16020000 0 0x1000>,  /*VDEC_MISC*/
+          <0 0x16021000 0 0x800>,   /*VDEC_LD*/
+          <0 0x16021800 0 0x800>,   /*VDEC_TOP*/
+          <0 0x16022000 0 0x1000>,  /*VDEC_CM*/
+          <0 0x16023000 0 0x1000>,  /*VDEC_AD*/
+          <0 0x16024000 0 0x1000>,  /*VDEC_AV*/
+          <0 0x16025000 0 0x1000>,  /*VDEC_PP*/
+          <0 0x16026800 0 0x800>,   /*VP8_VD*/
+          <0 0x16027000 0 0x800>,   /*VP6_VD*/
+          <0 0x16027800 0 0x800>,   /*VP8_VL*/
+          <0 0x16028400 0 0x400>;   /*VP9_VD*/
+    interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
+    mediatek,larb = <&larb1>;
+    iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_PRED_RD_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_PRED_WR_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_UFO_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_VLD_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_VLD2_EXT>;
+    mediatek,vpu = <&vpu>;
+    power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
+    clocks = <&apmixedsys CLK_APMIXED_VCODECPLL>,
+             <&topckgen CLK_TOP_UNIVPLL_D2>,
+             <&topckgen CLK_TOP_CCI400_SEL>,
+             <&topckgen CLK_TOP_VDEC_SEL>,
+             <&topckgen CLK_TOP_VCODECPLL>,
+             <&apmixedsys CLK_APMIXED_VENCPLL>,
+             <&topckgen CLK_TOP_VENC_LT_SEL>,
+             <&topckgen CLK_TOP_VCODECPLL_370P5>;
+    clock-names = "vcodecpll",
+                  "univpll_d2",
+                  "clk_cci400_sel",
+                  "vdec_sel",
+                  "vdecpll",
+                  "vencpll",
+                  "venc_lt_sel",
+                  "vdec_bus_clk_src";
+    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>,
+                      <&topckgen CLK_TOP_CCI400_SEL>,
+                      <&topckgen CLK_TOP_VDEC_SEL>,
+                      <&apmixedsys CLK_APMIXED_VCODECPLL>,
+                      <&apmixedsys CLK_APMIXED_VENCPLL>;
+    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>,
+                             <&topckgen CLK_TOP_UNIVPLL_D2>,
+                             <&topckgen CLK_TOP_VCODECPLL>;
+    assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
+  };
+
+With component framework:
+vcodec_dec: vcodec_dec@16000000 {
+	compatible = "mediatek,mt8192-vcodec-dec";
+	reg = <0 0x16000000 0 0x1000>;		/* VDEC_SYS */
+	mediatek,scp = <&scp>;
+	iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
+  };
+
+vcodec_lat: vcodec_lat@0x16010000 {
+    compatible = "mediatek,mtk-vcodec-lat";
+    reg = <0 0x16010000 0 0x800>;		/* VDEC_MISC */
+    interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
+    iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
+	clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+             <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
+             <&vdecsys_soc CLK_VDEC_SOC_LAT>,
+             <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
+             <&topckgen CLK_TOP_MAINPLL_D4>;
+	clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
+                  "vdec-vdec", "vdec-top";
+	assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+	assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+	power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
+  };
+
+vcodec_core: vcodec_core@0x16025000 {
+	compatible = "mediatek,mtk-vcodec-core";
+	reg = <0 0x16025000 0 0x1000>;		/* VDEC_CORE_MISC */
+	interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
+	iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
+	clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+             <&vdecsys CLK_VDEC_VDEC>,
+             <&vdecsys CLK_VDEC_LAT>,
+             <&vdecsys CLK_VDEC_LARB1>,
+             <&topckgen CLK_TOP_MAINPLL_D4>;
+	clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
+                  "vdec-vdec", "vdec-top";
+	assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+	assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+	power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
+  };
\ No newline at end of file
diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt
new file mode 100644
index 000000000000..e73682dc0c81
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt
@@ -0,0 +1,73 @@
+Mediatek Video Encoder
+
+Mediatek Video Encoder is the video encode hw present in Mediatek SoCs which
+supports high resolution encoding functionalities.
+
+Required properties:
+- compatible : must be one of the following string:
+  "mediatek,mt8173-vcodec-enc-vp8" for mt8173 vp8 encoder.
+  "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
+  "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
+  "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
+- reg : Physical base address of the video encoder registers and length of
+  memory mapped region.
+- interrupts : interrupt number to the cpu.
+- mediatek,larb : must contain the local arbiters in the current Socs.
+- clocks : list of clock specifiers, corresponding to entries in
+  the clock-names property.
+- clock-names: avc encoder must contain "venc_sel", vp8 encoder must
+  contain "venc_lt_sel".
+- iommus : should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+- dma-ranges : describes the dma address range space that the codec hw access.
+One of the two following nodes:
+- mediatek,vpu : the node of the video processor unit, if using VPU.
+- mediatek,scp : the node of the SCP unit, if using SCP.
+
+
+Example:
+
+vcodec_enc_avc: vcodec@18002000 {
+    compatible = "mediatek,mt8173-vcodec-enc";
+    reg = <0 0x18002000 0 0x1000>;
+    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+    iommus = <&iommu M4U_PORT_VENC_RCPU>,
+             <&iommu M4U_PORT_VENC_REC>,
+             <&iommu M4U_PORT_VENC_BSDMA>,
+             <&iommu M4U_PORT_VENC_SV_COMV>,
+             <&iommu M4U_PORT_VENC_RD_COMV>,
+             <&iommu M4U_PORT_VENC_CUR_LUMA>,
+             <&iommu M4U_PORT_VENC_CUR_CHROMA>,
+             <&iommu M4U_PORT_VENC_REF_LUMA>,
+             <&iommu M4U_PORT_VENC_REF_CHROMA>,
+             <&iommu M4U_PORT_VENC_NBM_RDMA>,
+             <&iommu M4U_PORT_VENC_NBM_WDMA>;
+    mediatek,larb = <&larb3>;
+    mediatek,vpu = <&vpu>;
+    clocks = <&topckgen CLK_TOP_VENC_SEL>;
+    clock-names = "venc_sel";
+    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
+    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
+  };
+
+vcodec_enc_vp8: vcodec@19002000 {
+    compatible = "mediatek,mt8173-vcodec-enc-vp8";
+    reg =  <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
+    interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
+    iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
+             <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
+             <&iommu M4U_PORT_VENC_BSDMA_SET2>,
+             <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
+             <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
+             <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
+             <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
+             <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
+             <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
+    mediatek,larb = <&larb5>;
+    mediatek,vpu = <&vpu>;
+    clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
+    clock-names = "venc_lt_sel";
+    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
+    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
+  };
-- 
2.18.0

