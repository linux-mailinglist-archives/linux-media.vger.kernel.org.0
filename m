Return-Path: <linux-media+bounces-23121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFF29EBF63
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 00:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D9AB188AD28
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 23:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19740225A48;
	Tue, 10 Dec 2024 23:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FF9q0scZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D1021129E;
	Tue, 10 Dec 2024 23:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733873756; cv=none; b=YMMHTyOLDMoRUnMQopHpNl63CIyqDdkpTX8NVgKeeRRWJ+WoHi1LpfJPmv4DNvdINEztb+W9xT/sWaBDVJ0w56qx3DOUdwxqU1ngEMtlA22HMFSiNE0M0n91JaE0P75WL9sg+p4uc5J3+U37FvekgaK64sJ+quPjcDN9P721biE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733873756; c=relaxed/simple;
	bh=6eoSohtPLt7o5mhSZsHqU0DPbJowFOpNbZEPWw8ix0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=utrUvWiWDGadFf9GI5DvfjKJ4CLq+PWh4FlVKOtriL78PD8Pdv2zxaimOzExZbDvofF7/PL0s3pQ0H2fT39JzZOUXiBjLNLMBWNaHR7N2vMwc90tSqb355BFf04FqBL77JHlz/ojKxVHvNmd/6fk4jvql6HUGgQLYY56rDTBhdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FF9q0scZ; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6d8f544d227so25510496d6.1;
        Tue, 10 Dec 2024 15:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733873752; x=1734478552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVtvsX1VX7OA3FwGU9zRQjPhHjvc9P0ydo96eJR3gGo=;
        b=FF9q0scZ73Slj1aCxh8cqYxsvdDB6shprP8z4xHUPecRCj08ChL1QS7mRkZQ482Y0c
         5Sc/rOWyMK+mYgrzefmJuKXurI8KIlDdIqvtd7jp6bDTOIv4cEQYjP9laVlrggkW/AEf
         /syjDpbnyY1Bk5zHGDllQxeUBdqErrP+zy+N6nu6EqgNfcnroi74VmwLJoSxiNL2udmJ
         LjLPyCM3AHmhDJEP+UfbniIQZjuDlIfF/ywWitZTNx7jdkp81gQHrUrXPrw8IJplN+Wo
         vzNd7n9MEGfspYEs/lYoaVR2Bfwil8Q5ytyUAbMPIyUHnRBrxbQckXp0KK5bxHjaazsr
         K7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733873752; x=1734478552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVtvsX1VX7OA3FwGU9zRQjPhHjvc9P0ydo96eJR3gGo=;
        b=knmdmJ0EsHoQ0xy+DXjJS7l0HwDWKJJUkxzYUC1oB+Bz62uEe3XE0r0+ANoZ4cG+5r
         3ViYEhdD6OL6QCEdxUzTQJst7lUtB1DtC5diVqcLQivHX3076Byx2yzGH/0yFfNATTMZ
         suHe69dw2d2X8DpuwpraMQgRuVzU1xwj0tFTCuu4KaYggj83B6tQhQm8Uarqw9rq3f7O
         T3PejHTt+4VywRyW2zZr+/phDc5ZujoNQjZL5VtCxJkuUXqiKXuMOAmJaKCyLe3aO/yA
         FpJycLN8+OpHVAteGYHAESBYET+v2/ve+0HBsgGvIfknQsxvQOYAAJYZGVNsPynFc/Xm
         la/A==
X-Forwarded-Encrypted: i=1; AJvYcCVzTFkEWpe/eoQNGqgqengzNqAN/0HGoLOC63tR1is2bmdTBealdHJYaUgTwIe72ui317JM/W2tdrKP@vger.kernel.org, AJvYcCWIabgJcyKBQ38BJvlpkVjP4UMWme6u+c3rSyAFTVBThYvkYke3zYQ5g5keojI5u0NfcqRTMOHwpCby1UI=@vger.kernel.org, AJvYcCXemYw1cFff5xJIwl8dm63SIQZpZqeILhQSxaJKvQx9MvtIzon+8dppAYRN38g1fCg7XuD1XdDDJtNlE9YsOA==@vger.kernel.org, AJvYcCXh1lNNr8Slz4qIThIO5/OV12u42mvrFys3Ie6chAfVEdf28wXzauHX4qyyRyzrLgEqE+dIMTHDZJ/N@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1uX+EJ9aXZBac8l3mUtMv71y+x+IQVs8d/X2CCw2KHfII1/17
	ByyGhE4/q3XeZnEk6GSZvKztFyB/9AqGBnbFbyDDUoYTz/Kim2UGt+v5dsaT
X-Gm-Gg: ASbGncthL2DgOSf3cu9At7grmle5I5WlNle4V50vrwX6SIYXonTTo+94CdFBJAbd6F3
	GMzQSBBZ2aQT64GbHos2nSLuC2wyGI0tTYb6PwJCI0IEoCn4zDse7D47pagIk7+5OMys0EsC9s5
	3EWe/pDcWQNt5M3tk4r4LnjsOJSFPpDOl4CygLm5TXngP1h5laGtbz3qse6Z15C9pI1HVeQBGUu
	+yC77RcrUi0jEFr3P+rHEDVNcqaqLLBBw9Xqi3l9Q==
