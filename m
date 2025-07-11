Return-Path: <linux-media+bounces-37449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD80FB0130B
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 07:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C92517BC0A4
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 05:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC281CF5C0;
	Fri, 11 Jul 2025 05:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="qCPpecw2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8A91B87C9;
	Fri, 11 Jul 2025 05:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752213212; cv=none; b=WQGHb9iyJ7C7J4Hq9gKivgdDbY9SJabMrwlLwEP2muVYZNhMl7j+GNHh3Xd0bKfuCQ/BU6VIH+OQX+YuLPfttrmGpSW3FIPKR0Rjkm7PxkJtXxJT8qNOE162JjUBUN+jzL74+X/YK3SGdsWnSvh/0gHFB+3XoWsgNfmPobYJRug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752213212; c=relaxed/simple;
	bh=V/eNDY/qA4NHSZOwPua9X0RRlI0fpDZaOiJgemAaWc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVcGrtCba/DjHv9ZkVM3h/MztH0R6a5TKZOPkmiRXGMCXQHhVaXHYvDSJjbCame3edKynalJmrZQ/pJNR2yfdVZ2Or2BJ7LFaUFzkjXg3/TUs3K2ZHoMq9RgLGFhcAK6Xoumgv+8FEJsHYb+p6rJd2r9B9EnkxM4mpj5uunGWrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=qCPpecw2; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=gJj1g9IyHgZBa6CQJ6zOjunPT/VUHlVIwzOdgcnCtjI=;
	b=qCPpecw27VsCqZDIYkU/al+gtN8eBNSbNWtwL+av5M6vWL8gITy6u51EzZaVFG
	eLG9vz1EVLkWFCkVf65iKz8VNdq9bMX0DroV1pgfnkAUC28zDe44alx0KruPaeV5
	TFQFpAYYs5PuhaUckhLHz9jvvvE4aBZD21sCD5eoLtEz8=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgB3b7qSpnBotOpQAA--.38057S3;
	Fri, 11 Jul 2025 13:52:20 +0800 (CST)
Date: Fri, 11 Jul 2025 13:52:18 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v5 11/13] arm64: dts: imx8: add capture controller for
 i.MX8's img subsystem
Message-ID: <aHCmkqIjrdg2_NRo@dragon>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
 <20250522-8qxp_camera-v5-11-d4be869fdb7e@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522-8qxp_camera-v5-11-d4be869fdb7e@nxp.com>
X-CM-TRANSID:Mc8vCgB3b7qSpnBotOpQAA--.38057S3
X-Coremail-Antispam: 1Uf129KBjvAXoWfGF18ArW7Gw4DGr1DXr48Xrb_yoW8CryxXo
	Wayrs3CrW5Ga47Cay7XwsrKF42kFs0qw4xJayDZr4fG3WYvrWYyw47CF4jg3y3Jry8Jas5
	A34I9a4UGwnFvan3n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUo_-PUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEheHZWhwe3Sj+gAAsp

