Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8DBB4131E5
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 12:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231812AbhIUKnP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 06:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbhIUKnO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 06:43:14 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86BAAC061574
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 03:41:46 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id g16so37737023wrb.3
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 03:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dtCRUnU+Sp+oVOuqfldb4AumnBNMai8lusiZopgj1OI=;
        b=FXGcKk5wE+05PUZDzI8DtsJxkJ8BIUAiU3KQmkJBO087gIr0W4QJW7xtbpTl482M+Z
         ca5BHISjIhe3jm136qNxRXj1Lyuirr6Xh4VQAD+oTSnm8Ie0LpDtMsjyHPrSm71ItOyT
         qS0AhgjGqgqbYqbHETKoqvfEDMScggLImmH9pfgXPjzruMRVJLfI6gFo5V5NIJTqST8M
         ihE9D7iklIZNu1vvKNiSaqlAKP6xnqlM1civWOVuzdk3atBZaBBD3pZ/MQpUoB7twICr
         OXzW8o3eNXMGpVt/bS5tkpt5sGkGk1sNy7a8drhXv7+IsVflq2O257ViHKMZ5XVSZqe3
         VdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dtCRUnU+Sp+oVOuqfldb4AumnBNMai8lusiZopgj1OI=;
        b=TfSaikZake7/9FxIOj6kPTN/iAHKx30cRlYPByJzGvGP4wkRiaTP8H7galevD+Q2Bh
         tGkYt8Baad9QOKv+XsYwahHdVCtsD7eV5Vlfs/OfqqGi/4wMaumr3vPJt1uZOGzYVYxp
         1iJv/whLEcw9RFySWjLBIMDelLEKPUllSEunUSLpUsoYD3ZtRs49GuxkTpjHPFFvMCgK
         3ezmO+eRNpN2eepkWeVR0tswfgVsKXYE39lIkJ2DuKSETyWQv5ehqnK1D9PZ12wa0mof
         9hGIdGWJh0U4RMm6f3BHsoDLqNPokRsSctuhTsYDqG8kOk/TjrnL8TaRxWiVjvwY42h7
         r9mw==
X-Gm-Message-State: AOAM532jIT3zeGs8pvkm+bXs9eWq/LWUY2RGIEAwC1LpN1dRo97duj7f
        EXTtDiAfFJwyS3bY+bCJ7C1wMv8t4RpmwwoG8I7A0yQj0tZV1w==
X-Google-Smtp-Source: ABdhPJwGExN6TwNXUyDXfSOhi3lyzpNEi+EqMNBIDJlNme79dqxIfEK1pKKbjGJKo3pmzDk35a67ILS4ulu89w4W8Ic=
X-Received: by 2002:a5d:5386:: with SMTP id d6mr34053507wrv.112.1632220905040;
 Tue, 21 Sep 2021 03:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <01d4c7efb1ef900c499fda6af2c5a19ce923dc15.camel@tq-group.com>
 <CAPY8ntB-7g5FigO9rNV4YGWCeHUWkO4v1kp96mW-icGwT-rk9w@mail.gmail.com> <a5e73b514299e17008f9e4a233553283ec7a88c9.camel@tq-group.com>
In-Reply-To: <a5e73b514299e17008f9e4a233553283ec7a88c9.camel@tq-group.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 21 Sep 2021 11:41:28 +0100
Message-ID: <CAPY8ntBBxsUgGeFQJO_N1pAgg20bRxJW=t=_ZOhfWp0=MA9uBQ@mail.gmail.com>
Subject: Re: (EXT) Re: Sony IMX290 link frequency
To:     "Stein, Alexander" <Alexander.Stein@tq-group.com>
Cc:     "mani@kernel.org" <mani@kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 21 Sept 2021 at 07:49, Stein, Alexander
<Alexander.Stein@tq-group.com> wrote:
>
> Hello Dave,
>
> thank you for your verbose explanation. I think I understand a lot more
> now about those sensors. I'm using an IMX327 as well, but there doesn't
> seem to be a huge difference.

IMX290 adds a 1080p 100 or 120fps mode, but otherwise seems identical.
The driver doesn't support that extra mode, so will drive IMX327 and
IMX290 equally.

> On Montag, 20 Sept 2021 at 12:27 +0100, Dave Stevenson
> > It has two clock paths - one driving the pixel array, and one driving
> > the MIPI core. There is a FIFO between the two, so they can run at
> > different rates.
> >
> > My conclusion is that the pixel array always runs at the same pixel
> > rate, whether 1080p, 720p, or cropped - 148.5MPix/s. Certainly that
> > is
> > the result needed for vblank and hblank controls to work correctly in
> > computing frame rate. The datasheet again contains fixed register
> > settings for 25, 30, 50, 60, 100, and 120fps by changing HMAX
> > (register 0x301c/d), but they are all just linearly scaled values of
> > each other, so it maps cleanly onto V4L2_CID_HBLANK. VMAX is fixed
> > for
> > 1080p and 720p modes, so maps to V4L2_CID_VBLANK.
>
> Given that there are fixed numbers for 1080p/720p for VMAX and for
> 25,30,50,60 fps for HMAX shouldn't those controls be read-only?
> What's the benefit of being writable in [1]?

The datasheet lists fixed numbers, but any numbers work following the
normal mode of operation for these controls.

