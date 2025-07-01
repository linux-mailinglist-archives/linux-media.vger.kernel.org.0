Return-Path: <linux-media+bounces-36475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAF4AF0521
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 22:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAD29444AD3
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 20:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58C0302046;
	Tue,  1 Jul 2025 20:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pjLntyfO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F54C2ED171;
	Tue,  1 Jul 2025 20:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403170; cv=none; b=StS7VP0paDlA7OsYRGIkIc3zstk4LcQquVb1/Bq8C19l8xM/jY6ebKeKexHdBeCa8GNH14XBASO/V055c10+2/qb5KN+KORSpIkw994ccET4sVZECyadm9DFCp0WDh4mGsUuZpFGZdh6v1qxwnp3QpWiZVgaVjDD8F766CTchnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403170; c=relaxed/simple;
	bh=geP5H2Z4+YHkevGRctptTgYh4x8d/AoO+xeKisC/63s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hX0kU04QKa357HVnY6sbUH9vclmj/XFUnChMXM+cFpcBn8W33nr11SxsD7R8vVAtjkiXrugX4pvYWlvJ2F/gbPdk9cgLCn67chlA4JWbAr04y0pEh1VlSNWZ8mucC/ePUyeziqyB8slP1hN7Wn0PHuSC2adH4cTVkHwlolSj5gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pjLntyfO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C355B78C;
	Tue,  1 Jul 2025 22:52:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751403144;
	bh=geP5H2Z4+YHkevGRctptTgYh4x8d/AoO+xeKisC/63s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pjLntyfOaN+smpQYy1xcEjS5lmF3hEALIiz9WvHu/F1CHs8SCbpi+9prdG4X9HIty
	 Sn1EM7SSfpp5M4ajzhnvPkrSP0Sn6igqrBtZtr7WrlWJM9+4+o25FCUijyKPRlOZTA
	 iF/XFX037TDmKq3NI44CifqHilzmXkTiSWLFM2fg=
Date: Tue, 1 Jul 2025 23:52:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
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
Message-ID: <20250701205220.GE16835@pendragon.ideasonboard.com>
References: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
 <20250630-imx8qxp_pcam-v1-5-eccd38d99201@nxp.com>
 <20250630230651.GG15184@pendragon.ideasonboard.com>
 <aGP56BUXrNnBCQu/@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aGP56BUXrNnBCQu/@lizhi-Precision-Tower-5810>

Hi Frank,

On Tue, Jul 01, 2025 at 11:08:24AM -0400, Frank Li wrote:
> On Tue, Jul 01, 2025 at 02:06:51AM +0300, Laurent Pinchart wrote:
> > On Mon, Jun 30, 2025 at 06:28:21PM -0400, Frank Li wrote:
> > > Add parallel ov5640 nodes in imx8qxp-mek and create overlay file to enable
> > > it because it can work at two mode: MIPI and parallel mode.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/Makefile             |  3 ++
> > >  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 37 +++++++++++++++++++
> > >  .../dts/freescale/imx8x-mek-ov5640-parallel.dtso   | 43 ++++++++++++++++++++++
> > >  3 files changed, 83 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > > index 02ef35578dbc7..a9fb11ccd3dea 100644
> > > --- a/arch/arm64/boot/dts/freescale/Makefile
> > > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > > @@ -330,6 +330,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
> > >  imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
> > >  dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
> > >
> > > +imx8qxp-mek-ov5640-parallel-dtbs := imx8qxp-mek.dtb imx8x-mek-ov5640-parallel.dtbo
> > > +dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-parallel.dtb
> > > +
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> > > index c95cb8acc360a..09eb85a9759e2 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> > > @@ -487,6 +487,23 @@ pca6416: gpio@20 {
> > >  		#gpio-cells = <2>;
> > >  	};
> > >
> > > +	ov5640_pi: camera@3c {
> > > +		compatible = "ovti,ov5640";
> > > +		reg = <0x3c>;
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&pinctrl_parallel_csi>;
> > > +		clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
> > > +		assigned-clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
> > > +		assigned-clock-rates = <24000000>;
> > > +		clock-names = "xclk";
> > > +		powerdown-gpios = <&lsio_gpio3 2 GPIO_ACTIVE_HIGH>;
> > > +		reset-gpios = <&lsio_gpio3 3 GPIO_ACTIVE_LOW>;
> > > +		AVDD-supply = <&reg_2v8>;
> > > +		DVDD-supply = <&reg_1v5>;
> > > +		DOVDD-supply = <&reg_1v8>;
> > > +		status = "disabled"; /* Overlay enable it */
> > > +	};
> > > +
> >
> > As far as I can tell, the sensor isn't soldered on the board, but is an
> > external module connected through a cable. This DT node should therefore
> > be moved to the overlay.
> 
> It is fine for i.MX8QXP. I put here try to reuse overlay file as much as
> possible.
> 
> For example, imx93 have, 9x9, 11x11, 14x14 boards ...
> 
> Each board's reset-gpios have slice difference. If move whole to overlay
> files, we have to create difference overlay for each boards.
> 
> If keep here and set "status = okay" and update graphic links in overlay,
> we can reuse this overlay file for different boards.
> 
> for example: imx93-pcam.dtso, which simialr with imx8x-mek-ov5640-parallel.dtso.
> 
> So we simple use
> imx93-9x9-qsb.dtb + imx93-pcam.dtbo.
> imx93-11x11-evk.dtb + imx93-pcam.dtbo.
> imx93-14x14-evk.dtb + imx93-pcam.dtbo.
> 
> even for imx91 boards in future.