On Thu, May 22, 2025 at 01:56:49PM -0400, Frank Li wrote:
> Add CSI related nodes (i2c, irqsteer, csi, lpcg) for i.MX8 img subsystem.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v4 to v5
> - remove empty endpoint
> 
> Change from v3 to v4
> - remove unused clock clock-img-axi
> - add ports information for isi and csi
> - Fix 8qxp clock, irq and power domain
> - Fix reg size
> 
> Change from v2 to v3
> - remove phy and put csr register space under mipi csi2
> 
> change from v1 to v2
> - move scu reset under scu node
> - add 8qm comaptible string for mipi csi2 and mipi csi phys.
> ---
>  arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi    | 362 ++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi  |  79 +++++
>  arch/arm64/boot/dts/freescale/imx8qm.dtsi         |   5 +
>  arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi |  83 +++++
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi        |   5 +
>  5 files changed, 534 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> index d39242c1b9f79..2cf0f7208350a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> @@ -10,12 +10,264 @@ img_ipg_clk: clock-img-ipg {
>  	clock-output-names = "img_ipg_clk";
>  };
>  
> +img_pxl_clk: clock-img-pxl {
> +	compatible = "fixed-clock";
> +	#clock-cells = <0>;
> +	clock-frequency = <600000000>;
> +	clock-output-names = "img_pxl_clk";
> +};
> +
>  img_subsys: bus@58000000 {
>  	compatible = "simple-bus";
>  	#address-cells = <1>;
>  	#size-cells = <1>;
>  	ranges = <0x58000000 0x0 0x58000000 0x1000000>;
>  
> +	isi: isi@58100000 {
> +		reg = <0x58100000 0x80000>;
> +		interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
> +			 <&pdma1_lpcg IMX_LPCG_CLK_0>,
> +			 <&pdma2_lpcg IMX_LPCG_CLK_0>,
> +			 <&pdma3_lpcg IMX_LPCG_CLK_0>,
> +			 <&pdma4_lpcg IMX_LPCG_CLK_0>,
> +			 <&pdma5_lpcg IMX_LPCG_CLK_0>,
> +			 <&pdma6_lpcg IMX_LPCG_CLK_0>,
> +			 <&pdma7_lpcg IMX_LPCG_CLK_0>;
> +		clock-names = "per0", "per1", "per2", "per3",
> +			      "per4", "per5", "per6", "per7";
> +		interrupt-parent = <&gic>;
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>,
> +				<&pd IMX_SC_R_ISI_CH1>,
> +				<&pd IMX_SC_R_ISI_CH2>,
> +				<&pd IMX_SC_R_ISI_CH3>,
> +				<&pd IMX_SC_R_ISI_CH4>,
> +				<&pd IMX_SC_R_ISI_CH5>,
> +				<&pd IMX_SC_R_ISI_CH6>,
> +				<&pd IMX_SC_R_ISI_CH7>;
> +		status = "disabled";
> +	};
> +
> +	irqsteer_csi0: irqsteer@58220000 {
> +		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
> +		reg = <0x58220000 0x1000>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&img_ipg_clk>;
> +		clock-names = "ipg";
> +		interrupt-parent = <&gic>;
> +		power-domains = <&pd IMX_SC_R_CSI_0>;
> +		fsl,channel = <0>;
> +		fsl,num-irqs = <32>;
> +		status = "disabled";
> +	};
> +
> +	gpio0_mipi_csi0: gpio@58222000 {
> +		compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
> +		reg = <0x58222000 0x1000>;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		interrupts = <0>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		interrupt-parent = <&irqsteer_csi0>;
> +		power-domains = <&pd IMX_SC_R_CSI_0>;
> +	};
> +
> +	csi0_core_lpcg: clock-controller@58223018 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58223018 0x4>;
> +		clocks = <&clk IMX_SC_R_CSI_0 IMX_SC_PM_CLK_PER>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_4>;
> +		clock-output-names = "csi0_lpcg_core_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +	};
> +
> +	csi0_esc_lpcg: clock-controller@5822301c {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x5822301c 0x4>;
> +		clocks = <&clk IMX_SC_R_CSI_0 IMX_SC_PM_CLK_MISC>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_4>;
> +		clock-output-names = "csi0_lpcg_esc_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +	};
> +
> +	i2c_mipi_csi0: i2c@58226000 {
> +		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
> +		reg = <0x58226000 0x1000>;
> +		interrupts = <8>;
> +		clocks = <&clk IMX_SC_R_CSI_0_I2C_0 IMX_SC_PM_CLK_PER>,
> +			 <&img_ipg_clk>;
> +		clock-names = "per", "ipg";
> +		assigned-clocks = <&clk IMX_SC_R_CSI_0_I2C_0 IMX_SC_PM_CLK_PER>;
> +		assigned-clock-rates = <24000000>;
> +		interrupt-parent = <&irqsteer_csi0>;
> +		power-domains = <&pd IMX_SC_R_CSI_0_I2C_0>;
> +		status = "disabled";
> +	};
> +
> +	mipi_csi_0: csi@58227000 {
> +		compatible = "fsl,imx8qxp-mipi-csi2";
> +		reg = <0x58227000 0x1000>,
> +		      <0x58221000 0x1000>;
> +		clocks = <&csi0_core_lpcg IMX_LPCG_CLK_4>,
> +			 <&csi0_esc_lpcg IMX_LPCG_CLK_4>,
> +			 <&csi0_pxl_lpcg IMX_LPCG_CLK_0>;
> +		clock-names = "core", "esc", "ui";
> +		assigned-clocks = <&csi0_core_lpcg IMX_LPCG_CLK_4>,
> +				  <&csi0_esc_lpcg IMX_LPCG_CLK_4>;
> +		assigned-clock-rates = <360000000>, <72000000>;
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +		resets = <&scu_reset IMX_SC_R_CSI_0>;
> +		status = "disabled";
> +	};
> +
> +	irqsteer_csi1: irqsteer@58240000 {
> +		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
> +		reg = <0x58240000 0x1000>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		interrupts = <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&img_ipg_clk>;
> +		clock-names = "ipg";
> +		interrupt-parent = <&gic>;
> +		power-domains = <&pd IMX_SC_R_CSI_1>;
> +		fsl,channel = <0>;
> +		fsl,num-irqs = <32>;
> +		status = "disabled";
> +	};
> +
> +	gpio0_mipi_csi1: gpio@58242000 {
> +		compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
> +		reg = <0x58242000 0x1000>;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		interrupts = <0>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		interrupt-parent = <&irqsteer_csi1>;
> +		power-domains = <&pd IMX_SC_R_CSI_1>;
> +	};
> +
> +	csi1_core_lpcg: clock-controller@58243018 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58243018 0x4>;
> +		clocks = <&clk IMX_SC_R_CSI_1 IMX_SC_PM_CLK_PER>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_4>;
> +		clock-output-names = "csi1_lpcg_core_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +	};
> +
> +	csi1_esc_lpcg: clock-controller@5824301c {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x5824301c 0x4>;
> +		clocks = <&clk IMX_SC_R_CSI_1 IMX_SC_PM_CLK_MISC>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_4>;
> +		clock-output-names = "csi1_lpcg_esc_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +	};
> +
> +	i2c_mipi_csi1: i2c@58246000 {
> +		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
> +		reg = <0x58246000 0x1000>;
> +		interrupts = <8>;
> +		clocks = <&clk IMX_SC_R_CSI_1_I2C_0 IMX_SC_PM_CLK_PER>,
> +			 <&img_ipg_clk>;
> +		clock-names = "per", "ipg";
> +		assigned-clocks = <&clk IMX_SC_R_CSI_1_I2C_0 IMX_SC_PM_CLK_PER>;
> +		assigned-clock-rates = <24000000>;
> +		interrupt-parent = <&irqsteer_csi1>;
> +		power-domains = <&pd IMX_SC_R_CSI_1_I2C_0>;
> +		status = "disabled";
> +	};
> +
> +	mipi_csi_1: csi@58247000 {
> +		compatible = "fsl,imx8qxp-mipi-csi2";
> +		reg = <0x58247000 0x1000>,
> +		      <0x58241000 0x1000>;
> +		clocks = <&csi1_core_lpcg IMX_LPCG_CLK_4>,
> +			 <&csi1_esc_lpcg IMX_LPCG_CLK_4>,
> +			 <&csi1_pxl_lpcg IMX_LPCG_CLK_0>;
> +		clock-names = "core", "esc", "ui";
> +		assigned-clocks = <&csi1_core_lpcg IMX_LPCG_CLK_4>,
> +				  <&csi1_esc_lpcg IMX_LPCG_CLK_4>;
> +		assigned-clock-rates = <360000000>, <72000000>;
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +		resets = <&scu_reset IMX_SC_R_CSI_1>;
> +		status = "disabled";
> +	};
> +
> +	irqsteer_parallel: irqsteer@58260000 {
> +		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
> +		reg = <0x58260000 0x1000>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&clk_dummy>;
> +		clock-names = "ipg";
> +		interrupt-parent = <&gic>;
> +		power-domains = <&pd IMX_SC_R_PI_0>;
> +		fsl,channel = <0>;
> +		fsl,num-irqs = <32>;
> +		status = "disabled";
> +	};
> +
> +	pi0_ipg_lpcg: clock-controller@58263004 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58263004 0x4>;
> +		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_4>;
> +		clock-output-names = "pi0_lpcg_ipg_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +	};
> +
> +	pi0_pxl_lpcg: clock-controller@58263018 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58263018 0x4>;
> +		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pi0_lpcg_pxl_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +	};
> +
> +	pi0_misc_lpcg: clock-controller@5826301c {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x5826301c 0x4>;
> +		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_MISC0>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pi0_lpcg_misc_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +	};
> +
> +	i2c0_parallel: i2c@58266000 {
> +		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
> +		reg = <0x58266000 0x1000>;
> +		interrupts = <8>;
> +		clocks = <&clk IMX_SC_R_PI_0_I2C_0 IMX_SC_PM_CLK_PER>,
> +			 <&img_ipg_clk>;
> +		clock-names = "per", "ipg";
> +		assigned-clocks = <&clk IMX_SC_R_PI_0_I2C_0 IMX_SC_PM_CLK_PER>;
> +		assigned-clock-rates = <24000000>;
> +		interrupt-parent = <&irqsteer_parallel>;
> +		power-domains = <&pd IMX_SC_R_PI_0_I2C_0>;
> +		status = "disabled";
> +	};
> +
>  	jpegdec: jpegdec@58400000 {
>  		reg = <0x58400000 0x00050000>;
>  		interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>;
> @@ -40,6 +292,116 @@ jpegenc: jpegenc@58450000 {
>  				<&pd IMX_SC_R_MJPEG_ENC_S0>;
>  	};
>  
> +	pdma0_lpcg: clock-controller@58500000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58500000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pdma0_lpcg_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH0>;
> +	};
> +
> +	pdma1_lpcg: clock-controller@58510000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58510000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pdma1_lpcg_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH1>;
> +	};
> +
> +	pdma2_lpcg: clock-controller@58520000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58520000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pdma2_lpcg_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH2>;
> +	};
> +
> +	pdma3_lpcg: clock-controller@58530000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58530000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pdma3_lpcg_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH3>;
> +	};
> +
> +	pdma4_lpcg: clock-controller@58540000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58540000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pdma4_lpcg_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH4>;
> +	};
> +
> +	pdma5_lpcg: clock-controller@58550000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58550000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pdma5_lpcg_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH5>;
> +	};
> +
> +	pdma6_lpcg: clock-controller@58560000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58560000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pdma6_lpcg_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH6>;
> +	};
> +
> +	pdma7_lpcg: clock-controller@58570000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58570000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "pdma7_lpcg_clk";
> +		power-domains = <&pd IMX_SC_R_ISI_CH7>;
> +	};
> +
> +	csi0_pxl_lpcg: clock-controller@58580000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58580000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "csi0_lpcg_pxl_clk";
> +		power-domains = <&pd IMX_SC_R_CSI_0>;
> +	};
> +
> +	csi1_pxl_lpcg: clock-controller@58590000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x58590000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "csi1_lpcg_pxl_clk";
> +		power-domains = <&pd IMX_SC_R_CSI_1>;
> +	};
> +
> +	hdmi_rx_pxl_link_lpcg: clock-controller@585a0000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x585a0000 0x10000>;
> +		clocks = <&img_pxl_clk>;
> +		#clock-cells = <1>;
> +		clock-indices = <IMX_LPCG_CLK_0>;
> +		clock-output-names = "hdmi_rx_lpcg_pxl_link_clk";
> +		power-domains = <&pd IMX_SC_R_HDMI_RX>;
> +	};
> +
>  	img_jpeg_dec_lpcg: clock-controller@585d0000 {
>  		compatible = "fsl,imx8qxp-lpcg";
>  		reg = <0x585d0000 0x10000>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
> index 2bbdacb1313f9..4b7e685daa024 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
> @@ -3,6 +3,31 @@
>   * Copyright 2021 NXP
>   */
>  
> +&isi {
> +	compatible = "fsl,imx8qm-isi";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@2 {
> +			reg = <2>;
> +
> +			isi_in_2: endpoint {
> +				remote-endpoint = <&mipi_csi0_out>;
> +			};
> +		};
> +
> +		port@3 {
> +			reg = <3>;
> +
> +			isi_in_3: endpoint {
> +				remote-endpoint = <&mipi_csi1_out>;
> +			};
> +		};
> +	};
> +};
> +
>  &jpegdec {
>  	compatible = "nxp,imx8qm-jpgdec", "nxp,imx8qxp-jpgdec";
>  };
> @@ -10,3 +35,57 @@ &jpegdec {
>  &jpegenc {
>  	compatible = "nxp,imx8qm-jpgenc", "nxp,imx8qxp-jpgenc";
>  };
> +
> +&mipi_csi_0 {
> +	compatible = "fsl,imx8qm-mipi-csi2", "fsl,imx8qxp-mipi-csi2";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			mipi_csi0_out: endpoint {
> +				remote-endpoint = <&isi_in_2>;
> +			};
> +		};
> +	};
> +};
> +
> +&mipi_csi_1 {
> +	compatible = "fsl,imx8qm-mipi-csi2", "fsl,imx8qxp-mipi-csi2";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			mipi_csi1_out: endpoint {
> +				remote-endpoint = <&isi_in_3>;
> +			};
> +		};
> +	};
> +};
> +
> +&pi0_ipg_lpcg {
> +	status = "disabled";
> +};
> +
> +&pi0_misc_lpcg {
> +	status = "disabled";
> +};
> +
> +&pi0_pxl_lpcg {
> +	status = "disabled";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> index 6fa31bc9ece8f..c6a17a0d739c5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> @@ -333,6 +333,11 @@ iomuxc: pinctrl {
>  			compatible = "fsl,imx8qm-iomuxc";
>  		};
>  
> +		scu_reset: reset-controller {
> +			compatible = "fsl,imx-scu-reset";
> +			#reset-cells = <1>;
> +		};
> +
>  		rtc: rtc {
>  			compatible = "fsl,imx8qxp-sc-rtc";
>  		};
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> index 3a087317591d8..50015f8dd4e43 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> @@ -4,6 +4,85 @@
>   *	Dong Aisheng <aisheng.dong@nxp.com>
>   */
>  
> +&csi1_pxl_lpcg {
> +	status = "disabled";
> +};
> +
> +&csi1_core_lpcg {
> +	status = "disabled";
> +};
> +
> +&csi1_esc_lpcg {
> +	status = "disabled";
> +};
> +
> +&gpio0_mipi_csi1 {
> +	status = "disabled";
> +};
> +
> +&i2c_mipi_csi1 {
> +	status = "disabled";
> +};
> +
> +&irqsteer_csi1 {
> +	status = "disabled";
> +};
> +
> +&isi {
> +	compatible = "fsl,imx8qxp-isi";
> +	reg = <0x58100000 0x60000>;
> +	interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
> +		 <&pdma1_lpcg IMX_LPCG_CLK_0>,
> +		 <&pdma2_lpcg IMX_LPCG_CLK_0>,
> +		 <&pdma3_lpcg IMX_LPCG_CLK_0>,
> +		 <&pdma4_lpcg IMX_LPCG_CLK_0>,
> +		 <&pdma5_lpcg IMX_LPCG_CLK_0>;
> +	clock-names = "per0", "per1", "per2", "per3", "per4", "per5";
> +	power-domains = <&pd IMX_SC_R_ISI_CH0>,
> +			<&pd IMX_SC_R_ISI_CH1>,
> +			<&pd IMX_SC_R_ISI_CH2>,
> +			<&pd IMX_SC_R_ISI_CH3>,
> +			<&pd IMX_SC_R_ISI_CH4>,
> +			<&pd IMX_SC_R_ISI_CH5>;
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@2 {
> +			reg = <2>;
> +
> +			isi_in_2: endpoint {
> +				remote-endpoint = <&mipi_csi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mipi_csi_0 {
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +		};
> +
> +		port@1 {
> +			reg = <1>;

Missing newline.  Fixed it up and applied.

Shawn

> +			mipi_csi0_out: endpoint {
> +				remote-endpoint = <&isi_in_2>;
> +			};
> +		};
> +	};
> +};
> +
>  &jpegdec {
>  	compatible = "nxp,imx8qxp-jpgdec";
>  };
> @@ -11,3 +90,7 @@ &jpegdec {
>  &jpegenc {
>  	compatible = "nxp,imx8qxp-jpgenc";
>  };
> +
> +&mipi_csi_1 {
> +	status = "disabled";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index 05138326f0a57..c078d92f76c0e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -241,6 +241,11 @@ scu_key: keys {
>  			status = "disabled";
>  		};
>  
> +		scu_reset: reset-controller {
> +			compatible = "fsl,imx-scu-reset";
> +			#reset-cells = <1>;
> +		};
> +
>  		rtc: rtc {
>  			compatible = "fsl,imx8qxp-sc-rtc";
>  		};
> 
> -- 
> 2.34.1
> 


