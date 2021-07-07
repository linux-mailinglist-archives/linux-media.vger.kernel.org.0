Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C16C3BE310
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 08:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbhGGGZY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 02:25:24 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:50056 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230404AbhGGGZR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 02:25:17 -0400
X-UUID: f04ec544969b448c9863c7d8c23f75f0-20210707
X-UUID: f04ec544969b448c9863c7d8c23f75f0-20210707
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1311948238; Wed, 07 Jul 2021 14:22:33 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 14:22:31 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 14:22:30 +0800
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
Subject: [PATCH v1, 12/14] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
Date:   Wed, 7 Jul 2021 14:21:55 +0800
Message-ID: <20210707062157.21176-13-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210707062157.21176-1-yunfei.dong@mediatek.com>
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds decoder dt-bindings for mt8192.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/mediatek-vcodec-comp-decoder.txt    | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.txt
new file mode 100644
index 000000000000..941428cb2f08
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.txt
@@ -0,0 +1,93 @@
+Mediatek Video Decoder With Component
+
+Mediatek Video Decoder is the video decode hw present in Mediatek SoCs which
+supports high resolution decoding functionalities. Required  master and
+component node properties:
+
+Master properties:
+- compatible :
+  "mediatek,mt8192-vcodec-dec" for MT8192 decoder.
+- reg : Physical base address of the video decoder registers and length of
+  memory mapped region.
+- iommus : should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+- mediatek,scp : the node of the SCP unit, if using SCP.
+
+component properties(core and lat):
+- compatible(core) : "mediatek,mtk-vcodec-core" core hardware decoder
+  "mediatek,mtk-vcodec-core" for core hardware decoder.
+- compatible(lat) : "mediatek,mtk-vcodec-lat" lat hardware decoder
+  "mediatek,mtk-vcodec-lat" for lat hardware decoder.
+- reg : Physical base address of the video decoder registers and length of
+  memory mapped region.
+- interrupts : interrupt number to the cpu.
+- clocks : list of clock specifiers, corresponding to entries in
+  the clock-names property.
+- clock-names: decoder must contain "vcodecpll", "univpll_d2",
+  "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel",
+  "vdec_bus_clk_src".
+- iommus : should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+- dma-ranges : describes how the physical address space of the IOMMU maps
+  to memory.
+
+vcodec_dec: vcodec_dec@16000000 {
+    compatible = "mediatek,mt8192-vcodec-dec";
+    reg = <0 0x16000000 0 0x1000>;		/* VDEC_SYS */
+    mediatek,scp = <&scp>;
+    iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
+    dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+  };
+
+vcodec_lat: vcodec_lat@0x16010000 {
+    compatible = "mediatek,mtk-vcodec-lat";
+    reg = <0 0x16010000 0 0x800>;		/* VDEC_MISC */
+    interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
+    iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
+         <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
+         <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
+         <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
+         <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
+         <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
+         <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
+         <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
+    dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+    clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+         <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
+         <&vdecsys_soc CLK_VDEC_SOC_LAT>,
+         <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
+         <&topckgen CLK_TOP_MAINPLL_D4>;
+    clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat", "vdec-vdec", "vdec-top";
+    assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+    assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+    power-domains = <&scpsys MT8192_POWER_DOMAIN_VDEC>;
+  };
+
+vcodec_core: vcodec_core@0x16025000 {
+    compatible = "mediatek,mtk-vcodec-core";
+    reg = <0 0x16025000 0 0x1000>;		/* VDEC_CORE_MISC */
+    interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
+    iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
+    dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+    clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+         <&vdecsys CLK_VDEC_VDEC>,
+         <&vdecsys CLK_VDEC_LAT>,
+         <&vdecsys CLK_VDEC_LARB1>,
+         <&topckgen CLK_TOP_MAINPLL_D4>;
+    clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat", "vdec-vdec", "vdec-top";
+    assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+    assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+    power-domains = <&scpsys MT8192_POWER_DOMAIN_VDEC2>;
+ };
-- 
2.18.0

