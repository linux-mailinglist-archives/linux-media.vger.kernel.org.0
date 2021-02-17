Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F76631D85B
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 12:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbhBQL3T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 06:29:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231665AbhBQL0p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 06:26:45 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523B6C0698C5
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:22:22 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id o3so13799096edv.4
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3damQEV6BCIYCzNyO+Mv+HI1TRjv3h1vvBczXaR1qUo=;
        b=e4N2+lXKWkm1MLBAkESBCCUfWmx0M7EULo8s++umnAZmy5JEyvZsg7QD2ayByGmzYU
         C9TaatOtXYhrOEQ4TtDsm1IkGEl4RpgBVBUgQDaDkCxc8/y7s/hGDRgkrDII0aFJO2AP
         jphJKzMfYDr8Uya9dTxvpObNBdripv39ayKcgA+ZUNvPGBztZxYWQYPasDzfPdV58ieT
         8JLgibta7wJqorxrhuMVxEAcW9ker0zS8/9tU3Rzf2R66GiWppT9z+fwivN39nBWdlTK
         xH0RfjkcuihAF0Rj0UXqC1v0811T60b6yrzg3Cyb5ljNWScgd7Cl91a2ELz9eCeeK3YL
         chIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3damQEV6BCIYCzNyO+Mv+HI1TRjv3h1vvBczXaR1qUo=;
        b=lfoKh4Uj1YmFNa/nMO4s/gYLiu0/8Z65O00IDn8kOvtrGBS6RSet8ioDHEa71QdEob
         d7/b9V6S48tRyq7QFNYXuuID5PA4ORwpQPjR9+9oOweDrLfm7Ss7kRCSA4vWOrleOTKw
         AFktnhp1C3UM11wyDnphhjf1aLzLsfgxQuM8aMYL0fEQNU2MS0JKa5EIkrEqGj2I623f
         A7fVcUiZYq+CqUMfJLH8TL36es2P3r54PpGxENMe7HLtQ0UuHSNV+jZh4wwaYsaicxUo
         HOlVzEuXNwBrihbPhgMjit2ZoumlNchDcbjeqVkke28TerkYE4y8AwDjYwUjqG5ibLCE
         kkyQ==
X-Gm-Message-State: AOAM530YPNKLReR6IT3yxzbgyJav6qYVNu17EcTOUlJRlC0tGM4IrpJU
        PFfCnPtmNGW4zccL6pAGQgtO0g==
X-Google-Smtp-Source: ABdhPJzAqXTeob0fXAgfS4g3VPiMqOMym6W/4HpgrbY4TndylUI7aZyp6PhV8FlA8eckAh+SU0jgyA==
X-Received: by 2002:a05:6402:27cd:: with SMTP id c13mr25636151ede.263.1613560941069;
        Wed, 17 Feb 2021 03:22:21 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:4815:d4dc:ff5a:704a])
        by smtp.gmail.com with ESMTPSA id h10sm934344edk.45.2021.02.17.03.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 03:22:20 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v5 14/22] dt-bindings: media: camss: Add qcom,msm8916-camss binding
Date:   Wed, 17 Feb 2021 12:21:14 +0100
Message-Id: <20210217112122.424236-15-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210217112122.424236-1-robert.foss@linaro.org>
References: <20210217112122.424236-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings for qcom,msm8916-camss in order to support the camera
subsystem on MSM8916.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes since v2:
 - Remove redundant descriptions
 - Add power domain description
 - Make clock-lanes a constant
 - Add max & minItems to data-lanes
 - Remove ports requirement - endpoint & reg
 - Rework to conform to new port schema

Changes since v4
 - Rob: Added r-b

 .../bindings/media/qcom,msm8916-camss.yaml    | 256 ++++++++++++++++++
 1 file changed, 256 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
new file mode 100644
index 000000000000..304908072d72
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
@@ -0,0 +1,256 @@
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
+    minItems: 19
+    maxItems: 19
+
+  clock-names:
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
+    minItems: 6
+    maxItems: 6
+
+  interrupt-names:
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
+    items:
+      - description: VFE GDSC - Video Front End, Global Distributed Switch Controller.
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
+                items:
+                  - const: 1
+
+              data-lanes:
+                description:
+                  An array of physical data lanes indexes.
+                  Position of an entry determines the logical
+                  lane number, while the value of an entry
+                  indicates physical lane index. Lane swapping
+                  is supported. Physical lane indexes;
+                  0, 2, 3, 4.
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
+                  - const: 1
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

