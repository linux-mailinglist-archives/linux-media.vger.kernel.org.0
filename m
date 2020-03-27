Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 436351959FA
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 16:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbgC0Pfb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Mar 2020 11:35:31 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39599 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgC0Pfb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Mar 2020 11:35:31 -0400
Received: by mail-ot1-f67.google.com with SMTP id x11so10127775otp.6;
        Fri, 27 Mar 2020 08:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m2VgctS9k0onJoQ+C26IEDnuG2AgnqBi68w0KHrlzNA=;
        b=RR1nu05LuVJW27A/u2yx3lBIycNb4JHH7fREUrmFKI6nCA93RAiOdvMrCjUd1Cn4dP
         euODJCmoiFPEA5UjaPnHxEspc1Vk558XbkOTd/QQXan3Dba2jDqMBmHCo3LLphfjut0a
         V30dLmVmJEzZJ2ROeRwMj9Ci+6ccSstT/DOkknvfPbxzMlddz549IkDUWRjSvlZox1/J
         1N84vH4ByD+Npmu7I7zGHL9q+LVtvrxP9MHo3CT+YcTYA5zPBIxE5iMBIFhzKvckVfUQ
         IOicaQH7G8Fs26V41+7wbe4aVSoCCxStlYkdWyOpt4pJLEBIvtwYWvazG+T6ZyNh8FuH
         xGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m2VgctS9k0onJoQ+C26IEDnuG2AgnqBi68w0KHrlzNA=;
        b=UZWzqN3rAXRDqeux74iiypbiCB79zF0KGiNQMEhnjDYBRgR9RS4dwRYwvCzYzuTgTV
         cA1oUxFrNow0Fq4xC4EOw1SHzd4D5nuy2c9pZ5vw11xC2FgRy/kPo7Eb5HKkv6GZJuOy
         LMbZYKOwW3z2HgE7AntbzLAulzY9tcuTe3oEUzDG597Vzp+8Mfmnb7HcsTqrNho6JDq1
         2EAfSkrPqElyXmJ4tL974M7oTQZXGdcloUbpWLp9KdQCdX5FANmHzBIgXyD+qqrkIn00
         XNcUP01QLWu77QHU+LCgOpglC1MIp/wGGVx0TZUCRCKi+WOq/MVntN8/jMXpL69yK+n7
         xCtQ==
X-Gm-Message-State: ANhLgQ2pIFTK9DAmB66iDSCSl5sUueF+tV7Kh7o7LEheNB/j6gyXykDk
        +Bg+P0LaMO21Iajn/jJsuX0tPnPWpnNUvTuHm1o=
X-Google-Smtp-Source: ADFU+vsUKu6cs4FScroGgeKtpc8cwJ46ysU1li4E5NRjEIjx2ULrApBboKPsivXVWH+9bvG1E75z/j5i8AVRisHGh5M=
X-Received: by 2002:a4a:2c55:: with SMTP id o82mr9791474ooo.33.1585323329619;
 Fri, 27 Mar 2020 08:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200318170638.18562-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200318170638.18562-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200319131312.GA3192108@oden.dyn.berto.se>
In-Reply-To: <20200319131312.GA3192108@oden.dyn.berto.se>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 27 Mar 2020 15:35:03 +0000
Message-ID: <CA+V-a8sf3p8jDQ+WJhcZGHwhrWBO_DBVtZH0Y6n3k0_89tOU_A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: rcar-vin: Add support for
 MEDIA_BUS_FMT_SRGGB8_1X8 format
