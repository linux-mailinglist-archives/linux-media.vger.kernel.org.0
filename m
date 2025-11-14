Return-Path: <linux-media+bounces-47075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA4EC5CDC7
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 12:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B59393B52A9
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 11:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DCD30E0CC;
	Fri, 14 Nov 2025 11:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="MIy5dAwd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319D1313E19
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763119709; cv=none; b=G+WshhdTxdlfraMR5v2CYzzPXDYFCPanT+IZeb96SSCuJt+huiEdaOYAP9XLMEpAHYKTx1LHfWBAvSi7nfRetr7U2MsnYR38Wkx4Jx8CV0S+hs1BNe29NV5KW78XunaYyQQSFILKcDVfZrMAIQwIcIA5b3IZJ0XmzlyhYrMGwoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763119709; c=relaxed/simple;
	bh=/S23R6NPxxcUB7EFrjrjJD+zFo5wUrwgcrX3z6Df+NE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V24yKqlIEs4JsvXFtg+c2KhRQWdR0CvZzg+ddhTixCcm2T3YFF2+FDBfYgBzTmhoGyRVHWldA+YOF7vyJZMXdSHnGxpowQCkbllGUqW1tH4R9lqs4fp+9fRmMcHQO5M2y8wTNqzKHiiPL2M6Ed503aodwPqUV4WXZfGU+5JAUl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=MIy5dAwd; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-640d0ec9651so3149959a12.3
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1763119705; x=1763724505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gl3epIlLl7Tc1GtlyfjuxRhy4e/9yM+OE7CJKB0qzSY=;
        b=MIy5dAwdb0WL+H3lkbBaEreY7+3+JcEvWROOfN3MlfF7Z5LFRV8DjilA51PO8hJ8MK
         EU4tM4cIVHMyYDes2D/emxiEVWEbHxxGo7sta8Ly9kGd885JNfO0y5WoAuKz8HQiPWUK
         IN/KKT3nXs0xjR5zblpBPk66IIS6zJqvnFKWqVCl7EFjKJq57Mo4V13yKlzH7/U6qe/u
         d88L0Yn1QQ9LEjjMfX7elTeizQ5QWegU+HH1Va+oDv7idjjFf0zmxKJmtkEyUAd7Ceol
         53zjEf4Es0qwoMJxMpZ+8xj65qODBn0cc27K6P+TUohVBr1Hk4xINUc1YWs2R8+X6tSw
         s4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763119705; x=1763724505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gl3epIlLl7Tc1GtlyfjuxRhy4e/9yM+OE7CJKB0qzSY=;
        b=glnpS3JbnDZ3+EkRLODVina4p/jKact9Fpq1kVEttXt07V1I8tndNc2ALXUe9LMbaJ
         C61m2bVL7GfQ2XRPBFOiX/iDHA7l4fyHpgtoj+jDqOpJv1XzhAatZph5AayNe++nKDhn
         rH3O79PdPjzhZ/TqHN5TG/4bUWkhsGZvTy3crWASK82Uk0CMJTg5gVqd8RgjP0LMvtRo
         f/IVMnPtlxEsD1Bh3yKlNNawetZ4g4nMjZsbZgtfDkTMRfofKlNxhaECSP88TqNE6d9m
         GBAVbC2cXda4Ryd1uwGONYOt6JAds/vEpd4XfLGZVFmYUgBHfLE8nVu35BlEARWHkIRl
         JsHg==
X-Forwarded-Encrypted: i=1; AJvYcCVoTJu3hENAbPuJOBW8oK4JuTcD5LimTAtYgXFn0qp9SqXnRANBRRIk6TWrLVY8LYJlCcQXVPgeXxSWew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEIBsnmAPhm5BpkrjNSW/wfCWO2ZHBQ4b6g/rjIqX5FN1ymrmK
	e9N3kc78jJ9VaDB72iOIVy2y9ryDAjuKfiBcM+a7XLmrdUcVk0I79+z3fmsKLlyxNbs3+jFnvb9
	yql4vzwd9gg==
