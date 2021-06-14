Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FEC93A71C8
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 00:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhFNWNd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 18:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhFNWNc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 18:13:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89503C061574;
        Mon, 14 Jun 2021 15:11:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7530245E;
        Tue, 15 Jun 2021 00:11:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623708686;
        bh=d6On1obOvR3mdypl3LHyTI9n/zs1VVSO7ReovBf8178=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N3IweVw5LV42lTjVJimmEwOIpZRmLcBO7krY8/l8yqDni0c7WelA8OcKjVSYa+o8J
         ASkpw46lNTodoMKcECgOKk+cm6FeYnILSPBKIrv4U9Ds1zw54aggxOicwuepZUt/6b
         V0Kik33WzxsDGj4JV7kDZKW3dH0L0LDsFrE1gxWM=
Date:   Tue, 15 Jun 2021 01:11:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, kernel@puri.sm, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, m.felsch@pengutronix.de,
        mchehab@kernel.org, phone-devel@vger.kernel.org, robh@kernel.org,
        shawnguo@kernel.org, slongerbeam@gmail.com
Subject: Re: [PATCH v4.1 3/3] arm64: dts: imx8mq: add mipi csi phy and csi
 bridge descriptions
Message-ID: <YMfT+swqNAm67EmS@pendragon.ideasonboard.com>
References: <20210614121522.2944593-4-martin.kepplinger@puri.sm>
 <20210614122517.2945532-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210614122517.2945532-1-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

Thank you for the patch.

On Mon, Jun 14, 2021 at 02:25:17PM +0200, Martin Kepplinger wrote:
> Describe the 2 available CSI interfaces on the i.MX8MQ with the MIPI-CSI2
> receiver and the CSI Bridge that provides the user buffers, where the
> existing driver can directly be used.
> 
> An image sensor is to be connected to the MIPIs' second port, described in
> board files.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
> 
> sorry, the csi compatible addition suggested by Marco was missing in
> v4 3/3. here is 3/3 updated.
> 
> 
> 
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 102 ++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 91df9c5350ae..fa83e8294b20 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -1099,6 +1099,108 @@ uart4: serial@30a60000 {
>  				status = "disabled";
>  			};
>  
> +			mipi_csi1: csi@30a70000 {
> +				compatible = "fsl,imx8mq-mipi-csi2";
> +				reg = <0x30a70000 0x1000>;
> +				clocks = <&clk IMX8MQ_CLK_CSI1_CORE>,
> +				   <&clk IMX8MQ_CLK_CSI1_ESC>,
> +				   <&clk IMX8MQ_CLK_CSI1_PHY_REF>,
> +				   <&clk IMX8MQ_CLK_CLKO2>;
> +				clock-names = "core", "esc", "pxl", "clko2";

I can't figure out what the clko2 clock is used for based on the
datasheet. It seems to be a clock output by the SoC on GPIO1_IO15, and
doesn't seem to belong here.

Regarding core, esc and pix, do these clock correspond to the clk,
clk_esc and clk_ui listed in table 13-36 (section 13.8.3.3.1 "RX Local
Interface Description") of the TRM ? If so, should they be renamed
accordingly, to either "clk", "clk_esc" and "clk_ui", or, if we want to
drop the prefixes, "core", "esc" and "ui" ?

> +				assigned-clocks = <&clk IMX8MQ_CLK_CSI1_CORE>,
> +				    <&clk IMX8MQ_CLK_CSI1_PHY_REF>,
> +				    <&clk IMX8MQ_CLK_CSI1_ESC>;
> +				assigned-clock-rates = <266000000>, <333000000>, <66000000>;
> +				assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_266M>,
> +					<&clk IMX8MQ_SYS2_PLL_1000M>,
> +					<&clk IMX8MQ_SYS1_PLL_800M>;
> +				power-domains = <&pgc_mipi_csi1>;
> +				resets = <&src>;

The src node has #reset-cells set to 1, I think you're missing something
here.

> +				fsl,mipi-phy-gpr = <&iomuxc_gpr 0x88>;
> +				interconnects = <&noc IMX8MQ_ICM_CSI1 &noc IMX8MQ_ICS_DRAM>;
> +				interconnect-names = "dram";
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						csi1_mipi_ep: endpoint {
> +							remote-endpoint = <&csi1_ep>;
> +						};
> +					};
> +				};
> +			};
> +
> +			csi1: csi@30a90000 {
> +				compatible = "fsl,imx8mq-csi", "fsl,imx7-csi";
> +				reg = <0x30a90000 0x10000>;
> +				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clk IMX8MQ_CLK_CSI1_ROOT>;
> +				clock-names = "mclk";
> +				status = "disabled";
> +
> +				port {
> +					csi1_ep: endpoint {
> +						remote-endpoint = <&csi1_mipi_ep>;
> +					};
> +				};
> +			};
> +
> +			mipi_csi2: csi@30b60000 {
> +				compatible = "fsl,imx8mq-mipi-csi2";
> +				reg = <0x30b60000 0x1000>;
> +				clocks = <&clk IMX8MQ_CLK_CSI2_CORE>,
> +				   <&clk IMX8MQ_CLK_CSI2_ESC>,
> +				   <&clk IMX8MQ_CLK_CSI2_PHY_REF>,
> +				   <&clk IMX8MQ_CLK_CLKO2>;
> +				clock-names = "core", "esc", "pxl", "clko2";
> +				assigned-clocks = <&clk IMX8MQ_CLK_CSI2_CORE>,
> +				    <&clk IMX8MQ_CLK_CSI2_PHY_REF>,
> +				    <&clk IMX8MQ_CLK_CSI2_ESC>;
> +				assigned-clock-rates = <266000000>, <333000000>, <66000000>;
> +				assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_266M>,
> +					<&clk IMX8MQ_SYS2_PLL_1000M>,
> +					<&clk IMX8MQ_SYS1_PLL_800M>;
> +				power-domains = <&pgc_mipi_csi2>;
> +				resets = <&src>;
> +				fsl,mipi-phy-gpr = <&iomuxc_gpr 0xa4>;
> +				interconnects = <&noc IMX8MQ_ICM_CSI2 &noc IMX8MQ_ICS_DRAM>;
> +				interconnect-names = "dram";
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						csi2_mipi_ep: endpoint {
> +							remote-endpoint = <&csi2_ep>;
> +						};
> +					};
> +				};
> +			};
> +
> +			csi2: csi@30b80000 {
> +				compatible = "fsl,imx8mq-csi", "fsl,imx7-csi";
> +				reg = <0x30b80000 0x10000>;
> +				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clk IMX8MQ_CLK_CSI2_ROOT>;
> +				clock-names = "mclk";
> +				status = "disabled";
> +
> +				port {
> +					csi2_ep: endpoint {
> +						remote-endpoint = <&csi2_mipi_ep>;
> +					};
> +				};
> +			};
> +
>  			mu: mailbox@30aa0000 {
>  				compatible = "fsl,imx8mq-mu", "fsl,imx6sx-mu";
>  				reg = <0x30aa0000 0x10000>;

-- 
Regards,

Laurent Pinchart
