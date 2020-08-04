Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9460823BD39
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 17:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729526AbgHDPcx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Aug 2020 11:32:53 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34941 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728467AbgHDPcv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Aug 2020 11:32:51 -0400
Received: by mail-ot1-f68.google.com with SMTP id 93so20717527otx.2;
        Tue, 04 Aug 2020 08:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qatmt//JPwi1mbsIxWPddiiFHQBPfl2gDmEQQ2hQzbk=;
        b=YA1Qznd5+F1T39Y2zv1RpHi9h5odWgMhBgFCc9PDI2ibE53PnqOH0HoYEjC+f3bfqE
         OGyANJaBGsv88DkEhWmBIm1OEMXh+gjgd7sov5Yp871RQQzvGgFQh8HO/VOMvBTjhTv5
         CBFevSd2FxSN5BWy8ishbpRk7nrIpigbGNp0FvDHsWk4hv/hbUZW6d420Z5UkRsP2zMP
         KzUCW6Cqt9JXs4HpNTvqpRBDO+GlvLidBsyOko7oGcERirhZVlEZQ0QPVBbYS1v2m9GX
         vriqRJdm90bZ9pHq5kXwHHwQSn85ZpqkVo8mZe7WA5P48P5qKXHIwPa58Ea73pMjecMI
         T1PA==
X-Gm-Message-State: AOAM531rgO/5P6oLmo20pr0xI+v4H7qI3hxzHuWlvr+iTzmzkK6121Lv
        MgATkAjqowaPFF9T1uSYzO3+9vb89S0xk1ERXHusPMd8
X-Google-Smtp-Source: ABdhPJzG7qI4RyhxG3B6hNJToEp2pigrJTkEwQ9m+um6GnPexUVKm9D/BBSXTUG5n4P1l2cmstIa98lE/PWPwbb3fg8=
X-Received: by 2002:a9d:1b0d:: with SMTP id l13mr17641241otl.145.1596555170237;
 Tue, 04 Aug 2020 08:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <1596470573-15065-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200803180618.GA2297236@oden.dyn.berto.se> <CA+V-a8sHOqM2tB-72Z-wVJjvihycCq1zLuk7Py7uKGMxzOJyaA@mail.gmail.com>
 <20200803192801.GC2297236@oden.dyn.berto.se> <CA+V-a8v0fr9jKMEdOHfDV+DSTqd57NRyQs1phC8nPTcNLR-PfQ@mail.gmail.com>
 <20200804100510.GA2566810@oden.dyn.berto.se> <CAMuHMdW6DtbBUdEPi1DiCUv1n6dxCjvD3b1vVY7tnJq-R+vyiw@mail.gmail.com>
 <CA+V-a8tEdrap_kaDk+K+KuA8_WWndwn4KbqD5i9n0YPVnbJ5Tg@mail.gmail.com>
