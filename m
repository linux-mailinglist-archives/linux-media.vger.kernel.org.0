Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB352FDB9E
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 22:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733116AbhATU4w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 15:56:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389185AbhATNu7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 08:50:59 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 385FEC06134A
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:44:59 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id a9so19709261wrt.5
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+loFyb/XyYA9+SNeFfqDGg8zUbSf9smApXbMMlw/g1k=;
        b=l3UdpfRimrmV+9OH1O+9APRN9dkQYDYm0hvP+PedUaouy6w2SwWuDq41fcGWDQs97S
         ubbKJcZRt0bG20jKBwz311QPjUzzuNsXY7noXvnZx6qlxnT9xjF7puATladtv6XSWeH3
         bBGKCY7qtOoEVb07idWcMMgez4AEEQ7iNqyYxHYo5NJvActK5K6pDuDNQ7dGbblt9rZ2
         fIgmu3Am/jot3uXmElmA50R37bDwTvlS7veNA7jZzuc73hhiusSocISpJILqF+Nk4ixi
         J31VNf7+Tbq16LO8Ii4KmPG5BZw5GcxbcAC9dKvtRyyi2Bx28rAOH2SDY/wUDj41f1IY
         MEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+loFyb/XyYA9+SNeFfqDGg8zUbSf9smApXbMMlw/g1k=;
        b=Fv+pn3CsEWRTreN8a7h/MediMzpDKdFFMEkYd7xqBhvof2cGjd1GQBrmcfrNZBw5zs
         cWkCxSI5r04dic65sbjVKLkFK/Fv23pBuTajSVO6xOvQPOMSU11WRkLvI5pR1Sgr5HAN
         SRXz+2HOERba6swUxQzUg+EsP9OX3UIgUs5Xiw3/8GBFZ2iFAAvLe86O5usuUxt/Vz2D
         wWElQt2iLIIG5c2ym3+jej+lzLVahbV5pWdMli22FOL+KUPz0Z94Um8hAlhZfjWoCwXJ
         yAQKbCi4YmV8KRMQlxxkDS5qiCVhHAmzCJ4dn4IQBT5sWW/rgrGSjNawMFj5kook7Mh4
         nWYQ==
X-Gm-Message-State: AOAM5305TSw3Y6uFoAxLjlAAFEKiMrKpcvqhIZ8sRYak2ECh9NBeKTmv
        tNXIGNxiVQKg+9G71IrTCdKZBA==
X-Google-Smtp-Source: ABdhPJw1gJ7AE1CMHUZrJYUzuwzN+S0bY+eJtfZmK8lUWtAOqAbz4U922OMRBMJKVYFiD2o3gkKaKQ==
X-Received: by 2002:a5d:4fc4:: with SMTP id h4mr9037144wrw.129.1611150297963;
        Wed, 20 Jan 2021 05:44:57 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:93b3:1f80:ae7b:a5c6])
        by smtp.gmail.com with ESMTPSA id t67sm4224075wmt.28.2021.01.20.05.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 05:44:57 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        vkoul@kernel.org, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v2 16/22] dt-bindings: media: camss: Add qcom,sdm845-camss binding
Date:   Wed, 20 Jan 2021 14:43:51 +0100
Message-Id: <20210120134357.1522254-16-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120134357.1522254-1-robert.foss@linaro.org>
References: <20210120134357.1522254-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

Changes since v1:
 - Laurent: Reworked driver to use dtschema

 .../bindings/media/qcom,sdm845-camss.yaml     | 394 ++++++++++++++++++
 1 file changed, 394 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
new file mode 100644
index 000000000000..40864a5ab2c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -0,0 +1,394 @@
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
+  - Todor Tomov <todor.too@gmail.com>
+
+description: |
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
+
+properties:
+  compatible:
+    const: qcom,sdm845-camss
+
+  clocks:
+    description:
+      Input clocks for the hardware block.
+    minItems: 36
+    maxItems: 36
+
+  clock-names:
+    description:
+      Names of input clocks for the hardware block.
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
+    description:
+      IRQs for the hardware block.
+    minItems: 10
+    maxItems: 10
+
+  interrupt-names:
+    description:
+      Names of IRQs for the hardware block.
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
+    maxItems: 3
+
+  ports:
+    description:
+      The CSI data input ports.
+
+    type: object
+
+    properties:
+      port@0:
+        type: object
+        description: Input node for receiving CSI data.
+        properties:
+          endpoint:
+            type: object
+
+            properties:
+              clock-lanes:
+                description: |-
+                  The physical clock lane index.
+
+              data-lanes:
+                description: |-
+                  An array of physical data lanes indexes.
+                  Position of an entry determines the logical
+                  lane number, while the value of an entry
+                  indicates physical lane index.
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+        required:
+          - endpoint
+          - reg
+
+      port@1:
+        type: object
+        description: Input node for receiving CSI data.
+        properties:
+          endpoint:
+            type: object
+
+            properties:
+              clock-lanes:
+                description: |-
+                  The physical clock lane index.
+
+              data-lanes:
+                description: |-
+                  An array of physical data lanes indexes.
+                  Position of an entry determines the logical
+                  lane number, while the value of an entry
+                  indicates physical lane index.
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+        required:
+          - endpoint
+          - reg
+
+      port@2:
+        type: object
+        description: Input node for receiving CSI data.
+        properties:
+          endpoint:
+            type: object
+
+            properties:
+              clock-lanes:
+                description: |-
+                  The physical clock lane index.
+
+              data-lanes:
+                description: |-
+                  An array of physical data lanes indexes.
+                  Position of an entry determines the logical
+                  lane number, while the value of an entry
+                  indicates physical lane index.
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+        required:
+          - endpoint
+          - reg
+
+      port@3:
+        type: object
+        description: Input node for receiving CSI data.
+        properties:
+          endpoint:
+            type: object
+
+            properties:
+              clock-lanes:
+                description: |-
+                  The physical clock lane index.
+
+              data-lanes:
+                description: |-
+                  An array of physical data lanes indexes.
+                  Position of an entry determines the logical
+                  lane number, while the value of an entry
+                  indicates physical lane index.
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+        required:
+          - endpoint
+          - reg
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
+        interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
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
+
+
-- 
2.27.0

