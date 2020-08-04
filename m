Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0FA623B8A0
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 12:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgHDKRv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Aug 2020 06:17:51 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39132 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgHDKRv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Aug 2020 06:17:51 -0400
Received: by mail-oi1-f196.google.com with SMTP id a24so15347189oia.6;
        Tue, 04 Aug 2020 03:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eg6tBbbFL0jIwAIkYTDFccvSULDji7gGbzCt7TMRZy0=;
        b=AOs9FAyF/Y/h3o/3pGSIvYTXBEXndDyadsCpokj5SIxsJs54KfKapj4epxWeU6BZgN
         OH/+w1RhDCsc5ugpQCbTwqYf7fNlfM14M7tHi2RUYiWOpmTN1zTe6xfsMl+fZkkUQOdm
         lkTPuFQ3UGWd2uhGPgxvUGKtU4lDIKN7mWp5kt75JIzZRj6S5jWammeKDBM23Mb2qE6Y
         T4NIYbBDm43piDO3/vxrVaXgwjHos0Hj8TuTkRuVWq0LWZ/NjpgtgFKqAL0R3BWGweaD
         mnKPfrZXjyg7Z1wjT7PN04qdYDDxFhQC48hvXePhEpmcj07Vedz70oggTF2CSIIeQuIU
         PTcg==
X-Gm-Message-State: AOAM531ao6FLOJel1R93uIwBhvSYCJyThYWGno/r0wSknvMDP4+rv+Hp
        uS3JTiCnHa6Wh2fFaW+7yDAdn44l9I9MImLzSkg=
X-Google-Smtp-Source: ABdhPJxttgUY12kGi2afbxUSfeXtVUqlF8pevHR8kww2zOm/vbjwLKE3ZmiB+qfuneKUcv9XF+pCL6zEH4lF+W+8byA=
X-Received: by 2002:aca:b742:: with SMTP id h63mr2631284oif.148.1596536269749;
 Tue, 04 Aug 2020 03:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <1596470573-15065-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200803180618.GA2297236@oden.dyn.berto.se> <CA+V-a8sHOqM2tB-72Z-wVJjvihycCq1zLuk7Py7uKGMxzOJyaA@mail.gmail.com>
 <20200803192801.GC2297236@oden.dyn.berto.se> <CA+V-a8v0fr9jKMEdOHfDV+DSTqd57NRyQs1phC8nPTcNLR-PfQ@mail.gmail.com>
 <20200804100510.GA2566810@oden.dyn.berto.se>
In-Reply-To: <20200804100510.GA2566810@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 Aug 2020 12:17:38 +0200
Message-ID: <CAMuHMdW6DtbBUdEPi1DiCUv1n6dxCjvD3b1vVY7tnJq-R+vyiw@mail.gmail.com>
Subject: Re: [PATCH v2] media: rcar-vin: Add support to select data pins for
 YCbCr422-8bit input
To:     Niklas <niklas.soderlund@ragnatech.se>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas, Prabhakar,