First of all, I want to say I feel your pain. I maintain many camera
sensor modules DT overlays out-of-tree, for different boards, and code
duplication is definitely annoying. Unfortunately, DT doesn't provide a
solution to this problem today. There was an attempt years ago to design
a "DT connector" that defined how connector signals were routed on a
board. This would allow a single overlay compatible with the connected
to be used with different base boards. Unfortunately, development
stalled.

Until this problem gets solved, I'm afraid you'll have to duplicate
overlays for different base boards. The OV5640 is not part of the
imx8qxp-mek, so it should not be declared in the imx8qxp-mek.dts.

> > >  	cs42888: audio-codec@48 {
> > >  		compatible = "cirrus,cs42888";
> > >  		reg = <0x48>;
> > > @@ -865,6 +882,26 @@ IMX8QXP_MIPI_CSI0_MCLK_OUT_MIPI_CSI0_ACM_MCLK_OUT	0xC0000041
> > >  		>;
> > >  	};
> > >
> > > +	pinctrl_parallel_csi: parallelcsigrp {
> > > +		fsl,pins = <
> > > +			IMX8QXP_CSI_D00_CI_PI_D02				0xc0000041
> > > +			IMX8QXP_CSI_D01_CI_PI_D03				0xc0000041
> > > +			IMX8QXP_CSI_D02_CI_PI_D04				0xc0000041
> > > +			IMX8QXP_CSI_D03_CI_PI_D05				0xc0000041
> > > +			IMX8QXP_CSI_D04_CI_PI_D06				0xc0000041
> > > +			IMX8QXP_CSI_D05_CI_PI_D07				0xc0000041
> > > +			IMX8QXP_CSI_D06_CI_PI_D08				0xc0000041
> > > +			IMX8QXP_CSI_D07_CI_PI_D09				0xc0000041
> > > +
> > > +			IMX8QXP_CSI_MCLK_CI_PI_MCLK				0xc0000041
> > > +			IMX8QXP_CSI_PCLK_CI_PI_PCLK				0xc0000041
> > > +			IMX8QXP_CSI_HSYNC_CI_PI_HSYNC				0xc0000041
> > > +			IMX8QXP_CSI_VSYNC_CI_PI_VSYNC				0xc0000041
> > > +			IMX8QXP_CSI_EN_LSIO_GPIO3_IO02				0xc0000041
> > > +			IMX8QXP_CSI_RESET_LSIO_GPIO3_IO03			0xc0000041
> > > +		>;
> > > +	};
> >
> > Same for this one.
> >
> > > +
> > >  	pinctrl_pcieb: pcieagrp {
> > >  		fsl,pins = <
> > >  			IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00		0x06000021
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8x-mek-ov5640-parallel.dtso b/arch/arm64/boot/dts/freescale/imx8x-mek-ov5640-parallel.dtso
> > > new file mode 100644
> > > index 0000000000000..927d6640662f3
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx8x-mek-ov5640-parallel.dtso
> > > @@ -0,0 +1,43 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +/*
> > > + * Copyright 2025 NXP
> > > + */
> > > +
> > > +/dts-v1/;
> > > +/plugin/;
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/media/video-interfaces.h>
> > > +
> > > +&ov5640_pi {
> > > +	status = "okay";
> > > +
> > > +	port {
> > > +		ov5640_pi_ep: endpoint {
> > > +			remote-endpoint = <&parallel_csi_in>;
> > > +			data-lanes = <1 2>;
> >
> > data-lanes is not allowed for parallel buses.
> 
> Do you know there are method in dt_binding to restrict this?
> 
> Frank

We can use if-then-else blocks to restrict the allowed properties based
on the bus-type.

> > > +			bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
> > > +			bus-width = <8>;
> > > +			vsync-active = <0>;
> > > +			hsync-active = <1>;
> > > +			pclk-sample = <1>;
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&parallel_csi {
> > > +	status = "okay";
> > > +
> > > +	ports {
> > > +		port@0 {
> > > +			parallel_csi_in: endpoint {
> > > +				remote-endpoint = <&ov5640_pi_ep>;
> > > +			};
> > > +		};
> > > +
> > > +	};
> > > +};
> > > +
> > > +&isi {
> > > +	status = "okay";
> > > +};

-- 
Regards,

Laurent Pinchart

