Return-Path: <linux-media+bounces-19235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3461F994786
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56C90B29389
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72221DE3A2;
	Tue,  8 Oct 2024 11:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZptZMtV2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E38D1D1757;
	Tue,  8 Oct 2024 11:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728387784; cv=none; b=rDixLAKNg/ZS7xxMLUzQ+jFaZnr7TbX2ykkwncPoN0cycnD+DMpgSCXbJjoMAqvJD/sqApt+PH+MCmKrBxG4CZ65w5QDxT/1J1U5L5F2Ffpru0/IL7iZVtIKVFtboFbfUctdVgCFtbqWI0AuEFDEk0JSQJ8iwZifAQ/31fn3loI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728387784; c=relaxed/simple;
	bh=0elVgKqRhFsVKBsPu9083FGtCApHiUaSuzP/nHJLHRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ubrTGeAiHlAGr9I067O2+ggJFJO67atEpNY+99w2eVeKLMGBjN2ZtnVWFfzamXav+tOOUe4v9qv4Kb9On7dmcx843kh+WBWMIHc9smHtym0Se9rAF/rJDH3UV7SxGEEnBEnRPuY1ZC7deYaxnNdfDXelwYT0TtOFxzNU8Yo/5co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZptZMtV2; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-50792ed3ad9so1640035e0c.3;
        Tue, 08 Oct 2024 04:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728387781; x=1728992581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDuZQevw0MOR5xTDiOihfOGLpC9wy/PdUZmugq87unA=;
        b=ZptZMtV2iiSs+NLQ7zX+CkU+xAbLWe5I2ImwMj4E5tySTa7nbyoloTTWy/eO0smE+H
         pP4yKs5il8aX9cEz7nK245x/bJ9Z6Zezm6orFyydEGwFGU0oLmVff/nR7jmFKEN30bDw
         EHdbDT3GVvY8kPo9eCv0R1k7KFf+butLSK+WoJ5a6TNkxpBRHxJ+gCtUoHeFS8HwCUv9
         g5wRU6pg5JCBxelnPxtf/3YV5gNTvidYh+o/YBSyAaUY23w9iA6Sh27VPxKgXCz34S2B
         wReNrZQLEcr0+aToX7ZvlRBkzBmCE3H9+2fpDXlUWUJJ/Dg37vFfkJbXYeBYY7M24gSh
         3c7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728387781; x=1728992581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDuZQevw0MOR5xTDiOihfOGLpC9wy/PdUZmugq87unA=;
        b=wi4xvfaYsW9nqC3HB47sQ3HCdTm/4Ni3s5/tOHPoA37H3joyum/qjAh0CE5dQ1af4J
         vn1H6/xdfjXm6VpE3Z/BJiEk1NJp7CLfuKvIsctQSVyfX78BqzLGwtonv2N6w9NK4zPt
         THdxKYzuACxVXL7O9EeoUUhCiJYksHgsw73cJ5RSBQXrNeZCr0XE1xmHxwMG+5IC8xIA
         tWHWon4bX02Tp6vrsqW3wWILtOoYt1oT9FQDH5KQCKecp4OZwU290uF5R8GfJqc/qYFI
         eYB77MfJw5BNAXwsMN2jLbsI9dmHIbDePkHi4hKOql6JwtT5mJ94v995bv1f6uhmRDb2
         kCdA==
X-Forwarded-Encrypted: i=1; AJvYcCUWer28u534Fef7TvI+Mnu/6bpewRUEs72d/GNivR8Mez7HEy+uVIUFJxHgRHtBqA4ighIJgV9EFZry6wQ=@vger.kernel.org, AJvYcCUYjB07N3K7T8k+5Rtpy9JqA1/0Gq3CvJP1ohy8vBD5BrUssktBtctuo8LMmnOQkYL486AZI29zpMC3skQ=@vger.kernel.org, AJvYcCWuk+sBNmWSzzoVaBbsEcu0ih4siMrIcpe/NjTHJIGWEZwHERPLr3zUwPyc5ILpOUmQC9RYbXzNmJR9kfbjC3S/csg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBGXg4SjiaiskETSesBYyYhe7hI/hmmWF2hqwKsLhremNAzWNQ
	84SHOhEUVOaID8Ef2YcobeGYIYzZH+JBSgktRxu838/Ny3unLBSDqZ7zqJekQODBRQT55KHEpFy
	VF6WIC6x043hhEeIghejqjFMJ7jGyvw==
