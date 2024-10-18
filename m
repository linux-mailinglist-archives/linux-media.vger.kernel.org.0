Return-Path: <linux-media+bounces-19851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BA29A3BF5
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 12:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D362283172
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 10:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827082022CC;
	Fri, 18 Oct 2024 10:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/xTr4nK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C2F20126C;
	Fri, 18 Oct 2024 10:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729248508; cv=none; b=CTetEiFelxPSTVvxEn5rUswN1ps6UTSd67jkUmhKrYBrQ3rgn8uYF9YLrpOe1cGq2z6ZoyuSj4ytj8ki1Ab9u3yW4Iy02fZxXPZuB2FHqSYoGmhRY1SYcbEyOkDL2FIqnjijV2UUvuJ898iKG3k1nCgHHpSGWiT5kFo9iySkI5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729248508; c=relaxed/simple;
	bh=2zMA0VA8E/JhFImp8XMHwh+pvw/eqb4LhuQikx9sF5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibCPE3CSocvkBxu8B14fk1pU64b3OV8y10eVrL/aPj6sY9x/3lvWF3LsePDFiWG31vPCCuZfb3DMRst9uU+rq4hjkBqLPUXCJxFkZU+bUlVKoIxQeM+X+7/RPl0fdloL20ew0jbXIZr1iD0GF+7rtfWhlc1wxAtOMPlODAUb1zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/xTr4nK; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c94861ee25so1026202a12.0;
        Fri, 18 Oct 2024 03:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729248504; x=1729853304; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NQ/DG2qwXNQothiWPpo51msQThq4DGmmhMbIlrKmsj8=;
        b=i/xTr4nK+uNTFBqb/oenQSGZ6Fsv21vQB9BTevFIOoBTvM8ltr+caP4WV09z5HdCxS
         GeOR2/tWHjyEe5qIK8UyJqoOI6cB82u+mSK8a0eU/0inQOmnD2WciPk0Y3sRLZk19qW9
         8aIzOIX9BgeAuwyvFqqgKgF726fc8iVrKGPw+weXjILMfksszy5dIVPGnftjQa+Y8O3n
         hJhn+KNK59IDjPCsSEb5iyx3DVES6rpNflHQqBN5PWiQ1255xjshqT74V6o/pKkIztdn
         2j0Howv/FE9k311SKDpjnFQjYl10LIjBjcl+qtcyAsr63B7DMO9l3EHG9bo2aqrWSipe
         7cXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729248504; x=1729853304;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NQ/DG2qwXNQothiWPpo51msQThq4DGmmhMbIlrKmsj8=;
        b=f8tu/b7YFzG176IbLg7Te7hG3okrP6c1a58UfutY2gORimwAJ4viDXRizMY9Kp0x4F
         3pJj7ghuPbh7EN7MdD2B6iNKcY0qnXgvovAqJFcvULL6Txhgw4t/oki/r1rB32XMIVsO
         w/aPCuM4buny4ux0SGAB4z82GCdTjCtb21QRsdf7KBKVpxR0b6cmqsZnQst95lrGHglT
         dF+fzOXTLFA7r5qLoYAqF4ZojIC3RdE2RLh3v4rIxmJ7vusKGTTNhKOfIKP6bNjndPQE
         ZbDQIZxsVLFbgvYp9G3NQ+BvSGrAq1Jw8/VaqxJi+u9SJTATGWIKzRt2pT5b8p1dmznB
         cwPA==
X-Forwarded-Encrypted: i=1; AJvYcCUxD55bptlO6W9v8ejhvu9R2frJ0MmZVp+ecBPJ35r3YzyDKzclQ4476Nn7CUHXiermvaRKQ0c1iVFNNBM=@vger.kernel.org, AJvYcCWj/I9gf9SV7nJUVrpCPXwtpj+GQdm8l0wRJhPOHW0XzCcVw4Oqm5QiPtK32rVa4ospp8hBGw6e5WjhD7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu6CsMuSbIaQruXhE4J9zdJ7w0/59/ELb3FMRqTnss+m0dVCpa
	o2FtrT+IybyjSfrFVQ3QQaCJosbazmqjWKcTXvVXz+qNIKii0gwB
