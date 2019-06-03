Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A14B533969
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 21:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfFCT6g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 15:58:36 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:45081 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbfFCT6g (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 15:58:36 -0400
Received: by mail-yw1-f68.google.com with SMTP id m16so1948990ywh.12;
        Mon, 03 Jun 2019 12:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=zPryCWRXLrnucE/JiySfXexBGbsw2P5i9EkkB29EvlE=;
        b=HLZNA8/ZMSuzdLWUPd4akHsIoEpYyGMtqR3HnJRPDBzklcWqP6gjMSNIXSDelJSVEW
         0wNE4StLBsfUYnsnHUKpFd7VNbBWqrfJOZrEH3SgIeL17ZXPXL/xcEkSiiVvYdh+9slb
         2NnpcvWS8HoiqZeR+0eYK2AUr5jNztb969b+o31CSMw01nsrl+ViEipKBHbtgG8bqSyk
         OqtL3KSE4mOsvz7AHivcmik0/fmJBXnFiIOSID5pJN10fGyZHnS5xftTM7oGXzoKNzKU
         S3awdcqnUupx2m0brs0AM6e5sgMmu7sx0SFOpef0J8wNAVNnbb5+RMVrWKcMpZwFgVUE
         Ncdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=zPryCWRXLrnucE/JiySfXexBGbsw2P5i9EkkB29EvlE=;
        b=JpNE3NsQN3Uzk5RLg4s6Tg/itHPGWTnV+W01xtU8CBCdZa8LPaTHHY1r+rWNv/WwOV
         Dz8wMFRrErzo+bkrlQmid/LUnGUgc46YDxm1bwb6l8p//rrCR0o2qy/6OZ4aZRq11K3+
         X8dFl2+MlzJcZgm1GBXFZHFPHpvi9Zq8YVrletBnkdSb0geau/5nEhTG66ANgXBnBMi8
         8M6iddJRxMYLrwtX4kr4ErFe4hBfWdOoSzmG0lHKjxNdB3UyaubnhaZbdX3bN37tqz5/
         MAnEgK09oR1diGqTtRux+NfOS87oZ425sQpQcBf36ilmISV9dUrMD1iG2RykifFjUXUZ
         AMog==
X-Gm-Message-State: APjAAAW9NTSsrHi2UJyNw6uvwXJ5Va1TxBfXAD/8HxMTqrw+SK6h2nQ5
        r68udfQurH5ma6rBiIPRtRjhl5sOJlK+mTbrlek=
X-Google-Smtp-Source: APXvYqzaF/pj6WIIK9LanDm75fPkG92GCmUpgNneIxy1L5Op0Sc7dgolS/x3xgH4Zsp5WeDNIduylRNudGOABU+uGpc=
X-Received: by 2002:a0d:de01:: with SMTP id h1mr14385025ywe.349.1559591914679;
 Mon, 03 Jun 2019 12:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190528161440.27172-1-peron.clem@gmail.com> <20190528161440.27172-11-peron.clem@gmail.com>
 <20190530145550.amalnxmx7kpokykv@core.my.home> <CAJiuCce7nHSktVsDKcR8GLRpD3WrN5yP3Nb_Hbu_Q9NjUQbSMw@mail.gmail.com>
 <20190531124630.q2guo54kjfzr7rkn@core.my.home>
In-Reply-To: <20190531124630.q2guo54kjfzr7rkn@core.my.home>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Mon, 3 Jun 2019 21:58:23 +0200
Message-ID: <CAJiuCcdMftAjCwk2_naE9VBGGqS=OY9xcqv6+5pDX2Z8O=L28w@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH v3 10/12] arm64: dts: allwinner: h6: Add
 IR receiver node
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

On Fri, 31 May 2019 at 14:46, Ond=C5=99ej Jirman <megous@megous.com> wrote:
>
> Hello Cl=C3=A9ment,
>
> On Fri, May 31, 2019 at 12:25:32AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi Ondrej,
> >
> > On Thu, 30 May 2019 at 16:55, Ond=C5=99ej Jirman <megous@megous.com> wr=
ote:
> > >
> > > Hello Cl=C3=A9ment,
> > >
> > > On Tue, May 28, 2019 at 06:14:38PM +0200, Cl=C3=A9ment P=C3=A9ron wro=
te:
> > > > Allwinner H6 IR is similar to A31 and can use same driver.
> > > >
> > > > Add support for it.
> > > >
> > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 19 ++++++++++++++++=
+++
> > > >  1 file changed, 19 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/ar=
m64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > index 16c5c3d0fd81..649cbdfe452e 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > @@ -647,6 +647,25 @@
> > > >                               pins =3D "PL0", "PL1";
> > > >                               function =3D "s_i2c";
> > > >                       };
> > > > +
> > > > +                     r_ir_rx_pin: r-ir-rx-pin {
> > > > +                             pins =3D "PL9";
> > > > +                             function =3D "s_cir_rx";
> > > > +                     };
> > > > +             };
> > > > +
> > > > +             r_ir: ir@7040000 {
> > > > +                             compatible =3D "allwinner,sun50i-h6-i=
r",
> > > > +                                          "allwinner,sun6i-a31-ir"=
;
> > > > +                             reg =3D <0x07040000 0x400>;
> > > > +                             interrupts =3D <GIC_SPI 109 IRQ_TYPE_=
LEVEL_HIGH>;
> > > > +                             clocks =3D <&r_ccu CLK_R_APB1_IR>,
> > > > +                                      <&r_ccu CLK_IR>;
> > > > +                             clock-names =3D "apb", "ir";
> > > > +                             resets =3D <&r_ccu RST_R_APB1_IR>;
> > > > +                             pinctrl-names =3D "default";
> > > > +                             pinctrl-0 =3D <&r_ir_rx_pin>;
> > > > +                             status =3D "disabled";
> > > >               };
> > >
> > > Please make a comment here, that this is known broken on some boards =
and may
> > > result IRQ flood if enabled. Otherwise noone will know.
> >
> > I'm planning to send a v4 next week with the IRQ_NONE return as Maxime
> > suggested it.
> > https://github.com/clementperon/linux/tree/h6_ir_v4
> >
> > But maybe we could also use the bit 5 of the IRQ status.
>
> Thanks, that's nice, but that will not make the HW work. That will just d=
isable
> it. The comment is still necessary.
I have pushed a new version on my github.
https://github.com/clementperon/linux/commits/h6_ir_v4

I will submit it, if you are ok with it.

Thanks,
Cl=C3=A9ment

>
> thank you,
>         o.
>
> > Regards, Clement
> >
> > >
> > > thanks,
> > >         o.
> > >
> > > >               r_i2c: i2c@7081400 {
> > > > --
> > > > 2.20.1
> > > >
> > > >
> > > > _______________________________________________
> > > > linux-arm-kernel mailing list
> > > > linux-arm-kernel@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >
> > --
> > You received this message because you are subscribed to the Google Grou=
ps "linux-sunxi" group.
> > To unsubscribe from this group and stop receiving emails from it, send =
an email to linux-sunxi+unsubscribe@googlegroups.com.
> > To view this discussion on the web, visit https://groups.google.com/d/m=
sgid/linux-sunxi/CAJiuCce7nHSktVsDKcR8GLRpD3WrN5yP3Nb_Hbu_Q9NjUQbSMw%40mail=
.gmail.com.
> > For more options, visit https://groups.google.com/d/optout.
