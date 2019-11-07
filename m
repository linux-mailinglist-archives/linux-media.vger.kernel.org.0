Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82CEBF28E8
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 09:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfKGINp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 7 Nov 2019 03:13:45 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40798 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbfKGINo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 03:13:44 -0500
Received: by mail-oi1-f196.google.com with SMTP id 22so1200811oip.7;
        Thu, 07 Nov 2019 00:13:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9nazdWnirCfxRXV5xY0vu3a90rtbot0vudbsckGOh3k=;
        b=R6FLxNBT6oJsh7IS6rUSAyvdr/KK88kS5u03hbPKcL5Mp1SW81MxaFX8xf9yF8aii8
         s5nvQaOvgTWcUwORzz2eiK3lRZtkeQaCnnUQobWFgwRPyIYCDc6JjW3qAM7pD+m4aoP9
         fcWlo/PvJf0q1JRq1qbCrIwU98XBE7i/Yu/qvBRZ0qtZVvlSRIEggN1FgJpwBnhpSf2v
         mlzkiNjcn7tZ8ybMLkuRuheqQQ/QPU8gCNGG9mUHfFfEbg3MYzUtKd7wXr78Hov5kq+u
         WLGnb+kGFVVn7LyChDCVyI8FYpKybnMR5f2lQYzBO2Ogj0czy7hOaD1+TdsU13V3Yf8w
         le8Q==
X-Gm-Message-State: APjAAAWJRIFZVAU3H1EYHmr/mzrGVqVbwrBjylqBMnyOtYRsN3tmAzJF
        p/A9WLvE2fQ+DtocbsX7cou0Mt4oYLOiSe/Uk2m+zTAR
X-Google-Smtp-Source: APXvYqzG1X4VVM8A9RduBROmxxiAeni2cVDVws2za6mhTCF+gL1IaXOEdsNzB0P7I7PMf7pp/itm0o9nb1eq2VQiVZI=
X-Received: by 2002:aca:3a86:: with SMTP id h128mr2176021oia.131.1573114423794;
 Thu, 07 Nov 2019 00:13:43 -0800 (PST)
MIME-Version: 1.0
References: <20191106232304.2332121-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdW-i+L0pQx1WRWUZ6_BWF0ujQ-4s9TXNfAM9w5OHcgR+g@mail.gmail.com> <20191107074722.GH18345@bigcity.dyn.berto.se>
In-Reply-To: <20191107074722.GH18345@bigcity.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Nov 2019 09:13:32 +0100
Message-ID: <CAMuHMdWnt=8BDKKZco_0GMfOncT9r6CZ1P-rXZN19Dmc_ti4wA@mail.gmail.com>
Subject: Re: [PATCH] rcar-vin: Limit NV12 availability to supported VIN
 channels only
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Thu, Nov 7, 2019 at 8:47 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2019-11-07 08:41:11 +0100, Geert Uytterhoeven wrote:
> > On Thu, Nov 7, 2019 at 12:25 AM Niklas Söderlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > When adding support for NV12 it was overlooked that the pixel format is
> > > only supported on some VIN channels. Fix this by adding a check to only
> > > accept NV12 on the supported channels (0, 1, 4, 5, 8, 9, 12 and 13).
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > @@ -76,7 +76,12 @@ const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
> > >         if (vin->info->model == RCAR_M1 && pixelformat == V4L2_PIX_FMT_XBGR32)
> > >                 return NULL;
> > >
> > > -       if (pixelformat == V4L2_PIX_FMT_NV12 && !vin->info->nv12)
> > > +       /*
> > > +        * If NV12 is supported it's only supported on some channels (0, 1, 4,
> > > +        * 5, 8, 9, 12 and 13).
> >
> > Is this true for all SoCs, or do you need a vin->info->model == RCAR_GEN3
> > check?
>
> NV12 is only supported by most Gen3 SoCs, but no extra check is needed
> as vin->info->nv12 is only set for the Gen3 SoCs that can support NV12.

Thanks, had missed the meaning of the vin->info->nv12 check.

> > > +        */
> > > +       if (pixelformat == V4L2_PIX_FMT_NV12 &&
> > > +           (!vin->info->nv12 || BIT(vin->id) & 0xcccc))
> > >                 return NULL;
> >
> > So 0xcccc = ~(BIT(0) | BIT(1) | BIT(4) | ...)?
>
> Yes.
>
> > What if you ever have an id larger than 15?
> > Wouldn't it be safer to check for !(BIT(vin->id) & 0x3333)?
>
> There is no SoC with more then 16 VIN instances, today... Maybe your
> suggestion of the inverted check makes more sens. Will respin a v2.

OK.  BTW, the code may look nicer if you start using a
"switch (pixelformat) { ... }" block to handle all special cases.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
