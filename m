Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FAD53CCEC5
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 09:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235053AbhGSHuJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 03:50:09 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:40516 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233759AbhGSHuG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 03:50:06 -0400
X-UUID: 264febeeed3c450199dbed39ec3bf3ff-20210719
X-UUID: 264febeeed3c450199dbed39ec3bf3ff-20210719
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 553072883; Mon, 19 Jul 2021 15:47:01 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 15:46:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Jul 2021 15:46:59 +0800
From:   Moudy Ho <moudy.ho@mediatek.com>
To:     <moudy.ho@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>
CC:     Maoguang Meng <maoguang.meng@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tfiga@chromium.org>,
        <drinkcat@chromium.org>, <acourbot@chromium.org>,
        <pihsun@chromium.org>, <menghui.lin@mediatek.com>,
        <sj.huang@mediatek.com>, <ben.lok@mediatek.com>,
        <randy.wu@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v5 1/3] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
Date:   Mon, 19 Jul 2021 15:46:38 +0800
Message-ID: <20210719074640.25058-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210719074640.25058-1-moudy.ho@mediatek.com>
References: <20210719074640.25058-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds DT binding document for Media Data Path 3 (MDP3)
a unit in multimedia system used for scaling and color format convert.

Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../bindings/media/mediatek-mdp3.yaml         | 274 ++++++++++++++++++
 1 file changed, 274 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp3.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp3.yaml b/Documentation/devicetree/bindings/media/mediatek-mdp3.yaml
