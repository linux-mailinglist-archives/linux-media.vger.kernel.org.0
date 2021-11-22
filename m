Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03963458831
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 04:07:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238576AbhKVDKq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Nov 2021 22:10:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhKVDKp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Nov 2021 22:10:45 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFAB3C061574;
        Sun, 21 Nov 2021 19:07:39 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id e3so70417862edu.4;
        Sun, 21 Nov 2021 19:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=66pEqIh/hxjDI6IBVhVyZpaU/DnBMngjj367QoH2zX0=;
        b=Aqjc20wwIhycN0UKtBDX8hk8+SZqdK6QHoJMvYJk4AKC/cqbi2UTNG7aqqJTnoQxal
         fCflrOw0AoXsgAQZbNG3a7FfxAQaqlfITU9LQy5mMF7h6HbYDr/4hj/Oi4QAFVD9SESS
         XNAtFHuWr5SRm2+cair5AR1gHcXwfytxCTbjXUl130X+vxF2gcDUkqRqwyj+1EbJYul+
         STFP8kXDXfXSgNx4CMMGDwZabn6H/N5mgj6Dc1glYCCEKUiXI6Un4FpSr/cfuczuy7lx
         HNOvRNSUTlnnGkPTTNKzXz2T7/Co4G3F3FQVyqr8Bz4kIKGBUMnlU8EeD4l7c1InqP9m
         3Org==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=66pEqIh/hxjDI6IBVhVyZpaU/DnBMngjj367QoH2zX0=;
        b=gUU4uh/yJymwDgwh9mbECy1OXM+kA9jSkH31Ahl+Sz8ni8OH/QIt5T8fFRHwwfRRz+
         1UxDU7vtSuMX52IBPe5SziYdN1xsFRKwFuiAoNrKML+81Evasia5F9+lL3dNc8Fvmwuy
         7Q0RM+bWOWGItsNQuVdJ4xyVa/NfO7Ul+hkNwCzGunUEaP4F0obaCvcNYk4wOn1R6XIk
         wQeov5/sICxvXhck3cSCRbnc10O6qSrL92B4Nwy+aQrR14I2/FUzOSzTpNr82KvISsAb
         YlZ+QJ4AYbv9n8T6DbYZss2ffZVtnpIpwHo7RzTNY8dya36BqJYhdzi+FfmiXPEV06n5
         S/AA==
X-Gm-Message-State: AOAM532tiRwsPEGx470k80fqWkrYQTlLZX8RRfAAeUT//73gy7bJrOOL
        GiYpprxpi6Y1Q467xg1Ii7mk07r/yTpoNjoUTj0=
X-Google-Smtp-Source: ABdhPJzYXM0wvHPRwKFahjWfK6XpvYJQTI45zRB1/4YIlDwncdDUkdId6Lx3prs7CUL2O+Lh3zDylnOkLUO5Yhgqva4=
X-Received: by 2002:a17:907:160b:: with SMTP id hb11mr37468062ejc.336.1637550458015;
 Sun, 21 Nov 2021 19:07:38 -0800 (PST)
MIME-Version: 1.0
References: <20211106155427.753197-1-aford173@gmail.com> <20211106155427.753197-4-aford173@gmail.com>
 <YZrTyVJR8VN6dQAf@pendragon.ideasonboard.com>
In-Reply-To: <YZrTyVJR8VN6dQAf@pendragon.ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 21 Nov 2021 21:07:26 -0600
Message-ID: <CAHCN7xK=SNgiC2kRzX4gftjkZX4Ms8PVbL69n7+eR-EAe68xag@mail.gmail.com>
Subject: Re: [PATCH V2 4/5] arm64: dts: imx8mm-beacon: Enable OV5640 Camera
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Nov 21, 2021 at 5:18 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Adam,
>
> Thank you for the patch.
>
> On Sat, Nov 06, 2021 at 10:54:26AM -0500, Adam Ford wrote:
> > The baseboard has support for a TDNext 5640 Camera which
> > uses an OV5640 connected to a 2-lane CSI2 interface.
> >
> > With the CSI and mipi_csi2 drivers pointing to an OV5640 camera, the media
> > pipeline can be configured with the following:
> >
> >     media-ctl --links "'ov5640 1-003c':0->'imx7-mipi-csis.0':0[1]"
> >
> > The camera and various nodes in the pipeline can be configured for UYVY:
> >     media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/640x480 field:none]"
> >     media-ctl -v -V "'csi':0 [fmt:UYVY8_1X16/640x480 field:none]"
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> As the ov5640 is on an add-on module, would a DT overlay be better ?

