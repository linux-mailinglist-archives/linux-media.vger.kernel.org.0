Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E40F175EEF
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 16:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbgCBP56 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 10:57:58 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46177 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727085AbgCBP56 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 10:57:58 -0500
Received: by mail-ot1-f65.google.com with SMTP id g96so10156336otb.13;
        Mon, 02 Mar 2020 07:57:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nito/nrZsWtOKekEZGAYljgXMNzrk2/5S3aE/Pp6hpw=;
        b=TQLDPo0hedRA5ly3wzJN2d18s/slzog7hkmx7qYItkl/maRDpnuKo4J0W3wo+or3FW
         evEeS6hQ9Q123MkMH/YRvnKefV1Y7CkQPtJ8X987sU9OSqXOiiciSM+fzkY8qMI4h3gd
         hkAUt2yLG0zBY40MQhjKup6vcc2lpNYEyqJjFncXGzMD/020tEGEAVE14BQ3DOXL+3Fh
         ivjYXgxCeeb31BkG9I0nLeh8IPJ2IuuABltmj2GGSNt8eRr3R9CgVphM2A3p7xBn2j+C
         1UD5iyU9DrRSElnh1Lgkb4n6Cu39j0jPHmEAbyYcamSkohju8T9yjmsbOxq5dpFw3DW0
         b4UA==
X-Gm-Message-State: APjAAAXjn+kAZeIbZmOuwKJfZevDQKf9wgDQm554a3J5y7BAfE4DC5PF
        E05vLcKvnyB5QmGK2bAPppGtQrC+jTK86++fpcQ=
X-Google-Smtp-Source: APXvYqxZfeCMUCmPDo150isft8U19jV/qbujmuP/cdQANvFKK6654BGfmN/KgnrbsmahhA2IQQrudvzS3H3CA0ko0Eg=
X-Received: by 2002:a05:6830:100e:: with SMTP id a14mr13887882otp.297.1583164677024;
 Mon, 02 Mar 2020 07:57:57 -0800 (PST)
MIME-Version: 1.0
References: <20200228170210.18252-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200228170210.18252-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 Mar 2020 16:57:35 +0100
Message-ID: <CAMuHMdUn9njDRWZPcSD87YuejmhNvDK3pUqL5kXNX6KA-8Y72g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0-cat874: Add support for
 AISTARVISION MIPI Adapter V2.1
To:     Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad,

CC linux-media

On Fri, Feb 28, 2020 at 6:02 PM Lad Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> This patch adds support AISTARVISION MIPI Adapter V2.1 board connected
> to G2E board. Common file aistarvision-mipi-adapter-2.1.dtsi is created
> which have the camera endpoint nodes with disabled status and in
> r8a774c0-ek874-mipi-2.1.dts file VIN/CSI nodes are enabled. By default
> imx219 endpoint is tied with CSI2.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> Geert/Rob since the imx219 driver is yet to make into mainline
> but has been merged into media-subsystem I would like to take
> this patch via media-tree.

Usually DTS patches are merged through renesas-devel and arm-soc, not
through a driver's subsystems tree.  This is done to avoid merge
conflicts.  I prefer not to deviate from that, unless there is a very
good reason to do so.

