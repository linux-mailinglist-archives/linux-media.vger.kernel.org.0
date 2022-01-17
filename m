Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAAE8490856
	for <lists+linux-media@lfdr.de>; Mon, 17 Jan 2022 13:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236811AbiAQMJw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jan 2022 07:09:52 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34554 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236760AbiAQMJv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jan 2022 07:09:51 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38D65596;
        Mon, 17 Jan 2022 13:09:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642421390;
        bh=+fIlUxKgWiAhDk3+NeK46K+HXm8uAec1gra6f/nPfSc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DFHPpiYu7MsTK+wN3suBbqOMsxY1VDWtOMfaVlXaWHul1WqzSno5i8I65E4d0R+Kg
         aqlZBrCRgQ3uIFyoa4TVxkTc/6yp4rr7Ir+LD/zrLMIzGvdQWqrCxX/CjSNcKHHfYp
         ucNv6PhuMSXBrySVjDiSw24Csd3c3DmeIvuOpke8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211216163439.139579-5-jacopo+renesas@jmondi.org>
References: <20211216163439.139579-1-jacopo+renesas@jmondi.org> <20211216163439.139579-5-jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v8 4/7] arm64: dts: renesas: condor: Enable MAX9286
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Date:   Mon, 17 Jan 2022 12:09:47 +0000
Message-ID: <164242138750.10801.12504005374537076233@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Jacopo Mondi (2021-12-16 16:34:36)
> Enable the MAX9286 GMSL deserializers on Condor-V3H board.
>=20
> Connected cameras should be defined in a device-tree overlay or included
> after these definitions.
>=20
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

This looks good to me. It now enables the CSI2s, and the max9286 will
have no children. Will this create a completed media graph that simply
has no cameras connected? Or will the max9286 return a failure if there
are no devices attached.

I could look this up I guess, but I'm only curious of what potential
side effects there are of having a now successfully probed CSI2
receiver/VIN but without any cameras.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  .../boot/dts/renesas/r8a77980-condor.dts      | 193 ++++++++++++++++++
>  1 file changed, 193 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts b/arch/arm64=
/boot/dts/renesas/r8a77980-condor.dts
> index 3d6d10c82f48..2eb2b852ddca 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> @@ -6,6 +6,8 @@
>   * Copyright (C) 2018 Cogent Embedded, Inc.
>   */
> =20
> +#include <dt-bindings/gpio/gpio.h>
> +
>  /dts-v1/;
>  #include "r8a77980.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
> @@ -108,6 +110,34 @@ channel0 {
>         };
>  };
> =20
> +&csi40 {
> +       status =3D "okay";
> +
> +       ports {
> +               port@0 {
> +                       csi40_in: endpoint {
> +                               clock-lanes =3D <0>;
> +                               data-lanes =3D <1 2 3 4>;
> +                               remote-endpoint =3D <&max9286_out0>;
> +                       };
> +               };
> +       };
> +};
> +
> +&csi41 {
> +       status =3D "okay";
> +
> +       ports {
> +               port@0 {
> +                       csi41_in: endpoint {
> +                               clock-lanes =3D <0>;
> +                               data-lanes =3D <1 2 3 4>;
> +                               remote-endpoint =3D <&max9286_out1>;
> +                       };
> +               };
> +       };
> +};
> +
>  &du {
>         clocks =3D <&cpg CPG_MOD 724>,
>                  <&x1_clk>;
> @@ -200,6 +230,164 @@ adv7511_out: endpoint {
>         };
>  };
> =20
> +&i2c1 {
> +       pinctrl-0 =3D <&i2c1_pins>;
> +       pinctrl-names =3D "default";
> +
> +       status =3D "okay";
> +       clock-frequency =3D <400000>;
> +
> +       gmsl0: gmsl-deserializer@48 {
> +               compatible =3D "maxim,max9286";
> +               reg =3D <0x48>;
> +
> +               maxim,gpio-poc =3D <0 GPIO_ACTIVE_LOW>;
> +               enable-gpios =3D <&io_expander0 0 GPIO_ACTIVE_HIGH>;
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@0 {
> +                               reg =3D <0>;
> +                       };
> +
> +                       port@1 {
> +                               reg =3D <1>;
> +                       };
> +
> +                       port@2 {
> +                               reg =3D <2>;
> +                       };
> +
> +                       port@3 {
> +                               reg =3D <3>;
> +                       };
> +
> +                       port@4 {
> +                               reg =3D <4>;
> +                               max9286_out0: endpoint {
> +                                       clock-lanes =3D <0>;
> +                                       data-lanes =3D <1 2 3 4>;
> +                                       remote-endpoint =3D <&csi40_in>;
> +                               };
> +                       };
> +               };
> +
> +               i2c-mux {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       i2c@0 {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               reg =3D <0>;
> +
> +                               status =3D "disabled";
> +                       };
> +
> +                       i2c@1 {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               reg =3D <1>;
> +
> +                               status =3D "disabled";
> +                       };
> +
> +                       i2c@2 {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               reg =3D <2>;
> +
> +                               status =3D "disabled";
> +                       };
> +
> +                       i2c@3 {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               reg =3D <3>;
> +
> +                               status =3D "disabled";
> +                       };
> +               };
> +       };
> +
> +       gmsl1: gmsl-deserializer@4a {
> +               compatible =3D "maxim,max9286";
> +               reg =3D <0x4a>;
> +
> +               maxim,gpio-poc =3D <0 GPIO_ACTIVE_LOW>;
> +               enable-gpios =3D <&io_expander1 0 GPIO_ACTIVE_HIGH>;
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@0 {
> +                               reg =3D <0>;
> +                       };
> +
> +                       port@1 {
> +                               reg =3D <1>;
> +                       };
> +
> +                       port@2 {
> +                               reg =3D <2>;
> +                       };
> +
> +                       port@3 {
> +                               reg =3D <3>;
> +                       };
> +
> +                       port@4 {
> +                               reg =3D <4>;
> +                               max9286_out1: endpoint {
> +                                       clock-lanes =3D <0>;
> +                                       data-lanes =3D <1 2 3 4>;
> +                                       remote-endpoint =3D <&csi41_in>;
> +                               };
> +                       };
> +               };
> +
> +               i2c-mux {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       i2c@0 {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               reg =3D <0>;
> +
> +                               status =3D "disabled";
> +                       };
> +
> +                       i2c@1 {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               reg =3D <1>;
> +
> +                               status =3D "disabled";
> +                       };
> +
> +                       i2c@2 {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               reg =3D <2>;
> +
> +                               status =3D "disabled";
> +                       };
> +
> +                       i2c@3 {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               reg =3D <3>;
> +
> +                               status =3D "disabled";
> +                       };
> +               };
> +       };
> +};
> +
>  &lvds0 {
>         status =3D "okay";
> =20
> @@ -256,6 +444,11 @@ i2c0_pins: i2c0 {
>                 function =3D "i2c0";
>         };
> =20
> +       i2c1_pins: i2c1 {
> +               groups =3D "i2c1";
> +               function =3D "i2c1";
> +       };
> +
>         mmc_pins: mmc {
>                 groups =3D "mmc_data8", "mmc_ctrl", "mmc_ds";
>                 function =3D "mmc";
> --=20
> 2.33.1
>
