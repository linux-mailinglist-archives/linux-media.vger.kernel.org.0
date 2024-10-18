Return-Path: <linux-media+bounces-19858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C019A3E9E
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 14:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C03A3B210CA
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 12:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DDD4207A;
	Fri, 18 Oct 2024 12:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hO0bFFQk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F37E8F6B;
	Fri, 18 Oct 2024 12:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729255277; cv=none; b=VzKnbGuk90+86TL02BwEs8I1yLKkvuO8dUET4GKmCdKjEXAmgORjh1qmFc/HFo9DSCyaxWbvucM/JKQmBmcwvxh6RrKD9wJJ5sFjD76sR5zg/b5ml1N9vW5jwHCs4CKtlSOulupcyFcjs6KPlyx+8KY/CvUt9/DwEWsOXfZOamQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729255277; c=relaxed/simple;
	bh=MdE/vlwuaIy+l1DVfCSNRGdPx+i97TVjXEXo4j8dxz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S2k8iPFpVC5sTqwT3wsqmao3/isAeooZgYkHwDlNLuTI0tsbBs9mMVnq6pdADKvGGbX5+XW1XNLbu6tUOYyPwCbm8165uBML6ezuGkLPk8LS7FftJ/mZCiAfBWXRdIlC9i21kQq8nqjxMlaGHB7609gpSHKe+3zFSJE3ZPatrS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hO0bFFQk; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-50d2d300718so585713e0c.1;
        Fri, 18 Oct 2024 05:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729255275; x=1729860075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+l+LdwuWPPQPyQbdGsPd0DvVg4iTYvTYWs9TNNMBdzQ=;
        b=hO0bFFQk9Afb3EmbqRjfr6g50iqzPhfGihm8mGXR+PbjmoCTQuYbxze8JlazxDsIID
         6MVdBVoDz3zpCleHTErO2skHEww8Ama3kKPN2iKa0pB6sOOZlC5svBkM27r+eC83Nt/X
         AMSed+4DlR/0jRD36HXO4/P6p7fYQFcMuj7yc3wwIWImIqT9M627PGwyvVpW165hyJyu
         h42C43sBkC3i+D2/upoLKrEeOBtQHxTt9/btt9hQO50vzZEoHWhrXFRVR7xzomgE117L
         mmJ+EoY+OBMwfsQBCwtALeapiDhnF4qKpEmZAXN3DJArzVRkM0czpVdjPSapeJjzCK/b
         LZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729255275; x=1729860075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+l+LdwuWPPQPyQbdGsPd0DvVg4iTYvTYWs9TNNMBdzQ=;
        b=hZKHAP9yZ7tNzX88CqHu1uQC+mma00IbCFSxRoX/yIyupA1yZXLJo8mDUuSJNqTTT0
         xi9BL5GaD3pD19V/glk3D8FfL/xv/7M4nY9VB4iGB7dSQoLb5MLrUZr7fmnF3SPv1fQj
         h0TIneZNmUGcjLdR1avHJOaXji8y+/oBuoVTGATWdB3hlWS/pkTQ/qob5lOuhv3a1enN
         km8p1ocUp7ZYDuvPCr3nGZzHsRmu4uusjpsaCMz26qDWWA1JjYsN7+z89DaLC6gmRv3P
         qKXUm6520qtJD1Bl9lRi56wizNnb2SghGqbskIgQOd/py4od0LNDWEhxfF0IFLLsVdCt
         bRbw==
X-Forwarded-Encrypted: i=1; AJvYcCVMiVruJtBsOn9z64SEtYGHMoG85s6RRZk7VOgzs+aGZoHdKWRnZdstZvOtbDdLSBEpLAqyyefgSY+c19I=@vger.kernel.org, AJvYcCVh/tyyMgeANEzv32Q+v99YT1iTcDucZfOcAV9twsQt2ZKKYXu6TxsRUEe6WdUQvXDhNrUpz8mkqwLzovWP/Q4zZko=@vger.kernel.org, AJvYcCXX2jNdDzeuLVIdo4PNqSGcBXrbWrvcZ426GU88Jx6TEsv/zXdoS94vBcMGGnCUi7KkGn22bFmkaVFClWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4r/zbZK28w5YCnlZAGMW2byFi2QcloIYW0bRKj4Pkngs5VsC3
	3fLJHdfhR/adERfAq4gNA2ula7ZKi62pQntrzoyL3wH4nqA9ANMjWKKiz7k0R6+L/HlB9OhE5Ta
	9B7qA/mGzhv+Nis6x8+DzkH63jsE=
