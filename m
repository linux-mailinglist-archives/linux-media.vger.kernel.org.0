Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA3B177078
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 08:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727719AbgCCHvU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 02:51:20 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45182 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727594AbgCCHvT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 02:51:19 -0500
Received: by mail-oi1-f193.google.com with SMTP id v19so2040583oic.12;
        Mon, 02 Mar 2020 23:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dJERuTx1vkullBpFrugyde96NXj+cKMvr59e+mu+WbM=;
        b=MlBo0b/gyWKdLjihurXMRLLS62RKM7eV0he7zU20AHef4Kj7yXi5eRUfziwsvY97bP
         kCsaQVDZ6xFN2um0uw8PfiPhho7tEsNP5XjZ8fzz69lct+JY0Cg01vzu8Ie9QWSwB7B7
         5wB0EJ6dW6HfuKtnF3gyDWMzFBQlMpF5emVrF7MLh0Go77qle0a9V1bPiPt/YC0h+rs9
         YsBMjg1XQ9le4oq3unR+jMqDJSgYu+jPvpMfvkG2vjYUg9gYmnYnLiqQZBSQjV2nobTp
         aDxOam0ON6lMsPNfvsTzCJhslNgQh02i963gQmpmkV3HeHOrx2X1t+lzDo1/SgtYZ3ms
         CPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dJERuTx1vkullBpFrugyde96NXj+cKMvr59e+mu+WbM=;
        b=Hy5iyOJCzu7iJYS/LACXR3+K2YaC7RE+d44rRs0AnMcrgwj0Ilaw28VEdzPNwKo27D
         7nDLYzn2ToQ8IgG2u+fDTBgAm2CAT0olkfxyeLYYqaJlDL3PYHMv00dtavlp0Vv3KhaW
         0LskDBAV4EYJPvzZ2aEmif8Zd7QqX98m4oA3vAarKiDPwgyUwcqfqUOyPgzEpvditJEf
         n1s7LkEbOhsW9g9OmBxGyqcpTQiuKsTRk0QiGbTdL9VuKy3DSoOKvqKrEt/MxWie5zBz
         Q2yXpAudsqXRHgaer1e9eUajT3Wb6tY843ewFVcmNSHLaHume4VTnax+cuDDzfceWUkl
         fJFw==
X-Gm-Message-State: ANhLgQ1dW1lqv42sjFHYgQ1tsZ6kXQM87Xgx5Js8qt6BNNewYQ5mby54
        XiSg/T57xDsVoAerHUEI3IQUM937EcjPErU5alY=
X-Google-Smtp-Source: ADFU+vvfbkXj9GPHK9S6fg3tKEYes3+kVrH58hc6DAWJUCxC/mk23r7PfL8YDItBVc4eUdfv9Ulavx8aCkysABUlWoA=
X-Received: by 2002:aca:524a:: with SMTP id g71mr1625639oib.7.1583221878584;
 Mon, 02 Mar 2020 23:51:18 -0800 (PST)
MIME-Version: 1.0
References: <20200228170210.18252-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUn9njDRWZPcSD87YuejmhNvDK3pUqL5kXNX6KA-8Y72g@mail.gmail.com>
In-Reply-To: <CAMuHMdUn9njDRWZPcSD87YuejmhNvDK3pUqL5kXNX6KA-8Y72g@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 3 Mar 2020 07:50:52 +0000
Message-ID: <CA+V-a8tZaAp3q0JtavGK0MV4MxcZqNMkuvY=dMj8CFu7k3w0NA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0-cat874: Add support for
 AISTARVISION MIPI Adapter V2.1
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,

Thank you for the review.

