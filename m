Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8811770D7
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 09:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgCCIKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 03:10:45 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44266 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727654AbgCCIKp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 03:10:45 -0500
Received: by mail-ot1-f67.google.com with SMTP id v22so2086552otq.11;
        Tue, 03 Mar 2020 00:10:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L4V0nO6YoFQC+VrJorOZx6spYOy7Y14kJjuP4AbSkIU=;
        b=PbEXrlLp2334WdUN/e3b5ckICpiQ2Evoi8UpHxP8GJsMYA2UUvO6rlcORMKf2BkhdH
         ZeqoxIONQgyJJlrOENvUEGyDXH6HTGGmkXdnnDNSkh68g2E+YsHYQ0chZYTxf28b8h6B
         H7abpILC//Ix7/rv5i7eBiGJsGFiif1aCZx5EYalhPGGqQGv7fzNDXivn2XIl6T4ic/c
         oEtYAvImfq9QlS9kgcLptAetwQHMLqPxVxH1dpEg3dQHY3mBEiiVEBLU1Z8kRrkIzlYF
         ELYpIswcGQvyKSm2SkLrtRZeC6D7liGqQAwinja7zUASR5758gmJspOuu8JyJg5R0ppL
         wyVg==
X-Gm-Message-State: ANhLgQ1u9Dx8hWyr3gK3CEzhLBINNtYVdCs5WHAznzOgI0+/bnaTjlu1
        LcNLZ0NEs5nllwmlpkXUKyyvJSxOnfji+y46A7w=
X-Google-Smtp-Source: ADFU+vuWzFfOUoamA3IIYQ4UI32smmS6vWrPi1qIqsiRlYKHqGQaJDMJFksM/3CcoBGTBlx4iYe24VYAu2AOIG3J9zU=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr2470704otk.145.1583223044438;
 Tue, 03 Mar 2020 00:10:44 -0800 (PST)
MIME-Version: 1.0
References: <20200228170210.18252-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUn9njDRWZPcSD87YuejmhNvDK3pUqL5kXNX6KA-8Y72g@mail.gmail.com> <CA+V-a8tZaAp3q0JtavGK0MV4MxcZqNMkuvY=dMj8CFu7k3w0NA@mail.gmail.com>
In-Reply-To: <CA+V-a8tZaAp3q0JtavGK0MV4MxcZqNMkuvY=dMj8CFu7k3w0NA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 Mar 2020 09:10:33 +0100
Message-ID: <CAMuHMdWtom=LB93K_KLBZaRUgTDue8HYArhs5jf0gBG1eMCMVw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0-cat874: Add support for
 AISTARVISION MIPI Adapter V2.1
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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

On Tue, Mar 3, 2020 at 8:51 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Mon, Mar 2, 2020 at 3:57 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Feb 28, 2020 at 6:02 PM Lad Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > This patch adds support AISTARVISION MIPI Adapter V2.1 board connected
> > > to G2E board. Common file aistarvision-mipi-adapter-2.1.dtsi is created
> > > which have the camera endpoint nodes with disabled status and in
> > > r8a774c0-ek874-mipi-2.1.dts file VIN/CSI nodes are enabled. By default
> > > imx219 endpoint is tied with CSI2.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts

> > > +
> > > +&ov5645 {
> > > +       /* uncomment status and remote-endpoint properties to tie ov5645
> > > +        * to CSI2 also make sure remote-endpoint for imx219 camera is
> > > +        * commented and remote endpoint in csi40_in is ov5645_ep
> > > +        */
> > > +       /* status = "okay"; */
> > > +
> > > +       #address-cells = <1>;
> > > +       #size-cells = <0>;
> >
> > #{address,size}-cells not needed.
> >
> agreed will drop it.
>
> > > +       enable-gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
> > > +       reset-gpios = <&gpio5 3 GPIO_ACTIVE_LOW>;
> > > +
> > > +       clocks = <&cpg CPG_MOD 716>;
> > > +       clock-frequency = <24000000>;
> >
> > I know this is dictated by the DT bindings for the ov5645 camera, but
> > specifying a clock rate is usually done through assigned-clock-rates,
> > cfr.  Documentation/devicetree/bindings/clock/clock-bindings.txt.
> >
> agreed will replace it.

Note that doing so means you have to fix the ov5645 driver, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
