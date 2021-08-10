Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9A883E5565
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 10:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238283AbhHJIcQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 04:32:16 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:58232 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S238329AbhHJIcH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 04:32:07 -0400
X-UUID: 56cd2ff3d64c4a6eb3ee926715ccd8cf-20210810
X-UUID: 56cd2ff3d64c4a6eb3ee926715ccd8cf-20210810
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2107097003; Tue, 10 Aug 2021 16:31:44 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 16:31:42 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Aug 2021 16:31:35 +0800
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
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        George Sun <george.sun@mediatek.com>
Subject: [PATCH v4, 13/15] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
Date:   Tue, 10 Aug 2021 16:30:45 +0800
Message-ID: <20210810083047.16693-14-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210810083047.16693-1-yunfei.dong@mediatek.com>
References: <20210810083047.16693-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds decoder dt-bindings for mt8192.

Change-Id: I2c482fa6c0a91b5fc4f1950dd563cbc4d6c35da1
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
v4: fix yaml file check fail
---
 .../media/mediatek,vcodec-comp-decoder.yaml   | 172 ++++++++++++++++++
 1 file changed, 172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
new file mode 100644
index 000000000000..083c89933917
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
@@ -0,0 +1,172 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/mediatek,vcodec-comp-decoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Video Decode Accelerator With Component
+
+maintainers:
+  - Yunfei Dong <yunfei.dong@mediatek.com>
+
+description: |+
+  Mediatek Video Decode is the video decode hardware present in Mediatek
+  SoCs which supports high resolution decoding functionalities. Required
+  master and component node.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt8192-vcodec-dec  # for lat hardware
+          - mediatek,mtk-vcodec-lat     # for core hardware
+          - mediatek,mtk-vcodec-core
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
+      - const: vdec-sel
+      - const: vdec-soc-vdec
+      - const: vdec-soc-lat
+      - const: vdec-vdec
+      - const: vdec-top
+
+  assigned-clocks: true
+
+  assigned-clock-parents: true
+
+  power-domains:
+    maxItems: 1
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
+  mediatek,scp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
+    description:
+      Describes point to scp.
+
+required:
+      - compatible
+      - reg
+      - iommus
+      - dma-ranges
+
+allOf:
+  - if: #master node
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8192-vcodec-dec  # for lat hardware
+
+    then:
+      required:
+        - mediatek,scp
+
+  - if: #component node
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mtk-vcodec-lat     # for core hardware
+              - mediatek,mtk-vcodec-core
+
+    then:
+      required:
+        - interrupts
+        - clocks
+        - clock-names
+        - assigned-clocks
+        - assigned-clock-parents
+        - power-domains
+
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mt8192-larb-port.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mt8192-clk.h>
+    #include <dt-bindings/power/mt8192-power.h>
+
+    vcodec_dec: vcodec_dec@16000000 {
+        compatible = "mediatek,mt8192-vcodec-dec";
+        reg = <0 0x16000000 0 0x1000>;		/* VDEC_SYS */
+        mediatek,scp = <&scp>;
+        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
+        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+    };
+
+    vcodec_lat: vcodec_lat@0x16010000 {
+        compatible = "mediatek,mtk-vcodec-lat";
+        reg = <0 0x16010000 0 0x800>;		/* VDEC_MISC */
+        interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
+        iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
+        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+        clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+             <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
+             <&vdecsys_soc CLK_VDEC_SOC_LAT>,
+             <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
+             <&topckgen CLK_TOP_MAINPLL_D4>;
+        clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
+              "vdec-vdec", "vdec-top";
+        assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+        assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+        power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
+    };
+
+    vcodec_core: vcodec_core@0x16025000 {
+        compatible = "mediatek,mtk-vcodec-core";
+        reg = <0 0x16025000 0 0x1000>;		/* VDEC_CORE_MISC */
+        interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
+        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
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
+        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+        clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+             <&vdecsys CLK_VDEC_VDEC>,
+             <&vdecsys CLK_VDEC_LAT>,
+             <&vdecsys CLK_VDEC_LARB1>,
+             <&topckgen CLK_TOP_MAINPLL_D4>;
+        clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
+              "vdec-vdec", "vdec-top";
+        assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+        assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+        power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
+    };
-- 
2.25.1