eg for the 1080p mode, VMAX is specified as 0x465 (1125 decimal).
HMAX is then
25fps - 0x14a0 (5280). 5280*1125*25 =3D 148.5M
30fps - 0x1130 (4400). 4400*1125*30 =3D 148.5M
50fps - 0x0a50 (2640). 2640*1125*50 =3D 148.5M
60fps - 0x0898 (2200). 2200*1125*60 =3D 148.5M
All values of HMAX inbetween those work fine, hence V4L2_CID_VBLANK
can be a control with range from the minimum permitted (2200-height
for 60fps) to the max the sensor will take.

VMAX mapping to V4L2_CID_VBLANK could be a read only control, but it's
functional in the sensor over the full range, so why not expose it.
Frame rate control within libcamera typically varies V4L2_CID_VBLANK
too, so that means it fits into the normal frameworks better.

> > The MIPI PHY then runs at a link frequency sufficient to convey the
> > desired pixels:
> > - 3564 Mbit/s across 4 lanes for 1080p100/120 10bpp
> > - 1782 Mbit/s split across 2 or 4 lanes for 1080p or window cropped
> > modes up to 60fps, 10 or 12bpp.
> > - 1188 Mbit/s split across 2 or 4 lanes for 720p up to 60fps, 10 or
> > 12bpp
> > This is controlled predominantly by INCKSEL1 & 2 (registers
> > 0x305c/d).
> > I verified the actual link frequencies used on a scope, and they are
> > as described.
> > 1782Mbit/s is sufficient for 1920x1080@60fps 12bpp. Cropping or 10bpp
> > just increases the per line blanking period on the CSI2 interface.
>
> Is there actual blanking on CSI2 interface, as in inserting "dummy"
> pixels in a row and dummy lines? Given that the spec is not available
> freely it's hard to understand what's actually happening on the
> interface.
> Given that the link frequency is fixed (in this case depending on
> window mode, input clock and number of lanes) I was wondering what's
> happening when the payload length changes (e.g. switching bpp or
> cropping).

Whilst the spec is restricted, there are a few introductions that give
a basic understanding, eg [1]

MIPI D-PHY has mutliple lane states, but the main ones are low power
mode (LP-11) and high speed mode (HS).
For power saving it is very common for a sensor to switch to HS mode,
send the line start short packet, line data long packet, line end
short packet, and then drop back to LP-11 between lines. For the
beginning and end of frames there are frame start and frame end short
packets, but during the idle time the lanes will drop back to LP-11.
See IMX219 datasheet [2] pages 47 & 48 for an example.

When sending less data due to cropping or blanking periods, the data
lanes are just in LP-11 for a longer period.

Clock lanes and data lanes may do slightly different things. It is not
uncommon for the clock lane to remain in HS mode at all times, but the
data lanes will almost always drop to LP-11. Device tree has a
clock-noncontinuous property to denote that the clock lane drops to
LP, which maps to the V4L2 flag V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK.
There is no mention in the datasheet as to whether IMX290/327 produces
a continuous clock signal or not, and I can't say that I've checked.
Some receivers can get confused if the clock is continuous and they
miss the initial state change from LP to HS.

[1] https://download.tek.com/document/61W_25772_0_HR.pdf
[2] https://raw.githubusercontent.com/rellimmot/Sony-IMX219-Raspberry-Pi-V2=
-CMOS/master/RASPBERRY%20PI%20CAMERA%20V2%20DATASHEET%20IMX219PQH5_7.0.0_Da=
tasheet_XXX.PDF

> > AFAICT you could just always run at the 1782 Mbit/s rate with
> > slightly
> > increased idle time on the CSI2 bus for the 720p mode, but that isn't
> > the way Sony have specified it.
> >
> > There is a further register to halve the link frequency again for max
> > 25/30fps modes (0x3405), although doing so has limited benefit (it'd
> > increase rolling shutter effects as it would increase the temporal
> > difference between each line).
> >
> > I hope that makes things a little clearer. Indeed the current driver
> > is slightly wrong, but only in relation to pixel rate, not link
> > frequency.
>
> Thanks for confirmation. I meanwhile found the table providing the link
> frequencies.
> I assume now that my current problem regarding settle time is somewhere
> else. I can currently only assume the escape clock is not correct, but
> there is pretty much no documentation at all on that topic.

What platform are you working with?
There are registers in the IMX290/327 which configure the MIPI timings
- 0x3445-0x3455. The values do differ based on the link frequency, but
checking our driver to the datasheet they appear to be all correct.

Hope that helps.
  Dave

> Thanks and best regards
> Alexander
>
> [1]
> https://github.com/raspberrypi/linux/commits/rpi-5.10.y/drivers/media/i2c=
/imx290.c
>
> --
> Mit freundlichen Gr=C3=BC=C3=9Fen
>
> i.A. Alexander Stein
> Entwicklung Standort Chemnitz
> Tel. +49 371 433151-0, Fax +49 371 433151-22
> Zwickauer Stra=C3=9Fe 173, 09116 Chemnitz
> mailto: Alexander.Stein@tq-group.com
>
> TQ-Systems GmbH
> M=C3=BChlstra=C3=9Fe 2, Gut Delling, 82229 Seefeld
> Amtsgericht M=C3=BCnchen, HRB 105018
> Sitz der Gesellschaft: Seefeld
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> www.tq-group.com
>
