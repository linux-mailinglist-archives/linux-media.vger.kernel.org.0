Return-Path: <linux-media+bounces-19145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DDA992983
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 12:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 707D6284B21
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 10:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FAC51D1302;
	Mon,  7 Oct 2024 10:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y96zapP3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077181C878E;
	Mon,  7 Oct 2024 10:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728298146; cv=none; b=tdbXMMJBvmwkNjIS8MQG4GHeAjW8/7gTr/8RhO/PK+xUs7LXKZwYaof56PxXosR9wKUweKR06giXKkDG6O+nryFfr8ZW+DoxYaqi8cxhDx/Xjw71/gV3LgzRHR+I0K6JQOZxYWCD0Rviq3MrsEv2fT84dSGQ71vK6itnBrIRll4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728298146; c=relaxed/simple;
	bh=GiVGZEa2IQeWE2UVxCtpQJDbRZFjZHoVO6B1KXrrr2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Se7U/UpM7/teOTVzp4kodm8kE/y2I0eNBSFYS6hAlOVqnSP3KgjIV+RB1a348d0rTvNPSp6Zrzj72hzf4zGW6PffIs3zHt6JkF6No/3mmvcJ+CW6SNE3UVz+/v5UUZz/kJ7nAZfA5FjvUp73H5Qhib3JG/q9so1aoi80WEC9KlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y96zapP3; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-50c9fb5751cso585354e0c.0;
        Mon, 07 Oct 2024 03:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728298144; x=1728902944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRtlhxa5HpDdgMOpevsoEPxJRhvi+Dx1yjhg3IEIWbE=;
        b=Y96zapP3Grm7qt4BHnk5U4h7Hrt2p+r4tHDIpAYwQioLMsHC6uR1HHC3A7pAQiUGzd
         xE/Ekofc19SF7c0rseOdzLwuraIzT4oAG3eyO5ygFEzmzTy+FzY3TX0kjoRTHfE3xUkF
         S8EPpY2/RsBcmarW8N2VeEWnVIspkwo7xJS0AzlREy1Z77SS+F+2WVGO/r49FURv7621
         XRm1XgSLLir74E9PAq/0tDsoIkFoUA2UZiUplEhKG7TI7Hm35E+VE8eeWuQvysh1xHEo
         UvnXm6TI0k4abofv7RN/f60VRDIx7FJO0SMTLaJnijGpLIoFlJiNeer6YnwR+JP/lxIx
         Qtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728298144; x=1728902944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRtlhxa5HpDdgMOpevsoEPxJRhvi+Dx1yjhg3IEIWbE=;
        b=tjMAYrAW28gKZiQjg01NWy240sEgU5dGICW87CGV290AecL1A99NXz+bYlw7LnlczY
         uoEEn0imTuWOv/X0yD7pLgZgVD2JPlEP/kGFEifTrHA4TgCuywzb6jacqorVmjWUsCqk
         DyO/Q6NZ5uZbjpiMdIUF8BqXxbkYg16lTKGoqk7n+D4l+gu5hpRcNWX0pRnlwNgZDDyE
         xz+L8VWAU88mHprWXwFDAeUvu3HUHppksWdmsfes3moq149K2ix1Bn0FDPLZlamAvlm+
         4svoXr/Q24O9RfrxMmXKnMMH6HAfDOlpscF4C8urNKdJlf8fQPzRkks+H6NPTu4mt74f
         9ktA==
X-Forwarded-Encrypted: i=1; AJvYcCUh0hw8xu6x98osPREtOImR7k9fY+hLP+GNDEvKB/LjMS0mVaY6h8YGCLZ0QETdV+dVjuLB86Tkf1BGo/E=@vger.kernel.org, AJvYcCVw0j7+SR9pkvrwYR/q+jP2og6zYTsu0qwR2Z8KJYH/xz9r4JStJPwHlIRGCnhXd6vm7iEKDW9qZQwxKAqze8U8TyA=@vger.kernel.org, AJvYcCWSRDgq4si2z7ic4vHfwXie6BGI9xoL6YTKQgqsXKf57p9sttVn8k07phy1WofjZYMM8dotaNS6trSxVmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqkZNe6qBx80nlw9id3W4fAa+4Ko5r9Pdwcq4fuX58jxoJ/QjA
	5cO+pB4p2C0SnizZmNB2M39eSP46dniAhIJbtVxOyV9AklWEbpXz1+qw85EgFgNcJhzNEEswZ4p
	8n89uQmew4t1jRycLE9pu6fEL6zI=
X-Google-Smtp-Source: AGHT+IHehaPUBSxW//F/OgBrXY4lNPZ//6JPmW1b2lYfQQBZIG9PFAOF9kmMe64JteLU4XtQdwAZmR8wIXWjXJTsyJs=
X-Received: by 2002:a05:6122:1816:b0:50a:7044:7b2a with SMTP id
 71dfb90a1353d-50c8548f7admr8089516e0c.4.1728298143714; Mon, 07 Oct 2024
 03:49:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241001140919.206139-14-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241003145112.GE5468@pendragon.ideasonboard.com>
In-Reply-To: <20241003145112.GE5468@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 11:48:37 +0100
Message-ID: <CA+V-a8teWvx++_dFFT_H156VVHwgKKcdGB71i9MBs0mDAdmvVQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/17] media: rzg2l-cru: video: Implement
 .link_validate() callback
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

