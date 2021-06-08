Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3705F3A0719
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 00:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235225AbhFHWkX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 18:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235204AbhFHWkW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 18:40:22 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D633C061226
        for <linux-media@vger.kernel.org>; Tue,  8 Jun 2021 15:38:10 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id w4so4330349qvr.11
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 15:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/823CRWEtqrhi6o3PuH0KzgjXWRFqmYjEP0u2e35L5M=;
        b=BgXaCJokM3Gl3lM7OUDOCeZdl6w5JyhtIuYcH86jWUgKTBM467Ef4+23sXaoqhRyvr
         RYUrBZtr2cSZnghqjpxpJsEjX4bEWF6gSaYiqEcn2R2Tj4+pOF0kIYeIN7cjb4rx4vuh
         i3WQM3ZhH0gOF79bxsWE5Ue3Kroh5T1oTMvypFZXC2LRrxjNvRDLUsETonQnPsWovKV+
         P8nWnoNdYtLpD4jdN82wCwakem2yK/uJaxl8y6VthjmJ6bwOQ0WDPZeQ67sWz8S4ntBp
         GvOLLf/9jq3TSPJb5gXGx6UTY/sgPPdS9ugOTs8qBEBpDp/tz3CaIMtWA7bI/D1d/OMi
         0cSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/823CRWEtqrhi6o3PuH0KzgjXWRFqmYjEP0u2e35L5M=;
        b=UHJW7lrV0Al9FhW5K17nIuwCfz8CXZVfgeisJjLjhK/hPioahVSfkq00cazClkq0xq
         Hl8npt3kAmOFM7Sl1SF2/lNYvIEHD8RHLW0PHuNdg2f5TZP54YjyrooOzksTGsRRcQ50
         OTv8QwG+ylFtHFNBxgnA1dsU4v5h9814d86OL9IMjqRrEOUk1lk56B/Iacw5Y0vUQdvi
         9AXLp3vQHW0S4Aj+1VZTbM+BjKhQpjZAx1wY3JxShv6jycCrtBNfQDQnFBjf6/NUs7Ip
         BSfkPPwhVwjUppOB8tmKnIbN9KisqZDXDNa4tntnKgkpu3frhE4dqq0FALNOTyBGucQa
         hroA==
X-Gm-Message-State: AOAM530bQLTP+lh+uUrN691ErFgjIt1lyyol46H03KQnN6goKzQ+d1Mo
        alc8CkkfUXxXZ8BTLDYBWTF6VQ==
X-Google-Smtp-Source: ABdhPJyc6AzWD4kvuxxoiO25FuHSMSOQl+1D+zsshBCjRvDyVy3x870HHqtrK/CkESK/9Q/p3BOqoQ==
X-Received: by 2002:a05:6214:8f1:: with SMTP id dr17mr2662948qvb.42.1623191889273;
        Tue, 08 Jun 2021 15:38:09 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id m3sm2324266qkh.135.2021.06.08.15.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 15:38:08 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 17/17] media: dt-bindings: media: camss: Add qcom,sm8250-camss binding
Date:   Tue,  8 Jun 2021 18:35:06 -0400
Message-Id: <20210608223513.23193-18-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608223513.23193-1-jonathan@marek.ca>
References: <20210608223513.23193-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings for qcom,sm8250-camss in order to support the camera
subsystem for SM8250.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../bindings/media/qcom,sm8250-camss.yaml     | 399 ++++++++++++++++++
 1 file changed, 399 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
