Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B44FC2FDB9D
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 22:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733073AbhATU4q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 15:56:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387754AbhATNsm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 08:48:42 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5FBC06138C
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:44:52 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id j18so2895022wmi.3
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LkZ99XoWXMbOO4g7PnTiwOPZK1LCMqlyf1JEPyZMdz8=;
        b=k470PfzQJ4mPG/ZHGsLXUKxxbiF/k4+J2RxbbrL3wGFDkUVswDBGPjTGRVQ7/qO2Ew
         TuWhfbHFoFn6N17z1FLaNSATwpB4fEojNMyB6Vcv0bt5KFtEg3kYaFQMQ8wdWxmfe6PE
         rXDcTT6mXa0ejjfmYTH29reqJe5Cpf22oG+yRStac+eMEnw3nxcwThA1dVzXfXvWB6vU
         PD505fPu5BQE56y0kje8rDXLNEG1DE6LaKfpE+J1nsPWYKedWj4OiB/aSyX+Ku3VjVwO
         durkk3kDmqy/RwH4awu5MOyEDwS1iFDcWQWZzWfMcMka9fg/esHQ5mvU0LAsuc3/DDwB
         9A/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LkZ99XoWXMbOO4g7PnTiwOPZK1LCMqlyf1JEPyZMdz8=;
        b=nzcVq585IWQuywQjmWMFPFpQ9PAO8JEoI5qbg7F7iml1WPMYrVshfGKRSsOTdTd9et
         pCmb4mw3jZ9mY+QaWiDlBe9BCEpJSAKHNlLSv1epcy0d3FNVoAnJPQHgTnb06HN40Hkv
         2gBd+hvFDdgrgFcwhCQg/3aQrU92osF9MDB/LqeYsQp31QnCAdi+X8TJMxeiOFeJIgQO
         WSp+qCl5fwR+zzC0i/pJL3yfLnaZFsbS2QHET8W7jqHKInF9vdXn3BCDGZC3q0aPypq7
         DeVHS1Mw0LYvdprPGb+O+16DkaTKK3EZKIjjX+BLSX+iIxkHnMtACdc64gb/VoWNhr+z
         U+cQ==
X-Gm-Message-State: AOAM530QwVpPdIKfNV9Co52sOfa1CnMXNFyHhu4O3VcFIWxEXaYq4Ybw
        fuvWN7s0cw9v7UiSRgiaFsbPJA==
X-Google-Smtp-Source: ABdhPJyHt28Lb05HKHpDnLz50i7lYj1GT2JcZ1hAwpc+Ij034gOCGS8CLTUoznBFwsFVnHGOcqvb3A==
X-Received: by 2002:a05:600c:215:: with SMTP id 21mr4415492wmi.54.1611150291224;
        Wed, 20 Jan 2021 05:44:51 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:93b3:1f80:ae7b:a5c6])
        by smtp.gmail.com with ESMTPSA id t67sm4224075wmt.28.2021.01.20.05.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 05:44:50 -0800 (PST)
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
Subject: [PATCH v2 13/22] dt-bindings: media: camss: Add qcom,msm8916-camss binding
Date:   Wed, 20 Jan 2021 14:43:48 +0100
Message-Id: <20210120134357.1522254-13-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120134357.1522254-1-robert.foss@linaro.org>
References: <20210120134357.1522254-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings for qcom,msm8916-camss in order to support the camera
subsystem on MSM8916.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

Changes since v1:
 - Laurent: Reworked driver to use dtschema

 .../bindings/media/qcom,msm8916-camss.yaml    | 270 ++++++++++++++++++
 1 file changed, 270 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
