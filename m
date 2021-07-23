Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD5D63D389D
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 12:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbhGWJoG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 05:44:06 -0400
Received: from comms.puri.sm ([159.203.221.185]:35128 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232029AbhGWJoE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 05:44:04 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 6DEC9DFD94;
        Fri, 23 Jul 2021 03:24:08 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id comdRBkYO8rg; Fri, 23 Jul 2021 03:24:07 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     laurent.pinchart@ideasonboard.com, shawnguo@kernel.org
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, kernel@puri.sm, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, m.felsch@pengutronix.de,
        mchehab@kernel.org, phone-devel@vger.kernel.org, robh@kernel.org,
        slongerbeam@gmail.com,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v8 3/3] arm64: dts: imx8mq: add mipi csi phy and csi bridge descriptions
Date:   Fri, 23 Jul 2021 12:12:17 +0200
Message-Id: <20210723101217.1954805-4-martin.kepplinger@puri.sm>
In-Reply-To: <20210723101217.1954805-1-martin.kepplinger@puri.sm>
References: <20210723101217.1954805-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Describe the 2 available CSI interfaces on the i.MX8MQ with the MIPI-CSI2
receiver (new driver) and the CSI Bridge that provides the user buffers
(existing driver).

An image sensor is to be connected to the MIPIs' second port, to be described
in board files.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 104 ++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 91df9c5350ae..e026a39bddce 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1099,6 +1099,110 @@ uart4: serial@30a60000 {
 				status = "disabled";
 			};
 
+			mipi_csi1: csi@30a70000 {
+				compatible = "fsl,imx8mq-mipi-csi2";
+				reg = <0x30a70000 0x1000>;
+				clocks = <&clk IMX8MQ_CLK_CSI1_CORE>,
+				   <&clk IMX8MQ_CLK_CSI1_ESC>,
+				   <&clk IMX8MQ_CLK_CSI1_PHY_REF>;
+				clock-names = "core", "esc", "ui";
+				assigned-clocks = <&clk IMX8MQ_CLK_CSI1_CORE>,
+				    <&clk IMX8MQ_CLK_CSI1_PHY_REF>,
+				    <&clk IMX8MQ_CLK_CSI1_ESC>;
+				assigned-clock-rates = <266000000>, <333000000>, <66000000>;
+				assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_266M>,
+					<&clk IMX8MQ_SYS2_PLL_1000M>,
+					<&clk IMX8MQ_SYS1_PLL_800M>;
+				power-domains = <&pgc_mipi_csi1>;
+				resets = <&src IMX8MQ_RESET_MIPI_CSI1_CORE_RESET>,
+					 <&src IMX8MQ_RESET_MIPI_CSI1_PHY_REF_RESET>,
+					 <&src IMX8MQ_RESET_MIPI_CSI1_ESC_RESET>;
+				fsl,mipi-phy-gpr = <&iomuxc_gpr 0x88>;
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
+			csi1: csi@30a90000 {
+				compatible = "fsl,imx8mq-csi", "fsl,imx7-csi";
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
+			mipi_csi2: csi@30b60000 {
+				compatible = "fsl,imx8mq-mipi-csi2";
+				reg = <0x30b60000 0x1000>;
+				clocks = <&clk IMX8MQ_CLK_CSI2_CORE>,
+				   <&clk IMX8MQ_CLK_CSI2_ESC>,
+				   <&clk IMX8MQ_CLK_CSI2_PHY_REF>;
+				clock-names = "core", "esc", "ui";
+				assigned-clocks = <&clk IMX8MQ_CLK_CSI2_CORE>,
+				    <&clk IMX8MQ_CLK_CSI2_PHY_REF>,
+				    <&clk IMX8MQ_CLK_CSI2_ESC>;
+				assigned-clock-rates = <266000000>, <333000000>, <66000000>;
+				assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_266M>,
+					<&clk IMX8MQ_SYS2_PLL_1000M>,
+					<&clk IMX8MQ_SYS1_PLL_800M>;
+				power-domains = <&pgc_mipi_csi2>;
+				resets = <&src IMX8MQ_RESET_MIPI_CSI2_CORE_RESET>,
+					 <&src IMX8MQ_RESET_MIPI_CSI2_PHY_REF_RESET>,
+					 <&src IMX8MQ_RESET_MIPI_CSI2_ESC_RESET>;
+				fsl,mipi-phy-gpr = <&iomuxc_gpr 0xa4>;
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
+			csi2: csi@30b80000 {
+				compatible = "fsl,imx8mq-csi", "fsl,imx7-csi";
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

