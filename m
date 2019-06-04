Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE06934CFB
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 18:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbfFDQMi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 12:12:38 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:40552 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728166AbfFDQMi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 12:12:38 -0400
Received: by mail-yw1-f65.google.com with SMTP id b143so532364ywb.7;
        Tue, 04 Jun 2019 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=cg20tLE42CHywNeFtNzJTQ3CigLtU5PdqRdGflXNYBs=;
        b=pmLrLOA5eepdWsDC2uEvVpkfOkVMbbD4YKUSlW2wiT6dyO8vClacH1rj2iNuQT7AO7
         rrGybmdvvuXTGo8XnVzNhrJwoPrwhattywzMFBhIaqqVg0I0LkhwwLidV76M0X/sC7NS
         DwPpFRPQQAzU27SpIG0UuSBiueGnI3drCgyf7F8AdEchnR3ezxMErTIgsMWNWJ1xYOLe
         V1OYbSBCPM8DLnsiuI/ULyyqnUgJCWMzHLLK+le4TwPddDkZsm+7hNrz73vyHHLnasfa
         GmYQ0wvKXOatiBESObRyz3CCuInf/hVFxm+lEpliD+WduYV+WxM0caduOzqf3b5zR8UU
         lQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=cg20tLE42CHywNeFtNzJTQ3CigLtU5PdqRdGflXNYBs=;
        b=bbPHHQlXlZEOVV60uj2kUtcpZ9W6xGKpWOLE4IxXRWdkjwRkdTCTNoELqHsUsZfM+G
         psE4EEKmQRnuZ9FQ+M2pjCuZ7vJsKmZwQCm5FjECAhL9jEcbRe37+Nj2PSqZjS58aonC
         iZmyU1OM2t6RBCyWdrdXxTomBmfl1AiJFj+kbtTGCNI2psbuWKWxhwGdhFxBIg+TG3bs
         j60fTmTqRhoSrFxlQ7qnFmaV9A/1BIczuuFvHLtccM6wI214mFpS/5O/jfp9mxI9beR6
         gkBdsNNQN+Wo7nvoBDIQRBfNcjcT6xvTSWXnBx7tPX2Qg2sUAwlt2tln4KlxT7cS/ASP
         mZZA==
X-Gm-Message-State: APjAAAXPAIt6aqvLc9acXhGx5y2Nzf+5gZk/ZCBYc2OAaIv/muwXRlHk
        Abt6lIf9ChS+qW9NcmCu/S1s3LJVSAJCMCUfB5s=
X-Google-Smtp-Source: APXvYqwe0G0h6zCiUWYm0ZfmD7tg1+pwIi/N451BJzzMrY97HggWxpaFoUa1cjBBSEOjsZbattPk+wq1stkJcX8PDcc=
X-Received: by 2002:a81:5f54:: with SMTP id t81mr16720438ywb.234.1559664756378;
 Tue, 04 Jun 2019 09:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190528161440.27172-1-peron.clem@gmail.com> <20190528161440.27172-11-peron.clem@gmail.com>
 <20190530145550.amalnxmx7kpokykv@core.my.home> <CAJiuCce7nHSktVsDKcR8GLRpD3WrN5yP3Nb_Hbu_Q9NjUQbSMw@mail.gmail.com>
 <20190531124630.q2guo54kjfzr7rkn@core.my.home> <CAJiuCcdMftAjCwk2_naE9VBGGqS=OY9xcqv6+5pDX2Z8O=L28w@mail.gmail.com>
 <20190604123355.m47ufmhtzuzfvmp7@core.my.home> <20190604144757.xvggmj6asyf44vuc@core.my.home>
 <CAJiuCcf6gHP_G73w8Gf6QYOfvh9Frc9uQk7qpxbpsLY33PxL3w@mail.gmail.com> <20190604153006.g53kzhnx3hzpg5qh@core.my.home>
