Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C68733DAC3
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 18:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239223AbhCPRVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 13:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239156AbhCPRUg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 13:20:36 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D958C0613EE
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:20:33 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id e19so73559228ejt.3
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V6XojgBZlKS1c+rj8f9Sd+PXlRuFOXcMh5OjKQ0BpWY=;
        b=TZZwnSnqBQwadLbeMJJUxbB+7cwCY2uijtlGYxXHrMzxBtqtF2iDZr5MtT3xcExy+B
         P+9TdpbPzui1dulT15OOGuqA+RsQGvNiSX7uiS8Jd13Sx9EhPkAxLBAlQUIu71WWhmGe
         1XSo+FDHo6dqLTg6pDdCrQH9/Zs8l8LqpL3aO+QafBaajghMxv3B0LmK/1iBoFZYJudT
         CmFa8hjMcR3ZZZ0JmqfEDcs8QenvnScCQOhBPIJSI0Kgn3R6SfTiKoGooZIvTSFB4RHE
         ukl7pZwCbxTk7Ukn602rAGYvciM3EBHWHKE4jclPDyd1cxhPMPGHay1A1JtsNJBjSJBw
         9H1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V6XojgBZlKS1c+rj8f9Sd+PXlRuFOXcMh5OjKQ0BpWY=;
        b=oFSkxu74iS4gp/gLv4VlqlDiKrGoRXnWRtIi65S3tCrc7D+R8EK1MO29ubsp63yKMB
         GoQgXB+ktQpceZuPaAFcCmvSEhjCgzxQN4n2ykL6JRU1ty/ON+7CjmBUqJJGy7eEPXpN
         9dVqbAVWBcLkbIUm6bMufvUpCeO2FJX2pwS88s+9zx40xef1w0RgWeSJUKSg9y8he2e8
         fUSP5XfLG4iR5CxN44JxOSx4SrELPjyRGM7CZUXa7CGXFQ1m+XuRMZ/1PRPiO9fKaDTI
         tn4NenqSwnJZHgblkMNFsjP2xjFrg1iJIQvP4a4NnHurXhNS6QMBqtrAhmSNtCbh2q58
         +y2A==
X-Gm-Message-State: AOAM5316MA3X0FgklRSFDMExmlaCulYWxrqb9/rO1oZyRxINBfi/y3Ug
        7ZxHTrDH9nzDj51ad/8144o1VA==
X-Google-Smtp-Source: ABdhPJz2ybAD7roNS47d8kCXjgNYdSBD0Osw66r8IRDeMjcOHDFhO1ts6Ex0842hyx129XoDqrVN2A==
X-Received: by 2002:a17:906:4ada:: with SMTP id u26mr31124480ejt.129.1615915232605;
        Tue, 16 Mar 2021 10:20:32 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id u1sm10571584edv.90.2021.03.16.10.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 10:20:32 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v9 17/22] dt-bindings: media: camss: Add qcom,sdm845-camss binding
Date:   Tue, 16 Mar 2021 18:19:26 +0100
Message-Id: <20210316171931.812748-18-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210316171931.812748-1-robert.foss@linaro.org>
References: <20210316171931.812748-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings for qcom,sdm845-camss in order to support the camera
subsystem for SDM845.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---


Changes since v2:
 - Rob: Removed extra empty lines at end of file
 - Rob: Add new line at end of file
 - Rob: Remove redundant descriptions
 - Rob: Add power domain description
 - Rob: Make clock-lanes a constant
 - Rob: Rework to conform to new port schema
 - Add max & minItems to data-lanes
 - Remove ports requirement - endpoint & reg
 - Add proper commit message
 - Remove Todor as binding maintainer

Changes since v3:
 - Fixed ordering of IRQs

Changes since v4:
 - Rob: Added r-b

Changes since v5:
 - Force CSI clock to use pin 7



 .../bindings/media/qcom,sdm845-camss.yaml     | 371 ++++++++++++++++++
 1 file changed, 371 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
