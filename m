Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A575F17BCA5
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 13:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgCFMV7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 07:21:59 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41282 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgCFMV7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Mar 2020 07:21:59 -0500
Received: by mail-oi1-f194.google.com with SMTP id i1so2315667oie.8;
        Fri, 06 Mar 2020 04:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=PP2DishXN/uUrup+d3jTIYgHqkNWvTyxlqHhWL+y70E=;
        b=RDxB7p25eiNzypjtjZxkzkeU+eYUxLeMzoYdOUWOX/uN4uf2Cza+rIJB1sr3a9fPRT
         v4AnX4lE+N4pGVxAh51x/lVJ4hEFz8V1FPDyEPFj+OPTEkxBp8gfsoMy0+OgaYpof32g
         b5UO2ZPYTN3p4Xd2mWhTV5+ptWWwvhqetwzhNkddY/KfmBe/2vQ8DUq8WfldCa4I9p8H
         bk496dgjimpmVmXo4njzEIzdX9J6/zOmYYgFoWhWwCF+SvadZpAyHBKg8AaJsB7Zgyet
         KHrlVUQe4iNMRr8zil3/yN5zKO9OtpzsT2N0zucBWgrdPROisGFFwZdN0PUFnepLNZ/o
         LgfQ==
X-Gm-Message-State: ANhLgQ2tlP5U1dXKnvORXmg+YWxcNzUCruxj16WgO5oCa89Jz+xa3KXK
        mxrUoN2uHVcrv8TdOkF+GU3RQldDI+emGxaZ94U=
X-Google-Smtp-Source: ADFU+vuqW1+bL1GfUIbD/UX0Xdr2QQ2a9Bx5BiX710LT61dVJJ+qMrBgjw1mx9XCfZC1zD0nvLC0ycFbm9N71NQanyw=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr2251724oia.148.1583497318647;
 Fri, 06 Mar 2020 04:21:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578924232.git.alexander.riesen@cetitec.com>
 <20200113141556.GI3606@pflmari> <CAMuHMdV9urx-6N4tiaPdkssa6Wu-9HSB4VY-rvCu+8JpfZcBfA@mail.gmail.com>
 <20200302134011.GA3717@pflmari> <CAMuHMdWobAE+y90DRi+zQadObWPxLyQiGNTe4t77O-2S1Vp5yA@mail.gmail.com>
 <20200302150706.GB3717@pflmari> <CAMuHMdW21rYXoOSE8azHNqYjng_j41rsL=Fo2bZc=1ULi9+pLw@mail.gmail.com>
 <20200302160906.GC3717@pflmari> <CAMuHMdVNGsVHyvAgC5dAHx=8Ax18EHx2tS6Hm5Bkg4ms=mW6Zw@mail.gmail.com>
 <20200305143628.GB25741@pflmari>
In-Reply-To: <20200305143628.GB25741@pflmari>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Mar 2020 13:21:47 +0100
Message-ID: <CAMuHMdW+=qXgGhCowVkGQ7v4=ji8UQ7Db-e91XP7ZBpJcSp34A@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: renesas: salvator: add a connection from
 adv748x codec (HDMI input) to the R-Car SoC
To:     Alex Riesen <alexander.riesen@cetitec.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Driver Development <devel@driverdev.osuosl.org>,
        Linux Media <linux-media@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Device Tree <devicetree@vger.kernel.org>,
        Renesas SoC <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

On Thu, Mar 5, 2020 at 3:36 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> Geert Uytterhoeven, Mon, Mar 02, 2020 17:13:30 +0100:
> > On Mon, Mar 2, 2020 at 5:09 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > Geert Uytterhoeven, Mon, Mar 02, 2020 16:32:32 +0100:
> > > >
> > > > The #clock-cells should be in the main video-receiver node.
> > > > Probably there is more than one clock output, so #clock-cells may be 1?
> > >
> > > AFAICS, the device can provide only this one clock line (audio master clock
> > > for I2S output)... I shall re-check, just in case.
>
> And you're right, of course: the audio output formatting module of the ADV748x
> devices provides a set of clock lines related to the I2S pins: the already
> discussed master clock, left-right channel clock and the serial clock (bit
> clock?).
>
> > > > There is no need for a fixed-clock compatible, nor for clock-frequency
> > > > and clock-output-names.
> > > >
> > > > But most important: this should be documented in the adv748x DT bindings,
> > > > and implemented in the adv748x driver.
> > >
> > > So if the driver is to export that clock for the kernel (like in this case),
> > > it must implement its support?
> >
> > Exactly.  Unless that pin is hardcoded to output a fixed clock, in which case
> > you can just override the existing audio_clk_c rate.
>
> Just to try it out (I'll set #clock-cells to 1), I registered a fixed rate
> clock in the driver, added a clock provider:
>
> adv748x_probe:
>
>     clk = clk_register_fixed_rate(state->dev,
>                                   "clk-hdmi-i2s-mclk",
>                                   NULL     /* parent_name */,
>                                   0        /* flags */,
>                                   12288000 /* rate */);
>     of_clk_add_provider(state->dev->of_node, of_clk_src_simple_get, clk);
>
> And removed the audio_clk_c frequency setting. I also replaced the audio_clk_c
> in the list of input clocks of the R-Car-side sound card with the phandle of
> the adv7482 main node:
>
> salvator-common.dtsi:
>
>     &i2c4 {
>         status = "okay";
>
>         adv7482_hdmi_decoder: video-receiver@70 {
>             #clock-cells = <0>; // to be replaced with <1>
>         };
>     };
>
>     &rcar_sound {
>         clocks = ..., <&adv7482_hdmi_decoder>, ...;
>     };
>
> As everything continues to work as before, I assume that at least the clock
> dependencies were resolved.
>
> Is there a way to verify that the added input clock is actually used?
> IOW, if its frequency is actually has been programmed into the ssi4 (R-Car
> receiving hardware) registers, and not just a left-over from previuos attempts
> or plain default setting?

Have a look at /sys/kernel/debug/clk/clk_summary

> As the ADV748x devices seem to provide also the clocks for video outputs, will
> it make any sense to place the clock definition into the port node?
> Or should all provided clocks be indexed in the main device node?

Sorry, I don't know.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
