Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0296C175F4B
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 17:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgCBQNm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 11:13:42 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46788 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726621AbgCBQNm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 11:13:42 -0500
Received: by mail-oi1-f196.google.com with SMTP id a22so10778402oid.13;
        Mon, 02 Mar 2020 08:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=wQyyrYKhl2IEkNe34AsK9CIVdMgcXzMGqPt74D0oPoI=;
        b=BjEToWRvD2dK2QDQVsWeFuMDh3mPeXGyaEStYhNNDoU7gOv3RzlMbJYPeGiyrE00/s
         y8FmXCBrXKefvbqJ8K+oIWOa/0psE51bmwxXFjRoVVf6EebxD0QGk8haluXHLRfs2L9t
         4zPLBhHb6LbMMTFc1qL2BeuejtCFy0URVHXFw/5vkYyve668cCYnM4XH9wg/lr2uAGF2
         NG/IYw8fc04kJw3Y3TkH04ZYTW6ppljAQnCXcnbu9lCBWV4aTMXzGcQsICoHdw7ZHAfv
         b80TuOZprpBeqHfnSCjThoTm9+uwX5Gx5T/uG617JkZ0m+2dAeq/rvsJPRHgW8WqAqFU
         N/RA==
X-Gm-Message-State: ANhLgQ2ok++G6w+89LLA+15RbeWs9JsHMbUiqN1OUxaZ6sF6mVcSUIsD
        elzcXlcJ/+OBZaidwECwc2fSyFhV4SLCEow26JU=
X-Google-Smtp-Source: ADFU+vtgX5P8l3pp8Byli/gDvMCPgCR1jBlOu2Z5pKiwIOplHm/8t6TqxYo4MB2Jy/30YCeHN5RgbSXCAHjgMhFgi3s=
X-Received: by 2002:aca:ac4c:: with SMTP id v73mr185003oie.102.1583165621604;
 Mon, 02 Mar 2020 08:13:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578924232.git.alexander.riesen@cetitec.com>
 <20200113141556.GI3606@pflmari> <CAMuHMdV9urx-6N4tiaPdkssa6Wu-9HSB4VY-rvCu+8JpfZcBfA@mail.gmail.com>
 <20200302134011.GA3717@pflmari> <CAMuHMdWobAE+y90DRi+zQadObWPxLyQiGNTe4t77O-2S1Vp5yA@mail.gmail.com>
 <20200302150706.GB3717@pflmari> <CAMuHMdW21rYXoOSE8azHNqYjng_j41rsL=Fo2bZc=1ULi9+pLw@mail.gmail.com>
 <20200302160906.GC3717@pflmari>
In-Reply-To: <20200302160906.GC3717@pflmari>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 Mar 2020 17:13:30 +0100
Message-ID: <CAMuHMdVNGsVHyvAgC5dAHx=8Ax18EHx2tS6Hm5Bkg4ms=mW6Zw@mail.gmail.com>
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

On Mon, Mar 2, 2020 at 5:09 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> Geert Uytterhoeven, Mon, Mar 02, 2020 16:32:32 +0100:
> > > And this absence of documentation also means that whatever clocks (both input
> > > in "clocks=" and output in "#clock-cells") listed in a specific .dts are just
> > > an integration detail?
> >
> > No, the absence probably means that any clock-related properties in a .dts
> > file will just be ignored.
> >
> > Looking at the driver source, it indeed has no support related to clocks at all.
>
> ...
>
> > > Does this below makes more sense, than?
> > >
> > >     video-receiver@70 {
> > >         compatible = "adi,adv7482";
> > >         clocks = <&rcar_sound 3>;
> > >         clock-names = "clk-hdmi-video";
> > >         adv748x_mclk: mclk {
> > >             compatible = "fixed-clock";
> > >             #clock-cells =  <0>;
> > >             /* frequency hard-coded for illustration */
> > >             clock-frequency = <12288000>;
> > >             clock-output-names = "clk-hdmi-i2s-mclk";
> > >         };
> > >     };
> >
> > The #clock-cells should be in the main video-receiver node.
> > Probably there is more than one clock output, so #clock-cells may be 1?
>
> AFAICS, the device can provide only this one clock line (audio master clock
> for I2S output)... I shall re-check, just in case.
>
> > There is no need for a fixed-clock compatible, nor for clock-frequency
> > and clock-output-names.
> >
> > But most important: this should be documented in the adv748x DT bindings,
> > and implemented in the adv748x driver.
>
> So if the driver is to export that clock for the kernel (like in this case),
> it must implement its support?

Exactly.  Unless that pin is hardcoded to output a fixed clock, in which case
you can just override the existing audio_clk_c rate.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
