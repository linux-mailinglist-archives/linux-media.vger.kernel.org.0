Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C8036E828
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 11:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237378AbhD2JsI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 05:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbhD2JsI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 05:48:08 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCFFAC06138B;
        Thu, 29 Apr 2021 02:47:21 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id v13so20862068ple.9;
        Thu, 29 Apr 2021 02:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FQwFctRouO5vsmEcxiKFQuQpzfk3pbLJLDtpCAMQVok=;
        b=NItyHfz4W18jREuUBKD71PQREYxCj79MJXkFsS7UdGBTfkN1OERvGB2nqqJnCkMLE2
         3fH/QO9HrcO6eeOHPTTEcWk879lBlOmk3txhjvHIEb1m6kVu+xr93TpHHdf/rvDap7tE
         MBF86N1G1Bx1tYGO7Y20WCU7MAV234bHrhlnKov/0e1d0hv2xAX5oLpj1VcBcqQhSmgx
         VbMvnzL3yIoe16F1fEs0sFma8PPde6qnC53KlspWwhhMAXZgRFmVF3k/68s/ineapvt4
         kQ39k/pl4N1qJclJ3idU3idtW7GlPEqXqM3wTsqNl2vMxiawyImq+IpshAaJu63G4ACZ
         lu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FQwFctRouO5vsmEcxiKFQuQpzfk3pbLJLDtpCAMQVok=;
        b=K0qBOFR7HeRNR3lZ6tTsp5eB3Rf53IsXT3zSAVGn4dINQv7Ge6xQ70v62Kd5KlUuF+
         HPRrb9Z44oFBtcsGbZGKpWw+UQ6MC94IorsNgkJvkPrACncBbqcUTZJ3ZUBSt6043pPE
         VURMjdY/7c8JexU4LU4fIXZh4QcEuzARwg1EbcBt65YKqqdZD0wi/2sxUBVgHUnRz3lF
         XHQDTQb2X1jOcaqXqp7+XNttSfag6AJuEx/uwlUpLp4oJfCAdGv7RAB2oyUlQ1UBnAdd
         0bA8mhCYcm8vLw7+7780m0nGGk7Ir30CpGhltZdBU8iOnU35rPVDYkTjm+e+/9j0yAe4
         6dgA==
X-Gm-Message-State: AOAM532YwsHGh9rizygfqvSQvbJFWdnx7Lx/3Cp5EWShJYoIPAjiIN7M
        N1orvkhhdMDow5FVDr9rOzXdHRJaA2AXdk5xmck=
X-Google-Smtp-Source: ABdhPJzuAuJegIYj34o/4PgcFi5Z+46YZqGtepu3GMVgI7HwB3orxDHgZo6ade/Pk/XdynOETH+te3RG2c53guUkzbI=
X-Received: by 2002:a17:90a:dc81:: with SMTP id j1mr2138356pjv.115.1619689641245;
 Thu, 29 Apr 2021 02:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <1618976938-20834-1-git-send-email-dillon.minfei@gmail.com> <1618976938-20834-4-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1618976938-20834-4-git-send-email-dillon.minfei@gmail.com>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Thu, 29 Apr 2021 17:46:45 +0800
Message-ID: <CAL9mu0LxeQV8w3+EWwOpqNbQsbK31aSpob6mGGBfYoaV3ZWEPQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm: dts: imx: Add i.mx6q DaSheng COM-9XX SBC
 board support
To:     Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        leoyang.li@nxp.com, arnd@arndb.de, olof@lixom.net,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        prabhakar.csengg@gmail.com, mchehab@kernel.org,
        mchehab+huawei@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-imx@nxp.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Just a gentle ping.

Thanks

Best Regards
Dillon