On Tue, Aug 4, 2020 at 12:05 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> On 2020-08-04 09:04:25 +0100, Lad, Prabhakar wrote:
> > On Mon, Aug 3, 2020 at 8:28 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> > > On 2020-08-03 20:17:54 +0100, Lad, Prabhakar wrote:
> > > > On Mon, Aug 3, 2020 at 7:06 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> > > > > On 2020-08-03 17:02:53 +0100, Lad Prabhakar wrote:
> > > > > > Select the data pins for YCbCr422-8bit input format depending on
> > > > > > bus_width and data_shift passed as part of DT.
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > > > > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > > > > > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > > > > > @@ -624,6 +624,11 @@ static int rvin_parallel_parse_v4l2(struct device *dev,
> > > > > >       vin->parallel = rvpe;
> > > > > >       vin->parallel->mbus_type = vep->bus_type;
> > > > > >
> > > > > > +     /* select VInDATA[15:8] pins for YCbCr422-8bit format */
> > > > > > +     if (vep->bus.parallel.bus_width == BUS_WIDTH_8 &&
> > > > > > +         vep->bus.parallel.data_shift == DATA_SHIFT_8)
> > > > > > +             vin->parallel->ycbcr_8b_g = true;
> > > > > > +
> > > > >
> > > > > I would store the bus_width and bus_shift values in the struct
> > > > > rvin_parallel_entity and evaluate them in place rater then create a flag
> > > > > for this specific use-case..
> > > > >
> > > > Ok will do that.
> > > >
> > > > > Also according to the documentation is the check correct? Do we not wish
> > > > > to use the new mode when bus_width == 16 and bus_shift == 8. The check
> > > > > you have here seems to describe a 8 lane bus where 0 lanes are used.
> > > > >
> > > > bus-width is the actual data lines used, so bus_width == 16 and
> > > > bus_shift == 8 would mean use lines 23:8, so just check for bus_width
> > > > == 8 and bus_shift == 8 should be sufficient.
> > >
> > > As you and Geert points out I was wrong, they should indeed both be 8.
> > >
> > > >
> > > > > I think you should also verify that bus_shift is either 0 or 8 as that
> > > > > is all the driver supports.
> > > > >
> > > > Not sure if thats correct.In that case this patch wont make sense, I
> > > > believed we agreed upon we determine the YDS depending on both
> > > > bus-width and bus-shift.
> > >
> > > I'm sorry I think I lost you :-) The driver is not capable of supporting
> > > bus_width = 8 and bus_shift = 2 right? Maybe we are talking about
> > > different things.
> > >
> > > What I tried to say (updated with the knowledge of that bus_width should
> > > indeed be 8 and not 16) was that would it make sens to with bus_width=8
> > > allow for a bus_shift value other then 0 or 8? What for example would
> > > the driver do if the value was 2?
> > >
> > I think this should be possible but I am not sure how this will work.
> > For example on iWave G21D-Q7 platform with 16-bit wired bus say we
> > connect a 8-bit camera as below:
> >
> > bus-width = 8 and bus-shift = 2
> > VI1_G0_B        -> Not connected
> > VI1_G1_B        -> Not connected
> > VI1_G2_B_16        -> Connected
> > VI1_G3_B        -> Connected
> > VI1_G4_B        -> Connected
> > VI1_G5_B        -> Connected
> > VI1_G6_B        -> Connected
> > VI1_G7_B        -> Connected
> > VI1_DATA7_B/VI1_B7_B_16    -> Connected
> > VI1_DATA6_B/VI1_B6_B_16    -> Connected
> > VI1_DATA5_B/VI1_B5_B_16    -> Not connected
> > VI1_DATA4_B/VI1_B4_B_16    -> Not connected
> > VI1_DATA3_B/VI1_B3_B_16    -> Not connected
> > VI1_DATA2_B/VI1_B2_B_16    -> Not connected
> > VI1_DATA1_B/VI1_B1_B_16    -> Not connected
> > VI1_DATA0_B/VI1_B0_B_16    -> Not connected
>
> I agree this is how I would imagine bus-width = 8 and bus-shift = 2 to
> be wired.
>
> >
> > So in this case for 8-bit YCbCr422 format should YDS be set I am not
> > sure. Or is this not a valid case at all ?
>
> That is my question :-)
>
> I can't find anything int the documentation that would allow is to do
> anything other then bus-width = 8 together with bus-shift = 0 (do not
> set YDS) or bus-shift = 8 (set YDS). So that is why I suggested you
> check for this and print a warning if bus-shift is anything else :-)
>
> But if you can figured out how we can do a bus-shift = 2 as in your
> example then of course the check is wrong. I have not read the docs
> carefully enough about this to rule it out as impossible.

IIUIC, this is a completely different scenario than "low" or "high" wiring
of 8-bit YCbCr-422, hence YDS does not apply?

The iWave G21D-Q7 wiring seems to be 10-bit YCbCr-422 with the 2 LSB
bits unconnected?

Interestingly, that mode is supported on all RZ/G1 SoCs, on most R-Car
Gen3 SoCs, but only on a single R-Car Gen2 SoC (V2H).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
