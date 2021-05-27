Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB6BD392902
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 09:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235215AbhE0H4u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 03:56:50 -0400
Received: from comms.puri.sm ([159.203.221.185]:53506 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235184AbhE0H41 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 03:56:27 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 6417BE2054;
        Thu, 27 May 2021 00:54:55 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4lQP8-udZodX; Thu, 27 May 2021 00:54:54 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh@kernel.org
Cc:     shawnguo@kernel.org, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, slongerbeam@gmail.com, kernel@puri.sm,
        krzk@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 3/3] arm64: dts: imx8mq: add mipi csi phy and csi bridge descriptions
Date:   Thu, 27 May 2021 09:54:07 +0200
Message-Id: <20210527075407.3180744-4-martin.kepplinger@puri.sm>
In-Reply-To: <20210527075407.3180744-1-martin.kepplinger@puri.sm>
References: <20210527075407.3180744-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Describe the 2 available CSI interfaces on the i.MX8MQ with the MIPI-CSI2
receiver and the CSI Bridge that provides the user buffers.

An image sensor is to be connected to the MIPIs' second port, described in
board files.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 102 ++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 91df9c5350ae..5bf02f4f904d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1099,6 +1099,108 @@ uart4: serial@30a60000 {
 				status = "disabled";
 			};
 
+			mipi_csi1: mipi_csi1@30a70000 {
+				compatible = "fsl,imx8mq-mipi-csi2";
+				reg = <0x30a70000 0x1000>;
+				clocks = <&clk IMX8MQ_CLK_CSI1_CORE>,
+				   <&clk IMX8MQ_CLK_CSI1_ESC>,
+				   <&clk IMX8MQ_CLK_CSI1_PHY_REF>,
+				   <&clk IMX8MQ_CLK_CLKO2>;
+				clock-names = "core", "esc", "pxl", "clko2";
+				assigned-clocks = <&clk IMX8MQ_CLK_CSI1_CORE>,
+				    <&clk IMX8MQ_CLK_CSI1_PHY_REF>,
+				    <&clk IMX8MQ_CLK_CSI1_ESC>;
+				assigned-clock-rates = <266000000>, <200000000>, <66000000>;
+				assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_266M>,
+					<&clk IMX8MQ_SYS2_PLL_1000M>,
+					<&clk IMX8MQ_SYS1_PLL_800M>;
+				power-domains = <&pgc_mipi_csi1>;
+				phy-reset = <&src>;
+				phy-gpr = <&iomuxc_gpr>;
+				interconnects = <&noc IMX8MQ_ICM_CSI1 &noc IMX8MQ_ICS_DRAM>;
+				interconnect-names = "dram";
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						csi1_mipi_ep: endpoint {
+							remote-endpoint = <&csi1_ep>;
+						};
+					};
+				};
+			};
+
+			csi1_bridge: csi1_bridge@30a90000 {
+				compatible = "fsl,imx7-csi";
+				reg = <0x30a90000 0x10000>;
+				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MQ_CLK_CSI1_ROOT>;
+				clock-names = "mclk";
+				status = "disabled";
+
+				port {
+					csi1_ep: endpoint {
+						remote-endpoint = <&csi1_mipi_ep>;
+					};
+				};
+			};
+
+			mipi_csi2: mipi_csi2@30b60000 {
+				compatible = "fsl,imx8mq-mipi-csi2";
+				reg = <0x30b60000 0x1000>;
+				clocks = <&clk IMX8MQ_CLK_CSI2_CORE>,
+				   <&clk IMX8MQ_CLK_CSI2_ESC>,
+				   <&clk IMX8MQ_CLK_CSI2_PHY_REF>,
+				   <&clk IMX8MQ_CLK_CLKO2>;
+				clock-names = "core", "esc", "pxl", "clko2";
+				assigned-clocks = <&clk IMX8MQ_CLK_CSI2_CORE>,
+				    <&clk IMX8MQ_CLK_CSI2_PHY_REF>,
+				    <&clk IMX8MQ_CLK_CSI2_ESC>;
+				assigned-clock-rates = <266000000>, <333000000>, <66000000>;
+				assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_266M>,
+					<&clk IMX8MQ_SYS2_PLL_1000M>,
+					<&clk IMX8MQ_SYS1_PLL_800M>;
+				power-domains = <&pgc_mipi_csi2>;
+				phy-reset = <&src>;
+				phy-gpr = <&iomuxc_gpr>;
+				interconnects = <&noc IMX8MQ_ICM_CSI2 &noc IMX8MQ_ICS_DRAM>;
+				interconnect-names = "dram";
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						csi2_mipi_ep: endpoint {
+							remote-endpoint = <&csi2_ep>;
+						};
+					};
+				};
+			};
+
+			csi2_bridge: csi2_bridge@30b80000 {
+				compatible = "fsl,imx7-csi";
+				reg = <0x30b80000 0x10000>;
+				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MQ_CLK_CSI2_ROOT>;
+				clock-names = "mclk";
+				status = "disabled";
+
+				port {
+					csi2_ep: endpoint {
+						remote-endpoint = <&csi2_mipi_ep>;
+					};
+				};
+			};
+
 			mu: mailbox@30aa0000 {
 				compatible = "fsl,imx8mq-mu", "fsl,imx6sx-mu";
 				reg = <0x30aa0000 0x10000>;
-- 
2.30.2

