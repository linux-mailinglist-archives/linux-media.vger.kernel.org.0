Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE38E4782C1
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 02:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbhLQB4A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 20:56:00 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:34468 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232321AbhLQBz6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 20:55:58 -0500
X-UUID: 260219fe542f4a40a95e1bb799a88868-20211217
X-UUID: 260219fe542f4a40a95e1bb799a88868-20211217
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1374744653; Fri, 17 Dec 2021 09:55:56 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Dec 2021 09:55:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 17 Dec 2021 09:55:53 +0800
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
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Steve Cho <stevecho@chromium.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v17, 15/19] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
Date:   Fri, 17 Dec 2021 09:55:26 +0800
Message-ID: <20211217015530.23720-16-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211217015530.23720-1-yunfei.dong@mediatek.com>
References: <20211217015530.23720-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds decoder dt-bindings for mt8192.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../media/mediatek,vcodec-subdev-decoder.yaml | 265 ++++++++++++++++++
 1 file changed, 265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
new file mode 100644
index 000000000000..d587fc3e39fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -0,0 +1,265 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Mediatek Video Decode Accelerator With Multi Hardware
+
+maintainers:
+  - Yunfei Dong <yunfei.dong@mediatek.com>
+
+description: |
+  Mediatek Video Decode is the video decode hardware present in Mediatek
+  SoCs which supports high resolution decoding functionalities. Required
+  parent and child device node.
+
+  About the Decoder Hardware Block Diagram, please check below:
+
+    +---------------------------------+------------------------------------+
+    |                                 |                                    |
+    | input -> lat HW -> lat buffer --|--> lat buffer -> core HW -> output |
+    |            ||                   |                     ||             |
+    +------------||-------------------+---------------------||-------------+
+              lat workqueue           |              core workqueue     <parent>
+    -------------||-----------------------------------------||------------------
+                 ||                                         ||          <child>
+                 \/ <----------------HW index-------------->\/
+           +------------------------------------------------------+
+           |                    enable/disable                    |
+           |           clk     power    irq    iommu              |
+           |                 (lat/lat soc/core0/core1)            |
+           +------------------------------------------------------+
+
+  As above, there are parent and child devices, child mean each hardware. The child device
+  controls the information of each hardware independent which include clk/power/irq.
+
+  There are two workqueues in parent device: lat workqueue and core workqueue. They are used
+  to lat and core hardware deocder. Lat workqueue need to get input bitstream and lat buffer,
+  then enable lat to decode, writing the result to lat buffer, dislabe hardware when lat decode
+  done. Core workqueue need to get lat buffer and output buffer, then enable core to decode,
+  writing the result to output buffer, disable hardware when core decode done. These two
+  hardwares will decode each frame cyclically.
+
+  For the smi common may not the same for each hardware, can't combine all hardware in one node,
+  or leading to iommu fault when access dram data.
+
+properties:
+  compatible:
+    const: mediatek,mt8192-vcodec-dec
+
+  reg:
+    maxItems: 1
+
+  iommus:
+    minItems: 1
+    maxItems: 32
+    description: |
+      List of the hardware port in respective IOMMU block for current Socs.
+      Refer to bindings/iommu/mediatek,iommu.yaml.
+
+  mediatek,scp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
+    description: |
+      The node of system control processor (SCP), using
+      the remoteproc & rpmsg framework.
+
+  dma-ranges:
+    maxItems: 1
+    description: |
+      Describes the physical address space of IOMMU maps to memory.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+# Required child node:
+patternProperties:
+  '^vcodec-lat@[0-9a-f]+$':
+    type: object
+
+    properties:
+      compatible:
+        const: mediatek,mtk-vcodec-lat
+
+      reg:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+      iommus:
+        minItems: 1
+        maxItems: 32
+        description: |
+          List of the hardware port in respective IOMMU block for current Socs.
+          Refer to bindings/iommu/mediatek,iommu.yaml.
+
+      clocks:
+        maxItems: 5
+
+      clock-names:
+        items:
+          - const: sel
+          - const: soc-vdec
+          - const: soc-lat
+          - const: vdec
+          - const: top
+
+      assigned-clocks:
+        maxItems: 1
+
+      assigned-clock-parents:
+        maxItems: 1
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - interrupts
+      - iommus
+      - clocks
+      - clock-names
+      - assigned-clocks
+      - assigned-clock-parents
+      - power-domains
+
+    additionalProperties: false
+
+  '^vcodec-core@[0-9a-f]+$':
+    type: object
+
+    properties:
+      compatible:
+        const: mediatek,mtk-vcodec-core
+
+      reg:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+      iommus:
+        minItems: 1
+        maxItems: 32
+        description: |
+          List of the hardware port in respective IOMMU block for current Socs.
+          Refer to bindings/iommu/mediatek,iommu.yaml.
+
+      clocks:
+        maxItems: 5
+
+      clock-names:
+        items:
+          - const: sel
+          - const: soc-vdec
+          - const: soc-lat
+          - const: vdec
+          - const: top
+
+      assigned-clocks:
+        maxItems: 1
+
+      assigned-clock-parents:
+        maxItems: 1
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - interrupts
+      - iommus
+      - clocks
+      - clock-names
+      - assigned-clocks
+      - assigned-clock-parents
+      - power-domains
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - iommus
+  - mediatek,scp
+  - dma-ranges
+  - ranges
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
+    video-codec@16000000 {
+        compatible = "mediatek,mt8192-vcodec-dec";
+        mediatek,scp = <&scp>;
+        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
+        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x16000000 0x40000>;
+        reg = <0x16000000 0x1000>;		/* VDEC_SYS */
+        vcodec-lat@10000 {
+            compatible = "mediatek,mtk-vcodec-lat";
+            reg = <0x10000 0x800>;
+            interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
+            iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
+                <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
+                <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
+                <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
+                <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
+                <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
+                <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
+                <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
+            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+                <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
+                <&vdecsys_soc CLK_VDEC_SOC_LAT>,
+                <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
+                <&topckgen CLK_TOP_MAINPLL_D4>;
+            clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
+            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
+        };
+
+        vcodec-core@25000 {
+            compatible = "mediatek,mtk-vcodec-core";
+            reg = <0x25000 0x1000>;
+            interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
+            iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
+            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+                <&vdecsys CLK_VDEC_VDEC>,
+                <&vdecsys CLK_VDEC_LAT>,
+                <&vdecsys CLK_VDEC_LARB1>,
+                <&topckgen CLK_TOP_MAINPLL_D4>;
+            clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
+            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
+        };
+    };
-- 
2.25.1