new file mode 100644
index 000000000000..f0b0c67d0f0c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
@@ -0,0 +1,270 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,msm8916-camss.yaml#"
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
+    const: qcom,msm8916-camss
+
+  clocks:
+    description:
+      Input clocks for the hardware block.
+    minItems: 19
+    maxItems: 19
+
+  clock-names:
+    description:
+      Names of input clocks for the hardware block.
+    items:
+      - const: top_ahb
+      - const: ispif_ahb
+      - const: csiphy0_timer
+      - const: csiphy1_timer
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
+      - const: ahb
+      - const: vfe0
+      - const: csi_vfe0
+      - const: vfe_ahb
+      - const: vfe_axi
+
+  interrupts:
+    description:
+      IRQs for the hardware block.
+    minItems: 6
+    maxItems: 6
+
+  interrupt-names:
+    description:
+      Names of IRQs for the hardware block.
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csid0
+      - const: csid1
+      - const: ispif
+      - const: vfe0
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
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
+                  The physical clock lane index. The value
+                  must always be <1> as the physical
+                  clock lane is lane 1.
+
+              data-lanes:
+                description: |-
+                  An array of physical data lanes indexes.
+                  Position of an entry determines the logical
+                  lane number, while the value of an entry
+                  indicates physical lane index. Lane swapping
+                  is supported. Physical lane indexes:
+                  0, 2, 3, 4.
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
+                  The physical clock lane index. The value
+                  must always be <1> as the physical
+                  clock lane is lane 1.
+
+              data-lanes:
+                description: |-
+                  An array of physical data lanes indexes.
+                  Position of an entry determines the logical
+                  lane number, while the value of an entry
+                  indicates physical lane index. Lane swapping
+                  is supported. Physical lane indexes:
+                  0, 2, 3, 4.
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
+    minItems: 9
+    maxItems: 9
+
+  reg-names:
+    items:
+      - const: csiphy0
+      - const: csiphy0_clk_mux
+      - const: csiphy1
+      - const: csiphy1_clk_mux
+      - const: csid0
+      - const: csid1
+      - const: ispif
+      - const: csi_clk_mux
+      - const: vfe0
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
+    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
+
+    camss: camss@1b00000 {
+      compatible = "qcom,msm8916-camss";
+
+      clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+        <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
+        <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+        <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+        <&gcc GCC_CAMSS_CSI0_AHB_CLK>,
+        <&gcc GCC_CAMSS_CSI0_CLK>,
+        <&gcc GCC_CAMSS_CSI0PHY_CLK>,
+        <&gcc GCC_CAMSS_CSI0PIX_CLK>,
+        <&gcc GCC_CAMSS_CSI0RDI_CLK>,
+        <&gcc GCC_CAMSS_CSI1_AHB_CLK>,
+        <&gcc GCC_CAMSS_CSI1_CLK>,
+        <&gcc GCC_CAMSS_CSI1PHY_CLK>,
+        <&gcc GCC_CAMSS_CSI1PIX_CLK>,
+        <&gcc GCC_CAMSS_CSI1RDI_CLK>,
+        <&gcc GCC_CAMSS_AHB_CLK>,
+        <&gcc GCC_CAMSS_VFE0_CLK>,
+        <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
+        <&gcc GCC_CAMSS_VFE_AHB_CLK>,
+        <&gcc GCC_CAMSS_VFE_AXI_CLK>;
+
+      clock-names = "top_ahb",
+        "ispif_ahb",
+        "csiphy0_timer",
+        "csiphy1_timer",
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
+        "ahb",
+        "vfe0",
+        "csi_vfe0",
+        "vfe_ahb",
+        "vfe_axi";
+
+      interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
+
+      interrupt-names = "csiphy0",
+        "csiphy1",
+        "csid0",
+        "csid1",
+        "ispif",
+        "vfe0";
+
+      iommus = <&apps_iommu 3>;
+
+      power-domains = <&gcc VFE_GDSC>;
+
+      reg = <0x01b0ac00 0x200>,
+        <0x01b00030 0x4>,
+        <0x01b0b000 0x200>,
+        <0x01b00038 0x4>,
+        <0x01b08000 0x100>,
+        <0x01b08400 0x100>,
+        <0x01b0a000 0x500>,
+        <0x01b00020 0x10>,
+        <0x01b10000 0x1000>;
+
+      reg-names = "csiphy0",
+        "csiphy0_clk_mux",
+        "csiphy1",
+        "csiphy1_clk_mux",
+        "csid0",
+        "csid1",
+        "ispif",
+        "csi_clk_mux",
+        "vfe0";
+
+      vdda-supply = <&reg_2v8>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+      };
+
+    };
-- 
2.27.0