To:     Niklas <niklas.soderlund@ragnatech.se>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Thu, Mar 19, 2020 at 1:13 PM Niklas <niklas.soderlund@ragnatech.se> wrot=
e:
>
> Hi Prabhakar,
>
> Thanks for your work.
>
> On 2020-03-18 17:06:37 +0000, Lad Prabhakar wrote:
> > Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format in rcar-vin by setting
> > format type to RAW8 in VNMC register and appropriately setting the
> > bpp, bytesperline to enable V4L2_PIX_FMT_SRGGB8.
>
> > For RAW8 format data is transferred by 4-Byte unit so VnIS register is
> > configured accordingly.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-core.c |  1 +
> >  drivers/media/platform/rcar-vin/rcar-dma.c  | 11 ++++++++++-
> >  drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++++
> >  3 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/medi=
a/platform/rcar-vin/rcar-core.c
> > index 7440c8965d27..76daf2fe5bcd 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > @@ -469,6 +469,7 @@ static int rvin_parallel_subdevice_attach(struct rv=
in_dev *vin,
> >               case MEDIA_BUS_FMT_UYVY8_2X8:
> >               case MEDIA_BUS_FMT_UYVY10_2X10:
> >               case MEDIA_BUS_FMT_RGB888_1X24:
> > +             case MEDIA_BUS_FMT_SRGGB8_1X8:
>
> This is wrong RAW formats are only supported on the CSI-2 interface and
> not the parallel one. This line shall be dropped.
>
sure will drop this.

> >                       vin->mbus_code =3D code.code;
> >                       vin_dbg(vin, "Found media bus format for %s: %d\n=
",
> >                               subdev->name, vin->mbus_code);
> > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media=
/platform/rcar-vin/rcar-dma.c
> > index 1a30cd036371..ec7b49c0b281 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > @@ -85,6 +85,7 @@
> >  #define VNMC_INF_YUV8_BT601  (1 << 16)
> >  #define VNMC_INF_YUV10_BT656 (2 << 16)
> >  #define VNMC_INF_YUV10_BT601 (3 << 16)
> > +#define VNMC_INF_RAW8                (4 << 16)
> >  #define VNMC_INF_YUV16               (5 << 16)
> >  #define VNMC_INF_RGB888              (6 << 16)
> >  #define VNMC_VUP             (1 << 10)
> > @@ -587,13 +588,14 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
> >       rvin_write(vin, vin->crop.top, VNSLPRC_REG);
> >       rvin_write(vin, vin->crop.top + vin->crop.height - 1, VNELPRC_REG=
);
> >
> > -
> >       /* TODO: Add support for the UDS scaler. */
> >       if (vin->info->model !=3D RCAR_GEN3)
> >               rvin_crop_scale_comp_gen2(vin);
> >
> >       fmt =3D rvin_format_from_pixel(vin, vin->format.pixelformat);
> >       stride =3D vin->format.bytesperline / fmt->bpp;
> > +     if (vin->format.pixelformat =3D=3D V4L2_PIX_FMT_SRGGB8)
> > +             stride /=3D 2;
>
> I'm sorry this makes no sens to me.
>
> - The width of the image is number of pixels in the raw format.
> - In memory each row is either is either RGRGRG... or GBGBGB...
> - The pixel size is 1 byte per pixel.
> - We calculate bytesperline as ALIGN(width, align) * bpp, where align is
>   how much we need to "adjust" the width to match the VNIS_REG reg
>   value.  We do this in rvin_format_bytesperline().
> - We then remove bpp from bytesperline and we have a unit in pixels
>   which is our stride.
>
> I can't see why you need to cut the stride in half. In my view you
> should add a check for V4L2_PIX_FMT_SRGGB8 in rvin_format_bytesperline()
> and pick an alignment value that matches the restrictions.
>
> I might miss something, but then I wish to learn.
>
I have replied for this issue on v2
(https://lkml.org/lkml/2020/3/27/384) as the VIN
processes RAW8 as 2 byte per pixel.

> >       rvin_write(vin, stride, VNIS_REG);
> >  }
> >
> > @@ -676,6 +678,9 @@ static int rvin_setup(struct rvin_dev *vin)
> >
> >               input_is_yuv =3D true;
> >               break;
> > +     case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +             vnmc |=3D VNMC_INF_RAW8;
> > +             break;
>
> Here and ...
>
> >       default:
> >               break;
> >       }
> > @@ -737,6 +742,9 @@ static int rvin_setup(struct rvin_dev *vin)
> >       case V4L2_PIX_FMT_ABGR32:
> >               dmr =3D VNDMR_A8BIT(vin->alpha) | VNDMR_EXRGB | VNDMR_DTM=
D_ARGB;
> >               break;
> > +     case V4L2_PIX_FMT_SRGGB8:
> > +             dmr =3D 0;
> > +             break;
>
> ... here we have a new problem, sorry for not thinking of it before.
>
> Up until now the VIN was capable to convert any of its supported input
> mbus formats to any of it's supported output pixel formats. With the
> addition of RAW formats this is no longer true. This new restriction
> needs to be added to the driver.
>
> Luck has it we can fix ...
>
> >       default:
> >               vin_err(vin, "Invalid pixelformat (0x%x)\n",
> >                       vin->format.pixelformat);
> > @@ -1110,6 +1118,7 @@ static int rvin_mc_validate_format(struct rvin_de=
v *vin, struct v4l2_subdev *sd,
> >       case MEDIA_BUS_FMT_UYVY8_2X8:
> >       case MEDIA_BUS_FMT_UYVY10_2X10:
> >       case MEDIA_BUS_FMT_RGB888_1X24:
> > +     case MEDIA_BUS_FMT_SRGGB8_1X8:
> >               vin->mbus_code =3D fmt.format.code;
>
> ... this here by changes this to
>
>         switch (fmt.format.code) {
>         case MEDIA_BUS_FMT_YUYV8_1X16:
>         case MEDIA_BUS_FMT_UYVY8_1X16:
>         case MEDIA_BUS_FMT_UYVY8_2X8:
>         case MEDIA_BUS_FMT_UYVY10_2X10:
>                 break;
>         case MEDIA_BUS_FMT_RGB888_1X24:
>                 if (vin->format.pixelformat !=3D V4L2_PIX_FMT_SRGGB8)
>                     return -EPIPE:
>                 break;
>         default:
>                 return -EPIPE;
>         }
>
>         vin->mbus_code =3D fmt.format.code;
>
Will fix it as above.

Cheers,
--Prabhakar

> >               break;
> >       default:
> > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/medi=
a/platform/rcar-vin/rcar-v4l2.c
> > index 5151a3cd8a6e..ca542219e8ae 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > @@ -66,6 +66,10 @@ static const struct rvin_video_format rvin_formats[]=
 =3D {
> >               .fourcc                 =3D V4L2_PIX_FMT_ABGR32,
> >               .bpp                    =3D 4,
> >       },
> > +     {
> > +             .fourcc                 =3D V4L2_PIX_FMT_SRGGB8,
> > +             .bpp                    =3D 1,
> > +     },
> >  };
> >
> >  const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev=
 *vin,
> > --
> > 2.20.1
> >
>
> --
> Regards,
> Niklas S=C3=B6derlund
