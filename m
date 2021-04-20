Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF9F36527C
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 08:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbhDTGoS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 02:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhDTGoQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 02:44:16 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE21BC06174A;
        Mon, 19 Apr 2021 23:43:45 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id s16so32148855iog.9;
        Mon, 19 Apr 2021 23:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+G8HYiVkt68pL8aTPL9DdLcgGB2ZBBVXHvtf8BnFkd0=;
        b=s76xe10EVdPV2U7oTmfWWoWbej5dLJ3FRmqO1Xeo6vdZbn8QSLRWAwBmjlrLSXqdA2
         qym0CxoB4mgPC5LhXS5Fs+aRPL7s5DmP0Gt30hDI5knb16IPglJuEIaa1sqy+tnmqbZw
         ohwvKXrTCNEJCtavKgjhIGb8HEEsRzo3iUYWONGRjz9gsOzWqrLsEU5SM9gMK6QPOiTt
         6iIolaz2aWMSkH8WWwqH70nfkH78U6n24iUB15DWddoJpxIIMET1TKLoUBK0oJ7kGCo6
         nLJz2kpDW9XI+yuQsIcAyxrJezB89ua/BQxrdEY0is19FpybtA3JlODLFSaYOuGYSQbt
         qa0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+G8HYiVkt68pL8aTPL9DdLcgGB2ZBBVXHvtf8BnFkd0=;
        b=QZtqwRpitIQVh/7snETz8Zw/aW2ePyzo7HQ1iiG19POZxnvqIEm4zhJnxeygw5Zlho
         KGgbeZpWbenCajZzq9muyTp8YaydzNHeJzw4Vk+iSAkQRHYQNaaPz+pTnf8+uGOoPP0I
         vohw3eW2bf+za/yKolsj1mXzWrDEBM6yIypl4Gvo3d8DgTEa9nk3QefqaGphh3lfRsZC
         wWO4XN11TFYZST3RrUfwM1jkxs6GTIiTaoZY7ULEa2lOCHnZfsiuQBQ873Tmx2Gf0ZtD
         6cZ/oWzQt2bl4yb89rHp31dAqtZAlARSyuY4dojRfc1yi5DH9DQwxJWxQSGVRJ3v9++9
         WXhQ==
X-Gm-Message-State: AOAM530YXPJowIiYRyXM5MMG/1dtwbrvIUQJ5Cu88Iy7jvhLKEbXzOcy
        EvWS5+BYYcCAZt1Nz/DTtKL0tjVZ7rf/7xa6kcU=
X-Google-Smtp-Source: ABdhPJy+/J8a9VDyjHLzKzz0NxnyhLpcVPezfV09q0s3imtHxt1ikC/Oh9oh06TLqfre1ua3t0svGwmV7B+nVM9JCC8=
X-Received: by 2002:a5e:c114:: with SMTP id v20mr4089864iol.110.1618901024936;
 Mon, 19 Apr 2021 23:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <1618459535-8141-1-git-send-email-dillon.minfei@gmail.com> <1618459535-8141-4-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1618459535-8141-4-git-send-email-dillon.minfei@gmail.com>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Tue, 20 Apr 2021 14:43:08 +0800
Message-ID: <CAL9mu0LJCa3OXYdTj2e3pMcC=-S=EQN4UqkgnWOFsRsBGxQhLw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm: dts: imx: Add i.mx6q DaSheng COM-9XX SBC
 board support
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, krzk@kernel.org,
        linux@rempel-privat.de, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        festevam@gmail.com, prabhakar.csengg@gmail.com, mchehab@kernel.org
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-imx@nxp.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi=EF=BC=8C

Just a gentle ping, hope some expert could take a look, thanks.

Best regards.
Dillon

