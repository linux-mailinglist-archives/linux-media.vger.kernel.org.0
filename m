Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 549FB442C1C
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 12:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhKBLHE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 07:07:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50654 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhKBLHD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 07:07:03 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C1DA3E5;
        Tue,  2 Nov 2021 12:04:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635851067;
        bh=74j6MN6UDT9RnQAmeUMyLGqc+gWN5rtXt3ruwGjCl2k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bR3NRa83GnvZ6z257t9lCFxS3f4VBYYcD/wwi5RkQgQq3IFMaLnaPKhurKWLqArUN
         IpiYdlPV8uM1N7Natp3KM5mAE76Adtwev0ZPbsFehPu+AJxlVqqugYtXRWsNMl/Z7p
         xDnUKW0LiTXqY9j4ZyPqlam/oQGanT/CF2omV2dQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdUhtGmL2iiGFbRY8CGC_xB5Mqboyt73WL2_h2feMYzziw@mail.gmail.com>
References: <20211101171949.1059566-1-kieran.bingham+renesas@ideasonboard.com> <YYAiihIejUuF+uu0@oden.dyn.berto.se> <163578888022.1097798.14100032684481849335@Monstersaurus> <CAMuHMdUhtGmL2iiGFbRY8CGC_xB5Mqboyt73WL2_h2feMYzziw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: max9286: Depend on VIDEO_V4L2
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 02 Nov 2021 11:04:25 +0000
Message-ID: <163585106546.1097798.16404844327580958473@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Geert Uytterhoeven (2021-11-02 08:30:28)
> Hi Kieran,
>=20
> On Mon, Nov 1, 2021 at 6:48 PM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
> > Quoting Niklas S=C3=B6derlund (2021-11-01 17:23:22)
> > > On 2021-11-01 17:19:49 +0000, Kieran Bingham wrote:
> > > > The MAX9286 has not explicitly declared a dependency upon VIDEO_V4L=
2.
> > > > While this dependency has likely always been met by configurations
> > > > including it, the device does use V4L2 core, and should depend upon=
 it.
> > > >
> > > > Add VIDEO_V4L2 as a dependency to match other drivers and prevent
> > > > failures when compile testing.
> > > >
> > > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.=
com>
>=20
> > > > @@ -468,7 +468,7 @@ config VIDEO_VPX3220
> > > >
> > > >  config VIDEO_MAX9286
> > > >       tristate "Maxim MAX9286 GMSL deserializer support"
> > > > -     depends on I2C && I2C_MUX
> > > > +     depends on VIDEO_V4L2 && I2C && I2C_MUX
> > >
> > > I think the new 'depends on' shall be on a separate line. Reading this
> > > is confusing as now the V4L2 is mixed with I2C while GPIO is still on=
 a
> > > separate line.
> >
> > Indeed, I'm happy to put it on a new line too, but so very many of the
> > other users of VIDEO_V4L2 and I2C here in media/i2c/Kconfig use
> >   depends on VIDEO_V4L2 && I2C
> >
> > So the difference is having the I2C_MUX ...
>=20
> I2C_MUX already depends on I2C, so you can drop the latter dependency.

Good point. But I'll leave it, as I'm not going to change that line now
;-)

>=20
> > There are only two other 'patterns' that have also added directly to the
> > end of that:
> >
> >
> > drivers/media/i2c/Kconfig:      depends on VIDEO_V4L2 && I2C && I2C_MUX
> > drivers/media/i2c/Kconfig:      depends on VIDEO_V4L2 && I2C && GPIOLIB
> > drivers/media/platform/Kconfig: depends on VIDEO_V4L2 && I2C && PM
> >
> > (Where the I2C_MUX is MAX9286) but it's not a very strong pattern, so
> > splitting is still fine with me.
>=20
> I would put it on a single line.
>=20
> Unless you start adding COMPILE_TEST support, and the dependencies
> can be split in hard (needed to build) and soft (needed to run)
> dependencies.
>=20

v2 sent with a single line. No point overthinking this at this stage ;-)

Thanks

Kieran


> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
