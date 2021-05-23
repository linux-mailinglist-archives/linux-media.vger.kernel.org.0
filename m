Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E89D38D84C
	for <lists+linux-media@lfdr.de>; Sun, 23 May 2021 04:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbhEWCgv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 May 2021 22:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231495AbhEWCgv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 May 2021 22:36:51 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4746AC061574;
        Sat, 22 May 2021 19:35:25 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id r4so23478156iol.6;
        Sat, 22 May 2021 19:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pXiFvm/qRwfihIBWEmyCPQl0MqCP3zv+z584EJlCIYc=;
        b=jxRpdAXSTgOUol+QiQJs0rg6zlUA5oj+hS89s7S5WIdlYcUWKWhocLNVXcHbVlILD/
         S0DYmzmgJ7y5KxB0+cC9ZH2TQOobf81nIQjO+yBySrQWUTukoKXDFpduZU+3foqXgd0I
         YjZ38Om92uVkDDmzMQUFD7u7W2Ys+d4CvQNc/D41ANJMGy9JHLbQ6M/TQFE7WoRH+p//
         vDhVyGbe8Cort8KCa881k1orM1+mzKmOkQvf+iSvTOJs7bdoxRVjIszNo/8fh9Xt2+6H
         RYv7D2DumiwwAJmg7yOiMe+Suy271eEwLhUiJt5MPa2S+XG3JPL+6+bst+LW/SXAUCPe
         XOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pXiFvm/qRwfihIBWEmyCPQl0MqCP3zv+z584EJlCIYc=;
        b=Gmb1TL7JebVpwtONAu7C31b8tai+zs5SEphcr/F9iQIQEqsBqcAn9HfiZs8znXhqGb
         jHoEm7c7wU8mKQEbGNIITTAMkwNz6CS9H4RBBJm8PqsVTN2lZDiiBGHtOKYp6Ewak1Iy
         Z+l+cOWD+nBWpJFNWttD6CZ699DgBIqZsnjWdr54bRB36r3w8Q93t5eiMGwrSLWLZUKc
         jbct9ReZQAIEHz+JOcr6L/vX7yrxP8jo073TwT6TzhOJz9Q+M+I15Vd91tHeIlsGlpau
         GD5qcUPW458AS8sQ/Kz729cJb/TKlvb8tHwp8AvIVxfQqRe73GkNbYQ+3s9ZPKwHEjzD
         ZVcQ==
X-Gm-Message-State: AOAM530fosDxPG+h6tAInSA+PzLsRUW3ECtNdf0hDxWaQ5Oc84VXU6tv
        QVXqZZmP7IpmKCJMzPUyeO0E00ItND3+qQxTckI=
X-Google-Smtp-Source: ABdhPJz2VGfaWz/ze44pqti+mJdP7pB+scGVkRq1Uf9Lb5EV8ZBB78QT5fmar8joMe0CtxscavpcrtMqiNryx/5LgsE=
X-Received: by 2002:a5d:848a:: with SMTP id t10mr7979551iom.68.1621737324355;
 Sat, 22 May 2021 19:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <1620104993-5850-1-git-send-email-dillon.minfei@gmail.com>
 <1620104993-5850-4-git-send-email-dillon.minfei@gmail.com> <20210523022534.GJ8194@dragon>
In-Reply-To: <20210523022534.GJ8194@dragon>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Sun, 23 May 2021 10:34:48 +0800
Message-ID: <CAL9mu0JDowhMqOQuWor6y7dMqbWhY1i9fgjn-xWNkwXLf3Mhig@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] arm: dts: imx: Add i.mx6q DaSheng COM-9XX SBC
 board support
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        leoyang.li@nxp.com, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        mchehab+huawei@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shawn,

Thanks for the reply.