X-Gm-Gg: ASbGncvomxVG6jybBhWOvH2h0WgyKnNJFbnJcdGILGTGOsXv2quTZODeU+qtZ90wJs1
	5AnmiAbXJbdh5RPh6CwMOcDiCLo+b4Syk3HJNKiD3dZ+AB7ZSj9HFR+59gqDnB5Vx0RFXl/fUQK
	krJgJJvivz7bFgpcHpPDwTwPpXREEkNy4srtGd2ChRV4uOZpVg0j/bZB/p1zbnKl3ZDYFPMeF54
	3Jo2L0HlL+iL9ZH/4TuVS618/YogUKxfnsJuftKEr3TZGt+j44nCVeKMkvVBlwh4+YA9j0nkdB5
	E4Ct5KpfTIM2vn/IjGmXACK+yWIxpfr+dNfMOT/nncHs5fzDQXwZ59ywZLv5g2tVca56sZ7xWy6
	9AFvAoCEA4Y5brwhx4zUZyLz044QyG4Ob3uA3sf+nhJ/uvaBkkhmYofKKlFhXjPfXFVzbj1eQxH
	J4ZcHi+O7ZuV7sMQ12imUPYg9aE1G7Ee8MP5CC9C79sEltDM8/MgdZwGvl9TP+3JCNalQdICGSz
	FrknaYJ53qNnrU+gqPNn+0tetfnZCFSYg==
