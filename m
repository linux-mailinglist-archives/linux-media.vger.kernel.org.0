Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C7132D278
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 13:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239936AbhCDMHQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 07:07:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239982AbhCDMGq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 07:06:46 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93FFBC0613AD
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 04:05:58 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id w9so18304573edt.13
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 04:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XUCuZpI4APd5cw/zyopVDFOJtJjTtpVVUOwXt4jTqnE=;
        b=egPiLqC3gMG9oktufM3LbqssWw8D8Uma9bwcJwl7slhYqniMeYVt0AxG4+pdVo4C2Y
         cmAfkbSwPyhiU/jj/5xLC1a8k7vIYTsh6V1c2G/E2g+8Abrbzfm4KhvmkLfpZeTIiCqL
         9YWJ1zUa/jJNoKxqUIZj2Pxzh9yT0vzQBy+4FK3nC9u5ZnXTrqgTVIMnDn5MkrjKYkoG
         RE+s0vZVexaGG2M6NW+XVJf9y2oSG0gZG9M+p966SWOL7icTWMWOPbvH+8NGVwQziYGc
         E6Ua1X0U9JuHhP8UK8yyJ5PuSRh5FGNCwPD0AE7IVrSjAOFuaN/fIY00o+2AZ2AJZE3z
         Bi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XUCuZpI4APd5cw/zyopVDFOJtJjTtpVVUOwXt4jTqnE=;
        b=VEvFhjjblnYEYebm7R4VjdUHY1maGeEh5d1hW/w41G0GzwkD4DGQJv/Tb6s73yXKh0
         1crrm+fdQMvvXt4oFcd7KYcxYqEXHin9VPoJMTSnDZ5Xkzle+g0Fbuf9kGxTR67DaSUh
         D1punu9QgFKqODCcYAeklTUQ8VIpMlm1Y7+0ytHf40199eKcwsqQdGZNc7fvPCN1NM9b
         yTZL9gpM2ypwGuyaTKM6QugY6CiYZ2f54QW9xe1IdxyK4SByEqE+3a8+yEgZtqNaie5s
         Io032C9T/J+O36XcF/yr0VO22xuSMrI8jE+i4Se+2Wlvh6gz4CZOLjCNd4cUim/4gZtW
         7r1A==
X-Gm-Message-State: AOAM533x2sysZq0/ION1TxipdlqDDz/L4Qr6LSywK+XmsOMEIOecbUeo
        dr3IJ6wb60WoqvmcyPn1UVUAkw==
X-Google-Smtp-Source: ABdhPJzgA8vuFkOpQ8U9rhSRRbPXw+IHoOF0FJlVXVt7BrZ9QwFsXUC6IIPXroouJjAySUakCIZh/A==
X-Received: by 2002:a50:ec81:: with SMTP id e1mr3886582edr.0.1614859557184;
        Thu, 04 Mar 2021 04:05:57 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:470a:340b:1b:29dd])
        by smtp.gmail.com with ESMTPSA id cf6sm20464447edb.92.2021.03.04.04.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 04:05:56 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v6 15/22] dt-bindings: media: camss: Add qcom,msm8996-camss binding
Date:   Thu,  4 Mar 2021 13:03:21 +0100
Message-Id: <20210304120326.153966-16-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210304120326.153966-1-robert.foss@linaro.org>
References: <20210304120326.153966-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings for qcom,msm8996-camss in order to support the camera
subsystem on MSM8996.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---


Changes since v2
 - Rob: Add new line at end of file
 - Rob: Remove redundant descriptions
 - Rob: Add power domain description
 - Rob: Make clock-lanes a constant
 - Rob: Rework to conform to new port schema
 - Add max & minItems to data-lanes
 - Remove ports requirement - endpoint & reg

Changes since v4
 - Rob: Added r-b


 .../bindings/media/qcom,msm8996-camss.yaml    | 387 ++++++++++++++++++
 1 file changed, 387 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
new file mode 100644
index 000000000000..38be41e932f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
@@ -0,0 +1,387 @@
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
+    minItems: 36
+    maxItems: 36
+
+  clock-names:
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
+    minItems: 10
+    maxItems: 10
+
+  interrupt-names:
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
+                description:
+                  An array of physical data lanes indexes.
+                  Position of an entry determines the logical
+                  lane number, while the value of an entry
+                  indicates physical lane index. Lane swapping
+                  is supported. Physical lane indexes are;
+                  0, 1, 2, 3
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
-- 
2.27.0

