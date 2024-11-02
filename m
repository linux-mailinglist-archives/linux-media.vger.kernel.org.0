Return-Path: <linux-media+bounces-20712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8FC9B9BF9
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 02:33:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F5B31F21DAB
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 01:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADD213BC39;
	Sat,  2 Nov 2024 01:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="KkFv6oq1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58311F94A;
	Sat,  2 Nov 2024 01:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730511158; cv=none; b=roLM1z0MGJ69l+kC//MCzTUI6Y/DBn2RlyT4Sz7yuDFRPWAQU0zxkTlBPCeYrI4RPGQLl+g5FGGmww+pOCi52X3Qa91FFBny3U4LUmaAydxTvyx7zRR2s208pE18crM+kTBwQkl8/XN3OV2K3hHTyWsQ5C9mDgPOqlYnH7GrATQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730511158; c=relaxed/simple;
	bh=XPNA6B5cEE8rCNfCtg7Lp2RRbMNj5V+og5quAKLIVfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ptYHqI83Ajzu5z+y3z/wLHLi4sMw4XwCtaw8vvcymfAWUEpmYwjPAgpnnN3CdtTMnQMYAvyKbNJ6OrugBXBpQpJrkyI+r9jSfd4MiDOvIv6EIcIbDYa11msaMYTpRuYI53fzZWNO3qTpnQg8ft1416ERnnzCSl41dcivh/SlszM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=KkFv6oq1; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.0.162] (BC24930C.dsl.pool.telekom.hu [188.36.147.12])
	by mail.mainlining.org (Postfix) with ESMTPSA id 57290E45BA;
	Sat,  2 Nov 2024 01:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1730511154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Apk67wLTBkhN5MCQOG+b4dkz48aQtI/Z6ArHqr0IFaw=;
	b=KkFv6oq145opTnah4Pru4PvmhEmBkFgsNZxckIAXcMbueEW5r58S7QNLiPAZua+wASuIJi
	SzoZ5J0nHw7yldcByjkbyH5VNZwIdtiT3c4CdaCuQg/he4ujuU3xGnRqIl9g+cosLhX5fU
	zSgrug+znN57tIss7DfU/McO1k9fAFvuxvkp6SeBpjGqZmay0qq86FtbKXHzTDEC7t07/e
	M5yrJhSt4ossRRChu4weHH10kyHUePwjIfGxvpI1JTUbXc8/DXSnktKOGlGP+fxCVUuCJG
	jXk1f7OucxeW0+qU3b7u4kPDbXhwpjRF7MjahTCNC1eF0z920E3JVS0sD3GiTA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sat, 02 Nov 2024 02:32:29 +0100
Subject: [PATCH v2 2/3] media: dt-bindings: media: camss: Add
 qcom,msm8953-camss binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241102-camss-msm8953-v2-2-837310e4541c@mainlining.org>
References: <20241102-camss-msm8953-v2-0-837310e4541c@mainlining.org>
In-Reply-To: <20241102-camss-msm8953-v2-0-837310e4541c@mainlining.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Barnabas Czeman <barnabas.czeman@mainlining.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730511153; l=10213;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=XPNA6B5cEE8rCNfCtg7Lp2RRbMNj5V+og5quAKLIVfU=;
 b=GmCRZR2VdWC5Xho296DJf+37eQsoH3V2JI4TiI8cfFCMcP+/uEg1TEeh5macyUtI8s3a+4iH6
 Cpejtya62rZBy0bf7s2TNEE5v22lZXDzumY/I3hdkw5j1l8v7v/kYTD
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add bindings for qcom,msm8953-camss in order to support the camera
subsystem for MSM8953/SDM450/SDM632.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../bindings/media/qcom,msm8953-camss.yaml         | 323 +++++++++++++++++++++
 1 file changed, 323 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1d2236bc8d94ba81d8b993a105dc5d6a812c727e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml
