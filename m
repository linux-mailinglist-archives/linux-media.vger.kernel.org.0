Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D26247CA4A
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 01:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239592AbhLVAft (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 19:35:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239485AbhLVAfs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 19:35:48 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007CFC061574
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:35:47 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id g132so493360wmg.2
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JxEWAeNVJKEIf23MftqiE+2szf+/v3JYv1Krjzg8Yls=;
        b=keuLj/qult47zXmkaNuY2yYJLz9052tOkPktP2mGnu8WHlo79TFHe5Y060O9RLMZnN
         Y5TdOQuVhzO/cFCux7mAVKob6JQB9mRVOOfS+2Z6f+ap56sJeL7WTWBcGRTk0+KJbvVw
         jQoLMsmY4p/pzof6ILTQfVupX3EdNZpw/rBAocHOTSmH66qYWmHr7GuVwTVpeRDDHb6f
         2w94jHz2tTmHQNxO4PmzyofDanqDLa1ANFSiCBT8mq3gyZkojkpLEQuH4DHKLe898I+D
         GqnhbhD7nb4vAUIq5/zSIe+mJubeIufpV/e+mOS4/LiR2whIbW1HfSWxvqzQYylEUlMe
         G99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JxEWAeNVJKEIf23MftqiE+2szf+/v3JYv1Krjzg8Yls=;
        b=mdOZe42k1whpewXioJLIsBLlqCibN39B7XjMzR/csI8IkWPl/Y0h2JY7DiwT7D/6vh
         nZFcN9saDtBcb+g0KI9el6LCAPBG4u8f6taRYLKahbca2WKLSidr8gyO33kyrZAZCFhl
         WesKjXjZYowQ+8oVp5aTg7vW0GFDV1TpIbLxDcKH9jXx/XFg40cbt8o4d28i7UuPgcve
         q/tgzvndbowSoTkTsFw0xB71e3SH9uP9fPIPsbOCifelhXLZiQ7iJE/KsedpHJsq1ril
         Rcz7NzzGz8fePUmQXzWPtleXqL9czxn3m6w63/BuQVx0S2hy7V4qVDXnFxDGbxtEPHYY
         p8NA==
X-Gm-Message-State: AOAM533gW9cskUzwiZBjaqm2MY0xvD6bYxrWjYt9YrpgnmFIyHQioiMc
        /Q0XAbgThUk6CQWY490Lsr05pw==
X-Google-Smtp-Source: ABdhPJzR+bYDZCkRVhl4FfprueAdtn70+OXPeZtqEX01+E9Qo2Hd++2u61hiUFt0iuLa6ntV7ecZUQ==
X-Received: by 2002:a05:600c:296:: with SMTP id 22mr614046wmk.11.1640133346508;
        Tue, 21 Dec 2021 16:35:46 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:35:45 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 01/19] media: dt-bindings: media: camss: Add qcom,sm8250-camss binding
Date:   Wed, 22 Dec 2021 00:37:33 +0000
Message-Id: <20211222003751.2461466-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Add bindings for qcom,sm8250-camss in order to support the camera
subsystem for SM8250.

Cc: devicetree@vger.kernel.org
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/qcom,sm8250-camss.yaml     | 450 ++++++++++++++++++
 1 file changed, 450 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
new file mode 100644
index 0000000000000..af877d61b607d
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

