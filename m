Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9429117CE4E
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 14:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgCGNKP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 08:10:15 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41021 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgCGNKP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Mar 2020 08:10:15 -0500
Received: by mail-oi1-f196.google.com with SMTP id i1so5482892oie.8;
        Sat, 07 Mar 2020 05:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RwrGlWUeDdrZs72IT+J7vSx4hepf4WZav0X4UAXwBbg=;
        b=jh4Gk6G8k3mK3s/gTGl2ObaH2xmSCBeX3xnIIwKu68MTiZ0oLJJ+1KGQIoqKe0hX5g
         PhfJqlpFKa2kNj/QenEH36cekVlVRM+wEuVGNrkvwCdiyvDNhIJNlXSS2wVhIVPsjB9G
         +65ZcEq5j7cElKuIqFHJkFWnSIAPp5Dm1UoYafYV+AQRwvP/VKWYehiizVpb7xQ2waQ5
         +bMap4KfTlenQ9VTzsHXmZ0F97cCEPVBeNdGJddYAqZxXpkvMkf/U1emcugxnISnhOti
         Tpa9PVP/WAnG+VBZWewVI4RsaD6dAMCyWv89DjnszpzmBKuHojbsfdi7usYUjWmqvKsH
         kcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RwrGlWUeDdrZs72IT+J7vSx4hepf4WZav0X4UAXwBbg=;
        b=iWlYCbcvf4s5OVFwdIHKu/lsIZjQBdMfRIq0iOnTXWthXW3tpqrMKdqiOd0LfL18wq
         coPTmijQk7UEgwbxRhqGuCGApggz4hTHcBhnradUZFXIjBW3UNkAC9RZoPAzt+fQ32OE
         FrormN+y2BOpG1/CAdhvAcheJ30ALi8WteIByPI3cniaZ23Qh4MYwJ7+8URdlVdCLKWg
         dOJgV4gvJQW0fYF+kAkqqaaAu/RvGy1RVKOn0eJLF9ML/D7Yk2SyW7ADd4fKBx0ABgb9
         cU3oiIKDjBKaY+DyZ2yUOiRKgZYpY5Os+zXk1jTzRY8ojMDdPU+W9aC/v+nCL1vh3LG2
         FuNQ==
X-Gm-Message-State: ANhLgQ0lmbxt6EOZhTi1QT5QUG5qomC6ztVnsAcIJ1RaJOMmtbec2FWp
        hw7TtNJQWc5tZyIUZxIv7nraeokLxWY4wP/a7ww=
X-Google-Smtp-Source: ADFU+vsJVnZ/8WOsPjnjwHpe2WrHSMchbfxiPVRfxu/vDlc3O+3DIyxaReRUbE4Osnl9xW0cOkHE2Y90v3LT70IK8U8=
X-Received: by 2002:aca:524a:: with SMTP id g71mr5833060oib.7.1583586612418;
 Sat, 07 Mar 2020 05:10:12 -0800 (PST)
MIME-Version: 1.0
References: <20200228165011.17898-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200228165011.17898-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200304205516.GD1791497@oden.dyn.berto.se>
In-Reply-To: <20200304205516.GD1791497@oden.dyn.berto.se>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 7 Mar 2020 13:09:46 +0000
Message-ID: <CA+V-a8u6CzinQHuppXHqnAxTU0WUpSbof7o_Anw9Tdz-vvhqSA@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: rcar-vin: Add support for SRGGB8_1X8
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

Thank you for the review.

On Wed, Mar 4, 2020 at 8:55 PM Niklas <niklas.soderlund@ragnatech.se> wrote=
:
>
> Hi Lad,
>
> Thanks for your work.
>
> On 2020-02-28 16:50:11 +0000, Lad Prabhakar wrote:
> > Most of the RZ/G2x boards can support capturing frames in SRGGB8_1X8
> > format, add support for this with a runtime check that the running
> > hardware supports it.
>
> Where is the runtime check for supported hardware? Also out of curiosity
> which boars can't support SRGGB and what setup are you using to test
> SRGGB capture?
>
My bad l'll drop the statement "runtime check for supported hardware".
All the G2x
boards support SRGGB8. I am currently testing this on a G2E board connected=
 with
