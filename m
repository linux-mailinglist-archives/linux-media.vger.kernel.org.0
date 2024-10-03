Return-Path: <linux-media+bounces-19073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C4B98F818
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 22:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A11721C20FB6
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 20:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722041B85DB;
	Thu,  3 Oct 2024 20:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="do7CiO0v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBF71B372C;
	Thu,  3 Oct 2024 20:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727987343; cv=none; b=tSV8tL220qInKwKI/9PJiKZ1+JxleH0SfckyPIhHPWrjlcVcos1OkxwdI+EB3JxRzhE60Zs//iCPv8DEJalpG36+dLYP+q+DA3vTtkJX20+eF4wvuk/wW3Cm03mMmWWoNe9mlkpmUQ/dx+W7SeptbliPvUoqJexINb9zz+RO5n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727987343; c=relaxed/simple;
	bh=ZjwtirPGxIShVnbmXwVlJ7STx79jGHSGNzOa+dVtG/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sr2x8Bjf/1IGGxT6UpI6qRivfLG9ZwdzgisxGBbNKv2eSfNrP7V4XU/PNZLrkW5Vx9c76GlWANZwbp6DZcJ6VVaERZYt+dtBTgNi+CrJRBpBShnWxNY9X/Ued5W8IGyn2d52jerQhpbEOPqyszSwx+WPTIe9+BUYK1q8U8pCHMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=do7CiO0v; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-84eb1deaf03so382842241.3;
        Thu, 03 Oct 2024 13:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727987341; x=1728592141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZY4Yz2sVXLM3aeDMDJjB8WJGa4cOVvOqWVPTEec4JE=;
        b=do7CiO0vSU200im8jzRK+QjBLpUcZmiZWuUnwJTkjkXYWOrpVclgYdc+4qZiMJXIB+
         Se5V/P8wV4QOcungcndrMZ5R0vkDJQHzFGqq5cnWoOKS9Os78UKhWaFw7KYcUdMXCy86
         U8QSt16F1nafJcRA26swAt1/N0iASvAp9bK2vNf+UpX+/VtQW6W2l4Q6V4BJ0rUtf3nw
         CYfAUnJLqt3hWIRY4nPAq7sjrL0oNLngL7qQ3vDN5fjD1SNiLNVLsynwMJQrHek6LxUK
         4ySGAyDL6hFZzyS0u+2JWNKU4dJh75KXWFYjPuxZYYdi/LLbSmmNw7B8FJl7OhK7Bx0X
         jsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727987341; x=1728592141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZY4Yz2sVXLM3aeDMDJjB8WJGa4cOVvOqWVPTEec4JE=;
        b=WAY1MdXd1Fq5l9zGKw0JiCnVOjSLC/hO7g+jKrPFQUSWgp0Kz7396/9rrD8Amxr9fA
         d2VcQrvFPZlq7I7JEKnbvwKRryxgt1k7pmziTH/5IYNiS2A+EHbEzrXHKHZKIqWx8oQc
         3q7Gia3WSdmwsl8Ib0EcOHdx6odkw94ywjBC9d2KojPuWhuqzsOPNffdl2fvvdiJlMDR
         hW+CeTcVKRnOFy4cNnTA7eFJiZFP/ZQYvbqlUyntOgxY50T6/J9HItICmI1PWWdz46Cs
         GnC41NxL3IubZykEqBUH5Bd3JCAvRCg20+gnjJJKSkf52/0PcgclOJMuvuGCPlhgmFE6
         SCyA==
X-Forwarded-Encrypted: i=1; AJvYcCV8drY1qINc6HnFBFYj+lebIki598BlBsX5C0RQDSLDMlFnB5tvy8WBYc3UCgVFvxh/9kdAxmCiuTu/0Vo=@vger.kernel.org, AJvYcCVMw6TQbvDFoACANa2B6was1dQ+gLWAOSOPSe4S0dU/BfafCjvzLem8MQXSt9Q4hwKS9i76qvLQL4T6utttT9C6wVs=@vger.kernel.org, AJvYcCXzTtXampn2Po6Yv64KJDTTZwygwdQxdyM/dG5EyN7LGKbg8Po/H6IVaE7FBDFLfwWj0beA2JESRofhG10=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Qk61cFmNz3Okm1HTtQtZiyVnkDKmYrOsulU+5CrFmo+aPcvK
	OD2hVcolYkiKnt+Gh+JgkU75CYvsP+EdCc+HlKBPZUe9o5dkeCqaKxO7CB/Asbjh+O1QLWCz416
	yssYZ1xstYXIzL73oQ5SVx9KOquA=
X-Google-Smtp-Source: AGHT+IEQ6r1uEXI+gHapJ5vf4OymrLw4YwkywLH0mAJDlzyox7oYDgtEAYSxv70b16kJ2DP5e4ccLvrM2Y56ncdSD58=
X-Received: by 2002:a05:6122:91d:b0:50a:318:b39d with SMTP id
 71dfb90a1353d-50c8543a748mr758316e0c.2.1727987341081; Thu, 03 Oct 2024
 13:29:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241001140919.206139-11-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241003142549.GC5468@pendragon.ideasonboard.com>
In-Reply-To: <20241003142549.GC5468@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 3 Oct 2024 21:28:35 +0100
Message-ID: <CA+V-a8vT783X41nFWrnQmhn8v1ZHMrYsKxr0Mo_0MRO0Fv2ayQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/17] media: rzg2l-cru: Simplify handling of supported formats
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

On Thu, Oct 3, 2024 at 3:25=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> Just one minor comment below.
>
Missed Reviewed-by?

> On Tue, Oct 01, 2024 at 03:09:12PM +0100, Prabhakar wrote:
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
> >
> > Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.c=
om>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3
> > - Updated subject line and commit message
> > - Implemented rzg2l_cru_ip_format_to_fmt() and rzg2l_cru_ip_index_to_fm=
t()
> > - Dropped checking fmt in rzg2l_cru_initialize_image_conv()
> >
> > v1->v2
> > - New patch
> > ---
> >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    | 20 +++++-
> >  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 35 ++++++++--
> >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 67 ++++++-------------
> >  3 files changed, 68 insertions(+), 54 deletions(-)
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
> > index 7b006a0bfaae..12aac9d6cb4b 100644
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
> > +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 forma=
t)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++)
> > +             if (rzg2l_cru_ip_formats[i].format =3D=3D format)
> > +                     return &rzg2l_cru_ip_formats[i];
>
>         for (i =3D 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++) {
>                 if (rzg2l_cru_ip_formats[i].format =3D=3D format)
>                         return &rzg2l_cru_ip_formats[i];
>         }
>
> Sakari can probably handle this when applying the series to his tree.
>
As there will be v4 anyway for fixing the link_validate(), I'll
address it for v4.

Cheers,
Prabhakar

