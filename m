Return-Path: <linux-media+bounces-18868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4B698A4B4
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 15:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EBD8281E9F
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 13:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FF4191F61;
	Mon, 30 Sep 2024 13:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxTfzwWO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3580418FDDA;
	Mon, 30 Sep 2024 13:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727702472; cv=none; b=aRHsI7Kag2ynM3rKCiNVHOO7GmaSxPutBnQewv6tFUVPz4aenOB/he3qDUOlqkuvGKy5iHc9aFjDR030zV1JvAYdp+BkROQzapc6ZDA5137l8SJ7NcAKRKX2C+sCBYAIRK5CibfpnMqJELBpkXKORGRVFZF+HSXSaEVT4qNImX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727702472; c=relaxed/simple;
	bh=OVmH+Sm7HlQEXN9vBz5xfclFnlcU5sNczZ+6jg14Wxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXNpSD3IHrm2vl8LJAGQte4v6GSyQkxAGBAF2mJi4AXgK7bsXuToV8vRE9jaIA5Gmj3z9pHTrzsdM8WlpwIItwEYer8w/pQK6GkFM4mZKFZIT0cLrKLRnNV8Rk+9fSRY4vOuvGYqO2oGa9PicRHQrCIWTziVvfxfBtyQnEhm6d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxTfzwWO; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-710da656c0bso1592447a34.0;
        Mon, 30 Sep 2024 06:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727702470; x=1728307270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtno9snXCnOXEYe+LmBrqbtpTspPjb7R9BkymIrCt2Y=;
        b=TxTfzwWOsuEXZyAbHYkQkQpimOPC+58CkhP2nAi1yz7j0NadDK1B0O0Z0DFSBbqvzL
         sLCTdksDMY0bkujcU5UGCp+jVP0BCuiKVCPudcTQuWxPu2gy3uvCpQRGnrNAn3ArJqvJ
         S+hnq34cuZRzKRktB0bD99jMEZmB664GwdwRjjocADKPUY2RluOdHXb9p+a1sWENFBtS
         KYuCskZvBC5urK4JvHtyZUbHIJVM6wkE17BacaBoxrJLcAyIhQ2O3ptO/a7JVWMFu8lf
         w1blj8XQymGnkQbiJkh0HdASBlLgyBcc2ctJUmqUnlTROeLZcFz7rl16uhr7cz+4Xung
         nQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727702470; x=1728307270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtno9snXCnOXEYe+LmBrqbtpTspPjb7R9BkymIrCt2Y=;
        b=JLQFTVMgYokQYzh9lUbZm4pjCmyaSbipoGtm8RXRgA5PpExPFcp6rLuS23zIZf4x5I
         K0osB8GMG8tB0YHe6SpwOxuBgH+YdCunE+K/W1MTOr4eXKp1bqGREE6/kUFVJzjqY8r3
         p77D4AqJwvscdRT8VHkGOa2caS5UIL++s15bA/mKlpUA93q1EMuoYjYChxorjjBMPwnl
         B7/+jq06465bRNKhdl4wkUQzIhvbs9ogOrPrF1JGWzkDl9AgKSAlnuhhSwPAWSIBV5hA
         tmqED65FViV72ME37CUa07/qy9ysgm3dyPc4OGP3FPdSth1WV8PVoOte363+2BwmZNQX
         04Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVRxN6cxzkuIHcnpvDFFsZZC8+RcKdxr6NijYWFH/+9y5y4n8vNYTJu/4LZfqLrp13ABilU3ZRVZcx+ipo=@vger.kernel.org, AJvYcCWAZpUg44jRIfMpb+oTKze+CWglvahnxiv5P1CdkndVcxf4rZypHv5/xLU7Idexmm2pSAd07u+S4C2KKx0=@vger.kernel.org, AJvYcCXFRiR3QOfQnrxHJYepLqOq7Z+bayW2T1Eyn/eCMmr+D+q9mm/jFSuMk99Pntld6mGZyUDiRSSJzePnQpQXzg7JD+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY43wOQfCBB6e5J+0cahBOp232LOqDGxp3kU2PpItL1E9fa12H
	IJAONO/XKRk+AICeSlZLY9inANYdG/mpvQwALEtoYvA32PQDKDG6gUp5eph/c/nky300XPXS/3g
	0mwsfHJlepyH1xY0Z8Ml20oXWRas=