Is there any dependency on the code in the media tree that I'm missing?
Once DT bindings have been accepted in a subsystem maintainer's tree,
you can start using them in DTS files.

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the AISTARVISION MIPI Adapter V2.1
> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */
> +
> +/ {
> +       ov5645_vdddo_1v8: 1p8v {
> +               compatible = "regulator-fixed";
> +               regulator-name = "camera_vdddo";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-always-on;
> +       };
> +
> +       ov5645_vdda_2v8: 2p8v {
> +               compatible = "regulator-fixed";
> +               regulator-name = "camera_vdda";
> +               regulator-min-microvolt = <2800000>;
> +               regulator-max-microvolt = <2800000>;
> +               regulator-always-on;
> +       };
> +
> +       ov5645_vddd_1v5: 1p5v {
> +               compatible = "regulator-fixed";
> +               regulator-name = "camera_vddd";
> +               regulator-min-microvolt = <1500000>;
> +               regulator-max-microvolt = <1500000>;
> +               regulator-always-on;
> +       };
> +
> +       imx219_vana_2v8: 2p8v {
> +               compatible = "regulator-fixed";
> +               regulator-name = "camera_vana";
> +               regulator-min-microvolt = <2800000>;
> +               regulator-max-microvolt = <2800000>;
> +               regulator-always-on;
> +       };
> +
> +       imx219_vdig_1v8: 1p8v {
> +               compatible = "regulator-fixed";
> +               regulator-name = "camera_vdig";
> +               regulator-min-microvolt = <1500000>;
> +               regulator-max-microvolt = <1500000>;
> +               regulator-always-on;
> +       };
> +
> +       imx219_vddl_1v2: 1p2v {
> +               compatible = "regulator-fixed";
> +               regulator-name = "camera_vddl";
> +               regulator-min-microvolt = <1200000>;
> +               regulator-max-microvolt = <1200000>;
> +               regulator-always-on;
> +       };
> +
> +       imx219_clk: imx219_clk {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <24000000>;
> +       };
> +};
> +
> +&MIPI_PARENT_I2C {
> +       ov5645: ov5645@3c {
> +               compatible = "ovti,ov5645";
> +               reg = <0x3c>;
> +               status = "disabled";

Is there any real need to disable this node here?
Do you envision anyone including this .dtsi file, and not enabling this
node?

> +
> +               clock-names = "xclk";
> +
> +               vdddo-supply = <&ov5645_vdddo_1v8>;
> +               vdda-supply = <&ov5645_vdda_2v8>;
> +               vddd-supply = <&ov5645_vddd_1v5>;
> +
> +               port@0 {

DT bindings say "port", without unit-address.

> +                       ov5645_ep: endpoint {
> +                       };
> +               };
> +       };
> +
> +       rpi_v2_camera: imx219@10 {
> +               compatible = "sony,imx219";
> +               reg = <0x10>;
> +               status = "disabled";

Likewise.

> +
> +               VANA-supply = <&imx219_vana_2v8>;
> +               VDIG-supply = <&imx219_vdig_1v8>;
> +               VDDL-supply = <&imx219_vddl_1v2>;
> +               clocks = <&imx219_clk>;
> +
> +               port@0 {

DT bindings say "port", without unit-address...

> +                       reg = <0>;

... and thus no "reg" property.

> +                       imx219_ep0: endpoint {
> +                       };
> +               };
> +       };
> +};
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
> new file mode 100644
> index 000000000000..435b7f62d88d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the Silicon Linux RZ/G2E 96board platform (CAT874)
> + * connected with aistarvision-mipi-v2-adapter board
> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r8a774c0-ek874.dts"
> +#define MIPI_PARENT_I2C i2c3
> +#include "aistarvision-mipi-adapter-2.1.dtsi"
> +
> +/ {
> +       model = "Silicon Linux RZ/G2E evaluation kit EK874 (CAT874 + CAT875) with aistarvision-mipi-v2-adapter board";
> +       compatible = "si-linux,cat875", "si-linux,cat874", "renesas,r8a774c0";
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +};
> +
> +&vin4 {
> +       status = "okay";
> +};
> +
> +&vin5 {
> +       status = "okay";
> +};
> +
> +&csi40 {
> +       status = "okay";
> +
> +       ports {
> +               port@0 {
> +                       reg = <0>;
> +
> +                       csi40_in: endpoint {
> +                               clock-lanes = <0>;
> +                               data-lanes = <1 2>;
> +                               remote-endpoint = <&imx219_ep0>;
> +                       };
> +               };
> +       };
> +};
> +
> +&ov5645 {
> +       /* uncomment status and remote-endpoint properties to tie ov5645
> +        * to CSI2 also make sure remote-endpoint for imx219 camera is
> +        * commented and remote endpoint in csi40_in is ov5645_ep
> +        */
> +       /* status = "okay"; */
> +
> +       #address-cells = <1>;
> +       #size-cells = <0>;

#{address,size}-cells not needed.

> +       enable-gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
> +       reset-gpios = <&gpio5 3 GPIO_ACTIVE_LOW>;
> +
> +       clocks = <&cpg CPG_MOD 716>;
> +       clock-frequency = <24000000>;

I know this is dictated by the DT bindings for the ov5645 camera, but
specifying a clock rate is usually done through assigned-clock-rates,
cfr.  Documentation/devicetree/bindings/clock/clock-bindings.txt.

> +
> +       port@0 {

port {

> +               ov5645_ep: endpoint {
> +                       clock-lanes = <0>;
> +                       data-lanes = <1 2>;
> +                       /* remote-endpoint = <&csi40_in>; */
> +               };
> +       };
> +};
> +
> +&rpi_v2_camera {
> +       status = "okay";
> +
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       port@0 {
> +               reg = <0>;

port {

> +               imx219_ep0: endpoint {
> +                       clock-lanes = <0>;
> +                       data-lanes = <1 2>;
> +                       remote-endpoint = <&csi40_in>;
> +                       link-frequencies = /bits/ 64 <456000000>;
> +               };
> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