X-Google-Smtp-Source: AGHT+IHYK8kXos8jli5K5v7KAUU+fbtWMYakLpCNU/A+NqaYHropuuIdBnOLtbYI2Z+22jV5Wim8WA==
X-Received: by 2002:a05:6402:13ce:b0:5c9:465f:4c88 with SMTP id 4fb4d7f45d1cf-5ca0ac61a2dmr2261997a12.18.1729248503627;
        Fri, 18 Oct 2024 03:48:23 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-51-176.cust.vodafonedsl.it. [188.217.51.176])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ca0b076d7dsm584179a12.14.2024.10.18.03.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 03:48:23 -0700 (PDT)
Date: Fri, 18 Oct 2024 12:48:21 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5645: add HAS_EVENTS supporty
Message-ID: <ZxI89bbErj3yazVH@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20241014173840.412695-1-tomm.merciai@gmail.com>
 <20241014175452.GB13238@pendragon.ideasonboard.com>
 <Zw4IrU8bOOtq26Gx@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <Zw6aZiBvRM5hvqVn@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20241016200836.GF30496@pendragon.ideasonboard.com>
 <ZxIoR6T6V0WgDdq0@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <CA+V-a8vw=hb+RZ_8haw30QHHRO3fzGoOZyERUba-MV3bYLTxWA@mail.gmail.com>
 <ZxI153rQ/IhCQhh1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ZxI5lI1udMkN7K-_@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZxI5lI1udMkN7K-_@kekkonen.localdomain>

Hi Sakari,
Thanks for your review.

