Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2909C3F5B88
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 12:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235918AbhHXKBY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 06:01:24 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:43098 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235947AbhHXKBU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 06:01:20 -0400
X-UUID: 4b188475176c4b99ae26747846d05b4a-20210824
X-UUID: 4b188475176c4b99ae26747846d05b4a-20210824
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 43432344; Tue, 24 Aug 2021 18:00:30 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 18:00:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 18:00:29 +0800
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
        <randy.wu@mediatek.com>, <srv_heupstream@mediatek.com>,
        <hsinyi@google.com>
Subject: [PATCH v7 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
Date:   Tue, 24 Aug 2021 18:00:25 +0800
Message-ID: <20210824100027.25989-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210824100027.25989-1-moudy.ho@mediatek.com>
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds DT binding document for Media Data Path 3 (MDP3)
a unit in multimedia system used for scaling and color format convert.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../bindings/media/mediatek,mdp3-ccorr.yaml   |  57 +++++
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 207 ++++++++++++++++++
 .../bindings/media/mediatek,mdp3-rsz.yaml     |  65 ++++++
 .../bindings/media/mediatek,mdp3-wdma.yaml    |  71 ++++++
 .../bindings/media/mediatek,mdp3-wrot.yaml    |  71 ++++++
 5 files changed, 471 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
new file mode 100644
index 000000000000..59fd68b46022
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-ccorr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 CCORR Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to do color correction with 3X3 matrix.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8183-mdp3-ccorr
+
+  mediatek,mdp3-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+    description: |
+      HW index to distinguish same functionality modules.
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
+  clocks:
+    minItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/gce/mt8183-gce.h>
+
+    mdp3_ccorr: mdp3_ccorr@1401c000 {
+      compatible = "mediatek,mt8183-mdp3-ccorr";
+      mediatek,mdp3-id = <0>;
+      reg = <0x1401c000 0x1000>;
+      mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000 0x1000>;
+      clocks = <&mmsys CLK_MM_MDP_CCORR>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
new file mode 100644
index 000000000000..b355d7fe791e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
@@ -0,0 +1,207 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to do read DMA.
+  RDMA0 is also used to be a controller node containing MMSYS,
+  MUTEX, GCE and SCP settings.
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
+      In MDP3, it can allocate multiple identical modules for
+      different data path selection or multi-pipeline execution.
+      This node is used to indicate the ID of each module.
+
+  mdp3-comps:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    items:
+        - enum:
+          # MDP direct-link input path selection, create a
+          # component for path connectedness of HW pipe control
+          - mediatek,mt8183-mdp3-dl1
+        - enum:
+          - mediatek,mt8183-mdp3-dl2
+        - enum:
+          # MDP direct-link output path selection, create a
+          # component for path connectedness of HW pipe control
+          - mediatek,mt8183-mdp3-path1
+        - enum:
+          - mediatek,mt8183-mdp3-path2
+        - enum:
+          # Input DMA of ISP PASS2 (DIP) module for raw image input
+          - mediatek,mt8183-mdp3-imgi
+        - enum:
+          # Output DMA of ISP PASS2 (DIP) module for YUV image output
+          - mediatek,mt8183-mdp3-exto
+
+  mdp3-comp-ids:
+    maxItems: 1
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      Pipeline ID of MDP direct-link or DIP.
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
+      mdp3-comps = "mediatek,mt8183-mdp3-dl1", "mediatek,mt8183-mdp3-dl2",
+                   "mediatek,mt8183-mdp3-path1", "mediatek,mt8183-mdp3-path2",
+                   "mediatek,mt8183-mdp3-imgi", "mediatek,mt8183-mdp3-exto";
+      mdp3-comp-ids = <0 1 0 1 0 1>;
+      reg = <0x14001000 0x1000>,
+            <0x14000000 0x1000>,
+            <0x14005000 0x1000>,
+            <0x14006000 0x1000>,
+            <0x15020000 0x1000>;
+      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>,
+                                <&gce SUBSYS_1400XXXX 0 0x1000>,
+                                <&gce SUBSYS_1400XXXX 0x5000 0x1000>,
+                                <&gce SUBSYS_1400XXXX 0x6000 0x1000>,
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
+    };
\ No newline at end of file
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
new file mode 100644
index 000000000000..c55a52cd32b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 Resizer Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to do frame resizing.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8183-mdp3-rsz
+
+  mediatek,mdp3-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+    description: |
+      HW index to distinguish same functionality modules.
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
+  clocks:
+    minItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/gce/mt8183-gce.h>
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
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
new file mode 100644
index 000000000000..93e6f331ada8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-wdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to write DMA.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8183-mdp3-wdma
+
+  mediatek,mdp3-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+    description: |
+      HW index to distinguish same functionality modules.
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
+
+  iommus:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Should point to the respective IOMMU block with master
+      port as argument.
+      $ref: /schemas/iommu/mediatek,iommu.yaml
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
+    mdp3_wdma: mdp3_wdma@14006000 {
+      compatible = "mediatek,mt8183-mdp3-wdma";
+      mediatek,mdp3-id = <0>;
+      reg = <0x14006000 0x1000>;
+      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
+      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+      clocks = <&mmsys CLK_MM_MDP_WDMA0>;
+      iommus = <&iommu>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
new file mode 100644
index 000000000000..2993da04c562
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to write DMA with frame rotation.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8183-mdp3-wrot
+
+  mediatek,mdp3-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+    description: |
+      HW index to distinguish same functionality modules.
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
+
+  iommus:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Should point to the respective IOMMU block with master
+      port as argument.
+      $ref: /schemas/iommu/mediatek,iommu.yaml
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
+    mdp3_wrot0: mdp3_wrot0@14005000 {
+      compatible = "mediatek,mt8183-mdp3-wrot";
+      mediatek,mdp3-id = <0>;
+      reg = <0x14005000 0x1000>;
+      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
+      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+      clocks = <&mmsys CLK_MM_MDP_WROT0>;
+      iommus = <&iommu>;
+    };
-- 
2.18.0

