Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E268E380721
	for <lists+linux-media@lfdr.de>; Fri, 14 May 2021 12:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233193AbhENKZ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 May 2021 06:25:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:39072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230295AbhENKZ6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 May 2021 06:25:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7E5061353;
        Fri, 14 May 2021 10:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620987887;
        bh=z/miKyvmY7M8tNXyT/t8zRBrMdfgoa7t4pQ+ZnLdxB0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E9N/LBStsXpDQmWrGLlzHoMKpcQe4SQXulr8OyJ0SFFwJvv6DKbDirmB3ve6f958c
         efxVpm/fxrIAOE1kUb5RBoduJwsW9iHb6HcYCuw0FFVgRk0vxbI7dCt+h6SIr1Y2hf
         lDgdinh35eI09Z5YdOjbm5HYFHwXeOENzkDkenEUlfQ9of+Y/BmrIgpTC3pTYVOtkg
         ZgdhC0L7rdYUibpNtDENp6/q92x6Aul7VBt/tktdlWdm0q4Ps9I00IpWHFEEmmaHGh
         P6NoRiEBbtprQ20U1KDpCnSzQTcKhICH/0NQdkQiY0cN1UUVz5/+WKIt+l5rVwLrhs
         y4zBNQzixtMsg==
Date:   Fri, 14 May 2021 13:24:41 +0300
From:   Abel Vesa <abelvesa@kernel.org>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        robh+dt@kernel.org, aisheng.dong@nxp.com, guoniu.zhou@nxp.com,
        linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
        s.hauer@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, paul.kocialkowski@bootlin.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, p.zabel@pengutronix.de,
        ezequiel@collabora.com, Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: Re: [PATCH v11] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Message-ID: <YJ5P6ZdAMIsYrTMX@ryzen.lan>
References: <20210423101414.20068-1-mirela.rabulea@oss.nxp.com>
 <20210513073832.GS3425@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513073832.GS3425@dragon>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21-05-13 15:38:33, Shawn Guo wrote:
