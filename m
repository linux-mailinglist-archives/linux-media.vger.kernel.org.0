Return-Path: <linux-media+bounces-19847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 419059A3AA6
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 11:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62DF71C21B7F
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 09:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901172010F8;
	Fri, 18 Oct 2024 09:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUB9rGKc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED4C168C3F;
	Fri, 18 Oct 2024 09:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729245500; cv=none; b=jkIlNzja1i/kpxkx7ubW0zJRsDBamRQv/59PTyE6SOFPbtL6++tKI1p3xVFZ8727hJcdeqvyYCIGwdDoMYvX+MhM8PJnlCzT8PEWoyblufZZ5F7QvwmsbsXJr4FetcOjY+vtRZP6LGPv+p+bGUC8/ODOz4IbKmmnVAhTKMBMCw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729245500; c=relaxed/simple;
	bh=RxjxoaWibi3r7ypqg1RV1u630u8UMksVWQsEjPjQRI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nd7C4uBevDQ5Dw7BtofqQ2bHalRAqA+mL/lDiKBfEGa46TRaNih6c4NdYawdj/TDtITWXyyBsWG+REY1jZiWITxduFnkCD5lXHMj1vKwKkBHIggYFjG5XNotr0tYRLWM07zQGa6ZrZbs0SWOFnNU4+t61SfU7RTG5iQABWLLt1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUB9rGKc; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-50d73699e13so1085194e0c.1;
        Fri, 18 Oct 2024 02:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729245497; x=1729850297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPpZTWjWEG1v5cy6SxF4NADkulnuY6pZjEIXudXOass=;
        b=dUB9rGKcm+GIWMdmaRP1rwV/m6F6XmnRkOwZi12e4E8DosM88rai2n8T7YDE1Yop7o
         gGcfTUY0yqDjDr1gzyMwvpRRSra+VaT1KA5k7QKyGTv2KHzTs++I2s5nR8vwnMis6oye
         ijeiW1KPPNzzeVngDdWmb7GfcVrTnMoP8O977cb3oZXotjc3bBAxsOmJQCxnkMbDAVf9
         sMa8b1J8w8h9P3a1zZwVe2YzoqMy1qSRzwXKTtt2o2R9P69KTqO2/l6lOTm8CKbcPplF
         ShsbPZgED5YjufLT0NOFm62v2zwlbRZfhZX4rRYIZKBz9QayIctJPKeZn0GghKZnZtHI
         Z1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729245497; x=1729850297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPpZTWjWEG1v5cy6SxF4NADkulnuY6pZjEIXudXOass=;
        b=XXK9/g7CRLmbo8b4Nm0wt2VF4gmffxDQlnc2z6RHyBbNqOfhwQ48NrQ60fLw3C4Vpg
         QjgdyQG5P0JKaqcOTMaom8ZX8ycLTkngCg040qwhJRpe0ilfikIz+f18bQ5JKjm2qvxV
         1uqQcCtCWr6xwBjnxv4OGNLWSGdsNQuduLiYhFbcls1BJAWGbDH+NLqejad3tIhlFnjy
         qI+KvFPF1JAZdU5kCmVGqIMNk+/8aoCB4i7QmfF+7NfTojUGBe303jrpV2toZS7C0VsS
         GO8vWWnwRVxyRxHN9ErCVAALzQRDjrtGA1kwMrf4Y5OVsN3xVq0pfH1hIegezUMDQ56l
         zJlA==
X-Forwarded-Encrypted: i=1; AJvYcCUO2fbfDAlxVIIBG2tgUPJjDZeKZekK0inmqmKHbbng70FWGUmjzpFz5HH6wXK4JgI7foIgPaPfw28O0d8=@vger.kernel.org, AJvYcCXI8zcic7vJUOUJzPEpFfddSID2h7tJ71x8xFiBL2BfMDUaeRLCXUP4NG+v3+2V/KZhyXaKW8QKN7NiOuM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7G4xnX0XmIlRevsx8JMGEJD7EZ61fKUejREqPFhWgCtYdkv8D
	HJIoBy42ClO6oblXR4P5KH7OIg6b2q0U8/Qeh/IKT2vBYVceQ9Rw9BqNAQInqY+EdbMr6QUkGIM
	zNv383Dj0icBonFb8EzBP9JS8bj0=
X-Google-Smtp-Source: AGHT+IFXJ4F8jEvoGAAYw0+G/Dn320SoLgxCd3uTwb6YBEza087rLF4+x22EGPi7bzezztXM0XTQ2+loObGLZrxVtDo=
X-Received: by 2002:a05:6122:3d0d:b0:50a:cbdb:b929 with SMTP id
 71dfb90a1353d-50dd9bf9117mr623915e0c.2.1729245495487; Fri, 18 Oct 2024
 02:58:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014173840.412695-1-tomm.merciai@gmail.com>
 <20241014175452.GB13238@pendragon.ideasonboard.com> <Zw4IrU8bOOtq26Gx@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <Zw6aZiBvRM5hvqVn@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20241016200836.GF30496@pendragon.ideasonboard.com> <ZxIoR6T6V0WgDdq0@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
