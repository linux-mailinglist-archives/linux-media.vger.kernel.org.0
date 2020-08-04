Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAD723BCFB
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 17:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729435AbgHDPMb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Aug 2020 11:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728467AbgHDPMb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Aug 2020 11:12:31 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58DA3C06174A;
        Tue,  4 Aug 2020 08:12:30 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id q3so2645597ybp.7;
        Tue, 04 Aug 2020 08:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ysfQUiDz1CU9A7v5701EkHnjvXh2x287rzNKtNvKkdg=;
        b=gHOVZ1I7b4A/8qCvwPrTTEzpSywZ6TJ6bBzqqSHH32ds1kJDsDKQ4L+U8SsY+X8wii
         rv2Thw/Dvo2pmxW+1x56xUzDcxZW+MS+r9Dt5OLDjUCfIlMFYox/SLjrcEf96q25gHwT
         5ap+B4nIyZphmrEPTBqt2OtMrKE+fZ7cPlUdRazH1IOg8bP/yN4JAIzu/QR/Wfu2HwwF
         UE8VgFOhP/W6ScElp0/izdgamk9CKcDyc1js8UhwCj5/TmT1WlsCdNexvgB2VuF8pQCF
         DX5fyQS8EvtUJp6KYrdp/LGgi38gxAIepFyH15ccJ14kUQqguP6bHYjj4Ntfndc0O61X
         xSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ysfQUiDz1CU9A7v5701EkHnjvXh2x287rzNKtNvKkdg=;
        b=CWiQRCP/1mrNaqoh831zMd+/izfUKK0U85M3kOZHTTJ+A2d/5aocewaIDN1nXweE65
         241AcN/yVTYw2XcQYNleRus/YeCKAjxhel0QAgLw0yQgNrTjUwGMp8fDNujErybyf9ik
         vSEMRq0dlZpt1RTqDM0C6J5BJz+ebTreXXGRX5UttslI42d17nTn1rctNEV523JulcQm
         3QwEpGOpbWlDQEnsiCMgUHZ9vWOojnxpaIVD2rr3jIpcOCiKzdp9WAD3ut5gz66qM/5c
         TVYJ6T9ef887yp3ZVX5B4bObkUs8aT0pr+pNQpHhCHQDD9P7UMy3er9UIVkGSRoFDU8H
         wG3Q==
X-Gm-Message-State: AOAM531U+7AIyQFJlsZZWecCl7nnuZnIppk8k4tHpZwDizUZQQA4uOqC
        tbWxfkyBOswVOb5PgQ62Mijucv0XSVMVAXvt8czJ5noP
X-Google-Smtp-Source: ABdhPJyC/UfIU6NxTJH45USmETsypgu/0+FxFXVBt7q/Ju55dg+/713me05NPIziLDcV3mzcDOR0H/GElDpsAizdOG8=
X-Received: by 2002:a25:6ad6:: with SMTP id f205mr35099053ybc.76.1596553949059;
 Tue, 04 Aug 2020 08:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <1596470573-15065-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200803180618.GA2297236@oden.dyn.berto.se> <CA+V-a8sHOqM2tB-72Z-wVJjvihycCq1zLuk7Py7uKGMxzOJyaA@mail.gmail.com>
 <20200803192801.GC2297236@oden.dyn.berto.se> <CA+V-a8v0fr9jKMEdOHfDV+DSTqd57NRyQs1phC8nPTcNLR-PfQ@mail.gmail.com>
 <20200804100510.GA2566810@oden.dyn.berto.se> <CAMuHMdW6DtbBUdEPi1DiCUv1n6dxCjvD3b1vVY7tnJq-R+vyiw@mail.gmail.com>
In-Reply-To: <CAMuHMdW6DtbBUdEPi1DiCUv1n6dxCjvD3b1vVY7tnJq-R+vyiw@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 4 Aug 2020 16:12:02 +0100
Message-ID: <CA+V-a8tEdrap_kaDk+K+KuA8_WWndwn4KbqD5i9n0YPVnbJ5Tg@mail.gmail.com>
Subject: Re: [PATCH v2] media: rcar-vin: Add support to select data pins for
 YCbCr422-8bit input
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,

