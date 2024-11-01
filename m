Return-Path: <linux-media+bounces-20699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D94F9B9264
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 14:48:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D7EA282893
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 13:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55B41AB6C1;
	Fri,  1 Nov 2024 13:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mqHBtHly"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672A71A0BCA;
	Fri,  1 Nov 2024 13:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730468856; cv=none; b=Pg+lavu3AElQqutfDXxGjUy822vC/GZRVrWWjmFqrkPFGl9YLSYlGYQRDpu5PCUTmdQfVSRYemp9WYsAnjKW6CPNvg6Gi+//hze5+wllHOBK2iz/XxRnSwv+bwJaHXrg1BQNrtpIiqHqswnLZraeNTY54T0Uj2MdET1umq+J6pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730468856; c=relaxed/simple;
	bh=DwmODMOYpxKs8pDkFiU4d0qnyC6Z3t2oHSTorqoxBgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XyuIEvCozqgmikXBEe/TUi0MOsjtTEt8t/O3h07vScKNn7+R9smvLAdSitCg4kqrRzPI2qU10zrFltE9x1shWr9UmBYizgBFayy0PaV3026rk/U68eT5N9ubi0zqmjIffLP8FS/q1mLdmC63/Mr7Wzsp8nj12hASr1kE9u8Kmrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mqHBtHly; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.1.130] (BC24930C.dsl.pool.telekom.hu [188.36.147.12])
	by mail.mainlining.org (Postfix) with ESMTPSA id 10C98E45B9;
	Fri,  1 Nov 2024 13:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1730468845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ox8yrRy/Sv/0CUQ9KvYBPQy6VLCzEuPVzIca908upCw=;
	b=mqHBtHly5OmyTmBkaMEGy6VYo5hYI3PvrHpwciMC/bFniu9czNfIU9lwz100/lYEhGxrhV
	BbHVInPpj3mq+auVwL9lxReu8IqfrWu8NL1Sop/LbLsw8blZk3MJdbkCMhA3fFP5RWjJQZ
	PwclpEivErHSBm9R2KRbVoWZqPII/wWprBJN9gl01ApMD7VM3yQF+BcCKwkZ3IVbiyuhqL
	JrAbQykV9RY7UP7lq2v2Ex5/gxpbcYSlPjT204S0NwT0/PWPxBtfRQzz3jPYulTZlt+DrA
	4lvwaILtB4wtWui3eJUeooBBnJuBqcfOf3L3ZdFfSVaNuwZM5zRWrbQ9vDHUUA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 01 Nov 2024 14:47:23 +0100
Subject: [PATCH 2/3] media: dt-bindings: media: camss: Add
 qcom,msm8953-camss binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241101-camss-msm8953-v1-2-4012559fcbc2@mainlining.org>
References: <20241101-camss-msm8953-v1-0-4012559fcbc2@mainlining.org>
In-Reply-To: <20241101-camss-msm8953-v1-0-4012559fcbc2@mainlining.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Barnabas Czeman <barnabas.czeman@mainlining.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730468843; l=8890;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=DwmODMOYpxKs8pDkFiU4d0qnyC6Z3t2oHSTorqoxBgg=;
 b=t4NLQEI7x0RMPSzlN1YNXueyw02mXOJIzhdCKCzLUZdUJwTSY1tgb4kTfjxkKYK4rC1aBYkRQ
 XhwtRthmr76CtIuljJdrfMFXprFMjcFkfQq3bmCQqMiGSLHt3JU5H7e
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add bindings for qcom,msm8953-camss in order to support the camera
subsystem for MSM8953/SDM450/SDM632.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../bindings/media/qcom,msm8953-camss.yaml         | 320 +++++++++++++++++++++
 1 file changed, 320 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..39b9c58e2a2ea2e1ad434aa35bf6ee128d3a0649
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml
@@ -0,0 +1,320 @@
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
+      - const: top_ahb
+      - const: ispif_ahb
+      - const: micro_ahb
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
+      - const: ahb
+      - const: vfe0
+      - const: csi_vfe0
+      - const: vfe0_ahb
+      - const: vfe0_axi
+      - const: vfe1
+      - const: csi_vfe1
+      - const: vfe1_ahb
+      - const: vfe1_axi
+
+  interrupts:
+    minItems: 9
+    maxItems: 9
+
+  interrupt-names:
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csid0
+      - const: csid1
+      - const: csid2
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
+      - const: csiphy0
+      - const: csiphy0_clk_mux
+      - const: csiphy1
+      - const: csiphy1_clk_mux
+      - const: csiphy2
+      - const: csiphy2_clk_mux
+      - const: csid0
+      - const: csid1
+      - const: csid2
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
+    #include <dt-bindings/clock/qcom,gcc-msm8953.h>
+
+    camss: camss@1b00000 {
+
+      compatible = "qcom,msm8953-camss";
+
+      clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+        <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
+        <&gcc GCC_CAMSS_MICRO_AHB_CLK>,
+        <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+        <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+        <&gcc GCC_CAMSS_CSI2PHYTIMER_CLK>,
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
+        <&gcc GCC_CAMSS_CSI2_AHB_CLK>,
+        <&gcc GCC_CAMSS_CSI2_CLK>,
+        <&gcc GCC_CAMSS_CSI2PHY_CLK>,
+        <&gcc GCC_CAMSS_CSI2PIX_CLK>,
+        <&gcc GCC_CAMSS_CSI2RDI_CLK>,
+        <&gcc GCC_CAMSS_AHB_CLK>,
+        <&gcc GCC_CAMSS_VFE0_CLK>,
+        <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
+        <&gcc GCC_CAMSS_VFE0_AHB_CLK>,
+        <&gcc GCC_CAMSS_VFE0_AXI_CLK>,
+        <&gcc GCC_CAMSS_VFE1_CLK>,
+        <&gcc GCC_CAMSS_CSI_VFE1_CLK>,
+        <&gcc GCC_CAMSS_VFE1_AHB_CLK>,
+        <&gcc GCC_CAMSS_VFE1_AXI_CLK>;
+
+      clock-names = "top_ahb",
+        "ispif_ahb",
+        "micro_ahb",
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
+        "ahb",
+        "vfe0",
+        "csi_vfe0",
+        "vfe0_ahb",
+        "vfe0_axi",
+        "vfe1",
+        "csi_vfe1",
+        "vfe1_ahb",
+        "vfe1_axi";
+
+      iommus = <&apps_iommu 0x14>;
+
+      interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 315 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>,
+        <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
+
+      interrupt-names = "csiphy0",
+        "csiphy1",
+        "csiphy2",
+        "csid0",
+        "csid1",
+        "csid2",
+        "ispif",
+        "vfe0",
+        "vfe1";
+
+      power-domains = <&gcc VFE0_GDSC>,
+        <&gcc VFE1_GDSC>;
+
+      reg = <0x1b34000 0x1000>,
+        <0x1b00030 0x4>,
+        <0x1b35000 0x1000>,
+        <0x1b00038 0x4>,
+        <0x1b36000 0x1000>,
+        <0x1b00040 0x4>,
+        <0x1b30000 0x100>,
+        <0x1b30400 0x100>,
+        <0x1b30800 0x100>,
+        <0x1b31000 0x500>,
+        <0x1b00020 0x10>,
+        <0x1b10000 0x1000>,
+        <0x1b14000 0x1000>;
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
2.47.0


