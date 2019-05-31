Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63A8830E56
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 14:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727327AbfEaMqf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 08:46:35 -0400
Received: from vps.xff.cz ([195.181.215.36]:49248 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726403AbfEaMqe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 08:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1559306791; bh=Vq6PHN+aRiKBxc4hddRHLSZfiSd9bUvG627zPC4o9vY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r7SNqaIwNqwOb9guoWHE+5kcqm8Eu7YcYIULLPtYivZ8AwmvJo/eJZGEmRO1PppSD
         sTdI0zKF207BU/1eEZQuURPmnPPtCk//a5UQlBB0RqHTU9jsBnN14mUimA6O4If6tq
         3YsMz2n2ah8SkyCqn84s9ElTauLkHFeD0Xypwu1E=
Date:   Fri, 31 May 2019 14:46:30 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org
Subject: Re: [linux-sunxi] Re: [PATCH v3 10/12] arm64: dts: allwinner: h6:
 Add IR receiver node
Message-ID: <20190531124630.q2guo54kjfzr7rkn@core.my.home>
Mail-Followup-To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
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
References: <20190528161440.27172-1-peron.clem@gmail.com>
 <20190528161440.27172-11-peron.clem@gmail.com>
 <20190530145550.amalnxmx7kpokykv@core.my.home>
 <CAJiuCce7nHSktVsDKcR8GLRpD3WrN5yP3Nb_Hbu_Q9NjUQbSMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJiuCce7nHSktVsDKcR8GLRpD3WrN5yP3Nb_Hbu_Q9NjUQbSMw@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Clément,

On Fri, May 31, 2019 at 12:25:32AM +0200, Clément Péron wrote:
> Hi Ondrej,
> 
> On Thu, 30 May 2019 at 16:55, Ondřej Jirman <megous@megous.com> wrote:
> >
> > Hello Clément,
> >
> > On Tue, May 28, 2019 at 06:14:38PM +0200, Clément Péron wrote:
> > > Allwinner H6 IR is similar to A31 and can use same driver.
> > >
> > > Add support for it.
> > >
> > > Signed-off-by: Clément Péron <peron.clem@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > index 16c5c3d0fd81..649cbdfe452e 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > @@ -647,6 +647,25 @@
> > >                               pins = "PL0", "PL1";
> > >                               function = "s_i2c";
> > >                       };
> > > +
> > > +                     r_ir_rx_pin: r-ir-rx-pin {
> > > +                             pins = "PL9";
> > > +                             function = "s_cir_rx";
> > > +                     };
> > > +             };
> > > +
> > > +             r_ir: ir@7040000 {
> > > +                             compatible = "allwinner,sun50i-h6-ir",
> > > +                                          "allwinner,sun6i-a31-ir";
> > > +                             reg = <0x07040000 0x400>;
> > > +                             interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> > > +                             clocks = <&r_ccu CLK_R_APB1_IR>,
> > > +                                      <&r_ccu CLK_IR>;
> > > +                             clock-names = "apb", "ir";
> > > +                             resets = <&r_ccu RST_R_APB1_IR>;
> > > +                             pinctrl-names = "default";
> > > +                             pinctrl-0 = <&r_ir_rx_pin>;
> > > +                             status = "disabled";
> > >               };
> >
> > Please make a comment here, that this is known broken on some boards and may
> > result IRQ flood if enabled. Otherwise noone will know.
> 
> I'm planning to send a v4 next week with the IRQ_NONE return as Maxime
> suggested it.
> https://github.com/clementperon/linux/tree/h6_ir_v4
> 
> But maybe we could also use the bit 5 of the IRQ status.

Thanks, that's nice, but that will not make the HW work. That will just disable
it. The comment is still necessary.

thank you,
	o.

> Regards, Clement
> 
> >
> > thanks,
> >         o.
> >
> > >               r_i2c: i2c@7081400 {
> > > --
> > > 2.20.1
> > >
> > >
> > > _______________________________________________
> > > linux-arm-kernel mailing list
> > > linux-arm-kernel@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
> -- 
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/CAJiuCce7nHSktVsDKcR8GLRpD3WrN5yP3Nb_Hbu_Q9NjUQbSMw%40mail.gmail.com.
> For more options, visit https://groups.google.com/d/optout.
