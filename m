Return-Path: <linux-media+bounces-34728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AAAAD87FC
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 11:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E88D53AC160
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 09:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C052D0283;
	Fri, 13 Jun 2025 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JtJLlWXs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CAC272815;
	Fri, 13 Jun 2025 09:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749807218; cv=none; b=okl8/zgs7QlYpdwS8S/FiQ06fyUz4vtbfg5+MqVDXIuSGX+CdDSY7wabNLvhIHblY1d6y5huNF9aEnk+1fiXxwzfZ//VUGT+HF/MTOHYzfMapk5zA2p8LsM9YtfjJDa/3CBukQmXEjWW+92f8QNL6NmsVDxiBzCIX+PeD7f95X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749807218; c=relaxed/simple;
	bh=dhcyYoCyomPBMR7vH5x6EIUhZN8qHA40mGqMU0kMAfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L47ChoRWMkthiXuPBtaZPYWMp1OGSIjL7MPqkNS75QkQ6hgxRV6gArXldq8WijOneWH2gOzJikU2nbJbCCeDefVQaCygtkh3g0/Qd3DUei4bGnRuaqBRf6rLEIpgNBvEBkwD/CQZVDagcwQr4BvtAiUk0tuKHdzA8RX2U3AgXv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtJLlWXs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 842EDC4CEF2;
	Fri, 13 Jun 2025 09:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749807217;
	bh=dhcyYoCyomPBMR7vH5x6EIUhZN8qHA40mGqMU0kMAfw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JtJLlWXstP4WgUES2rWan7o0s+c2X1r9lTEU7lF5bJgCDyuYb2h/q8DVi2BfvoMzs
	 PMesi+H0MvvHJ5XC0lEMve5A0oE3EPIpzMeM+4njTquKc6i3+cQSPEPGHKZG3jxw3A
	 fU+ULhOz+1fAJeZreVH1/tSRgkPDNb0y9y9uFAktHqc3Yh3DnDqrN21TyZB2rjhd6N
	 YGBnzdZ30TCO5TmJD8PQ/ZP5LsyLS8xr3ImW8ZWZY6+LyugFS4/W20T7NjBVDcQXHV
	 9DYnngVBVg3OxeZ3EyAwApkDiSF/UNsc5psOOe7/VObKUUVhWB3wSsKOJq8ogdvI5J
	 UrlYcAQuBSINQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76520C71135;
	Fri, 13 Jun 2025 09:33:37 +0000 (UTC)
From: Vincent Knecht via B4 Relay <devnull+vincent.knecht.mailoo.org@kernel.org>
Date: Fri, 13 Jun 2025 11:33:29 +0200
Subject: [PATCH v5 3/4] media: dt-bindings: Add qcom,msm8939-camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-camss-8x39-vbif-v5-3-a002301a7730@mailoo.org>
References: <20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org>
In-Reply-To: <20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org>
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
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749807216; l=7852;
 i=vincent.knecht@mailoo.org; s=20250414; h=from:subject:message-id;
 bh=ZZwhkGf8/7Oy36hq2I4SI3p+MOTor2GaJccXg9TnAwg=;
 b=mTHF5ack7JkndupVBT/e7npr54LDB0pwf30VGdwbMea9puq7wsD9KHQ8672EFJ6duKgzikeda
 RXSfUAN912rB1IIaWBd2XA80MTeU3pFZ2eGkVBx/mYFw1Y0HaiaFsm2
X-Developer-Key: i=vincent.knecht@mailoo.org; a=ed25519;
 pk=MFCVQkhL3+d3NHDzNPWpyZ4isxJvT+QTqValj5gSkm4=
X-Endpoint-Received: by B4 Relay for vincent.knecht@mailoo.org/20250414
 with auth_id=377
X-Original-From: Vincent Knecht <vincent.knecht@mailoo.org>
Reply-To: vincent.knecht@mailoo.org

From: Vincent Knecht <vincent.knecht@mailoo.org>

Add bindings for qcom,msm8939-camss in order to support the camera
subsystem for MSM8939.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 .../bindings/media/qcom,msm8939-camss.yaml         | 254 +++++++++++++++++++++
 1 file changed, 254 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9fbb4b204ac8728b822864ad8336aa9d826d6b5b
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
+      - const: csi_clk_mux
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csiphy0
+      - const: csiphy0_clk_mux
+      - const: csiphy1
+      - const: csiphy1_clk_mux
+      - const: ispif
+      - const: vfe0
+      - const: vfe0_vbif
+
+  clocks:
+    maxItems: 24
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
+      - const: csiphy0_timer
+      - const: csiphy1_timer
+      - const: ispif_ahb
+      - const: top_ahb
+      - const: vfe0
+      - const: vfe_ahb
+      - const: vfe_axi
+
+  interrupts:
+    maxItems: 7
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csiphy0
+      - const: csiphy1
+      - const: ispif
+      - const: vfe0
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
+    isp@1b00020 {
+        compatible = "qcom,msm8939-camss";
+
+        reg = <0x01b00020 0x10>,
+              <0x01b08000 0x100>,
+              <0x01b08400 0x100>,
+              <0x01b08800 0x100>,
+              <0x01b0ac00 0x200>,
+              <0x01b00030 0x4>,
+              <0x01b0b000 0x200>,
+              <0x01b00038 0x4>,
+              <0x01b0a000 0x500>,
+              <0x01b10000 0x1000>,
+              <0x01b40000 0x200>;
+
+        reg-names = "csi_clk_mux",
+                    "csid0",
+                    "csid1",
+                    "csid2",
+                    "csiphy0",
+                    "csiphy0_clk_mux",
+                    "csiphy1",
+                    "csiphy1_clk_mux",
+                    "ispif",
+                    "vfe0",
+                    "vfe0_vbif";
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
+                 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+                 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+                 <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
+                 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+                 <&gcc GCC_CAMSS_VFE0_CLK>,
+                 <&gcc GCC_CAMSS_VFE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_VFE_AXI_CLK>;
+
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
+                      "csiphy0_timer",
+                      "csiphy1_timer",
+                      "ispif_ahb",
+                      "top_ahb",
+                      "vfe0",
+                      "vfe_ahb",
+                      "vfe_axi";
+
+        interrupts = <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
+
+        interrupt-names = "csid0",
+                          "csid1",
+                          "csid2",
+                          "csiphy0",
+                          "csiphy1",
+                          "ispif",
+                          "vfe0";
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
2.49.0



