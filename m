Return-Path: <linux-media+bounces-45884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFF9C1708B
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 22:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F891401AF0
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 21:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549FA2E7645;
	Tue, 28 Oct 2025 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ak1J1M1+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653652E336F;
	Tue, 28 Oct 2025 21:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761687134; cv=none; b=sUvV2K6Y+d7F0OGakBHYa6FcUxmKryFXX72b60RCAE161yiv4o1mPlEZC6Dr8LZfCS+5XCfPEoVKAm8mjiGm1YovesRbmNsNveUxe2sLJPrWpO7Sb38/IfXtUQLfYyRV2xmGWlGOA4rVVTEAqTz+5uHHBEtPrIvRFBIOzGy277A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761687134; c=relaxed/simple;
	bh=rUyecgTwsqCvUufit3wBcxnKv3nqT/whCCCo67e/TwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ifl81C7KCWiaZ1BySFFYQsg4S8VjrKgV3MPEz5vmv2rLQooHMYIDZwSd5cYDgUKchc2dOXDiD+J6HW+4ZzDgD+IYr/qDr2pFvkGhVm7RceFjyCKflWWbJEVkeddaT7R5xGSv8xC4QyVVhk5ryQ+D8vDy2HW1Z1J67l82xR0EBrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ak1J1M1+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F45BC19424;
	Tue, 28 Oct 2025 21:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761687134;
	bh=rUyecgTwsqCvUufit3wBcxnKv3nqT/whCCCo67e/TwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ak1J1M1+6npfB01GOUWwAED2MhgG8GRvPtIfkvSyDcTpGvAk1D8njHQDZJ2pKAsd3
	 7U8rMnYtYwCAIWajnqIXzmZAcl2LH4Aiay86idfcH3WSekZH6FsHb/k/4OWq/n0/n2
	 6oAjiPRrHkTGq2feKivmceGzM8ieFuHqULU3G3VWB+kShgk1hPFVckJxmK2ryPLFSb
	 A7P4885K8iGet/ylakvfHq6uE2aEV3QQSHCWEBdszhWC4EwVzEpC1v3KQGue6r4ktS
	 O0Aldv2A4Jk1Lurjudy0oBR3fG24lcHqdWSBoXS4OZ7lxsPDpE6XkwqdPqAu2A7/O2
	 8CDgiIVmKas/Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FA1CCF9EA;
	Tue, 28 Oct 2025 21:32:14 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Tue, 28 Oct 2025 22:30:45 +0100
Subject: [PATCH v7 4/4] arm64: dts: qcom: msm8939: Add camss and cci
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251028-camss-8x39-vbif-v7-4-91ee8becda85@apitzsch.eu>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761687132; l=5537;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=un+kmwhPLrnW0O5VHk7Q4Pi0zfXDaXthz4QyW1loye8=;
 b=IQCtuqnclditOlLLyatCj3XvtmpTKH5exjdX5SQawoFbgNA07H+jyaZNS8u7mvSKt481Ba64u
 s18FKS/7+DnD0FWFsJ6VHGjnfuX8QJZkwlSVLI3f7OYYa4ClfhCSigk
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi |   4 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi        | 146 +++++++++++++++++++++++++++
 2 files changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
index adb96cd8d643..659d127b1bc3 100644
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
index eb64ec35e7f0..d4d7b0c9206c 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1436,6 +1436,145 @@ mdss_dsi1_phy: phy@1aa0300 {
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
@@ -1500,6 +1639,13 @@ apps_iommu: iommu@1ef0000 {
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
2.51.2



