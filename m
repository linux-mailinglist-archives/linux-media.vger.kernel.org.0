Return-Path: <linux-media+bounces-13996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B36913F1F
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 01:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA2AF1C210BA
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 23:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266DF187355;
	Sun, 23 Jun 2024 23:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8Doaeg1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C89185096;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719184976; cv=none; b=XmP4iPqp7FsB76e8un/v5odO3Uz50HhA9ODI214PABFiFXWNZgRbNH8HdZmUeaEQeuTp6SrtYfJgRNyBbtAa60JCy6FpqsaYlsnBmGPrYavkkEfA3uSgIhX0lvkj+i7i5AO44dk7wTmjZJpC3hb+2wywr7RGWpA804gtx/CzpCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719184976; c=relaxed/simple;
	bh=ksN48cxaAFR3/GTcpjVDr3FPaWV1YUWsRi1Xiv4/KVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mw8jmC5RVWzqSP3/gz32Ldu/kh6rGxmdhZAmWlNxKiO0cwlgAFshtgAkAoSJ8PBIabzEUKq0gqJccap3iXX9dMjw/omY2j2kCaN01/PWytDTJU0GnVB77uLE1WGB5wvEhaV0jMNoh4AeDX5mEWUjcJAlhDF0XnDnXtodKi+GUMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8Doaeg1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AE5EC32781;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719184976;
	bh=ksN48cxaAFR3/GTcpjVDr3FPaWV1YUWsRi1Xiv4/KVc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=i8Doaeg1gU/DwlSsvwcCPE5MqRiSz2VQIhToFIqpOjsffC5gw9dOdhuEP8rPHT/RZ
	 sOpgz5/3xw3aWIMIJOi/YGzF3x87f42UbfuOZozXq5eZIZ52dcqe19Yz1Qdufr4iic
	 8E2S97qwHmOv6cChWpYion+wONMvUhNZxJTtHlStDlIObYx8uZPGxaRz88u0mRLBFc
	 tr+NJtx62r20M9gOStu9F8hIKtvnfaBG8oNDXzx4Jk/gPU1doJG/HELn/r7DfyvWAs
	 ycHETI++aV+N9nfStVOiU5Q7WR/2EXpabO4VJQwE1Y8mpzjKBhL+x6fdWvM5J/wlKD
	 E9Y34mitVXLwg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A199C2BD05;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Date: Mon, 24 Jun 2024 07:22:40 +0800
Subject: [PATCH v2 1/8] Add qcom,sc7180-camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-b4-sc7180-camss-v2-1-0dfecdc50073@gmail.com>
References: <20240624-b4-sc7180-camss-v2-0-0dfecdc50073@gmail.com>
In-Reply-To: <20240624-b4-sc7180-camss-v2-0-0dfecdc50073@gmail.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Chan <gchan9527@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719184973; l=10043;
 i=gchan9527@gmail.com; s=20240621; h=from:subject:message-id;
 bh=Hw0kE/GI/DLkLMnNSfBQEwSffJKstvKcClOBJs+yRlU=;
 b=Vn/NxtT24bT02VEuYlqZt7RGdpn/0+SyPlHvqt1+xIEwWyEBgA9WCFceluE4uqUTqp3r02k78
 k16XS0MGUBZCCQprS4do+pAv/7+N4NiLkpMJnI+2o5B5O/Lv78V1vzv
X-Developer-Key: i=gchan9527@gmail.com; a=ed25519;
 pk=Ac2fkTqgUBlj2sns9hRIWJTYhWHO1BsmHbdBb5UpUUY=
X-Endpoint-Received: by B4 Relay for gchan9527@gmail.com/20240621 with
 auth_id=176
X-Original-From: George Chan <gchan9527@gmail.com>
Reply-To: gchan9527@gmail.com

From: George Chan <gchan9527@gmail.com>

Add bindings for qcom,sc7180-camss in order to support the camera
subsystem for sm7125 as found in the Xiaomi Redmi 9 Pro cellphone.

Signed-off-by: George Chan <gchan9527@gmail.com>
---
 .../bindings/media/qcom,sc7180-camss.yaml          | 327 +++++++++++++++++++++
 1 file changed, 327 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-camss.yaml