@@ -0,0 +1,323 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,msm8953-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm CAMSS ISP
+
+maintainers:
+  - Barnabas Czeman <barnabas.czeman@mainlining.org>
+
+description: |
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
+
+properties:
+  compatible:
+    const: qcom,msm8953-camss
+
+  clocks:
+    minItems: 30
+    maxItems: 30
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: csi0
+      - const: csi0_ahb
+      - const: csi0_phy
+      - const: csi0_pix
+      - const: csi0_rdi
+      - const: csi1
+      - const: csi1_ahb
+      - const: csi1_phy
+      - const: csi1_pix
+      - const: csi1_rdi
+      - const: csi2
+      - const: csi2_ahb
+      - const: csi2_phy
+      - const: csi2_pix
+      - const: csi2_rdi
+      - const: csi_vfe0
+      - const: csi_vfe1
+      - const: csiphy0_timer
+      - const: csiphy1_timer
+      - const: csiphy2_timer
+      - const: ispif_ahb
+      - const: micro_ahb
+      - const: top_ahb
+      - const: vfe0
+      - const: vfe0_ahb
+      - const: vfe0_axi
+      - const: vfe1
+      - const: vfe1_ahb
+      - const: vfe1_axi
+
+  interrupts:
+    minItems: 9
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
+      - const: ispif
+      - const: vfe0
+      - const: vfe1
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    items:
+      - description: VFE0 GDSC - Video Front End, Global Distributed Switch Controller.
+      - description: VFE1 GDSC - Video Front End, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: vfe0
+      - const: vfe1
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
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
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
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+  reg:
+    minItems: 13
+    maxItems: 13
+
+  reg-names:
+    items:
+      - const: csi_clk_mux
+      - const: csid0
+      - const: csid1
+      - const: csid2
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
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - vdda-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-msm8953.h>
+
+    camss: camss@1b00000 {
+        compatible = "qcom,msm8953-camss";
+
+        reg = <0x1b00020 0x10>,
+              <0x1b30000 0x100>,
+              <0x1b30400 0x100>,
+              <0x1b30800 0x100>,
+              <0x1b34000 0x1000>,
+              <0x1b00030 0x4>,
+              <0x1b35000 0x1000>,
+              <0x1b00038 0x4>,
+              <0x1b36000 0x1000>,
+              <0x1b00040 0x4>,
+              <0x1b31000 0x500>,
+              <0x1b10000 0x1000>,
+              <0x1b14000 0x1000>;
+        reg-names = "csi_clk_mux",
+                    "csid0",
+                    "csid1",
+                    "csid2",
+                    "csiphy0",
+                    "csiphy0_clk_mux",
+                    "csiphy1",
+                    "csiphy1_clk_mux",
+                    "csiphy2",
+                    "csiphy2_clk_mux",
+                    "ispif",
+                    "vfe0",
+                    "vfe1";
+
+        clocks = <&gcc GCC_CAMSS_AHB_CLK>,
+                 <&gcc GCC_CAMSS_CSI0_CLK>,
+                 <&gcc GCC_CAMSS_CSI0_AHB_CLK>,
+                 <&gcc GCC_CAMSS_CSI0PHY_CLK>,
+                 <&gcc GCC_CAMSS_CSI0PIX_CLK>,
+                 <&gcc GCC_CAMSS_CSI0RDI_CLK>,
+                 <&gcc GCC_CAMSS_CSI1_CLK>,
+                 <&gcc GCC_CAMSS_CSI1_AHB_CLK>,
+                 <&gcc GCC_CAMSS_CSI1PHY_CLK>,
+                 <&gcc GCC_CAMSS_CSI1PIX_CLK>,
+                 <&gcc GCC_CAMSS_CSI1RDI_CLK>,
+                 <&gcc GCC_CAMSS_CSI2_CLK>,
+                 <&gcc GCC_CAMSS_CSI2_AHB_CLK>,
+                 <&gcc GCC_CAMSS_CSI2PHY_CLK>,
+                 <&gcc GCC_CAMSS_CSI2PIX_CLK>,
+                 <&gcc GCC_CAMSS_CSI2RDI_CLK>,
+                 <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
+                 <&gcc GCC_CAMSS_CSI_VFE1_CLK>,
+                 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+                 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+                 <&gcc GCC_CAMSS_CSI2PHYTIMER_CLK>,
+                 <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
+                 <&gcc GCC_CAMSS_MICRO_AHB_CLK>,
+                 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+                 <&gcc GCC_CAMSS_VFE0_CLK>,
+                 <&gcc GCC_CAMSS_VFE0_AHB_CLK>,
+                 <&gcc GCC_CAMSS_VFE0_AXI_CLK>,
+                 <&gcc GCC_CAMSS_VFE1_CLK>,
+                 <&gcc GCC_CAMSS_VFE1_AHB_CLK>,
+                 <&gcc GCC_CAMSS_VFE1_AXI_CLK>;
+        clock-names = "ahb",
+                      "csi0",
+                      "csi0_ahb",
+                      "csi0_phy",
+                      "csi0_pix",
+                      "csi0_rdi",
+                      "csi1",
+                      "csi1_ahb",
+                      "csi1_phy",
+                      "csi1_pix",
+                      "csi1_rdi",
+                      "csi2",
+                      "csi2_ahb",
+                      "csi2_phy",
+                      "csi2_pix",
+                      "csi2_rdi",
+                      "csi_vfe0",
+                      "csi_vfe1",
+                      "csiphy0_timer",
+                      "csiphy1_timer",
+                      "csiphy2_timer",
+                      "ispif_ahb",
+                      "micro_ahb",
+                      "top_ahb",
+                      "vfe0",
+                      "vfe0_ahb",
+                      "vfe0_axi",
+                      "vfe1",
+                      "vfe1_ahb",
+                      "vfe1_axi";
+
+        interrupts = <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 315 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "csid0",
+                          "csid1",
+                          "csid2",
+                          "csiphy0",
+                          "csiphy1",
+                          "csiphy2",
+                          "ispif",
+                          "vfe0",
+                          "vfe1";
+
+        iommus = <&apps_iommu 0x14>;
+
+        power-domains = <&gcc VFE0_GDSC>,
+                        <&gcc VFE1_GDSC>;
+        power-domain-names = "vfe0", "vfe1";
+
+        vdda-supply = <&reg_2v8>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };

-- 
2.47.0


