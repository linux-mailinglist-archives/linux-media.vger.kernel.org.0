Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFCD523B644
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 10:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgHDIEy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Aug 2020 04:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbgHDIEx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Aug 2020 04:04:53 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 223F1C06174A;
        Tue,  4 Aug 2020 01:04:53 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id m200so17338627ybf.10;
        Tue, 04 Aug 2020 01:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MWgosea0da7avseosLbpgPVXM6QOMF7BihFebWOaL+8=;
        b=dfyiASaor+0JpA2bfiKJlGRfvHJebRpG9RbeIHf0x2A37ZkBmkiujmM/k5UUy48gao
         qc/+3/XICjDvtTlRB3zbOjpP84PCqjK2i1nFoQc8+T1tY24//S4K6fSJJ8qaHqo75VXb
         gnoGMtuSLOBtRGJWg4PlHl86E546zZaUE273gNK3guT8eb03iOA3/9ljeGC8wD7eXorM
         LwP7TcouJmVZSnOFQTZCm37dHtmMP9q5BVnVYOu/qIGm8zDKk6ZCQkH3Tv8FgnXEwwmh
         QRPuCu6lyVlRKqW7uSHgXcldHgXeNSznjb2X8hDPd4cWYVx2S4F56KIMkgGAz7oNQNoS
         5qOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MWgosea0da7avseosLbpgPVXM6QOMF7BihFebWOaL+8=;
        b=dV2TYOxHH9XNHkA0WYeKnXIGBADiIWEIBFps5+f4peQN9xJJsfIp2GQyUpwgsh1htV
         i4HV2EnKuYzeiaQeVdNaT4vBQY5yi8wCJfnTCn3X5hjGzGSuRGLysF5ZkYKZ9L/RtNAE
         sxQQ6mmn0jAPTRSvJqhCwoEjEqlYE18VyhagjG3b16QjE91rdIWnmgQL22hXXcWgRC2i
         Yp8esYfg1OZFNYwtSrw2nSvksaL89mPZLszvWZbz7ki1qridWIPaQGbpS0PUy1pt/KNZ
         VPFQ5VI+jAYokASZ2OIOGPflSp4PgLbVLwZPlRBeJRewTcLDPAFXriSbx4IRLbTlS8oA
         bS4A==
X-Gm-Message-State: AOAM530n3Y8m0gfqlgot+koLALWOiYsdq4thRbrvjXaRUaQbC/NBJHDs
        DnnFmr+ypWdDJdTiPv+x1o5hJabcxG5qR8/CVhWrsfHD
X-Google-Smtp-Source: ABdhPJxWpt0wlRwTX2GSWNmAZ6v66k5uCk7BHjlPqvIKKaYVEx4w92kX4pePuAh8AEiHmf48R0lkfsn0zp2qx6uQnYk=
X-Received: by 2002:a25:9186:: with SMTP id w6mr29319556ybl.401.1596528292242;
 Tue, 04 Aug 2020 01:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <1596470573-15065-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200803180618.GA2297236@oden.dyn.berto.se> <CA+V-a8sHOqM2tB-72Z-wVJjvihycCq1zLuk7Py7uKGMxzOJyaA@mail.gmail.com>
 <20200803192801.GC2297236@oden.dyn.berto.se>
In-Reply-To: <20200803192801.GC2297236@oden.dyn.berto.se>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 4 Aug 2020 09:04:25 +0100
Message-ID: <CA+V-a8v0fr9jKMEdOHfDV+DSTqd57NRyQs1phC8nPTcNLR-PfQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: rcar-vin: Add support to select data pins for
 YCbCr422-8bit input
