Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD742FDBA1
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 22:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733228AbhATU45 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 15:56:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388922AbhATNu7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 08:50:59 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470FAC061348
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:44:56 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id s24so3325301wmj.0
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vS5JLIQay/clNfSj2FK4KXRcBfzzM4LSmVbECav54Fs=;
        b=qbhM2UzZ/+IuV/zP8Kubj/k0sjCkya+rt42hZpJhKoxKK2McG3NNS1bSzP+8vCKa9d
         SsYxsfGjZzFYo5fTrKgppuYMZgTMgl535Z7SddcAaxKEHFJe+VNRXRbmPMhzXGT8Ysip
         Wwm9excv3T4gi0swGr+EL9ZrnkTcCmXnsHGftyMC32Vgo65TFuWeFHqkjQYGnpRnu8xB
         u24c4YmCTVgceK+Om9ermyM++zrL7jJmJp+ptigatyvTL4/7GV3sFZpamrQQwOTueJO7
         uoPNjNQWOZ2DJ5IlYnY0J7SLcXyB7D4nI1MaMywWGT7ePyVlUKSBkkJgaf473qf+jdZP
         DA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vS5JLIQay/clNfSj2FK4KXRcBfzzM4LSmVbECav54Fs=;
        b=VZ86j2b61xSQgi6bZrGVF52J76Kd9fSRAiA33H97PHC9ZxF6esYMWx0WA2C38MeP0u
         OqoZu/G7guf8/EEIWqcDWPNFzyzuwRch1j0SP3i9pCNf12aKylX64k8oMNZLZ5h7fu4a
         SroingF67SFs+jj8NKk4xbkBSBXqlRb+vdx4xSO2c051E+Fcn+6Gw+5ogRxMStErP6Jc
         TpQxrpjd+EhwbB8hvwDneWonAAwpwTan7nE6oy9khANzMQF5M4ZSRWTbBORAPyWgufHA
         YgZGrrBvudVfUs16sZ6g164XiOKlRWusuaGAtfsuy3Ya0PalnqMHJ6fWHtt9imi+F7Se
         8f+w==
X-Gm-Message-State: AOAM531vEI6CxfRT1Jts/MtYoh9iMlQOPqAoQPuVpDiqaEC1ZCiORnqX
        OIGf7yfeMt7k7M8HoCbjeJPUPA==
X-Google-Smtp-Source: ABdhPJyfIzOErsdmM+CIXJIn9n5Ply5Pmm555hvnXCO/Xn1C1gx9pAzezbk1BsH6VWS+46p/cwxx3Q==
X-Received: by 2002:a1c:a501:: with SMTP id o1mr4480684wme.21.1611150295019;
        Wed, 20 Jan 2021 05:44:55 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:93b3:1f80:ae7b:a5c6])
        by smtp.gmail.com with ESMTPSA id t67sm4224075wmt.28.2021.01.20.05.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 05:44:54 -0800 (PST)
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
Subject: [PATCH v2 15/22] dt-bindings: media: camss: Add qcom,sdm660-camss binding
Date:   Wed, 20 Jan 2021 14:43:50 +0100
Message-Id: <20210120134357.1522254-15-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120134357.1522254-1-robert.foss@linaro.org>
References: <20210120134357.1522254-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings for qcom,sdm660-camss in order to support the camera
subsystem on SDM630/660 and SDA variants.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

Changes since v1:
 - Laurent: Reworked driver to use dtschema


 .../bindings/media/qcom,sdm660-camss.yaml     | 416 ++++++++++++++++++
 1 file changed, 416 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