X-Google-Smtp-Source: AGHT+IGiM+QZ1IzvpkH+Ft3l9J1hattVJoqEA+6OoPB9OiGqLtsnDU7az/RMhuTpegkyGf0sWYOxFycY8PG7SXsP3RU=
X-Received: by 2002:a05:6122:3198:b0:4f2:ea44:fd2b with SMTP id
 71dfb90a1353d-50c852eef61mr10804054e0c.0.1728387780987; Tue, 08 Oct 2024
 04:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241007184839.190519-11-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241007202137.GK14766@pendragon.ideasonboard.com>
In-Reply-To: <20241007202137.GK14766@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Oct 2024 12:42:34 +0100
Message-ID: <CA+V-a8trD-td-zRGvMtfxry+VZ3fAVM9464aqSiBpkNiuBz_EQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/17] media: rzg2l-cru: Simplify handling of supported formats
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Mon, Oct 7, 2024 at 9:21=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Mon, Oct 07, 2024 at 07:48:32PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Refactor the handling of supported formats in the RZ/G2L CRU driver by
> > moving the `rzg2l_cru_ip_format` struct to the common header to allow
> > reuse across multiple files and adding pixelformat and bpp members to i=
t.
> > This change centralizes format handling, making it easier to manage and
> > extend.
> >
> > - Moved the `rzg2l_cru_ip_format` struct to `rzg2l-cru.h` for better
> >   accessibility.
> > - Added format, datatype and bpp members to `rzg2l_cru_ip_format` struc=
t
> > - Dropped rzg2l_cru_formats
> > - Introduced helper functions `rzg2l_cru_ip_code_to_fmt()`,
> >   `rzg2l_cru_ip_format_to_fmt()`, and
> >   `rzg2l_cru_ip_index_to_fmt()` to streamline format lookups.
> > - Refactored the `rzg2l_cru_csi2_setup` and format alignment functions
> >   to utilize the new helpers.
>
> The general rule is once change, one patch. Bundling multiple changes
> together makes review more difficult. A bullet list of changes in a
> commit message is a sign you're bundling too many changed together.
>
Agreed, I will henceforth take care.

> You can still group related changes together when it makes sensor. For
> instance moving rzg2l_cru_ip_format to rzg2l-cru.h and adding the
> rzg2l_cru_ip_code_to_fmt() & co helper functions can be one patch.
>
Agreed, I will split this up.

> > Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.c=
om>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    | 20 +++++-
> >  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 36 ++++++++--
> >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 67 ++++++-------------
> >  3 files changed, 69 insertions(+), 54 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > index 4fe24bdde5b2..39296a59b3da 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > @@ -62,6 +62,20 @@ struct rzg2l_cru_ip {
> >       struct v4l2_subdev *remote;
> >  };
> >
> > +/**
> > + * struct rzg2l_cru_ip_format - CRU IP format
> > + * @code: Media bus code
> > + * @format: 4CC format identifier (V4L2_PIX_FMT_*)
> > + * @datatype: MIPI CSI2 data type
> > + * @bpp: bytes per pixel
> > + */
> > +struct rzg2l_cru_ip_format {
> > +     u32 code;
> > +     u32 format;
> > +     u32 datatype;
> > +     u8 bpp;
> > +};
> > +
> >  /**
> >   * struct rzg2l_cru_dev - Renesas CRU device structure
> >   * @dev:             (OF) device
> > @@ -144,10 +158,12 @@ int rzg2l_cru_video_register(struct rzg2l_cru_dev=
 *cru);
> >  void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru);
> >  irqreturn_t rzg2l_cru_irq(int irq, void *data);
> >
> > -const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format)=
;
> > -
> >  int rzg2l_cru_ip_subdev_register(struct rzg2l_cru_dev *cru);
> >  void rzg2l_cru_ip_subdev_unregister(struct rzg2l_cru_dev *cru);
> >  struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_d=
ev *cru);
> >
> > +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned in=
t code);
> > +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 forma=
t);
> > +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index)=
;
> > +
> >  #endif
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/driv=
ers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > index 7b006a0bfaae..fde6f4781cfb 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > @@ -6,17 +6,21 @@
> >   */
> >
> >  #include <linux/delay.h>
> > -#include "rzg2l-cru.h"
> >
> > -struct rzg2l_cru_ip_format {
> > -     u32 code;
> > -};
> > +#include <media/mipi-csi2.h>
> > +
> > +#include "rzg2l-cru.h"
> >
> >  static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] =3D {
> > -     { .code =3D MEDIA_BUS_FMT_UYVY8_1X16, },
> > +     {
> > +             .code =3D MEDIA_BUS_FMT_UYVY8_1X16,
> > +             .format =3D V4L2_PIX_FMT_UYVY,
> > +             .datatype =3D MIPI_CSI2_DT_YUV422_8B,
> > +             .bpp =3D 2,
> > +     },
> >  };
> >
> > -static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsi=
gned int code)
> > +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned in=
t code)
> >  {
> >       unsigned int i;
> >
> > @@ -27,6 +31,26 @@ static const struct rzg2l_cru_ip_format *rzg2l_cru_i=
p_code_to_fmt(unsigned int c
> >       return NULL;
> >  }
> >
> > +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 forma=
t)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++) {
> > +             if (rzg2l_cru_ip_formats[i].format =3D=3D format)
> > +                     return &rzg2l_cru_ip_formats[i];
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index)
> > +{
> > +     if (index >=3D ARRAY_SIZE(rzg2l_cru_ip_formats))
> > +             return NULL;
> > +
> > +     return &rzg2l_cru_ip_formats[index];
> > +}
> > +
> >  struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_d=
ev *cru)
> >  {
> >       struct v4l2_subdev_state *state;
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/d=
rivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index de88c0fab961..ceb9012c9d70 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -300,21 +300,10 @@ static void rzg2l_cru_initialize_axi(struct rzg2l=
_cru_dev *cru)
> >       rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
> >  }
> >
> > -static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *inpu=
t_is_yuv,
> > -                              struct v4l2_mbus_framefmt *ip_sd_fmt, u8=
 csi_vc)
> > +static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, u8 csi_vc,
> > +                              u32 csi2_datatype)
>
> I would pass the rzg2l_cru_ip_format pointer (make it const) to this
> function instead of csi2_datatype.
>
OK.

