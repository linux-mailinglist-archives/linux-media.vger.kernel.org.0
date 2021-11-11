Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1CA744D9DE
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234053AbhKKQLd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:11:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234046AbhKKQLc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:11:32 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BFBFC061767
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:42 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id u1so10594090wru.13
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QZGNv7etiQfpBkZsFPW+4HLp0rWIAxF+5drRAh0Nzng=;
        b=UvYgOWUNGxUcmxmtFMcsKftsXb2pgd3K3ftt5wkjqi13BxkIdvhPCxFKSxV9sv1OIb
         WMw3jcF8kbYkfRZFDMK5r49igBJT1UBhTXb9VBqfZmktsjhZNFG2Lnrk/DIMJ9ZEd3FC
         HbE+uPfTeFeym/r4cdiUWKaAdb2UA/C8BesGCLZ5/Ky4hgSQYuNmksv/hMb44aoSHylR
         gJqM9KAeSpgEkRS7Yc7gAsZIarKLrSoJthPSeVjkKSiDqr23s65lFyMS/N+7RTtkYRiz
         O034jnMFSOK9F+m0eDhY5OEAfG3Mt95QLSlngw41bKFjFwNyWhPEoi3FEU1V0XfmJe7a
         QVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QZGNv7etiQfpBkZsFPW+4HLp0rWIAxF+5drRAh0Nzng=;
        b=0Jm4fH7ODxHokOpgtXoGeT1vq6A/7N2ppxfdaG8emsHIpKAKAexTYxz+rNfpQ9VWtS
         BsdasZ0jTAdgxLw8nwgp4Z1BhoFHp1jYu16KNQcX01nKQiISJqzK33C47aOpIsD7wGuC
         UrJa0bJQjCeqGhGtp5cYvqHvSQ5cEd2TMlPS0Rx9wuDtCSNeGfNvQeBXp1MNS/aqN+gf
         l2PuCNOLBTRzktligx9gCchrla9CR1VBc2s2LgNdb7c+HrHYEEYm0d7KT/zzkMLMaBVP
         R0FD1mrpiZE1fw5V9x2YsGiwD4/keTiQztagNutAjk0lJPMkotzMhbBJaoqlskoaT64U
         NLFQ==
X-Gm-Message-State: AOAM530x7Ie/vx4gWzvdQ2J5kjpGXkh13ODplOlTtdbJ6H55SXIJ3Gx0
        JfxJy1HskDurZScU+JFoSTklLA==
X-Google-Smtp-Source: ABdhPJwejOvSH0fKZeiQ9gi4Jyggg9lZMm/gWskYSts13xwEYhLRH18IWcbQ2m5LZCM4GmIKeRjjpg==
X-Received: by 2002:a05:6000:110a:: with SMTP id z10mr10321530wrw.396.1636646920586;
        Thu, 11 Nov 2021 08:08:40 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x8sm3245558wrw.6.2021.11.11.08.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:08:40 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     inux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 01/18] media: dt-bindings: media: camss: Add qcom,sm8250-camss binding
Date:   Thu, 11 Nov 2021 16:10:21 +0000
Message-Id: <20211111161038.3936217-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
References: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Add bindings for qcom,sm8250-camss in order to support the camera
subsystem for SM8250.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,sm8250-camss.yaml     | 450 ++++++++++++++++++
 1 file changed, 450 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