On Sun, May 23, 2021 at 10:25 AM Shawn Guo <shawnguo@kernel.org> wrote:
>
> On Tue, May 04, 2021 at 01:09:52PM +0800, dillon.minfei@gmail.com wrote:
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > The DaSheng Com-9xx is and ARM based signle board computer (SBC)
> > featuring:
> > - i.MX6Q
> > - 2GiB LPDDR3 DRAM
> > - 8GiB eMMC 5.0 FLASH
> > - 4MiB SPI Flash
> > - USB 2.0 Host/Device
> > - Multiple multi-protocol RS232/RS485 Serial ports
> > - microSD socket
> > - 5V DC power input
> > - HDMI1.4a,1080p@60
> > - RGMIIx1 Gigabit Ethernet
> > - CSI0x1, connect with ov2659
> >
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
>
> Idiomatically we use 'ARM: dts: ...' for arch/arm DTS patch prefix.

Okay, i will follow this rule in my next submission. thanks.

>
> > ---
> >
> > v5:
> > - no code change, just change my git author name from lower case to higher case
> >
> >  arch/arm/boot/dts/Makefile        |   1 +
> >  arch/arm/boot/dts/imx6q-ds.dts    |  17 ++
> >  arch/arm/boot/dts/imx6qdl-ds.dtsi | 460 ++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 478 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/imx6q-ds.dts
> >  create mode 100644 arch/arm/boot/dts/imx6qdl-ds.dtsi
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index a19c5ab9df84..425fe17ef7c1 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -510,6 +510,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
> >       imx6q-display5-tianma-tm070-1280x768.dtb \
> >       imx6q-dmo-edmqmx6.dtb \
> >       imx6q-dms-ba16.dtb \
> > +     imx6q-ds.dtb \
> >       imx6q-emcon-avari.dtb \
> >       imx6q-evi.dtb \
> >       imx6q-gk802.dtb \
> > diff --git a/arch/arm/boot/dts/imx6q-ds.dts b/arch/arm/boot/dts/imx6q-ds.dts
> > new file mode 100644
> > index 000000000000..b0a63a133977
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/imx6q-ds.dts
> > @@ -0,0 +1,17 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +//
> > +// Copyright 2021 Dillon Min <dillon.minfei@gmail.com>
> > +//
> > +// Based on imx6qdl-sabresd.dtsi which is:
> > +// Copyright 2012 Freescale Semiconductor, Inc.
> > +// Copyright 2011 Linaro Ltd.
> > +
> > +/dts-v1/;
> > +
> > +#include "imx6q.dtsi"
> > +#include "imx6qdl-ds.dtsi"
> > +
> > +/ {
> > +     model = "DaSheng i.MX6 Quad Com-9xx Board";
> > +     compatible = "ds,imx6q-sbc", "fsl,imx6q";
> > +};
> > diff --git a/arch/arm/boot/dts/imx6qdl-ds.dtsi b/arch/arm/boot/dts/imx6qdl-ds.dtsi
> > new file mode 100644
> > index 000000000000..a2069caf4ea7
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/imx6qdl-ds.dtsi
> > @@ -0,0 +1,460 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +//
> > +// Copyright 2021 Dillon Min <dillon.minfei@gmail.com>
> > +//
> > +// Based on imx6qdl-sabresd.dtsi which is:
> > +// Copyright 2012 Freescale Semiconductor, Inc.
> > +// Copyright 2011 Linaro Ltd.
> > +
> > +#include <dt-bindings/clock/imx6qdl-clock.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +
> > +/ {
> > +     chosen {
> > +             stdout-path = &uart4;
> > +     };
> > +
> > +     memory@10000000 {
> > +             device_type = "memory";
> > +             reg = <0x10000000 0x80000000>;
> > +     };
> > +
> > +     reg_usb_otg_vbus: regulator-usb-otg-vbus {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "usb_otg_vbus";
> > +             regulator-min-microvolt = <5000000>;
> > +             regulator-max-microvolt = <5000000>;
> > +             regulator-always-on;
> > +     };
> > +
> > +     reg_usb_h1_vbus: regulator-usb-h1-vbus {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "usb_h1_vbus";
> > +             regulator-min-microvolt = <5000000>;
> > +             regulator-max-microvolt = <5000000>;
> > +             regulator-always-on;
>
> always-on is meaningless for fixed regulators that do not have on/off
> control.

Thanks for point it.

>
> I fixed them up and applied the patch.

Thanks.

>
> Shawn
>
> > +     };
> > +
> > +     leds {
> > +             compatible = "gpio-leds";
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&pinctrl_gpio_leds>;
> > +
> > +             led-0 {
> > +                     gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>;
> > +                     default-state = "on";
> > +                     linux,default-trigger = "heartbeat";
> > +             };
> > +     };
> > +};
> > +
> > +&ipu1_csi0_from_ipu1_csi0_mux {
> > +     bus-width = <8>;
> > +     data-shift = <12>; /* Lines 19:12 used */
> > +     hsync-active = <1>;
> > +     vsync-active = <1>;
> > +};
> > +
> > +&ipu1_csi0_mux_from_parallel_sensor {
> > +     remote-endpoint = <&ov2659_to_ipu1_csi0_mux>;
> > +};
> > +
> > +&ipu1_csi0 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_ipu1_csi0>;
> > +     status = "okay";
> > +};
> > +
> > +&ecspi1 {
> > +     cs-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_ecspi1>, <&pinctrl_ecspi1_gpio>;
> > +     status = "okay";
> > +
> > +     m25p80: flash@0 {
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +             compatible = "st,m25p80", "jedec,spi-nor";
> > +             spi-max-frequency = <20000000>;
> > +             reg = <0>;
> > +     };
> > +};
> > +
> > +&fec {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_enet>;
> > +     phy-mode = "rgmii-id";
> > +     phy-handle = <&phy>;
> > +     fsl,magic-packet;
> > +     status = "okay";
> > +
> > +     mdio {
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             phy: ethernet-phy@1 {
> > +                     reg = <1>;
> > +                     qca,clk-out-frequency = <125000000>;
> > +                     reset-gpios = <&gpio4 10 GPIO_ACTIVE_LOW>;
> > +                     reset-assert-us = <10000>;
> > +             };
> > +     };
> > +};
> > +
> > +&hdmi {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_hdmi_cec>;
> > +     ddc-i2c-bus = <&i2c3>;
> > +     status = "okay";
> > +};
> > +
> > +&i2c2 {
> > +     clock-frequency = <100000>;
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_i2c2>;
> > +     status = "okay";
> > +
> > +     pfuze100: pmic@8 {
> > +             compatible = "fsl,pfuze100";
> > +             reg = <0x08>;
> > +
> > +             regulators {
> > +                     sw1a_reg: sw1ab {
> > +                             regulator-min-microvolt = <300000>;
> > +                             regulator-max-microvolt = <1875000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                             regulator-ramp-delay = <6250>;
> > +                     };
> > +
> > +                     sw1c_reg: sw1c {
> > +                             regulator-min-microvolt = <300000>;
> > +                             regulator-max-microvolt = <1875000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                             regulator-ramp-delay = <6250>;
> > +                     };
> > +
> > +                     sw2_reg: sw2 {
> > +                             regulator-min-microvolt = <800000>;
> > +                             regulator-max-microvolt = <3300000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                             regulator-ramp-delay = <6250>;
> > +                     };
> > +
> > +                     sw3a_reg: sw3a {
> > +                             regulator-min-microvolt = <400000>;
> > +                             regulator-max-microvolt = <1975000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     sw3b_reg: sw3b {
> > +                             regulator-min-microvolt = <400000>;
> > +                             regulator-max-microvolt = <1975000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     sw4_reg: sw4 {
> > +                             regulator-min-microvolt = <800000>;
> > +                             regulator-max-microvolt = <3300000>;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     swbst_reg: swbst {
> > +                             regulator-min-microvolt = <5000000>;
> > +                             regulator-max-microvolt = <5150000>;
> > +                     };
> > +
> > +                     snvs_reg: vsnvs {
> > +                             regulator-min-microvolt = <1000000>;
> > +                             regulator-max-microvolt = <3000000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     vref_reg: vrefddr {
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     vgen1_reg: vgen1 {
> > +                             regulator-min-microvolt = <800000>;
> > +                             regulator-max-microvolt = <1550000>;
> > +                     };
> > +
> > +                     vgen2_reg: vgen2 {
> > +                             regulator-min-microvolt = <800000>;
> > +                             regulator-max-microvolt = <1550000>;
> > +                     };
> > +
> > +                     vgen3_reg: vgen3 {
> > +                             regulator-min-microvolt = <1800000>;
> > +                             regulator-max-microvolt = <3300000>;
> > +                     };
> > +
> > +                     vgen4_reg: vgen4 {
> > +                             regulator-min-microvolt = <1800000>;
> > +                             regulator-max-microvolt = <3300000>;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     vgen5_reg: vgen5 {
> > +                             regulator-min-microvolt = <1800000>;
> > +                             regulator-max-microvolt = <3300000>;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     vgen6_reg: vgen6 {
> > +                             regulator-min-microvolt = <1800000>;
> > +                             regulator-max-microvolt = <3300000>;
> > +                             regulator-always-on;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&i2c3 {
> > +     clock-frequency = <100000>;
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_i2c3>;
> > +     status = "okay";
> > +
> > +     ov2659: camera@30 {
> > +             compatible = "ovti,ov2659";
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&pinctrl_ov2659>;
> > +             clocks = <&clks IMX6QDL_CLK_CKO>;
> > +             clock-names = "xvclk";
> > +             reg = <0x30>;
> > +             powerdown-gpios = <&gpio7 11 GPIO_ACTIVE_HIGH>;
> > +             reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
> > +             status = "okay";
> > +
> > +             port {
> > +                     ov2659_to_ipu1_csi0_mux: endpoint {
> > +                             remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
> > +                             link-frequencies = /bits/ 64 <70000000>;
> > +                             bus-width = <8>;
> > +                             hsync-active = <1>;
> > +                             vsync-active = <1>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&iomuxc {
> > +     pinctrl_ecspi1: ecspi1grp {
> > +             fsl,pins = <
> > +                     MX6QDL_PAD_EIM_D16__ECSPI1_SCLK         0x100b1
> > +                     MX6QDL_PAD_EIM_D18__ECSPI1_MOSI         0x100b1
> > +                     MX6QDL_PAD_EIM_D17__ECSPI1_MISO         0x100b1
> > +             >;
> > +     };
> > +
> > +     pinctrl_ecspi1_gpio: ecspi1grpgpiogrp {
> > +             fsl,pins = <
> > +                     MX6QDL_PAD_KEY_ROW1__GPIO4_IO09         0x1b0b0
> > +                     MX6QDL_PAD_ENET_RXD0__GPIO1_IO27        0x1b0b0
> > +             >;
> > +     };
> > +
> > +     pinctrl_enet: enetgrp {
> > +             fsl,pins = <
> > +                     MX6QDL_PAD_ENET_MDIO__ENET_MDIO         0x1b0b0
> > +                     MX6QDL_PAD_ENET_MDC__ENET_MDC           0x1b0b0
> > +                     MX6QDL_PAD_RGMII_TXC__RGMII_TXC         0x1b030
> > +                     MX6QDL_PAD_RGMII_TD0__RGMII_TD0         0x1b030
> > +                     MX6QDL_PAD_RGMII_TD1__RGMII_TD1         0x1b030
> > +                     MX6QDL_PAD_RGMII_TD2__RGMII_TD2         0x1b030
> > +                     MX6QDL_PAD_RGMII_TD3__RGMII_TD3         0x1b030
> > +                     MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL   0x1b030
> > +                     MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK    0x1b0b0
> > +                     MX6QDL_PAD_RGMII_RXC__RGMII_RXC         0x1b030
> > +                     MX6QDL_PAD_RGMII_RD0__RGMII_RD0         0x1b030
> > +                     MX6QDL_PAD_RGMII_RD1__RGMII_RD1         0x1b030
> > +                     MX6QDL_PAD_RGMII_RD2__RGMII_RD2         0x1b030
> > +                     MX6QDL_PAD_RGMII_RD3__RGMII_RD3         0x1b030
> > +                     MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL   0x1b030
> > +                     MX6QDL_PAD_KEY_COL2__GPIO4_IO10         0x1b0b0
> > +             >;
> > +     };
> > +
> > +     pinctrl_hdmi_cec: hdmicecgrp {
> > +             fsl,pins = <
> > +                     MX6QDL_PAD_EIM_A25__HDMI_TX_CEC_LINE    0x1f8b0
> > +             >;
> > +     };
> > +
> > +     pinctrl_i2c2: i2c2grp {
> > +             fsl,pins = <
> > +                     MX6QDL_PAD_EIM_EB2__I2C2_SCL            0x4001b8b1
> > +                     MX6QDL_PAD_KEY_ROW3__I2C2_SDA           0x4001b8b1
> > +             >;
> > +     };
> > +
> > +     pinctrl_i2c3: i2c3grp {
> > +             fsl,pins = <
> > +                     MX6QDL_PAD_GPIO_5__I2C3_SCL             0x4001b8b1
> > +                     MX6QDL_PAD_GPIO_6__I2C3_SDA             0x4001b8b1
> > +             >;
> > +     };
> > +
> > +     pinctrl_ipu1_csi0: ipu1csi0grp {
> > +             fsl,pins = <
> > +                     MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12    0x1b0b0
> > +                     MX6QDL_PAD_CSI0_DAT13__IPU1_CSI0_DATA13    0x1b0b0
> > +                     MX6QDL_PAD_CSI0_DAT14__IPU1_CSI0_DATA14    0x1b0b0
> > +                     MX6QDL_PAD_CSI0_DAT15__IPU1_CSI0_DATA15    0x1b0b0
> > +                     MX6QDL_PAD_CSI0_DAT16__IPU1_CSI0_DATA16    0x1b0b0
> > +                     MX6QDL_PAD_CSI0_DAT17__IPU1_CSI0_DATA17    0x1b0b0
> > +                     MX6QDL_PAD_CSI0_DAT18__IPU1_CSI0_DATA18    0x1b0b0
> > +                     MX6QDL_PAD_CSI0_DAT19__IPU1_CSI0_DATA19    0x1b0b0
> > +                     MX6QDL_PAD_CSI0_PIXCLK__IPU1_CSI0_PIXCLK   0x1b0b0
> > +                     MX6QDL_PAD_CSI0_MCLK__IPU1_CSI0_HSYNC      0x1b0b0
> > +                     MX6QDL_PAD_CSI0_VSYNC__IPU1_CSI0_VSYNC     0x1b0b0
> > +             >;
> > +     };
> > +
> > +     pinctrl_ov2659: ov2659grp {
> > +             fsl,pins = <
> > +                     MX6QDL_PAD_GPIO_16__GPIO7_IO11          0x1b0b0
> > +                     MX6QDL_PAD_GPIO_7__GPIO1_IO07           0x1b0b0
> > +                     MX6QDL_PAD_GPIO_0__CCM_CLKO1            0x130b0
> > +             >;
> > +     };
> > +
> > +     pinctrl_uart4: uart4grp {
> > +             fsl,pins = <
> > +                     MX6QDL_PAD_KEY_COL0__UART4_TX_DATA      0x1b0b1
> > +                     MX6QDL_PAD_KEY_ROW0__UART4_RX_DATA      0x1b0b1
> > +             >;
> > +     };
> > +
> > +     pinctrl_usbotg: usbotggrp {
> > +             fsl,pins = <
> > +                     MX6QDL_PAD_ENET_RX_ER__USB_OTG_ID       0x17059
> > +             >;
> > +     };
> > +
> > +     pinctrl_usdhc1: usdhc1grp {
> > +             fsl,pins = <
> > +                     MX6QDL_PAD_SD1_CMD__SD1_CMD             0x17059
> > +                     MX6QDL_PAD_SD1_CLK__SD1_CLK             0x10059
> > +                     MX6QDL_PAD_SD1_DAT0__SD1_DATA0          0x17059
> > +                     MX6QDL_PAD_SD1_DAT1__SD1_DATA1          0x17059
> > +                     MX6QDL_PAD_SD1_DAT2__SD1_DATA2          0x17059
> > +                     MX6QDL_PAD_SD1_DAT3__SD1_DATA3          0x17059
> > +             >;
> > +     };
> > +
> > +     pinctrl_usdhc1_gpio: usdhc1grpgpiogrp {
> > +             fsl,pins = <
> > +                     MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28       0x1b0b0
> > +             >;
> > +     };
> > +
> > +     pinctrl_usdhc2: usdhc2grp {
> > +             fsl,pins = <
> > +                     MX6QDL_PAD_SD2_CMD__SD2_CMD             0x17059
> > +                     MX6QDL_PAD_SD2_CLK__SD2_CLK             0x10059
> > +                     MX6QDL_PAD_SD2_DAT0__SD2_DATA0          0x17059
> > +                     MX6QDL_PAD_SD2_DAT1__SD2_DATA1          0x17059
> > +                     MX6QDL_PAD_SD2_DAT2__SD2_DATA2          0x17059
> > +                     MX6QDL_PAD_SD2_DAT3__SD2_DATA3          0x17059
> > +             >;
> > +     };
> > +
> > +     pinctrl_usdhc2_gpio: usdhc2grpgpiogrp {
> > +             fsl,pins = <
> > +                     MX6QDL_PAD_NANDF_D0__GPIO2_IO00         0x1b0b0
> > +                     MX6QDL_PAD_NANDF_D1__GPIO2_IO01         0x1b0b0
> > +             >;
> > +     };
> > +
> > +     pinctrl_usdhc3: usdhc3grp {
> > +             fsl,pins = <
> > +                     MX6QDL_PAD_SD3_CMD__SD3_CMD             0x17059
> > +                     MX6QDL_PAD_SD3_CLK__SD3_CLK             0x10059
> > +                     MX6QDL_PAD_SD3_DAT0__SD3_DATA0          0x17059
> > +                     MX6QDL_PAD_SD3_DAT1__SD3_DATA1          0x17059
> > +                     MX6QDL_PAD_SD3_DAT2__SD3_DATA2          0x17059
> > +                     MX6QDL_PAD_SD3_DAT3__SD3_DATA3          0x17059
> > +                     MX6QDL_PAD_SD3_DAT4__SD3_DATA4          0x17059
> > +                     MX6QDL_PAD_SD3_DAT5__SD3_DATA5          0x17059
> > +                     MX6QDL_PAD_SD3_DAT6__SD3_DATA6          0x17059
> > +                     MX6QDL_PAD_SD3_DAT7__SD3_DATA7          0x17059
> > +             >;
> > +     };
> > +
> > +     pinctrl_wdog: wdoggrp {
> > +             fsl,pins = <
> > +                     MX6QDL_PAD_GPIO_1__WDOG2_B              0x1b0b0
> > +             >;
> > +     };
> > +
> > +     pinctrl_gpio_leds: gpioledsgrp {
> > +             fsl,pins = <
> > +                     MX6QDL_PAD_KEY_COL1__GPIO4_IO08 0x1b0b0
> > +             >;
> > +     };
> > +};
> > +
> > +&uart4 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_uart4>;
> > +     status = "okay";
> > +};
> > +
> > +&usbh1 {
> > +     vbus-supply = <&reg_usb_h1_vbus>;
> > +     status = "okay";
> > +};
> > +
> > +&usbotg {
> > +     vbus-supply = <&reg_usb_otg_vbus>;
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_usbotg>;
> > +     disable-over-current;
> > +     status = "okay";
> > +};
> > +
> > +&usdhc1 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> > +     bus-width = <4>;
> > +     cd-gpios = <&gpio1 28 GPIO_ACTIVE_LOW>;
> > +     status = "okay";
> > +};
> > +
> > +&usdhc2 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> > +     bus-width = <4>;
> > +     cd-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
> > +     wp-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
> > +     status = "disabled";
> > +};
> > +
> > +&usdhc3 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_usdhc3>;
> > +     bus-width = <8>;
> > +     non-removable;
> > +     no-1-8-v;
> > +     status = "okay";
> > +};
> > +
> > +&wdog1 {
> > +     status = "disabled";
> > +};
> > +
> > +&wdog2 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_wdog>;
> > +     fsl,ext-reset-output;
> > +     status = "okay";
> > +};
> > --
> > 1.9.1
> >