new file mode 100644
index 000000000000..9ca5dfa7f226
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -0,0 +1,371 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,sdm845-camss.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm CAMSS ISP
+
+maintainers:
+  - Robert Foss <robert.foss@linaro.org>
+
+description: |
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
+
+properties:
+  compatible:
+    const: qcom,sdm845-camss
+
+  clocks:
+    minItems: 36
+    maxItems: 36
+
+  clock-names:
+    items:
+      - const: camnoc_axi
+      - const: cpas_ahb
+      - const: cphy_rx_src
+      - const: csi0
+      - const: csi0_src
+      - const: csi1
+      - const: csi1_src
+      - const: csi2
+      - const: csi2_src
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy0_timer_src
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy1_timer_src
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy2_timer_src
+      - const: csiphy3
+      - const: csiphy3_timer
+      - const: csiphy3_timer_src
+      - const: gcc_camera_ahb
+      - const: gcc_camera_axi
+      - const: slow_ahb_src
+      - const: soc_ahb
+      - const: vfe0_axi
+      - const: vfe0
+      - const: vfe0_cphy_rx
+      - const: vfe0_src
+      - const: vfe1_axi
+      - const: vfe1
+      - const: vfe1_cphy_rx
+      - const: vfe1_src
+      - const: vfe_lite
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_src
+
+  interrupts:
+    minItems: 10
+    maxItems: 10
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite
+
+  iommus:
+    maxItems: 4
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
+                items:
+                  - const: 7
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
+  reg:
+    minItems: 10
+    maxItems: 10
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite
+
+  vdda-supply:
+    description:
+      Definition of the regulator used as analog power supply.
+
+required:
+  - clock-names
+  - clocks
+  - compatible
+  - interrupt-names
+  - interrupts
+  - iommus
+  - power-domains
+  - reg
+  - reg-names
+  - vdda-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      camss: camss@a00000 {
+        compatible = "qcom,sdm845-camss";
+
+        clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
+          <&clock_camcc CAM_CC_CPAS_AHB_CLK>,
+          <&clock_camcc CAM_CC_CPHY_RX_CLK_SRC>,
+          <&clock_camcc CAM_CC_IFE_0_CSID_CLK>,
+          <&clock_camcc CAM_CC_IFE_0_CSID_CLK_SRC>,
+          <&clock_camcc CAM_CC_IFE_1_CSID_CLK>,
+          <&clock_camcc CAM_CC_IFE_1_CSID_CLK_SRC>,
+          <&clock_camcc CAM_CC_IFE_LITE_CSID_CLK>,
+          <&clock_camcc CAM_CC_IFE_LITE_CSID_CLK_SRC>,
+          <&clock_camcc CAM_CC_CSIPHY0_CLK>,
+          <&clock_camcc CAM_CC_CSI0PHYTIMER_CLK>,
+          <&clock_camcc CAM_CC_CSI0PHYTIMER_CLK_SRC>,
+          <&clock_camcc CAM_CC_CSIPHY1_CLK>,
+          <&clock_camcc CAM_CC_CSI1PHYTIMER_CLK>,
+          <&clock_camcc CAM_CC_CSI1PHYTIMER_CLK_SRC>,
+          <&clock_camcc CAM_CC_CSIPHY2_CLK>,
+          <&clock_camcc CAM_CC_CSI2PHYTIMER_CLK>,
+          <&clock_camcc CAM_CC_CSI2PHYTIMER_CLK_SRC>,
+          <&clock_camcc CAM_CC_CSIPHY3_CLK>,
+          <&clock_camcc CAM_CC_CSI3PHYTIMER_CLK>,
+          <&clock_camcc CAM_CC_CSI3PHYTIMER_CLK_SRC>,
+          <&gcc GCC_CAMERA_AHB_CLK>,
+          <&gcc GCC_CAMERA_AXI_CLK>,
+          <&clock_camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+          <&clock_camcc CAM_CC_SOC_AHB_CLK>,
+          <&clock_camcc CAM_CC_IFE_0_AXI_CLK>,
+          <&clock_camcc CAM_CC_IFE_0_CLK>,
+          <&clock_camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+          <&clock_camcc CAM_CC_IFE_0_CLK_SRC>,
+          <&clock_camcc CAM_CC_IFE_1_AXI_CLK>,
+          <&clock_camcc CAM_CC_IFE_1_CLK>,
+          <&clock_camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+          <&clock_camcc CAM_CC_IFE_1_CLK_SRC>,
+          <&clock_camcc CAM_CC_IFE_LITE_CLK>,
+          <&clock_camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+          <&clock_camcc CAM_CC_IFE_LITE_CLK_SRC>;
+
+        clock-names = "camnoc_axi",
+          "cpas_ahb",
+          "cphy_rx_src",
+          "csi0",
+          "csi0_src",
+          "csi1",
+          "csi1_src",
+          "csi2",
+          "csi2_src",
+          "csiphy0",
+          "csiphy0_timer",
+          "csiphy0_timer_src",
+          "csiphy1",
+          "csiphy1_timer",
+          "csiphy1_timer_src",
+          "csiphy2",
+          "csiphy2_timer",
+          "csiphy2_timer_src",
+          "csiphy3",
+          "csiphy3_timer",
+          "csiphy3_timer_src",
+          "gcc_camera_ahb",
+          "gcc_camera_axi",
+          "slow_ahb_src",
+          "soc_ahb",
+          "vfe0_axi",
+          "vfe0",
+          "vfe0_cphy_rx",
+          "vfe0_src",
+          "vfe1_axi",
+          "vfe1",
+          "vfe1_cphy_rx",
+          "vfe1_src",
+          "vfe_lite",
+          "vfe_lite_cphy_rx",
+          "vfe_lite_src";
+
+        interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
+
+        interrupt-names = "csid0",
+          "csid1",
+          "csid2",
+          "csiphy0",
+          "csiphy1",
+          "csiphy2",
+          "csiphy3",
+          "vfe0",
+          "vfe1",
+          "vfe_lite";
+
+        iommus = <&apps_smmu 0x0808 0x0>,
+          <&apps_smmu 0x0810 0x8>,
+          <&apps_smmu 0x0c08 0x0>,
+          <&apps_smmu 0x0c10 0x8>;
+
+        power-domains = <&clock_camcc IFE_0_GDSC>,
+          <&clock_camcc IFE_1_GDSC>,
+          <&clock_camcc TITAN_TOP_GDSC>;
+
+        reg = <0 0xacb3000 0 0x1000>,
+          <0 0xacba000 0 0x1000>,
+          <0 0xacc8000 0 0x1000>,
+          <0 0xac65000 0 0x1000>,
+          <0 0xac66000 0 0x1000>,
+          <0 0xac67000 0 0x1000>,
+          <0 0xac68000 0 0x1000>,
+          <0 0xacaf000 0 0x4000>,
+          <0 0xacb6000 0 0x4000>,
+          <0 0xacc4000 0 0x4000>;
+
+        reg-names = "csid0",
+          "csid1",
+          "csid2",
+          "csiphy0",
+          "csiphy1",
+          "csiphy2",
+          "csiphy3",
+          "vfe0",
+          "vfe1",
+          "vfe_lite";
+
+        vdda-supply = <&reg_2v8>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+        };
+      };
+    };
-- 
2.27.0

