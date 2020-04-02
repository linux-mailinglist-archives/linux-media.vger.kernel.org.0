Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B14F19C5D4
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 17:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389300AbgDBP02 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 11:26:28 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33194 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389241AbgDBP02 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 11:26:28 -0400
Received: by mail-ot1-f66.google.com with SMTP id 22so3862813otf.0;
        Thu, 02 Apr 2020 08:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Cqw6dnlRH1Z235Qgu5cq2jTZRWby77FH7SYPVq5JKBY=;
        b=pwUX+YMoU1SdKQvJkwExabEB30w3gxI/iQZ/NNnENiz0of7OIFzcfnkc/UTmSa9RrN
         BvjzeZl0eQhR8QUk1L+P8+SrsUgKXeP8vL//p7kXsioBu7WHZiw19UXqT18XHU1Lw9IW
         ztONV1j2c1aY2OOYLnlEyAowDa3qVs54eMMhQwcZHxu1V2RqS7TIzebIcXQpKmhBXMoX
         MOiodwSBmZzENnWfS6S2QMG3x39rFD03HW3XgPqTbIIKl3CxUb+Mj6vLL9H64xW6qBDt
         kmMNPYtTgymvKud01cvMocDtnXbq8lxw02AMEiiZJJJIZwiNC23AMgUV/52/d376bEOf
         wpyw==
X-Gm-Message-State: AGi0PuZLdGP0Dkmz+/2ch6ZeSR2LCMDfENpI5Gu6z9P32KD8r34xXpg4
        jN74/ekUdRu3WCMnl274PMZKed/I9M9eg1yT5gjFNA==
X-Google-Smtp-Source: APiQypKpY9WpXH7nOqTR0dBL+FBpHDPCUuTtOLsWZcfUeGr3r0SvTBjAnlsfhR6ZMs2a4cWyEgqEHDrB1c5wAgPfOWA=
X-Received: by 2002:a4a:e495:: with SMTP id s21mr3164931oov.79.1585841187762;
 Thu, 02 Apr 2020 08:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585218857.git.alexander.riesen@cetitec.com>
 <ad15f80df51c95a7c24498bb0bd3a46f55fbb62e.1585218857.git.alexander.riesen@cetitec.com>
 <CAMuHMdV+joeNWJotKySVPHNW9OoT8+iODBwhK5fACspq2SX_eg@mail.gmail.com> <20200402141654.GB4291@pflmari>
In-Reply-To: <20200402141654.GB4291@pflmari>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Apr 2020 17:26:15 +0200
Message-ID: <CAMuHMdV6a=adKVmmRm_3qOSA37kDRfc63G+qQpN4UR-hj3R65g@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] arm64: dts: renesas: salvator: add a connection
 from adv748x codec (HDMI input) to the R-Car SoC
To:     Alex Riesen <alexander.riesen@cetitec.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

On Thu, Apr 2, 2020 at 5:03 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> Geert Uytterhoeven, Mon, Mar 30, 2020 10:32:47 +0200:
> > On Thu, Mar 26, 2020 at 11:55 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > > @@ -510,6 +511,15 @@ adv7482_txb: endpoint {
> > >                                 remote-endpoint = <&csi20_in>;
> > >                         };
> > >                 };
> > > +
> > > +               port@c {
> > > +                       reg = <12>;
> > > +
> > > +                       adv7482_i2s: endpoint {
> > > +                               remote-endpoint = <&rsnd_endpoint3>;
> > > +                               system-clock-direction-out;
> > > +                       };
> > > +               };
> >
> > As the adv748x driver just ignores "invalid" endpoints...
> >
> > > @@ -758,8 +769,19 @@ &rcar_sound {
> > >                  <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
> > >                  <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
> > >                  <&audio_clk_a>, <&cs2000>,
> > > -                <&audio_clk_c>,
> > > +                <&adv7482_hdmi_in>,
> > >                  <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
> >
> > ... and the rsnd driver ignores nonexistent-clocks, the DT change has no
> > hard dependency on the driver change, and won't introduce regressions
> > when included, right?
>
> Well, it maybe won't, but isn't it a little ... implicit?
> And I'm no haste to include the changes, if you mean I can (or should) submit
> the device tree patch separately.

OK, fine for me to postpone (that'll be for v5.9, I guess?).

> > > @@ -777,6 +799,21 @@ rsnd_endpoint0: endpoint {
> > >                                 capture  = <&ssi1 &src1 &dvc1>;
> > >                         };
> > >                 };
> > > +               rsnd_port3: port@3 {
> > > +                       reg = <3>;
> > > +                       rsnd_endpoint3: endpoint {
> > > +                               remote-endpoint = <&adv7482_i2s>;
> > > +
> > > +                               dai-tdm-slot-num = <8>;
> > > +                               dai-tdm-slot-width = <32>;
> > > +                               dai-format = "left_j";
> > > +                               mclk-fs = <256>;
> > > +                               bitclock-master = <&adv7482_i2s>;
> > > +                               frame-master = <&adv7482_i2s>;
> > > +
> > > +                               capture = <&ssi4>;
> > > +                       };
> > > +               };
> > >         };
> > >  };
> >
> > However, as salvator-common.dtsi is shared by all Salvator-X(S) variants,
> > you'll have to add a dummy ssi4 node to r8a77961.dtsi first.
>
> I see. There are even two dummy SSI nodes already. I would prefer to submit
> the change together with other Salvator device tree changes. Is that alright?

Fine for me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
