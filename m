Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21337305EE4
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 15:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234958AbhA0O7V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 09:59:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234979AbhA0O4l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 09:56:41 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649DAC061A31
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 06:50:40 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id w1so2996822ejf.11
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 06:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SkMVbS7aH6BuE3265iqQ4ivP1hacr/hHVcVPsN8FP4c=;
        b=xvIbZvcxEiFKXrjbmYZhn7tF03R87W9PEwkDMPL8Atz0r6fKve1q3339mwRIlJ5f1j
         v+ncP/KzAQdJVZXMHehsptb4UDNXlIkY8YNEi3ake3CGWdhylvnk332ToBaPnbB5hL87
         HT6Pmwys7Kp15SKMGi43r/hltwQ5WLhIpjzReryDQEoWSH3CKbWVy2tg5jEAQP0YsvPI
         vEYKhj4mS1DXIMjfckcaKY/ynYKNsraFm3S2TZmReUa3oSo7GUPxIPijSxTg5kguBOqG
         GcUvgSMP5/iFS//MG89Eatucu+GMBa0KzF4vr/SPQkOl1O+Exl7t9asRP+M0TT1CF0wJ
         lzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SkMVbS7aH6BuE3265iqQ4ivP1hacr/hHVcVPsN8FP4c=;
        b=njBpKmWpEXsQhlQB1TMvxX5EbL1gS3Vxfqq/WKlhipDb6Nc8HnTwoeYht9romuiOqT
         6x5Wi+Q6jnCyj0KIPi8xzIe+FBSsR9jh5ykFjjkXkPouA06LVkmdXbOVLzrDAZbiEOIB
         95XDt3khky0nNEQJoEmCYVeQG4LO5zj8OV8VFB98d9FE0sCXjDB6eaLiHBw/sSBJljp+
         yE8Dwdhi6ssrgKXQNTAVjpxSd0y+6GAGZRgrl5nml7SEz6EDf7p91mj1IAHQtCNTQyat
         isAmOUG3MEenT0tfy0clMcME01MwuVnZt9/bkUBdHxArMn5L+C3fjgue/Ctk/LZHmSvK
         89Fw==
X-Gm-Message-State: AOAM5328rGC34PBin4cgtA7VUjssdrd9x8eczcjSDBYSF+w3rfCIHWKH
        nusPKX92oJOSLpJ04AR7+/g6Wg==
X-Google-Smtp-Source: ABdhPJyigzXmoeo7pXXK9HulVnLK5oyPiAG9b/I4Z1ioazSxzxSw+ItI7ISs+yhI4VwbR8A9ejbV1w==
X-Received: by 2002:a17:906:cb82:: with SMTP id mf2mr7488284ejb.515.1611759039140;
        Wed, 27 Jan 2021 06:50:39 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:62e7:589a:1625:7acc])
        by smtp.gmail.com with ESMTPSA id ah12sm947799ejc.70.2021.01.27.06.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 06:50:38 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v3 13/22] dt-bindings: media: camss: Add qcom,msm8916-camss binding
Date:   Wed, 27 Jan 2021 15:49:21 +0100
Message-Id: <20210127144930.2158242-14-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210127144930.2158242-1-robert.foss@linaro.org>
References: <20210127144930.2158242-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings for qcom,msm8916-camss in order to support the camera
subsystem on MSM8916.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

Changes since v2:
 - Remove redundant descriptions
 - Add power domain description
 - Make clock-lanes a constant
 - Add max & minItems to data-lanes
 - Remove ports requirement - endpoint & reg
 - Rework to conform to new port schema


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

