Return-Path: <linux-media+bounces-36370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B79AEEAC9
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 01:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A939A1BC2D1C
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 23:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267112E6D2C;
	Mon, 30 Jun 2025 23:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JeCrGwaY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37D0292B36;
	Mon, 30 Jun 2025 23:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751324840; cv=none; b=ix2ykw33oNYt0Y8Ke823CFxq2HORG/WoMwGpKQpNvx8IzVx4J5KII5TdfY6xlLTmjaXmq0/8UTY8kGt783+WOLjtt1zWP8uH06TNtRagPYHA2NIjJkRH9AVcx10l0PsWEkSi64bhRsEq7tRxqxea+ngVjNNNEV6o5hkHjVsRtEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751324840; c=relaxed/simple;
	bh=F2c86YPB2yWAluPyg1zOw8RQH2nzZ+7OT6X/Myd+15c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WB4YkVS0XKTOnNbkqTyW31uNHEN8cHKZaRn66F0onYjp9NZfbNZzM5PBf1UNZKroa5qOktVWADm2/Q2q7Ojz/aZn1h5Bmmh9y/QyIuUrYEBwQ2yfVPlHwoXvCDl9EaBPJmFSX6PsqKhtbPBZy53aIkrjMrAbTU5poMybBylCbIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JeCrGwaY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BAC54838;
	Tue,  1 Jul 2025 01:06:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751324815;
	bh=F2c86YPB2yWAluPyg1zOw8RQH2nzZ+7OT6X/Myd+15c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JeCrGwaYFsgs0iI5OCZ3bsli3VjmGyndnl7tiGVlTdY5UFlCl3E1nJn1OThNKowdz
	 eNBW4azDl5RQKTLJieyRSCdNckf2KXPnKoLPoKevlcHiWkmUYvH2UWNKKwOhIvElAx
	 MqQ5xsQkTXr3MxxPBfNXwgbC8kAfEz1ZffCHg1ao=
Date: Tue, 1 Jul 2025 02:06:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: imx8qxp-mek: add parallel ov5640 camera
 support
Message-ID: <20250630230651.GG15184@pendragon.ideasonboard.com>
References: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
 <20250630-imx8qxp_pcam-v1-5-eccd38d99201@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630-imx8qxp_pcam-v1-5-eccd38d99201@nxp.com>

Hi Frank,

Thank you for the patch.

On Mon, Jun 30, 2025 at 06:28:21PM -0400, Frank Li wrote:
> Add parallel ov5640 nodes in imx8qxp-mek and create overlay file to enable
> it because it can work at two mode: MIPI and parallel mode.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |  3 ++
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 37 +++++++++++++++++++
>  .../dts/freescale/imx8x-mek-ov5640-parallel.dtso   | 43 ++++++++++++++++++++++
>  3 files changed, 83 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 02ef35578dbc7..a9fb11ccd3dea 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -330,6 +330,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
>  imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
>  dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
>  
> +imx8qxp-mek-ov5640-parallel-dtbs := imx8qxp-mek.dtb imx8x-mek-ov5640-parallel.dtbo
> +dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-parallel.dtb
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> index c95cb8acc360a..09eb85a9759e2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> @@ -487,6 +487,23 @@ pca6416: gpio@20 {
>  		#gpio-cells = <2>;
>  	};
>  
> +	ov5640_pi: camera@3c {
> +		compatible = "ovti,ov5640";
> +		reg = <0x3c>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_parallel_csi>;
> +		clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
> +		assigned-clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
> +		assigned-clock-rates = <24000000>;
> +		clock-names = "xclk";
> +		powerdown-gpios = <&lsio_gpio3 2 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&lsio_gpio3 3 GPIO_ACTIVE_LOW>;
> +		AVDD-supply = <&reg_2v8>;
> +		DVDD-supply = <&reg_1v5>;
> +		DOVDD-supply = <&reg_1v8>;
> +		status = "disabled"; /* Overlay enable it */
> +	};
> +

As far as I can tell, the sensor isn't soldered on the board, but is an
external module connected through a cable. This DT node should therefore
be moved to the overlay.

>  	cs42888: audio-codec@48 {
>  		compatible = "cirrus,cs42888";
>  		reg = <0x48>;
> @@ -865,6 +882,26 @@ IMX8QXP_MIPI_CSI0_MCLK_OUT_MIPI_CSI0_ACM_MCLK_OUT	0xC0000041
>  		>;
>  	};
>  
> +	pinctrl_parallel_csi: parallelcsigrp {
> +		fsl,pins = <
> +			IMX8QXP_CSI_D00_CI_PI_D02				0xc0000041
> +			IMX8QXP_CSI_D01_CI_PI_D03				0xc0000041
> +			IMX8QXP_CSI_D02_CI_PI_D04				0xc0000041
> +			IMX8QXP_CSI_D03_CI_PI_D05				0xc0000041
> +			IMX8QXP_CSI_D04_CI_PI_D06				0xc0000041
> +			IMX8QXP_CSI_D05_CI_PI_D07				0xc0000041
> +			IMX8QXP_CSI_D06_CI_PI_D08				0xc0000041
> +			IMX8QXP_CSI_D07_CI_PI_D09				0xc0000041
> +
> +			IMX8QXP_CSI_MCLK_CI_PI_MCLK				0xc0000041
> +			IMX8QXP_CSI_PCLK_CI_PI_PCLK				0xc0000041
> +			IMX8QXP_CSI_HSYNC_CI_PI_HSYNC				0xc0000041
> +			IMX8QXP_CSI_VSYNC_CI_PI_VSYNC				0xc0000041
> +			IMX8QXP_CSI_EN_LSIO_GPIO3_IO02				0xc0000041
> +			IMX8QXP_CSI_RESET_LSIO_GPIO3_IO03			0xc0000041
> +		>;
> +	};

Same for this one.

> +
>  	pinctrl_pcieb: pcieagrp {
>  		fsl,pins = <
>  			IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00		0x06000021
> diff --git a/arch/arm64/boot/dts/freescale/imx8x-mek-ov5640-parallel.dtso b/arch/arm64/boot/dts/freescale/imx8x-mek-ov5640-parallel.dtso
> new file mode 100644
> index 0000000000000..927d6640662f3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8x-mek-ov5640-parallel.dtso
> @@ -0,0 +1,43 @@
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
> +&ov5640_pi {
> +	status = "okay";
> +
> +	port {
> +		ov5640_pi_ep: endpoint {
> +			remote-endpoint = <&parallel_csi_in>;
> +			data-lanes = <1 2>;

data-lanes is not allowed for parallel buses.

> +			bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
> +			bus-width = <8>;
> +			vsync-active = <0>;
> +			hsync-active = <1>;
> +			pclk-sample = <1>;
> +		};
> +	};
> +};
> +
> +&parallel_csi {
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			parallel_csi_in: endpoint {
> +				remote-endpoint = <&ov5640_pi_ep>;
> +			};
> +		};
> +
> +	};
> +};
> +
> +&isi {
> +	status = "okay";
> +};

-- 
Regards,

Laurent Pinchart

