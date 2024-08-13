Return-Path: <linux-media+bounces-16256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 736709510B3
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 01:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A319C1C220DF
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 23:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640E51AC42C;
	Tue, 13 Aug 2024 23:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Cgdrqcfs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504FD22EEF;
	Tue, 13 Aug 2024 23:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723592438; cv=none; b=TLkqK3JH+M1LhCsZyYDYXvxMDM9sRPoDOyFhGzLlD9JWkJWkxduvDfHS8F/B4fvaLdjAHDySpMAezqzc5x1lhUN6fKJd24XNm7/VnXPV6HpVpushOqq1Z02hpFaxrVgo5AgLmANdOVa9Ocqmeh39WSBxue+dJVNYXG10SOBG/0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723592438; c=relaxed/simple;
	bh=9+W2TFPV9Zbw1r91dnIlZVDJj3S8mnEu6JTLA39GoqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T4iZj82Om4oJgCA2WKZ08pMsyaXR3tNnoWIevNXeIauJb5bR1zXYJ4sCmRE5xM81EUSLNa3WTpr2GZaMQt7c+LomxcDCpqJt/8qdYqi70bgJgVQO1PMp8TiDXa6GHr/pXLEbI/wcTgcKzw2fCX/lF7dIgMHP0l0VUNlQTKapZ2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Cgdrqcfs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0956A9FF;
	Wed, 14 Aug 2024 01:39:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723592378;
	bh=9+W2TFPV9Zbw1r91dnIlZVDJj3S8mnEu6JTLA39GoqM=;
	h=From:To:Cc:Subject:Date:From;
	b=Cgdrqcfsu7/9/9h/K5WHCD3AFHTtFESe8osR51mVil0DhzO0s7faY6DJ/CtVS1arR
	 dVW35z1PgkMjmaSJk+qnyQVPuaT1/bGFvEQ8ue8TyTJJvurMDTKhwGCNCqDcZEXORT
	 7r4SgFSc3dWsgp3PPXZbPZIt1rlAIxE5ugETMmGI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Adam Ford <aford173@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Marek Vasut <marex@denx.de>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mp: Clarify csis clock frequency
Date: Wed, 14 Aug 2024 02:40:10 +0300
Message-ID: <20240813234010.17852-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT nodes for the MIPI CSI-2 receivers (MIPI_CSI) configure the
CAM1_PIX and CAM2_PIX clocks to 266 MHz through the assigned-clock-rates
property, and report that frequency in the clock-frequency property. The
i.MX8MP reference manual and datasheet list 266 MHz as a nominal
frequency when using both CSI-2 receivers, so all looks normal.

In reality, the clock is actually set to 250 MHz, as the selected
parent, IMX8MP_SYS_PLL2_1000M, has a 1/4 output that is selected as the
closest frequency to 266 MHz. This doesn't break operation of the
device, but is clearly misleading.

Clarify the clock configuration by selecting the IMX8MP_SYS_PLL2_250M
parent, dropping the redundant assigned-clock-rates, and setting
clock-frequency to 250 MHz. This doesn't cause any functional change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 603dfe80216f..d9b5c40f6460 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1687,7 +1687,7 @@ mipi_csi_0: csi@32e40000 {
 				compatible = "fsl,imx8mp-mipi-csi2", "fsl,imx8mm-mipi-csi2";
 				reg = <0x32e40000 0x10000>;
 				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-				clock-frequency = <266000000>;
+				clock-frequency = <250000000>;
 				clocks = <&clk IMX8MP_CLK_MEDIA_APB_ROOT>,
 					 <&clk IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT>,
 					 <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT>,
@@ -1695,9 +1695,8 @@ mipi_csi_0: csi@32e40000 {
 				clock-names = "pclk", "wrap", "phy", "axi";
 				assigned-clocks = <&clk IMX8MP_CLK_MEDIA_CAM1_PIX>,
 						  <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
-				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
+				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
 							 <&clk IMX8MP_CLK_24M>;
-				assigned-clock-rates = <266000000>;
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
 				status = "disabled";
 
@@ -1723,7 +1722,7 @@ mipi_csi_1: csi@32e50000 {
 				compatible = "fsl,imx8mp-mipi-csi2", "fsl,imx8mm-mipi-csi2";
 				reg = <0x32e50000 0x10000>;
 				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
-				clock-frequency = <266000000>;
+				clock-frequency = <250000000>;
 				clocks = <&clk IMX8MP_CLK_MEDIA_APB_ROOT>,
 					 <&clk IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT>,
 					 <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT>,
@@ -1731,9 +1730,8 @@ mipi_csi_1: csi@32e50000 {
 				clock-names = "pclk", "wrap", "phy", "axi";
 				assigned-clocks = <&clk IMX8MP_CLK_MEDIA_CAM2_PIX>,
 						  <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
-				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
+				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
 							 <&clk IMX8MP_CLK_24M>;
-				assigned-clock-rates = <266000000>;
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
 				status = "disabled";
 

base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
-- 
Regards,

Laurent Pinchart


