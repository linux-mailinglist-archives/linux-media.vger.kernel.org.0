Return-Path: <linux-media+bounces-23738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4EE9F70AA
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 00:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 668951889D3A
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 23:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664191FD7A3;
	Wed, 18 Dec 2024 23:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZak6fHr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6C61FCD0C;
	Wed, 18 Dec 2024 23:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734563956; cv=none; b=s6yoZHJ78KiG2++d8XBSmskepSETmStQz2lweB7OpOmU8AZlmM5vPYl6cmScvY0CuC0JbkPuZLTKCtH3NcviTea89/nWJj0anHuskJZXsoH9lRj8//Dxr9d0wDOLdiBeBJdkl08JHdzKd7fcI5EBdWymWJ2ccaSh+LYiuk3RHNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734563956; c=relaxed/simple;
	bh=qyaCuCa4gDWf4lPIQ6DQ2cmbsLSQ6GruHVjXnVxOqU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s5mL6sjeqd9Gv6f9gbqY2sp9S6BgBTQTuOJQj7rDjYcPFxXKP4rfmc40GDNxzHdZ8S4fJ8MxsnRKZdy01SN5MmYs99OAZNGwWqzm30XZPk+z/4rnfb3QSjnvoMTj51Nm0IDYtZoatUsjqPB2njTOu9CbpukEH4BaKToGbsEJnqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZak6fHr; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-844e61f3902so18885439f.0;
        Wed, 18 Dec 2024 15:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734563954; x=1735168754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJ/13WVnxEsU4PKR0aHPd6kIMA/P8PZaMf8INR7sqYU=;
        b=hZak6fHrDcMwhwzUsXtCY1GbNBJGJG0DYKjhuKJNszi08oLz9cjpWB9cTqdPUnUTIJ
         sys27Fquqv8CF//NP8TZDQopjozK/TmRtnaY8dqEs536duEmEeAaNcyeDCCRjeeFZzmQ
         fBQH25UaIyN9QJF0rcUrFzmBsqi+3GlpMX604x/TEgTgfn/OGuDaT6GFf+QM4T7leiuk
         h4m2UOthJOMLx7AEMR0tGA/C5GKOpOhldJbVk9CZ2LemC1HaXCb/G9wPUGWdN41DnpQy
         IT/0TVTasno6xrAr45JyVec+JlyaZ4krC6kpoK1A2JrnV9S1spytgzPpaRAmq8mr5QBI
         V5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734563954; x=1735168754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJ/13WVnxEsU4PKR0aHPd6kIMA/P8PZaMf8INR7sqYU=;
        b=n6aqmi+0m2vptbMV7DVyKA9kLCS69gG9pNDlLPr2oWKKj29EUZD5wDxvSbU13tiRtq
         6Cy1XH4ddEprDWirR8IbIWyq7ie5xjxSjfom7XC/h8/2Pi2LJ2XwahOCGyZXEsQ+tukX
         M4CFvCy51A6uId7IOpWQqDVI4hhTSOb52ILALQtlomK12VPM5+88JcWitJ+McgR1G6rU
         36+o+De5RLqdEpuwdemrj7nHc5DVhJcxYxMOpyCk2HrdUgKXb+q6/zYa2Mv3as+1lydp
         smXL9oLrhTCuW8Cfx8sLocaTpeDT0Rl1E5FoJIKSlYFzIoPFk1ipaK7iUBzGd3ULoWVI
         9HxA==
X-Forwarded-Encrypted: i=1; AJvYcCV617NOjkun2Vq+stmCjzOQBa7cR0mziQzrZQIryOtz6EZLpc7CHaAdAw3aAMWhqIVNxYj8Lc5EPFIh@vger.kernel.org, AJvYcCVX50QdTTewRNoWCmoWGnqG7Q6MYnfj0ken1tQnZrRKyTi0+vuRW7KXkkb5yWxMYpgbqTUc3faAhRGPwirjLA==@vger.kernel.org, AJvYcCWwKLLqxeppiAHOdvNGPM70E2IdlEh3ChyLXsHGqTufGiEEfqdHI3cVn0Spc/Rd03CvT3NJ+bSJ5HnwO/4=@vger.kernel.org, AJvYcCWza8JHJwNdd2yPgODgUqWguYaW5nVQ2CqsSNTDQf2kkV98HbnhyavdTq9dK6dBOrrek1J/0iPNFrb0@vger.kernel.org
X-Gm-Message-State: AOJu0YyH3VYU6isZyn+p6qssLf97sh0Yhd/Wz5YAo32vzoml50Kr+A1H
	0169U77O6NGOkcftOjt/E2kTb86TgsUlFXazTgEFifUJag0BwQ4VA6P+JcM/
X-Gm-Gg: ASbGncubVgtduC89z/Io2IRT+4q3BBEqiar9xs6QQ8rdmJg1kGH1GC5M8+lYh9Fo4DY
	fiilN9BnFZu7R/JEegw3EOTnS+E+GLStUMvOQRqVUm61VEqzo2jJqbqe0Imx9QRB79ShHm5CCJM
	TJzRfDuQ6LQGJSOow3TKh2fAXF0dryI7BuwjqrSJhubviGVEqYFS7DEb2p1jMuKurbSJj0OAV91
	EKkfHNfbbti3peWjpWdgLsCoblhTaA+7RVggJiPeIE=
X-Google-Smtp-Source: AGHT+IHGl38QahnZYMVDvlY/AJOkQiHsJaw5XjinB0couhGC5PJeLbx9rQPHfGc0f9vGGnLAPXjPOQ==
X-Received: by 2002:a05:6602:13d4:b0:842:ef83:d3cf with SMTP id ca18e2360f4ac-84987da8469mr133239639f.11.1734563954211;
        Wed, 18 Dec 2024 15:19:14 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::eca])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-844f62583f6sm246194739f.14.2024.12.18.15.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:19:12 -0800 (PST)
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
Subject: [PATCH v9 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
Date: Wed, 18 Dec 2024 18:17:32 -0500
Message-ID: <20241218231729.270137-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218231729.270137-7-mailingradian@gmail.com>
References: <20241218231729.270137-7-mailingradian@gmail.com>
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/qcom,sdm670-camss.yaml     | 318 ++++++++++++++++++
 1 file changed, 318 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
new file mode 100644
index 000000000000..35c40fe22376
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
+  clocks:
+    maxItems: 22
+
+  clock-names:
+    items:
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
+      - const: gcc_camera_ahb
+      - const: gcc_camera_axi
+      - const: soc_ahb
+      - const: vfe0
+      - const: vfe0_axi
+      - const: vfe0_cphy_rx
+      - const: vfe1
+      - const: vfe1_axi
+      - const: vfe1_cphy_rx
+      - const: vfe_lite
+      - const: vfe_lite_cphy_rx
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
+  vdda-phy-supply:
+    description:
+      Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to PHY refclk pll block.
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
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
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
+        isp@acb3000 {
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
+            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
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
+                     <&gcc GCC_CAMERA_AHB_CLK>,
+                     <&gcc GCC_CAMERA_AXI_CLK>,
+                     <&camcc CAM_CC_SOC_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_1_CLK>,
+                     <&camcc CAM_CC_IFE_1_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
+            clock-names = "camnoc_axi",
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
+                          "gcc_camera_ahb",
+                          "gcc_camera_axi",
+                          "soc_ahb",
+                          "vfe0",
+                          "vfe0_axi",
+                          "vfe0_cphy_rx",
+                          "vfe1",
+                          "vfe1_axi",
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