In-Reply-To: <ZxIoR6T6V0WgDdq0@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 18 Oct 2024 10:57:49 +0100
Message-ID: <CA+V-a8vw=hb+RZ_8haw30QHHRO3fzGoOZyERUba-MV3bYLTxWA@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov5645: add HAS_EVENTS supporty
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, sakari.ailus@linux.intel.com, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tommaso,

On Fri, Oct 18, 2024 at 10:28=E2=80=AFAM Tommaso Merciai <tomm.merciai@gmai=
l.com> wrote:
>
> Hi Laurent,
>
> On Wed, Oct 16, 2024 at 11:08:36PM +0300, Laurent Pinchart wrote:
> > Hi Tommaso,
> >
> > On Tue, Oct 15, 2024 at 06:37:58PM +0200, Tommaso Merciai wrote:
> > > On Tue, Oct 15, 2024 at 08:16:13AM +0200, Tommaso Merciai wrote:
> > > > On Mon, Oct 14, 2024 at 08:54:52PM +0300, Laurent Pinchart wrote:
> > > > > On Mon, Oct 14, 2024 at 07:38:40PM +0200, Tommaso Merciai wrote:
> > > > > > Controls can be exposed to userspace via a v4l-subdevX device, =
and
> > > > > > userspace has to be able to subscribe to control events so that=
 it is
> > > > > > notified when the control changes value.
> > > > > > Add missing HAS_EVENTS support: flag and .(un)subscribe_event()=
.
> > > > > >
> > > > > > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > > > > > ---
> > > > > >  drivers/media/i2c/ov5645.c | 10 +++++++++-
> > > > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5=
645.c
> > > > > > index 0c32bd2940ec..2c5145d5c616 100644
> > > > > > --- a/drivers/media/i2c/ov5645.c
> > > > > > +++ b/drivers/media/i2c/ov5645.c
> > > > > > @@ -29,6 +29,7 @@
> > > > > >  #include <linux/slab.h>
> > > > > >  #include <linux/types.h>
> > > > > >  #include <media/v4l2-ctrls.h>
> > > > > > +#include <media/v4l2-event.h>
> > > > > >  #include <media/v4l2-fwnode.h>
> > > > > >  #include <media/v4l2-subdev.h>
> > > > > >
> > > > > > @@ -1034,6 +1035,11 @@ static const struct v4l2_subdev_video_op=
s ov5645_video_ops =3D {
> > > > > >       .s_stream =3D ov5645_s_stream,
> > > > > >  };
> > > > > >
> > > > > > +static const struct v4l2_subdev_core_ops ov5645_subdev_core_op=
s =3D {
> > > > > > +     .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> > > > > > +     .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> > > > > > +};
> > > > > > +
> > > > > >  static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops =
=3D {
> > > > > >       .enum_mbus_code =3D ov5645_enum_mbus_code,
> > > > > >       .enum_frame_size =3D ov5645_enum_frame_size,
> > > > > > @@ -1043,6 +1049,7 @@ static const struct v4l2_subdev_pad_ops o=
v5645_subdev_pad_ops =3D {
> > > > > >  };
> > > > > >
> > > > > >  static const struct v4l2_subdev_ops ov5645_subdev_ops =3D {
> > > > > > +     .core =3D &ov5645_subdev_core_ops,
> > > > > >       .video =3D &ov5645_video_ops,
> > > > > >       .pad =3D &ov5645_subdev_pad_ops,
> > > > > >  };
> > > > > > @@ -1178,7 +1185,8 @@ static int ov5645_probe(struct i2c_client=
 *client)
> > > > > >
> > > > > >       v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_=
ops);
> > > > > >       ov5645->sd.internal_ops =3D &ov5645_internal_ops;
> > > > > > -     ov5645->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > > > > +     ov5645->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> > > > > > +                         V4L2_SUBDEV_FL_HAS_EVENTS;
> > > > >
> > > > > Instead of patching every subdev driver, should we handle all of =
this in
> > > > > the subdev core ? If a control handler is set for the subdev, we =
could
> > > > > set the HAS_EVENTS flag automatically, and default to
> > > > > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscr=
ibe()
> > > > > if there are no control operations.
> > >
> > > Premit:
> > >  - Don't know if I'm wrong eh.
> >
> > Nobody knows :-)
> >
> > > This can be done into:
> > >
> > > __v4l2_subdev_init_finalize()
> > >
> > > Adding:
> > >
> > >     if (sd->ctrl_handler)
> > >             sd->flags |=3D V4L2_SUBDEV_FL_HAS_EVENTS;
> > >
> > > And check if there are no control operations using:
> > >
> > > bool has_subscribe_event;
> > > bool has_unsubscribe_event;
> > >
> > >
> > > has_subscribe_event =3D v4l2_subdev_has_op(sd, core, subscribe_event)=
;
> > > has_unsubscribe_event =3D v4l2_subdev_has_op(sd, core, unsubscribe_ev=
ent);
> > >
> > > if (!has_subscribe_event)
> > >     assign v4l2_ctrl_subdev_subscribe_event as default .subscribe ops=
(somehow)
> >
> > We can't change the ops structure as it's constant. Something like this
> > could do:
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2=
-core/v4l2-subdev.c
> > index 3a4ba08810d2..41ae18a0d41e 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -691,10 +691,24 @@ static long subdev_do_ioctl(struct file *file, un=
signed int cmd, void *arg,
> >               return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NON=
BLOCK);
> >
> >       case VIDIOC_SUBSCRIBE_EVENT:
> > -             return v4l2_subdev_call(sd, core, subscribe_event, vfh, a=
rg);
> > +             if (v4l2_subdev_has_op(sd, core, subscribe_event))
> > +                     return v4l2_subdev_call(sd, core, subscribe_event=
, vfh,
> > +                                             arg);
> > +             else if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
> > +                      vfh->ctrl_handler)
> > +                     return v4l2_ctrl_subdev_subscribe_event(sd, vfh, =
arg);
> > +             else
> > +                     return -ENOIOCTLCMD;
> >
> >       case VIDIOC_UNSUBSCRIBE_EVENT:
> > -             return v4l2_subdev_call(sd, core, unsubscribe_event, vfh,=
 arg);