In-Reply-To: <20190604153006.g53kzhnx3hzpg5qh@core.my.home>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Tue, 4 Jun 2019 18:12:24 +0200
Message-ID: <CAJiuCcc1D1RVdpZG4bEeYWbCr8isWfP-2O9DAt-+avcrSp0f9Q@mail.gmail.com>
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

On Tue, 4 Jun 2019 at 17:30, Ond=C5=99ej Jirman <megous@megous.com> wrote:
>
> Hi Cl=C3=A9ment,
>
> On Tue, Jun 04, 2019 at 05:04:07PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi Ondrej,
> >
> > On Tue, 4 Jun 2019 at 16:47, Ond=C5=99ej Jirman <megous@megous.com> wro=
te:
> > >
> > > Hi Cl=C3=A9ment,
> > >
> > > On Tue, Jun 04, 2019 at 02:33:55PM +0200, verejna wrote:
> > > > Hi Cl=C3=A9ment,
> > > >
> > > > On Mon, Jun 03, 2019 at 09:58:23PM +0200, Cl=C3=A9ment P=C3=A9ron w=
rote:
> > > > > Hi Ondrej,
> > > > >
> > > > > On Fri, 31 May 2019 at 14:46, Ond=C5=99ej Jirman <megous@megous.c=
om> wrote:
> > > > > >
> > > > > > Hello Cl=C3=A9ment,
> > > > > >
> > > > > > On Fri, May 31, 2019 at 12:25:32AM +0200, Cl=C3=A9ment P=C3=A9r=
on wrote:
> > > > > > > Hi Ondrej,
> > > > > > >
> > > > > > > On Thu, 30 May 2019 at 16:55, Ond=C5=99ej Jirman <megous@mego=
us.com> wrote:
> > > > > > > >
> > > > > > > > Hello Cl=C3=A9ment,
> > > > > > > >
> > > > > > > > On Tue, May 28, 2019 at 06:14:38PM +0200, Cl=C3=A9ment P=C3=
=A9ron wrote:
> > > > > > > > > Allwinner H6 IR is similar to A31 and can use same driver=
.
> > > > > > > > >
> > > > > > > > > Add support for it.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.=
com>
> > > > > > > > > ---
> > > > > > > > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 19 ++++++=
+++++++++++++
> > > > > > > > >  1 file changed, 19 insertions(+)
> > > > > > > > >
> > > > > > > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi=
 b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > > > > > index 16c5c3d0fd81..649cbdfe452e 100644
> > > > > > > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > > > > > @@ -647,6 +647,25 @@
> > > > > > > > >                               pins =3D "PL0", "PL1";
> > > > > > > > >                               function =3D "s_i2c";
> > > > > > > > >                       };
> > > > > > > > > +
> > > > > > > > > +                     r_ir_rx_pin: r-ir-rx-pin {
> > > > > > > > > +                             pins =3D "PL9";
> > > > > > > > > +                             function =3D "s_cir_rx";
> > > > > > > > > +                     };
> > > > > > > > > +             };
> > > > > > > > > +
> > > > > > > > > +             r_ir: ir@7040000 {
> > > > > > > > > +                             compatible =3D "allwinner,s=
un50i-h6-ir",
> > > > > > > > > +                                          "allwinner,sun=
6i-a31-ir";
> > > > > > > > > +                             reg =3D <0x07040000 0x400>;
> > > > > > > > > +                             interrupts =3D <GIC_SPI 109=
 IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > > +                             clocks =3D <&r_ccu CLK_R_AP=
B1_IR>,
> > > > > > > > > +                                      <&r_ccu CLK_IR>;
> > > > > > > > > +                             clock-names =3D "apb", "ir"=
;
> > > > > > > > > +                             resets =3D <&r_ccu RST_R_AP=
B1_IR>;
> > > > > > > > > +                             pinctrl-names =3D "default"=
;
> > > > > > > > > +                             pinctrl-0 =3D <&r_ir_rx_pin=
>;
> > > > > > > > > +                             status =3D "disabled";
> > > > > > > > >               };
> > > > > > > >
> > > > > > > > Please make a comment here, that this is known broken on so=
me boards and may
> > > > > > > > result IRQ flood if enabled. Otherwise noone will know.
> > > > > > >
> > > > > > > I'm planning to send a v4 next week with the IRQ_NONE return =
as Maxime
> > > > > > > suggested it.
> > > > > > > https://github.com/clementperon/linux/tree/h6_ir_v4
> > > > > > >
> > > > > > > But maybe we could also use the bit 5 of the IRQ status.
> > > > > >
> > > > > > Thanks, that's nice, but that will not make the HW work. That w=
ill just disable
> > > > > > it. The comment is still necessary.
> > > > > I have pushed a new version on my github.
> > > > > https://github.com/clementperon/linux/commits/h6_ir_v4
> > > > >
> > > > > I will submit it, if you are ok with it.
> > > >
> > > > the changes make it worse. Console is flooded with "Temporarily dis=
able IRQ"
> > > > and other symptoms are the same as I described before. Interrupts a=
re not
> > > > disabled in a any reasonable time. (I've waited for more > 5mins al=
ready.)
> > > >
> > > > You probably need to disable interrupts right away, not wait for 10=
0k failures.
> > >
> > > Hmm, this is what the registers look like post-probe:
> > >
> > > R_CIR:
> > > 0x07040000 : 00000030
> > > 0x07040004 : 00000030
> > > 0x07040008 : 00000030
> > > 0x0704000c : 00000030
> > > 0x07040010 : 00000030
> > > 0x07040014 : 00000030
> > > 0x07040018 : 00000030
> > > 0x0704001c : 00000030
> > > 0x07040020 : 00000030
> > > 0x07040024 : 00000030
> > > 0x07040028 : 00000030
> > > 0x0704002c : 00000030
> > > 0x07040030 : 00000030
> > > 0x07040034 : 00000030
> > > 0x07040038 : 00000030
> > > 0x0704003c : 00000030
> > > 0x07040040 : 00000030
> > > 0x07040044 : 00000030
> > > 0x07040048 : 00000030
> > > 0x0704004c : 00000030
> > > 0x07040050 : 00000030
> > > 0x07040054 : 00000030
> > > 0x07040058 : 00000030
> > > 0x0704005c : 00000030
> > > 0x07040060 : 00000030
> > > 0x07040064 : 00000030
> > > 0x07040068 : 00000030
> > > 0x0704006c : 00000030
> > > 0x07040070 : 00000030
> > > 0x07040074 : 00000030
> > > 0x07040078 : 00000030
> > > 0x0704007c : 00000030
> > > 0x07040080 : 00000030
> > > 0x07040084 : 00000030
> > > 0x07040088 : 00000030
> > > 0x0704008c : 00000030
> > > 0x07040090 : 00000030
> > > 0x07040094 : 00000030
> > > 0x07040098 : 00000030
> > > 0x0704009c : 00000030
> > > 0x070400a0 : 00000030
> > > 0x070400a4 : 00000030
> > > 0x070400a8 : 00000030
> > > 0x070400ac : 00000030
> > > 0x070400b0 : 00000030
> > > 0x070400b4 : 00000030
> > > 0x070400b8 : 00000030
> > > 0x070400bc : 00000030
> > > 0x070400c0 : 00000030
> > > 0x070400c4 : 00000030
> > > 0x070400c8 : 00000030
> > > 0x070400cc : 00000030
> > > 0x070400d0 : 00000030
> > > 0x070400d4 : 00000030
> > > 0x070400d8 : 00000030
> > > 0x070400dc : 00000030
> > > 0x070400e0 : 00000030
> > > 0x070400e4 : 00000030
> > > 0x070400e8 : 00000030
> > > 0x070400ec : 00000030
> > > 0x070400f0 : 00000030
> > > 0x070400f4 : 00000030
> > > 0x070400f8 : 00000030
> > > 0x070400fc : 00000030
> > >
> > > Clearly not right. It's just the R_CIR module, other modules have nor=
mal values.
> > >
> > > I've checked:
> > > 0x070101c0 : 81000002
> > > (IR clock config register)
> > > 0x070101cc : 00010000
> > > (IR reset/bus clk gate reg)
> > >
> > > static const char * const r_mod0_default_parents[] =3D { "osc32k", "o=
sc24M" };
> > > static SUNXI_CCU_MP_WITH_MUX_GATE(ir_clk, "ir",
> > >                                   r_mod0_default_parents, 0x1c0,
> > >                                   0, 5,         /* M */
> > >                                   8, 2,         /* P */
> > >                                   24, 1,        /* mux */
> > >                                   BIT(31),      /* gate */
> > >                                   0);
> > >
> > > static SUNXI_CCU_GATE(r_apb1_ir_clk,    "r-apb1-ir",    "r-apb1",
> > >                       0x1cc, BIT(0), 0);
> > >
> > >         [RST_R_APB1_IR]         =3D  { 0x1cc, BIT(16) },
> > >
> > > So parent clock seems to be OK. But gate clock is not enabled, so the=
 bus
> > > is not working.
> > >
> > > And look at this!!:
> > >
> > > static SUNXI_CCU_GATE(r_apb1_ir_clk,    "r-apb1-ir",    "r-apb1",
> > >                       0x1cc, BIT(0), 0);
> > > static SUNXI_CCU_GATE(r_apb1_w1_clk,    "r-apb1-w1",    "r-apb1",
> > >                       0x1cc, BIT(0), 0);
> > >
> > > So, it's wrong w1 gate config!
> > >
> > > You can drop your changes, because I've probbably found the root caus=
e.
> >
> > Nice to see that you have found the issue, but I don't understand why
> > It's working on my board on not on yours.
>
> Maybe you use modules? I have a builtin driver.
Correct,

>
> That may change initialization order. It would disable unused gates first=
, and
> when you load the module later from userpsace then it would enable the ga=
te.
>
> If builtin, then it would enable IR gate first, and then disable the unus=
ed
> gates (W1 in this case), later on when entering userspace.
Thanks for the explanation it makes sense.

>
> Anyway, I can confirm that now, when I turn on the light in the room, I g=
et
> around 10 interrupts with empty FIFO and than it stops.
Ok I will push a V4 with just the introduction of the RXSTA.

Regards,
Cl=C3=A9ment

>
> It doesn't cause the flood anymore.
>
> regards,
>         o.
>
> > Regards,
> > Cl=C3=A9ment
> >
> > >
> > > regards,
> > >         o.
> > >
> > > > thank you and regards,
> > > >       o.
> > > >
> > > > > Thanks,
> > > > > Cl=C3=A9ment
> > > > >
> > > > > >
> > > > > > thank you,
> > > > > >         o.
> > > > > >
> > > > > > > Regards, Clement
> > > > > > >
> > > > > > > >
> > > > > > > > thanks,
> > > > > > > >         o.
> > > > > > > >
> > > > > > > > >               r_i2c: i2c@7081400 {
> > > > > > > > > --
> > > > > > > > > 2.20.1
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > _______________________________________________
> > > > > > > > > linux-arm-kernel mailing list
> > > > > > > > > linux-arm-kernel@lists.infradead.org
> > > > > > > > > http://lists.infradead.org/mailman/listinfo/linux-arm-ker=
nel
> > > > > > >
> > > > > > > --
> > > > > > > You received this message because you are subscribed to the G=
oogle Groups "linux-sunxi" group.
> > > > > > > To unsubscribe from this group and stop receiving emails from=
 it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> > > > > > > To view this discussion on the web, visit https://groups.goog=
le.com/d/msgid/linux-sunxi/CAJiuCce7nHSktVsDKcR8GLRpD3WrN5yP3Nb_Hbu_Q9NjUQb=
SMw%40mail.gmail.com.
> > > > > > > For more options, visit https://groups.google.com/d/optout.
> > > > >
> > > > > _______________________________________________
> > > > > linux-arm-kernel mailing list
> > > > > linux-arm-kernel@lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> > > >
> > > > _______________________________________________
> > > > linux-arm-kernel mailing list
> > > > linux-arm-kernel@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
