Return-Path: <linux-media+bounces-19215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC1A99463B
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52618282BAE
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8ECC1D27B3;
	Tue,  8 Oct 2024 11:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbWkX+cb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6DD16FF2A;
	Tue,  8 Oct 2024 11:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728385574; cv=none; b=i9SEC3//fEYk3GGLhtBHqDef6DA9d/lFDwwRRGsuIG8iJSoff/hG5HNoJvu+Yrtb6ElKbwIihU93CjLR6+06k5myYq9p7ekmplxBEutDZYdMTqV6vr3aq9DLDfWZwcb9q7YfrQnVIIILLbFmNW5sH5yWxN6ORH/ioJXUuuOdotU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728385574; c=relaxed/simple;
	bh=RPO7jVFt26dwjcYzMBn1wdOFCuV+0MtqoPac+9csBtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TBJFPqPmySbmFtP5WSxHBqsWqvzw+yHVHZuyrfsYYRsv4w4g116c5rFQBouCfear0phY2tes9UPajcU6huR0EL6n8CyD43nmrVMoOEddsMTFiNb9cS3Tovh5DdgN0eWBWcPKaR7QRpfzMTU0PWISEy/icJq7HNj+Do4cyRGNbG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbWkX+cb; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-50c937b92d9so1042700e0c.2;
        Tue, 08 Oct 2024 04:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728385571; x=1728990371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtOVjbyAjG2zU29QqMkTWldiGOO5NXXvaEbwHvDFhJM=;
        b=HbWkX+cbghBgU8gf4awvDtehIQZh3KdkYPLABg8gxZuzbSPdq5hZ67WmrgIcfVW+O9
         ewcOwO5Ws/h4Zq9kBPe3IEN6VJVAE4IAXiLvID6o/dOwNN1I2l9y8IUmpHtlEvpIw4Kw
         jo5hydjvI+cV1EcUvjDiVXtUJEHIS+HakGzzxP+w3heH1VWIRQJn5wfSzDIdb7FoOsld
         6Xci6jB8uBjYcSOANDB+Nyj136AuHrfzAigEELd39vqbLrEeIShKyFFChUagBLOsfJG2
         VfD7aIrRtloZD5hf9dStLld6UW7rCxaPNq1IgLpAJzaV0OIHORqTirtlm74gCtQyDFhH
         el9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728385571; x=1728990371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtOVjbyAjG2zU29QqMkTWldiGOO5NXXvaEbwHvDFhJM=;
        b=rVkImMUJXNRUmo3h1C2fASNh/O62PaZSg4co7Cbb5/473OQZlS0ZCXu9spQugebE0I
         NMzjzxxSIiV4chIJhEjfLjancAeL5aHqNwKkWZ9ivyWcYMAufCepoWMxBvUK4T+hoG5D
         +sXCcx9SiWbf8+QBZZSi2tK46tDtJXuqq3TNiEWh0ITsYfbvQT0mPbpxVx2I6Vv3e6lJ
         Fq7ijiXCTQYXjY5gt9XDLEc89koudUlGo5pDPMZVSKOKbQjY6SPlB9C0GF+kDpusJulf
         HCI8h8Wyay/PnLUMDi86ws3P2hnvGFqAUfgfCBwFSh9vrnrda1itbGIUmtU852xbgh0F
         Fb1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKrk2XC3/J0r/VfQtR2E806IQf2qnk00h7Ia5JedD/T3+xVRe+uPixZ/jjAgwVVokhBWxwmqmFZSLlT6g=@vger.kernel.org, AJvYcCWVpmr/TRFLMXOGSgN/O/fVI2G+9cLK2HFQ64S2nyxyMmmEnLCtNypN7sQ4XNste1ICuxq3+GXUMWPFDbM=@vger.kernel.org, AJvYcCXVJ+5AKChnDvHmUhGBvxWoyM3OBH8CuinVJzSgjCZH5ybsBZSqIv92aSBdMYgehYXZHEJSpWbrYTyXYINUvCITg5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdCmZeXzj/3ncsgPbmpUK/kDZs8wnqZn/nqzkBGy2aHLn5AFVL
	3pzjsypIu7G0dlapMAiqCocOzmaw/2AfpLfT6uMtrt8sf2p0Ik5SzRptjN2QBwymrCnuKGLG3Rb
	TwXhlX1qioJ5Be59En6/uCHBjWCk=