On Mon, Mar 2, 2020 at 3:57 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Lad,
>
> CC linux-media
>
> On Fri, Feb 28, 2020 at 6:02 PM Lad Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > This patch adds support AISTARVISION MIPI Adapter V2.1 board connected
> > to G2E board. Common file aistarvision-mipi-adapter-2.1.dtsi is created
> > which have the camera endpoint nodes with disabled status and in
> > r8a774c0-ek874-mipi-2.1.dts file VIN/CSI nodes are enabled. By default
> > imx219 endpoint is tied with CSI2.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > Geert/Rob since the imx219 driver is yet to make into mainline
> > but has been merged into media-subsystem I would like to take
> > this patch via media-tree.
>
> Usually DTS patches are merged through renesas-devel and arm-soc, not
> through a driver's subsystems tree.  This is done to avoid merge
> conflicts.  I prefer not to deviate from that, unless there is a very
> good reason to do so.
>
> Is there any dependency on the code in the media tree that I'm missing?
> Once DT bindings have been accepted in a subsystem maintainer's tree,
> you can start using them in DTS files.
>
In that case lets take this patch via renesas-devel, as the
DT-bindings patch has
been accepted.

> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
> > @@ -0,0 +1,98 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Device Tree Source for the AISTARVISION MIPI Adapter V2.1
> > + *
> > + * Copyright (C) 2020 Renesas Electronics Corp.
> > + */
> > +
> > +/ {
> > +       ov5645_vdddo_1v8: 1p8v {
> > +               compatible = "regulator-fixed";
> > +               regulator-name = "camera_vdddo";
> > +               regulator-min-microvolt = <1800000>;
> > +               regulator-max-microvolt = <1800000>;
> > +               regulator-always-on;
> > +       };
> > +
> > +       ov5645_vdda_2v8: 2p8v {
> > +               compatible = "regulator-fixed";
> > +               regulator-name = "camera_vdda";
> > +               regulator-min-microvolt = <2800000>;
> > +               regulator-max-microvolt = <2800000>;
> > +               regulator-always-on;
> > +       };
> > +
> > +       ov5645_vddd_1v5: 1p5v {
> > +               compatible = "regulator-fixed";
> > +               regulator-name = "camera_vddd";
> > +               regulator-min-microvolt = <1500000>;
> > +               regulator-max-microvolt = <1500000>;
> > +               regulator-always-on;
> > +       };
> > +
> > +       imx219_vana_2v8: 2p8v {
> > +               compatible = "regulator-fixed";
> > +               regulator-name = "camera_vana";
> > +               regulator-min-microvolt = <2800000>;
> > +               regulator-max-microvolt = <2800000>;
> > +               regulator-always-on;
> > +       };
> > +
> > +       imx219_vdig_1v8: 1p8v {
> > +               compatible = "regulator-fixed";
> > +               regulator-name = "camera_vdig";
> > +               regulator-min-microvolt = <1500000>;
> > +               regulator-max-microvolt = <1500000>;
> > +               regulator-always-on;
> > +       };
> > +
> > +       imx219_vddl_1v2: 1p2v {
> > +               compatible = "regulator-fixed";
> > +               regulator-name = "camera_vddl";
> > +               regulator-min-microvolt = <1200000>;
> > +               regulator-max-microvolt = <1200000>;
> > +               regulator-always-on;
> > +       };
> > +
> > +       imx219_clk: imx219_clk {
> > +               compatible = "fixed-clock";
> > +               #clock-cells = <0>;
> > +               clock-frequency = <24000000>;
> > +       };
> > +};
> > +
> > +&MIPI_PARENT_I2C {
> > +       ov5645: ov5645@3c {
> > +               compatible = "ovti,ov5645";
> > +               reg = <0x3c>;
> > +               status = "disabled";
>
> Is there any real need to disable this node here?
> Do you envision anyone including this .dtsi file, and not enabling this
> node?
>
Agreed will drop it.

> > +
> > +               clock-names = "xclk";
> > +
> > +               vdddo-supply = <&ov5645_vdddo_1v8>;
> > +               vdda-supply = <&ov5645_vdda_2v8>;
> > +               vddd-supply = <&ov5645_vddd_1v5>;
> > +
> > +               port@0 {
>
> DT bindings say "port", without unit-address.
>
shall drop it.

> > +                       ov5645_ep: endpoint {
> > +                       };
> > +               };
> > +       };
> > +
> > +       rpi_v2_camera: imx219@10 {
> > +               compatible = "sony,imx219";
> > +               reg = <0x10>;
> > +               status = "disabled";
>
> Likewise.
>
> > +
> > +               VANA-supply = <&imx219_vana_2v8>;
> > +               VDIG-supply = <&imx219_vdig_1v8>;
> > +               VDDL-supply = <&imx219_vddl_1v2>;
> > +               clocks = <&imx219_clk>;
> > +
> > +               port@0 {
>
> DT bindings say "port", without unit-address...
>
> > +                       reg = <0>;
>
> ... and thus no "reg" property.
>
shall drop it.

> > +                       imx219_ep0: endpoint {
> > +                       };
> > +               };
> > +       };
> > +};
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
> > new file mode 100644
> > index 000000000000..435b7f62d88d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
> > @@ -0,0 +1,86 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Device Tree Source for the Silicon Linux RZ/G2E 96board platform (CAT874)
> > + * connected with aistarvision-mipi-v2-adapter board
> > + *
> > + * Copyright (C) 2020 Renesas Electronics Corp.
> > + */
> > +
> > +/dts-v1/;
> > +#include "r8a774c0-ek874.dts"
> > +#define MIPI_PARENT_I2C i2c3
> > +#include "aistarvision-mipi-adapter-2.1.dtsi"
> > +
> > +/ {
> > +       model = "Silicon Linux RZ/G2E evaluation kit EK874 (CAT874 + CAT875) with aistarvision-mipi-v2-adapter board";
> > +       compatible = "si-linux,cat875", "si-linux,cat874", "renesas,r8a774c0";
> > +};
> > +
> > +&i2c3 {
> > +       status = "okay";
> > +};
> > +
> > +&vin4 {
> > +       status = "okay";
> > +};
> > +
> > +&vin5 {
> > +       status = "okay";
> > +};
> > +
> > +&csi40 {
> > +       status = "okay";
> > +
> > +       ports {
> > +               port@0 {
> > +                       reg = <0>;
> > +
> > +                       csi40_in: endpoint {
> > +                               clock-lanes = <0>;
> > +                               data-lanes = <1 2>;
> > +                               remote-endpoint = <&imx219_ep0>;
> > +                       };
> > +               };
> > +       };
> > +};
> > +
> > +&ov5645 {
> > +       /* uncomment status and remote-endpoint properties to tie ov5645
> > +        * to CSI2 also make sure remote-endpoint for imx219 camera is
> > +        * commented and remote endpoint in csi40_in is ov5645_ep
> > +        */
> > +       /* status = "okay"; */
> > +
> > +       #address-cells = <1>;
> > +       #size-cells = <0>;
>
> #{address,size}-cells not needed.
>
agreed will drop it.

> > +       enable-gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
> > +       reset-gpios = <&gpio5 3 GPIO_ACTIVE_LOW>;
> > +
> > +       clocks = <&cpg CPG_MOD 716>;
> > +       clock-frequency = <24000000>;
>
> I know this is dictated by the DT bindings for the ov5645 camera, but
> specifying a clock rate is usually done through assigned-clock-rates,
> cfr.  Documentation/devicetree/bindings/clock/clock-bindings.txt.
>
agreed will replace it.

Cheers,
--Prabhakar

> > +
> > +       port@0 {
>
> port {
>
> > +               ov5645_ep: endpoint {
> > +                       clock-lanes = <0>;
> > +                       data-lanes = <1 2>;
> > +                       /* remote-endpoint = <&csi40_in>; */
> > +               };
> > +       };
> > +};
> > +
> > +&rpi_v2_camera {
> > +       status = "okay";
> > +
> > +       #address-cells = <1>;
> > +       #size-cells = <0>;
> > +
> > +       port@0 {
> > +               reg = <0>;
>
> port {
>
> > +               imx219_ep0: endpoint {
> > +                       clock-lanes = <0>;
> > +                       data-lanes = <1 2>;
> > +                       remote-endpoint = <&csi40_in>;
> > +                       link-frequencies = /bits/ 64 <456000000>;
> > +               };
> > +       };
> > +};
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
