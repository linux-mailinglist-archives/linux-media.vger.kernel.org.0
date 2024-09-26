Return-Path: <linux-media+bounces-18608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CFC98711D
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 12:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9949FB2128D
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 10:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EC21AC8AB;
	Thu, 26 Sep 2024 10:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lygcrPFK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397805647F;
	Thu, 26 Sep 2024 10:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727345807; cv=none; b=NI8IlGK6ucX4wB9zvEtIO9L1TjhSlWF4sKKt/eJsQWi+Eq0TfDJZt2+oCgdXXZTKb4qV70WgcWF73LmZ7ukmqWB6mF80xPskgYZWtu6hdg1PFi4OaY7/STqh4dYZRDQYngHs/FIkjThHhjr9tmmDubJyT2drDiNwaSooFLSN40k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727345807; c=relaxed/simple;
	bh=tpvaoQfbFT+eHDEpIsf1F1wUwNkqOvgEpvT10S4K0jY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNG6bsG6wASimMRs4MmW87gMfVwcsQd8kPZhVVBayMFBis4f+f9R4GvhSzBPEEZR3F5FUDxHYWtwONSzwnPBLZSAZ8ZE1BQHQv67yBrrYpW5nbbPnDlNpc6zyGKRcgiAGAOzvFgg5hAKCur/zZuCW3tLNb45oFstlNFd4QjCC9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lygcrPFK; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-500fcf0b32fso175898e0c.1;
        Thu, 26 Sep 2024 03:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727345805; x=1727950605; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/i5t2uxUT8cFIitTXnab6lbLA8GH+FQPNpxPleTeFc=;
        b=lygcrPFKMnHPv4gWLGncpYY9weV57LJ/pnzMGISkRvK3nllHen/Y6OBE3qjJTHNJBR
         uMa0eyJ42JGEdkA17UJ1nHOllrhW1w/YELQgvKhPUs5aTpNXr/vezp3o4G0Bk0MNKwb1
         cqLyLdeNlYF4qThTSSbafbwrD4mCUNPD8+Yvh/VyXQvUiUQkE9TnIjU6ZuEoHtqn6GId
         sPcQI6ZvScYLgtsjcz//7ZzgDcmgsMw6IGiI8E++GWrK3sYwqM1qUu6cmHBVLhE32OWe
         Jm1kgInHWswAQ/tBZdDfRl4e13yvF43gHDL98xAh0iFAPewIBYdPg4IOiyrISxOAqTMC
         1g0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727345805; x=1727950605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/i5t2uxUT8cFIitTXnab6lbLA8GH+FQPNpxPleTeFc=;
        b=kY7SPpygqU4wLTwmPS/YA2++0QNegsmAJgKGGhUgWoUU5oejGLcxjjz7vwtM6+Rvw1
         jaquI+22d+7vnoaLCFy7OMd+fS6ZFNgtYDFhFhwKyzWpV6u2O20yTBbJOYzO75WEfVML
         5SJBz43GvQME7EeHNms9I/9apAWXrbAMLPn05KwdWOxt67FPW/UyiMbOyFYqW9O0h36C
         nk26PfcCbUcLM+bqbIzAyK2Cn/KLwwswr3/rOf+7ikIM4WtVEuCfZVaRu83rynt8AAn8
         ip+c2fYlCj9hw8xA5kADhcAJx2kZwkxxGD8qoMg6477JhmXZUIbK0KPb0xOJ73LiBjAV
         U7Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXG3PaSeyPDLdxE1dgDNqoQGblaoahSNDa/89zWe/lGtbBM4ZK96RgpTkvMbK7dIdXZQqQvP3e+HF8QL7g=@vger.kernel.org, AJvYcCXnviHjibi71TH5dnqH6w2RfyHcaUGxZSKIsOoucumWwZazv8g3QBl5cNiGnHp86vm6BXU0Uw6K1fkaB1U=@vger.kernel.org, AJvYcCXu38eV9JxJcHpL4oSTLc9auX5+HHX341As7XYllNKxzSxYs4aj5u+rN5YLxiTUAGwyzQAhNuv4/mTnJHJPFdUvG/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqggP5xoe55n1fjPBnkN5A3gYk3sqOuTtHO0JB0vRccJIrYIXN
	Bv8OFGZwMRDhrKclbCAztRhbT+E+vfpB5/cCFJYfh+uANWS/jafZOMPDqS3/697Vot4UukQzyHB
	gbFxrvJMPkCVJAm8eMuDN673TwFU=
