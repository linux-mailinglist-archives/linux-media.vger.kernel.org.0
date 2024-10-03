Return-Path: <linux-media+bounces-19071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AFD98F7FA
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 22:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6548D1F22D0C
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 20:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5365A1ABEDF;
	Thu,  3 Oct 2024 20:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsP0PqjU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F0732C8B;
	Thu,  3 Oct 2024 20:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727986885; cv=none; b=WCWbw5NFNV1v66cDEDTBJyFIQO54Qitf5UTzUSEtzbTSXTvXByEAiZTOPCc8DVrENCbv2C3iffi+x47NedlqhUWXnG5g8QN/XUmVlu50gTket/FAN/tisq20Wrw5vYBjIISKXgC92B+3VYzz5RKTCfGCAIYjs3KJcQCTlSClY5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727986885; c=relaxed/simple;
	bh=uha3XE2BYfnmQ/ilmOdeMxc9IESAwInzAk/KwfhItmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pCE7pXJIX51tDbxR2VQsxk+C3pPhUuiMlEv3UdNu91tfdLBbVBqqe9PU6EvG6KTs1v7VTNafI4P5rVKXhXSiVdVh2OxmPRFIZh66Xfxyaqi0aPiDcEXJ/WfUyIVl+2hbEXf3cUUzz1KQnFi58gZp2m/WR8mJT5q1hsK63YFQ4yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsP0PqjU; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-50923780607so394273e0c.1;
        Thu, 03 Oct 2024 13:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727986883; x=1728591683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9k3Y3mrmC4VL+EH3crRKhaTAWM/OMPXFp0fM6bUJocY=;
        b=MsP0PqjUBDd8Gh2616U414NrJndVl/qI0GW+cOLmu0DTRW/lVioOIaGGI5hSaaLZzF
         a8E/fK7ksaLgYJ+1OTYksWsLiC/ewaUKHXFyXt+tXtmAEqylpoBFr98PySRCiJsaK47n
         RBf9nZ/bi6hkSK+l7velYqsmHRowAxylN0Wrphg7zhR1j7aZdCiwiDAkGNlKRF8HhwnN
         L2Zs3iKR/pL67ZnOoL7oH8CvG327Ws1Qed7qTRrThC1NgH//D6rF+gjawJXTkL8/hHjZ
         TbTS+Z6gp1WS/2GlN5wY454hNAs9bol4z06da48AAy2NVh7y2Q7z6FcwsFHnpRrcSQGc
         753g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727986883; x=1728591683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9k3Y3mrmC4VL+EH3crRKhaTAWM/OMPXFp0fM6bUJocY=;
        b=kDm6yDe0OTICu0Xf1pLX3YiSw6nQbN6DnprooaK804dQBOHszSLY4HK5PKvSC+SL3N
         tWy8o9B50bnEhFjNydxqQqrlvLlRgr03CuJQQlUqHdsWCJ2O5kUsyAb51eCuRLlXodXc
         ZMrF8Robzq4O1lmuSK/SR/BdBRISbo2JhpKShbXUimgeK5NoZsNoxUkAXQBsKHQlI8L8
         jFR6f0ezyka4Ffw81Ud8U7rHc5a6p1RYY7S12++BAgnc8REcdzJge9qy6W7sV4dnY4Wi
         K49UMsuh/64TLmumQBrvqKHMgnpaC23WVe1shRSC9DDhe11l/yj+oF0a4JOekMg5KX00
         G9Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUCuX81hDMk6eyecxvSld9WOFRDq0YhRUTP01/DmqQEC5CdTZUfARhLLXNmu4MZTcN5sH3k16c+Bhs1TrA=@vger.kernel.org, AJvYcCWx90lCGXuc0NVwa7KLkS+TZ0R7iypBTyMmLNWgu75wImC4lF5rJhjskwrZBSOc+SmOZHleHq8YFQzeaAw=@vger.kernel.org, AJvYcCXkpNA94rmXHJnLDaXZT2TezSVPtue4hNpeaA0p6fRNfGA6B0jnkXPdMaX4KUJVL/vU70LRALPEWp+/bjNJcySnLvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwICZ2Roczj5GrvuFpWIv3Upxsi3/bhGgZRdTqoC4O+IPhn/Mw3
	nZKrjqO1Ji8OcGmsBfw2R4tH+tYekuaPjCIA3Px7pNX/z7IsfIe6K+IaD4vNziouy7LE8jFxiAV
	HkZIpVANUz1qK/6O8qL/adegFQKc=
X-Google-Smtp-Source: AGHT+IHJjBWBj2zxKHpNfEVfVWoNgHb5xnxK5gJlkPcIFT4C9TpoT8x6qEY1c0NDwKFsHLbB6/YgeOZIqzE4X/1v4hQ=
X-Received: by 2002:a05:6122:180d:b0:4fc:e3c2:2c71 with SMTP id
 71dfb90a1353d-50c85444ac7mr671887e0c.2.1727986882797; Thu, 03 Oct 2024
 13:21:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241001140919.206139-16-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241003143437.GD5468@pendragon.ideasonboard.com>