On Thu, Apr 15, 2021 at 12:05 PM <dillon.minfei@gmail.com> wrote:
>
> From: dillon min <dillon.minfei@gmail.com>
>
> The DaSheng Com-9xx is and ARM based signle board computer (SBC)
> featuring:
> - i.MX6Q
> - 2GiB LPDDR3 DRAM
> - 8GiB eMMC 5.0 FLASH
> - 4MiB SPI Flash
> - USB 2.0 Host/Device
> - Multiple multi-protocol RS232/RS485 Serial ports
> - microSD socket
> - 5V DC power input
> - HDMI1.4a,1080p@60
> - RGMIIx1 Gigabit Ethernet
> - CSI0x1, connect with ov2659
>
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
> v3: move imx6q-ds.dtb after imx6q-dms-ba16.dtb to follow the alphabetical=
 order
>
>  arch/arm/boot/dts/Makefile        |   1 +
>  arch/arm/boot/dts/imx6q-ds.dts    |  17 ++
>  arch/arm/boot/dts/imx6qdl-ds.dtsi | 465 ++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 483 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6q-ds.dts
>  create mode 100644 arch/arm/boot/dts/imx6qdl-ds.dtsi
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index a19c5ab9df84..425fe17ef7c1 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -510,6 +510,7 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
>         imx6q-display5-tianma-tm070-1280x768.dtb \
>         imx6q-dmo-edmqmx6.dtb \
>         imx6q-dms-ba16.dtb \
> +       imx6q-ds.dtb \
>         imx6q-emcon-avari.dtb \
>         imx6q-evi.dtb \
>         imx6q-gk802.dtb \
> diff --git a/arch/arm/boot/dts/imx6q-ds.dts b/arch/arm/boot/dts/imx6q-ds.=
dts
> new file mode 100644
> index 000000000000..b0a63a133977
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6q-ds.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// Copyright 2021 Dillon Min <dillon.minfei@gmail.com>
> +//
> +// Based on imx6qdl-sabresd.dtsi which is:
> +// Copyright 2012 Freescale Semiconductor, Inc.
> +// Copyright 2011 Linaro Ltd.
> +
> +/dts-v1/;
> +
> +#include "imx6q.dtsi"
> +#include "imx6qdl-ds.dtsi"
> +
> +/ {
> +       model =3D "DaSheng i.MX6 Quad Com-9xx Board";
> +       compatible =3D "ds,imx6q-sbc", "fsl,imx6q";
> +};
> diff --git a/arch/arm/boot/dts/imx6qdl-ds.dtsi b/arch/arm/boot/dts/imx6qd=
l-ds.dtsi
> new file mode 100644
> index 000000000000..d28e065349cd
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6qdl-ds.dtsi
> @@ -0,0 +1,465 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// Copyright 2021 Dillon Min <dillon.minfei@gmail.com>
> +//
> +// Based on imx6qdl-sabresd.dtsi which is:
> +// Copyright 2012 Freescale Semiconductor, Inc.
> +// Copyright 2011 Linaro Ltd.
> +
> +#include <dt-bindings/clock/imx6qdl-clock.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +       chosen {
> +               stdout-path =3D &uart1;
> +       };
> +
> +       memory@10000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x10000000 0x80000000>;
> +       };
> +
> +       reg_usb_otg_vbus: regulator-usb-otg-vbus {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "usb_otg_vbus";
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               regulator-always-on;
> +       };
> +
> +       reg_usb_h1_vbus: regulator-usb-h1-vbus {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "usb_h1_vbus";
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               regulator-always-on;
> +       };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pinctrl_gpio_leds>;
> +
> +               green {
> +                       gpios =3D <&gpio4 8 0>;
> +                       default-state =3D "on";
> +                       linux,default-trigger =3D "heartbeat";
> +               };
> +       };
> +};
> +
> +&ipu1_csi0_from_ipu1_csi0_mux {
> +       bus-width =3D <8>;
> +       data-shift =3D <12>; /* Lines 19:12 used */
> +       hsync-active =3D <1>;
> +       vsync-active =3D <1>;
> +};
> +
> +&ipu1_csi0_mux_from_parallel_sensor {
> +       remote-endpoint =3D <&ov2659_to_ipu1_csi0_mux>;
> +};
> +
> +&ipu1_csi0 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_ipu1_csi0>;
> +       status =3D "okay";
> +};
> +
> +&clks {
> +       assigned-clocks =3D <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
> +                         <&clks IMX6QDL_CLK_LDB_DI1_SEL>;
> +       assigned-clock-parents =3D <&clks IMX6QDL_CLK_PLL3_USB_OTG>,
> +                                <&clks IMX6QDL_CLK_PLL3_USB_OTG>;
> +};
> +
> +&ecspi1 {
> +       cs-gpios =3D <&gpio4 9 GPIO_ACTIVE_LOW>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_ecspi1>;
> +       status =3D "okay";
> +
> +       flash: m25p80@0 {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               compatible =3D "st,m25p80", "jedec,spi-nor";
> +               spi-max-frequency =3D <20000000>;
> +               reg =3D <0>;
> +       };
> +};
> +
> +&fec {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_enet>;
> +       phy-mode =3D "rgmii-id";
> +       phy-handle =3D <&phy>;
> +       fsl,magic-packet;
> +       status =3D "okay";
> +
> +       mdio {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               phy: ethernet-phy@1 {
> +                       reg =3D <1>;
> +                       qca,clk-out-frequency =3D <125000000>;
> +                       reset-gpios =3D <&gpio4 10 GPIO_ACTIVE_LOW>;
> +                       reset-assert-us =3D <10000>;
> +               };
> +       };
> +};
> +
> +&hdmi {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_hdmi_cec>;
> +       ddc-i2c-bus =3D <&i2c3>;
> +       status =3D "okay";
> +};
> +
> +&i2c2 {
> +       clock-frequency =3D <100000>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_i2c2>;
> +       status =3D "okay";
> +
> +       pmic: pfuze100@8 {
> +               compatible =3D "fsl,pfuze100";
> +               reg =3D <0x08>;
> +
> +               regulators {
> +                       sw1a_reg: sw1ab {
> +                               regulator-min-microvolt =3D <300000>;
> +                               regulator-max-microvolt =3D <1875000>;
> +                               regulator-boot-on;
> +                               regulator-always-on;
> +                               regulator-ramp-delay =3D <6250>;
> +                       };
> +
> +                       sw1c_reg: sw1c {
> +                               regulator-min-microvolt =3D <300000>;
> +                               regulator-max-microvolt =3D <1875000>;
> +                               regulator-boot-on;
> +                               regulator-always-on;
> +                               regulator-ramp-delay =3D <6250>;
> +                       };
> +
> +                       sw2_reg: sw2 {
> +                               regulator-min-microvolt =3D <800000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-boot-on;
> +                               regulator-always-on;
> +                               regulator-ramp-delay =3D <6250>;
> +                       };
> +
> +                       sw3a_reg: sw3a {
> +                               regulator-min-microvolt =3D <400000>;
> +                               regulator-max-microvolt =3D <1975000>;
> +                               regulator-boot-on;
> +                               regulator-always-on;
> +                       };
> +
> +                       sw3b_reg: sw3b {
> +                               regulator-min-microvolt =3D <400000>;
> +                               regulator-max-microvolt =3D <1975000>;
> +                               regulator-boot-on;
> +                               regulator-always-on;
> +                       };
> +
> +                       sw4_reg: sw4 {
> +                               regulator-min-microvolt =3D <800000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       swbst_reg: swbst {
> +                               regulator-min-microvolt =3D <5000000>;
> +                               regulator-max-microvolt =3D <5150000>;
> +                       };
> +
> +                       snvs_reg: vsnvs {
> +                               regulator-min-microvolt =3D <1000000>;
> +                               regulator-max-microvolt =3D <3000000>;
> +                               regulator-boot-on;
> +                               regulator-always-on;
> +                       };
> +
> +                       vref_reg: vrefddr {
> +                               regulator-boot-on;
> +                               regulator-always-on;
> +                       };
> +
> +                       vgen1_reg: vgen1 {
> +                               regulator-min-microvolt =3D <800000>;
> +                               regulator-max-microvolt =3D <1550000>;
> +                       };
> +
> +                       vgen2_reg: vgen2 {
> +                               regulator-min-microvolt =3D <800000>;
> +                               regulator-max-microvolt =3D <1550000>;
> +                       };
> +
> +                       vgen3_reg: vgen3 {
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                       };
> +
> +                       vgen4_reg: vgen4 {
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       vgen5_reg: vgen5 {
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       vgen6_reg: vgen6 {
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-always-on;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c3 {
> +       clock-frequency =3D <100000>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_i2c3>;
> +       status =3D "okay";
> +
> +       ov2659: camera@30 {
> +               compatible =3D "ovti,ov2659";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pinctrl_ov2659>;
> +               clocks =3D <&clks IMX6QDL_CLK_CKO>;
> +               clock-names =3D "xvclk";
> +               reg =3D <0x30>;
> +               powerdown-gpios =3D <&gpio7 11 GPIO_ACTIVE_HIGH>;
> +               reset-gpios =3D <&gpio1 7 GPIO_ACTIVE_LOW>;
> +               status =3D "okay";
> +
> +               port {
> +                       ov2659_to_ipu1_csi0_mux: endpoint {
> +                               remote-endpoint =3D <&ipu1_csi0_mux_from_=
parallel_sensor>;
> +                               link-frequencies =3D /bits/ 64 <70000000>=
;
> +                               bus-width =3D <8>;
> +                               hsync-active =3D <1>;
> +                               vsync-active =3D <1>;
> +                       };
> +               };
> +       };
> +};
> +
> +&iomuxc {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_hog>;
> +
> +       imx6qdl-ds {
> +               pinctrl_hog: hoggrp {
> +                       fsl,pins =3D <
> +                               MX6QDL_PAD_NANDF_D0__GPIO2_IO00 0x1b0b0
> +                               MX6QDL_PAD_NANDF_D1__GPIO2_IO01 0x1b0b0
> +                               MX6QDL_PAD_GPIO_0__CCM_CLKO1    0x130b0
> +                               MX6QDL_PAD_ENET_CRS_DV__GPIO1_IO25 0x1b0b=
0
> +                               MX6QDL_PAD_KEY_COL2__GPIO4_IO10 0x1b0b0
> +                       >;
> +               };
> +
> +               pinctrl_ecspi1: ecspi1grp {
> +                       fsl,pins =3D <
> +                               MX6QDL_PAD_KEY_ROW1__GPIO4_IO09 0x1b0b0
> +                               MX6QDL_PAD_ENET_RXD0__GPIO1_IO27 0x1b0b0
> +                               MX6QDL_PAD_EIM_D16__ECSPI1_SCLK 0x100b1
> +                               MX6QDL_PAD_EIM_D18__ECSPI1_MOSI 0x100b1
> +                               MX6QDL_PAD_EIM_D17__ECSPI1_MISO 0x100b1
> +                       >;
> +               };
> +
> +               pinctrl_enet: enetgrp {
> +                       fsl,pins =3D <
> +                               MX6QDL_PAD_ENET_MDIO__ENET_MDIO         0=
x1b0b0
> +                               MX6QDL_PAD_ENET_MDC__ENET_MDC           0=
x1b0b0
> +                               MX6QDL_PAD_RGMII_TXC__RGMII_TXC         0=
x1b030
> +                               MX6QDL_PAD_RGMII_TD0__RGMII_TD0         0=
x1b030
> +                               MX6QDL_PAD_RGMII_TD1__RGMII_TD1         0=
x1b030
> +                               MX6QDL_PAD_RGMII_TD2__RGMII_TD2         0=
x1b030
> +                               MX6QDL_PAD_RGMII_TD3__RGMII_TD3         0=
x1b030
> +                               MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL   0=
x1b030
> +                               MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK    0=
x1b0b0
> +                               MX6QDL_PAD_RGMII_RXC__RGMII_RXC         0=
x1b030
> +                               MX6QDL_PAD_RGMII_RD0__RGMII_RD0         0=
x1b030
> +                               MX6QDL_PAD_RGMII_RD1__RGMII_RD1         0=
x1b030
> +                               MX6QDL_PAD_RGMII_RD2__RGMII_RD2         0=
x1b030
> +                               MX6QDL_PAD_RGMII_RD3__RGMII_RD3         0=
x1b030
> +                               MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL   0=
x1b030
> +                       >;
> +               };
> +
> +               pinctrl_hdmi_cec: hdmicecgrp {
> +                       fsl,pins =3D <
> +                               MX6QDL_PAD_EIM_A25__HDMI_TX_CEC_LINE    0=
x1f8b0
> +                       >;
> +               };
> +
> +               pinctrl_i2c2: i2c2grp {
> +                       fsl,pins =3D <
> +                               MX6QDL_PAD_EIM_EB2__I2C2_SCL            0=
x4001b8b1
> +                               MX6QDL_PAD_KEY_ROW3__I2C2_SDA           0=
x4001b8b1
> +                       >;
> +               };
> +
> +               pinctrl_i2c3: i2c3grp {
> +                       fsl,pins =3D <
> +                               MX6QDL_PAD_GPIO_5__I2C3_SCL             0=
x4001b8b1
> +                               MX6QDL_PAD_GPIO_6__I2C3_SDA             0=
x4001b8b1
> +                       >;
> +               };
> +
> +               pinctrl_ipu1_csi0: ipu1csi0grp {
> +                       fsl,pins =3D <
> +                               MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12  =
  0x1b0b0
> +                               MX6QDL_PAD_CSI0_DAT13__IPU1_CSI0_DATA13  =
  0x1b0b0
> +                               MX6QDL_PAD_CSI0_DAT14__IPU1_CSI0_DATA14  =
  0x1b0b0
> +                               MX6QDL_PAD_CSI0_DAT15__IPU1_CSI0_DATA15  =
  0x1b0b0
> +                               MX6QDL_PAD_CSI0_DAT16__IPU1_CSI0_DATA16  =
  0x1b0b0
> +                               MX6QDL_PAD_CSI0_DAT17__IPU1_CSI0_DATA17  =
  0x1b0b0
> +                               MX6QDL_PAD_CSI0_DAT18__IPU1_CSI0_DATA18  =
  0x1b0b0
> +                               MX6QDL_PAD_CSI0_DAT19__IPU1_CSI0_DATA19  =
  0x1b0b0
> +                               MX6QDL_PAD_CSI0_PIXCLK__IPU1_CSI0_PIXCLK =
  0x1b0b0
> +                               MX6QDL_PAD_CSI0_MCLK__IPU1_CSI0_HSYNC    =
  0x1b0b0
> +                               MX6QDL_PAD_CSI0_VSYNC__IPU1_CSI0_VSYNC   =
  0x1b0b0
> +                       >;
> +               };
> +
> +               pinctrl_ov2659: ov2659grp {
> +                       fsl,pins =3D <
> +                               MX6QDL_PAD_GPIO_16__GPIO7_IO11 0x1b0b0
> +                               MX6QDL_PAD_GPIO_7__GPIO1_IO07 0x1b0b0
> +                       >;
> +               };
> +
> +               pinctrl_uart4: uart4grp {
> +                       fsl,pins =3D <
> +                               MX6QDL_PAD_KEY_COL0__UART4_TX_DATA      0=
x1b0b1
> +                               MX6QDL_PAD_KEY_ROW0__UART4_RX_DATA      0=
x1b0b1
> +                       >;
> +               };
> +
> +               pinctrl_usbotg: usbotggrp {
> +                       fsl,pins =3D <
> +                               MX6QDL_PAD_ENET_RX_ER__USB_OTG_ID       0=
x17059
> +                       >;
> +               };
> +
> +               pinctrl_usdhc1: usdhc1grp {
> +                       fsl,pins =3D <
> +                               MX6QDL_PAD_SD1_CMD__SD1_CMD             0=
x17059
> +                               MX6QDL_PAD_SD1_CLK__SD1_CLK             0=
x10059
> +                               MX6QDL_PAD_SD1_DAT0__SD1_DATA0          0=
x17059
> +                               MX6QDL_PAD_SD1_DAT1__SD1_DATA1          0=
x17059
> +                               MX6QDL_PAD_SD1_DAT2__SD1_DATA2          0=
x17059
> +                               MX6QDL_PAD_SD1_DAT3__SD1_DATA3          0=
x17059
> +                               MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28       0=
x1b0b0
> +                       >;
> +               };
> +
> +               pinctrl_usdhc2: usdhc2grp {
> +                       fsl,pins =3D <
> +                               MX6QDL_PAD_SD2_CMD__SD2_CMD             0=
x17059
> +                               MX6QDL_PAD_SD2_CLK__SD2_CLK             0=
x10059
> +                               MX6QDL_PAD_SD2_DAT0__SD2_DATA0          0=
x17059
> +                               MX6QDL_PAD_SD2_DAT1__SD2_DATA1          0=
x17059
> +                               MX6QDL_PAD_SD2_DAT2__SD2_DATA2          0=
x17059
> +                               MX6QDL_PAD_SD2_DAT3__SD2_DATA3          0=
x17059
> +                       >;
> +               };
> +
> +               pinctrl_usdhc3: usdhc3grp {
> +                       fsl,pins =3D <
> +                               MX6QDL_PAD_SD3_CMD__SD3_CMD             0=
x17059
> +                               MX6QDL_PAD_SD3_CLK__SD3_CLK             0=
x10059
> +                               MX6QDL_PAD_SD3_DAT0__SD3_DATA0          0=
x17059
> +                               MX6QDL_PAD_SD3_DAT1__SD3_DATA1          0=
x17059
> +                               MX6QDL_PAD_SD3_DAT2__SD3_DATA2          0=
x17059
> +                               MX6QDL_PAD_SD3_DAT3__SD3_DATA3          0=
x17059
> +                               MX6QDL_PAD_SD3_DAT4__SD3_DATA4          0=
x17059
> +                               MX6QDL_PAD_SD3_DAT5__SD3_DATA5          0=
x17059
> +                               MX6QDL_PAD_SD3_DAT6__SD3_DATA6          0=
x17059
> +                               MX6QDL_PAD_SD3_DAT7__SD3_DATA7          0=
x17059
> +                       >;
> +               };
> +
> +               pinctrl_wdog: wdoggrp {
> +                       fsl,pins =3D <
> +                               MX6QDL_PAD_GPIO_1__WDOG2_B              0=
x1b0b0
> +                       >;
> +               };
> +       };
> +
> +       gpio_leds {
> +               pinctrl_gpio_leds: gpioledsgrp {
> +                       fsl,pins =3D <
> +                               MX6QDL_PAD_KEY_COL1__GPIO4_IO08 0x1b0b0
> +                       >;
> +               };
> +       };
> +};
> +
> +&uart4 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_uart4>;
> +       status =3D "okay";
> +};
> +
> +&usbh1 {
> +       vbus-supply =3D <&reg_usb_h1_vbus>;
> +       status =3D "okay";
> +};
> +
> +&usbotg {
> +       vbus-supply =3D <&reg_usb_otg_vbus>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_usbotg>;
> +       disable-over-current;
> +       status =3D "okay";
> +};
> +
> +&usdhc1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_usdhc1>;
> +       bus-width =3D <4>;
> +       cd-gpios =3D <&gpio1 28 GPIO_ACTIVE_LOW>;
> +       status =3D "okay";
> +};
> +
> +&usdhc2 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_usdhc2>;
> +       bus-width =3D <4>;
> +       cd-gpios =3D <&gpio2 0 GPIO_ACTIVE_LOW>;
> +       wp-gpios =3D <&gpio2 1 GPIO_ACTIVE_HIGH>;
> +       status =3D "disabled";
> +};
> +
> +&usdhc3 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_usdhc3>;
> +       bus-width =3D <8>;
> +       non-removable;
> +       no-1-8-v;
> +       status =3D "okay";
> +};
> +
> +&wdog1 {
> +       status =3D "okay";
> +};
> +
> +&wdog2 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_wdog>;
> +       fsl,ext-reset-output;
> +       status =3D "disabled";
> +};
> --
> 2.7.4
>