On Tue, Aug 4, 2020 at 11:17 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Niklas, Prabhakar,
>
> On Tue, Aug 4, 2020 at 12:05 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> > On 2020-08-04 09:04:25 +0100, Lad, Prabhakar wrote:
> > > On Mon, Aug 3, 2020 at 8:28 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> > > > On 2020-08-03 20:17:54 +0100, Lad, Prabhakar wrote:
> > > > > On Mon, Aug 3, 2020 at 7:06 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> > > > > > On 2020-08-03 17:02:53 +0100, Lad Prabhakar wrote:
> > > > > > > Select the data pins for YCbCr422-8bit input format depending on
> > > > > > > bus_width and data_shift passed as part of DT.
> > > > > > >
> > > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> > > > > > > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > > > > > > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > > > > > > @@ -624,6 +624,11 @@ static int rvin_parallel_parse_v4l2(struct device *dev,
> > > > > > >       vin->parallel = rvpe;
> > > > > > >       vin->parallel->mbus_type = vep->bus_type;
> > > > > > >
> > > > > > > +     /* select VInDATA[15:8] pins for YCbCr422-8bit format */
> > > > > > > +     if (vep->bus.parallel.bus_width == BUS_WIDTH_8 &&
> > > > > > > +         vep->bus.parallel.data_shift == DATA_SHIFT_8)
> > > > > > > +             vin->parallel->ycbcr_8b_g = true;
> > > > > > > +
> > > > > >
> > > > > > I would store the bus_width and bus_shift values in the struct
> > > > > > rvin_parallel_entity and evaluate them in place rater then create a flag
> > > > > > for this specific use-case..
> > > > > >
> > > > > Ok will do that.
> > > > >
> > > > > > Also according to the documentation is the check correct? Do we not wish
> > > > > > to use the new mode when bus_width == 16 and bus_shift == 8. The check
> > > > > > you have here seems to describe a 8 lane bus where 0 lanes are used.
> > > > > >
> > > > > bus-width is the actual data lines used, so bus_width == 16 and
> > > > > bus_shift == 8 would mean use lines 23:8, so just check for bus_width
> > > > > == 8 and bus_shift == 8 should be sufficient.
> > > >
> > > > As you and Geert points out I was wrong, they should indeed both be 8.
> > > >
> > > > >
> > > > > > I think you should also verify that bus_shift is either 0 or 8 as that
> > > > > > is all the driver supports.
> > > > > >
> > > > > Not sure if thats correct.In that case this patch wont make sense, I
> > > > > believed we agreed upon we determine the YDS depending on both
> > > > > bus-width and bus-shift.
> > > >
> > > > I'm sorry I think I lost you :-) The driver is not capable of supporting
> > > > bus_width = 8 and bus_shift = 2 right? Maybe we are talking about
> > > > different things.
> > > >
> > > > What I tried to say (updated with the knowledge of that bus_width should
> > > > indeed be 8 and not 16) was that would it make sens to with bus_width=8
> > > > allow for a bus_shift value other then 0 or 8? What for example would
> > > > the driver do if the value was 2?
> > > >
> > > I think this should be possible but I am not sure how this will work.
> > > For example on iWave G21D-Q7 platform with 16-bit wired bus say we
> > > connect a 8-bit camera as below:
> > >
> > > bus-width = 8 and bus-shift = 2
> > > VI1_G0_B        -> Not connected
> > > VI1_G1_B        -> Not connected
> > > VI1_G2_B_16        -> Connected
> > > VI1_G3_B        -> Connected
> > > VI1_G4_B        -> Connected
> > > VI1_G5_B        -> Connected
> > > VI1_G6_B        -> Connected
> > > VI1_G7_B        -> Connected
> > > VI1_DATA7_B/VI1_B7_B_16    -> Connected
> > > VI1_DATA6_B/VI1_B6_B_16    -> Connected
> > > VI1_DATA5_B/VI1_B5_B_16    -> Not connected
> > > VI1_DATA4_B/VI1_B4_B_16    -> Not connected
> > > VI1_DATA3_B/VI1_B3_B_16    -> Not connected
> > > VI1_DATA2_B/VI1_B2_B_16    -> Not connected
> > > VI1_DATA1_B/VI1_B1_B_16    -> Not connected
> > > VI1_DATA0_B/VI1_B0_B_16    -> Not connected
> >
> > I agree this is how I would imagine bus-width = 8 and bus-shift = 2 to
> > be wired.
> >
> > >
> > > So in this case for 8-bit YCbCr422 format should YDS be set I am not
> > > sure. Or is this not a valid case at all ?
> >
> > That is my question :-)
> >
> > I can't find anything int the documentation that would allow is to do
> > anything other then bus-width = 8 together with bus-shift = 0 (do not
> > set YDS) or bus-shift = 8 (set YDS). So that is why I suggested you
> > check for this and print a warning if bus-shift is anything else :-)
> >
> > But if you can figured out how we can do a bus-shift = 2 as in your
> > example then of course the check is wrong. I have not read the docs
> > carefully enough about this to rule it out as impossible.
>
> IIUIC, this is a completely different scenario than "low" or "high" wiring
> of 8-bit YCbCr-422, hence YDS does not apply?
>
I tend to agree. We only enable YDS if bus-width = 8 and bus-shift=8
as done by this patch. (Although there isn't enough documentation to
prove it)

> The iWave G21D-Q7 wiring seems to be 10-bit YCbCr-422 with the 2 LSB
> bits unconnected?
>
B-8bit/ BG-16 bit for VI0 and  B-8bit/ BG-16 bit for VI0

> Interestingly, that mode is supported on all RZ/G1 SoCs, on most R-Car
> Gen3 SoCs, but only on a single R-Car Gen2 SoC (V2H).
>
YDS mode ?

Chers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
