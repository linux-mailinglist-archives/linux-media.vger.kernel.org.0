Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADC5B42F11A
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 14:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238937AbhJOMlb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 08:41:31 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:50642 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S238783AbhJOMlB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 08:41:01 -0400
X-UUID: 4913f83aa54b4e53a634425b6756e743-20211015
X-UUID: 4913f83aa54b4e53a634425b6756e743-20211015
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 950567805; Fri, 15 Oct 2021 20:38:48 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 Oct 2021 20:38:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Oct 2021 20:38:47 +0800
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
        <sj.huang@mediatek.com>, <allen-kh.cheng@mediatek.com>,
        <randy.wu@mediatek.com>, <srv_heupstream@mediatek.com>,
        <hsinyi@google.com>
Subject: [PATCH v8 5/7] dt-binding: mt8183: add Mediatek MDP3 dt-bindings
Date:   Fri, 15 Oct 2021 20:38:30 +0800
Message-ID: <20211015123832.17914-6-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211015123832.17914-1-moudy.ho@mediatek.com>
References: <20211015123832.17914-1-moudy.ho@mediatek.com>
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
 .../bindings/arm/mediatek/mediatek,ccorr.yaml |  59 +++++
 .../bindings/arm/mediatek/mediatek,rdma.yaml  | 211 ++++++++++++++++++
 .../bindings/arm/mediatek/mediatek,wdma.yaml  |  70 ++++++
 .../bindings/media/mediatek,mdp3-rsz.yaml     |  68 ++++++
 .../bindings/media/mediatek,mdp3-wrot.yaml    |  70 ++++++
 5 files changed, 478 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml
new file mode 100644
index 000000000000..40ea7955efc6
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,ccorr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek color correction
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description: |
+  Mediatek color correction with 3X3 matrix.
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
+      There may be multiple blocks with the same function but
+      different addresses in MDP3.
+      In order to distinguish the connection with other blocks,
+      a unique ID is needed to dynamically use one or more identical
+      blocks to implement multiple pipelines.
+
+  reg:
+    maxItems: 1
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      The register of client driver can be configured by gce with 4 arguments
+      defined in this property, such as phandle of gce, subsys id,
+      register offset and size.
+      Each GCE subsys id is mapping to a client defined in the header
+      include/dt-bindings/gce/<chip>-gce.h.
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
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,rdma.yaml
new file mode 100644
index 000000000000..ad0e56923494
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,rdma.yaml
@@ -0,0 +1,211 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,rdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Read Direct Memory Access
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description: |
+  Mediatek Read Direct Memory Access(RDMA) component used to do read DMA.
+  It contains one line buffer to store the sufficient pixel data, and
+  must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+  for details.
+  The 1st RDMA is also used to be a controller node in Media Data Path 3(MDP3)
+  that containing MMSYS, MUTEX, GCE and SCP settings.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8183-mdp3
+          - const: mediatek,mt8183-mdp3-rdma
+      - items:
+          - const: mediatek,mt8183-mdp3-rdma
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
+      There may be multiple blocks with the same function but
+      different addresses in MDP3.
+      In order to distinguish the connection with other blocks,
+      a unique ID is needed to dynamically use one or more identical
+      blocks to implement multiple pipelines.
+
+  mdp3-comps:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    items:
+      - enum:
+          # MDP direct-link input path selection, create a
+          # component for path connectedness of HW pipe control
+          - mediatek,mt8183-mdp3-dl1
+      - enum:
+          - mediatek,mt8183-mdp3-dl2
+      - enum:
+          # MDP direct-link output path selection, create a
+          # component for path connectedness of HW pipe control
+          - mediatek,mt8183-mdp3-path1
+      - enum:
+          - mediatek,mt8183-mdp3-path2
+      - enum:
+          # Input DMA of ISP PASS2 (DIP) module for raw image input
+          - mediatek,mt8183-mdp3-imgi
+      - enum:
+          # Output DMA of ISP PASS2 (DIP) module for YUV image output
+          - mediatek,mt8183-mdp3-exto
+    description: |
+      MTK sub-system of direct-link or DIP
+
+  mdp3-comp-ids:
+    maxItems: 1
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      Pipeline ID of MDP sub-system.
+
+  reg:
+    minItems: 1
+    maxItems: 5
+    description: |
+      1st: basic HW address
+      2nd: mediatek,mt8183-mdp-dl1, mediatek,mt8183-mdp-dl2
+      3rd: mediatek,mt8183-mdp-path1
+      4th: mediatek,mt8183-mdp-path2
+      5th: mediatek,mt8183-mdp3-imgi, mediatek,mt8183-mdp3-exto
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      The register of client driver can be configured by gce with 4 arguments
+      defined in this property, such as phandle of gce, subsys id,
+      register offset and size.
+      Each GCE subsys id is mapping to a client defined in the header
+      include/dt-bindings/gce/<chip>-gce.h.
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 6
+    description: |
+      1st: RDMA0 clock
+      2nd: RSZ1 clock
+      3rd: direck-link TX clock in MDP side
+      4th: direck-link RX clock in MDP side
+      5th: direck-link TX clock in ISP side
+      6th: direck-link RX clock in ISP side
+
+  iommus:
+    maxItems: 1
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
+
+  mboxes:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  gce-subsys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      sub-system id corresponding to the global command engine (GCE)
+      register address.
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8183-mdp3
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
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.yaml
new file mode 100644
index 000000000000..53a4eae9f963
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,wdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Write Direct Memory Access
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description: |
+  Mediatek Write Direct Memory Access(WDMA) component used to write
+  the data into DMA.
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
+      There may be multiple blocks with the same function but
+      different addresses in MDP3.
+      In order to distinguish the connection with other blocks,
+      a unique ID is needed to dynamically use one or more identical
+      blocks to implement multiple pipelines.
+
+  reg:
+    maxItems: 1
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      The register of client driver can be configured by gce with 4 arguments
+      defined in this property, such as phandle of gce, subsys id,
+      register offset and size.
+      Each GCE subsys id is mapping to a client defined in the header
+      include/dt-bindings/gce/<chip>-gce.h.
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+  iommus:
+    maxItems: 1
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
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
new file mode 100644
index 000000000000..5be288cffc38
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Resizer
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
+      There may be multiple blocks with the same function but
+      different addresses in MDP3.
+      In order to distinguish the connection with other blocks,
+      a unique ID is needed to dynamically use one or more identical
+      blocks to implement multiple pipelines.
+
+  reg:
+    maxItems: 1
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      The register of client driver can be configured by gce with 4 arguments
+      defined in this property, such as phandle of gce, subsys id,
+      register offset and size.
+      Each GCE subsys id is mapping to a client defined in the header
+      include/dt-bindings/gce/<chip>-gce.h.
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
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
new file mode 100644
index 000000000000..f9bed467c353
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Write DMA with Rotation
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
+      There may be multiple blocks with the same function but
+      different addresses in MDP3.
+      In order to distinguish the connection with other blocks,
+      a unique ID is needed to dynamically use one or more identical
+      blocks to implement multiple pipelines.
+
+  reg:
+    maxItems: 1
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      The register of client driver can be configured by gce with 4 arguments
+      defined in this property, such as phandle of gce, subsys id,
+      register offset and size.
+      Each GCE subsys id is mapping to a client defined in the header
+      include/dt-bindings/gce/<chip>-gce.h.
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+  iommus:
+    maxItems: 1
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

