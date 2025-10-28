Return-Path: <linux-media+bounces-45882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CC9C1707D
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 22:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CFAC4018F5
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 21:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FD92E7198;
	Tue, 28 Oct 2025 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u2NgVc1Q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3912E2DEF;
	Tue, 28 Oct 2025 21:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761687134; cv=none; b=aKDa5PbdbSUVZ5aLGdv/fyP42LEn52hBOPWJJ0Pey/d1IbyaEP0EqGHw66a70+UtPQ4jRoYIpUgqUYwVuvFDVA20Fl82bLG2+MnYy7JvB6NwBOaYhMQAv4gvSGqdCLKnrS8C7niLwXuKW4yJaom/CYnuGTDzFBPjIUIVqDmSUMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761687134; c=relaxed/simple;
	bh=atERiNJWobfmeN7nh+L9YbOC6sECGvqmzOPt+YsIXNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k6h65sYOs39HkYjiM9A3E6O1l7PyCr1BUb8eDkjUndnlQuWL5q3vtUpZTJybOBV6oK6ijWrVPZd1NbAtEt1O1KsJlNpCpsiINYr/738IZptn9FeY2jy5rCbcqhOZrJkD3euuGrzLT74IkcBRfYy8nntB1DPt7Dlz272NNfbeX20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u2NgVc1Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D25D2C4CEFF;
	Tue, 28 Oct 2025 21:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761687133;
	bh=atERiNJWobfmeN7nh+L9YbOC6sECGvqmzOPt+YsIXNw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u2NgVc1QTtRhEvzWh8wCCAXTwi+LtSdI7ucG+7OYYzD0WnTjbx6wJZYCwH8tVZ7dp
	 IcrunVogtrDnS1GMNTAzvxswUnFlQYOmB0nAU2BMSxOMi/uMHaca4frmY1mPCHfjBH
	 aAtReYYj1wmopg87YGnp3WvWf38PxSHkWBAdgHDByQXqHaIKhrEKgi8NQdPk+iT1Eb
	 zALxmCn5zXlB6w+7Mkmjxe9dUzj1I6s5OGQPRDnWprzAXP5P8MeOTctF7ZCnUyV+YY
	 lIeJPbSjYLSvgY09SRQbNPEtDY9V2hgwrgG63DGGGG21vDkayhGeYHfIx0sVPMumKQ
	 lsQvCJz1P3K1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC551CCF9EA;
	Tue, 28 Oct 2025 21:32:13 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Tue, 28 Oct 2025 22:30:42 +0100
Subject: [PATCH v7 1/4] media: dt-bindings: Add qcom,msm8939-camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251028-camss-8x39-vbif-v7-1-91ee8becda85@apitzsch.eu>
References: <20251028-camss-8x39-vbif-v7-0-91ee8becda85@apitzsch.eu>
In-Reply-To: <20251028-camss-8x39-vbif-v7-0-91ee8becda85@apitzsch.eu>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761687132; l=7957;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=l8JUjYkCXPnuBo5q8bU+IKbrnKrXX8otllKkjKJF1dM=;
 b=lA9sGQO9HGtkXe5tj7Ov+PJT1uwjIc9O/P9sYas1oO+/MgE9HQ8Y60gG4hmW5UKCaCy7M1fSM
 mtManIOF6B1D6x9ZOW4z2ichv4hucI61d2aNyJgK1ctoR5JEBnvv8I1
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: Vincent Knecht <vincent.knecht@mailoo.org>

Add bindings for qcom,msm8939-camss in order to support the camera
subsystem for MSM8939.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
[André: Make order of items the same as in 8916]
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 .../bindings/media/qcom,msm8939-camss.yaml         | 254 +++++++++++++++++++++
 1 file changed, 254 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
