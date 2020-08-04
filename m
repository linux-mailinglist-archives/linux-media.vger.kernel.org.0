Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8036823B872
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 12:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgHDKFW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Aug 2020 06:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728745AbgHDKFQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Aug 2020 06:05:16 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3BAC061756
        for <linux-media@vger.kernel.org>; Tue,  4 Aug 2020 03:05:13 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id z14so5305199ljm.1
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2020 03:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9w/UIoNnaZ8iYtq5xCA3U8n+b2iHLpWpJE3T0gsn2Xs=;
        b=wT3Lb1yB8zokeznVPjG8nrxLWmGhzD0EWw0taPROWRHzQK0tjLxnl6FjbEwA20frra
         +isY4BojCn0Q08L0F2wrXq1BLxZu+/bLXU4wgHU9I21VRO+VvffObtMXT1hsEKn4IW6N
         V5jzhMfUo+MY84CqyYriOMDaMuje2YcqjsYz5/YkpCCv82G3S9jZIX5EiMBfdI3wQLHZ
         hETxf5HTHk+eYvh5WqK+U9PO01oisD/YUUQUQIegKHPgFjsI+4B3Po6OFMk+ipkYU3bj
         aCnJn43Jx6k32rXMuTKdh9WdTMAin62FS6tdIVZjf2ap4Nnuh2fUK8Jo8SZ+wUfHn0Rw
         dKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9w/UIoNnaZ8iYtq5xCA3U8n+b2iHLpWpJE3T0gsn2Xs=;
        b=oF+EqcyJbtLPSbXY6JFmbPeluBfV3B4a+0etma/l2XUuYsUW/ydWTtN8mtaQIDcEzP
         dUT8nyicIUp3EEiPQM7bQPkgZbtOR/r7F7O3H2h4tXWVi2bsSV21mnLGh4d2t/bDqWdq
         YZzrHb/Q0JtTVMvphaEa/5B2LZ3mUY56hN8VRkKAqnzXwDNXSzryouLpoaZa/xAZX9WV
         rfa5o1EIDe4NCjTyb3nTDDvM5RZFBl1WHaSi5tYTvT9PIvbEMl4H0Zu2b0MVL+TjSzIo
         1bqzacmwb1f/nQb4EpLIQJj0vZKYii0Fh0b2YJsZnuJyF5u7WI3xRQwWmIvaWi5/1TRZ
         hSFA==
X-Gm-Message-State: AOAM530ezUg3zs5Ilgf8hdSjp4eeW45gf7w23H+Z3Cb5HewzzhGw43GJ
        2N7354Khz1/HUXss9hv4ZgxKuA==
X-Google-Smtp-Source: ABdhPJwmduTPlvXzSh3Zw3pfiuqMFiczTe11qMw90dIB3jNAXBd1Ljgr7tOrSY0JpnzQ9On03sl1BQ==
X-Received: by 2002:a2e:b16c:: with SMTP id a12mr9657879ljm.146.1596535511483;
        Tue, 04 Aug 2020 03:05:11 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id s4sm6080146lfc.56.2020.08.04.03.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 03:05:10 -0700 (PDT)
Date:   Tue, 4 Aug 2020 12:05:10 +0200
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2] media: rcar-vin: Add support to select data pins for
 YCbCr422-8bit input
Message-ID: <20200804100510.GA2566810@oden.dyn.berto.se>
References: <1596470573-15065-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200803180618.GA2297236@oden.dyn.berto.se>
 <CA+V-a8sHOqM2tB-72Z-wVJjvihycCq1zLuk7Py7uKGMxzOJyaA@mail.gmail.com>
 <20200803192801.GC2297236@oden.dyn.berto.se>
 <CA+V-a8v0fr9jKMEdOHfDV+DSTqd57NRyQs1phC8nPTcNLR-PfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8v0fr9jKMEdOHfDV+DSTqd57NRyQs1phC8nPTcNLR-PfQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad,