X-Google-Smtp-Source: AGHT+IEtnmcoVDr7t7+Kx04IZO06NWMtkInz2sIjynCa0SdR8d7eu1ZY5OPXC3i6GPKbRkAxSoaIQPQzXyOgM96DPrQ=
X-Received: by 2002:a05:6358:54a6:b0:1b8:3245:be3d with SMTP id
 e5c5f4694b2df-1becbb9702fmr351328055d.13.1727702470058; Mon, 30 Sep 2024
 06:21:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-11-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240927225923.GJ12322@pendragon.ideasonboard.com>
In-Reply-To: <20240927225923.GJ12322@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Sep 2024 14:20:43 +0100
Message-ID: <CA+V-a8sQfynxxUYRrPNwUabcQyrmNvz=U3_P6FRK91s+t3KX3w@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] media: platform: rzg2l-cru: Simplify handling of
 supported formats
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

On Fri, Sep 27, 2024 at 11:59=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Tue, Sep 10, 2024 at 06:53:51PM +0100, Prabhakar wrote:
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
> >   `rzg2l_cru_ip_pix_fmt_to_bpp()`, and
> >   `rzg2l_cru_ip_index_to_pix_fmt()` to streamline format lookups.
> > - Refactored the `rzg2l_cru_csi2_setup` and format alignment functions
> >   to utilize the new helpers.
> >
> > Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.c=
om>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    | 20 +++++-
> >  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 35 +++++++--
> >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 71 +++++++------------
> >  3 files changed, 72 insertions(+), 54 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > index 4fe24bdde5b2..24097df14881 100644
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
> > +u8 rzg2l_cru_ip_pix_fmt_to_bpp(u32 format);
> > +int rzg2l_cru_ip_index_to_pix_fmt(u32 index);
> > +
> >  #endif
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/driv=
ers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > index cc297e137f3e..2d3b985b7b0d 100644
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
> > @@ -27,6 +31,25 @@ static const struct rzg2l_cru_ip_format *rzg2l_cru_i=
p_code_to_fmt(unsigned int c
> >       return NULL;
> >  }
> >
> > +u8 rzg2l_cru_ip_pix_fmt_to_bpp(u32 format)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++)
> > +             if (rzg2l_cru_ip_formats[i].format =3D=3D format)
> > +                     return rzg2l_cru_ip_formats[i].bpp;
> > +
> > +     return 0;
> > +}
>
> Instead of making this a ad-hoc 4cc -> bpp conversion, I would rename
> the function to rzg2l_cru_ip_format_to_fmt() (or something similar) and
> return a const struct rzg2l_cru_ip_format *. The caller can use the .bpp
> field.
>
OK, I'll introduce rzg2l_cru_ip_format_to_fmt().

> > +
> > +int rzg2l_cru_ip_index_to_pix_fmt(u32 index)
> > +{
> > +     if (index >=3D ARRAY_SIZE(rzg2l_cru_ip_formats))
> > +             return -EINVAL;
> > +
> > +     return rzg2l_cru_ip_formats[index].format;
>
> There's no guarantee the 4CC won't map to a negative 32-bit integer. I
> would return a onst struct rzg2l_cru_ip_format * from this function, and
> rename it accordingly. The call can then use the .format field.
>
OK, I'll introduce rzg2l_cru_ip_index_to_fmt().

> > +}
> > +
> >  struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_d=
ev *cru)
> >  {
> >       struct v4l2_subdev_state *state;
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/d=
rivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index de88c0fab961..014c0ff2721b 100644
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
> > @@ -328,17 +317,23 @@ static int rzg2l_cru_initialize_image_conv(struct=
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
> > +     if (!cru_ip_fmt)
> > +             return -EINVAL;
>
> I think you can drop this check, as the code is guaranteed to be valid.
>
Agreed, I will drop this check.

Cheers,
Prabhakar

