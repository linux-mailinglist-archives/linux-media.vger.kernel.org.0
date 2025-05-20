Return-Path: <linux-media+bounces-32945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67112ABE2D6
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 20:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06FF04C32CF
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 18:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5832820C2;
	Tue, 20 May 2025 18:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K58siew7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E014425C823;
	Tue, 20 May 2025 18:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747766354; cv=none; b=hJ1i5mXIxoVX+i7BwXlDwlo7kbIVzb+WuLhgJd444oU+mrPIOpYueQMk34EM4hk3jVgYi+Y79mCoJVZ0SaOmYlQdiFgEt9nR/5iC4HQVjyn6xmjcrqAxjBQ4CkEiI/XUfcHsmGPXQtMzWVudQ3wEeurpvgkQUIFDFBbjm/tDD6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747766354; c=relaxed/simple;
	bh=jWGEiaG15UHeUiqKeGJiU9W8mxuPB22zUyymtb8huxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d9T+QWz4QDzi4R5OBD8SXkr92NZaxt8UErQ9k2r2J20G0giiVTpu1Ml4DV8CiHEIvZdWBHHLVDoBFqE0LtJ0SO34+T9UMWQHldycwPDqoHP0yXCcZoA8IH5LRpYOuhpoX1ZmYsn/LJiNg58RL6gaKJxqNCwTxXCcxprF7+HB0xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K58siew7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EEF2C4CEF3;
	Tue, 20 May 2025 18:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747766353;
	bh=jWGEiaG15UHeUiqKeGJiU9W8mxuPB22zUyymtb8huxE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K58siew7N0WxSnB0rCnCewvscvLHbCeL8one/feDy31mUrAO7wIynnR75BcA3EIbL
	 np0zXuAh+Yn52Yi2o0NxlZu26HPcAiqniFff5rNNuBLJ9gpmM+DEFSOl93mhY4ckLq
	 b7VUvTqWwbEzxOrfcmyLUxK53W7WfGte4DPttFZ/Bo9zazV/1trq3PBBwuy/bJow1Q
	 7+YKHQs4NjisDlqrfcNrpLWcUZfDB8IExJSn0+aeq+zCDZwd3JjcCIAZCMwWhukKa+
	 xjzp/LTqD3RK4h2eFqP7VOdTZ20ypqe5r59zdpF03tfUQLfUYo3lmPFx1BN/msLTM7
	 EbINEuaE/NCNA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54EBCC54E90;
	Tue, 20 May 2025 18:39:13 +0000 (UTC)
From: Vincent Knecht via B4 Relay <devnull+vincent.knecht.mailoo.org@kernel.org>
Date: Tue, 20 May 2025 20:39:08 +0200
Subject: [PATCH 3/4] media: dt-bindings: Add qcom,msm8939-camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-camss-8x39-vbif-v1-3-a12cd6006af9@mailoo.org>
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
In-Reply-To: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Vincent Knecht <vincent.knecht@mailoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747766350; l=7976;
 i=vincent.knecht@mailoo.org; s=20250414; h=from:subject:message-id;
 bh=y7LQ9HZjFsm7duqyQ0RYVQhsYL8ntJalT9/jy4Y0tFY=;
 b=34WpEJzX3p53zjOVqA65aLdZ80ZII9krbVyGM6+oO/7d65cjV8Vx287UXtr7JWWXqreML66Ct
 Y2roGVF9qCfCWDf/M6GZQA3ZeL4sIABgkHu8Rp9w/Fcs7BP1qYxoHnu
X-Developer-Key: i=vincent.knecht@mailoo.org; a=ed25519;
 pk=MFCVQkhL3+d3NHDzNPWpyZ4isxJvT+QTqValj5gSkm4=
X-Endpoint-Received: by B4 Relay for vincent.knecht@mailoo.org/20250414
 with auth_id=377
X-Original-From: Vincent Knecht <vincent.knecht@mailoo.org>
Reply-To: vincent.knecht@mailoo.org

From: Vincent Knecht <vincent.knecht@mailoo.org>