X-Google-Smtp-Source: AGHT+IHSC4LbRoXFyWs/OLsmbqI9o7secRuP+kJ/j9y3Siyxrwd9CBx6Ny/2DVpSH+AHxV4XFzXlSA==
X-Received: by 2002:a05:6214:2628:b0:6d8:899e:c3bf with SMTP id 6a1803df08f44-6d934b7c98cmr17068446d6.34.1733873752568;
        Tue, 10 Dec 2024 15:35:52 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::6d3f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8e7883a0dsm55183416d6.45.2024.12.10.15.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 15:35:52 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v7 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
Date: Tue, 10 Dec 2024 18:35:37 -0500
Message-ID: <20241210233534.614520-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210233534.614520-7-mailingradian@gmail.com>
References: <20241210233534.614520-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As found in the Pixel 3a, the Snapdragon 670 has a camera subsystem with
3 CSIDs and 3 VFEs (including 1 VFE lite). Add this camera subsystem to
the bindings.

Adapted from SC8280XP camera subsystem.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/media/qcom,sdm670-camss.yaml     | 318 ++++++++++++++++++
 1 file changed, 318 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
new file mode 100644
index 000000000000..7c3636f63add
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -0,0 +1,318 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SDM670 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Richard Acayan <mailingradian@gmail.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,sdm670-camss
+
+  reg:
+    maxItems: 9
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite
+
+  clocks:
+    maxItems: 22
+
+  clock-names:
+    items:
+      - const: gcc_camera_ahb
+      - const: gcc_camera_axi
+      - const: soc_ahb
+      - const: camnoc_axi
+      - const: cpas_ahb
+      - const: csi0
+      - const: csi1
+      - const: csi2
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: vfe0_axi
+      - const: vfe0
+      - const: vfe0_cphy_rx
+      - const: vfe1_axi
+      - const: vfe1
+      - const: vfe1_cphy_rx
+      - const: vfe_lite
+      - const: vfe_lite_cphy_rx
+
+  interrupts:
+    maxItems: 9
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite
+
+  iommus:
+    maxItems: 4
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: top
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
+          Input port for receiving CSI data from CSIPHY0.
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
+          Input port for receiving CSI data from CSIPHY1.
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
+          Input port for receiving CSI data from CSIPHY2.
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
+  vdda-phy-supply:
+    description:
+      Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to PHY refclk pll block.
+
+required:
+  - reg
+  - reg-names
+  - clock-names
+  - clocks
+  - compatible
+  - interrupts
+  - interrupt-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss@acb3000 {
+            compatible = "qcom,sdm670-camss";
+
+            reg = <0 0x0acb3000 0 0x1000>,
+                  <0 0x0acba000 0 0x1000>,
+                  <0 0x0acc8000 0 0x1000>,
+                  <0 0x0ac65000 0 0x1000>,
+                  <0 0x0ac66000 0 0x1000>,
+                  <0 0x0ac67000 0 0x1000>,
+                  <0 0x0acaf000 0 0x4000>,
+                  <0 0x0acb6000 0 0x4000>,
+                  <0 0x0acc4000 0 0x4000>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe_lite";
+
+            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "vfe0",
+                              "vfe1",
+                              "vfe_lite";
+
+            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+                     <&gcc GCC_CAMERA_AXI_CLK>,
+                     <&camcc CAM_CC_SOC_AHB_CLK>,
+                     <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_0_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_1_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_CSIPHY0_CLK>,
+                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY1_CLK>,
+                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY2_CLK>,
+                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+                     <&camcc CAM_CC_IFE_0_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_1_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_1_CLK>,
+                     <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
+            clock-names = "gcc_camera_ahb",
+                          "gcc_camera_axi",
+                          "soc_ahb",
+                          "camnoc_axi",
+                          "cpas_ahb",
+                          "csi0",
+                          "csi1",
+                          "csi2",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "vfe0_axi",
+                          "vfe0",
+                          "vfe0_cphy_rx",
+                          "vfe1_axi",
+                          "vfe1",
+                          "vfe1_cphy_rx",
+                          "vfe_lite",
+                          "vfe_lite_cphy_rx";
+
+            iommus = <&apps_smmu 0x808 0x0>,
+                     <&apps_smmu 0x810 0x8>,
+                     <&apps_smmu 0xc08 0x0>,
+                     <&apps_smmu 0xc10 0x8>;
+
+            power-domains = <&camcc IFE_0_GDSC>,
+                            <&camcc IFE_1_GDSC>,
+                            <&camcc TITAN_TOP_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "top";
+
+            vdda-phy-supply = <&vreg_l1a_1p225>;
+            vdda-pll-supply = <&vreg_l8a_1p8>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    csiphy_ep0: endpoint {
+                        clock-lanes = <7>;
+                        data-lanes = <0 1 2 3>;
+                        remote-endpoint = <&front_sensor_ep>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.47.1