new file mode 100644
index 000000000000..af877d61b607
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -0,0 +1,450 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm CAMSS ISP
+
+maintainers:
+  - Robert Foss <robert.foss@linaro.org>
+
+description: |
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,sm8250-camss
+
+  clocks:
+    minItems: 37
+    maxItems: 37
+
+  clock-names:
+    items:
+      - const: cam_ahb_clk
+      - const: cam_hf_axi
+      - const: cam_sf_axi
+      - const: camnoc_axi
+      - const: camnoc_axi_src
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy3
+      - const: csiphy3_timer
+      - const: csiphy4
+      - const: csiphy4_timer
+      - const: csiphy5
+      - const: csiphy5_timer
+      - const: slow_ahb_src
+      - const: vfe0_ahb
+      - const: vfe0_axi
+      - const: vfe0
+      - const: vfe0_cphy_rx
+      - const: vfe0_csid
+      - const: vfe0_areg
+      - const: vfe1_ahb
+      - const: vfe1_axi
+      - const: vfe1
+      - const: vfe1_cphy_rx
+      - const: vfe1_csid
+      - const: vfe1_areg
+      - const: vfe_lite_ahb
+      - const: vfe_lite_axi
+      - const: vfe_lite
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+
+  interrupts:
+    minItems: 14
+    maxItems: 14
+
+  interrupt-names:
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid3
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  iommus:
+    minItems: 8
+    maxItems: 8
+
+  interconnects:
+    minItems: 4
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: cam_ahb
+      - const: cam_hf_0_mnoc
+      - const: cam_sf_0_mnoc
+      - const: cam_sf_icp_mnoc
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@3:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@4:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@5:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+  reg:
+    minItems: 10
+    maxItems: 10
+
+  reg-names:
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+required:
+  - clock-names
+  - clocks
+  - compatible
+  - interconnects
+  - interconnect-names
+  - interrupts
+  - interrupt-names
+  - iommus
+  - power-domains
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss: camss@ac6a000 {
+            compatible = "qcom,sm8250-camss";
+
+            reg = <0 0xac6a000 0 0x2000>,
+                  <0 0xac6c000 0 0x2000>,
+                  <0 0xac6e000 0 0x1000>,
+                  <0 0xac70000 0 0x1000>,
+                  <0 0xac72000 0 0x1000>,
+                  <0 0xac74000 0 0x1000>,
+                  <0 0xacb4000 0 0xd000>,
+                  <0 0xacc3000 0 0xd000>,
+                  <0 0xacd9000 0 0x2200>,
+                  <0 0xacdb200 0 0x2200>;
+            reg-names = "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "csiphy3",
+                        "csiphy4",
+                        "csiphy5",
+                        "vfe0",
+                        "vfe1",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "csiphy3",
+                              "csiphy4",
+                              "csiphy5",
+                              "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid3",
+                              "vfe0",
+                              "vfe1",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            power-domains = <&camcc IFE_0_GDSC>,
+                            <&camcc IFE_1_GDSC>,
+                            <&camcc TITAN_TOP_GDSC>;
+
+            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                     <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                     <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
+                     <&camcc CAM_CC_CORE_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_CSIPHY0_CLK>,
+                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY1_CLK>,
+                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY2_CLK>,
+                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY3_CLK>,
+                     <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY4_CLK>,
+                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY5_CLK>,
+                     <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+                     <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+                     <&camcc CAM_CC_IFE_0_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_0_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_0_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_0_AREG_CLK>,
+                     <&camcc CAM_CC_IFE_1_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_1_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_1_CLK>,
+                     <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_1_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_1_AREG_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+            clock-names = "cam_ahb_clk",
+                          "cam_hf_axi",
+                          "cam_sf_axi",
+                          "camnoc_axi",
+                          "camnoc_axi_src",
+                          "core_ahb",
+                          "cpas_ahb",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "csiphy3",
+                          "csiphy3_timer",
+                          "csiphy4",
+                          "csiphy4_timer",
+                          "csiphy5",
+                          "csiphy5_timer",
+                          "slow_ahb_src",
+                          "vfe0_ahb",
+                          "vfe0_axi",
+                          "vfe0",
+                          "vfe0_cphy_rx",
+                          "vfe0_csid",
+                          "vfe0_areg",
+                          "vfe1_ahb",
+                          "vfe1_axi",
+                          "vfe1",
+                          "vfe1_cphy_rx",
+                          "vfe1_csid",
+                          "vfe1_areg",
+                          "vfe_lite_ahb",
+                          "vfe_lite_axi",
+                          "vfe_lite",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid";
+
+            iommus = <&apps_smmu 0x800 0x400>,
+                     <&apps_smmu 0x801 0x400>,
+                     <&apps_smmu 0x840 0x400>,
+                     <&apps_smmu 0x841 0x400>,
+                     <&apps_smmu 0xC00 0x400>,
+                     <&apps_smmu 0xC01 0x400>,
+                     <&apps_smmu 0xC40 0x400>,
+                     <&apps_smmu 0xC41 0x400>;
+
+            interconnects = <&gem_noc MASTER_AMPSS_M0 &config_noc SLAVE_CAMERA_CFG>,
+                            <&mmss_noc MASTER_CAMNOC_HF &mc_virt SLAVE_EBI_CH0>,
+                            <&mmss_noc MASTER_CAMNOC_SF &mc_virt SLAVE_EBI_CH0>,
+                            <&mmss_noc MASTER_CAMNOC_ICP &mc_virt SLAVE_EBI_CH0>;
+            interconnect-names = "cam_ahb",
+                                 "cam_hf_0_mnoc",
+                                 "cam_sf_0_mnoc",
+                                 "cam_sf_icp_mnoc";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+            };
+        };
+    };
-- 
2.33.0

