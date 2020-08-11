Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97D28241F61
	for <lists+linux-media@lfdr.de>; Tue, 11 Aug 2020 19:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729204AbgHKRl1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Aug 2020 13:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728862AbgHKRl1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Aug 2020 13:41:27 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E5EC06174A;
        Tue, 11 Aug 2020 10:41:26 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id q16so7493278ybk.6;
        Tue, 11 Aug 2020 10:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b9E+UB3shoSiLG3Jxg4lZBvsiTHHDP5uDKkDJ6F5GUA=;
        b=AtN2XM0NEgJXvOJSFwc85wCyJndUY5z4MgV1l1UwYdnMmVMR296f62NqTyRK36raXV
         qM9jjALtjYLqxVwu6+QbX0HygCXFLLrhfbfQQ1CpA0XRk1yQK99Q/KbP9oTNHd2wGJsK
         CflaoMMJ2UivYgG7UGjow2d2iM1ScZZIasz32lfdRAsLpGaNW9AXEbK3JY+LvBXQ/pcb
         zvegBjwydS2EFgm4yUmRjWj+kF0VEHbmGK0SgHQZhQzvFx5YdjDZmq+7xnSFx7LgCWvd
         ivbkH+ZN3c01eY+58J0/mSK5bB4vmyuSAtA8tix18RJyNTVKvQgbH6Rg2HRXFTg0HRC5
         QPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b9E+UB3shoSiLG3Jxg4lZBvsiTHHDP5uDKkDJ6F5GUA=;
        b=gjNow2C5cf18mmmWzlYSIZTzi86FRAnhkoXhpyZg132FIsBihwmU3fH3o1QqJ1I1qv
         2Tbt2gztIPp0yUukn0CNAFD835WbGy7Xm/CmDw0wv8De+hnWXSuPgHhup8R2zrpo8RWh
         AeUHZaJcMA8wiSZd3yqBqBV9S2dC01ndMrWLOfVlsBkWXsFYdDGcWFT12rDSitBg3xWk
         yLBadbNgvTItT0vH1oOeG7NcdxX46aaOfyqOBNRvJZ0wkN2dqgyKrI02x7uc8sZtsS4Y
         iUgXpXmLA6FxiMh/8f4TOnMbcsTObJs2pnXhO3sMvb+EkJe5n4cDdPz6ledxm80youI4
         WT0w==
X-Gm-Message-State: AOAM5301wUWZ0dOWfSSyM6TJAqPuOSPyQmF6DB53InwPslgqG0UX84OL
        +jzFuqoGvlZD+t47cP1MLzJXM5p/rzAP/1wnqvG8Nuu5/sE=
X-Google-Smtp-Source: ABdhPJycVTsA6gwRh2/UyY2SS5/6qJq8zqGn5vIVeVX750XbtB2+xvOs+OT6i/wV1FQkxc8NuCphsA2qau6sCqCTGMI=
X-Received: by 2002:a5b:40f:: with SMTP id m15mr45312663ybp.25.1597167685014;
 Tue, 11 Aug 2020 10:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200803192801.GC2297236@oden.dyn.berto.se> <CA+V-a8v0fr9jKMEdOHfDV+DSTqd57NRyQs1phC8nPTcNLR-PfQ@mail.gmail.com>
 <20200804100510.GA2566810@oden.dyn.berto.se> <CAMuHMdW6DtbBUdEPi1DiCUv1n6dxCjvD3b1vVY7tnJq-R+vyiw@mail.gmail.com>
 <CA+V-a8tEdrap_kaDk+K+KuA8_WWndwn4KbqD5i9n0YPVnbJ5Tg@mail.gmail.com>
 <CAMuHMdU2N30vn-SO-AAEf34uW81pqEjfBiCN6pBLZChNucd34g@mail.gmail.com>
 <CA+V-a8v+FH08mcmnR=0RnqvYTeydw4AifbsyT6_KcHxxEokp5w@mail.gmail.com>
 <CAMuHMdXt95CSTOkWotrXad6_9+bhWrA8Q-WKA3_NdApbTTLVrA@mail.gmail.com>
 <20200805123451.GA5925@pendragon.ideasonboard.com> <CA+V-a8tWO2XRsTqu+dSkexrx0dEqw9t8Be0QouR6U+BhQY5Yow@mail.gmail.com>
 <20200811114111.GH6054@pendragon.ideasonboard.com>