> > +             if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> > +                     return -ENOIOCTLCMD;
> > +
> > +             if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> > +                     return v4l2_subdev_call(sd, core, unsubscribe_eve=
nt,
> > +                                             vfh, arg);
> > +             else
> +                       return v4l2_event_subdev_unsubscribe(sd, vfh, arg=
);
>
> Thanks for your "more than an hint :)"
> I'm able to test this on ov5645:
>
> Adding:
>
> +++ b/drivers/media/i2c/ov5645.c
> @@ -1238,6 +1238,12 @@ static int ov5645_probe(struct i2c_client *client)
>
>         ov5645_init_state(&ov5645->sd, NULL);
>
> +       ret =3D v4l2_subdev_init_finalize(&ov5645->sd);
> +       if (ret < 0) {
> +               dev_err(dev, "subdev initialization error %d\n", ret);
> +               goto err_free_state;
> +       }
> +
>         ret =3D v4l2_async_register_subdev(&ov5645->sd);
>         if (ret < 0) {
>                 dev_err(dev, "could not register v4l2 device\n");
> @@ -1251,6 +1257,8 @@ static int ov5645_probe(struct i2c_client *client)
>
>         return 0;
>
> +err_free_state:
> +       v4l2_subdev_cleanup(&ov5645->sd);
>  err_pm_runtime:
>         pm_runtime_disable(dev);
>         pm_runtime_put_noidle(dev);
> @@ -1272,6 +1280,7 @@ static void ov5645_remove(struct i2c_client *client=
)
>
>         v4l2_async_unregister_subdev(&ov5645->sd);
>         media_entity_cleanup(&ov5645->sd.entity);
> +       v4l2_subdev_cleanup(&ov5645->sd);
>         v4l2_ctrl_handler_free(&ov5645->ctrls);
>         pm_runtime_disable(ov5645->dev);
>         if (!pm_runtime_status_suspended(ov5645->dev))
>
> Then from the compliance tool I'm getting now good results:
>
> Total for device /dev/v4l-subdev1: 44, Succeeded: 44, Failed: 0, Warnings=
: 0
>
> I will send these 2 patches later if you agree (1 v4l2-subdev 1 ov5645.c)
> Thanks again.
>
Thank you for the patch.

I am currently working on adding support for V4L2_SUBDEV_FL_HAS_EVENTS
and subscribe hooks[1] (and some more features [0] for ov5645 driver),
since the patch series adds internal pad which needs rework based on
patch series from Sakari which I will do soon and send v3 patches for
ov5645 driver.

[0] https://lore.kernel.org/all/20240910170610.226189-1-prabhakar.mahadev-l=
ad.rj@bp.renesas.com/
[1] https://lore.kernel.org/all/20240910170610.226189-2-prabhakar.mahadev-l=
ad.rj@bp.renesas.com/

Cheers,
Prabhakar

