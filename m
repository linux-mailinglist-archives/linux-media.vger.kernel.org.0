Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5843D72C4
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 12:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236378AbhG0KLw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 06:11:52 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:56940 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236316AbhG0KLo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 06:11:44 -0400
X-UUID: 8585f820f8fd43e5a3121f129d097b1b-20210727
X-UUID: 8585f820f8fd43e5a3121f129d097b1b-20210727
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 378780011; Tue, 27 Jul 2021 18:11:40 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Jul 2021 18:11:32 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Jul 2021 18:11:31 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Tzung-Bi Shih" <tzungbi@chromium.org>,
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
Subject: [PATCH v3, 05/15] dt-bindings: media: mtk-vcodec: Separate video encoder and decoder dt-bindings
Date:   Tue, 27 Jul 2021 18:10:41 +0800
Message-ID: <20210727101051.24418-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210727101051.24418-1-yunfei.dong@mediatek.com>
References: <20210727101051.24418-1-yunfei.dong@mediatek.com>
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
v3: change txt files to yaml.
---
 .../media/mediatek,vcodec-decoder.yaml        | 138 ++++++++++++++++++
 .../media/mediatek,vcodec-encoder.yaml        | 128 ++++++++++++++++
 .../bindings/media/mediatek-vcodec.txt        | 130 -----------------
 3 files changed, 266 insertions(+), 130 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