On 2020-08-04 09:04:25 +0100, Lad, Prabhakar wrote:
> Hi Niklas,
> 
> On Mon, Aug 3, 2020 at 8:28 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> >
> > Hi Lad,
> >
> > On 2020-08-03 20:17:54 +0100, Lad, Prabhakar wrote:
> > > Hi Niklas,
> > >
> > > Thank you for the review.
> > >
> > > On Mon, Aug 3, 2020 at 7:06 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> > > >
> > > > Hi Lad,
> > > >
> > > > Thanks for your work.
> > > >
> > > > On 2020-08-03 17:02:53 +0100, Lad Prabhakar wrote:
> > > > > Select the data pins for YCbCr422-8bit input format depending on
> > > > > bus_width and data_shift passed as part of DT.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > ---
> > > > > Changes for v2:
> > > > > * Dropped DT binding documentation patch
> > > > > * Select the data pins depending on bus-width and data-shift
> > > >
> > > > I like this v2 much better then v1, nice work!
> > > >
> > > > >
> > > > > v1 -
> > > > > https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=323799
> > > > > ---
> > > > >  drivers/media/platform/rcar-vin/rcar-core.c | 5 +++++
> > > > >  drivers/media/platform/rcar-vin/rcar-dma.c  | 7 +++++++
> > > > >  drivers/media/platform/rcar-vin/rcar-vin.h  | 5 +++++
> > > > >  3 files changed, 17 insertions(+)
> > > > >
> > > > > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > > > > index 7440c8965d27..55005d86928d 100644
> > > > > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > > > > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > > > > @@ -624,6 +624,11 @@ static int rvin_parallel_parse_v4l2(struct device *dev,
> > > > >       vin->parallel = rvpe;
> > > > >       vin->parallel->mbus_type = vep->bus_type;
> > > > >
> > > > > +     /* select VInDATA[15:8] pins for YCbCr422-8bit format */
> > > > > +     if (vep->bus.parallel.bus_width == BUS_WIDTH_8 &&
> > > > > +         vep->bus.parallel.data_shift == DATA_SHIFT_8)
> > > > > +             vin->parallel->ycbcr_8b_g = true;
> > > > > +
> > > >
> > > > I would store the bus_width and bus_shift values in the struct
> > > > rvin_parallel_entity and evaluate them in place rater then create a flag
> > > > for this specific use-case..
> > > >
> > > Ok will do that.
> > >
> > > > Also according to the documentation is the check correct? Do we not wish
> > > > to use the new mode when bus_width == 16 and bus_shift == 8. The check
> > > > you have here seems to describe a 8 lane bus where 0 lanes are used.
> > > >
> > > bus-width is the actual data lines used, so bus_width == 16 and
> > > bus_shift == 8 would mean use lines 23:8, so just check for bus_width
> > > == 8 and bus_shift == 8 should be sufficient.
> >
> > As you and Geert points out I was wrong, they should indeed both be 8.
> >
> > >
> > > > I think you should also verify that bus_shift is either 0 or 8 as that
> > > > is all the driver supports.
> > > >
> > > Not sure if thats correct.In that case this patch wont make sense, I
> > > believed we agreed upon we determine the YDS depending on both
> > > bus-width and bus-shift.
> >
> > I'm sorry I think I lost you :-) The driver is not capable of supporting
> > bus_width = 8 and bus_shift = 2 right? Maybe we are talking about
> > different things.
> >
> > What I tried to say (updated with the knowledge of that bus_width should
> > indeed be 8 and not 16) was that would it make sens to with bus_width=8
> > allow for a bus_shift value other then 0 or 8? What for example would
> > the driver do if the value was 2?
> >
> I think this should be possible but I am not sure how this will work.
> For example on iWave G21D-Q7 platform with 16-bit wired bus say we
> connect a 8-bit camera as below:
> 
> bus-width = 8 and bus-shift = 2
> VI1_G0_B        -> Not connected
> VI1_G1_B        -> Not connected
> VI1_G2_B_16        -> Connected
> VI1_G3_B        -> Connected
> VI1_G4_B        -> Connected
> VI1_G5_B        -> Connected
> VI1_G6_B        -> Connected
> VI1_G7_B        -> Connected
> VI1_DATA7_B/VI1_B7_B_16    -> Connected
> VI1_DATA6_B/VI1_B6_B_16    -> Connected
> VI1_DATA5_B/VI1_B5_B_16    -> Not connected
> VI1_DATA4_B/VI1_B4_B_16    -> Not connected
> VI1_DATA3_B/VI1_B3_B_16    -> Not connected
> VI1_DATA2_B/VI1_B2_B_16    -> Not connected
> VI1_DATA1_B/VI1_B1_B_16    -> Not connected
> VI1_DATA0_B/VI1_B0_B_16    -> Not connected

I agree this is how I would imagine bus-width = 8 and bus-shift = 2 to 
be wired.

> 
> So in this case for 8-bit YCbCr422 format should YDS be set I am not
> sure. Or is this not a valid case at all ?

That is my question :-)

I can't find anything int the documentation that would allow is to do 
anything other then bus-width = 8 together with bus-shift = 0 (do not 
set YDS) or bus-shift = 8 (set YDS). So that is why I suggested you 
check for this and print a warning if bus-shift is anything else :-)

But if you can figured out how we can do a bus-shift = 2 as in your 
example then of course the check is wrong. I have not read the docs 
carefully enough about this to rule it out as impossible.