In-Reply-To: <20200811114111.GH6054@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 11 Aug 2020 18:40:58 +0100
Message-ID: <CA+V-a8tiWf0PabLQzcbfguB=R-dbofJ6rCmCHEowuOXKBA0i2Q@mail.gmail.com>
Subject: Re: [PATCH v2] media: rcar-vin: Add support to select data pins for
 YCbCr422-8bit input
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
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

Hi Laurent,

On Tue, Aug 11, 2020 at 12:41 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Fri, Aug 07, 2020 at 09:20:36PM +0100, Lad, Prabhakar wrote:
> > On Wed, Aug 5, 2020 at 1:35 PM Laurent Pinchart wrote:
> > > On Wed, Aug 05, 2020 at 10:43:25AM +0200, Geert Uytterhoeven wrote:
> > >> On Wed, Aug 5, 2020 at 10:01 AM Lad, Prabhakar wrote:
> > >>> On Tue, Aug 4, 2020 at 4:32 PM Geert Uytterhoeven wrote:
> > >>>> On Tue, Aug 4, 2020 at 5:12 PM Lad, Prabhakar wrote:
> > >>>>> On Tue, Aug 4, 2020 at 11:17 AM Geert Uytterhoeven wrote:
> > >>>>>> On Tue, Aug 4, 2020 at 12:05 PM Niklas wrote:
> > >>>>>>> On 2020-08-04 09:04:25 +0100, Lad, Prabhakar wrote:
> > >>>>>>>> On Mon, Aug 3, 2020 at 8:28 PM Niklas wrote:
> > >>>>>>>>> On 2020-08-03 20:17:54 +0100, Lad, Prabhakar wrote:
> > >>>>>>>>>> On Mon, Aug 3, 2020 at 7:06 PM Niklas wrote:
> > >>>>>>>>>>> On 2020-08-03 17:02:53 +0100, Lad Prabhakar wrote:
> > >>>>>>>>>>>> Select the data pins for YCbCr422-8bit input format depending on
> > >>>>>>>>>>>> bus_width and data_shift passed as part of DT.
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >>>>>>>>>>>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > >>>>>>>>>>>> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > >>>>>>>>>>>> @@ -624,6 +624,11 @@ static int rvin_parallel_parse_v4l2(struct device *dev,
> > >>>>>>>>>>>>       vin->parallel = rvpe;
> > >>>>>>>>>>>>       vin->parallel->mbus_type = vep->bus_type;
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> +     /* select VInDATA[15:8] pins for YCbCr422-8bit format */
> > >>>>>>>>>>>> +     if (vep->bus.parallel.bus_width == BUS_WIDTH_8 &&
> > >>>>>>>>>>>> +         vep->bus.parallel.data_shift == DATA_SHIFT_8)
> > >>>>>>>>>>>> +             vin->parallel->ycbcr_8b_g = true;
> > >>>>>>>>>>>> +
> > >>>>>>>>>>>
> > >>>>>>>>>>> I would store the bus_width and bus_shift values in the struct
> > >>>>>>>>>>> rvin_parallel_entity and evaluate them in place rater then create a flag
> > >>>>>>>>>>> for this specific use-case..
> > >>>>>>>>>>>
> > >>>>>>>>>> Ok will do that.
> > >>>>>>>>>>
> > >>>>>>>>>>> Also according to the documentation is the check correct? Do we not wish
> > >>>>>>>>>>> to use the new mode when bus_width == 16 and bus_shift == 8. The check
> > >>>>>>>>>>> you have here seems to describe a 8 lane bus where 0 lanes are used.
> > >>>>>>>>>>>
> > >>>>>>>>>> bus-width is the actual data lines used, so bus_width == 16 and
> > >>>>>>>>>> bus_shift == 8 would mean use lines 23:8, so just check for bus_width
> > >>>>>>>>>> == 8 and bus_shift == 8 should be sufficient.
> > >>>>>>>>>
> > >>>>>>>>> As you and Geert points out I was wrong, they should indeed both be 8.
> > >>>>>>>>>
> > >>>>>>>>>>
> > >>>>>>>>>>> I think you should also verify that bus_shift is either 0 or 8 as that
> > >>>>>>>>>>> is all the driver supports.
> > >>>>>>>>>>>
> > >>>>>>>>>> Not sure if thats correct.In that case this patch wont make sense, I
> > >>>>>>>>>> believed we agreed upon we determine the YDS depending on both
> > >>>>>>>>>> bus-width and bus-shift.
> > >>>>>>>>>
> > >>>>>>>>> I'm sorry I think I lost you :-) The driver is not capable of supporting
> > >>>>>>>>> bus_width = 8 and bus_shift = 2 right? Maybe we are talking about
> > >>>>>>>>> different things.
> > >>>>>>>>>
> > >>>>>>>>> What I tried to say (updated with the knowledge of that bus_width should
> > >>>>>>>>> indeed be 8 and not 16) was that would it make sens to with bus_width=8
> > >>>>>>>>> allow for a bus_shift value other then 0 or 8? What for example would
> > >>>>>>>>> the driver do if the value was 2?
> > >>>>>>>>>
> > >>>>>>>> I think this should be possible but I am not sure how this will work.
> > >>>>>>>> For example on iWave G21D-Q7 platform with 16-bit wired bus say we
> > >>>>>>>> connect a 8-bit camera as below:
> > >>>>>>>>
> > >>>>>>>> bus-width = 8 and bus-shift = 2
> > >>>>>>>> VI1_G0_B        -> Not connected
> > >>>>>>>> VI1_G1_B        -> Not connected
> > >>>>>>>> VI1_G2_B_16        -> Connected
> > >>>>>>>> VI1_G3_B        -> Connected
> > >>>>>>>> VI1_G4_B        -> Connected
> > >>>>>>>> VI1_G5_B        -> Connected
> > >>>>>>>> VI1_G6_B        -> Connected
> > >>>>>>>> VI1_G7_B        -> Connected
> > >>>>>>>> VI1_DATA7_B/VI1_B7_B_16    -> Connected
> > >>>>>>>> VI1_DATA6_B/VI1_B6_B_16    -> Connected
> > >>>>>>>> VI1_DATA5_B/VI1_B5_B_16    -> Not connected
> > >>>>>>>> VI1_DATA4_B/VI1_B4_B_16    -> Not connected
> > >>>>>>>> VI1_DATA3_B/VI1_B3_B_16    -> Not connected
> > >>>>>>>> VI1_DATA2_B/VI1_B2_B_16    -> Not connected
> > >>>>>>>> VI1_DATA1_B/VI1_B1_B_16    -> Not connected
> > >>>>>>>> VI1_DATA0_B/VI1_B0_B_16    -> Not connected
> > >>>>>>>
> > >>>>>>> I agree this is how I would imagine bus-width = 8 and bus-shift = 2 to
> > >>>>>>> be wired.
> > >>>>>>>
> > >>>>>>>> So in this case for 8-bit YCbCr422 format should YDS be set I am not
> > >>>>>>>> sure. Or is this not a valid case at all ?
> > >>>>>>>
> > >>>>>>> That is my question :-)
> > >>>>>>>
> > >>>>>>> I can't find anything int the documentation that would allow is to do
> > >>>>>>> anything other then bus-width = 8 together with bus-shift = 0 (do not
> > >>>>>>> set YDS) or bus-shift = 8 (set YDS). So that is why I suggested you
> > >>>>>>> check for this and print a warning if bus-shift is anything else :-)
> > >>>>>>>
> > >>>>>>> But if you can figured out how we can do a bus-shift = 2 as in your
> > >>>>>>> example then of course the check is wrong. I have not read the docs
> > >>>>>>> carefully enough about this to rule it out as impossible.
> > >>>>>>
> > >>>>>> IIUIC, this is a completely different scenario than "low" or "high" wiring
> > >>>>>> of 8-bit YCbCr-422, hence YDS does not apply?
> > >>>>>>
> > >>>>> I tend to agree. We only enable YDS if bus-width = 8 and bus-shift=8
> > >>>>> as done by this patch. (Although there isn't enough documentation to
> > >>>>> prove it)
> > >>>>>
> > >>>>>> The iWave G21D-Q7 wiring seems to be 10-bit YCbCr-422 with the 2 LSB
> > >>>>>> bits unconnected?
> > >>>>>>
> > >>>>> B-8bit/ BG-16 bit for VI0 and  B-8bit/ BG-16 bit for VI0
> > >>>>>
> > >>>>>> Interestingly, that mode is supported on all RZ/G1 SoCs, on most R-Car
> > >>>>>> Gen3 SoCs, but only on a single R-Car Gen2 SoC (V2H).
> > >>>>>>
> > >>>>> YDS mode ?
> > >>>>
> > >>>> No, 10-bit YCbCr-422. But please forget my comment, I was looking at
> > >>>> the wrong table.
> > >>>>
> > >>>> VI1_G[7:2] plus VI1_DATA[7:6] is not even a contiguous subset (I had
> > >>>> misread the used subset to be G[1:0] and B[7:2]), so it cannot be represented
> > >>>> using just bus-width and bus-shift properties?
> > >>>>
> > >>> Yes and here is my explanation.
> > >>>
> > >>> In Gen1 manual for YDS bit it says the below:
> > >>> 0: Vin_B[7:0] pins
> > >>> 1: Vin_G[7:0] pins
> > >>>
> > >>> And in Gen2 manual it says,
> > >>> 0: Vin_DATA[7:0] pins
> > >>> 1: Vin_DATA[7:0] pins
> > >>
> > >> Vin_DATA[15:8]
> > >>
> > >> The difference is due to some SoCs naming the signals R[7:0], G[7:0], B[7:0],
> > >> while other SoCs use DATA[23:0], the latter presumably to avoid
> > >> confusion when using non-RGB input formats.
> > >> R-Car V2H uses a mix: D[23:16]_R[7:0], D[15:8]_G[7:0], D[7:0]_B[7:0] ;-)
> > >>
> > >> However, the underlying behavior is the same, which is clear from the
> > >> RGB-666 mode, which is not using contiguous DATA[17:0], but sparse
> > >> DATA[23:18], DATA[15:10], DATA[7:2], i.e. the 6 MSB of each color
> > >> component.
> > >>
> > >>> On iwave platform for the VIN2 interface the following G pins are connected:
> > >>>
> > >>>  VI2_G0_MARK, VI2_G1_MARK,
> > >>>  VI2_G2_MARK, VI2_G3_MARK,
> > >>>  VI2_G4_MARK, VI2_G5_MARK,
> > >>>  VI2_G6_MARK, VI2_G7_MARK,
> > >>>
> > >>> And for capture to work on this interface the YDS bit has to be set.
> > >>>
> > >>> Now suppose some day we have a platform with 16 bit interface where G
> > >>> and R pins are connected:
> > >>>
> > >>>         VI2_G0_MARK, VI2_G1_MARK,
> > >>>         VI2_G2_MARK, VI2_G3_MARK,
> > >>>         VI2_G4_MARK, VI2_G5_MARK,
> > >>>         VI2_G6_MARK, VI2_G7_MARK,
> > >>>         /* R */
> > >>>         VI2_R0_MARK, VI2_R1_MARK,
> > >>>         VI2_R2_MARK, VI2_R3_MARK,
> > >>>         VI2_R4_MARK, VI2_R5_MARK,
> > >>>         VI2_R6_MARK, VI2_R7_MARK,
> > >>>
> > >>> Scenarios
> > >>> 1: Say we connect a 8-bit camera just  with the G pins - YDS has to be
> > >>> 1 for 8-bit YCbCr
> > >>> 2: Say we connect a 8-bit camera just with the R pins - YDS has to be
> > >>> 0 for 8-bit YCbCr
> > >>> 3: Now say we use G2-G7 along with R0 and R1 pins to connect a 8 bit
> > >>> camera - YDS has to be 1 for 8-bit camera
> > >>>
> > >>> And looking at the Gen1 description of YDS bit, having a combination
> > >>> of B and G is not a valid case.
> > >>
> > >> Scenario 3 is indeed not supported. But G[1:0] and B[7:2] (= DATA[9:2])
> > >> could work when using 10-bit YCbCr.
> > >>
> > >>> So my vote is to have a property in the endpoint to say if YDS has to
> > >>> be enabled as done in my first version of the patch.
> > >>
> > >> "YDS" is not a generic property, "data-shift" is.
> > >
> > > Agreed, we want something standard.
> >
> > How do we proceed on this ?
>
> I may have lost track of the discussion here. Would a bus-width of 18 or
> 24, like mentioned below, be enough to solve the problem, or do we need
> something else ?
>
Sorry maybe I miss-read your email, are you suggesting me to set the
YDS bit to1 if bus-width=18/24 ?

On the RZ/G1H parallel port for VIN2 interface the bus-width=8 since
just the VI2_Gx pins are used YDS has to be set to 1 for it to work.

Cheers,
Prabhakar

> > >> Now, how do you specify in DT that RGB-666 mode is to be used?
> > >> "bus-width = <18>"?
> > >> That won't work with the (so far theoretical) case where both contiguous
> > >> and sparse variants are supported by the hardware.  And "data-shift"
> > >> won't help here.
> > >>
> > >> Am I overdesigning? ;-)
> > >
> > > If bus-width = <18>, VIN would know know that the 6 MSBs of each 8-bit
> > > subset are used, as it doesn't support any other option. There's no need
> > > for data-shift or any other property, as there's nothing to configure
> > > :-) We could even set bus-width = <24>, it wouldn't make a difference.
> >
> > Thank you for jumping Laurent :)
>
> --
> Regards,
>
> Laurent Pinchart