To:     Niklas <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Mon, Aug 3, 2020 at 8:28 PM Niklas <niklas.soderlund@ragnatech.se> wrote=
:
>
> Hi Lad,
>
> On 2020-08-03 20:17:54 +0100, Lad, Prabhakar wrote:
> > Hi Niklas,
> >
> > Thank you for the review.
> >
> > On Mon, Aug 3, 2020 at 7:06 PM Niklas <niklas.soderlund@ragnatech.se> w=
rote:
> > >
> > > Hi Lad,
> > >
> > > Thanks for your work.
> > >
> > > On 2020-08-03 17:02:53 +0100, Lad Prabhakar wrote:
> > > > Select the data pins for YCbCr422-8bit input format depending on
> > > > bus_width and data_shift passed as part of DT.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > > Changes for v2:
> > > > * Dropped DT binding documentation patch
> > > > * Select the data pins depending on bus-width and data-shift
> > >
> > > I like this v2 much better then v1, nice work!
> > >
> > > >
> > > > v1 -
> > > > https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=
=3D323799
> > > > ---
> > > >  drivers/media/platform/rcar-vin/rcar-core.c | 5 +++++
> > > >  drivers/media/platform/rcar-vin/rcar-dma.c  | 7 +++++++
> > > >  drivers/media/platform/rcar-vin/rcar-vin.h  | 5 +++++
> > > >  3 files changed, 17 insertions(+)
> > > >
> > > > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/=
media/platform/rcar-vin/rcar-core.c
> > > > index 7440c8965d27..55005d86928d 100644
> > > > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > > > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > > > @@ -624,6 +624,11 @@ static int rvin_parallel_parse_v4l2(struct dev=
ice *dev,
> > > >       vin->parallel =3D rvpe;
> > > >       vin->parallel->mbus_type =3D vep->bus_type;
> > > >
> > > > +     /* select VInDATA[15:8] pins for YCbCr422-8bit format */
> > > > +     if (vep->bus.parallel.bus_width =3D=3D BUS_WIDTH_8 &&
> > > > +         vep->bus.parallel.data_shift =3D=3D DATA_SHIFT_8)
> > > > +             vin->parallel->ycbcr_8b_g =3D true;
> > > > +
> > >
> > > I would store the bus_width and bus_shift values in the struct
> > > rvin_parallel_entity and evaluate them in place rater then create a f=
lag
> > > for this specific use-case..
> > >
> > Ok will do that.
> >
> > > Also according to the documentation is the check correct? Do we not w=
ish
> > > to use the new mode when bus_width =3D=3D 16 and bus_shift =3D=3D 8. =
The check
> > > you have here seems to describe a 8 lane bus where 0 lanes are used.
> > >
> > bus-width is the actual data lines used, so bus_width =3D=3D 16 and
> > bus_shift =3D=3D 8 would mean use lines 23:8, so just check for bus_wid=
th
> > =3D=3D 8 and bus_shift =3D=3D 8 should be sufficient.
>
> As you and Geert points out I was wrong, they should indeed both be 8.
>
> >
> > > I think you should also verify that bus_shift is either 0 or 8 as tha=
t
> > > is all the driver supports.
> > >
> > Not sure if thats correct.In that case this patch wont make sense, I
> > believed we agreed upon we determine the YDS depending on both
> > bus-width and bus-shift.
>
> I'm sorry I think I lost you :-) The driver is not capable of supporting
> bus_width =3D 8 and bus_shift =3D 2 right? Maybe we are talking about
> different things.
>
> What I tried to say (updated with the knowledge of that bus_width should
> indeed be 8 and not 16) was that would it make sens to with bus_width=3D8
> allow for a bus_shift value other then 0 or 8? What for example would
> the driver do if the value was 2?
>
I think this should be possible but I am not sure how this will work.
For example on iWave G21D-Q7 platform with 16-bit wired bus say we
connect a 8-bit camera as below:

bus-width =3D 8 and bus-shift =3D 2
VI1_G0_B        -> Not connected
VI1_G1_B        -> Not connected
VI1_G2_B_16        -> Connected
VI1_G3_B        -> Connected
VI1_G4_B        -> Connected
VI1_G5_B        -> Connected
VI1_G6_B        -> Connected
VI1_G7_B        -> Connected
VI1_DATA7_B/VI1_B7_B_16    -> Connected
VI1_DATA6_B/VI1_B6_B_16    -> Connected
VI1_DATA5_B/VI1_B5_B_16    -> Not connected
VI1_DATA4_B/VI1_B4_B_16    -> Not connected
VI1_DATA3_B/VI1_B3_B_16    -> Not connected
VI1_DATA2_B/VI1_B2_B_16    -> Not connected
VI1_DATA1_B/VI1_B1_B_16    -> Not connected
VI1_DATA0_B/VI1_B0_B_16    -> Not connected

So in this case for 8-bit YCbCr422 format should YDS be set I am not
sure. Or is this not a valid case at all ?

Cheers,
Prabhakar

> >
> > On iWave G21D-Q7 for VI2 interface VI2_G* pins are connected to SoC
> > and for VIN3 interface Vi3_DATA* pins are connected. So in this case
> > the capture only works for VIN2 only if YDS bit is set for 8-bit 422,
> > and for VIN3 capture only works if YDS is 0
> >
> > &vin2 {
> >     status =3D "okay";
> >     pinctrl-0 =3D <&vin2_pins>;
> >     pinctrl-names =3D "default";
> >
> >     port {
> >         #address-cells =3D <1>;
> >         #size-cells =3D <0>;
> >
> >         vin2ep: endpoint {
> >             remote-endpoint =3D <&ov7725_2>;
> >             bus-width =3D <8>;
> >             data-shift =3D <8>;
> >         };
> >     };
> > };
> >
> > &vin3 {
> >     status =3D "okay";
> >     pinctrl-0 =3D <&vin3_pins>;
> >     pinctrl-names =3D "default";
> >
> >     port {
> >         #address-cells =3D <1>;
> >         #size-cells =3D <0>;
> >
> >         vin3ep: endpoint {
> >             remote-endpoint =3D <&ov7725_3>;
> >             bus-width =3D <8>;
> >         };
> >     };
> > };
> >
> >
> > > >       switch (vin->parallel->mbus_type) {
> > > >       case V4L2_MBUS_PARALLEL:
> > > >               vin_dbg(vin, "Found PARALLEL media bus\n");
> > > > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/m=
edia/platform/rcar-vin/rcar-dma.c
> > > > index 1a30cd036371..5db483877d65 100644
> > > > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > > > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > > > @@ -127,6 +127,8 @@
> > > >  #define VNDMR2_FTEV          (1 << 17)
> > > >  #define VNDMR2_VLV(n)                ((n & 0xf) << 12)
> > > >
> > > > +#define VNDMR2_YDS           BIT(22)
> > >
> > > This should be grouped with the other VNDMR2_* macros and not on its
> > > own. Also it should be sorted so it should be inserted between
> > > VNDMR2_CES and VNDMR2_FTEV.
> > >
> > > Also I know BIT() is a nice macro but the rest of the driver uses (1 =
<<
> > > 22), please do the same for this one.
> > >
> > Sure will take care of it.
> >
> > > > +
> > > >  /* Video n CSI2 Interface Mode Register (Gen3) */
> > > >  #define VNCSI_IFMD_DES1              (1 << 26)
> > > >  #define VNCSI_IFMD_DES0              (1 << 25)
> > > > @@ -698,6 +700,11 @@ static int rvin_setup(struct rvin_dev *vin)
> > > >               /* Data Enable Polarity Select */
> > > >               if (vin->parallel->mbus_flags & V4L2_MBUS_DATA_ENABLE=
_LOW)
> > > >                       dmr2 |=3D VNDMR2_CES;
> > > > +
> > > > +             if (vin->parallel->ycbcr_8b_g && vin->mbus_code =3D=
=3D MEDIA_BUS_FMT_UYVY8_2X8)
> > > > +                     dmr2 |=3D VNDMR2_YDS;
> > > > +             else
> > > > +                     dmr2 &=3D ~VNDMR2_YDS;
> > >
> > > dmr2 is already unitized and YDS is cleared, no need to clear it agai=
n
> > > if you don't wish to set it. Taking this and the comments above into
> > > account this would become something like (not tested),
> > >
> > Agreed.
> >
> > >     switch (vin->mbus_code) {
> > >     case MEDIA_BUS_FMT_UYVY8_2X8:
> > >         if (vin->parallel->bus_width =3D=3D 16 && vin->parallel->bus_=
shift =3D=3D 8)
> > >             dmr2 |=3D VNDMR2_YDS;
> > >         break;
> > >     default:
> > >         break;
> > >     }
> > >
> > > >       }
> > > >
> > > >       /*
> > > > diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/m=
edia/platform/rcar-vin/rcar-vin.h
> > > > index c19d077ce1cb..3126fee9a89b 100644
> > > > --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> > > > +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> > > > @@ -87,6 +87,9 @@ struct rvin_video_format {
> > > >       u8 bpp;
> > > >  };
> > > >
> > > > +#define BUS_WIDTH_8  8
> > > > +#define DATA_SHIFT_8 8
> > >
> > > As pointed out by Geert, not so useful, use 8 in the code :-)
> > >
> > Agreed will drop it.
> >
> > Cheers,
> > Prabhakar
>
> --
> Regards,
> Niklas S=C3=B6derlund
