Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E26955B570
	for <lists+linux-media@lfdr.de>; Mon, 27 Jun 2022 04:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbiF0Czw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jun 2022 22:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbiF0Czv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jun 2022 22:55:51 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2119C3894;
        Sun, 26 Jun 2022 19:55:49 -0700 (PDT)
X-UUID: 818064a749e3490281c83869fc72fefb-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:1d70141f-114d-4b02-8be4-c7410f032bbc,OB:0,LO
        B:0,IP:0,URL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
        TION:release,TS:20
X-CID-META: VersionHash:b14ad71,CLOUDID:37da9ed8-850a-491d-a127-60d9309b2b3e,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
        ,QS:nil,BEC:nil,COL:0
X-UUID: 818064a749e3490281c83869fc72fefb-20220627
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 2073135488; Mon, 27 Jun 2022 10:55:46 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 27 Jun 2022 10:55:45 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jun 2022 10:55:45 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jun 2022 10:55:43 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        <angelogioacchino.delregno@collabora.com>,
        <nicolas.dufresne@collabora.com>, <wenst@chromium.org>
CC:     <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Tomasz Figa <tfiga@chromium.org>, <xia.jiang@mediatek.com>,
        <maoguang.meng@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>,
        <srv_heupstream@mediatek.com>
Subject: [V4,1/8] dt-bindings: mediatek: Add mediatek,mt8195-jpgdec compatible
Date:   Mon, 27 Jun 2022 10:55:33 +0800
Message-ID: <20220627025540.8901-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627025540.8901-1-irui.wang@mediatek.com>
References: <20220627025540.8901-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: kyrie wu <kyrie.wu@mediatek.com>

Add mediatek,mt8195-jpgdec compatible to binding document.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
---
 .../media/mediatek,mt8195-jpegdec.yaml        | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
new file mode 100644
index 000000000000..8a255e8e2e09
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek JPEG Encoder Device Tree Bindings
+
+maintainers:
+  - kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
+
+description: |-
+  MediaTek JPEG Decoder is the JPEG decode hardware present in MediaTek SoCs
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt8195-jpgdec
+
+  mediatek,jpegdec-multi-core:
+    type: boolean
+    description: |
+      Indicates whether the jpeg encoder has multiple cores or not.
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 6
+    description: |
+      Points to the respective IOMMU block with master port as argument, see
+      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+      Ports are according to the HW.
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+# Required child node:
+patternProperties:
+  "^jpgdec@[0-9a-f]+$":
+    type: object
+    description: |
+      The jpeg decoder hardware device node which should be added as subnodes to
+      the main jpeg node.
+
+    properties:
+      compatible:
+        const: mediatek,mt8195-jpgdec-hw
+
+      reg:
+        maxItems: 1
+
+      hw_id:
+        description: |
+          MT8195 decoding hardware id value. MT8195 has three decoding hardwares,
+          which is represented by this parameter.
+
+      iommus:
+        minItems: 1
+        maxItems: 32
+        description: |
+          List of the hardware port in respective IOMMU block for current Socs.
+          Refer to bindings/iommu/mediatek,iommu.yaml.
+
+      interrupts:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+      clock-names:
+        items:
+          - const: jpgdec
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - hw_id
+      - iommus
+      - interrupts
+      - clocks
+      - clock-names
+      - power-domains
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - power-domains
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mt8195-memory-port.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/power/mt8195-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        jpgdec_master {
+                compatible = "mediatek,mt8195-jpgdec";
+                mediatek,jpegdec-multi-core;
+                power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
+                iommus = <&iommu_vpp M4U_PORT_L19_JPGDEC_WDMA0>,
+                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BSDMA0>,
+                     <&iommu_vpp M4U_PORT_L19_JPGDEC_WDMA1>,
+                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BSDMA1>,
+                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
+                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
+                #address-cells = <2>;
+                #size-cells = <2>;
+                ranges;
+
+                jpgdec@1a040000 {
+                    compatible = "mediatek,mt8195-jpgdec-hw";
+                    reg = <0 0x1a040000 0 0x10000>;/* JPGDEC_C0 */
+                    hw_id = <0>;
+                    iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA1>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
+                    interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH 0>;
+                    clocks = <&vencsys CLK_VENC_JPGDEC>;
+                    clock-names = "jpgdec";
+                    power-domains = <&spm MT8195_POWER_DOMAIN_VDEC0>;
+                };
+
+                jpgdec@1a050000 {
+                    compatible = "mediatek,mt8195-jpgdec-hw";
+                    reg = <0 0x1a050000 0 0x10000>;/* JPGDEC_C1 */
+                    hw_id = <1>;
+                    iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA1>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
+                    interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH 0>;
+                    clocks = <&vencsys CLK_VENC_JPGDEC_C1>;
+                    clock-names = "jpgdec";
+                    power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
+                };
+
+                jpgdec@1b040000 {
+                    compatible = "mediatek,mt8195-jpgdec-hw";
+                    reg = <0 0x1b040000 0 0x10000>;/* JPGDEC_C2 */
+                    hw_id = <2>;
+                    iommus = <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA0>,
+                        <&iommu_vpp M4U_PORT_L20_JPGDEC_BSDMA0>,
+                        <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA1>,
+                        <&iommu_vpp M4U_PORT_L20_JPGDEC_BSDMA1>,
+                        <&iommu_vpp M4U_PORT_L20_JPGDEC_BUFF_OFFSET1>,
+                        <&iommu_vpp M4U_PORT_L20_JPGDEC_BUFF_OFFSET0>;
+                    interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>;
+                    clocks = <&vencsys_core1 CLK_VENC_CORE1_JPGDEC>;
+                    clock-names = "jpgdec";
+                    power-domains = <&spm MT8195_POWER_DOMAIN_VDEC2>;
+                };
+        };
+    };
-- 
2.18.0

