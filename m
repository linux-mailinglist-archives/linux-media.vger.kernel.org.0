Return-Path: <linux-media+bounces-13912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9EB9120FB
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 11:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD9571C2319A
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 09:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4590016F8EF;
	Fri, 21 Jun 2024 09:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eT2enNBT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A6216EBE7;
	Fri, 21 Jun 2024 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718962858; cv=none; b=b2JRGBOzoPnOtBiEezIhywFDTOfleEQGFovXAgfvSR0ZlY/kHUngOSSjvfxg+Z3nsPd8mDv5JxvJkVyx31BMUgjuJTYlVtDVdhqDm9xnZsJcXimi70anvZshjxY+9FBMoiuS4d0vlilzQ8w5dn4tIGGPOpY/KsKsSH/Ob4k58ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718962858; c=relaxed/simple;
	bh=086ciIBUwSein3FKRXzbIwvB2nfQumI262UryjRwkC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P8YBcKhOPnw1c1120uazbyoSs6kMhtjOIBhbBZQrSYJAfn7VotqjjAo+IM5L1Ec69Y1f1ioGe9e4BytD/rK9giJsDK/ZEX/sZYEgjBGOWE4b9Ejo6N33s5kQJmyoHWLYT1eUgvujF9x5SRPWk38YvVOXCsG5O1eQVEvgZzgzsTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eT2enNBT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83FD5C4AF54;
	Fri, 21 Jun 2024 09:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718962857;
	bh=086ciIBUwSein3FKRXzbIwvB2nfQumI262UryjRwkC4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eT2enNBTB3j7z67DLa9e1wu7xdOhnJv/OSXHmbzWjz1C8t+fWUOkcMYgoSWNKoPek
	 RTIMZKnaqWGWhP0JcPJ0waK1HQwOoLlClGWWGV6EOnMubqWfADhqXB7MNKmJld//En
	 6BPqqT0RatBt6hybEfbIY/uEelt6wi8XHLIMWmCBmyZq7xnPUHqkNiI5+207Q88m6z
	 v15hQGFBu5STuYoQP+iTbO+pD1EGcWHik1jTpw7vRKTCku9hdobc0N/N7of/cHAIQo
	 PYhc1DJ+9LjpnJ8561sd+S91iXbXXBnyc5ml+GfH+3Rjucp74E45mPYHIg2MfNnsBM
	 Pkitx0kHF4ZIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D73DC27C4F;
	Fri, 21 Jun 2024 09:40:57 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Date: Fri, 21 Jun 2024 17:40:58 +0800
Subject: [PATCH RFT 6/6] arm64: dts: qcom: sc7180: Add support for camss
 subsys
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-b4-sc7180-camss-v1-6-14937929f30e@gmail.com>
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
In-Reply-To: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718962855; l=4150;
 i=gchan9527@gmail.com; s=20240621; h=from:subject:message-id;
 bh=B8rhLES5xtNqCPArzEgX9w5nXV1pwjkOAbh2DRGd8HY=;
 b=P2glylTdS03cwFIQg4vYqmZQCnI2va7LPlU45e0jcpfBa3hgqbaEywoLDDqKmfKCqg7D+pnpg
 mhGmwOELNPLA4ShMM6oEpru5J/F7QDqc/VZj0md3oi/tJspGC24iV/8
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
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 134 +++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index b5ebf8980325..6ed4caafbe98 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -5,6 +5,7 @@
  * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,camcc-sc7180.h>
 #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
 #include <dt-bindings/clock/qcom,gcc-sc7180.h>
 #include <dt-bindings/clock/qcom,gpucc-sc7180.h>
@@ -3150,6 +3151,139 @@ camnoc_virt: interconnect@ac00000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		camss: camss@acb3000 {
+			compatible = "qcom,sc7180-camss";
+
+			reg = <0 0x0acb3000 0 0x1000>,
+				<0 0x0acba000 0 0x1000>,
+				<0 0x0acc8000 0 0x1000>,
+				<0 0x0ac65000 0 0x1000>,
+				<0 0x0ac66000 0 0x1000>,
+				<0 0x0ac67000 0 0x1000>,
+				<0 0x0ac68000 0 0x1000>,
+				<0 0x0acaf000 0 0x4000>,
+				<0 0x0acb6000 0 0x4000>,
+				<0 0x0acc4000 0 0x4000>;
+			reg-names = "csid0",
+				"csid1",
+				"csid2",
+				"csiphy0",
+				"csiphy1",
+				"csiphy2",
+				"csiphy3",
+				"vfe0",
+				"vfe1",
+				"vfe_lite";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 473 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 472 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+				"csid1",
+				"csid2",
+				"csiphy0",
+				"csiphy1",
+				"csiphy2",
+				"csiphy3",
+				"vfe0",
+				"vfe1",
+				"vfe_lite";
+
+			power-domains = <&camcc IFE_0_GDSC>,
+				<&camcc IFE_1_GDSC>,
+				<&camcc TITAN_TOP_GDSC>;
+
+			power-domain-names = "ife0",
+				"ife1",
+				"top";
+
+			required-opps = <&rpmhpd_opp_low_svs>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				<&camcc CAM_CC_CPAS_AHB_CLK>,
+				<&camcc CAM_CC_IFE_0_CSID_CLK>,
+				<&camcc CAM_CC_IFE_1_CSID_CLK>,
+				<&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				<&camcc CAM_CC_CSIPHY0_CLK>,
+				<&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				<&camcc CAM_CC_CSIPHY1_CLK>,
+				<&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				<&camcc CAM_CC_CSIPHY2_CLK>,
+				<&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				<&camcc CAM_CC_CSIPHY3_CLK>,
+				<&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				<&gcc GCC_CAMERA_AHB_CLK>,
+				<&gcc GCC_CAMERA_HF_AXI_CLK>,
+				<&camcc CAM_CC_SOC_AHB_CLK>,
+				<&camcc CAM_CC_IFE_0_AXI_CLK>,
+				<&camcc CAM_CC_IFE_0_CLK>,
+				<&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				<&camcc CAM_CC_IFE_1_AXI_CLK>,
+				<&camcc CAM_CC_IFE_1_CLK>,
+				<&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				<&camcc CAM_CC_IFE_LITE_CLK>,
+				<&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
+
+			clock-names = "camnoc_axi",
+				"cpas_ahb",
+				"csi0",
+				"csi1",
+				"csi2",
+				"csiphy0",
+				"csiphy0_timer",
+				"csiphy1",
+				"csiphy1_timer",
+				"csiphy2",
+				"csiphy2_timer",
+				"csiphy3",
+				"csiphy3_timer",
+				"gcc_camera_ahb",
+				"gcc_camera_axi",
+				"soc_ahb",
+				"vfe0_axi",
+				"vfe0",
+				"vfe0_cphy_rx",
+				"vfe1_axi",
+				"vfe1",
+				"vfe1_cphy_rx",
+				"vfe_lite",
+				"vfe_lite_cphy_rx";
+
+			iommus = <&apps_smmu 0x820 0x0>,
+				<&apps_smmu 0x840 0x0>,
+				<&apps_smmu 0x860 0x0>;
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
+			};
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sc7180-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;

-- 
2.34.1