new file mode 100644
index 000000000000..105ce84f9b71
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
@@ -0,0 +1,416 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,sdm660-camss.yaml#"
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
+    const: qcom,sdm660-camss
+
+  clocks:
+    description:
+      Input clocks for the hardware block.
+    minItems: 42
+    maxItems: 42
+
+  clock-names:
+    description:
+      Names of input clocks for the hardware block.
+    items:
+      - const: ahb
+      - const: cphy_csid0
+      - const: cphy_csid1
+      - const: cphy_csid2
+      - const: cphy_csid3
+      - const: csi0_ahb
+      - const: csi0
+      - const: csi0_phy
+      - const: csi0_pix
+      - const: csi0_rdi
+      - const: csi1_ahb
+      - const: csi1
+      - const: csi1_phy
+      - const: csi1_pix
+      - const: csi1_rdi
+      - const: csi2_ahb
+      - const: csi2
+      - const: csi2_phy
+      - const: csi2_pix
+      - const: csi2_rdi
+      - const: csi3_ahb
+      - const: csi3
+      - const: csi3_phy
+      - const: csi3_pix
+      - const: csi3_rdi
+      - const: csiphy0_timer
+      - const: csiphy1_timer
+      - const: csiphy2_timer
+      - const: csiphy_ahb2crif
+      - const: csi_vfe0
+      - const: csi_vfe1
+      - const: ispif_ahb
+      - const: throttle_axi
+      - const: top_ahb
+      - const: vfe0_ahb
+      - const: vfe0
+      - const: vfe0_stream
+      - const: vfe1_ahb
+      - const: vfe1
+      - const: vfe1_stream
+      - const: vfe_ahb
+      - const: vfe_axi
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
+      - const: csid3
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: ispif
+      - const: vfe0
+      - const: vfe1
+
+  iommus:
+    maxItems: 4
+
+  power-domains:
+    maxItems: 2
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
+    minItems: 14
+    maxItems: 14
+
+  reg-names:
+    items:
+      - const: csi_clk_mux
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid3
+      - const: csiphy0
+      - const: csiphy0_clk_mux
+      - const: csiphy1
+      - const: csiphy1_clk_mux
+      - const: csiphy2
+      - const: csiphy2_clk_mux
+      - const: ispif
+      - const: vfe0
+      - const: vfe1
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
+    #include <dt-bindings/clock/qcom,gcc-sdm660.h>
+    #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
+
+    camss: camss@ca00000 {
+      compatible = "qcom,sdm660-camss";
+
+      clocks = <&mmcc CAMSS_AHB_CLK>,
+        <&mmcc CAMSS_CPHY_CSID0_CLK>,
+        <&mmcc CAMSS_CPHY_CSID1_CLK>,
+        <&mmcc CAMSS_CPHY_CSID2_CLK>,
+        <&mmcc CAMSS_CPHY_CSID3_CLK>,
+        <&mmcc CAMSS_CSI0_AHB_CLK>,
+        <&mmcc CAMSS_CSI0_CLK>,
+        <&mmcc CAMSS_CPHY_CSID0_CLK>,
+        <&mmcc CAMSS_CSI0PIX_CLK>,
+        <&mmcc CAMSS_CSI0RDI_CLK>,
+        <&mmcc CAMSS_CSI1_AHB_CLK>,
+        <&mmcc CAMSS_CSI1_CLK>,
+        <&mmcc CAMSS_CPHY_CSID1_CLK>,
+        <&mmcc CAMSS_CSI1PIX_CLK>,
+        <&mmcc CAMSS_CSI1RDI_CLK>,
+        <&mmcc CAMSS_CSI2_AHB_CLK>,
+        <&mmcc CAMSS_CSI2_CLK>,
+        <&mmcc CAMSS_CPHY_CSID2_CLK>,
+        <&mmcc CAMSS_CSI2PIX_CLK>,
+        <&mmcc CAMSS_CSI2RDI_CLK>,
+        <&mmcc CAMSS_CSI3_AHB_CLK>,
+        <&mmcc CAMSS_CSI3_CLK>,
+        <&mmcc CAMSS_CPHY_CSID3_CLK>,
+        <&mmcc CAMSS_CSI3PIX_CLK>,
+        <&mmcc CAMSS_CSI3RDI_CLK>,
+        <&mmcc CAMSS_CSI0PHYTIMER_CLK>,
+        <&mmcc CAMSS_CSI1PHYTIMER_CLK>,
+        <&mmcc CAMSS_CSI2PHYTIMER_CLK>,
+        <&mmcc CSIPHY_AHB2CRIF_CLK>,
+        <&mmcc CAMSS_CSI_VFE0_CLK>,
+        <&mmcc CAMSS_CSI_VFE1_CLK>,
+        <&mmcc CAMSS_ISPIF_AHB_CLK>,
+        <&mmcc THROTTLE_CAMSS_AXI_CLK>,
+        <&mmcc CAMSS_TOP_AHB_CLK>,
+        <&mmcc CAMSS_VFE0_AHB_CLK>,
+        <&mmcc CAMSS_VFE0_CLK>,
+        <&mmcc CAMSS_VFE0_STREAM_CLK>,
+        <&mmcc CAMSS_VFE1_AHB_CLK>,
+        <&mmcc CAMSS_VFE1_CLK>,
+        <&mmcc CAMSS_VFE1_STREAM_CLK>,
+        <&mmcc CAMSS_VFE_VBIF_AHB_CLK>,
+        <&mmcc CAMSS_VFE_VBIF_AXI_CLK>;
+
+      clock-names = "ahb",
+        "cphy_csid0",
+        "cphy_csid1",
+        "cphy_csid2",
+        "cphy_csid3",
+        "csi0_ahb",
+        "csi0",
+        "csi0_phy",
+        "csi0_pix",
+        "csi0_rdi",
+        "csi1_ahb",
+        "csi1",
+        "csi1_phy",
+        "csi1_pix",
+        "csi1_rdi",
+        "csi2_ahb",
+        "csi2",
+        "csi2_phy",
+        "csi2_pix",
+        "csi2_rdi",
+        "csi3_ahb",
+        "csi3",
+        "csi3_phy",
+        "csi3_pix",
+        "csi3_rdi",
+        "csiphy0_timer",
+        "csiphy1_timer",
+        "csiphy2_timer",
+        "csiphy_ahb2crif",
+        "csi_vfe0",
+        "csi_vfe1",
+        "ispif_ahb",
+        "throttle_axi",
+        "top_ahb",
+        "vfe0_ahb",
+        "vfe0",
+        "vfe0_stream",
+        "vfe1_ahb",
+        "vfe1",
+        "vfe1_stream",
+        "vfe_ahb",
+        "vfe_axi";
+
+      interrupts = <GIC_SPI 296 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 297 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 298 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 299 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 80 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 314 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 315 IRQ_TYPE_EDGE_RISING>;
+
+      interrupt-names = "csid0",
+        "csid1",
+        "csid2",
+        "csid3",
+        "csiphy0",
+        "csiphy1",
+        "csiphy2",
+        "ispif",
+        "vfe0",
+        "vfe1";
+
+      iommus = <&mmss_smmu 0xc00>,
+        <&mmss_smmu 0xc01>,
+        <&mmss_smmu 0xc02>,
+        <&mmss_smmu 0xc03>;
+
+      power-domains = <&mmcc CAMSS_VFE0_GDSC>,
+        <&mmcc CAMSS_VFE1_GDSC>;
+
+      reg = <0x0ca00020 0x10>,
+        <0x0ca30000 0x100>,
+        <0x0ca30400 0x100>,
+        <0x0ca30800 0x100>,
+        <0x0ca30c00 0x100>,
+        <0x0c824000 0x1000>,
+        <0x0ca00120 0x4>,
+        <0x0c825000 0x1000>,
+        <0x0ca00124 0x4>,
+        <0x0c826000 0x1000>,
+        <0x0ca00128 0x4>,
+        <0x0ca31000 0x500>,
+        <0x0ca10000 0x1000>,
+        <0x0ca14000 0x1000>;
+
+      reg-names = "csi_clk_mux",
+        "csid0",
+        "csid1",
+        "csid2",
+        "csid3",
+        "csiphy0",
+        "csiphy0_clk_mux",
+        "csiphy1",
+        "csiphy1_clk_mux",
+        "csiphy2",
+        "csiphy2_clk_mux",
+        "ispif",
+        "vfe0",
+        "vfe1";
+
+      vdda-supply = <&reg_2v8>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+      };
+    };
-- 
2.27.0