new file mode 100644
index 0000000000000..7180e52ee59a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -0,0 +1,399 @@
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
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
+
+properties:
+  compatible:
+    const: qcom,sm8250-camss
+
+  clocks:
+    minItems: 31
+    maxItems: 31
+
+  clock-names:
+    items:
+      - const: cam_hf_axi
+      - const: camnoc_axi
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
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid3
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
+  iommus:
+    maxItems: 1
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
+  - interrupt-names
+  - interrupts
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
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      camss: camss@ac6a000 {
+        compatible = "qcom,sm8250-camss";
+
+        reg = <0 0xac6a000 0 0x2000>,
+          <0 0xac6c000 0 0x2000>,
+          <0 0xac6e000 0 0x1000>,
+          <0 0xac70000 0 0x1000>,
+          <0 0xac72000 0 0x1000>,
+          <0 0xac74000 0 0x1000>,
+          <0 0xacb4000 0 0xd000>,
+          <0 0xacc3000 0 0xd000>,
+          <0 0xacd9000 0 0x2200>,
+          <0 0xacdb200 0 0x2200>;
+        reg-names = "csiphy0",
+          "csiphy1",
+          "csiphy2",
+          "csiphy3",
+          "csiphy4",
+          "csiphy5",
+          "vfe0",
+          "vfe1",
+          "vfe_lite0",
+          "vfe_lite1";
+
+        interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+          <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "csiphy0",
+          "csiphy1",
+          "csiphy2",
+          "csiphy3",
+          "csiphy4",
+          "csiphy5",
+          "csid0",
+          "csid1",
+          "csid2",
+          "csid3",
+          "vfe0",
+          "vfe1",
+          "vfe_lite0",
+          "vfe_lite1";
+
+        power-domains = <&camcc IFE_0_GDSC>,
+          <&camcc IFE_1_GDSC>,
+          <&camcc TITAN_TOP_GDSC>;
+
+        clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+          <&camcc CAM_CC_CSIPHY0_CLK>,
+          <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+          <&camcc CAM_CC_CSIPHY1_CLK>,
+          <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+          <&camcc CAM_CC_CSIPHY2_CLK>,
+          <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+          <&camcc CAM_CC_CSIPHY3_CLK>,
+          <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+          <&camcc CAM_CC_CSIPHY4_CLK>,
+          <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+          <&camcc CAM_CC_CSIPHY5_CLK>,
+          <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+          <&camcc CAM_CC_IFE_0_AHB_CLK>,
+          <&camcc CAM_CC_IFE_0_AXI_CLK>,
+          <&camcc CAM_CC_IFE_0_CLK>,
+          <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+          <&camcc CAM_CC_IFE_0_CSID_CLK>,
+          <&camcc CAM_CC_IFE_0_AREG_CLK>,
+          <&camcc CAM_CC_IFE_1_AHB_CLK>,
+          <&camcc CAM_CC_IFE_1_AXI_CLK>,
+          <&camcc CAM_CC_IFE_1_CLK>,
+          <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+          <&camcc CAM_CC_IFE_1_CSID_CLK>,
+          <&camcc CAM_CC_IFE_1_AREG_CLK>,
+          <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+          <&camcc CAM_CC_IFE_LITE_AXI_CLK>,
+          <&camcc CAM_CC_IFE_LITE_CLK>,
+          <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+          <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+
+        clock-names = "cam_hf_axi",
+          "csiphy0",
+          "csiphy0_timer",
+          "csiphy1",
+          "csiphy1_timer",
+          "csiphy2",
+          "csiphy2_timer",
+          "csiphy3",
+          "csiphy3_timer",
+          "csiphy4",
+          "csiphy4_timer",
+          "csiphy5",
+          "csiphy5_timer",
+          "vfe0_ahb",
+          "vfe0_axi",
+          "vfe0",
+          "vfe0_cphy_rx",
+          "vfe0_csid",
+          "vfe0_areg",
+          "vfe1_ahb",
+          "vfe1_axi",
+          "vfe1",
+          "vfe1_cphy_rx",
+          "vfe1_csid",
+          "vfe1_areg",
+          "vfe_lite_ahb",
+          "vfe_lite_axi",
+          "vfe_lite",
+          "vfe_lite_cphy_rx",
+          "vfe_lite_csid";
+
+        iommus = <&apps_smmu 0x800 0x400>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+        };
+      };
+    };
-- 
2.26.1