> On Fri, Apr 23, 2021 at 01:14:14PM +0300, Mirela Rabulea (OSS) wrote:
> > From: Mirela Rabulea <mirela.rabulea@nxp.com>
> > 
> > Add dts for imaging subsytem, include jpeg nodes here.
> > Tested on imx8qxp only, should work on imx8qm, but it was not tested.
> > 
> > Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> So the bindings and driver parts have been accepted already?
> 
> > ---
> > Changes in v11:
> >   Adress feedback from Aisheng Dong:
> >   - Rename img_jpeg_dec_clk/img_jpeg_enc_clk to jpeg_dec_lpcg/jpeg_enc_lpcg to make it visible it's lpcg not other type of clk
> >   - Drop the cameradev node, not needed for jpeg
> >   - Match assigned-clocks & assigned-clock-rates
> > 
> >  .../arm64/boot/dts/freescale/imx8-ss-img.dtsi | 82 +++++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  1 +
> >  2 files changed, 83 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> > new file mode 100644
> > index 000000000000..c508e5d0c92b
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> > @@ -0,0 +1,82 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2019-2021 NXP
> > + * Zhou Guoniu <guoniu.zhou@nxp.com>
> > + */
> > +img_subsys: bus@58000000 {
> > +	compatible = "simple-bus";
> > +	#address-cells = <1>;
> > +	#size-cells = <1>;
> > +	ranges = <0x58000000 0x0 0x58000000 0x1000000>;
> > +
> > +	img_ipg_clk: clock-img-ipg {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <200000000>;
> > +		clock-output-names = "img_ipg_clk";
> > +	};
> 
> Hmm, not sure a fixed-clock should be in the subsystem.
> 

Agreed. Assuming the img_ipg_clk is only used on 8QXP, you could move it
into imx8qxp-ss-img.dtsi. This way every other platform that uses this
ss file will not be impacted.

> > +
> > +	img_jpeg_dec_lpcg: clock-controller@585d0000 {
> > +		compatible = "fsl,imx8qxp-lpcg";
> > +		reg = <0x585d0000 0x10000>;
> > +		#clock-cells = <1>;
> > +		clocks = <&img_ipg_clk>, <&img_ipg_clk>;
> > +		clock-indices = <IMX_LPCG_CLK_0>,
> > +				<IMX_LPCG_CLK_4>;
> > +		clock-output-names = "img_jpeg_dec_lpcg_clk",
> > +				     "img_jpeg_dec_lpcg_ipg_clk";
> > +		power-domains = <&pd IMX_SC_R_MJPEG_DEC_MP>;
> > +	};
> > +
> > +	img_jpeg_enc_lpcg: clock-controller@585f0000 {
> > +		compatible = "fsl,imx8qxp-lpcg";
> > +		reg = <0x585f0000 0x10000>;
> > +		#clock-cells = <1>;
> > +		clocks = <&img_ipg_clk>, <&img_ipg_clk>;
> > +		clock-indices = <IMX_LPCG_CLK_0>,
> > +				<IMX_LPCG_CLK_4>;
> > +		clock-output-names = "img_jpeg_enc_lpcg_clk",
> > +				     "img_jpeg_enc_lpcg_ipg_clk";
> > +		power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>;
> > +	};
> > +
> > +	jpegdec: jpegdec@58400000 {
> 
> Keep nodes sorted in unit address.
> 
> Shawn
> 
> > +		compatible = "nxp,imx8qxp-jpgdec";
> > +		reg = <0x58400000 0x00050000 >;
> > +		interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
> > +		clocks = <&img_jpeg_dec_lpcg 0>,
> > +			 <&img_jpeg_dec_lpcg 1>;
> > +		clock-names = "per", "ipg";
> > +		assigned-clocks = <&img_jpeg_dec_lpcg 0>,
> > +				  <&img_jpeg_dec_lpcg 1>;
> > +		assigned-clock-rates = <200000000>, <200000000>;
> > +		power-domains = <&pd IMX_SC_R_MJPEG_DEC_MP>,
> > +				<&pd IMX_SC_R_MJPEG_DEC_S0>,
> > +				<&pd IMX_SC_R_MJPEG_DEC_S1>,
> > +				<&pd IMX_SC_R_MJPEG_DEC_S2>,
> > +				<&pd IMX_SC_R_MJPEG_DEC_S3>;
> > +	};
> > +
> > +	jpegenc: jpegenc@58450000 {
> > +		compatible = "nxp,imx8qxp-jpgenc";
> > +		reg = <0x58450000 0x00050000 >;
> > +		interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
> > +		clocks = <&img_jpeg_enc_lpcg 0>,
> > +			 <&img_jpeg_enc_lpcg 1>;
> > +		clock-names = "per", "ipg";
> > +		assigned-clocks = <&img_jpeg_enc_lpcg 0>,
> > +				  <&img_jpeg_enc_lpcg 1>;
> > +		assigned-clock-rates = <200000000>, <200000000>;
> > +		power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>,
> > +				<&pd IMX_SC_R_MJPEG_ENC_S0>,
> > +				<&pd IMX_SC_R_MJPEG_ENC_S1>,
> > +				<&pd IMX_SC_R_MJPEG_ENC_S2>,
> > +				<&pd IMX_SC_R_MJPEG_ENC_S3>;
> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > index 1e6b4995091e..2d9589309bd0 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > @@ -258,6 +258,7 @@
> >  	};
> >  
> >  	/* sorted in register address */
> > +	#include "imx8-ss-img.dtsi"
> >  	#include "imx8-ss-adma.dtsi"
> >  	#include "imx8-ss-conn.dtsi"
> >  	#include "imx8-ss-ddr.dtsi"
> > -- 
> > 2.17.1
> > 