Add bindings for qcom,msm8939-camss in order to support the camera
subsystem for MSM8939.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 .../bindings/media/qcom,msm8939-camss.yaml         | 269 +++++++++++++++++++++
 1 file changed, 269 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e300b2c84971a45cca43366817a5ed70f9bae630
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
@@ -0,0 +1,269 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,msm8939-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8939 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Vincent Knecht <vincent.knecht@mailoo.org>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
+
+properties:
+  compatible:
+    const: qcom,msm8939-camss
+
+  clocks:
+    minItems: 24
+    maxItems: 24
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
+      - const: csi2_ahb
+      - const: csi2
+      - const: csi2_phy
+      - const: csi2_pix
+      - const: csi2_rdi
+      - const: ahb
+      - const: vfe0
+      - const: csi_vfe0
+      - const: vfe_ahb
+      - const: vfe_axi
+
+  interrupts:
+    minItems: 7
+    maxItems: 7
+
+  interrupt-names:
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csid0
+      - const: csid1
+      - const: csid2
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
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
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
+              bus-type:
+                enum:
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+
+  reg:
+    minItems: 11
+    maxItems: 11
+
+  reg-names:
+    items:
+      - const: csiphy0
+      - const: csiphy0_clk_mux
+      - const: csiphy1
+      - const: csiphy1_clk_mux
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: ispif
+      - const: csi_clk_mux
+      - const: vfe0
+      - const: vfe0_vbif
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
+    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
+
+    camss: camss@1b0ac00 {
+      compatible = "qcom,msm8939-camss";
+
+      clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+               <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
+               <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+               <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+               <&gcc GCC_CAMSS_CSI0_AHB_CLK>,
+               <&gcc GCC_CAMSS_CSI0_CLK>,
+               <&gcc GCC_CAMSS_CSI0PHY_CLK>,
+               <&gcc GCC_CAMSS_CSI0PIX_CLK>,
+               <&gcc GCC_CAMSS_CSI0RDI_CLK>,
+               <&gcc GCC_CAMSS_CSI1_AHB_CLK>,
+               <&gcc GCC_CAMSS_CSI1_CLK>,
+               <&gcc GCC_CAMSS_CSI1PHY_CLK>,
+               <&gcc GCC_CAMSS_CSI1PIX_CLK>,
+               <&gcc GCC_CAMSS_CSI1RDI_CLK>,
+               <&gcc GCC_CAMSS_CSI2_AHB_CLK>,
+               <&gcc GCC_CAMSS_CSI2_CLK>,
+               <&gcc GCC_CAMSS_CSI2PHY_CLK>,
+               <&gcc GCC_CAMSS_CSI2PIX_CLK>,
+               <&gcc GCC_CAMSS_CSI2RDI_CLK>,
+               <&gcc GCC_CAMSS_AHB_CLK>,
+               <&gcc GCC_CAMSS_VFE0_CLK>,
+               <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
+               <&gcc GCC_CAMSS_VFE_AHB_CLK>,
+               <&gcc GCC_CAMSS_VFE_AXI_CLK>;
+
+      clock-names = "top_ahb",
+                    "ispif_ahb",
+                    "csiphy0_timer",
+                    "csiphy1_timer",
+                    "csi0_ahb",
+                    "csi0",
+                    "csi0_phy",
+                    "csi0_pix",
+                    "csi0_rdi",
+                    "csi1_ahb",
+                    "csi1",
+                    "csi1_phy",
+                    "csi1_pix",
+                    "csi1_rdi",
+                    "csi2_ahb",
+                    "csi2",
+                    "csi2_phy",
+                    "csi2_pix",
+                    "csi2_rdi",
+                    "ahb",
+                    "vfe0",
+                    "csi_vfe0",
+                    "vfe_ahb",
+                    "vfe_axi";
+
+      interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
+
+      interrupt-names = "csiphy0",
+                        "csiphy1",
+                        "csid0",
+                        "csid1",
+                        "csid2",
+                        "ispif",
+                        "vfe0";
+
+      iommus = <&apps_iommu 3>;
+
+      power-domains = <&gcc VFE_GDSC>;
+
+      reg = <0x01b0ac00 0x200>,
+            <0x01b00030 0x4>,
+            <0x01b0b000 0x200>,
+            <0x01b00038 0x4>,
+            <0x01b08000 0x100>,
+            <0x01b08400 0x100>,
+            <0x01b08800 0x100>,
+            <0x01b0a000 0x500>,
+            <0x01b00020 0x10>,
+            <0x01b10000 0x1000>,
+            <0x01b40000 0x200>;
+
+      reg-names = "csiphy0",
+                  "csiphy0_clk_mux",
+                  "csiphy1",
+                  "csiphy1_clk_mux",
+                  "csid0",
+                  "csid1",
+                  "csid2",
+                  "ispif",
+                  "csi_clk_mux",
+                  "vfe0",
+                  "vfe0_vbif";
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
2.49.0