On Wed, Apr 21, 2021 at 11:49 AM <dillon.minfei@gmail.com> wrote:
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
> v4:
> - change 'green' to 'led-0', fix dtbs_check warrning
> - change 'pmic: pfuze100@8' to 'pfuze100: pmic@8', fix dtbs_check warrning
> - use GPIO_ACTIVE_HIGH instead of 0, from Fabio's suggestion, thanks
> - change 'flash: m25p80@0' to 'm25p80: flash@0'
> - move 'MX6QDL_PAD_GPIO_0__CCM_CLKO1' to pinctrl_ov2659{}
> - move 'MX6QDL_PAD_NANDF_D0__GPIO2_IO00, MX6QDL_PAD_NANDF_D1__GPIO2_IO01'
>   to pinctrl_usdhc2_gpioio{}
> - remove unused hoggrp
> - use wdog2, instead of wdog1 for external reset
>
>  arch/arm/boot/dts/Makefile        |   1 +
>  arch/arm/boot/dts/imx6q-ds.dts    |  17 ++
>  arch/arm/boot/dts/imx6qdl-ds.dtsi | 460 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 478 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6q-ds.dts
>  create mode 100644 arch/arm/boot/dts/imx6qdl-ds.dtsi
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index a19c5ab9df84..425fe17ef7c1 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -510,6 +510,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
>         imx6q-display5-tianma-tm070-1280x768.dtb \
>         imx6q-dmo-edmqmx6.dtb \
>         imx6q-dms-ba16.dtb \
> +       imx6q-ds.dtb \
>         imx6q-emcon-avari.dtb \
>         imx6q-evi.dtb \
>         imx6q-gk802.dtb \
> diff --git a/arch/arm/boot/dts/imx6q-ds.dts b/arch/arm/boot/dts/imx6q-ds.dts
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
> +       model = "DaSheng i.MX6 Quad Com-9xx Board";
> +       compatible = "ds,imx6q-sbc", "fsl,imx6q";
> +};
> diff --git a/arch/arm/boot/dts/imx6qdl-ds.dtsi b/arch/arm/boot/dts/imx6qdl-ds.dtsi
> new file mode 100644
> index 000000000000..a2069caf4ea7
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6qdl-ds.dtsi
> @@ -0,0 +1,460 @@
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
> +               stdout-path = &uart4;
> +       };
> +
> +       memory@10000000 {
> +               device_type = "memory";
> +               reg = <0x10000000 0x80000000>;
> +       };
> +
> +       reg_usb_otg_vbus: regulator-usb-otg-vbus {
> +               compatible = "regulator-fixed";
> +               regulator-name = "usb_otg_vbus";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               regulator-always-on;
> +       };
> +
> +       reg_usb_h1_vbus: regulator-usb-h1-vbus {
> +               compatible = "regulator-fixed";
> +               regulator-name = "usb_h1_vbus";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               regulator-always-on;
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_gpio_leds>;
> +
> +               led-0 {
> +                       gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>;
> +                       default-state = "on";
> +                       linux,default-trigger = "heartbeat";
> +               };
> +       };
> +};
> +
> +&ipu1_csi0_from_ipu1_csi0_mux {
> +       bus-width = <8>;
> +       data-shift = <12>; /* Lines 19:12 used */
> +       hsync-active = <1>;
> +       vsync-active = <1>;
> +};
> +
> +&ipu1_csi0_mux_from_parallel_sensor {
> +       remote-endpoint = <&ov2659_to_ipu1_csi0_mux>;
> +};
> +
> +&ipu1_csi0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_ipu1_csi0>;
> +       status = "okay";
> +};
> +
> +&ecspi1 {
> +       cs-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_ecspi1>, <&pinctrl_ecspi1_gpio>;
> +       status = "okay";
> +
> +       m25p80: flash@0 {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               compatible = "st,m25p80", "jedec,spi-nor";
> +               spi-max-frequency = <20000000>;
> +               reg = <0>;
> +       };
> +};
> +
> +&fec {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_enet>;
> +       phy-mode = "rgmii-id";
> +       phy-handle = <&phy>;
> +       fsl,magic-packet;
> +       status = "okay";
> +
> +       mdio {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               phy: ethernet-phy@1 {
> +                       reg = <1>;
> +                       qca,clk-out-frequency = <125000000>;
> +                       reset-gpios = <&gpio4 10 GPIO_ACTIVE_LOW>;
> +                       reset-assert-us = <10000>;
> +               };
> +       };
> +};
> +
> +&hdmi {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_hdmi_cec>;
> +       ddc-i2c-bus = <&i2c3>;
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       clock-frequency = <100000>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c2>;
> +       status = "okay";
> +
> +       pfuze100: pmic@8 {
> +               compatible = "fsl,pfuze100";
> +               reg = <0x08>;
> +
> +               regulators {
> +                       sw1a_reg: sw1ab {
> +                               regulator-min-microvolt = <300000>;
> +                               regulator-max-microvolt = <1875000>;
> +                               regulator-boot-on;
> +                               regulator-always-on;
> +                               regulator-ramp-delay = <6250>;
> +                       };
> +
> +                       sw1c_reg: sw1c {
> +                               regulator-min-microvolt = <300000>;
> +                               regulator-max-microvolt = <1875000>;
> +                               regulator-boot-on;
> +                               regulator-always-on;
> +                               regulator-ramp-delay = <6250>;
> +                       };
> +
> +                       sw2_reg: sw2 {
> +                               regulator-min-microvolt = <800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-boot-on;
> +                               regulator-always-on;
> +                               regulator-ramp-delay = <6250>;
> +                       };
> +
> +                       sw3a_reg: sw3a {
> +                               regulator-min-microvolt = <400000>;
> +                               regulator-max-microvolt = <1975000>;
> +                               regulator-boot-on;
> +                               regulator-always-on;
> +                       };
> +
> +                       sw3b_reg: sw3b {
> +                               regulator-min-microvolt = <400000>;
> +                               regulator-max-microvolt = <1975000>;
> +                               regulator-boot-on;
> +                               regulator-always-on;
> +                       };
> +
> +                       sw4_reg: sw4 {
> +                               regulator-min-microvolt = <800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       swbst_reg: swbst {
> +                               regulator-min-microvolt = <5000000>;
> +                               regulator-max-microvolt = <5150000>;
> +                       };
> +
> +                       snvs_reg: vsnvs {
> +                               regulator-min-microvolt = <1000000>;
> +                               regulator-max-microvolt = <3000000>;
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
> +                               regulator-min-microvolt = <800000>;
> +                               regulator-max-microvolt = <1550000>;
> +                       };
> +
> +                       vgen2_reg: vgen2 {
> +                               regulator-min-microvolt = <800000>;
> +                               regulator-max-microvolt = <1550000>;
> +                       };
> +
> +                       vgen3_reg: vgen3 {
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                       };
> +
> +                       vgen4_reg: vgen4 {
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       vgen5_reg: vgen5 {
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       vgen6_reg: vgen6 {
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-always-on;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c3 {
> +       clock-frequency = <100000>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c3>;
> +       status = "okay";
> +
> +       ov2659: camera@30 {
> +               compatible = "ovti,ov2659";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_ov2659>;
> +               clocks = <&clks IMX6QDL_CLK_CKO>;
> +               clock-names = "xvclk";
> +               reg = <0x30>;
> +               powerdown-gpios = <&gpio7 11 GPIO_ACTIVE_HIGH>;
> +               reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
> +               status = "okay";
> +
> +               port {
> +                       ov2659_to_ipu1_csi0_mux: endpoint {
> +                               remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
> +                               link-frequencies = /bits/ 64 <70000000>;
> +                               bus-width = <8>;
> +                               hsync-active = <1>;
> +                               vsync-active = <1>;
> +                       };
> +               };
> +       };
> +};
> +
> +&iomuxc {
> +       pinctrl_ecspi1: ecspi1grp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_EIM_D16__ECSPI1_SCLK         0x100b1
> +                       MX6QDL_PAD_EIM_D18__ECSPI1_MOSI         0x100b1
> +                       MX6QDL_PAD_EIM_D17__ECSPI1_MISO         0x100b1
> +               >;
> +       };
> +
> +       pinctrl_ecspi1_gpio: ecspi1grpgpiogrp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_KEY_ROW1__GPIO4_IO09         0x1b0b0
> +                       MX6QDL_PAD_ENET_RXD0__GPIO1_IO27        0x1b0b0
> +               >;
> +       };
> +
> +       pinctrl_enet: enetgrp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_ENET_MDIO__ENET_MDIO         0x1b0b0
> +                       MX6QDL_PAD_ENET_MDC__ENET_MDC           0x1b0b0
> +                       MX6QDL_PAD_RGMII_TXC__RGMII_TXC         0x1b030
> +                       MX6QDL_PAD_RGMII_TD0__RGMII_TD0         0x1b030
> +                       MX6QDL_PAD_RGMII_TD1__RGMII_TD1         0x1b030
> +                       MX6QDL_PAD_RGMII_TD2__RGMII_TD2         0x1b030
> +                       MX6QDL_PAD_RGMII_TD3__RGMII_TD3         0x1b030
> +                       MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL   0x1b030
> +                       MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK    0x1b0b0
> +                       MX6QDL_PAD_RGMII_RXC__RGMII_RXC         0x1b030
> +                       MX6QDL_PAD_RGMII_RD0__RGMII_RD0         0x1b030
> +                       MX6QDL_PAD_RGMII_RD1__RGMII_RD1         0x1b030
> +                       MX6QDL_PAD_RGMII_RD2__RGMII_RD2         0x1b030
> +                       MX6QDL_PAD_RGMII_RD3__RGMII_RD3         0x1b030
> +                       MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL   0x1b030
> +                       MX6QDL_PAD_KEY_COL2__GPIO4_IO10         0x1b0b0
> +               >;
> +       };
> +
> +       pinctrl_hdmi_cec: hdmicecgrp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_EIM_A25__HDMI_TX_CEC_LINE    0x1f8b0
> +               >;
> +       };
> +
> +       pinctrl_i2c2: i2c2grp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_EIM_EB2__I2C2_SCL            0x4001b8b1
> +                       MX6QDL_PAD_KEY_ROW3__I2C2_SDA           0x4001b8b1
> +               >;
> +       };
> +
> +       pinctrl_i2c3: i2c3grp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_GPIO_5__I2C3_SCL             0x4001b8b1
> +                       MX6QDL_PAD_GPIO_6__I2C3_SDA             0x4001b8b1
> +               >;
> +       };
> +
> +       pinctrl_ipu1_csi0: ipu1csi0grp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12    0x1b0b0
> +                       MX6QDL_PAD_CSI0_DAT13__IPU1_CSI0_DATA13    0x1b0b0
> +                       MX6QDL_PAD_CSI0_DAT14__IPU1_CSI0_DATA14    0x1b0b0
> +                       MX6QDL_PAD_CSI0_DAT15__IPU1_CSI0_DATA15    0x1b0b0
> +                       MX6QDL_PAD_CSI0_DAT16__IPU1_CSI0_DATA16    0x1b0b0
> +                       MX6QDL_PAD_CSI0_DAT17__IPU1_CSI0_DATA17    0x1b0b0
> +                       MX6QDL_PAD_CSI0_DAT18__IPU1_CSI0_DATA18    0x1b0b0
> +                       MX6QDL_PAD_CSI0_DAT19__IPU1_CSI0_DATA19    0x1b0b0
> +                       MX6QDL_PAD_CSI0_PIXCLK__IPU1_CSI0_PIXCLK   0x1b0b0
> +                       MX6QDL_PAD_CSI0_MCLK__IPU1_CSI0_HSYNC      0x1b0b0
> +                       MX6QDL_PAD_CSI0_VSYNC__IPU1_CSI0_VSYNC     0x1b0b0
> +               >;
> +       };
> +
> +       pinctrl_ov2659: ov2659grp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_GPIO_16__GPIO7_IO11          0x1b0b0
> +                       MX6QDL_PAD_GPIO_7__GPIO1_IO07           0x1b0b0
> +                       MX6QDL_PAD_GPIO_0__CCM_CLKO1            0x130b0
> +               >;
> +       };
> +
> +       pinctrl_uart4: uart4grp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_KEY_COL0__UART4_TX_DATA      0x1b0b1
> +                       MX6QDL_PAD_KEY_ROW0__UART4_RX_DATA      0x1b0b1
> +               >;
> +       };
> +
> +       pinctrl_usbotg: usbotggrp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_ENET_RX_ER__USB_OTG_ID       0x17059
> +               >;
> +       };
> +
> +       pinctrl_usdhc1: usdhc1grp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_SD1_CMD__SD1_CMD             0x17059
> +                       MX6QDL_PAD_SD1_CLK__SD1_CLK             0x10059
> +                       MX6QDL_PAD_SD1_DAT0__SD1_DATA0          0x17059
> +                       MX6QDL_PAD_SD1_DAT1__SD1_DATA1          0x17059
> +                       MX6QDL_PAD_SD1_DAT2__SD1_DATA2          0x17059
> +                       MX6QDL_PAD_SD1_DAT3__SD1_DATA3          0x17059
> +               >;
> +       };
> +
> +       pinctrl_usdhc1_gpio: usdhc1grpgpiogrp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28       0x1b0b0
> +               >;
> +       };
> +
> +       pinctrl_usdhc2: usdhc2grp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_SD2_CMD__SD2_CMD             0x17059
> +                       MX6QDL_PAD_SD2_CLK__SD2_CLK             0x10059
> +                       MX6QDL_PAD_SD2_DAT0__SD2_DATA0          0x17059
> +                       MX6QDL_PAD_SD2_DAT1__SD2_DATA1          0x17059
> +                       MX6QDL_PAD_SD2_DAT2__SD2_DATA2          0x17059
> +                       MX6QDL_PAD_SD2_DAT3__SD2_DATA3          0x17059
> +               >;
> +       };
> +
> +       pinctrl_usdhc2_gpio: usdhc2grpgpiogrp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_NANDF_D0__GPIO2_IO00         0x1b0b0
> +                       MX6QDL_PAD_NANDF_D1__GPIO2_IO01         0x1b0b0
> +               >;
> +       };
> +
> +       pinctrl_usdhc3: usdhc3grp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_SD3_CMD__SD3_CMD             0x17059
> +                       MX6QDL_PAD_SD3_CLK__SD3_CLK             0x10059
> +                       MX6QDL_PAD_SD3_DAT0__SD3_DATA0          0x17059
> +                       MX6QDL_PAD_SD3_DAT1__SD3_DATA1          0x17059
> +                       MX6QDL_PAD_SD3_DAT2__SD3_DATA2          0x17059
> +                       MX6QDL_PAD_SD3_DAT3__SD3_DATA3          0x17059
> +                       MX6QDL_PAD_SD3_DAT4__SD3_DATA4          0x17059
> +                       MX6QDL_PAD_SD3_DAT5__SD3_DATA5          0x17059
> +                       MX6QDL_PAD_SD3_DAT6__SD3_DATA6          0x17059
> +                       MX6QDL_PAD_SD3_DAT7__SD3_DATA7          0x17059
> +               >;
> +       };
> +
> +       pinctrl_wdog: wdoggrp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_GPIO_1__WDOG2_B              0x1b0b0
> +               >;
> +       };
> +
> +       pinctrl_gpio_leds: gpioledsgrp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_KEY_COL1__GPIO4_IO08 0x1b0b0
> +               >;
> +       };
> +};
> +
> +&uart4 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_uart4>;
> +       status = "okay";
> +};
> +
> +&usbh1 {
> +       vbus-supply = <&reg_usb_h1_vbus>;
> +       status = "okay";
> +};
> +
> +&usbotg {
> +       vbus-supply = <&reg_usb_otg_vbus>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_usbotg>;
> +       disable-over-current;
> +       status = "okay";
> +};
> +
> +&usdhc1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> +       bus-width = <4>;
> +       cd-gpios = <&gpio1 28 GPIO_ACTIVE_LOW>;
> +       status = "okay";
> +};
> +
> +&usdhc2 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +       bus-width = <4>;
> +       cd-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
> +       wp-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
> +       status = "disabled";
> +};
> +
> +&usdhc3 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_usdhc3>;
> +       bus-width = <8>;
> +       non-removable;
> +       no-1-8-v;
> +       status = "okay";
> +};
> +
> +&wdog1 {
> +       status = "disabled";
> +};
> +
> +&wdog2 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_wdog>;
> +       fsl,ext-reset-output;
> +       status = "okay";
> +};
> --
> 2.7.4
>
