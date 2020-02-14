Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2247915F4CE
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 19:24:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394924AbgBNSXy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 13:23:54 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:8084 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394849AbgBNSXe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 13:23:34 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e46e5630000>; Fri, 14 Feb 2020 10:22:27 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 14 Feb 2020 10:23:33 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 14 Feb 2020 10:23:33 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 18:23:33 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 14 Feb 2020 18:23:33 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.163.245]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e46e5a40002>; Fri, 14 Feb 2020 10:23:33 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v3 6/6] arm64: tegra: Add Tegra VI CSI support in device tree
Date:   Fri, 14 Feb 2020 10:23:28 -0800
Message-ID: <1581704608-31219-7-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581704547; bh=MdTis2jRoOdhMHZSK2/mIp+3+wEetN7v9CqGqUXKBio=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=insXpUmdzSAsQJNMriGfr4D9ciBOJvGRqa7dQzl0/M6GLFfaE1rtbKkt6fgHuIOLq
         RIt6Btcb6ka7k4VsCCEbTmoD9FBu+CszKvP062+r3RxIivhYbsLhrV2By2BEf+5lrK
         Vz1yRUOOl643V1PyEW/qone2WbTrVB5L8FvvjUF/oi+eBt5OxiJ25ioUeB+ONXu8oA
         YDKwKfhPIR2NdlV4ccoiVskK99thnVo9EjxmUjqdWidpjQ+J7jo19P2MedLvCbqjL/
         Ve3fHUi+34qBFWVHN1AnqiVqe1Hr2GG/NzBnvvy3HvMooj/ofh7RLFK7CM06r71mC3
         3o+Ww+qXr6J3A==
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
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 10 +++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi       | 36 +++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index b0095072bc28..f60957c8dd7f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -10,6 +10,16 @@
 			status = "okay";
 		};
 
+		vi@54080000 {
+			status = "okay";
+
+			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
+
+			csi@0x54080838 {
+				status = "okay";
+			};
+		};
+
 		sor@54580000 {
 			status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 48c63256ba7f..fd47f93e4f56 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -136,9 +136,43 @@
 
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
+			clock-names = "vi";
+			resets = <&tegra_car 20>;
+			reset-names = "vi";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			ranges = <0x0 0x54080808 0x0 0x54080808 0x0 0x2000>;
+
+			csi@0x54080838 {
+				compatible = "nvidia,tegra210-csi";
+				reg = <0x0 0x54080838 0x0 0x2000>;
+				status = "disabled";
+				assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
+						  <&tegra_car TEGRA210_CLK_CILCD>,
+						  <&tegra_car TEGRA210_CLK_CILE>;
+				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
+							 <&tegra_car TEGRA210_CLK_PLL_P>,
+							 <&tegra_car TEGRA210_CLK_PLL_P>;
+				assigned-clock-rates = <102000000>,
+						       <102000000>,
+						       <102000000>;
+
+				clocks = <&tegra_car TEGRA210_CLK_CSI>,
+					 <&tegra_car TEGRA210_CLK_CILAB>,
+					 <&tegra_car TEGRA210_CLK_CILCD>,
+					 <&tegra_car TEGRA210_CLK_CILE>;
+				clock-names = "csi", "cilab", "cilcd", "cile";
+			};
+
 		};
 
 		tsec@54100000 {
-- 
2.7.4