In-Reply-To: <CA+V-a8tEdrap_kaDk+K+KuA8_WWndwn4KbqD5i9n0YPVnbJ5Tg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 Aug 2020 17:32:38 +0200
Message-ID: <CAMuHMdU2N30vn-SO-AAEf34uW81pqEjfBiCN6pBLZChNucd34g@mail.gmail.com>
Subject: Re: [PATCH v2] media: rcar-vin: Add support to select data pins for
 YCbCr422-8bit input
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Niklas <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Tue, Aug 4, 2020 at 5:12 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Tue, Aug 4, 2020 at 11:17 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Aug 4, 2020 at 12:05 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> > > On 2020-08-04 09:04:25 +0100, Lad, Prabhakar wrote:
> > > > On Mon, Aug 3, 2020 at 8:28 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> > > > > On 2020-08-03 20:17:54 +0100, Lad, Prabhakar wrote:
> > > > > > On Mon, Aug 3, 2020 at 7:06 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> > > > > > > On 2020-08-03 17:02:53 +0100, Lad Prabhakar wrote:
> > > > > > > > Select the data pins for YCbCr422-8bit input format depending on
> > > > > > > > bus_width and data_shift passed as part of DT.
> > > > > > > >
> > > > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > > > > > > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > > > > > > > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > > > > > > > @@ -624,6 +624,11 @@ static int rvin_parallel_parse_v4l2(struct device *dev,
> > > > > > > >       vin->parallel = rvpe;
> > > > > > > >       vin->parallel->mbus_type = vep->bus_type;
> > > > > > > >
> > > > > > > > +     /* select VInDATA[15:8] pins for YCbCr422-8bit format */
> > > > > > > > +     if (vep->bus.parallel.bus_width == BUS_WIDTH_8 &&
> > > > > > > > +         vep->bus.parallel.data_shift == DATA_SHIFT_8)
> > > > > > > > +             vin->parallel->ycbcr_8b_g = true;
> > > > > > > > +
> > > > > > >
> > > > > > > I would store the bus_width and bus_shift values in the struct
> > > > > > > rvin_parallel_entity and evaluate them in place rater then create a flag
> > > > > > > for this specific use-case..
> > > > > > >
> > > > > > Ok will do that.
> > > > > >
> > > > > > > Also according to the documentation is the check correct? Do we not wish
> > > > > > > to use the new mode when bus_width == 16 and bus_shift == 8. The check
> > > > > > > you have here seems to describe a 8 lane bus where 0 lanes are used.
> > > > > > >
> > > > > > bus-width is the actual data lines used, so bus_width == 16 and
> > > > > > bus_shift == 8 would mean use lines 23:8, so just check for bus_width
> > > > > > == 8 and bus_shift == 8 should be sufficient.
> > > > >
> > > > > As you and Geert points out I was wrong, they should indeed both be 8.
> > > > >
> > > > > >
> > > > > > > I think you should also verify that bus_shift is either 0 or 8 as that
> > > > > > > is all the driver supports.
> > > > > > >
> > > > > > Not sure if thats correct.In that case this patch wont make sense, I
> > > > > > believed we agreed upon we determine the YDS depending on both
> > > > > > bus-width and bus-shift.
> > > > >
> > > > > I'm sorry I think I lost you :-) The driver is not capable of supporting
> > > > > bus_width = 8 and bus_shift = 2 right? Maybe we are talking about
> > > > > different things.
> > > > >
> > > > > What I tried to say (updated with the knowledge of that bus_width should
> > > > > indeed be 8 and not 16) was that would it make sens to with bus_width=8
> > > > > allow for a bus_shift value other then 0 or 8? What for example would
> > > > > the driver do if the value was 2?
> > > > >
> > > > I think this should be possible but I am not sure how this will work.
> > > > For example on iWave G21D-Q7 platform with 16-bit wired bus say we
> > > > connect a 8-bit camera as below:
> > > >
> > > > bus-width = 8 and bus-shift = 2
> > > > VI1_G0_B        -> Not connected
> > > > VI1_G1_B        -> Not connected
> > > > VI1_G2_B_16        -> Connected
> > > > VI1_G3_B        -> Connected
> > > > VI1_G4_B        -> Connected
> > > > VI1_G5_B        -> Connected
> > > > VI1_G6_B        -> Connected
> > > > VI1_G7_B        -> Connected
> > > > VI1_DATA7_B/VI1_B7_B_16    -> Connected
> > > > VI1_DATA6_B/VI1_B6_B_16    -> Connected
> > > > VI1_DATA5_B/VI1_B5_B_16    -> Not connected
> > > > VI1_DATA4_B/VI1_B4_B_16    -> Not connected
> > > > VI1_DATA3_B/VI1_B3_B_16    -> Not connected
> > > > VI1_DATA2_B/VI1_B2_B_16    -> Not connected
> > > > VI1_DATA1_B/VI1_B1_B_16    -> Not connected
> > > > VI1_DATA0_B/VI1_B0_B_16    -> Not connected
> > >
> > > I agree this is how I would imagine bus-width = 8 and bus-shift = 2 to
> > > be wired.
> > >
> > > > So in this case for 8-bit YCbCr422 format should YDS be set I am not
> > > > sure. Or is this not a valid case at all ?
> > >
> > > That is my question :-)
> > >
> > > I can't find anything int the documentation that would allow is to do
> > > anything other then bus-width = 8 together with bus-shift = 0 (do not
> > > set YDS) or bus-shift = 8 (set YDS). So that is why I suggested you
> > > check for this and print a warning if bus-shift is anything else :-)
> > >
> > > But if you can figured out how we can do a bus-shift = 2 as in your
> > > example then of course the check is wrong. I have not read the docs
> > > carefully enough about this to rule it out as impossible.
> >
> > IIUIC, this is a completely different scenario than "low" or "high" wiring
> > of 8-bit YCbCr-422, hence YDS does not apply?
> >
> I tend to agree. We only enable YDS if bus-width = 8 and bus-shift=8
> as done by this patch. (Although there isn't enough documentation to
> prove it)
>
> > The iWave G21D-Q7 wiring seems to be 10-bit YCbCr-422 with the 2 LSB
> > bits unconnected?
> >
> B-8bit/ BG-16 bit for VI0 and  B-8bit/ BG-16 bit for VI0
>
> > Interestingly, that mode is supported on all RZ/G1 SoCs, on most R-Car
> > Gen3 SoCs, but only on a single R-Car Gen2 SoC (V2H).
> >
> YDS mode ?

No, 10-bit YCbCr-422. But please forget my comment, I was looking at
the wrong table.

VI1_G[7:2] plus VI1_DATA[7:6] is not even a contiguous subset (I had
misread the used subset to be G[1:0] and B[7:2]), so it cannot be represented
using just bus-width and bus-shift properties?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
