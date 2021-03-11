Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94D3A337C0B
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 19:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhCKSLD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 13:11:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbhCKSKb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 13:10:31 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF45DC061760
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 10:10:30 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id o19so4215984edc.3
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 10:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vAce9eR4oesvm/pi+5vXo9JNtgF/0oTZXWts7hNz6X4=;
        b=siU1Y9o+b1Km9Zf8ur1WT0qgqSgPIF0to6TmeSQqUwprkvudJv3vY0Q0qq1wcu2ZTR
         XlzFvABi1Ln6al29FNyhddZNfZflTeKeXRFrNgP7i5D1wTwtYhqm95SIHMbEGlEXas3E
         GyezuRPPYcVpUjwhPKj1Hu1L4D7mWz4r5pnih/bddm3Q78wb7wcoAhMPEy0mXPZZT45E
         QUkhNGl25D8YDtfals4RvsZ3PwUMWeOUGdsOAgQSgPi444hqkWZN527u94OEuxt7+ojw
         LsGwtAsHn8ezt374VVgQ4YV68VMFtVSgEr6WvOLqp1CmQq2LpUtFG0f1qo++slpP9p7i
         7jXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vAce9eR4oesvm/pi+5vXo9JNtgF/0oTZXWts7hNz6X4=;
        b=Jd4+0H703RzVy5DHbVLMymKRbIQSLDMSBLEfw8PNmBQtmcBr8kMJwTOT/8G5BacoVO
         tZGq/uVrKAI95gyaU7BmBtVxCuKuO2JvCtXde2trWViREBgMERtsnU8LblwPS6U5Rrfg
         VLqNWmZhX36e0bHBuSYiU0pOSVjRWiyLNkdLNqMP94LDcW9HNGjpOD34Ilrqj45E6I4C
         Xtu7EdKxOM1vZ4NQSWB2hFV6a1gBky4B3igl1YjUWM16BEw+12nwu2mqwbs0eHv6b1EY
         m7vArYyCX/KLCLfMMuEE0oC0p33/xjRDwHdMA3x3rHNvQ9mFnxrU12lwANGaNJro4YYr
         zsoQ==
X-Gm-Message-State: AOAM533psVkCNAg2lmaqFufLlTnmZtSZVgJcRNF5LdAsJlP0IBhs8JS1
        MrCAa8PTEayxiCDl9ASUyVmrmg==
X-Google-Smtp-Source: ABdhPJyiihPaC8cetWm7soF0QTlSExhhRgft2kn86nljY53TBTZ8Cy8B11oFEhIhZo9UBsxpaBoGnQ==
X-Received: by 2002:aa7:dd05:: with SMTP id i5mr9825507edv.300.1615486229297;
        Thu, 11 Mar 2021 10:10:29 -0800 (PST)
Received: from localhost.localdomain ([2a02:2454:3e3:5f00:8e01:34c:da50:eb7e])
        by smtp.gmail.com with ESMTPSA id a22sm1741290ejr.89.2021.03.11.10.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 10:10:28 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
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
Subject: [PATCH v7 16/22] dt-bindings: media: camss: Add qcom,sdm660-camss binding
Date:   Thu, 11 Mar 2021 19:09:42 +0100
Message-Id: <20210311180948.268343-17-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311180948.268343-1-robert.foss@linaro.org>
References: <20210311180948.268343-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings for qcom,sdm660-camss in order to support the camera
subsystem on SDM630/660 and SDA variants.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---


Changes since v2:
 - Rob: Add new line at end of file
 - Rob: Remove redundant descriptions
 - Rob: Add power domain description
 - Rob: Make clock-lanes a constant
 - Rob: Rework to conform to new port schema
 - Add max & minItems to data-lanes
 - Remove ports requirement - endpoint & reg
 - Added Angelo as binding maintainer
 - Removed Todor as binding maintainer

Changes since v3:
 - Rob: Added r-b



 .../bindings/media/qcom,sdm660-camss.yaml     | 398 ++++++++++++++++++
 1 file changed, 398 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
new file mode 100644
index 000000000000..841a1aafdd13
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
@@ -0,0 +1,398 @@
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
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
+
+description: |
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
+
+properties:
+  compatible:
+    const: qcom,sdm660-camss
+
+  clocks:
+    minItems: 42
+    maxItems: 42
+
+  clock-names:
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
+    minItems: 10
+    maxItems: 10
+
+  interrupt-names:
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
+    items:
+      - description: VFE0 GDSC - Video Front End, Global Distributed Switch Controller.
+      - description: VFE1 GDSC - Video Front End, Global Distributed Switch Controller.
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