At least for the Beacon / LogicPD boards, I would prefer to avoid the
overlays.  We have an i.M6Q and an OMAP3 board with cameras enabled in
our development kit device trees.  If the cameras are not connected,
they just display a message that the cameras are not communicating and
move on.  I'm OK with that.

>
> > ---
> > V2:  No change
> >
> >  .../freescale/imx8mm-beacon-baseboard.dtsi    | 58 +++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> > index 6f5e63696ec0..0fb95f4a5e78 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> > @@ -43,6 +43,16 @@ reg_audio: regulator-audio {
> >               enable-active-high;
> >       };
> >
> > +     reg_camera: regulator-camera {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "mipi_pwr";
> > +             regulator-min-microvolt = <2800000>;
> > +             regulator-max-microvolt = <2800000>;
> > +             gpio = <&pca6416_1 0 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             startup-delay-us = <100000>;
> > +     };
> > +
> >       reg_usdhc2_vmmc: regulator-usdhc2 {
> >               compatible = "regulator-fixed";
> >               regulator-name = "VSD_3V3";
> > @@ -67,6 +77,10 @@ sound {
> >       };
> >  };
> >
> > +&csi {
> > +     status = "okay";
> > +};
> > +
> >  &ecspi2 {
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&pinctrl_espi2>;
> > @@ -90,6 +104,30 @@ &i2c2 {
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&pinctrl_i2c2>;
> >       status = "okay";
> > +
> > +     camera@3c {
> > +             compatible = "ovti,ov5640";
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&pinctrl_ov5640>;
> > +             reg = <0x3c>;
> > +             clocks = <&clk IMX8MM_CLK_CLKO1>;
> > +             clock-names = "xclk";
> > +             assigned-clocks = <&clk IMX8MM_CLK_CLKO1>;
> > +             assigned-clock-parents = <&clk IMX8MM_CLK_24M>;
> > +             assigned-clock-rates = <24000000>;
> > +             AVDD-supply = <&reg_camera>;  /* 2.8v */
> > +             powerdown-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
> > +             reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
> > +
> > +             port {
> > +                     /* MIPI CSI-2 bus endpoint */
> > +                     ov5640_to_mipi_csi2: endpoint {
> > +                             remote-endpoint = <&imx8mm_mipi_csi_in>;
> > +                             clock-lanes = <0>;
> > +                             data-lanes = <1 2>;
> > +                     };
> > +             };
> > +     };
> >  };
> >
> >  &i2c4 {
> > @@ -141,6 +179,18 @@ pca6416_1: gpio@21 {
> >       };
> >  };
> >
> > +&mipi_csi {
> > +     status = "okay";
> > +     ports {
> > +             port@0 {
> > +                     imx8mm_mipi_csi_in: endpoint {
> > +                             remote-endpoint = <&ov5640_to_mipi_csi2>;
> > +                             data-lanes = <1 2>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> >  &sai3 {
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&pinctrl_sai3>;
> > @@ -209,6 +259,14 @@ MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28        0x41
> >               >;
> >       };
> >
> > +     pinctrl_ov5640: ov5640grp {
> > +             fsl,pins = <
> > +                     MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7               0x19
> > +                     MX8MM_IOMUXC_GPIO1_IO06_GPIO1_IO6               0x19
> > +                     MX8MM_IOMUXC_GPIO1_IO14_CCMSRCGPCMIX_CLKO1      0x59
> > +             >;
> > +     };
> > +
> >       pinctrl_pcal6414: pcal6414-gpiogrp {
> >               fsl,pins = <
> >                       MX8MM_IOMUXC_SAI2_MCLK_GPIO4_IO27               0x19
>
> --
> Regards,
>
> Laurent Pinchart