a mipi adapter (https://www.96boards.org/product/mipiadapter/) and
raspberry pi camera
module (https://www.raspberrypi.org/products/camera-module-v2/).

> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-core.c |  1 +
> >  drivers/media/platform/rcar-vin/rcar-csi2.c |  1 +
> >  drivers/media/platform/rcar-vin/rcar-dma.c  | 14 ++++++++++++--
> >  drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++++
>
> This patch shall be split in two. One which touches rcar-csi2.c and one
> for the other files as they are two different drivers.
>
sure will split this patch into two.

> >  4 files changed, 18 insertions(+), 2 deletions(-)
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
> >                       vin->mbus_code =3D code.code;
> >                       vin_dbg(vin, "Found media bus format for %s: %d\n=
",
> >                               subdev->name, vin->mbus_code);
> > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/medi=
a/platform/rcar-vin/rcar-csi2.c
> > index 5b04e4768eb1..97e4886f63f0 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -320,6 +320,7 @@ static const struct rcar_csi2_format rcar_csi2_form=
ats[] =3D {
> >       { .code =3D MEDIA_BUS_FMT_YUYV8_1X16,     .datatype =3D 0x1e, .bp=
p =3D 16 },
> >       { .code =3D MEDIA_BUS_FMT_UYVY8_2X8,      .datatype =3D 0x1e, .bp=
p =3D 16 },
> >       { .code =3D MEDIA_BUS_FMT_YUYV10_2X10,    .datatype =3D 0x1e, .bp=
p =3D 20 },
> > +     { .code =3D MEDIA_BUS_FMT_SRGGB8_1X8,     .datatype =3D 0x2a, .bp=
p =3D 8 },
> >  };
> >
> >  static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int c=
ode)
> > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media=
/platform/rcar-vin/rcar-dma.c
> > index 1a30cd036371..63709b4bbf7a 100644
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
> > @@ -587,13 +588,15 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
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
> > -     stride =3D vin->format.bytesperline / fmt->bpp;
> > +     if (vin->format.pixelformat =3D=3D V4L2_PIX_FMT_SRGGB8)
> > +             stride =3D ALIGN(vin->format.bytesperline / 2, 0x10);
> > +     else
> > +             stride =3D vin->format.bytesperline / fmt->bpp;
>
> This does not look right, you should to move this logic into
> rvin_format_bytesperline().
>
sure will move it.

Cheers,
--Prabhakar

> >       rvin_write(vin, stride, VNIS_REG);
> >  }
> >
> > @@ -676,6 +679,9 @@ static int rvin_setup(struct rvin_dev *vin)
> >
> >               input_is_yuv =3D true;
> >               break;
> > +     case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +             vnmc |=3D VNMC_INF_RAW8;
> > +             break;
> >       default:
> >               break;
> >       }
> > @@ -737,6 +743,9 @@ static int rvin_setup(struct rvin_dev *vin)
> >       case V4L2_PIX_FMT_ABGR32:
> >               dmr =3D VNDMR_A8BIT(vin->alpha) | VNDMR_EXRGB | VNDMR_DTM=
D_ARGB;
> >               break;
> > +     case V4L2_PIX_FMT_SRGGB8:
> > +             dmr =3D 0;
> > +             break;
> >       default:
> >               vin_err(vin, "Invalid pixelformat (0x%x)\n",
> >                       vin->format.pixelformat);
> > @@ -1110,6 +1119,7 @@ static int rvin_mc_validate_format(struct rvin_de=
v *vin, struct v4l2_subdev *sd,
> >       case MEDIA_BUS_FMT_UYVY8_2X8:
> >       case MEDIA_BUS_FMT_UYVY10_2X10:
> >       case MEDIA_BUS_FMT_RGB888_1X24:
> > +     case MEDIA_BUS_FMT_SRGGB8_1X8:
> >               vin->mbus_code =3D fmt.format.code;
> >               break;
> >       default:
> > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/medi=
a/platform/rcar-vin/rcar-v4l2.c
> > index b12b3f88836a..d56cf85ba065 100644
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