In-Reply-To: <20241003143437.GD5468@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 3 Oct 2024 21:20:56 +0100
Message-ID: <CA+V-a8vCpqH+EFoRSox3PwVfz_koG4wddRdW0KL8Fcgq3OyGyw@mail.gmail.com>
Subject: Re: [PATCH v3 15/17] media: rzg2l-cru: Refactor ICnDMR register configuration
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

On Thu, Oct 3, 2024 at 3:34=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Oct 01, 2024 at 03:09:17PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Refactor the ICnDMR register configuration in
> > `rzg2l_cru_initialize_image_conv()` by adding a new member `icndmr` in =
the
> > `rzg2l_cru_ip_format` structure.
> >
> > Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.c=
om>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3
> > - Updated subject line and commit message
> > - Re-used rzg2l_cru_ip_format_to_fmt() to fetch icndmr details
> > - Collected RB tag
> >
> > v1->v2
> > - New patch
> > ---
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  4 ++++
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |  1 +
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 10 ++++------
> >  3 files changed, 9 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > index 39296a59b3da..51206373b7fe 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > @@ -31,6 +31,8 @@
> >  #define RZG2L_CRU_MIN_INPUT_HEIGHT   240
> >  #define RZG2L_CRU_MAX_INPUT_HEIGHT   4095
> >
> > +#define ICnDMR_YCMODE_UYVY           (1 << 4)
> > +
> >  enum rzg2l_csi2_pads {
> >       RZG2L_CRU_IP_SINK =3D 0,
> >       RZG2L_CRU_IP_SOURCE,
> > @@ -68,12 +70,14 @@ struct rzg2l_cru_ip {
> >   * @format: 4CC format identifier (V4L2_PIX_FMT_*)
> >   * @datatype: MIPI CSI2 data type
> >   * @bpp: bytes per pixel
> > + * @icndmr: ICnDMR register value
> >   */
> >  struct rzg2l_cru_ip_format {
> >       u32 code;
> >       u32 format;
> >       u32 datatype;
> >       u8 bpp;
> > +     u32 icndmr;
> >  };
> >
> >  /**
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/driv=
ers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > index 6ce077ab42e2..f14ac949cc64 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > @@ -17,6 +17,7 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_=
formats[] =3D {
> >               .format =3D V4L2_PIX_FMT_UYVY,
> >               .datatype =3D MIPI_CSI2_DT_YUV422_8B,
> >               .bpp =3D 2,
> > +             .icndmr =3D ICnDMR_YCMODE_UYVY,
> >       },
> >  };
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/d=
rivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index c6c82b9b130a..c3d10b001b7c 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -88,7 +88,6 @@
> >
> >  /* CRU Data Output Mode Register */
> >  #define ICnDMR                               0x26c
> > -#define ICnDMR_YCMODE_UYVY           (1 << 4)
> >
> >  #define RZG2L_TIMEOUT_MS             100
> >  #define RZG2L_RETRIES                        10
> > @@ -278,6 +277,7 @@ static int rzg2l_cru_initialize_image_conv(struct r=
zg2l_cru_dev *cru,
> >                                          u8 csi_vc)
> >  {
> >       const struct v4l2_format_info *src_finfo, *dst_finfo;
> > +     const struct rzg2l_cru_ip_format *cru_video_fmt;
> >       const struct rzg2l_cru_ip_format *cru_ip_fmt;
> >       u32 icndmr;
> >
> > @@ -288,15 +288,13 @@ static int rzg2l_cru_initialize_image_conv(struct=
 rzg2l_cru_dev *cru,
> >       dst_finfo =3D v4l2_format_info(cru->format.pixelformat);
> >
> >       /* Output format */
> > -     switch (cru->format.pixelformat) {
> > -     case V4L2_PIX_FMT_UYVY:
> > -             icndmr =3D ICnDMR_YCMODE_UYVY;
> > -             break;
> > -     default:
> > +     cru_video_fmt =3D rzg2l_cru_ip_format_to_fmt(cru->format.pixelfor=
mat);
> > +     if (!cru_video_fmt) {
> >               dev_err(cru->dev, "Invalid pixelformat (0x%x)\n",
> >                       cru->format.pixelformat);
> >               return -EINVAL;
> >       }
> > +     icndmr =3D cru_video_fmt->icndmr;
>
> I think you can drop the icndmr local variable and write below
>
>         /* Set output data format */
>         rzg2l_cru_write(cru, ICnDMR, cru_video_fmt->icndmr);
>
OK, I'll get rid of the local var.

Cheers,
Prabhakar

> With this,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> >
> >       /* If input and output use same colorspace, do bypass mode */
> >       if (v4l2_is_format_yuv(src_finfo) && v4l2_is_format_yuv(dst_finfo=
))
>
> --
> Regards,
>
> Laurent Pinchart