> >  {
> > -     u32 icnmc;
> > -
> > -     switch (ip_sd_fmt->code) {
> > -     case MEDIA_BUS_FMT_UYVY8_1X16:
> > -             icnmc =3D ICnMC_INF(MIPI_CSI2_DT_YUV422_8B);
> > -             *input_is_yuv =3D true;
> > -             break;
> > -     default:
> > -             *input_is_yuv =3D false;
> > -             icnmc =3D ICnMC_INF(MIPI_CSI2_DT_USER_DEFINED(0));
> > -             break;
> > -     }
> > +     u32 icnmc =3D ICnMC_INF(csi2_datatype);
> >
> >       icnmc |=3D (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
> >
> > @@ -328,17 +317,20 @@ static int rzg2l_cru_initialize_image_conv(struct=
 rzg2l_cru_dev *cru,
> >                                          struct v4l2_mbus_framefmt *ip_=
sd_fmt,
> >                                          u8 csi_vc)
> >  {
> > -     bool output_is_yuv =3D false;
> > -     bool input_is_yuv =3D false;
> > +     const struct v4l2_format_info *src_finfo, *dst_finfo;
> > +     const struct rzg2l_cru_ip_format *cru_ip_fmt;
> >       u32 icndmr;
> >
> > -     rzg2l_cru_csi2_setup(cru, &input_is_yuv, ip_sd_fmt, csi_vc);
> > +     cru_ip_fmt =3D rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
> > +     rzg2l_cru_csi2_setup(cru, csi_vc, cru_ip_fmt->datatype);
> > +
> > +     src_finfo =3D v4l2_format_info(cru_ip_fmt->format);
> > +     dst_finfo =3D v4l2_format_info(cru->format.pixelformat);
> >
> >       /* Output format */
> >       switch (cru->format.pixelformat) {
> >       case V4L2_PIX_FMT_UYVY:
> >               icndmr =3D ICnDMR_YCMODE_UYVY;
> > -             output_is_yuv =3D true;
> >               break;
> >       default:
> >               dev_err(cru->dev, "Invalid pixelformat (0x%x)\n",
> > @@ -347,7 +339,7 @@ static int rzg2l_cru_initialize_image_conv(struct r=
zg2l_cru_dev *cru,
> >       }
> >
> >       /* If input and output use same colorspace, do bypass mode */
> > -     if (output_is_yuv =3D=3D input_is_yuv)
> > +     if (v4l2_is_format_yuv(src_finfo) && v4l2_is_format_yuv(dst_finfo=
))
>
> I think this should be
>
>         if (v4l2_is_format_yuv(src_finfo) =3D=3D v4l2_is_format_yuv(dst_f=
info))
>
Agreed.

> >               rzg2l_cru_write(cru, ICnMC,
> >                               rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR=
);
> >       else
> > @@ -810,35 +802,15 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *=
cru)
> >  /* -------------------------------------------------------------------=
----------
> >   * V4L2 stuff
> >   */
> > -
> > -static const struct v4l2_format_info rzg2l_cru_formats[] =3D {
> > -     {
> > -             .format =3D V4L2_PIX_FMT_UYVY,
> > -             .bpp[0] =3D 2,
> > -     },
> > -};
> > -
> > -const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format)
> > -{
> > -     unsigned int i;
> > -
> > -     for (i =3D 0; i < ARRAY_SIZE(rzg2l_cru_formats); i++)
> > -             if (rzg2l_cru_formats[i].format =3D=3D format)
> > -                     return rzg2l_cru_formats + i;
> > -
> > -     return NULL;
> > -}
> > -
> >  static u32 rzg2l_cru_format_bytesperline(struct v4l2_pix_format *pix)
> >  {
> > -     const struct v4l2_format_info *fmt;
> > -
> > -     fmt =3D rzg2l_cru_format_from_pixel(pix->pixelformat);
> > +     const struct rzg2l_cru_ip_format *fmt;
> >
> > +     fmt =3D rzg2l_cru_ip_format_to_fmt(pix->pixelformat);
> >       if (WARN_ON(!fmt))
> > -             return -EINVAL;
> > +             return 0;
>
> This change isn't described in the commit message.
>
I'll make this as a separate patch.

> >
> > -     return pix->width * fmt->bpp[0];
> > +     return pix->width * fmt->bpp;
> >  }
> >
> >  static u32 rzg2l_cru_format_sizeimage(struct v4l2_pix_format *pix)
> > @@ -849,7 +821,7 @@ static u32 rzg2l_cru_format_sizeimage(struct v4l2_p=
ix_format *pix)
> >  static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
> >                                  struct v4l2_pix_format *pix)
> >  {
> > -     if (!rzg2l_cru_format_from_pixel(pix->pixelformat))
> > +     if (!rzg2l_cru_ip_format_to_fmt(pix->pixelformat))
>
> Here you're calling rzg2l_cru_ip_format_to_fmt(), and just below the
> function calls rzg2l_cru_format_bytesperline(), which calls
> rzg2l_cru_format_from_pixel() again. Store the pointer here, drop the
> rzg2l_cru_format_bytesperline() function, and just write
>
>         pix->bytesperline =3D pix->width * fmt->bpp;
>
Agreed, I'll update it as mentioned above.

> below. I would also inline rzg2l_cru_format_sizeimage() in this function
> as there's a single caller.
>
OK, I'll update it as above.

Cheers,
Prabhakar

