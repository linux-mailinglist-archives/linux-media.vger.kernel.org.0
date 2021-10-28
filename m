Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B12F743D894
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 03:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbhJ1BeO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Oct 2021 21:34:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38332 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhJ1BeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Oct 2021 21:34:13 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E10A6276;
        Thu, 28 Oct 2021 03:31:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635384706;
        bh=W61TWmkoyqLkITOU7v3m79iwZxMeYw/EwHh8vkM1pK4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MML/9VdlSyvMjHErZJA9uwpyDCjvYZTj4cepHPFtEMOQT2fg5M4MREwyh80hIDK18
         l1M8v41i3Dg/tVAHEbzAq9faANOPMhpz0kvhUWpJYqbsaSbcssE7/JrRJvtCEWzVaU
         yBa88W/xVvINuFD3/7tdXLodnaCDDgHMVCKxkbVM=
Date:   Thu, 28 Oct 2021 04:31:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        cstevens@beaconembedded.com, aford@beaconembedded.com,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC V2 5/5] arm64: dts: imx8mm-evk: Enable OV5640 Camera
Message-ID: <YXn9aibI1C/+eP5L@pendragon.ideasonboard.com>
References: <20211023203457.1217821-1-aford173@gmail.com>
 <20211023203457.1217821-6-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211023203457.1217821-6-aford173@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

Thank you for the patch.

On Sat, Oct 23, 2021 at 03:34:56PM -0500, Adam Ford wrote:
> The schematic shows support for a camera interface, and the NXP
> kernel shows it is an OV5640.

The camera is an external module though. Should this be a DT overlay ?

> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> index e033d0257b5a..27217d30b8d8 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> @@ -239,6 +239,10 @@ ldo6_reg: LDO6 {
>  	};
>  };
>  
> +&csi {
> +	status = "okay";
> +};
> +
>  &i2c2 {
>  	clock-frequency = <400000>;
>  	pinctrl-names = "default";
> @@ -287,6 +291,38 @@ pca6416: gpio@20 {
>  		gpio-controller;
>  		#gpio-cells = <2>;
>  	};
> +
> +	camera@3c {
> +		compatible = "ovti,ov5640";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_ov5640>;
> +		reg = <0x3c>;
> +		clocks = <&clk IMX8MM_CLK_CLKO1>;
> +		clock-names = "xclk";
> +		assigned-clocks = <&clk IMX8MM_CLK_CLKO1>;
> +		assigned-clock-parents = <&clk IMX8MM_CLK_24M>;
> +		assigned-clock-rates = <24000000>;
> +		powerdown-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			/* MIPI CSI-2 bus endpoint */
> +			ov5640_to_mipi_csi2: endpoint {
> +				remote-endpoint = <&imx8mm_mipi_csi_in>;
> +				clock-lanes = <0>;
> +				data-lanes = <1 2>;
> +			};
> +		};
> +	};
> +};
> +
> +&imx8mm_mipi_csi_in {
> +	remote-endpoint = <&ov5640_to_mipi_csi2>;
> +	data-lanes = <1 2>;
> +};
> +
> +&mipi_csi2 {
> +	status = "okay";
>  };
>  
>  &sai3 {
> @@ -406,6 +442,14 @@ MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
>  		>;
>  	};
>  
> +	pinctrl_ov5640: ov5640grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7		0x19
> +			MX8MM_IOMUXC_GPIO1_IO06_GPIO1_IO6		0x19
> +			MX8MM_IOMUXC_GPIO1_IO14_CCMSRCGPCMIX_CLKO1	0x59
> +		>;
> +	};
> +
>  	pinctrl_pmic: pmicirqgrp {
>  		fsl,pins = <
>  			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x141

-- 
Regards,

Laurent Pinchart
