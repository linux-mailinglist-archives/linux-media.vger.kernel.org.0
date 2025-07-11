Return-Path: <linux-media+bounces-37455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A02B01470
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 09:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C643583660
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 07:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72821EC018;
	Fri, 11 Jul 2025 07:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="mjv51jlx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B47C1E51FA;
	Fri, 11 Jul 2025 07:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752218631; cv=none; b=Pkgnr/dnx98T9I8ttK5UUZnwFLbfnIriJbBp8J2EuXXs+cRzxt0ICwEmmurIVHCibrRqfyO4j8QQW4eELXqO7t1bTtCEj2cgwSqxJROLhnViWxtkyOSWN4bwzd2YCXo0R+pNF8VwsPlg/kfxrog9KvErpcPhJdV7OlEWlNXlIbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752218631; c=relaxed/simple;
	bh=5ol1LPqtCBOszz/GfJBu215f9rGzqkkEGN5CKaUWMb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSlcp4rrpu455rDRc9eAiIoON001EPQ3mIhC82IGx1ucxB2Ay9F9QGZYfnsGHTkBMNOGJd0lS1t5qPE27LcZwbvPLlsrHFWhJZFryPSJRJcCkaeoNCWULV9lHMFRnHKEuc/SLG97xdeWWsgdWFk10j8+1k4P+leqepP+wsfhK+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=mjv51jlx; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ux8RF6jBz+oiGIeBSrKBouidakEu6Zj4Kdu3nVnxFyE=;
	b=mjv51jlxby9H7xE3DPiMuHrwE08bvpkJnb5IaLWClCZkVzBZG0m9Xi8LQr8GRD
	9GQFu+nlUC/YQpqGKx8Ap6R1WAOzdHwRPJy4ra5HBuFtkD5BID77gHr3DWXb+7dS
	BtkGdo1lASn6dkSJQ66Olhuy92dzc/RC3A/dIKjsTnS3E=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBnfwPCu3BouIxSAA--.52587S3;
	Fri, 11 Jul 2025 15:22:44 +0800 (CST)
Date: Fri, 11 Jul 2025 15:22:42 +0800
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
Subject: Re: [PATCH v5 13/13] arm64: dts: imx8q: add camera ov5640 support
 for imx8qm-mek and imx8qxp-mek
Message-ID: <aHC7wm98PlShUqWk@dragon>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
 <20250522-8qxp_camera-v5-13-d4be869fdb7e@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522-8qxp_camera-v5-13-d4be869fdb7e@nxp.com>
X-CM-TRANSID:Ms8vCgBnfwPCu3BouIxSAA--.52587S3
X-Coremail-Antispam: 1Uf129KBjvAXoW3tF1fur48GrW7tFy3CrW3KFg_yoW8Jr4UAo
	W2kFs2vrW8Wry7CFnxZrZFkw43XFn5WFsxtFWUtF13GF40kFWayw1qvw4qqFZ8G34kAFyk
	Z347ta45Aay2vas5n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUrZ2-UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhOHZWhwe3TveQAAsi

