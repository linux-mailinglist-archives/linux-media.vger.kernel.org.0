Return-Path: <linux-media+bounces-34845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C49D1ADA571
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 03:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE0BE7A34EA
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 01:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6A91C1F05;
	Mon, 16 Jun 2025 01:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EV/RSakt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB4C13EFF3;
	Mon, 16 Jun 2025 01:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750036308; cv=none; b=sWwgSLsPqExuBcUBfZW3wInEAhaDMfqAnQgVHhc/M7qYmHCu9zzx5FEAm6U/WrcyQ8GCxQ4XisTkhD4l70Os8EtP7eraRW++prGVpb50xog1cY14g91lq9CM18o44NLSljv/gvpem1fczKkq5vEBCRBSepsesC5UeE6WidbdkHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750036308; c=relaxed/simple;
	bh=bidpHkabeG2AWucLwwrbyd8PH6LfkS3oy4qdyJfWoJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dr11FIurzCa2Z8SaNWumO+2Z7vEok1OCWwBMk8SV/O0kBylxnVrxffWlZwmsPDuvUmqaE5drVO4iS0B4L3Wt6/EN6fQ8PFP94xbXkfoLnIdDIoCRIXat6WUMthS6c8lGMYRGhVwdsdQbaPB5G/co+3wYmakJsjNdiaC6FkbHXhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EV/RSakt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15E991815;
	Mon, 16 Jun 2025 03:11:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750036288;
	bh=bidpHkabeG2AWucLwwrbyd8PH6LfkS3oy4qdyJfWoJU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EV/RSaktsnRATLpVNYhqVrqabqGLxnEcc1wWD9ga3ITzUIfE9TqoS6ScXDDbg1c4V
	 KzGCbPtgSISmpZwkZsOAEi8zJrPapDr4YEsHXXd/COvALo5sA1eYPZASlYVFOGQbMM
	 8GhXuknx0LAQAfN3ybHyi69DeFFoaSCQfstLVh4A=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 6/6] arm64: dts: imx8mp: Add pclk clock and second power domain for the ISP
Date: Mon, 16 Jun 2025 04:11:15 +0300
Message-ID: <20250616011115.19515-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
References: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ISP HDR stitching registers are clocked by the pixel clock, which is
gated by the MIPI_CSI2 power domain. Attempting to access those
registers with the clock off locks up the system. Fix this by adding the
pclk clock and the MIPI_CSI2 secondary power domain.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index c409a1d1e851..223f956b5442 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1704,9 +1704,12 @@ isp_0: isp@32e10000 {
 				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
 					 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
-					 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
-				clock-names = "isp", "aclk", "hclk";
-				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
+					 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>,
+					 <&clk IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT>;
+				clock-names = "isp", "aclk", "hclk", "pclk";
+				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>,
+						<&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
+				power-domain-names = "isp", "csi2";
 				fsl,blk-ctrl = <&media_blk_ctrl 0>;
 				status = "disabled";
 
@@ -1726,9 +1729,12 @@ isp_1: isp@32e20000 {
 				interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
 					 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
-					 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
-				clock-names = "isp", "aclk", "hclk";
-				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
+					 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>,
+					 <&clk IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT>;
+				clock-names = "isp", "aclk", "hclk", "pclk";
+				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>,
+						<&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
+				power-domain-names = "isp", "csi2";
 				fsl,blk-ctrl = <&media_blk_ctrl 1>;
 				status = "disabled";
 
-- 
Regards,

Laurent Pinchart


