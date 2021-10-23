Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98289438358
	for <lists+linux-media@lfdr.de>; Sat, 23 Oct 2021 13:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhJWLRR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Oct 2021 07:17:17 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:39196 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230496AbhJWLRM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Oct 2021 07:17:12 -0400
X-UUID: 3880fae249eb49d98bf7b6952f17da58-20211023
X-UUID: 3880fae249eb49d98bf7b6952f17da58-20211023
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <flora.fu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1350239767; Sat, 23 Oct 2021 19:14:51 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sat, 23 Oct 2021 19:14:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 23 Oct 2021 19:14:50 +0800
From:   Flora Fu <flora.fu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
CC:     <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, Flora Fu <flora.fu@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>,
        Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
Subject: [RFC 02/13] dt-bindings: soc: mediatek: apusys: Add new document for APU power
Date:   Sat, 23 Oct 2021 19:13:58 +0800
Message-ID: <20211023111409.30463-3-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211023111409.30463-1-flora.fu@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new document for APU power controller.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 .../soc/mediatek/mediatek,apu-pwr.yaml        | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml
new file mode 100644
index 000000000000..0fd5af5138e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# # Copyright 2021 MediaTek Inc.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/mediatek/mediatek,apu-pwr.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Mediatek APU Power
+
+description: |
+  Mediatek AI Process Unit (APU) power driver support for subsys clock and
+  regulator controller. It will has device link to iommu-apu and apusys-rv
+  tinysys driver to ensure the power state is ready for hardware
+  in sub modules.
+
+maintainers:
+  - Flora Fu <flora.fu@mediatek.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,apusys-power
+      - items:
+          - const: mediatek,apusys-power
+          - const: mediatek,mt8192-apu-power
+
+  reg:
+    minItems: 1
+
+  reg-names:
+    minItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  vvpu-supply:
+    description: apu vpu regulator supply.
+
+  vmdla-supply:
+    description: apu mdla regulator supply.
+
+  clocks:
+    description: Contains module clock source and clock names
+
+  clock-names:
+    description: Names of the clocks list in clocks property
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - vvpu-supply
+  - vmdla-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8192-clk.h>
+    apusys_power: apusys_power@190f1000 {
+      compatible = "mediatek,apusys-power",
+                   "mediatek,mt8192-apu-power";
+      reg = <0x190f1000 0x1000>;
+      reg-names = "apu_pcu";
+      power-domains = <&apuspm 0>;
+      vvpu-supply = <&mt6359_vproc1_buck_reg>;
+      vmdla-supply = <&mt6359_vproc2_buck_reg>;
+      clocks = <&topckgen CLK_TOP_DSP_SEL>,
+               <&topckgen CLK_TOP_DSP1_SEL>,
+               <&topckgen CLK_TOP_DSP1_NPUPLL_SEL>,
+               <&topckgen CLK_TOP_DSP2_SEL>,
+               <&topckgen CLK_TOP_DSP2_NPUPLL_SEL>,
+               <&topckgen CLK_TOP_DSP5_SEL>,
+               <&topckgen CLK_TOP_DSP5_APUPLL_SEL>,
+               <&topckgen CLK_TOP_IPU_IF_SEL>,
+               <&clk26m>;
+      clock-names = "clk_top_dsp_sel",
+                    "clk_top_dsp1_sel",
+                    "clk_top_dsp1_npupll_sel",
+                    "clk_top_dsp2_sel",
+                    "clk_top_dsp2_npupll_sel",
+                    "clk_top_dsp5_sel",
+                    "clk_top_dsp5_apupll_sel",
+                    "clk_top_ipu_if_sel",
+                    "clk_top_clk26m";
+    };
-- 
2.18.0