On Thu, May 22, 2025 at 01:56:51PM -0400, Frank Li wrote:
> Add ov5640 overlay file for imx8qm-mek and imx8qxp-mek board. Camera can
> connect different CSI port. So use dts overlay file to handle these
> difference connect options.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v4 to v5
> - use fullpath for csi endpoint
> 
> change from v3 to v4
> - add board level xtal24m
> - remove reduntant ports information at dtso because chip leave already add
> it.
> 
> change from v2 to v3
> - remove phy nodes
> 
> change from v1 to v2
> - none
> ---
>  arch/arm64/boot/dts/freescale/Makefile             | 11 ++++
>  .../boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso | 64 ++++++++++++++++++++++
>  .../boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso | 64 ++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 58 ++++++++++++++++++++
>  .../boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso | 63 +++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 36 ++++++++++++
>  6 files changed, 296 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 0b473a23d1200..d376b4233fe8a 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -301,6 +301,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
> +
> +imx8qm-mek-ov5640-csi0-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi0.dtbo
> +dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-csi0.dtb
> +imx8qm-mek-ov5640-csi1-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi1.dtbo
> +dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-csi1.dtb
> +imx8qm-mek-ov5640-dual-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi0.dtbo imx8qm-mek-ov5640-csi1.dtbo
> +dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-dual.dtb
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-ai_ml.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-aster.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3.dtb
> @@ -311,6 +319,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
>  imx8qxp-mek-pcie-ep-dtbs += imx8qxp-mek.dtb imx-pcie0-ep.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
>  
> +imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
> +dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso
> new file mode 100644
> index 0000000000000..7510556323b1c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +
> +&i2c_mipi_csi0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	clock-frequency = <100000>;
> +	pinctrl-0 = <&pinctrl_i2c_mipi_csi0>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	ov5640_mipi_0: camera@3c {
> +		compatible = "ovti,ov5640";
> +		reg = <0x3c>;
> +		clocks = <&xtal24m>;
> +		clock-names = "xclk";
> +		pinctrl-0 = <&pinctrl_mipi_csi0>;
> +		pinctrl-names = "default";
> +		powerdown-gpios = <&lsio_gpio1 28 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&lsio_gpio1 27 GPIO_ACTIVE_LOW>;
> +		AVDD-supply = <&reg_2v8>;
> +		DVDD-supply = <&reg_1v5>;
> +		DOVDD-supply = <&reg_1v8>;
> +		status = "okay";

Unnecessary "okay" status?

Shawn

> +
> +		port {
> +			ov5640_mipi_0_ep: endpoint {
> +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				data-lanes = <1 2>;
> +				remote-endpoint = <&mipi_csi0_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&irqsteer_csi0 {
> +	status = "okay";
> +};
> +
> +&isi {
> +	status = "okay";
> +};
> +
> +&mipi_csi_0 {
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			mipi_csi0_in: endpoint {
> +				data-lanes = <1 2>;
> +				remote-endpoint = <&ov5640_mipi_0_ep>;
> +			};
> +		};
> +	};
> +};
> +
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso
> new file mode 100644
> index 0000000000000..080e31cdd7d3e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +
> +&i2c_mipi_csi1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	clock-frequency = <100000>;
> +	pinctrl-0 = <&pinctrl_i2c_mipi_csi1>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	ov5640_mipi_1: camera@3c {
> +		compatible = "ovti,ov5640";
> +		reg = <0x3c>;
> +		clocks = <&xtal24m>;
> +		clock-names = "xclk";
> +		pinctrl-0 = <&pinctrl_mipi_csi1>;
> +		pinctrl-names = "default";
> +		powerdown-gpios = <&lsio_gpio1 31 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&lsio_gpio1 30 GPIO_ACTIVE_LOW>;
> +		AVDD-supply = <&reg_2v8>;
> +		DVDD-supply = <&reg_1v5>;
> +		DOVDD-supply = <&reg_1v8>;
> +		status = "okay";
> +
> +		port {
> +			ov5640_mipi_1_ep: endpoint {
> +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				data-lanes = <1 2>;
> +				remote-endpoint = <&mipi_csi1_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&irqsteer_csi1 {
> +	status = "okay";
> +};
> +
> +&isi {
> +	status = "okay";
> +};
> +
> +&mipi_csi_1 {
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			mipi_csi1_in: endpoint {
> +				data-lanes = <1 2>;
> +				remote-endpoint = <&ov5640_mipi_1_ep>;
> +			};
> +		};
> +	};
> +};
> +
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> index 68442c8575f3f..503e0acd7963d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> @@ -32,6 +32,13 @@ memory@80000000 {
>  		reg = <0x00000000 0x80000000 0 0x40000000>;
>  	};
>  
> +	xtal24m: clock-xtal24m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xtal_24MHz";
> +	};
> +
>  	reserved-memory {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -155,6 +162,27 @@ usb3_data_ss: endpoint {
>  		};
>  	};
>  
> +	reg_1v5: regulator-1v5 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1v5";
> +		regulator-min-microvolt = <1500000>;
> +		regulator-max-microvolt = <1500000>;
> +	};
> +
> +	reg_1v8: regulator-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	reg_2v8: regulator-2v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "2v8";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +	};
> +
>  	reg_usdhc2_vmmc: usdhc2-vmmc {
>  		compatible = "regulator-fixed";
>  		regulator-name = "SD1_SPWR";
> @@ -824,6 +852,20 @@ IMX8QM_QSPI1A_DATA1_LSIO_GPIO4_IO25			0x0600004c
>  		>;
>  	};
>  
> +	pinctrl_i2c_mipi_csi0: i2c-mipi-csi0grp {
> +		fsl,pins = <
> +			IMX8QM_MIPI_CSI0_I2C0_SCL_MIPI_CSI0_I2C0_SCL		0xc2000020
> +			IMX8QM_MIPI_CSI0_I2C0_SDA_MIPI_CSI0_I2C0_SDA		0xc2000020
> +		>;
> +	};
> +
> +	pinctrl_i2c_mipi_csi1: i2c-mipi-csi1grp {
> +		fsl,pins = <
> +			IMX8QM_MIPI_CSI1_I2C0_SCL_MIPI_CSI1_I2C0_SCL		0xc2000020
> +			IMX8QM_MIPI_CSI1_I2C0_SDA_MIPI_CSI1_I2C0_SDA		0xc2000020
> +		>;
> +	};
> +
>  	pinctrl_i2c0: i2c0grp {
>  		fsl,pins = <
>  			IMX8QM_HDMI_TX0_TS_SCL_DMA_I2C0_SCL			0x06000021
> @@ -1017,6 +1059,22 @@ IMX8QM_LVDS1_I2C1_SDA_LVDS1_I2C1_SDA	0xc600004c
>  		>;
>  	};
>  
> +	pinctrl_mipi_csi0: mipi-csi0grp {
> +		fsl,pins = <
> +			IMX8QM_MIPI_CSI0_GPIO0_00_LSIO_GPIO1_IO27		0xC0000041
> +			IMX8QM_MIPI_CSI0_GPIO0_01_LSIO_GPIO1_IO28		0xC0000041
> +			IMX8QM_MIPI_CSI0_MCLK_OUT_MIPI_CSI0_ACM_MCLK_OUT	0xC0000041
> +		>;
> +	};
> +
> +	pinctrl_mipi_csi1: mipi-csi1grp {
> +		fsl,pins = <
> +			IMX8QM_MIPI_CSI1_GPIO0_00_LSIO_GPIO1_IO30		0xC0000041
> +			IMX8QM_MIPI_CSI1_GPIO0_01_LSIO_GPIO1_IO31		0xC0000041
> +			IMX8QM_MIPI_CSI1_MCLK_OUT_MIPI_CSI1_ACM_MCLK_OUT	0xC0000041
> +		>;
> +	};
> +
>  	pinctrl_pciea: pcieagrp {
>  		fsl,pins = <
>  			IMX8QM_PCIE_CTRL0_WAKE_B_LSIO_GPIO4_IO28		0x04000021
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso
> new file mode 100644
> index 0000000000000..153fca99af299
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2024 NXP
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +
> +&i2c_mipi_csi0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	clock-frequency = <100000>;
> +	pinctrl-0 = <&pinctrl_i2c_mipi_csi0>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	ov5640_mipi: camera@3c {
> +		compatible = "ovti,ov5640";
> +		reg = <0x3c>;
> +		clocks = <&xtal24m>;
> +		clock-names = "xclk";
> +		pinctrl-0 = <&pinctrl_mipi_csi0>;
> +		pinctrl-names = "default";
> +		powerdown-gpios = <&lsio_gpio3 7 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&lsio_gpio3 8 GPIO_ACTIVE_LOW>;
> +		AVDD-supply = <&reg_2v8>;
> +		DVDD-supply = <&reg_1v5>;
> +		DOVDD-supply = <&reg_1v8>;
> +		status = "okay";
> +
> +		port {
> +			ov5640_mipi_ep: endpoint {
> +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				data-lanes = <1 2>;
> +				remote-endpoint = <&mipi_csi0_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&irqsteer_csi0 {
> +	status = "okay";
> +};
> +
> +&isi {
> +	status = "okay";
> +};
> +
> +&mipi_csi_0 {
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			mipi_csi0_in: endpoint {
> +				data-lanes = <1 2>;
> +				remote-endpoint = <&ov5640_mipi_ep>;
> +			};
> +		};
> +	};
> +};
> +
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> index 44bda183492cb..c95cb8acc360a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> @@ -64,6 +64,27 @@ usb3_data_ss: endpoint {
>  		};
>  	};
>  
> +	reg_1v5: regulator-1v5 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1v5";
> +		regulator-min-microvolt = <1500000>;
> +		regulator-max-microvolt = <1500000>;
> +	};
> +
> +	reg_1v8: regulator-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	reg_2v8: regulator-2v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "2v8";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +	};
> +
>  	reg_pcieb: regulator-pcie {
>  		compatible = "regulator-fixed";
>  		regulator-max-microvolt = <3300000>;
> @@ -789,6 +810,13 @@ IMX8QXP_FLEXCAN1_RX_ADMA_FLEXCAN1_RX			0x21
>  		>;
>  	};
>  
> +	pinctrl_i2c_mipi_csi0: i2c-mipi-csi0grp {
> +		fsl,pins = <
> +			IMX8QXP_MIPI_CSI0_I2C0_SCL_MIPI_CSI0_I2C0_SCL		0xc2000020
> +			IMX8QXP_MIPI_CSI0_I2C0_SDA_MIPI_CSI0_I2C0_SDA		0xc2000020
> +		>;
> +	};
> +
>  	pinctrl_ioexp_rst: ioexprstgrp {
>  		fsl,pins = <
>  			IMX8QXP_SPI2_SDO_LSIO_GPIO1_IO01			0x06000021
> @@ -829,6 +857,14 @@ IMX8QXP_FLEXCAN2_RX_ADMA_UART3_RX       0x06000020
>  		>;
>  	};
>  
> +	pinctrl_mipi_csi0: mipi-csi0grp {
> +		fsl,pins = <
> +			IMX8QXP_MIPI_CSI0_GPIO0_01_LSIO_GPIO3_IO07		0xC0000041
> +			IMX8QXP_MIPI_CSI0_GPIO0_00_LSIO_GPIO3_IO08		0xC0000041
> +			IMX8QXP_MIPI_CSI0_MCLK_OUT_MIPI_CSI0_ACM_MCLK_OUT	0xC0000041
> +		>;
> +	};
> +
>  	pinctrl_pcieb: pcieagrp {
>  		fsl,pins = <
>  			IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00		0x06000021
> 
> -- 
> 2.34.1
> 


