Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED7734AE1
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 16:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbfFDOsC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 10:48:02 -0400
Received: from vps.xff.cz ([195.181.215.36]:35054 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727545AbfFDOsC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 10:48:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1559659678; bh=m7FYiw/lRi8vxPdtVV/tO0Y5qL275wWEx2HUX5agu3M=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=NN4aIj1cwcxEh5mltj87MvcnHB3JrYZTga8oxK2lH8Kq1c0J6kYq9QdROaaTFvhnS
         TZoH3knREI6iaWll87BLLt3ms9LWZdZLtxsWv4MXQj/CJbi14N8Swx2E8/4dTtWil+
         8oJhIxMN7qnZbhezw4k5NU9raQ141//OBr9EJNMs=
Date:   Tue, 4 Jun 2019 16:47:57 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
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
Subject: Re: [linux-sunxi] Re: [PATCH v3 10/12] arm64: dts: allwinner: h6:
 Add IR receiver node
Message-ID: <20190604144757.xvggmj6asyf44vuc@core.my.home>
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
 <20190531124630.q2guo54kjfzr7rkn@core.my.home>
 <CAJiuCcdMftAjCwk2_naE9VBGGqS=OY9xcqv6+5pDX2Z8O=L28w@mail.gmail.com>
 <20190604123355.m47ufmhtzuzfvmp7@core.my.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190604123355.m47ufmhtzuzfvmp7@core.my.home>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Clément,

On Tue, Jun 04, 2019 at 02:33:55PM +0200, verejna wrote:
> Hi Clément,
> 
> On Mon, Jun 03, 2019 at 09:58:23PM +0200, Clément Péron wrote:
> > Hi Ondrej,
> > 
> > On Fri, 31 May 2019 at 14:46, Ondřej Jirman <megous@megous.com> wrote:
> > >
> > > Hello Clément,
> > >
> > > On Fri, May 31, 2019 at 12:25:32AM +0200, Clément Péron wrote:
> > > > Hi Ondrej,
> > > >
> > > > On Thu, 30 May 2019 at 16:55, Ondřej Jirman <megous@megous.com> wrote:
> > > > >
> > > > > Hello Clément,
> > > > >
> > > > > On Tue, May 28, 2019 at 06:14:38PM +0200, Clément Péron wrote:
> > > > > > Allwinner H6 IR is similar to A31 and can use same driver.
> > > > > >
> > > > > > Add support for it.
> > > > > >
> > > > > > Signed-off-by: Clément Péron <peron.clem@gmail.com>
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 19 +++++++++++++++++++
> > > > > >  1 file changed, 19 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > > index 16c5c3d0fd81..649cbdfe452e 100644
> > > > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > > @@ -647,6 +647,25 @@
> > > > > >                               pins = "PL0", "PL1";
> > > > > >                               function = "s_i2c";
> > > > > >                       };
> > > > > > +
> > > > > > +                     r_ir_rx_pin: r-ir-rx-pin {
> > > > > > +                             pins = "PL9";
> > > > > > +                             function = "s_cir_rx";
> > > > > > +                     };
> > > > > > +             };
> > > > > > +
> > > > > > +             r_ir: ir@7040000 {
> > > > > > +                             compatible = "allwinner,sun50i-h6-ir",
> > > > > > +                                          "allwinner,sun6i-a31-ir";
> > > > > > +                             reg = <0x07040000 0x400>;
> > > > > > +                             interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> > > > > > +                             clocks = <&r_ccu CLK_R_APB1_IR>,
> > > > > > +                                      <&r_ccu CLK_IR>;
> > > > > > +                             clock-names = "apb", "ir";
> > > > > > +                             resets = <&r_ccu RST_R_APB1_IR>;
> > > > > > +                             pinctrl-names = "default";
> > > > > > +                             pinctrl-0 = <&r_ir_rx_pin>;
> > > > > > +                             status = "disabled";
> > > > > >               };
> > > > >
> > > > > Please make a comment here, that this is known broken on some boards and may
> > > > > result IRQ flood if enabled. Otherwise noone will know.
> > > >
> > > > I'm planning to send a v4 next week with the IRQ_NONE return as Maxime
> > > > suggested it.
> > > > https://github.com/clementperon/linux/tree/h6_ir_v4
> > > >
> > > > But maybe we could also use the bit 5 of the IRQ status.
> > >
> > > Thanks, that's nice, but that will not make the HW work. That will just disable
> > > it. The comment is still necessary.
> > I have pushed a new version on my github.
> > https://github.com/clementperon/linux/commits/h6_ir_v4
> > 
> > I will submit it, if you are ok with it.
> 
> the changes make it worse. Console is flooded with "Temporarily disable IRQ"
> and other symptoms are the same as I described before. Interrupts are not
> disabled in a any reasonable time. (I've waited for more > 5mins already.)
> 
> You probably need to disable interrupts right away, not wait for 100k failures.

Hmm, this is what the registers look like post-probe:

R_CIR:
0x07040000 : 00000030
0x07040004 : 00000030
0x07040008 : 00000030
0x0704000c : 00000030
0x07040010 : 00000030
0x07040014 : 00000030
0x07040018 : 00000030
0x0704001c : 00000030
0x07040020 : 00000030
0x07040024 : 00000030
0x07040028 : 00000030
0x0704002c : 00000030
0x07040030 : 00000030
0x07040034 : 00000030
0x07040038 : 00000030
0x0704003c : 00000030
0x07040040 : 00000030
0x07040044 : 00000030
0x07040048 : 00000030
0x0704004c : 00000030
0x07040050 : 00000030
0x07040054 : 00000030
0x07040058 : 00000030
0x0704005c : 00000030
0x07040060 : 00000030
0x07040064 : 00000030
0x07040068 : 00000030
0x0704006c : 00000030
0x07040070 : 00000030
0x07040074 : 00000030
0x07040078 : 00000030
0x0704007c : 00000030
0x07040080 : 00000030
0x07040084 : 00000030
0x07040088 : 00000030
0x0704008c : 00000030
0x07040090 : 00000030
0x07040094 : 00000030
0x07040098 : 00000030
0x0704009c : 00000030
0x070400a0 : 00000030
0x070400a4 : 00000030
0x070400a8 : 00000030
0x070400ac : 00000030
0x070400b0 : 00000030
0x070400b4 : 00000030
0x070400b8 : 00000030
0x070400bc : 00000030
0x070400c0 : 00000030
0x070400c4 : 00000030
0x070400c8 : 00000030
0x070400cc : 00000030
0x070400d0 : 00000030
0x070400d4 : 00000030
0x070400d8 : 00000030
0x070400dc : 00000030
0x070400e0 : 00000030
0x070400e4 : 00000030
0x070400e8 : 00000030
0x070400ec : 00000030
0x070400f0 : 00000030
0x070400f4 : 00000030
0x070400f8 : 00000030
0x070400fc : 00000030

Clearly not right. It's just the R_CIR module, other modules have normal values.

I've checked:
0x070101c0 : 81000002
(IR clock config register)
0x070101cc : 00010000
(IR reset/bus clk gate reg)

static const char * const r_mod0_default_parents[] = { "osc32k", "osc24M" };
static SUNXI_CCU_MP_WITH_MUX_GATE(ir_clk, "ir",
                                  r_mod0_default_parents, 0x1c0,
                                  0, 5,         /* M */
                                  8, 2,         /* P */
                                  24, 1,        /* mux */
                                  BIT(31),      /* gate */
                                  0);

static SUNXI_CCU_GATE(r_apb1_ir_clk,    "r-apb1-ir",    "r-apb1",
                      0x1cc, BIT(0), 0);

        [RST_R_APB1_IR]         =  { 0x1cc, BIT(16) },

So parent clock seems to be OK. But gate clock is not enabled, so the bus
is not working.

And look at this!!:

static SUNXI_CCU_GATE(r_apb1_ir_clk,    "r-apb1-ir",    "r-apb1",
                      0x1cc, BIT(0), 0);
static SUNXI_CCU_GATE(r_apb1_w1_clk,    "r-apb1-w1",    "r-apb1",
                      0x1cc, BIT(0), 0);

So, it's wrong w1 gate config!

You can drop your changes, because I've probbably found the root cause.

regards,
	o.

> thank you and regards,
> 	o.
> 
> > Thanks,
> > Clément
> > 
> > >
> > > thank you,
> > >         o.
> > >
> > > > Regards, Clement
> > > >
> > > > >
> > > > > thanks,
> > > > >         o.
> > > > >
> > > > > >               r_i2c: i2c@7081400 {
> > > > > > --
> > > > > > 2.20.1
> > > > > >
> > > > > >
> > > > > > _______________________________________________
> > > > > > linux-arm-kernel mailing list
> > > > > > linux-arm-kernel@lists.infradead.org
> > > > > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> > > >
> > > > --
> > > > You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> > > > To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> > > > To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/CAJiuCce7nHSktVsDKcR8GLRpD3WrN5yP3Nb_Hbu_Q9NjUQbSMw%40mail.gmail.com.
> > > > For more options, visit https://groups.google.com/d/optout.
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