On Fri, Oct 18, 2024 at 10:33:56AM +0000, Sakari Ailus wrote:
> Hi folks,
> 
> On Fri, Oct 18, 2024 at 12:18:15PM +0200, Tommaso Merciai wrote:
> > Hi Prabhakar,
> > Thanks for your comments.
> > 
> > On Fri, Oct 18, 2024 at 10:57:49AM +0100, Lad, Prabhakar wrote:
> > > Hi Tommaso,
> > > 
> > > On Fri, Oct 18, 2024 at 10:28 AM Tommaso Merciai <tomm.merciai@gmail.com> wrote:
> > > >
> > > > Hi Laurent,
> > > >
> > > > On Wed, Oct 16, 2024 at 11:08:36PM +0300, Laurent Pinchart wrote:
> > > > > Hi Tommaso,
> > > > >
> > > > > On Tue, Oct 15, 2024 at 06:37:58PM +0200, Tommaso Merciai wrote:
> > > > > > On Tue, Oct 15, 2024 at 08:16:13AM +0200, Tommaso Merciai wrote:
> > > > > > > On Mon, Oct 14, 2024 at 08:54:52PM +0300, Laurent Pinchart wrote:
> > > > > > > > On Mon, Oct 14, 2024 at 07:38:40PM +0200, Tommaso Merciai wrote:
> > > > > > > > > Controls can be exposed to userspace via a v4l-subdevX device, and
> > > > > > > > > userspace has to be able to subscribe to control events so that it is
> > > > > > > > > notified when the control changes value.
> > > > > > > > > Add missing HAS_EVENTS support: flag and .(un)subscribe_event().
> > > > > > > > >
> > > > > > > > > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > > > > > > > > ---
> > > > > > > > >  drivers/media/i2c/ov5645.c | 10 +++++++++-
> > > > > > > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > > > > > > > > index 0c32bd2940ec..2c5145d5c616 100644
> > > > > > > > > --- a/drivers/media/i2c/ov5645.c
> > > > > > > > > +++ b/drivers/media/i2c/ov5645.c
> > > > > > > > > @@ -29,6 +29,7 @@
> > > > > > > > >  #include <linux/slab.h>
> > > > > > > > >  #include <linux/types.h>
> > > > > > > > >  #include <media/v4l2-ctrls.h>
> > > > > > > > > +#include <media/v4l2-event.h>
> > > > > > > > >  #include <media/v4l2-fwnode.h>
> > > > > > > > >  #include <media/v4l2-subdev.h>
> > > > > > > > >
> > > > > > > > > @@ -1034,6 +1035,11 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
> > > > > > > > >       .s_stream = ov5645_s_stream,
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > > +static const struct v4l2_subdev_core_ops ov5645_subdev_core_ops = {
> > > > > > > > > +     .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > > > > > > > > +     .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > >  static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> > > > > > > > >       .enum_mbus_code = ov5645_enum_mbus_code,
> > > > > > > > >       .enum_frame_size = ov5645_enum_frame_size,
> > > > > > > > > @@ -1043,6 +1049,7 @@ static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > >  static const struct v4l2_subdev_ops ov5645_subdev_ops = {
> > > > > > > > > +     .core = &ov5645_subdev_core_ops,
> > > > > > > > >       .video = &ov5645_video_ops,
> > > > > > > > >       .pad = &ov5645_subdev_pad_ops,
> > > > > > > > >  };
> > > > > > > > > @@ -1178,7 +1185,8 @@ static int ov5645_probe(struct i2c_client *client)
> > > > > > > > >
> > > > > > > > >       v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
> > > > > > > > >       ov5645->sd.internal_ops = &ov5645_internal_ops;
> > > > > > > > > -     ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > > > > > > > +     ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > > > > > > > > +                         V4L2_SUBDEV_FL_HAS_EVENTS;
> > > > > > > >
> > > > > > > > Instead of patching every subdev driver, should we handle all of this in
> > > > > > > > the subdev core ? If a control handler is set for the subdev, we could
> > > > > > > > set the HAS_EVENTS flag automatically, and default to
> > > > > > > > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > > > > > > > if there are no control operations.
> > > > > >
> > > > > > Premit:
> > > > > >  - Don't know if I'm wrong eh.
> > > > >
> > > > > Nobody knows :-)
> > > > >
> > > > > > This can be done into:
> > > > > >
> > > > > > __v4l2_subdev_init_finalize()
> > > > > >
> > > > > > Adding:
> > > > > >
> > > > > >     if (sd->ctrl_handler)
> > > > > >             sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
> > > > > >
> > > > > > And check if there are no control operations using:
> > > > > >
> > > > > > bool has_subscribe_event;
> > > > > > bool has_unsubscribe_event;
> > > > > >
> > > > > >
> > > > > > has_subscribe_event = v4l2_subdev_has_op(sd, core, subscribe_event);
> > > > > > has_unsubscribe_event = v4l2_subdev_has_op(sd, core, unsubscribe_event);
> > > > > >
> > > > > > if (!has_subscribe_event)
> > > > > >     assign v4l2_ctrl_subdev_subscribe_event as default .subscribe ops(somehow)
> > > > >
> > > > > We can't change the ops structure as it's constant. Something like this
> > > > > could do:
> > > > >
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > index 3a4ba08810d2..41ae18a0d41e 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > @@ -691,10 +691,24 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > > > >               return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
> > > > >
> > > > >       case VIDIOC_SUBSCRIBE_EVENT:
> > > > > -             return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
> > > > > +             if (v4l2_subdev_has_op(sd, core, subscribe_event))
> > > > > +                     return v4l2_subdev_call(sd, core, subscribe_event, vfh,
> > > > > +                                             arg);
> > > > > +             else if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
> > > > > +                      vfh->ctrl_handler)
> > > > > +                     return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> > > > > +             else
> > > > > +                     return -ENOIOCTLCMD;
> > > > >
> > > > >       case VIDIOC_UNSUBSCRIBE_EVENT:
> > > > > -             return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
> > > > > +             if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> > > > > +                     return -ENOIOCTLCMD;
> > > > > +
> > > > > +             if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> > > > > +                     return v4l2_subdev_call(sd, core, unsubscribe_event,
> > > > > +                                             vfh, arg);
> > > > > +             else
> > > > +                       return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
> > > >
> > > > Thanks for your "more than an hint :)"
> > > > I'm able to test this on ov5645:
> > > >
> > > > Adding:
> > > >
> > > > +++ b/drivers/media/i2c/ov5645.c
> > > > @@ -1238,6 +1238,12 @@ static int ov5645_probe(struct i2c_client *client)
> > > >
> > > >         ov5645_init_state(&ov5645->sd, NULL);
> > > >
> > > > +       ret = v4l2_subdev_init_finalize(&ov5645->sd);
> > > > +       if (ret < 0) {
> > > > +               dev_err(dev, "subdev initialization error %d\n", ret);
> > > > +               goto err_free_state;
> > > > +       }
> > > > +
> > > >         ret = v4l2_async_register_subdev(&ov5645->sd);
> > > >         if (ret < 0) {
> > > >                 dev_err(dev, "could not register v4l2 device\n");
> > > > @@ -1251,6 +1257,8 @@ static int ov5645_probe(struct i2c_client *client)
> > > >
> > > >         return 0;
> > > >
> > > > +err_free_state:
> > > > +       v4l2_subdev_cleanup(&ov5645->sd);
> > > >  err_pm_runtime:
> > > >         pm_runtime_disable(dev);
> > > >         pm_runtime_put_noidle(dev);
> > > > @@ -1272,6 +1280,7 @@ static void ov5645_remove(struct i2c_client *client)
> > > >
> > > >         v4l2_async_unregister_subdev(&ov5645->sd);
> > > >         media_entity_cleanup(&ov5645->sd.entity);
> > > > +       v4l2_subdev_cleanup(&ov5645->sd);
> > > >         v4l2_ctrl_handler_free(&ov5645->ctrls);
> > > >         pm_runtime_disable(ov5645->dev);
> > > >         if (!pm_runtime_status_suspended(ov5645->dev))
> > > >
> > > > Then from the compliance tool I'm getting now good results:
> > > >
> > > > Total for device /dev/v4l-subdev1: 44, Succeeded: 44, Failed: 0, Warnings: 0
> > > >
> > > > I will send these 2 patches later if you agree (1 v4l2-subdev 1 ov5645.c)
> > > > Thanks again.
> > > >
> > > Thank you for the patch.
> > > 
> > > I am currently working on adding support for V4L2_SUBDEV_FL_HAS_EVENTS
> > > and subscribe hooks[1] (and some more features [0] for ov5645 driver),
> > > since the patch series adds internal pad which needs rework based on
> > > patch series from Sakari which I will do soon and send v3 patches for
> > > ov5645 driver.
> > > 
> > > [0] https://lore.kernel.org/all/20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> > > [1] https://lore.kernel.org/all/20240910170610.226189-2-prabhakar.mahadev-lad.rj@bp.renesas.com/
> > 
> > Thanks for sharing this.
> > Nice! then I can drop ov5645 patch and send only v4l2-subdev patch :)
> > 
> > Plan as suggested by Laurent is:
> > 
> > "Instead of patching every subdev driver, should we handle all of this in
> > the subdev core ? If a control handler is set for the subdev, we could
> > set the HAS_EVENTS flag automatically, and default to
> > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > if there are no control operations"
> > 
> > Using:
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 3a4ba08810d2..fe584998f5e6 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -691,10 +691,24 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >                 return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
> > 
> >         case VIDIOC_SUBSCRIBE_EVENT:
> > -               return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
> > +               if (v4l2_subdev_has_op(sd, core, subscribe_event))
> > +                       return v4l2_subdev_call(sd, core, subscribe_event,
> > +                                               vfh, arg);
> > +               else if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
> 
> Useless use of else. Same below.

