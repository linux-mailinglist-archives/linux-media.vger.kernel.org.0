Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F133337BF1
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 19:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhCKSKl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 13:10:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhCKSK1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 13:10:27 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75038C061760
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 10:10:27 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id c10so48084820ejx.9
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 10:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9vXLNNMnXniLT7jNpAjc9vyLQsjPwtrTk1Cd0JUoufU=;
        b=fUYiWSBuCAiOuQtv8D4k6ctR9uRyhb80LhP3y6SY9Y3ELyp/ZTPvl8G4l1aWMssInH
         5xULkr/pnk6I8f/LtI9BC4PxvCiNgi0oZK2ShNL3JMGV6UF3T1IccOrHPmMS57F3mQnQ
         afOKrUBqKVnWeHUfQK7DMF/d4Hm4g78+a2g0QkotBqD92UjdR5YaMO4NZPR2QIrjz456
         FASFYwYNKbG1Js09tQviebGD8BK6L9CsvEgdgJnBKU0+PpLqPHtA39MbRv63NW7oxaJP
         fXhHQ3l3n31OBA017JkeFt/IkRDVc6EJUyhKanhRvQIA6AsFeOoQVIlVSv5NTPxBPETc
         /2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9vXLNNMnXniLT7jNpAjc9vyLQsjPwtrTk1Cd0JUoufU=;
        b=MeGhl58aBL6i5go3K32kilhJqu3Uyi/RzIDF8yzNgNNTgJLuMiU6CT4OWoFRNgoaz7
         LEWf98hJuJkUwLxyOsEaLAQysqpTZgF+WfOaSI/VUY+6jyqJ+kyXJlCX7x98hvK57aOy
         kyCTtKqjPrCyw8j/pCp8G0+f2Y2d17cXAIRlsRhXN2y1JLF2X+vv0xpKi0jWhA32ZZP5
         5N4ihvM3PpxRUs8NdCNi01ucDWGTqMSy7nY2GrHjBKizWtSdv74qccKIB9THQJPuJ5EJ
         pMjnVDF1Xycz4SKH9MKPrzkfyjyKutaBnMIac5ddu+iRHRxAVIoiKd4y4HmqdZJI54bf
         QFtg==
X-Gm-Message-State: AOAM530Oz2ayC2waBt9thmsaR7p8JDBCFIV0Csj2kJodtFGzdm9MF1cm
        1wtmqcLzvFOyFnuxwC6QgCEjQA==
X-Google-Smtp-Source: ABdhPJwWhlbBTndkLfb9tBKQe5i/gJPNMEZnki49XrNFQ4sk/Bz/17W7dGPhvv8ZpM1Tu/0B0NjrAQ==
X-Received: by 2002:a17:907:162b:: with SMTP id hb43mr4430499ejc.41.1615486226071;
        Thu, 11 Mar 2021 10:10:26 -0800 (PST)
Received: from localhost.localdomain ([2a02:2454:3e3:5f00:8e01:34c:da50:eb7e])
        by smtp.gmail.com with ESMTPSA id a22sm1741290ejr.89.2021.03.11.10.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 10:10:25 -0800 (PST)
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
Subject: [PATCH v7 14/22] dt-bindings: media: camss: Add qcom,msm8916-camss binding
Date:   Thu, 11 Mar 2021 19:09:40 +0100
Message-Id: <20210311180948.268343-15-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311180948.268343-1-robert.foss@linaro.org>
References: <20210311180948.268343-1-robert.foss@linaro.org>
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

Changes since v4:
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

