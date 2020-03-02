Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12138175E41
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 16:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbgCBPcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 10:32:45 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43870 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbgCBPcp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 10:32:45 -0500
Received: by mail-ot1-f66.google.com with SMTP id j5so9205057otn.10;
        Mon, 02 Mar 2020 07:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=ZZC2Pupfl/eFbEiQmQK8DrdbI5TFes5OKB8zq+O8R1I=;
        b=BPCImpaVZVUxdzN5KKku2FS9cxnyrj2VqNM3qtKB+QZ+0w9mHciBcdIIq9B8Vs/PQE
         FIKNtt+NuYy4FCTC5IjNNaAFtQOPszr4h0ypcY1VSUshP2mp4EV6gk6EHkaMFRBn71i7
         ODVRkeg9V3uFlgVMh9HiEJJ2u/UXX+aBL1tDAMLQBgclcn8uyTl+RqgsA3t8IRIQdV/K
         eDATaKp3BhNmetgxJUUJIxxAqzSwqwHzBnxNlibDnB1rxTOWIzkTCvoXnPsTRoo+FQcp
         FVw5wAQuXjgRm8/IyfM8Dv7KJTSCHFJdX7XY9+NG+rKBtAMd6wJ96EjHeqxTNqIG8E/P
         wOeg==
X-Gm-Message-State: APjAAAUBl9fdkQGci9LxDqxfeJjDKANX0hxiS0brY6T+q68oG9G18gxW
        REcgnlNh1xFj3yfI0IcT+OJkHWgvmO9MCt/cDmE=
X-Google-Smtp-Source: APXvYqwgjIFCSqSj4qBpYRjDRfnQGcUTZSl3tHFJqbuFk9d/EBsOPPhJjGzJbigayYo0pnbjUOze3Cw83b79RAdw6Sc=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr13477946ots.250.1583163163733;
 Mon, 02 Mar 2020 07:32:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578924232.git.alexander.riesen@cetitec.com>
 <20200113141556.GI3606@pflmari> <CAMuHMdV9urx-6N4tiaPdkssa6Wu-9HSB4VY-rvCu+8JpfZcBfA@mail.gmail.com>
 <20200302134011.GA3717@pflmari> <CAMuHMdWobAE+y90DRi+zQadObWPxLyQiGNTe4t77O-2S1Vp5yA@mail.gmail.com>
 <20200302150706.GB3717@pflmari>
In-Reply-To: <20200302150706.GB3717@pflmari>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 Mar 2020 16:32:32 +0100
Message-ID: <CAMuHMdW21rYXoOSE8azHNqYjng_j41rsL=Fo2bZc=1ULi9+pLw@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: renesas: salvator: add a connection from
 adv748x codec (HDMI input) to the R-Car SoC
To:     Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

On Mon, Mar 2, 2020 at 4:07 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> Geert Uytterhoeven, Mon, Mar 02, 2020 14:47:46 +0100:
> > On Mon, Mar 2, 2020 at 2:40 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > > > --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > > > > +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > > > > @@ -322,6 +322,10 @@
> > > > >         clock-frequency = <22579200>;
> > > > >  };
> > > > >
> > > > > +&audio_clk_c {
> > > > > +       clock-frequency = <12288000>;
> > > > > +};
> > > >
> > > > Does the ADV7482 always generate a 12.288 MHz clock signal?
> > > > Or is this programmable?
> > >
> > > Oops. It looks like it is and the value is derived from the sampling rate
> > > (48kHz) and the master clock multiplier. Both hard-coded in the board file.
> >
> > Where are these hardcoded in the board file?
>
> In the endpoint definition, arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
>
> So the frequency can be set at the run-time, perhaps even derived from
> endpoint connected to the output. In this case, rsnd_endpoint3,
> which has the "mclk-fs" setting. Not sure if the sampling rate
> can be set to something else for the HDMI, though.
>
> > Even if they are, technically this is a clock output of the ADV7482.
>
> ... which I hope to correct as soon as I steal the hardware from whoever stole
> it from me...
>
> > > > > video-receiver@70 {
> > > > >     compatible = "adi,adv7482";
> > > > > ...
> > > > > +   clocks = <&rcar_sound 3>, <&audio_clk_c>;
> > > > > +   clock-names = "clk-hdmi-video", "clk-hdmi-i2s-mclk";
> > > >
> > > > The above declares the Audio CLK C to be a clock input of the ADV7482, while
> > > > it is an output.
> > >
> > > I would gladly give it right direction if I *really* understood what I was
> > > doing...
> >
> > :-)
> >
> > > > Furthermore, the DT bindings do not document that clocks can be specified.
> > >
> > > Should the DT bindings document that the clock cannot be specified than?
> >
> > It currently does say so, as it doesn't list "clocks" in its properties section.
>
> The bindings documentation file, which we're talking about here and which does
> not list the specifiable input clocks in its properties, is it the
>
>     Documentation/devicetree/bindings/media/i2c/adv748x.txt
>
> ?

