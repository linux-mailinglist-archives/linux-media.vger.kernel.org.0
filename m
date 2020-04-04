Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAC1619E216
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2020 03:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgDDBZX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 21:25:23 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18810 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727254AbgDDBZW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 21:25:22 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e87e1f40000>; Fri, 03 Apr 2020 18:25:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 03 Apr 2020 18:25:21 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 03 Apr 2020 18:25:21 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 4 Apr
 2020 01:25:21 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 4 Apr 2020 01:25:21 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.164.193]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e87e1ff0006>; Fri, 03 Apr 2020 18:25:20 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v6 9/9] arm64: tegra: Add Tegra VI CSI support in device tree
Date:   Fri, 3 Apr 2020 18:25:07 -0700
Message-ID: <1585963507-12610-10-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585963508; bh=yB3b29VbNFtTvMcPZCMVxLppaVECoZp9WEY70dWiuUY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=DrG94gA21AI8HLj25IoD73oQAFXxnrKG3J01umfSi+5L3OB/WmOuIKTGc4Ju2otz2
         4+y9MRHp8I/U0QjlubB88nz3sl8Poe6gkpnr9M2AOUIqFier0bjUjThMx+iCmZaYmA
         vuupZmcfV+6gdxVeDG6PzGPFC68EyhDL+qIEdZKJQgIgZUaRQl5cqP9T3Bw9mkOBIj
         2fsKMoekOBrI7D7cBaUhGYBoTREtGQeQH+zU2vW5aYTOG23AXBE0Mwi9QUW5/IQ5/F
         9spn/WOcrVgx7UFjUmsdL+Fqujq2uOnjDU0I2+arQ9gPHuOorRtf516BUj0Ne5BS/q
         7YjcIQy4b9cFQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tegra210 contains VI controller for video input capture from MIPI
CSI camera sensors and also supports built-in test pattern generator.

CSI ports can be one-to-one mapped to VI channels for capturing from
an external sensor or from built-in test pattern generator.

This patch adds support for VI and CSI and enables them in Tegra210
device tree.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 10 ++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi       | 46 +++++++++++++++++++++++++-
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 313a4c2..b57d837 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -14,6 +14,16 @@
 			status = "okay";
 		};
 
+		vi@54080000 {
+			status = "okay";
+
+			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
+
+			csi@838 {
+				status = "okay";
+			};
+		};
+
 		sor@54580000 {
 			status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 5b1dfd8..cad42a7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -137,9 +137,44 @@
 
 		vi@54080000 {
 			compatible = "nvidia,tegra210-vi";
-			reg = <0x0 0x54080000 0x0 0x00040000>;
+			reg = <0x0 0x54080000 0x0 0x700>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
+			assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
+			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
+
+			clocks = <&tegra_car TEGRA210_CLK_VI>;
+			power-domains = <&pd_venc>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x0 0x54080000 0x2000>;
+
+			csi@838 {
+				compatible = "nvidia,tegra210-csi";
+				reg = <0x838 0x1300>;
+				status = "disabled";
+				assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
+						  <&tegra_car TEGRA210_CLK_CILCD>,
+						  <&tegra_car TEGRA210_CLK_CILE>,
+						  <&tegra_car TEGRA210_CLK_CSI_TPG>;
+				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
+							 <&tegra_car TEGRA210_CLK_PLL_P>,
+							 <&tegra_car TEGRA210_CLK_PLL_P>;
+				assigned-clock-rates = <102000000>,
+						       <102000000>,
+						       <102000000>,
+						       <972000000>;
+
+				clocks = <&tegra_car TEGRA210_CLK_CSI>,
+					 <&tegra_car TEGRA210_CLK_CILAB>,
+					 <&tegra_car TEGRA210_CLK_CILCD>,
+					 <&tegra_car TEGRA210_CLK_CILE>,
+					 <&tegra_car TEGRA210_CLK_CSI_TPG>;
+				clock-names = "csi", "cilab", "cilcd", "cile", "csi_tpg";
+				power-domains = <&pd_sor>;
+			};
 		};
 
 		tsec@54100000 {
@@ -839,6 +874,15 @@
 				reset-names = "vic";
 				#power-domain-cells = <0>;
 			};
+
+			pd_venc: venc {
+				clocks = <&tegra_car TEGRA210_CLK_VI>,
+					 <&tegra_car TEGRA210_CLK_CSI>;
+				resets = <&mc TEGRA210_MC_RESET_VI>,
+					 <&tegra_car TEGRA210_RST_VI>,
+					 <&tegra_car TEGRA210_CLK_CSI>;
+				#power-domain-cells = <0>;
+			};
 		};
 
 		sdmmc1_3v3: sdmmc1-3v3 {
-- 
2.7.4