> 
> Cheers,
> Prabhakar
> 
> > >
> > > On iWave G21D-Q7 for VI2 interface VI2_G* pins are connected to SoC
> > > and for VIN3 interface Vi3_DATA* pins are connected. So in this case
> > > the capture only works for VIN2 only if YDS bit is set for 8-bit 422,
> > > and for VIN3 capture only works if YDS is 0
> > >
> > > &vin2 {
> > >     status = "okay";
> > >     pinctrl-0 = <&vin2_pins>;
> > >     pinctrl-names = "default";
> > >
> > >     port {
> > >         #address-cells = <1>;
> > >         #size-cells = <0>;
> > >
> > >         vin2ep: endpoint {
> > >             remote-endpoint = <&ov7725_2>;
> > >             bus-width = <8>;
> > >             data-shift = <8>;
> > >         };
> > >     };
> > > };
> > >
> > > &vin3 {
> > >     status = "okay";
> > >     pinctrl-0 = <&vin3_pins>;
> > >     pinctrl-names = "default";
> > >
> > >     port {
> > >         #address-cells = <1>;
> > >         #size-cells = <0>;
> > >
> > >         vin3ep: endpoint {
> > >             remote-endpoint = <&ov7725_3>;
> > >             bus-width = <8>;
> > >         };
> > >     };
> > > };
> > >
> > >
> > > > >       switch (vin->parallel->mbus_type) {
> > > > >       case V4L2_MBUS_PARALLEL:
> > > > >               vin_dbg(vin, "Found PARALLEL media bus\n");
> > > > > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> > > > > index 1a30cd036371..5db483877d65 100644
> > > > > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > > > > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > > > > @@ -127,6 +127,8 @@
> > > > >  #define VNDMR2_FTEV          (1 << 17)
> > > > >  #define VNDMR2_VLV(n)                ((n & 0xf) << 12)
> > > > >
> > > > > +#define VNDMR2_YDS           BIT(22)
> > > >
> > > > This should be grouped with the other VNDMR2_* macros and not on its
> > > > own. Also it should be sorted so it should be inserted between
> > > > VNDMR2_CES and VNDMR2_FTEV.
> > > >
> > > > Also I know BIT() is a nice macro but the rest of the driver uses (1 <<
> > > > 22), please do the same for this one.
> > > >
> > > Sure will take care of it.
> > >
> > > > > +
> > > > >  /* Video n CSI2 Interface Mode Register (Gen3) */
> > > > >  #define VNCSI_IFMD_DES1              (1 << 26)
> > > > >  #define VNCSI_IFMD_DES0              (1 << 25)
> > > > > @@ -698,6 +700,11 @@ static int rvin_setup(struct rvin_dev *vin)
> > > > >               /* Data Enable Polarity Select */
> > > > >               if (vin->parallel->mbus_flags & V4L2_MBUS_DATA_ENABLE_LOW)
> > > > >                       dmr2 |= VNDMR2_CES;
> > > > > +
> > > > > +             if (vin->parallel->ycbcr_8b_g && vin->mbus_code == MEDIA_BUS_FMT_UYVY8_2X8)
> > > > > +                     dmr2 |= VNDMR2_YDS;
> > > > > +             else
> > > > > +                     dmr2 &= ~VNDMR2_YDS;
> > > >
> > > > dmr2 is already unitized and YDS is cleared, no need to clear it again
> > > > if you don't wish to set it. Taking this and the comments above into
> > > > account this would become something like (not tested),
> > > >
> > > Agreed.
> > >
> > > >     switch (vin->mbus_code) {
> > > >     case MEDIA_BUS_FMT_UYVY8_2X8:
> > > >         if (vin->parallel->bus_width == 16 && vin->parallel->bus_shift == 8)
> > > >             dmr2 |= VNDMR2_YDS;
> > > >         break;
> > > >     default:
> > > >         break;
> > > >     }
> > > >
> > > > >       }
> > > > >
> > > > >       /*
> > > > > diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> > > > > index c19d077ce1cb..3126fee9a89b 100644
> > > > > --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> > > > > +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> > > > > @@ -87,6 +87,9 @@ struct rvin_video_format {
> > > > >       u8 bpp;
> > > > >  };
> > > > >
> > > > > +#define BUS_WIDTH_8  8
> > > > > +#define DATA_SHIFT_8 8
> > > >
> > > > As pointed out by Geert, not so useful, use 8 in the code :-)
> > > >
> > > Agreed will drop it.
> > >
> > > Cheers,
> > > Prabhakar
> >
> > --
> > Regards,
> > Niklas Söderlund

-- 
Regards,
Niklas Söderlund