X-Google-Smtp-Source: AGHT+IES5LVfGLX428NF36lgQkwm5gmSds6SXoQbN8pEfFwBt2PslW0w2y0YaQTTE0RFslwpeT/TM9xcqmqha+Hwya4=
X-Received: by 2002:a05:6122:1da6:b0:507:81f0:f952 with SMTP id
 71dfb90a1353d-50dda35f9d8mr1384356e0c.9.1729255275033; Fri, 18 Oct 2024
 05:41:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241011173052.1088341-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241015103317.GJ5682@pendragon.ideasonboard.com> <CA+V-a8tRDhDBFZsMEyxPTbW0juZMpAcJ=bj4rA3Nbsku8y4PxA@mail.gmail.com>
 <20241018122611.GN30496@pendragon.ideasonboard.com>
In-Reply-To: <20241018122611.GN30496@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 18 Oct 2024 13:40:48 +0100
Message-ID: <CA+V-a8uXrO8iPxhQEKb+HtVqXctQS5O4NAfFTr2Cfrci9Qd_UQ@mail.gmail.com>
Subject: Re: [PATCH v5 15/22] media: rzg2l-cru: Make use of v4l2_format_info() helpers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Fri, Oct 18, 2024 at 1:26=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Oct 18, 2024 at 12:45:36PM +0100, Lad, Prabhakar wrote:
> > On Tue, Oct 15, 2024 at 11:33=E2=80=AFAM Laurent Pinchart wrote:
> > > On Fri, Oct 11, 2024 at 06:30:45PM +0100, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Make use of v4l2_format_info() helpers to determine the input and
> > > > output formats.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 22 ++++++---------=
----
> > > >  1 file changed, 7 insertions(+), 15 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c=
 b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > index 8932fab7c656..0cc69a7440bf 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > @@ -300,21 +300,12 @@ static void rzg2l_cru_initialize_axi(struct r=
zg2l_cru_dev *cru)
> > > >       rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
> > > >  }
> > > >
> > > > -static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *=
input_is_yuv,
> > > > +static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> > > >                                const struct rzg2l_cru_ip_format *ip=
_fmt,
> > > >                                u8 csi_vc)
> > > >  {
> > > >       u32 icnmc =3D ICnMC_INF(ip_fmt->datatype);
> > > >
> > > > -     switch (ip_fmt->code) {
> > > > -     case MEDIA_BUS_FMT_UYVY8_1X16:
> > > > -             *input_is_yuv =3D true;
> > > > -             break;
> > > > -     default:
> > > > -             *input_is_yuv =3D false;
> > > > -             break;
> > > > -     }
> > > > -
> > > >       icnmc |=3D (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
> > > >
> > > >       /* Set virtual channel CSI2 */
> > > > @@ -327,19 +318,17 @@ static int rzg2l_cru_initialize_image_conv(st=
ruct rzg2l_cru_dev *cru,
> > > >                                          struct v4l2_mbus_framefmt =
*ip_sd_fmt,
> > > >                                          u8 csi_vc)
> > > >  {
> > > > +     const struct v4l2_format_info *src_finfo, *dst_finfo;
> > > >       const struct rzg2l_cru_ip_format *cru_ip_fmt;
> > > > -     bool output_is_yuv =3D false;
> > > > -     bool input_is_yuv =3D false;
> > > >       u32 icndmr;
> > > >
> > > >       cru_ip_fmt =3D rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
> > > > -     rzg2l_cru_csi2_setup(cru, &input_is_yuv, cru_ip_fmt, csi_vc);
> > > > +     rzg2l_cru_csi2_setup(cru, cru_ip_fmt, csi_vc);
> > > >
> > > >       /* Output format */
> > > >       switch (cru->format.pixelformat) {
> > > >       case V4L2_PIX_FMT_UYVY:
> > > >               icndmr =3D ICnDMR_YCMODE_UYVY;
> > > > -             output_is_yuv =3D true;
> > > >               break;
> > > >       default:
> > > >               dev_err(cru->dev, "Invalid pixelformat (0x%x)\n",
> > > > @@ -347,8 +336,11 @@ static int rzg2l_cru_initialize_image_conv(str=
uct rzg2l_cru_dev *cru,
> > > >               return -EINVAL;
> > > >       }
> > > >
> > > > +     src_finfo =3D v4l2_format_info(cru_ip_fmt->format);
> > > > +     dst_finfo =3D v4l2_format_info(cru->format.pixelformat);
> > >
> > > It would be a bit more efficient to add a yuv boolean field to the
> > > rzg2l_cru_ip_format structure, as you already have looked up cru_ip_f=
mt
> > > for the IP subdev format.
> >
> > I will consider this change, when adding support for the RZ/V2H SoC,
> > hope that's OK for you.
>
> It's not a blocker, it can be done on top indeed. If you end up
> submitting a v6 you could add a patch on top already, but otherwise
> later is fine too.
>
I was intending to send a v6 anyway with the updated commit messages,
so I will add a new patch on top.

Cheers,
Prabhakar

