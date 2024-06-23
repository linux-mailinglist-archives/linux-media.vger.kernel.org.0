Return-Path: <linux-media+bounces-14003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B28DA913F32
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 01:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69FCA281919
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 23:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685E718A954;
	Sun, 23 Jun 2024 23:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q1zbK8+r"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C37186E45;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719184977; cv=none; b=Dr61DumG6N/WPpIyL99yZl/hrXSMHZNHk4roVP53dg0SJi1fu2Kf751t/SxYmyjl9clp34JmHB2MlVIvftrEYq7IYb4I6cwNhQ9lcSuaO5UpYhkJm+lFXyz7yJYs4gLR3SgdCC4lLx86wYynt87nrhlUHkvtCdVCdyHD/nBe+GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719184977; c=relaxed/simple;
	bh=SZzhgIdKajwWjYEpdD7fdRefbWwv2wM+lm7g39cQ37s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dsqxiWJ/wsvYv9lbjqHi8bDWZD/WXnTPBeuB+u5CChwxAjoCg6owYJ/jRV6As9upkEz5PfcYYMn1jPJ7b8oYnTdh8Bs9fRyraEBzPZC5L3kx0sXbxOWi2ZUR0IEJqoFZJx4cwJkLbfZXAc7+tIdz6uaMbbH8JZGLDHPklm6Od7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q1zbK8+r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87D26C4DDE1;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719184976;
	bh=SZzhgIdKajwWjYEpdD7fdRefbWwv2wM+lm7g39cQ37s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q1zbK8+rs2YmfxCl10E6JjeAuq07BlhwS7PMOKhoYvJ4uT6t70MET5Sg6GIYNPEdJ
	 1uWeAr/7Paqqvg9QcmAVcS0pipGMzzo9Od66QVWNTk02sUMWrtug6Utj81qrrk+KR1
	 L87Vtju6K/7jI8BbkY5DSwytWBhH9j/FfnhNEOr4sZj/H8rOS/WgZFwyBv7+WeI3LR
	 ChhGTUO8+UGL5GRGmXCO3jHADojO458vhvmzdzXEHJzNBhOLHQJbJZz3bEJwKcMWVJ
	 QqaWwVZuFOSvNgmEdRRW1ioghMZgwsUZoU/nOoxGK4l8UOC7FGU0V7N/Kjdv4oicD7
	 Fp9JHRdDxHXpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F758C27C4F;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Date: Mon, 24 Jun 2024 07:22:47 +0800
Subject: [PATCH RFT v2 8/8] Add support for sc7180 camss subsys
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-b4-sc7180-camss-v2-8-0dfecdc50073@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719184974; l=4445;
 i=gchan9527@gmail.com; s=20240621; h=from:subject:message-id;
 bh=X2+frU2LDNyw6wyGPbsG3VQnH0Ks5wg8+nWA/3AbbKA=;
 b=486ns1YCIRPWUKHR3RW3pjJAqPdpMC27AnFtZYpn533ry2RHOfDBoo7UwodTxw5nIxfR0JDm3
 8VnWoIa2JyPAR6PFrTukoOKqon4zQ591tg5PI+noJbEkzZiNf5TTvuO
X-Developer-Key: i=gchan9527@gmail.com; a=ed25519;
 pk=Ac2fkTqgUBlj2sns9hRIWJTYhWHO1BsmHbdBb5UpUUY=
X-Endpoint-Received: by B4 Relay for gchan9527@gmail.com/20240621 with
 auth_id=176
X-Original-From: George Chan <gchan9527@gmail.com>
Reply-To: gchan9527@gmail.com

From: George Chan <gchan9527@gmail.com>

Introduce camss subsys support to sc7180 family soc.

Signed-off-by: George Chan <gchan9527@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 135 +++++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index b5ebf8980325..c2180d52452c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -5,6 +5,7 @@
  * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,camcc-sc7180.h>
 #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
 #include <dt-bindings/clock/qcom,gcc-sc7180.h>
 #include <dt-bindings/clock/qcom,gpucc-sc7180.h>
@@ -3150,6 +3151,140 @@ camnoc_virt: interconnect@ac00000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		camss: camss@acb3000 {
+			compatible = "qcom,sc7180-camss";
+
+			reg = <0 0xacb3000 0 0x1000>,
+			      <0 0xacba000 0 0x1000>,
+			      <0 0xacc8000 0 0x1000>,
+			      <0 0xac65000 0 0x1000>,
+			      <0 0xac66000 0 0x1000>,
+			      <0 0xac67000 0 0x1000>,
+			      <0 0xac68000 0 0x1000>,
+			      <0 0xacaf000 0 0x4000>,
+			      <0 0xacb6000 0 0x4000>,
+			      <0 0xacc4000 0 0x4000>;
+
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy3",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
+
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "csi0",
+				      "csi1",
+				      "csi2",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy3",
+				      "csiphy3_timer",
+				      "gcc_camera_ahb",
+				      "gcc_camera_axi",
+				      "soc_ahb",
+				      "vfe0_axi",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1_axi",
+				      "vfe1",
+				      "vfe1_cphy_rx",
+				      "vfe_lite",
+				      "vfe_lite_cphy_rx";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy3",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite";
+
+			iommus = <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>,
+				 <&apps_smmu 0x860 0x0>;
+
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc TITAN_TOP_GDSC>;
+
+			power-domain-names = "ife0", "ife1", "top";
+
+			required-opps = <&rpmhpd_opp_low_svs>;
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
+
+				port@2 {
+					reg = <2>;
+				};
+
+				port@3 {
+					reg = <3>;
+				};
+
+			};
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sc7180-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;

-- 
2.34.1



