Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49EBD490811
	for <lists+linux-media@lfdr.de>; Mon, 17 Jan 2022 13:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236948AbiAQMAS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jan 2022 07:00:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236929AbiAQMAP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jan 2022 07:00:15 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71EE0C061574;
        Mon, 17 Jan 2022 04:00:15 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04862A24;
        Mon, 17 Jan 2022 13:00:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642420813;
        bh=qRTlWv2Ub7xpP+bGntqMfYYYr0MJd+k4Q04yGENOdKQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DQN1t3YpEkLT8F2BoS0kVpbtN3Rv+tar40R1Z7HVxYg3GW1i/hkLDZ5pqUd/2XagY
         eyUCU5P9uqWv3+l9xndNk6/dcKRY5Q6v3pkjZMk+TYTe3jTzjfF93rFj1Gq8b5MSnm
         UeeY0fddmG6ZYgQOkQesKyE40knvMlE+dsfqwVTg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211216163439.139579-6-jacopo+renesas@jmondi.org>
References: <20211216163439.139579-1-jacopo+renesas@jmondi.org> <20211216163439.139579-6-jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v8 5/7] arm64: dts: renesas: eagle: Enable MAX9286
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
Date:   Mon, 17 Jan 2022 12:00:10 +0000
Message-ID: <164242081073.10801.9311496848945450615@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Jacopo Mondi (2021-12-16 16:34:37)
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
>=20
> Enable the MAX9286 GMSL deserializer on the Eagle-V3M board.
>=20
> Connected cameras should be defined in a device-tree overlay or included
> after these definitions.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Aha, this looks like it has changed a little from what I would have
originally created, but I think it's good this way.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../arm64/boot/dts/renesas/r8a77970-eagle.dts | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/=
boot/dts/renesas/r8a77970-eagle.dts
> index b579d3189a93..91b9fab6afbc 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -6,6 +6,8 @@
>   * Copyright (C) 2017 Cogent Embedded, Inc.
>   */
> =20
> +#include <dt-bindings/gpio/gpio.h>
> +
>  /dts-v1/;
>  #include "r8a77970.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
> @@ -200,6 +202,11 @@ i2c0_pins: i2c0 {
>                 function =3D "i2c0";
>         };
> =20
> +       i2c3_pins: i2c3 {
> +               groups =3D "i2c3_a";
> +               function =3D "i2c3";
> +       };
> +
>         qspi0_pins: qspi0 {
>                 groups =3D "qspi0_ctrl", "qspi0_data4";
>                 function =3D "qspi0";
> @@ -278,6 +285,103 @@ &rwdt {
>         status =3D "okay";
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
> +&i2c3 {
> +       pinctrl-0 =3D <&i2c3_pins>;
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
> +               enable-gpios =3D <&io_expander 0 GPIO_ACTIVE_HIGH>;
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
> +};
> +
>  &scif0 {
>         pinctrl-0 =3D <&scif0_pins>;
>         pinctrl-names =3D "default";
> --=20
> 2.33.1
>
