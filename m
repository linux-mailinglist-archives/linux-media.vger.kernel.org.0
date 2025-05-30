Return-Path: <linux-media+bounces-33642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3749BAC8A52
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 11:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B5434E304E
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 09:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F35221FCD;
	Fri, 30 May 2025 09:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rCBDujFw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C6821D5AA;
	Fri, 30 May 2025 09:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748595609; cv=none; b=Qiv/hv6vdtAAMSF8HgeUO1+GrJ1Trss6yJf2Z4MCibbjTSSqR86HYiEtPBTuJ+JxMjtS9uvmSx+BCEC07LQOvfj3E7CQWO+L2k8e+TwPWH07pXSXBeMO4Q/aWDgsLbbxIVl0zztymqIURrmZf4VLPhEK7dpaYBt0kFDo8aDopU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748595609; c=relaxed/simple;
	bh=xfa1GFv94euoBmf+fvs/VYYsw3L+ReTgBg+jQpKo9H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SJYZhLaL+ya0GCLLQo5Hl1GccSinQxPAsBGI6uY9ZPTzkzrmJ/NkoJogoMuPAg3X8Ys+8YhMVoyonihILe073xyyekkak6EDdVZotBJcur++BX9gES2JXaQFew/4zVoECVIRVCyPUuF2xgg7snQJydMiZDuwd9juqYxXgCKbTpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rCBDujFw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BC21C4CEFC;
	Fri, 30 May 2025 09:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748595609;
	bh=xfa1GFv94euoBmf+fvs/VYYsw3L+ReTgBg+jQpKo9H8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rCBDujFw8z6RsUNapzwhReR04ccB53DOGbnmQVKQiAsQanTQt/GBPQ/+wIyDObB2u
	 jfuzk5sz/iLT7gKe4Olfbs7daSqmVrF0vYBb1kNN5zu4fVUyk6wuuc3jjntIWnRW18
	 gPXHFBkCCeKaNAeGpKH8nqcQtGKVrpRJSyk7LNIe2qbaQWeCKBvB8mxTm0tJboVA3w
	 I8t8mRfpJI7RsKopRFI1agMwypV0VBKRXe1njQkWbt5B79vegK4YJQxEithh1HZDQK
	 2Hiedp1nEgPwBu3RzCl/ArAb4C7DMZt2ap74rc2vGiY5jR2/Rbh/mMx8n6rwfTMxR0
	 br5RoY/6MWwEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB16C5B549;
	Fri, 30 May 2025 09:00:09 +0000 (UTC)
From: Vincent Knecht via B4 Relay <devnull+vincent.knecht.mailoo.org@kernel.org>
Date: Fri, 30 May 2025 11:00:07 +0200
Subject: [PATCH v3 4/4] arm64: dts: qcom: msm8939: Add camss and cci
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-camss-8x39-vbif-v3-4-fc91d15bb5d6@mailoo.org>
References: <20250530-camss-8x39-vbif-v3-0-fc91d15bb5d6@mailoo.org>
In-Reply-To: <20250530-camss-8x39-vbif-v3-0-fc91d15bb5d6@mailoo.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748595607; l=5427;
 i=vincent.knecht@mailoo.org; s=20250414; h=from:subject:message-id;
 bh=3AXxGKiiFPkzccexXUftpqL5zw7vJ6WvoTGCbe02/GY=;
 b=Sp/sG4/rr4ZLXVlrpVisinb+PnxHYy9BY/0/GWSRVE1dIA+2mVKzBGJUB8gYsKkOa6qeYBnUR
 1J8kKnT9idCDM14y1N4WCg6yFCl2sqcsejpq3CnD8krLRDns7tlhhJz
X-Developer-Key: i=vincent.knecht@mailoo.org; a=ed25519;
 pk=MFCVQkhL3+d3NHDzNPWpyZ4isxJvT+QTqValj5gSkm4=
X-Endpoint-Received: by B4 Relay for vincent.knecht@mailoo.org/20250414
 with auth_id=377
X-Original-From: Vincent Knecht <vincent.knecht@mailoo.org>
Reply-To: vincent.knecht@mailoo.org

From: Vincent Knecht <vincent.knecht@mailoo.org>

Add the camera subsystem and CCI used to interface with cameras on the
Snapdragon 615.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi |   4 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi        | 146 +++++++++++++++++++++++++++
 2 files changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
