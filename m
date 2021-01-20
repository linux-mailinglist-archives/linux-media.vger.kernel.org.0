Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 117C72FDBA0
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 22:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733177AbhATU44 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 15:56:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389121AbhATNu7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 08:50:59 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 651D2C061343
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:44:54 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id a9so19709014wrt.5
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H8THZGlSlSDtEvgRsLNltBDQqY7eROszvbFqzIm7p3c=;
        b=GGlCskYn158Zt8+g6Vvygukv5Jq+n5qwIXVmEltfRVT160z/dGlPo9qAJPg8URpcze
         mB0zjBFGbka7lWIY883nQ4jihFI8Sfbfg2ElmGMZdBePAs2dvHk6FnniO5CD23DrjPwm
         YRE05FogwagsOJSXs+TsEThMgE0aw0J5aUM5mJFc72c1zKCCcHiAKRoMtPv034wNIZtq
         F4Qpn4FD+jlEyW3RoCjbN00DlQmzSk+QvpQPFRiEoU5xvYv9U5DQVq43RVgFMoSz9duq
         8Q9lapsO0ErYZS2vrStkUDIw99Af/TLay1bNehNWZOlM4aMf3yaulHB8nF8EyvZ67qOl
         tr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H8THZGlSlSDtEvgRsLNltBDQqY7eROszvbFqzIm7p3c=;
        b=nMtrj60VSIP/UY0a6cxyW2g/S32gHw9zyL6gy3VtkaC1APIMyeQofuOn8fzChaCmg2
         hMRSWAoIKGmU6+vEfBpZtH45u7gCm7WlUINw5dhmCSrKLAkScJHhGkoEsZNepLiukCYp
         KRbR0swLjIfY3SYEFc5hMX8VIwF+VJgAKwurk34v0FGxL1/49cA/aUYL2oSL/2F+00aW
         ioXvXkDXFhpyP7fQQxtfPzvidbrOs+D+61ftAyCewNpot2wRXHZP48+5eGMNkYQ5eiTn
         mZJ486B45b2CVoBcak8qrqugT07d9hKRRxdHF4li8roiT6Og9rf20969K/KeSGnjYYL5
         Alww==
X-Gm-Message-State: AOAM532rJAAfpe9nKatB/z0PxTPrBKGZv8O1azNP/SmIP9kw6cTGkHsL
        ATdlD7tEWtHS6nTpmXzhQ83rbQ==
X-Google-Smtp-Source: ABdhPJw8BUxkA8o7OM0fmdCbO8qCsbtlXvSF3jtfnnxsoGNjwxoiJtQpQLdgRsYSXFp9Qj6jO+vwAw==
X-Received: by 2002:a5d:58d7:: with SMTP id o23mr9598863wrf.288.1611150293130;
        Wed, 20 Jan 2021 05:44:53 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:93b3:1f80:ae7b:a5c6])
        by smtp.gmail.com with ESMTPSA id t67sm4224075wmt.28.2021.01.20.05.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 05:44:52 -0800 (PST)
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
Subject: [PATCH v2 14/22] dt-bindings: media: camss: Add qcom,msm8996-camss binding
Date:   Wed, 20 Jan 2021 14:43:49 +0100
Message-Id: <20210120134357.1522254-14-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120134357.1522254-1-robert.foss@linaro.org>
References: <20210120134357.1522254-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings for qcom,msm8996-camss in order to support the camera
subsystem on MSM8996.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

Changes since v1:
 - Laurent: Reworked driver to use dtschema


 .../bindings/media/qcom,msm8996-camss.yaml    | 418 ++++++++++++++++++
 1 file changed, 418 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
