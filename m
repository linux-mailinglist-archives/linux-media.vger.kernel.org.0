Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A111304C2
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 00:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfE3WZp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 18:25:45 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:43487 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfE3WZp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 18:25:45 -0400
Received: by mail-yw1-f68.google.com with SMTP id t5so3302129ywf.10;
        Thu, 30 May 2019 15:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Kt2e7koKuS/w3st+6pWFlXYytQQLT+iijBY66G3TGIQ=;
        b=SnOvK8D+8dpl/JHjhGSOn/PI1ZA6KFmskkWxxxQdlclHWjqHzPvtclCjTKeO36GZOk
         ihwqNfm97yuAToZWuIj0NmC4XoK2WRFV69VbOVUfDRHKnbEheioPoQ9qmBbLxo5RkE7P
         ia3nHxPpgZEUCunu1GQ1HXOwUd1dKSMjMGiwTQjwRQSPQh+chTyTkBJtmEYGuhzP0cj0
         iOVE8gfcOErvVpykcJUqnxo16i4XNxAXatTaPEm8VCHg8ipPrl424x+xKOHuRFwCGQtB
         qlapFWyryZ5rN+EI/cj+vyzzmCrtcU/DyfdkA+du4y8ZK4UgqN6DtNR/wZ/fIob5aoeG
         jnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=Kt2e7koKuS/w3st+6pWFlXYytQQLT+iijBY66G3TGIQ=;
        b=rTkERJhYCaIeP0ezuDkpCbTR1GFCE99yOO3PkpZ8hSL21lzgZFbJnN9bDWmvHfUhBl
         Lgo0lN6A2AdiPJxfuTjR2wjs4FJQRi84W556HVS494U9mLdf+NQ9uVPJmrOeUbW7VICX
         cUv+dvpkNx+eBDmmzwoYGJkcNd3IP/Q1K5wDegV+41836BD+oeJ+ui7QOOanc7TAn1EB
         DMkQsv44uJz/oPmGsvnCBx9AdjCmU5jd3p2mvDqRXeGm9mDdrk36KlAiofxcgV3RfSHu
         CmbI/Cq3mQZvRCUOYB68ydpiNrzskTg5SrL0YTZoOTaLkV9rJfubqfP9crqm4mfjPrWO
         dgBg==
X-Gm-Message-State: APjAAAW6KW7Zrnvb0aw8o6jIMT3t9rvyafSr9AWR8/YyibRC9etIr6iN
        UBfSaI6ugr/FQIkLfYlnPRYINqISGPj+kRJdbMY=
X-Google-Smtp-Source: APXvYqxdINa9M9mKr8zLme+nf6O33yXjlqtzYPUvsQPUOfScvf6wA1/YkYHtuXtS+cQaog6bPnLQyU5UY/WjfuBPMX4=
X-Received: by 2002:a81:59c2:: with SMTP id n185mr3501471ywb.21.1559255144144;
 Thu, 30 May 2019 15:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190528161440.27172-1-peron.clem@gmail.com> <20190528161440.27172-11-peron.clem@gmail.com>
 <20190530145550.amalnxmx7kpokykv@core.my.home>
In-Reply-To: <20190530145550.amalnxmx7kpokykv@core.my.home>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Fri, 31 May 2019 00:25:32 +0200
Message-ID: <CAJiuCce7nHSktVsDKcR8GLRpD3WrN5yP3Nb_Hbu_Q9NjUQbSMw@mail.gmail.com>
Subject: Re: [PATCH v3 10/12] arm64: dts: allwinner: h6: Add IR receiver node
To:     =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ondrej,

On Thu, 30 May 2019 at 16:55, Ond=C5=99ej Jirman <megous@megous.com> wrote:
>
> Hello Cl=C3=A9ment,
>
> On Tue, May 28, 2019 at 06:14:38PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Allwinner H6 IR is similar to A31 and can use same driver.
> >
> > Add support for it.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h6.dtsi
> > index 16c5c3d0fd81..649cbdfe452e 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > @@ -647,6 +647,25 @@
> >                               pins =3D "PL0", "PL1";
> >                               function =3D "s_i2c";
> >                       };
> > +
> > +                     r_ir_rx_pin: r-ir-rx-pin {
> > +                             pins =3D "PL9";
> > +                             function =3D "s_cir_rx";
> > +                     };
> > +             };
> > +
> > +             r_ir: ir@7040000 {
> > +                             compatible =3D "allwinner,sun50i-h6-ir",
> > +                                          "allwinner,sun6i-a31-ir";
> > +                             reg =3D <0x07040000 0x400>;
> > +                             interrupts =3D <GIC_SPI 109 IRQ_TYPE_LEVE=
L_HIGH>;
> > +                             clocks =3D <&r_ccu CLK_R_APB1_IR>,
> > +                                      <&r_ccu CLK_IR>;
> > +                             clock-names =3D "apb", "ir";
> > +                             resets =3D <&r_ccu RST_R_APB1_IR>;
> > +                             pinctrl-names =3D "default";
> > +                             pinctrl-0 =3D <&r_ir_rx_pin>;
> > +                             status =3D "disabled";
> >               };
>
> Please make a comment here, that this is known broken on some boards and =
may
> result IRQ flood if enabled. Otherwise noone will know.

I'm planning to send a v4 next week with the IRQ_NONE return as Maxime
suggested it.
https://github.com/clementperon/linux/tree/h6_ir_v4

But maybe we could also use the bit 5 of the IRQ status.

Regards, Clement

>
> thanks,
>         o.
>
> >               r_i2c: i2c@7081400 {
> > --
> > 2.20.1
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