index adb96cd8d643e5fde1ac95c0fc3c9c3c3efb07e8..659d127b1bc3570d137ca986e4eacf600c183e5e 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
@@ -11,6 +11,10 @@
 #include "msm8939.dtsi"
 #include "pm8916.dtsi"
 
+&camss {
+	vdda-supply = <&pm8916_l2>;
+};
+
 &mdss_dsi0 {
 	vdda-supply = <&pm8916_l2>;
 	vddio-supply = <&pm8916_l6>;
diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 68b92fdb996c26e7a1aadedf0f52e1afca85c4ab..082542b54d96adaed3e6b49bc3682005ea018a72 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1434,6 +1434,145 @@ mdss_dsi1_phy: phy@1aa0300 {
 			};
 		};
 
+		camss: isp@1b08000 {
+			compatible = "qcom,msm8939-camss";
+			reg = <0x01b08000 0x100>,
+			      <0x01b08400 0x100>,
+			      <0x01b08800 0x100>,
+			      <0x01b0ac00 0x200>,
+			      <0x01b00030 0x4>,
+			      <0x01b0b000 0x200>,
+			      <0x01b00038 0x4>,
+			      <0x01b00020 0x10>,
+			      <0x01b0a000 0x500>,
+			      <0x01b10000 0x1000>,
+			      <0x01b40000 0x200>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csiphy0",
+				    "csiphy0_clk_mux",
+				    "csiphy1",
+				    "csiphy1_clk_mux",
+				    "csi_clk_mux",
+				    "ispif",
+				    "vfe0",
+				    "vfe0_vbif";
+
+			clocks = <&gcc GCC_CAMSS_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI0RDI_CLK>,
+				 <&gcc GCC_CAMSS_CSI1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI1RDI_CLK>,
+				 <&gcc GCC_CAMSS_CSI2_CLK>,
+				 <&gcc GCC_CAMSS_CSI2_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI2PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI2PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI2RDI_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
+				 <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_VFE0_CLK>,
+				 <&gcc GCC_CAMSS_VFE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_VFE_AXI_CLK>;
+			clock-names = "ahb",
+				      "csi0",
+				      "csi0_ahb",
+				      "csi0_phy",
+				      "csi0_pix",
+				      "csi0_rdi",
+				      "csi1",
+				      "csi1_ahb",
+				      "csi1_phy",
+				      "csi1_pix",
+				      "csi1_rdi",
+				      "csi2",
+				      "csi2_ahb",
+				      "csi2_phy",
+				      "csi2_pix",
+				      "csi2_rdi",
+				      "csiphy0_timer",
+				      "csiphy1_timer",
+				      "csi_vfe0",
+				      "ispif_ahb",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe_ahb",
+				      "vfe_axi";
+
+			interrupts = <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csiphy0",
+					  "csiphy1",
+					  "ispif",
+					  "vfe0";
+
+			iommus = <&apps_iommu 3>;
+
+			power-domains = <&gcc VFE_GDSC>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		cci: cci@1b0c000 {
+			compatible = "qcom,msm8916-cci", "qcom,msm8226-cci";
+			reg = <0x01b0c000 0x1000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_CLK>,
+				 <&gcc GCC_CAMSS_AHB_CLK>;
+			clock-names = "camss_top_ahb",
+				      "cci_ahb",
+				      "cci",
+				      "camss_ahb";
+			assigned-clocks = <&gcc GCC_CAMSS_CCI_AHB_CLK>,
+					  <&gcc GCC_CAMSS_CCI_CLK>;
+			assigned-clock-rates = <80000000>,
+					       <19200000>;
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-names = "default";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		gpu: gpu@1c00000 {
 			compatible = "qcom,adreno-405.0", "qcom,adreno";
 			reg = <0x01c00000 0x10000>;
@@ -1498,6 +1637,13 @@ apps_iommu: iommu@1ef0000 {
 			#iommu-cells = <1>;
 			qcom,iommu-secure-id = <17>;
 
+			/* vfe */
+			iommu-ctx@3000 {
+				compatible = "qcom,msm-iommu-v1-sec";
+				reg = <0x3000 0x1000>;
+				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
 			/* mdp_0: */
 			iommu-ctx@4000 {
 				compatible = "qcom,msm-iommu-v1-ns";

-- 
2.49.0