X-Google-Smtp-Source: AGHT+IGHBOsTmgPkbv7uo3NZBAXRZWhYPUtM1em9SrEVWULUxo5+IdE2T+tH6UpQv7P+gZJ4Kf415Zl4FWpEv+sdSe4=
X-Received: by 2002:a05:6122:3c41:b0:4fe:bce9:8f4f with SMTP id
 71dfb90a1353d-505c20706a7mr4586255e0c.9.1727345804699; Thu, 26 Sep 2024
 03:16:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-12-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240925162619.GB27666@pendragon.ideasonboard.com>
In-Reply-To: <20240925162619.GB27666@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 26 Sep 2024 11:16:18 +0100
Message-ID: <CA+V-a8vO2sP9--owHdZDiwNhtw=Oie0sjPf096BzP7CD6WWYBA@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] media: i2c: ov5645: Report streams using frame descriptors
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Wed, Sep 25, 2024 at 5:26=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Tue, Sep 10, 2024 at 06:06:10PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Implement the .get_frame_desc() subdev operation to report information
> > about streams to the connected CSI-2 receiver. This is required to let
> > the CSI-2 receiver driver know about virtual channels and data types fo=
r
> > each stream.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/i2c/ov5645.c | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > index 7f1133292ffc..c24eb6e7a7b5 100644
> > --- a/drivers/media/i2c/ov5645.c
> > +++ b/drivers/media/i2c/ov5645.c
> > @@ -28,6 +28,7 @@
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/slab.h>
> >  #include <linux/types.h>
> > +#include <media/mipi-csi2.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-event.h>
> >  #include <media/v4l2-fwnode.h>
> > @@ -829,6 +830,32 @@ static const struct v4l2_ctrl_ops ov5645_ctrl_ops =
=3D {
> >       .s_ctrl =3D ov5645_s_ctrl,
> >  };
> >
> > +static int ov5645_get_frame_desc(struct v4l2_subdev *sd, unsigned int =
pad,
> > +                              struct v4l2_mbus_frame_desc *fd)
> > +{
> > +     const struct v4l2_mbus_framefmt *fmt;
> > +     struct v4l2_subdev_state *state;
> > +
> > +     if (pad !=3D OV5645_PAD_SOURCE)
> > +             return -EINVAL;
> > +
> > +     state =3D v4l2_subdev_lock_and_get_active_state(sd);
> > +     fmt =3D v4l2_subdev_state_get_format(state, OV5645_PAD_SOURCE, 0)=
;
> > +     v4l2_subdev_unlock_state(state);
>
> Once you unlock the state fmt could change, so you should instead do
>
>         state =3D v4l2_subdev_lock_and_get_active_state(sd);
>         code =3D v4l2_subdev_state_get_format(state, OV5645_PAD_SOURCE, 0=
)->code;
>         v4l2_subdev_unlock_state(state);
>
Ok, I will update the above.

Cheers,
Prabhakar

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> > +
> > +     fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> > +     fd->num_entries =3D 1;
> > +
> > +     memset(fd->entry, 0, sizeof(fd->entry));
> > +
> > +     fd->entry[0].pixelcode =3D fmt->code;
> > +     fd->entry[0].stream =3D 0;
> > +     fd->entry[0].bus.csi2.vc =3D 0;
> > +     fd->entry[0].bus.csi2.dt =3D MIPI_CSI2_DT_YUV422_8B;
> > +
> > +     return 0;
> > +}
> > +
> >  static int ov5645_enum_mbus_code(struct v4l2_subdev *sd,
> >                                struct v4l2_subdev_state *sd_state,
> >                                struct v4l2_subdev_mbus_code_enum *code)
> > @@ -1062,6 +1089,7 @@ static const struct v4l2_subdev_video_ops ov5645_=
video_ops =3D {
> >  };
> >
> >  static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops =3D {
> > +     .get_frame_desc =3D ov5645_get_frame_desc,
> >       .enum_mbus_code =3D ov5645_enum_mbus_code,
> >       .enum_frame_size =3D ov5645_enum_frame_size,
> >       .get_fmt =3D v4l2_subdev_get_fmt,
>
> --
> Regards,
>
> Laurent Pinchart