Better:

	case VIDIOC_SUBSCRIBE_EVENT:
		if (v4l2_subdev_has_op(sd, core, subscribe_event))
			return v4l2_subdev_call(sd, core, subscribe_event,
						vfh, arg);

		return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);

	case VIDIOC_UNSUBSCRIBE_EVENT:
		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
			return v4l2_subdev_call(sd, core, unsubscribe_event,
						vfh, arg);

		return v4l2_event_subdev_unsubscribe(sd, vfh, arg);

Because V4L2_SUBDEV_FL_HAS_EVENTS and vfh->ctrl_handler are already
check right?

Thanks & Regards,
Tommaso

> 
> > +                       vfh->ctrl_handler)
> > +                       return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> > +               else
> > +                       return -ENOIOCTLCMD;
> > 
> >         case VIDIOC_UNSUBSCRIBE_EVENT:
> > -               return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
> > +               if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> > +                       return -ENOIOCTLCMD;
> > +
> > +               if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> > +                       return v4l2_subdev_call(sd, core, unsubscribe_event,
> > +                                               vfh, arg);
> > +               else
> > +                       return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
> > 
> >  #ifdef CONFIG_VIDEO_ADV_DEBUG
> >         case VIDIOC_DBG_G_REGISTER:
> > @@ -1641,6 +1655,9 @@ int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
> >                 }
> >         }
> > 
> > +       if (sd->ctrl_handler)
> > +               sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
> > +
> >         state = __v4l2_subdev_state_alloc(sd, name, key);
> >         if (IS_ERR(state))
> >                 return PTR_ERR(state);
> > 
> > In theory v4l2_subdev_init_finalize() and subdev_do_ioctl() will handle
> > this.
> > 
> > Please Laurent correct me if I'm wrong.
> > Prabhakar what do you think?
> > Thanks in advance.
> 
> Looks good to me, with the above comment.
> 
> -- 
> Kind regards,
> 
> Sakari Ailus