X-Google-Smtp-Source: AGHT+IEsntk45EuVA5s+n0Krc7PiTHKVH72ejTjqolh8+9LQCik6WNPdvw0miP5RuEceLSiYEpvgWQ==
X-Received: by 2002:a17:907:da9:b0:b73:2ef6:9e84 with SMTP id a640c23a62f3a-b7367b9b13emr288524866b.48.1763119705447;
        Fri, 14 Nov 2025 03:28:25 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0509-ec01-156d-fa6e-7f19-0b67.cable.dynamic.v6.ziggo.nl. [2001:1c04:509:ec01:156d:fa6e:7f19:b67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb91bsm366887766b.70.2025.11.14.03.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:28:25 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 14 Nov 2025 12:15:24 +0100
Subject: [PATCH v2 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-sm6350-camss-v2-1-d1ff67da33b6@fairphone.com>
References: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
In-Reply-To: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763119703; l=12344;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=/S23R6NPxxcUB7EFrjrjJD+zFo5wUrwgcrX3z6Df+NE=;
 b=6ryd0fiRjFexL+4s+k7LVIB0DV33Z7PT8olH36tZBkl1L4E27RqlFeAch4gBTwglRTgKKLU8l
 iturIEHA7fcCrrfbBGLgFUGXROX1QofwhGZHN7OYt+8ZQf0duBEy6Yg
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings for the Camera Subsystem on the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/media/qcom,sm6350-camss.yaml          | 349 +++++++++++++++++++++
 1 file changed, 349 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
new file mode 100644
index 000000000000..d812b5b50c05
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
@@ -0,0 +1,349 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm6350-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM6350 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,sm6350-camss
+
+  reg:
+    maxItems: 12
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite
+
+  clocks:
+    maxItems: 30
+
+  clock-names:
+    items:
+      - const: cam_ahb_clk
+      - const: cam_axi
+      - const: soc_ahb
+      - const: camnoc_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy3
+      - const: csiphy3_timer
+      - const: slow_ahb_src
+      - const: vfe0_axi
+      - const: vfe0
+      - const: vfe0_cphy_rx
+      - const: vfe0_csid
+      - const: vfe1_axi
+      - const: vfe1
+      - const: vfe1_cphy_rx
+      - const: vfe1_csid
+      - const: vfe2_axi
+      - const: vfe2
+      - const: vfe2_cphy_rx
+      - const: vfe2_csid
+      - const: vfe_lite
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+
+  interrupts:
+    maxItems: 12
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+      - const: sf_mnoc
+      - const: sf_icp_mnoc
+
+  iommus:
+    maxItems: 4
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: top
+      - const: ife0
+      - const: ife1
+      - const: ife2
+
+  vdd-csiphy-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to a PHY.
+
+  vdd-csiphy-1p25-supply:
+    description:
+      Phandle to a 1.25V regulator supply to a PHY.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-3]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+        description:
+          Input port for receiving CSI data from a CSIPHY.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - vdd-csiphy-0p9-supply
+  - vdd-csiphy-1p25-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sm6350.h>
+    #include <dt-bindings/clock/qcom,sm6350-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm6350.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@acb3000 {
+            compatible = "qcom,sm6350-camss";
+
+            reg = <0x0 0x0acb3000 0x0 0x1000>,
+                  <0x0 0x0acba000 0x0 0x1000>,
+                  <0x0 0x0acc1000 0x0 0x1000>,
+                  <0x0 0x0acc8000 0x0 0x1000>,
+                  <0x0 0x0ac65000 0x0 0x1000>,
+                  <0x0 0x0ac66000 0x0 0x1000>,
+                  <0x0 0x0ac67000 0x0 0x1000>,
+                  <0x0 0x0ac68000 0x0 0x1000>,
+                  <0x0 0x0acaf000 0x0 0x4000>,
+                  <0x0 0x0acb6000 0x0 0x4000>,
+                  <0x0 0x0acbd000 0x0 0x4000>,
+                  <0x0 0x0acc4000 0x0 0x4000>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "csiphy3",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite";
+
+            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+                     <&gcc GCC_CAMERA_AXI_CLK>,
+                     <&camcc CAMCC_SOC_AHB_CLK>,
+                     <&camcc CAMCC_CAMNOC_AXI_CLK>,
+                     <&camcc CAMCC_CORE_AHB_CLK>,
+                     <&camcc CAMCC_CPAS_AHB_CLK>,
+                     <&camcc CAMCC_CSIPHY0_CLK>,
+                     <&camcc CAMCC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAMCC_CSIPHY1_CLK>,
+                     <&camcc CAMCC_CSI1PHYTIMER_CLK>,
+                     <&camcc CAMCC_CSIPHY2_CLK>,
+                     <&camcc CAMCC_CSI2PHYTIMER_CLK>,
+                     <&camcc CAMCC_CSIPHY3_CLK>,
+                     <&camcc CAMCC_CSI3PHYTIMER_CLK>,
+                     <&camcc CAMCC_SLOW_AHB_CLK_SRC>,
+                     <&camcc CAMCC_IFE_0_AXI_CLK>,
+                     <&camcc CAMCC_IFE_0_CLK>,
+                     <&camcc CAMCC_IFE_0_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_0_CSID_CLK>,
+                     <&camcc CAMCC_IFE_1_AXI_CLK>,
+                     <&camcc CAMCC_IFE_1_CLK>,
+                     <&camcc CAMCC_IFE_1_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_1_CSID_CLK>,
+                     <&camcc CAMCC_IFE_2_AXI_CLK>,
+                     <&camcc CAMCC_IFE_2_CLK>,
+                     <&camcc CAMCC_IFE_2_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_2_CSID_CLK>,
+                     <&camcc CAMCC_IFE_LITE_CLK>,
+                     <&camcc CAMCC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_LITE_CSID_CLK>;
+            clock-names = "cam_ahb_clk",
+                          "cam_axi",
+                          "soc_ahb",
+                          "camnoc_axi",
+                          "core_ahb",
+                          "cpas_ahb",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "csiphy3",
+                          "csiphy3_timer",
+                          "slow_ahb_src",
+                          "vfe0_axi",
+                          "vfe0",
+                          "vfe0_cphy_rx",
+                          "vfe0_csid",
+                          "vfe1_axi",
+                          "vfe1",
+                          "vfe1_cphy_rx",
+                          "vfe1_csid",
+                          "vfe2_axi",
+                          "vfe2",
+                          "vfe2_cphy_rx",
+                          "vfe2_csid",
+                          "vfe_lite",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid";
+
+            interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 717 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 718 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "csiphy3",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite";
+
+            interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc",
+                                 "sf_mnoc",
+                                 "sf_icp_mnoc";
+
+            iommus = <&apps_smmu 0x820 0xc0>,
+                     <&apps_smmu 0x840 0x0>,
+                     <&apps_smmu 0x860 0xc0>,
+                     <&apps_smmu 0x880 0x0>;
+
+            power-domains = <&camcc TITAN_TOP_GDSC>
+                            <&camcc IFE_0_GDSC>,
+                            <&camcc IFE_1_GDSC>,
+                            <&camcc IFE_2_GDSC>;
+            power-domain-names = "top",
+                                 "ife0",
+                                 "ife1",
+                                 "ife2";
+
+            vdd-csiphy-0p9-supply = <&vreg_l18a>;
+            vdd-csiphy-1p25-supply = <&vreg_l22a>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    csiphy0_ep: endpoint {
+                        data-lanes = <0 1 2 3>;
+                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                        remote-endpoint = <&sensor_ep>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.51.2


