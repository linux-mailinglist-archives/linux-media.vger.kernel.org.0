Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72DB4459907
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbhKWASe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:18:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:53612 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbhKWASd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:18:33 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 283EBA1B;
        Tue, 23 Nov 2021 01:15:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637626524;
        bh=rJgIsaw6ubKZYJFocOIrlLrz81YMZIxxaK4IGd2uzd4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gHrJri1idSmhZ+YLqQJh+XyQLnAf7fWnEfSc9YwDSsG06GzLgHolDcYK5if6SbPSu
         6jb4/PDa//PouZ+Df3DexROKDeKGRy2f1pD888mHGmC710VSUarb7mOE1ZdmMnhdWe
         qXMwpOL3QILb4kOFKRFLoEWvx1L1/NGHyxeS9Fak=
Date:   Tue, 23 Nov 2021 02:15:01 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     arm-soc <linux-arm-kernel@lists.infradead.org>,
        Tim Harvey <tharvey@gateworks.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        linux-media <linux-media@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        cstevens@beaconembedded.com,
        Jagan Teki <jagan@amarulasolutions.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2 4/5] arm64: dts: imx8mm-beacon: Enable OV5640 Camera
Message-ID: <YZwyhWPJVlC0JmpK@pendragon.ideasonboard.com>
References: <20211106155427.753197-1-aford173@gmail.com>
 <20211106155427.753197-4-aford173@gmail.com>
 <YZrTyVJR8VN6dQAf@pendragon.ideasonboard.com>
 <CAHCN7xK=SNgiC2kRzX4gftjkZX4Ms8PVbL69n7+eR-EAe68xag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7xK=SNgiC2kRzX4gftjkZX4Ms8PVbL69n7+eR-EAe68xag@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Sun, Nov 21, 2021 at 09:07:26PM -0600, Adam Ford wrote:
> On Sun, Nov 21, 2021 at 5:18 PM Laurent Pinchart wrote:
> > On Sat, Nov 06, 2021 at 10:54:26AM -0500, Adam Ford wrote:
> > > The baseboard has support for a TDNext 5640 Camera which
> > > uses an OV5640 connected to a 2-lane CSI2 interface.
> > >
> > > With the CSI and mipi_csi2 drivers pointing to an OV5640 camera, the media
> > > pipeline can be configured with the following:
> > >
> > >     media-ctl --links "'ov5640 1-003c':0->'imx7-mipi-csis.0':0[1]"
> > >
> > > The camera and various nodes in the pipeline can be configured for UYVY:
> > >     media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/640x480 field:none]"
> > >     media-ctl -v -V "'csi':0 [fmt:UYVY8_1X16/640x480 field:none]"
> > >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > As the ov5640 is on an add-on module, would a DT overlay be better ?
> 
> At least for the Beacon / LogicPD boards, I would prefer to avoid the
> overlays.  We have an i.M6Q and an OMAP3 board with cameras enabled in
> our development kit device trees.  If the cameras are not connected,
> they just display a message that the cameras are not communicating and
> move on.  I'm OK with that.

You know the board better than I do, so I won't push against this, but I
still think it may not lead to the best user experience, especially if a
user wanted to connect a different sensor to the development board.

> > > ---
> > > V2:  No change
> > >
> > >  .../freescale/imx8mm-beacon-baseboard.dtsi    | 58 +++++++++++++++++++
> > >  1 file changed, 58 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> > > index 6f5e63696ec0..0fb95f4a5e78 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> > > @@ -43,6 +43,16 @@ reg_audio: regulator-audio {
> > >               enable-active-high;
> > >       };
> > >
> > > +     reg_camera: regulator-camera {
> > > +             compatible = "regulator-fixed";
> > > +             regulator-name = "mipi_pwr";
> > > +             regulator-min-microvolt = <2800000>;
> > > +             regulator-max-microvolt = <2800000>;
> > > +             gpio = <&pca6416_1 0 GPIO_ACTIVE_HIGH>;
> > > +             enable-active-high;
> > > +             startup-delay-us = <100000>;
> > > +     };
> > > +
> > >       reg_usdhc2_vmmc: regulator-usdhc2 {
> > >               compatible = "regulator-fixed";
> > >               regulator-name = "VSD_3V3";
> > > @@ -67,6 +77,10 @@ sound {
> > >       };
> > >  };
> > >
> > > +&csi {
> > > +     status = "okay";
> > > +};
> > > +
> > >  &ecspi2 {
> > >       pinctrl-names = "default";
> > >       pinctrl-0 = <&pinctrl_espi2>;
> > > @@ -90,6 +104,30 @@ &i2c2 {
> > >       pinctrl-names = "default";
> > >       pinctrl-0 = <&pinctrl_i2c2>;
> > >       status = "okay";
> > > +
> > > +     camera@3c {
> > > +             compatible = "ovti,ov5640";
> > > +             pinctrl-names = "default";
> > > +             pinctrl-0 = <&pinctrl_ov5640>;
> > > +             reg = <0x3c>;
> > > +             clocks = <&clk IMX8MM_CLK_CLKO1>;
> > > +             clock-names = "xclk";
> > > +             assigned-clocks = <&clk IMX8MM_CLK_CLKO1>;
> > > +             assigned-clock-parents = <&clk IMX8MM_CLK_24M>;
> > > +             assigned-clock-rates = <24000000>;
> > > +             AVDD-supply = <&reg_camera>;  /* 2.8v */
> > > +             powerdown-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
> > > +             reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
> > > +
> > > +             port {
> > > +                     /* MIPI CSI-2 bus endpoint */
> > > +                     ov5640_to_mipi_csi2: endpoint {
> > > +                             remote-endpoint = <&imx8mm_mipi_csi_in>;
> > > +                             clock-lanes = <0>;
> > > +                             data-lanes = <1 2>;
> > > +                     };
> > > +             };
> > > +     };
> > >  };
> > >
> > >  &i2c4 {
> > > @@ -141,6 +179,18 @@ pca6416_1: gpio@21 {
> > >       };
> > >  };
> > >
> > > +&mipi_csi {
> > > +     status = "okay";
> > > +     ports {
> > > +             port@0 {
> > > +                     imx8mm_mipi_csi_in: endpoint {
> > > +                             remote-endpoint = <&ov5640_to_mipi_csi2>;
> > > +                             data-lanes = <1 2>;
> > > +                     };
> > > +             };
> > > +     };
> > > +};
> > > +
> > >  &sai3 {
> > >       pinctrl-names = "default";
> > >       pinctrl-0 = <&pinctrl_sai3>;
> > > @@ -209,6 +259,14 @@ MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28        0x41
> > >               >;
> > >       };
> > >
> > > +     pinctrl_ov5640: ov5640grp {
> > > +             fsl,pins = <
> > > +                     MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7               0x19
> > > +                     MX8MM_IOMUXC_GPIO1_IO06_GPIO1_IO6               0x19
> > > +                     MX8MM_IOMUXC_GPIO1_IO14_CCMSRCGPCMIX_CLKO1      0x59
> > > +             >;
> > > +     };
> > > +
> > >       pinctrl_pcal6414: pcal6414-gpiogrp {
> > >               fsl,pins = <
> > >                       MX8MM_IOMUXC_SAI2_MCLK_GPIO4_IO27               0x19

-- 
Regards,

Laurent Pinchart