new file mode 100644
index 000000000000..77b389d76a43
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
@@ -0,0 +1,254 @@
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
+  reg:
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
+      - const: ispif
+      - const: csi_clk_mux
+      - const: vfe0
+      - const: csid2
+      - const: vfe0_vbif
+
+  clocks:
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
+      - const: ahb
+      - const: vfe0
+      - const: csi_vfe0
+      - const: vfe_ahb
+      - const: vfe_axi
+      - const: csi2_ahb
+      - const: csi2
+      - const: csi2_phy
+      - const: csi2_pix
+      - const: csi2_rdi
+
+  interrupts:
+    maxItems: 7
+
+  interrupt-names:
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csid0
+      - const: csid1
+      - const: ispif
+      - const: vfe0
+      - const: csid2
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    items:
+      - description: VFE GDSC - Video Front End, Global Distributed Switch
+          Controller.
+
+  vdda-supply:
+    description:
+      Definition of the regulator used as 1.2V analog power supply.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-1]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
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
+  - vdda-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
+
+    isp@1b0ac00 {
+        compatible = "qcom,msm8939-camss";
+
+        reg = <0x01b0ac00 0x200>,
+              <0x01b00030 0x4>,
+              <0x01b0b000 0x200>,
+              <0x01b00038 0x4>,
+              <0x01b08000 0x100>,
+              <0x01b08400 0x100>,
+              <0x01b0a000 0x500>,
+              <0x01b00020 0x10>,
+              <0x01b10000 0x1000>,
+              <0x01b08800 0x100>,
+              <0x01b40000 0x200>;
+
+        reg-names = "csiphy0",
+                    "csiphy0_clk_mux",
+                    "csiphy1",
+                    "csiphy1_clk_mux",
+                    "csid0",
+                    "csid1",
+                    "ispif",
+                    "csi_clk_mux",
+                    "vfe0",
+                    "csid2",
+                    "vfe0_vbif";
+
+        clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+                 <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
+                 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+                 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+                 <&gcc GCC_CAMSS_CSI0_AHB_CLK>,
+                 <&gcc GCC_CAMSS_CSI0_CLK>,
+                 <&gcc GCC_CAMSS_CSI0PHY_CLK>,
+                 <&gcc GCC_CAMSS_CSI0PIX_CLK>,
+                 <&gcc GCC_CAMSS_CSI0RDI_CLK>,
+                 <&gcc GCC_CAMSS_CSI1_AHB_CLK>,
+                 <&gcc GCC_CAMSS_CSI1_CLK>,
+                 <&gcc GCC_CAMSS_CSI1PHY_CLK>,
+                 <&gcc GCC_CAMSS_CSI1PIX_CLK>,
+                 <&gcc GCC_CAMSS_CSI1RDI_CLK>,
+                 <&gcc GCC_CAMSS_AHB_CLK>,
+                 <&gcc GCC_CAMSS_VFE0_CLK>,
+                 <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
+                 <&gcc GCC_CAMSS_VFE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_VFE_AXI_CLK>,
+                 <&gcc GCC_CAMSS_CSI2_AHB_CLK>,
+                 <&gcc GCC_CAMSS_CSI2_CLK>,
+                 <&gcc GCC_CAMSS_CSI2PHY_CLK>,
+                 <&gcc GCC_CAMSS_CSI2PIX_CLK>,
+                 <&gcc GCC_CAMSS_CSI2RDI_CLK>;
+
+        clock-names = "top_ahb",
+                      "ispif_ahb",
+                      "csiphy0_timer",
+                      "csiphy1_timer",
+                      "csi0_ahb",
+                      "csi0",
+                      "csi0_phy",
+                      "csi0_pix",
+                      "csi0_rdi",
+                      "csi1_ahb",
+                      "csi1",
+                      "csi1_phy",
+                      "csi1_pix",
+                      "csi1_rdi",
+                      "ahb",
+                      "vfe0",
+                      "csi_vfe0",
+                      "vfe_ahb",
+                      "vfe_axi",
+                      "csi2_ahb",
+                      "csi2",
+                      "csi2_phy",
+                      "csi2_pix",
+                      "csi2_rdi";
+
+        interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>;
+
+        interrupt-names = "csiphy0",
+                          "csiphy1",
+                          "csid0",
+                          "csid1",
+                          "ispif",
+                          "vfe0",
+                          "csid2";
+
+        iommus = <&apps_iommu 3>;
+
+        power-domains = <&gcc VFE_GDSC>;
+
+        vdda-supply = <&reg_1v2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@1 {
+                reg = <1>;
+
+                csiphy1_ep: endpoint {
+                    data-lanes = <0 2>;
+                    remote-endpoint = <&sensor_ep>;
+                };
+            };
+        };
+    };

-- 
2.51.2



