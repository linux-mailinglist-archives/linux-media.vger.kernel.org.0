Return-Path: <linux-media+bounces-1339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B497FD2C7
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 10:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B816D1C209B5
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 09:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248B315E88;
	Wed, 29 Nov 2023 09:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H+GaGd/M"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B972213F;
	Wed, 29 Nov 2023 01:31:43 -0800 (PST)
Received: from pyrite.hamster-moth.ts.net (h175-177-049-135.catv02.itscom.jp [175.177.49.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 736FA2B6;
	Wed, 29 Nov 2023 10:30:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701250265;
	bh=Ivci0RIdZox1QiCzMM0eBouiiFmKKEtb5YIkQNAQ3HY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H+GaGd/Mvd577CKM47ZqEdGDKy7TtRBM1fO5smyYn1ulrdAlXRM531mw/N7Gtc6pO
	 z5eq3XiCNsg/DCUIox2IIOncFaiDOOiEQyxZB3EIWMTRbct/whRTJSDTJmb0QTsGg6
	 V1c1Q5R+yo8ALwsM413vSDzzchnsk0di9AiaKJeI=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	Paul Elder <paul.elder@ideasonboard.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Adam Ford <aford173@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Date: Wed, 29 Nov 2023 18:31:12 +0900
Message-Id: <20231129093113.255161-2-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231129093113.255161-1-paul.elder@ideasonboard.com>
References: <20231129093113.255161-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ISP supports both CSI and parallel interfaces, where port 0
corresponds to the former and port 1 corresponds to the latter. Since
the i.MX8MP's ISPs are connected by the parallel interface to the CSI
receiver, set them both to port 1.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 50 +++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index c9a610ba4836..25579d4c58f2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1604,6 +1604,56 @@ isi_in_1: endpoint {
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
+				assigned-clocks = <&clk IMX8MP_CLK_MEDIA_ISP>;
+				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
+				assigned-clock-rates = <500000000>;
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
+				assigned-clocks = <&clk IMX8MP_CLK_MEDIA_ISP>;
+				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
+				assigned-clock-rates = <500000000>;
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
-- 
2.39.2