new file mode 100644
index 000000000000..baebe22fac0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-camss.yaml
@@ -0,0 +1,327 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera SubSystem
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
+
+properties:
+  compatible:
+    const: qcom,sc7180-camss
+
+  clocks:
+    maxItems: 24
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
+      - const: csiphy3
+      - const: csiphy3_timer
+      - const: gcc_camera_ahb
+      - const: gcc_camera_axi
+      - const: soc_ahb
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
+    maxItems: 10
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite
+
+  iommus:
+    maxItems: 3
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
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
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
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
+                maxItems: 4
+
+            required:
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
+              data-lanes:
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+  reg:
+    maxItems: 10
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite
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
+  - clock-names
+  - clocks
+  - compatible
+  - interrupt-names
+  - interrupts
+  - iommus
+  - power-domains
+  - power-domain-names
+  - reg
+  - reg-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,camcc-sc7180.h>
+    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      camss: camss@acb3000 {
+        compatible = "qcom,sc7180-camss";
+
+        reg = <0 0xacb3000 0 0x1000>,
+              <0 0xacba000 0 0x1000>,
+              <0 0xacc8000 0 0x1000>,
+              <0 0xac65000 0 0x1000>,
+              <0 0xac66000 0 0x1000>,
+              <0 0xac67000 0 0x1000>,
+              <0 0xac68000 0 0x1000>,
+              <0 0xacaf000 0 0x4000>,
+              <0 0xacb6000 0 0x4000>,
+              <0 0xacc4000 0 0x4000>;
+
+        reg-names = "csid0",
+                    "csid1",
+                    "csid2",
+                    "csiphy0",
+                    "csiphy1",
+                    "csiphy2",
+                    "csiphy3",
+                    "vfe0",
+                    "vfe1",
+                    "vfe_lite";
+
+        clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_IFE_0_CSID_CLK>,
+                 <&camcc CAM_CC_IFE_1_CSID_CLK>,
+                 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                 <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CSIPHY1_CLK>,
+                 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CSIPHY2_CLK>,
+                 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CSIPHY3_CLK>,
+                 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+                 <&gcc GCC_CAMERA_AHB_CLK>,
+                 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                 <&camcc CAM_CC_SOC_AHB_CLK>,
+                 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+                 <&camcc CAM_CC_IFE_0_CLK>,
+                 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+                 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+                 <&camcc CAM_CC_IFE_1_CLK>,
+                 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+                 <&camcc CAM_CC_IFE_LITE_CLK>,
+                 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
+
+        clock-names = "camnoc_axi",
+                      "cpas_ahb",
+                      "csi0",
+                      "csi1",
+                      "csi2",
+                      "csiphy0",
+                      "csiphy0_timer",
+                      "csiphy1",
+                      "csiphy1_timer",
+                      "csiphy2",
+                      "csiphy2_timer",
+                      "csiphy3",
+                      "csiphy3_timer",
+                      "gcc_camera_ahb",
+                      "gcc_camera_axi",
+                      "soc_ahb",
+                      "vfe0_axi",
+                      "vfe0",
+                      "vfe0_cphy_rx",
+                      "vfe1_axi",
+                      "vfe1",
+                      "vfe1_cphy_rx",
+                      "vfe_lite",
+                      "vfe_lite_cphy_rx";
+
+        interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
+
+        interrupt-names = "csid0",
+                          "csid1",
+                          "csid2",
+                          "csiphy0",
+                          "csiphy1",
+                          "csiphy2",
+                          "csiphy3",
+                          "vfe0",
+                          "vfe1",
+                          "vfe_lite";
+
+        iommus = <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>,
+                 <&apps_smmu 0x860 0x0>;
+
+        power-domains = <&camcc IFE_0_GDSC>,
+                        <&camcc IFE_1_GDSC>,
+                        <&camcc TITAN_TOP_GDSC>;
+
+        power-domain-names = "ife0",
+                             "ife1",
+                             "top";
+
+        vdda-phy-supply = <&vreg_l1a_0p875>;
+        vdda-pll-supply = <&vreg_l26a_1p2>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+        };
+      };
+    };

-- 
2.34.1