new file mode 100644
index 000000000000..e3e10f0544ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-mdp3.yaml
@@ -0,0 +1,274 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  Media Data Path 3 (MDP3) is used for scaling and color space conversion.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+          # controller node
+          - mediatek,mt8183-mdp3
+        - enum:
+          - mediatek,mt8183-mdp3-rdma
+
+      - items:
+        - enum:
+          # read DMA
+          - mediatek,mt8183-mdp3-rdma
+          # frame resizer
+          - mediatek,mt8183-mdp3-rsz
+          # write DMA
+          - mediatek,mt8183-mdp3-wdma
+          # write DMA with frame rotation
+          - mediatek,mt8183-mdp3-wrot
+          # color correction with 3X3 matrix
+          - mediatek,mt8183-mdp3-ccorr
+
+  mediatek,scp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
+    description: |
+      The node of system control processor (SCP), using
+      the remoteproc & rpmsg framework.
+      $ref: /schemas/remoteproc/mtk,scp.yaml
+
+  mediatek,mdp3-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+    description: |
+      HW index to distinguish same functionality modules.
+
+  mdp3-comps:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: |
+      Subcomponent, the number aligns with
+      mdp_sub_comp_dt_ids[] in mtk-mdp3-comp.c.
+
+  mdp3-comp-ids:
+    maxItems: 1
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      Index of the modules, the number list in
+      mdp_comp_matches[] in mtk-mdp3-comp.c.
+
+  reg:
+    description: |
+      Physical base address and length of the function block
+      register space, the number aligns with the component
+      and its own subcomponent.
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      sub-system id corresponding to the global command engine (GCE)
+      register address.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 6
+
+  iommus:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Should point to the respective IOMMU block with master
+      port as argument.
+      $ref: /schemas/iommu/mediatek,iommu.yaml
+
+  mediatek,mmsys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
+    description: |
+      The node of mux(multiplexer) controller for HW connections.
+
+  mediatek,mm-mutex:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
+    description: |
+      The node of sof(start of frame) signal controller.
+
+  mediatek,mailbox-gce:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      The node of global command engine (GCE), used to read/write
+      registers with critical time limitation.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  mboxes:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      $ref: /schemas/mailbox/mailbox.txt
+
+  gce-subsys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      sub-system id corresponding to the global command engine (GCE)
+      register address.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  mediatek,gce-events:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      In use event IDs list, all IDs are defined in
+      'dt-bindings/gce/mt8183-gce.h'.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+if:
+  properties:
+    compatible:
+      items:
+        - enum:
+          - mediatek,mt8183-mdp3
+        - enum:
+          - mediatek,mt8183-mdp3-rdma
+
+then:
+  required:
+    - mediatek,scp
+    - mediatek,mmsys
+    - mediatek,mm-mutex
+    - mediatek,gce-events
+    - mediatek,mailbox-gce
+    - mboxes
+    - gce-subsys
+
+required:
+  - compatible
+  - mediatek,mdp3-id
+  - reg
+  - clocks
+  - mediatek,gce-client-reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/gce/mt8183-gce.h>
+    #include <dt-bindings/power/mt8183-power.h>
+    #include <dt-bindings/memory/mt8183-larb-port.h>
+
+    mdp3_rdma0: mdp3_rdma0@14001000 {
+      compatible = "mediatek,mt8183-mdp3",
+                   "mediatek,mt8183-mdp3-rdma";
+      mediatek,scp = <&scp>;
+      mediatek,mdp3-id = <0>;
+      mdp3-comps = "mediatek,mt8183-mdp3-dl", "mediatek,mt8183-mdp3-dl1",
+                   "mediatek,mt8183-mdp3-imgi", "mediatek,mt8183-mdp3-exto";
+      mdp3-comp-ids = <0 1 0 1>;
+      reg = <0x14001000 0x1000>,
+            <0x14000000 0x1000>,
+            <0x15020000 0x1000>;
+      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>,
+                                <&gce SUBSYS_1400XXXX 0 0x1000>,
+                                <&gce SUBSYS_1502XXXX 0 0x1000>;
+      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+      clocks = <&mmsys CLK_MM_MDP_RDMA0>,
+               <&mmsys CLK_MM_MDP_RSZ1>,
+               <&mmsys CLK_MM_MDP_DL_TXCK>,
+               <&mmsys CLK_MM_MDP_DL_RX>,
+               <&mmsys CLK_MM_IPU_DL_TXCK>,
+               <&mmsys CLK_MM_IPU_DL_RX>;
+      iommus = <&iommu>;
+      mediatek,mmsys = <&mmsys>;
+      mediatek,mm-mutex = <&mutex>;
+      mediatek,mailbox-gce = <&gce>;
+      mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
+               <&gce 21 CMDQ_THR_PRIO_LOWEST 0>,
+               <&gce 22 CMDQ_THR_PRIO_LOWEST 0>,
+               <&gce 23 CMDQ_THR_PRIO_LOWEST 0>;
+      gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
+                   <&gce 0x14010000 SUBSYS_1401XXXX>,
+                   <&gce 0x14020000 SUBSYS_1402XXXX>,
+                   <&gce 0x15020000 SUBSYS_1502XXXX>;
+      mediatek,gce-events = <CMDQ_EVENT_MDP_RDMA0_SOF>,
+                            <CMDQ_EVENT_MDP_RDMA0_EOF>,
+                            <CMDQ_EVENT_MDP_RSZ0_SOF>,
+                            <CMDQ_EVENT_MDP_RSZ1_SOF>,
+                            <CMDQ_EVENT_MDP_TDSHP_SOF>,
+                            <CMDQ_EVENT_MDP_WROT0_SOF>,
+                            <CMDQ_EVENT_MDP_WROT0_EOF>,
+                            <CMDQ_EVENT_MDP_WDMA0_SOF>,
+                            <CMDQ_EVENT_MDP_WDMA0_EOF>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_0>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_1>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_2>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_3>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_4>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_5>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_6>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_7>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_8>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_9>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_10>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_11>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_12>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_13>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_14>,
+                            <CMDQ_EVENT_WPE_A_DONE>,
+                            <CMDQ_EVENT_SPE_B_DONE>;
+    };
+
+    mdp3_rsz0: mdp3_rsz0@14003000 {
+      compatible = "mediatek,mt8183-mdp3-rsz";
+      mediatek,mdp3-id = <0>;
+      reg = <0x14003000 0x1000>;
+      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>;
+      clocks = <&mmsys CLK_MM_MDP_RSZ0>;
+    };
+
+    mdp3_rsz1: mdp3_rsz1@14004000 {
+      compatible = "mediatek,mt8183-mdp3-rsz";
+      mediatek,mdp3-id = <1>;
+      reg = <0x14004000 0x1000>;
+      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x4000 0x1000>;
+      clocks = <&mmsys CLK_MM_MDP_RSZ1>;
+    };
+
+    mdp3_wrot0: mdp3_wrot0@14005000 {
+      compatible = "mediatek,mt8183-mdp3-wrot";
+      mediatek,mdp3-id = <0>;
+      mdp3-comps = "mediatek,mt8183-mdp3-path";
+      mdp3-comp-ids = <0>;
+      reg = <0x14005000 0x1000>;
+      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
+      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+      clocks = <&mmsys CLK_MM_MDP_WROT0>;
+      iommus = <&iommu>;
+    };
+
+    mdp3_wdma: mdp3_wdma@14006000 {
+      compatible = "mediatek,mt8183-mdp3-wdma";
+      mediatek,mdp3-id = <0>;
+      mdp3-comps = "mediatek,mt8183-mdp3-path";
+      mdp3-comp-ids = <1>;
+      reg = <0x14006000 0x1000>;
+      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
+      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+      clocks = <&mmsys CLK_MM_MDP_WDMA0>;
+      iommus = <&iommu>;
+    };
+
+    mdp3_ccorr: mdp3_ccorr@1401c000 {
+      compatible = "mediatek,mt8183-mdp3-ccorr";
+      mediatek,mdp3-id = <0>;
+      reg = <0x1401c000 0x1000>;
+      mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000 0x1000>;
+      clocks = <&mmsys CLK_MM_MDP_CCORR>;
+    };
+
-- 
2.18.0

