Return-Path: <linux-media+bounces-41939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5BEB480AA
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 00:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A4C83B0C25
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 22:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170A829D28B;
	Sun,  7 Sep 2025 22:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMpmzOHF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56848285054;
	Sun,  7 Sep 2025 22:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757282676; cv=none; b=eZwWC+AclUKbfWpLEWldJmIn/UTGm0/0OMbE9zaU5UtnmigdwJcDiQhgprQtyQ4WitrKvuIQPVDe7nqk8P5BjdsgVPbQxmhMPgT82Cy81SCIyrl+FNjq4ANLS6dcX2YFSMVT+2M2fRJmcxOzCaOKQDx511hwWVgvqnOnts1m2xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757282676; c=relaxed/simple;
	bh=xfSGdSUAHfJ17ErfSSYDf9SpQbYAL3T8i7Whc1WvAa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RV3kVCt0YHSiBLGzD9qYzW/0s/A2vuEWwPwzoLoDA7nzw6A4x5zgEmMqeJK8Dx8CniaePF9qrbJhI0yv7QJLOonLtatQEPznxXCUafB+3HBko4L5XphPOH0x4IRo07Hql4H2c1gwZ3hraX5PNHolrLzgJ6t+qfEwP1w1svHirf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMpmzOHF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98E1EC116B1;
	Sun,  7 Sep 2025 22:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757282675;
	bh=xfSGdSUAHfJ17ErfSSYDf9SpQbYAL3T8i7Whc1WvAa0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BMpmzOHFJpJDt20N/gskOcPHAk+rDSdXwx2izSpMSGbsWAfuj0Nq4zNnQtu67y5by
	 LAUWN8cHG5DP86dcjZ0jwXvn3fsdUnzqXI16XyqQYTx9fa77WZNqhRr60jTq+dbdO0
	 LKs4XEf+yCmsQhGS4NFQcJXF69l9WF9MJ/xPaaYNx20ul503bhpNhy2hxravN5Yzkv
	 Z1GycV8dUWNeOgIITKvwqSto1oyRQflSuW1k86F5cJvTrANi4h86tlCNF5uvLZgJfI
	 ThEYVs5cNiVq3jQZGIe5x7IO4iGKTiZC4b9a98ewR2amHNYp1c9qLkxbe27Oh5MC4c
	 TvtfIQs2NRVDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED85CAC581;
	Sun,  7 Sep 2025 22:04:35 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 08 Sep 2025 00:04:18 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: msm8939: Add camss and cci
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250908-camss-8x39-vbif-v1-4-f198c9fd0d4d@apitzsch.eu>
References: <20250908-camss-8x39-vbif-v1-0-f198c9fd0d4d@apitzsch.eu>
In-Reply-To: <20250908-camss-8x39-vbif-v1-0-f198c9fd0d4d@apitzsch.eu>
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
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757282673; l=5528;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=Lwz747jRCUvpyRjQGDYnWcOgT3CYQhxSZ9w8lZX4jnE=;
 b=qFI80c15/O9BWbEQVlMk6+1LUZEJPKZJAYARQuykB2uZKjb22gy81TeCwjBwtyyFAwFar9Yg/
 FXyNjOrjXjmDBH04B0UbwRXLd3jl09B7fJwIC3ShSzaXN5V6mXLojLl
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: Vincent Knecht <vincent.knecht@mailoo.org>

Add the camera subsystem and CCI used to interface with cameras on the
Snapdragon 615.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
[André: Make order of items the same as in 8916]
Signed-off-by: André Apitzsch <git@apitzsch.eu>
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
index 68b92fdb996c26e7a1aadedf0f52e1afca85c4ab..15ca28ed21ca80f9b35b5e64d3b704d14c9174f5 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1434,6 +1434,145 @@ mdss_dsi1_phy: phy@1aa0300 {
 			};
 		};
 
+		camss: isp@1b0ac00 {
+			compatible = "qcom,msm8939-camss";
+			reg = <0x01b0ac00 0x200>,
+			      <0x01b00030 0x4>,
+			      <0x01b0b000 0x200>,
+			      <0x01b00038 0x4>,
+			      <0x01b08000 0x100>,
+			      <0x01b08400 0x100>,
+			      <0x01b0a000 0x500>,
+			      <0x01b00020 0x10>,
+			      <0x01b10000 0x1000>,
+			      <0x01b08800 0x100>,
+			      <0x01b40000 0x200>;
+			reg-names = "csiphy0",
+				    "csiphy0_clk_mux",
+				    "csiphy1",
+				    "csiphy1_clk_mux",
+				    "csid0",
+				    "csid1",
+				    "ispif",
+				    "csi_clk_mux",
+				    "vfe0",
+				    "csid2",
+				    "vfe0_vbif";
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CSI0_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI0RDI_CLK>,
+				 <&gcc GCC_CAMSS_CSI1_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI1RDI_CLK>,
+				 <&gcc GCC_CAMSS_AHB_CLK>,
+				 <&gcc GCC_CAMSS_VFE0_CLK>,
+				 <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
+				 <&gcc GCC_CAMSS_VFE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_VFE_AXI_CLK>,
+				 <&gcc GCC_CAMSS_CSI2_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI2_CLK>,
+				 <&gcc GCC_CAMSS_CSI2PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI2PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI2RDI_CLK>;
+			clock-names = "top_ahb",
+				      "ispif_ahb",
+				      "csiphy0_timer",
+				      "csiphy1_timer",
+				      "csi0_ahb",
+				      "csi0",
+				      "csi0_phy",
+				      "csi0_pix",
+				      "csi0_rdi",
+				      "csi1_ahb",
+				      "csi1",
+				      "csi1_phy",
+				      "csi1_pix",
+				      "csi1_rdi",
+				      "ahb",
+				      "vfe0",
+				      "csi_vfe0",
+				      "vfe_ahb",
+				      "vfe_axi",
+				      "csi2_ahb",
+				      "csi2",
+				      "csi2_phy",
+				      "csi2_pix",
+				      "csi2_rdi";
+
+			interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csiphy0",
+					  "csiphy1",
+					  "csid0",
+					  "csid1",
+					  "ispif",
+					  "vfe0",
+					  "csid2";
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
2.51.0



