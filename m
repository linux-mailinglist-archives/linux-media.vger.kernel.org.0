Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAB0514BF8E
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 19:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgA1SXq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 13:23:46 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:17757 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726931AbgA1SXp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 13:23:45 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e307bfe0001>; Tue, 28 Jan 2020 10:22:54 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 28 Jan 2020 10:23:44 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 28 Jan 2020 10:23:44 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jan
 2020 18:23:43 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 28 Jan 2020 18:23:44 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.164.115]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e307c2f0000>; Tue, 28 Jan 2020 10:23:43 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v1 5/5] arm64: tegra: Add Tegra VI CSI suppport in device tree
Date:   Tue, 28 Jan 2020 10:23:21 -0800
Message-ID: <1580235801-4129-6-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580235774; bh=QP0/EibZzFp2xGilbhCpDCHkYsaTzPDrq/cR4XjAWcc=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=jhPJk9AtMteQjZM1XEmgM9DNTGgaPwqd/5kOrix321dgzKTjfLwPjB4/28nwHyz/N
         nli0+bN+YhCD2UZxuc5AKD7fXQQ9jo5FkKGHxXbxawiD9vFpIxJTlrnE2r8yI41iyR
         jCBRDuSskfD/CZJOZedildqqlA2e9uu92ozI6qnjsLb8Ntgctb8qdBVX2yoMoEnwdi
         XiGJolADQD2GVa0GftGvkE4G+YsLh/rMX+Z1Efk8MpDQyDS517zRaYI8FhaeMrz5OG
         FHG3rgwheUiaNIuwmoxzuNx73579p32XF17MTd8z8gFGUkoqPm0Lag7141eGvl7kCl
         Tmplh0p1/w8IQ==
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
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  8 +++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi       | 31 +++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index b0095072bc28..ec1b3033fa03 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -10,6 +10,14 @@
 			status = "okay";
 		};
 
+		vi@54080000 {
+			status = "okay";
+		};
+
+		csi@0x54080838 {
+			status = "okay";
+		};
+
 		sor@54580000 {
 			status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 48c63256ba7f..c6107ec03ad1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -136,9 +136,38 @@
 
 		vi@54080000 {
 			compatible = "nvidia,tegra210-vi";
-			reg = <0x0 0x54080000 0x0 0x00040000>;
+			reg = <0x0 0x54080000 0x0 0x808>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
+			assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
+			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
+
+			clocks = <&tegra_car TEGRA210_CLK_VI>;
+			clock-names = "vi";
+			resets = <&tegra_car 20>;
+			reset-names = "vi";
+		};
+
+		csi@0x54080838 {
+			compatible = "nvidia,tegra210-csi";
+			reg = <0x0 0x54080838 0x0 0x2000>;
+			status = "disabled";
+			assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
+					  <&tegra_car TEGRA210_CLK_CILCD>,
+					  <&tegra_car TEGRA210_CLK_CILE>;
+			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
+						 <&tegra_car TEGRA210_CLK_PLL_P>,
+						 <&tegra_car TEGRA210_CLK_PLL_P>;
+			assigned-clock-rates = <102000000>,
+					       <102000000>,
+					       <102000000>;
+
+			clocks = <&tegra_car TEGRA210_CLK_CSI>,
+				 <&tegra_car TEGRA210_CLK_CILAB>,
+				 <&tegra_car TEGRA210_CLK_CILCD>,
+				 <&tegra_car TEGRA210_CLK_CILE>;
+			clock-names = "csi", "cilab", "cilcd", "cile";
+
 		};
 
 		tsec@54100000 {
-- 
2.7.4

