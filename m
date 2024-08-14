Return-Path: <linux-media+bounces-16315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E486F951F9B
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 18:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 238281C218F6
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 16:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F5B1B8E8B;
	Wed, 14 Aug 2024 16:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="erzYqHtR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8141B32B1;
	Wed, 14 Aug 2024 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723652120; cv=none; b=EBC+HNRWbl3DgdMHARkxM/enQiqPq+/fpeAgkOTCc2jjaxcEI+SFunwoFStNjihzVSOE3Gp3nOWGwtRqdxqowN4yhQAGF4GfvduhVJ3P1nUWCLB+Lnpx/c7WZlRg0rTpLKE29Q7blUitcDMslLdqTsSmmoFOruizuaLa5oX65Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723652120; c=relaxed/simple;
	bh=d4tEalB0WzWRR1s1oQzHOMU8z3PE7Y6rfG3lDQFxJmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GblwHIsV4VOuhBYpMWlMaIXuwiLDWXhDsZPcHTFchyWoKrdwcMKofH4PkRJowq7b569RISN2b8OzWWr5OOi5hAn55fYBqJidxBbtMtm4cN8AQ+AKvF3u2genRsBW6/SF8+VgkSNtoZm8vXSy+0iA2yyKPf61t6VSO49YLkh/t6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=erzYqHtR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DA2F2E0;
	Wed, 14 Aug 2024 18:14:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723652059;
	bh=d4tEalB0WzWRR1s1oQzHOMU8z3PE7Y6rfG3lDQFxJmU=;
	h=From:To:Cc:Subject:Date:From;
	b=erzYqHtRTlrDUrc3N6/XNu04QFDU80kRzktZ9pmmUjahd9ravC6CNpK5OjILqHS7C
	 8YLuBbsYFy91wxbJ20+ztZF+2sDTIBm5k94SwHxMCxHbTrgIVhUaMUn3GMi3kRakO/
	 z0ZorMX1RbEO4Y0h5SM4tw3I3IpVvsBXqjSc0DS8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	Adam Ford <aford173@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Marek Vasut <marex@denx.de>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v4] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Date: Wed, 14 Aug 2024 19:14:51 +0300
Message-ID: <20240814161451.32119-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Elder <paul.elder@ideasonboard.com>

The ISP supports both CSI and parallel interfaces, where port 0
corresponds to the former and port 1 corresponds to the latter. Since
the i.MX8MP's ISPs are connected by the parallel interface to the CSI
receiver, set them both to port 1.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v3:

- Add comment regarding the IMX8MP_CLK_MEDIA_ISP clock rate
- Fix assigned-clock-rates
- Dropping Tested-by as the clock configuration has changed

Changes since v2:

- Assign clock parent and frequency in blk-ctrl

Changes since v1:

- Fix clock ordering
- Add #address-cells and #size-cells to ports nodes
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 57 ++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index d9b5c40f6460..f3531cfb0d79 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1673,6 +1673,50 @@ isi_in_1: endpoint {
 				};
 			};
 
+			isp_0: isp@32e10000 {
+				compatible = "fsl,imx8mp-isp";
+				reg = <0x32e10000 0x10000>;
+				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
+					 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
+					 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
+				clock-names = "isp", "aclk", "hclk";
+				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
+				fsl,blk-ctrl = <&media_blk_ctrl 0>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@1 {
+						reg = <1>;
+					};
+				};
+			};
+
+			isp_1: isp@32e20000 {
+				compatible = "fsl,imx8mp-isp";
+				reg = <0x32e20000 0x10000>;
+				interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
+					 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
+					 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
+				clock-names = "isp", "aclk", "hclk";
+				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
+				fsl,blk-ctrl = <&media_blk_ctrl 1>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@1 {
+						reg = <1>;
+					};
+				};
+			};
+
 			dewarp: dwe@32e30000 {
 				compatible = "nxp,imx8mp-dw100";
 				reg = <0x32e30000 0x10000>;
@@ -1869,17 +1913,26 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
 				clock-names = "apb", "axi", "cam1", "cam2",
 					      "disp1", "disp2", "isp", "phy";
 
+				/*
+				 * The ISP maximum frequency is 400MHz in normal mode
+				 * and 500MHz in overdrive mode. The 400MHz operating
+				 * point hasn't been successfully tested yet, so set
+				 * IMX8MP_CLK_MEDIA_ISP to 500MHz for the time being.
+				 */
 				assigned-clocks = <&clk IMX8MP_CLK_MEDIA_AXI>,
 						  <&clk IMX8MP_CLK_MEDIA_APB>,
 						  <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
 						  <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>,
+						  <&clk IMX8MP_CLK_MEDIA_ISP>,
 						  <&clk IMX8MP_VIDEO_PLL1>;
 				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
 							 <&clk IMX8MP_SYS_PLL1_800M>,
 							 <&clk IMX8MP_VIDEO_PLL1_OUT>,
-							 <&clk IMX8MP_VIDEO_PLL1_OUT>;
+							 <&clk IMX8MP_VIDEO_PLL1_OUT>,
+							 <&clk IMX8MP_SYS_PLL2_500M>;
 				assigned-clock-rates = <500000000>, <200000000>,
-						       <0>, <0>, <1039500000>;
+						       <0>, <0>, <500000000>,
+						       <1039500000>;
 				#power-domain-cells = <1>;
 
 				lvds_bridge: bridge@5c {

base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
prerequisite-patch-id: ad2bbccf3b0f27415fb14851cec52c431ccb354f
-- 
Regards,

Laurent Pinchart