On Thu, Oct 3, 2024 at 3:51=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Tue, Oct 01, 2024 at 03:09:15PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Implement the `.link_validate()` callback for the video node and move t=
he
> > format checking into this function. This change allows the removal of
> > `rzg2l_cru_mc_validate_format()`.
> >
> > Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.c=
om>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3
> > - New patch
> > ---
> >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 99 ++++++++++---------
> >  1 file changed, 55 insertions(+), 44 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/d=
rivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index ceb9012c9d70..c6c82b9b130a 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -189,46 +189,6 @@ static void rzg2l_cru_buffer_queue(struct vb2_buff=
er *vb)
> >       spin_unlock_irqrestore(&cru->qlock, flags);
> >  }
> >
> > -static int rzg2l_cru_mc_validate_format(struct rzg2l_cru_dev *cru,
> > -                                     struct v4l2_subdev *sd,
> > -                                     struct media_pad *pad)
> > -{
> > -     struct v4l2_subdev_format fmt =3D {
> > -             .which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> > -     };
> > -
> > -     fmt.pad =3D pad->index;
> > -     if (v4l2_subdev_call_state_active(sd, pad, get_fmt, &fmt))
> > -             return -EPIPE;
> > -
> > -     switch (fmt.format.code) {
> > -     case MEDIA_BUS_FMT_UYVY8_1X16:
> > -             break;
> > -     default:
> > -             return -EPIPE;
> > -     }
> > -
> > -     switch (fmt.format.field) {
> > -     case V4L2_FIELD_TOP:
> > -     case V4L2_FIELD_BOTTOM:
> > -     case V4L2_FIELD_NONE:
> > -     case V4L2_FIELD_INTERLACED_TB:
> > -     case V4L2_FIELD_INTERLACED_BT:
> > -     case V4L2_FIELD_INTERLACED:
> > -     case V4L2_FIELD_SEQ_TB:
> > -     case V4L2_FIELD_SEQ_BT:
> > -             break;
> > -     default:
> > -             return -EPIPE;
> > -     }
> > -
> > -     if (fmt.format.width !=3D cru->format.width ||
> > -         fmt.format.height !=3D cru->format.height)
> > -             return -EPIPE;
> > -
> > -     return 0;
> > -}
> > -
> >  static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
> >                                   int slot, dma_addr_t addr)
> >  {
> > @@ -531,10 +491,6 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_d=
ev *cru, int on)
> >               return stream_off_ret;
> >       }
> >
> > -     ret =3D rzg2l_cru_mc_validate_format(cru, sd, pad);
> > -     if (ret)
> > -             return ret;
> > -
> >       pipe =3D media_entity_pipeline(&sd->entity) ? : &cru->vdev.pipe;
> >       ret =3D video_device_pipeline_start(&cru->vdev, pipe);
> >       if (ret)
> > @@ -995,6 +951,60 @@ static const struct v4l2_file_operations rzg2l_cru=
_fops =3D {
> >       .read           =3D vb2_fop_read,
> >  };
> >
> > +/* -------------------------------------------------------------------=
----------
> > + * Media entity operations
> > + */
> > +
> > +static int rzg2l_cru_video_link_validate(struct media_link *link)
> > +{
> > +     struct v4l2_subdev_format fmt =3D {
> > +             .which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> > +     };
> > +     struct v4l2_subdev *subdev;
> > +     struct media_entity *entity;
> > +     struct rzg2l_cru_dev *cru;
> > +     struct media_pad *remote;
> > +     int ret;
> > +
> > +     entity =3D link->sink->entity;
> > +     remote =3D link->source;
> > +
> > +     subdev =3D media_entity_to_v4l2_subdev(remote->entity);
> > +     fmt.pad =3D remote->index;
> > +     ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
> > +     if (ret < 0)
> > +             return ret =3D=3D -ENOIOCTLCMD ? -EINVAL : ret;
> > +
> > +     if (!rzg2l_cru_ip_code_to_fmt(fmt.format.code))
> > +             return -EPIPE;
>
> Here you should check that the format on the subdev matches the format
> on the video device.
>
OK, I'll use the return value from rzg2l_cru_ip_code_to_fmt() and
match it with the video device node.

> > +
> > +     switch (fmt.format.field) {
> > +     case V4L2_FIELD_TOP:
> > +     case V4L2_FIELD_BOTTOM:
> > +     case V4L2_FIELD_NONE:
> > +     case V4L2_FIELD_INTERLACED_TB:
> > +     case V4L2_FIELD_INTERLACED_BT:
> > +     case V4L2_FIELD_INTERLACED:
> > +     case V4L2_FIELD_SEQ_TB:
> > +     case V4L2_FIELD_SEQ_BT:
> > +             break;
> > +     default:
> > +             return -EPIPE;
> > +     }
>
> Instead of checking the field here, shouldn't it be forced to a valid
> value in the subdev .set_fmt() function ? The link validation handler is
> responsible for validating that the configuration of the two sides of
> the link (IP subdev and video device) match. The driver shouldn't allow
> setting formats that can't be supported.
>
Agreed, this is already taken care of in .set_fmt(), so I'll drop this
check here.

> What you should check here is that the field of the subdev and the
> field of the video device match.
>
OK, I'll add a check for this.

> > +
> > +     cru =3D container_of(media_entity_to_video_device(entity),
>
> You can drop the local entity variable and write
>
OK.

Cheers,
Prabhakar