Yes.

>
> And this absence of documentation also means that whatever clocks (both input
> in "clocks=" and output in "#clock-cells") listed in a specific .dts are just
> an integration detail?

No, the absence probably means that any clock-related properties in a .dts
file will just be ignored.

Looking at the driver source, it indeed has no support related to clocks at all.

> Does this below makes more sense, than?
>
>     video-receiver@70 {
>         compatible = "adi,adv7482";
>         clocks = <&rcar_sound 3>;
>         clock-names = "clk-hdmi-video";
>         adv748x_mclk: mclk {
>             compatible = "fixed-clock";
>             #clock-cells =  <0>;
>             /* frequency hard-coded for illustration */
>             clock-frequency = <12288000>;
>             clock-output-names = "clk-hdmi-i2s-mclk";
>         };
>     };

The #clock-cells should be in the main video-receiver node.
Probably there is more than one clock output, so #clock-cells may be 1?
There is no need for a fixed-clock compatible, nor for clock-frequency
and clock-output-names.

But most important: this should be documented in the adv748x DT bindings,
and implemented in the adv748x driver.

> Now I'm a bit hazy on how to declare that the MCLK output of the
> video-receiver@70 is connected to the Audio Clock C of the SoC...
> Probably remove use of "audio_clk_c" completely?

Yes, the current audio_clk_c definition in the DTS assumes a fixed
crystal.

> > > > > @@ -686,7 +700,8 @@
> > > > >         };
> > > > >
> > > > >         sound_pins: sound {
> > > > > -               groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data_a";
> > > > > +               groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data_a",
> > > > > +                        "ssi4_data";
> > > >
> > > > Missing "ss4_ctrl", for the SCK4 and WS4 pins.
> > >
> > > I'll add them.
> > > As the device seems to function even without thoes, does this mean the
> > > pins in the group are used "on demand" by whatever needs them?
> >
> > Probably the SCK4/WS4 functions are the reset-state defaults.
>
> That ... might require some trial and testing: when I add them to the group,
> the reset defaults will be overridden by the platform initialization, which is
> not necessarily the reset default. Will see.

Or by the boot loader.  Anyway, you need to specify these in the DTS.

> > > Does a "clocks = ..." statement always mean input clocks?
> >
> > Yes it does.
> > If a device has clock outputs and is thus a clock provider, it should
> > have a #clock-cells property, and this should be documented in the bindings.
> >
> > A clock consumer will refer to clocks of a provider using the "clocks"
> > property, specifying a clock specifier (phandle and zero or more indices)
> > for each clock referenced.
>
> Something like this?
>
>     &rcar_sound {
>         clocks = ...,
>                  <&adv748x_mclk>,
>                  <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
>         clock-names = ...,
>                       "clk_c",
>                       "clk_i";
>     };

More or less.

Might become

    find_a_better_label_choice: video-receiver@70 {
            ...
    };

    &rcar_sound {
            clock = ...,
                    <&find_a_better_label_choice 0>,
                    ...
    };

as there may be multiple clock outputs on the ADV7482.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