new file mode 100644
index 000000000000..ea44acfeeb9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/mediatek,vcodec-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Video Decode Accelerator With Component
+
+maintainers:
+  - Yunfei Dong <yunfei.dong@mediatek.com>
+
+description: |+
+  Mediatek Video Decode is the video decode hardware present in Mediatek
+  SoCs which supports high resolution decoding functionalities.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8173-vcodec-dec
+      - mediatek,mt8183-vcodec-dec
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 8
+
+  clock-names:
+    items:
+      - const: vcodecpll
+      - const: univpll_d2
+      - const: clk_cci400_sel
+      - const: vdec_sel
+      - const: vdecpll
+      - const: vencpll
+      - const: venc_lt_sel
+      - const: vdec_bus_clk_src
+
+  assigned-clocks: true
+
+  assigned-clock-parents: true
+
+  iommus:
+    minItems: 1
+    maxItems: 32
+    description: |
+      List of the hardware port in respective IOMMU block for current Socs.
+      Refer to bindings/iommu/mediatek,iommu.yaml.
+
+  dma-ranges:
+    maxItems: 1
+    description: |
+      Describes the physical address space of IOMMU maps to memory.
+
+  mediatek,larb:
+    maxItems: 1
+    description: |
+      Mmust contain the local arbiters in the current Socs.
+
+  mediatek,scp:
+    maxItems: 1
+
+  mediatek,scp:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - iommus
+  - assigned-clocks
+  - assigned-clock-parents
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    vcodec_dec: vcodec@16000000 {
+      compatible = "mediatek,mt8173-vcodec-dec";
+      reg = <0 0x16000000 0 0x100>,   /*VDEC_SYS*/
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
+      interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
+      mediatek,larb = <&larb1>;
+      iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_PRED_RD_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_PRED_WR_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_UFO_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_VLD_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_VLD2_EXT>;
+      mediatek,vpu = <&vpu>;
+      power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
+      clocks = <&apmixedsys CLK_APMIXED_VCODECPLL>,
+             <&topckgen CLK_TOP_UNIVPLL_D2>,
+             <&topckgen CLK_TOP_CCI400_SEL>,
+             <&topckgen CLK_TOP_VDEC_SEL>,
+             <&topckgen CLK_TOP_VCODECPLL>,
+             <&apmixedsys CLK_APMIXED_VENCPLL>,
+             <&topckgen CLK_TOP_VENC_LT_SEL>,
+             <&topckgen CLK_TOP_VCODECPLL_370P5>;
+      clock-names = "vcodecpll",
+                  "univpll_d2",
+                  "clk_cci400_sel",
+                  "vdec_sel",
+                  "vdecpll",
+                  "vencpll",
+                  "venc_lt_sel",
+                  "vdec_bus_clk_src";
+      assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>,
+                      <&topckgen CLK_TOP_CCI400_SEL>,
+                      <&topckgen CLK_TOP_VDEC_SEL>,
+                      <&apmixedsys CLK_APMIXED_VCODECPLL>,
+                      <&apmixedsys CLK_APMIXED_VENCPLL>;
+      assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>,
+                             <&topckgen CLK_TOP_UNIVPLL_D2>,
+                             <&topckgen CLK_TOP_VCODECPLL>;
+      assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
+    };
\ No newline at end of file
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
new file mode 100644
index 000000000000..feb0697cf50e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/mediatek,vcodec-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Video Encode Accelerator With Component
+
+maintainers:
+  - Yunfei Dong <yunfei.dong@mediatek.com>
+
+description: |+
+  Mediatek Video Encode is the video encode hardware present in Mediatek
+  SoCs which supports high resolution decoding functionalities.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8173-vcodec-enc-vp8
+      - mediatek,mt8173-vcodec-enc
+      - mediatek,mt8183-vcodec-enc
+      - mediatek,mt8192-vcodec-enc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: vdec_sel
+      - const: vdec-soc-vdec
+      - const: vdec-soc-lat
+      - const: vdec-vdec
+      - const: vdec-top
+
+  assigned-clocks: true
+
+  assigned-clock-parents: true
+
+  iommus:
+    minItems: 1
+    maxItems: 32
+    description: |
+      List of the hardware port in respective IOMMU block for current Socs.
+      Refer to bindings/iommu/mediatek,iommu.yaml.
+
+  dma-ranges:
+    maxItems: 1
+    description: |
+      Describes the physical address space of IOMMU maps to memory.
+
+  mediatek,larb:
+    maxItems: 1
+    description: |
+      Mmust contain the local arbiters in the current Socs.
+
+  mediatek,scp:
+    maxItems: 1
+
+  mediatek,scp:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - iommus
+  - assigned-clocks
+  - assigned-clock-parents
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    vcodec_enc_avc: vcodec@18002000 {
+      compatible = "mediatek,mt8173-vcodec-enc";
+      reg = <0 0x18002000 0 0x1000>;
+      interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+      iommus = <&iommu M4U_PORT_VENC_RCPU>,
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
+      mediatek,larb = <&larb3>;
+      mediatek,vpu = <&vpu>;
+      clocks = <&topckgen CLK_TOP_VENC_SEL>;
+      clock-names = "venc_sel";
+      assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
+      assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
+    };
+
+    vcodec_enc_vp8: vcodec@19002000 {
+      compatible = "mediatek,mt8173-vcodec-enc-vp8";
+      reg =  <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
+      interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
+      iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
+             <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
+             <&iommu M4U_PORT_VENC_BSDMA_SET2>,
+             <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
+             <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
+             <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
+             <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
+             <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
+             <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
+      mediatek,larb = <&larb5>;
+      mediatek,vpu = <&vpu>;
+      clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
+      clock-names = "venc_lt_sel";
+      assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
+      assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
+    };
\ No newline at end of file
diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
deleted file mode 100644
index c44a6e6943af..000000000000
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ /dev/null
@@ -1,130 +0,0 @@
-Mediatek Video Codec
-
-Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
-supports high resolution encoding and decoding functionalities.
-
-Required properties:
-- compatible : must be one of the following string:
-  "mediatek,mt8173-vcodec-enc-vp8" for mt8173 vp8 encoder.
-  "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
-  "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
-  "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
-  "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
-  "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
-- reg : Physical base address of the video codec registers and length of
-  memory mapped region.
-- interrupts : interrupt number to the cpu.
-- mediatek,larb : must contain the local arbiters in the current Socs.
-- clocks : list of clock specifiers, corresponding to entries in
-  the clock-names property.
-- clock-names: avc encoder must contain "venc_sel", vp8 encoder must
-  contain "venc_lt_sel", decoder must contain "vcodecpll", "univpll_d2",
-  "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel",
-  "vdec_bus_clk_src".
-- iommus : should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
-  for details.
-- dma-ranges : describes the dma address range space that the codec hw access.
-One of the two following nodes:
-- mediatek,vpu : the node of the video processor unit, if using VPU.
-- mediatek,scp : the node of the SCP unit, if using SCP.
-
-
-Example:
-
-vcodec_dec: vcodec@16000000 {
-    compatible = "mediatek,mt8173-vcodec-dec";
-    reg = <0 0x16000000 0 0x100>,   /*VDEC_SYS*/
-          <0 0x16020000 0 0x1000>,  /*VDEC_MISC*/
-          <0 0x16021000 0 0x800>,   /*VDEC_LD*/
-          <0 0x16021800 0 0x800>,   /*VDEC_TOP*/
-          <0 0x16022000 0 0x1000>,  /*VDEC_CM*/
-          <0 0x16023000 0 0x1000>,  /*VDEC_AD*/
-          <0 0x16024000 0 0x1000>,  /*VDEC_AV*/
-          <0 0x16025000 0 0x1000>,  /*VDEC_PP*/
-          <0 0x16026800 0 0x800>,   /*VP8_VD*/
-          <0 0x16027000 0 0x800>,   /*VP6_VD*/
-          <0 0x16027800 0 0x800>,   /*VP8_VL*/
-          <0 0x16028400 0 0x400>;   /*VP9_VD*/
-    interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
-    mediatek,larb = <&larb1>;
-    iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
-             <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
-             <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
-             <&iommu M4U_PORT_HW_VDEC_PRED_RD_EXT>,
-             <&iommu M4U_PORT_HW_VDEC_PRED_WR_EXT>,
-             <&iommu M4U_PORT_HW_VDEC_UFO_EXT>,
-             <&iommu M4U_PORT_HW_VDEC_VLD_EXT>,
-             <&iommu M4U_PORT_HW_VDEC_VLD2_EXT>;
-    mediatek,vpu = <&vpu>;
-    power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
-    clocks = <&apmixedsys CLK_APMIXED_VCODECPLL>,
-             <&topckgen CLK_TOP_UNIVPLL_D2>,
-             <&topckgen CLK_TOP_CCI400_SEL>,
-             <&topckgen CLK_TOP_VDEC_SEL>,
-             <&topckgen CLK_TOP_VCODECPLL>,
-             <&apmixedsys CLK_APMIXED_VENCPLL>,
-             <&topckgen CLK_TOP_VENC_LT_SEL>,
-             <&topckgen CLK_TOP_VCODECPLL_370P5>;
-    clock-names = "vcodecpll",
-                  "univpll_d2",
-                  "clk_cci400_sel",
-                  "vdec_sel",
-                  "vdecpll",
-                  "vencpll",
-                  "venc_lt_sel",
-                  "vdec_bus_clk_src";
-    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>,
-                      <&topckgen CLK_TOP_CCI400_SEL>,
-                      <&topckgen CLK_TOP_VDEC_SEL>,
-                      <&apmixedsys CLK_APMIXED_VCODECPLL>,
-                      <&apmixedsys CLK_APMIXED_VENCPLL>;
-    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>,
-                             <&topckgen CLK_TOP_UNIVPLL_D2>,
-                             <&topckgen CLK_TOP_VCODECPLL>;
-    assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
-  };
-
-vcodec_enc_avc: vcodec@18002000 {
-    compatible = "mediatek,mt8173-vcodec-enc";
-    reg = <0 0x18002000 0 0x1000>;
-    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
-    iommus = <&iommu M4U_PORT_VENC_RCPU>,
-             <&iommu M4U_PORT_VENC_REC>,
-             <&iommu M4U_PORT_VENC_BSDMA>,
-             <&iommu M4U_PORT_VENC_SV_COMV>,
-             <&iommu M4U_PORT_VENC_RD_COMV>,
-             <&iommu M4U_PORT_VENC_CUR_LUMA>,
-             <&iommu M4U_PORT_VENC_CUR_CHROMA>,
-             <&iommu M4U_PORT_VENC_REF_LUMA>,
-             <&iommu M4U_PORT_VENC_REF_CHROMA>,
-             <&iommu M4U_PORT_VENC_NBM_RDMA>,
-             <&iommu M4U_PORT_VENC_NBM_WDMA>;
-    mediatek,larb = <&larb3>;
-    mediatek,vpu = <&vpu>;
-    clocks = <&topckgen CLK_TOP_VENC_SEL>;
-    clock-names = "venc_sel";
-    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
-    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
-  };
-
-vcodec_enc_vp8: vcodec@19002000 {
-    compatible = "mediatek,mt8173-vcodec-enc-vp8";
-    reg =  <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
-    interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
-    iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
-             <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
-             <&iommu M4U_PORT_VENC_BSDMA_SET2>,
-             <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
-             <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
-             <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
-             <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
-             <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
-             <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
-    mediatek,larb = <&larb5>;
-    mediatek,vpu = <&vpu>;
-    clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
-    clock-names = "venc_lt_sel";
-    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
-    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
-  };
-- 
2.25.1