X-Google-Smtp-Source: AGHT+IFAhzzWfREFDTRHEadMk6vgR1uvY0/FlJpPVHoW3gADi57xjaNCLMzf+BqKhf1eKVX42naNkJ6b4ixltvpeAQ0=
X-Received: by 2002:a05:6122:1688:b0:50a:b604:2b9e with SMTP id
 71dfb90a1353d-50c854b95fdmr11984777e0c.7.1728385571161; Tue, 08 Oct 2024
 04:06:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241007184839.190519-14-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241007200603.GA28812@pendragon.ideasonboard.com>
In-Reply-To: <20241007200603.GA28812@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Oct 2024 12:05:44 +0100
Message-ID: <CA+V-a8s_hweyJ37U9VWoohMAZJOGLPZ+Wf6BX-2-3U0DPj3=Fg@mail.gmail.com>
Subject: Re: [PATCH v4 13/17] media: rzg2l-cru: video: Implement
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

Thank you for the quick review.

On Mon, Oct 7, 2024 at 9:06=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Mon, Oct 07, 2024 at 07:48:35PM +0100, Prabhakar wrote:
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
> >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 91 ++++++++++---------
> >  1 file changed, 47 insertions(+), 44 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/d=
rivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index ceb9012c9d70..385b4242db2f 100644
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
> > @@ -995,6 +951,52 @@ static const struct v4l2_file_operations rzg2l_cru=
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
> > +     const struct rzg2l_cru_ip_format *video_fmt;
> > +     const struct rzg2l_cru_ip_format *ip_fmt;
> > +     struct v4l2_subdev *subdev;
> > +     struct rzg2l_cru_dev *cru;
> > +     struct media_pad *remote;
> > +     int ret;
> > +
> > +     remote =3D link->source;
> > +     subdev =3D media_entity_to_v4l2_subdev(remote->entity);
> > +     fmt.pad =3D remote->index;
>
>         subdev =3D media_entity_to_v4l2_subdev(link->source->entity);
>         fmt.pad =3D link->source->index;
>
> and drop the remote variable. Or, if you prefer keeping it, rename it to
> source.
>
OK, I will drop the local variable.

> > +     ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
> > +     if (ret < 0)
> > +             return ret =3D=3D -ENOIOCTLCMD ? -EINVAL : ret;
> > +
> > +     cru =3D container_of(media_entity_to_video_device(link->sink->ent=
ity),
> > +                        struct rzg2l_cru_dev, vdev);
> > +     video_fmt =3D rzg2l_cru_ip_format_to_fmt(cru->format.pixelformat)=
;
> > +     if (!video_fmt)
> > +             return -EPIPE;
>
> Can this happen, doesn't the s_fmt handler on the video device ensure
> that pixelformat is always valid.
>
Agreed, this won't happen. I'll drop this check.

> > +     ip_fmt =3D rzg2l_cru_ip_code_to_fmt(fmt.format.code);
> > +     if (!ip_fmt)
> > +             return -EPIPE;
>
> Same question here.
>
This won't happen, so I will drop the check. Actually as you mentioned
below we can drop one check so I'll get rid of fetching ip_fmt.

> > +
> > +     if (fmt.format.width !=3D cru->format.width ||
> > +         fmt.format.height !=3D cru->format.height ||
> > +         fmt.format.field !=3D cru->format.field ||
> > +         video_fmt->code !=3D fmt.format.code ||
> > +         ip_fmt->format !=3D cru->format.pixelformat)
>
> The last two line seem to implement the same check.
>
OK, I will drop the pixelformat check and keep the code check.

Cheers,
Prabhakar