new file mode 100644
index 000000000000..5ca0be8892ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
@@ -0,0 +1,418 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,msm8996-camss.yaml#"
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
+    const: qcom,msm8996-camss
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
+      - const: top_ahb
+      - const: ispif_ahb
+      - const: csiphy0_timer
+      - const: csiphy1_timer
+      - const: csiphy2_timer
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
+      - const: ahb
+      - const: vfe0
+      - const: csi_vfe0
+      - const: vfe0_ahb
+      - const: vfe0_stream
+      - const: vfe1
+      - const: csi_vfe1
+      - const: vfe1_ahb
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
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid3
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
+                  The physical clock lane index. The value must
+                  always be <7> as the hardware supports D-PHY
+                  and C-PHY, indexes are in a common set and
+                  D-PHY physical clock lane is labeled as 7.
+
+              data-lanes:
+                description: |-
+                  An array of physical data lanes indexes.
+                  Position of an entry determines the logical
+                  lane number, while the value of an entry
+                  indicates physical lane index. Lane swapping
+                  is supported. Physical lane indexes are:
+                  0, 1, 2, 3
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
+                  The physical clock lane index. The value must
+                  always be <7> as the hardware supports D-PHY
+                  and C-PHY, indexes are in a common set and
+                  D-PHY physical clock lane is labeled as 7.
+
+              data-lanes:
+                description: |-
+                  An array of physical data lanes indexes.
+                  Position of an entry determines the logical
+                  lane number, while the value of an entry
+                  indicates physical lane index. Lane swapping
+                  is supported. Physical lane indexes are:
+                  0, 1, 2, 3
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
+                  The physical clock lane index. The value must
+                  always be <7> as the hardware supports D-PHY
+                  and C-PHY, indexes are in a common set and
+                  D-PHY physical clock lane is labeled as 7.
+
+              data-lanes:
+                description: |-
+                  An array of physical data lanes indexes.
+                  Position of an entry determines the logical
+                  lane number, while the value of an entry
+                  indicates physical lane index. Lane swapping
+                  is supported. Physical lane indexes are:
+                  0, 1, 2, 3
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
+                  The physical clock lane index. The value must
+                  always be <7> as the hardware supports D-PHY
+                  and C-PHY, indexes are in a common set and
+                  D-PHY physical clock lane is labeled as 7.
+
+              data-lanes:
+                description: |-
+                  An array of physical data lanes indexes.
+                  Position of an entry determines the logical
+                  lane number, while the value of an entry
+                  indicates physical lane index. Lane swapping
+                  is supported. Physical lane indexes are:
+                  0, 1, 2, 3
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
+      - const: csiphy0
+      - const: csiphy0_clk_mux
+      - const: csiphy1
+      - const: csiphy1_clk_mux
+      - const: csiphy2
+      - const: csiphy2_clk_mux
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid3
+      - const: ispif
+      - const: csi_clk_mux
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
+    #include <dt-bindings/clock/qcom,gcc-msm8996.h>
+    #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
+
+    camss: camss@a00000 {
+      compatible = "qcom,msm8996-camss";
+
+      clocks = <&mmcc CAMSS_TOP_AHB_CLK>,
+        <&mmcc CAMSS_ISPIF_AHB_CLK>,
+        <&mmcc CAMSS_CSI0PHYTIMER_CLK>,
+        <&mmcc CAMSS_CSI1PHYTIMER_CLK>,
+        <&mmcc CAMSS_CSI2PHYTIMER_CLK>,
+        <&mmcc CAMSS_CSI0_AHB_CLK>,
+        <&mmcc CAMSS_CSI0_CLK>,
+        <&mmcc CAMSS_CSI0PHY_CLK>,
+        <&mmcc CAMSS_CSI0PIX_CLK>,
+        <&mmcc CAMSS_CSI0RDI_CLK>,
+        <&mmcc CAMSS_CSI1_AHB_CLK>,
+        <&mmcc CAMSS_CSI1_CLK>,
+        <&mmcc CAMSS_CSI1PHY_CLK>,
+        <&mmcc CAMSS_CSI1PIX_CLK>,
+        <&mmcc CAMSS_CSI1RDI_CLK>,
+        <&mmcc CAMSS_CSI2_AHB_CLK>,
+        <&mmcc CAMSS_CSI2_CLK>,
+        <&mmcc CAMSS_CSI2PHY_CLK>,
+        <&mmcc CAMSS_CSI2PIX_CLK>,
+        <&mmcc CAMSS_CSI2RDI_CLK>,
+        <&mmcc CAMSS_CSI3_AHB_CLK>,
+        <&mmcc CAMSS_CSI3_CLK>,
+        <&mmcc CAMSS_CSI3PHY_CLK>,
+        <&mmcc CAMSS_CSI3PIX_CLK>,
+        <&mmcc CAMSS_CSI3RDI_CLK>,
+        <&mmcc CAMSS_AHB_CLK>,
+        <&mmcc CAMSS_VFE0_CLK>,
+        <&mmcc CAMSS_CSI_VFE0_CLK>,
+        <&mmcc CAMSS_VFE0_AHB_CLK>,
+        <&mmcc CAMSS_VFE0_STREAM_CLK>,
+        <&mmcc CAMSS_VFE1_CLK>,
+        <&mmcc CAMSS_CSI_VFE1_CLK>,
+        <&mmcc CAMSS_VFE1_AHB_CLK>,
+        <&mmcc CAMSS_VFE1_STREAM_CLK>,
+        <&mmcc CAMSS_VFE_AHB_CLK>,
+        <&mmcc CAMSS_VFE_AXI_CLK>;
+
+      clock-names = "top_ahb",
+        "ispif_ahb",
+        "csiphy0_timer",
+        "csiphy1_timer",
+        "csiphy2_timer",
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
+        "ahb",
+        "vfe0",
+        "csi_vfe0",
+        "vfe0_ahb",
+        "vfe0_stream",
+        "vfe1",
+        "csi_vfe1",
+        "vfe1_ahb",
+        "vfe1_stream",
+        "vfe_ahb",
+        "vfe_axi";
+
+      interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 80 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 296 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 297 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 298 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 299 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 314 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 315 IRQ_TYPE_EDGE_RISING>;
+
+      interrupt-names = "csiphy0",
+        "csiphy1",
+        "csiphy2",
+        "csid0",
+        "csid1",
+        "csid2",
+        "csid3",
+        "ispif",
+        "vfe0",
+        "vfe1";
+
+      iommus = <&vfe_smmu 0>,
+         <&vfe_smmu 1>,
+         <&vfe_smmu 2>,
+         <&vfe_smmu 3>;
+
+      power-domains = <&mmcc VFE0_GDSC>,
+        <&mmcc VFE1_GDSC>;
+
+      reg = <0x00a34000 0x1000>,
+        <0x00a00030 0x4>,
+        <0x00a35000 0x1000>,
+        <0x00a00038 0x4>,
+        <0x00a36000 0x1000>,
+        <0x00a00040 0x4>,
+        <0x00a30000 0x100>,
+        <0x00a30400 0x100>,
+        <0x00a30800 0x100>,
+        <0x00a30c00 0x100>,
+        <0x00a31000 0x500>,
+        <0x00a00020 0x10>,
+        <0x00a10000 0x1000>,
+        <0x00a14000 0x1000>;
+
+      reg-names = "csiphy0",
+        "csiphy0_clk_mux",
+        "csiphy1",
+        "csiphy1_clk_mux",
+        "csiphy2",
+        "csiphy2_clk_mux",
+        "csid0",
+        "csid1",
+        "csid2",
+        "csid3",
+        "ispif",
+        "csi_clk_mux",
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
\ No newline at end of file
-- 
2.27.0

