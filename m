Return-Path: <linux-media+bounces-19849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B94129A3B4F
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 12:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31C3C1F27C20
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 10:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D56E202627;
	Fri, 18 Oct 2024 10:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xvbicc90"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0F0192B8F;
	Fri, 18 Oct 2024 10:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729246701; cv=none; b=HD2mheVTFy7jiJ6zuNWb4tIbQPhn2bSU4TMiDFRB+tMORdPlRnW+UuPVEvUwraVNqRN3DBIw+BOuywDffc+L71EM58LUiyL54Jr189cVMclHkRDdqpmtWt2fjfXwqzWgn22lwE0T2q1kuHiQIfFJtcAw0BXgO0XxPQ0Ag9bMlfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729246701; c=relaxed/simple;
	bh=JgIGPywbQd2qD2eZnLtz/OZeqEVsre6ebZWLtVNbJeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPjMgKJ95Et9Qx8gjtmdIkGbRRYV6Q6GCN5VcMLDt9PSCmMf3PB4a79br+5YQeAW2s64MgdAWnGuIJw2Jq2oGgsS0bFi/83P7k96USh1fLuJySjzjUYknp1dsRGe6qp79o4JmbcRrCBEB16G/DKvxv3IOPY/ynei/xyjfUrHB5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xvbicc90; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso4717945e9.0;
        Fri, 18 Oct 2024 03:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729246698; x=1729851498; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XtNvgU1eswQHB468Nh07rO85xSECFdlN7y4Ea13bzmo=;
        b=Xvbicc90lprn/Vnmdprv01NYoeEVRxOx4/qzKv/E1LTjCVMnyRqB5wYPM5xq0arU0B
         RQp2v4CImK+HlhDaXhH5mVm1+oUmwhnY8SsSnSEzkFroNhSZUt9HoJ2gJvsrxZiKQugP
         zAwv1dG4eTX0MwmBXKMkBhH9IiUilca1ePwXdzud7r9T6Egu5NSDyED0pI90aPXLA0ZK
         c3BWG5Ws13ttgP/sgO+hntm4A6dtl1gOypsbUXlChfJId1O4KlM+12MrOVj8qgGKS8rh
         ckbXbRsSGWCG6WmAWQlR6e5AWbht7aWfaMG5k4zDbH6Wr6vqbTELiejUOSJF55pZQkOt
         yGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729246698; x=1729851498;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XtNvgU1eswQHB468Nh07rO85xSECFdlN7y4Ea13bzmo=;
        b=WfOh3rqijE4fvCe3T6GsR+PUD50RBsWCE+D1ckWnXcvtnGAQQX2TGxJwNbMOCehjwj
         KL2Xj1j9CYYhO8WU44pdjX6VemfHkMQbojwTHZF+aDr2uxZmLudTzRk4K+RucvQHgW6x
         QMIgUB/vNWEjd0gpxTTwRABIKhlut+k7mSN8C7LqlNAZFqNClJ+mq3IFsISCNnOkqneb
         uQErNJ7fL2pGSRqhWJKMxVoDe834uPgmfUOW9OrhXkzP9+wJvV8xeMro8q9DSH4nRruW
         6LsVgxNiEhdih6oNL+sgCy3s3vj6K21y6MRxylLMqKBCNfA3JIZ4UbDPF3yP73lwVABH
         i9Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWKE7fg7S1Jo+kUjTCplKaLqdoG0mJtCLMlSHaTq2xNfehCnAX2141be10pYuAZD+4z2aAVE2B74RVi+Qk=@vger.kernel.org, AJvYcCWqpSspKkxo5x6sBmtGDhXV99juL+ftaAqtu434abI+NFjBxk5jCeAgEYKQNDR+jGTnuMs6FzvhMCl9OkE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvb1E3Vk9Y9BrTp3HWa4i0Vb8O5hUByX9lNLjZhmLn5eJBmyJm
	xNbG2AW67nKMXf9qlFeRGD396SLThsrbPqWgAEZuKHpVu9QKAK7r
X-Google-Smtp-Source: AGHT+IFPVfMMl/9DwiFBuce8DtdPST4xhWi2SCJ33ttO9zm9XW/noBpsWhofNMeJXccR8qcUpW8pTg==
X-Received: by 2002:a05:600c:46d0:b0:431:4f29:9539 with SMTP id 5b1f17b1804b1-43161690021mr17587055e9.32.1729246697583;
        Fri, 18 Oct 2024 03:18:17 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-51-176.cust.vodafonedsl.it. [188.217.51.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316067dd84sm23579525e9.1.2024.10.18.03.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 03:18:17 -0700 (PDT)
Date: Fri, 18 Oct 2024 12:18:15 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	sakari.ailus@linux.intel.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5645: add HAS_EVENTS supporty
Message-ID: <ZxI153rQ/IhCQhh1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20241014173840.412695-1-tomm.merciai@gmail.com>
 <20241014175452.GB13238@pendragon.ideasonboard.com>
 <Zw4IrU8bOOtq26Gx@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <Zw6aZiBvRM5hvqVn@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20241016200836.GF30496@pendragon.ideasonboard.com>
 <ZxIoR6T6V0WgDdq0@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <CA+V-a8vw=hb+RZ_8haw30QHHRO3fzGoOZyERUba-MV3bYLTxWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8vw=hb+RZ_8haw30QHHRO3fzGoOZyERUba-MV3bYLTxWA@mail.gmail.com>

Hi Prabhakar,
Thanks for your comments.

On Fri, Oct 18, 2024 at 10:57:49AM +0100, Lad, Prabhakar wrote:
> Hi Tommaso,
> 
> On Fri, Oct 18, 2024 at 10:28 AM Tommaso Merciai <tomm.merciai@gmail.com> wrote:
> >
> > Hi Laurent,
> >
> > On Wed, Oct 16, 2024 at 11:08:36PM +0300, Laurent Pinchart wrote:
> > > Hi Tommaso,
> > >
> > > On Tue, Oct 15, 2024 at 06:37:58PM +0200, Tommaso Merciai wrote:
> > > > On Tue, Oct 15, 2024 at 08:16:13AM +0200, Tommaso Merciai wrote:
> > > > > On Mon, Oct 14, 2024 at 08:54:52PM +0300, Laurent Pinchart wrote:
> > > > > > On Mon, Oct 14, 2024 at 07:38:40PM +0200, Tommaso Merciai wrote:
> > > > > > > Controls can be exposed to userspace via a v4l-subdevX device, and
> > > > > > > userspace has to be able to subscribe to control events so that it is
> > > > > > > notified when the control changes value.
> > > > > > > Add missing HAS_EVENTS support: flag and .(un)subscribe_event().
> > > > > > >
> > > > > > > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > > > > > > ---
> > > > > > >  drivers/media/i2c/ov5645.c | 10 +++++++++-
> > > > > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > > > > > > index 0c32bd2940ec..2c5145d5c616 100644
> > > > > > > --- a/drivers/media/i2c/ov5645.c
> > > > > > > +++ b/drivers/media/i2c/ov5645.c
> > > > > > > @@ -29,6 +29,7 @@
> > > > > > >  #include <linux/slab.h>
> > > > > > >  #include <linux/types.h>
> > > > > > >  #include <media/v4l2-ctrls.h>
> > > > > > > +#include <media/v4l2-event.h>
> > > > > > >  #include <media/v4l2-fwnode.h>
> > > > > > >  #include <media/v4l2-subdev.h>
> > > > > > >
> > > > > > > @@ -1034,6 +1035,11 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
> > > > > > >       .s_stream = ov5645_s_stream,
> > > > > > >  };
> > > > > > >
> > > > > > > +static const struct v4l2_subdev_core_ops ov5645_subdev_core_ops = {
> > > > > > > +     .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > > > > > > +     .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > > > > > > +};
> > > > > > > +
> > > > > > >  static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> > > > > > >       .enum_mbus_code = ov5645_enum_mbus_code,
> > > > > > >       .enum_frame_size = ov5645_enum_frame_size,
> > > > > > > @@ -1043,6 +1049,7 @@ static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> > > > > > >  };
> > > > > > >
> > > > > > >  static const struct v4l2_subdev_ops ov5645_subdev_ops = {
> > > > > > > +     .core = &ov5645_subdev_core_ops,
> > > > > > >       .video = &ov5645_video_ops,
> > > > > > >       .pad = &ov5645_subdev_pad_ops,
> > > > > > >  };
> > > > > > > @@ -1178,7 +1185,8 @@ static int ov5645_probe(struct i2c_client *client)
> > > > > > >
> > > > > > >       v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
> > > > > > >       ov5645->sd.internal_ops = &ov5645_internal_ops;
> > > > > > > -     ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > > > > > +     ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > > > > > > +                         V4L2_SUBDEV_FL_HAS_EVENTS;
> > > > > >
> > > > > > Instead of patching every subdev driver, should we handle all of this in
> > > > > > the subdev core ? If a control handler is set for the subdev, we could
> > > > > > set the HAS_EVENTS flag automatically, and default to
> > > > > > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > > > > > if there are no control operations.
> > > >
> > > > Premit:
> > > >  - Don't know if I'm wrong eh.
> > >
> > > Nobody knows :-)
> > >
> > > > This can be done into:
> > > >
> > > > __v4l2_subdev_init_finalize()
> > > >
> > > > Adding:
> > > >
> > > >     if (sd->ctrl_handler)
> > > >             sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
> > > >
> > > > And check if there are no control operations using:
> > > >
> > > > bool has_subscribe_event;
> > > > bool has_unsubscribe_event;
> > > >
> > > >
> > > > has_subscribe_event = v4l2_subdev_has_op(sd, core, subscribe_event);
> > > > has_unsubscribe_event = v4l2_subdev_has_op(sd, core, unsubscribe_event);
> > > >
> > > > if (!has_subscribe_event)
> > > >     assign v4l2_ctrl_subdev_subscribe_event as default .subscribe ops(somehow)
> > >
> > > We can't change the ops structure as it's constant. Something like this
> > > could do:
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index 3a4ba08810d2..41ae18a0d41e 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -691,10 +691,24 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > >               return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
> > >
> > >       case VIDIOC_SUBSCRIBE_EVENT:
> > > -             return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
> > > +             if (v4l2_subdev_has_op(sd, core, subscribe_event))
> > > +                     return v4l2_subdev_call(sd, core, subscribe_event, vfh,
> > > +                                             arg);
> > > +             else if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
> > > +                      vfh->ctrl_handler)
> > > +                     return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> > > +             else
> > > +                     return -ENOIOCTLCMD;
> > >
> > >       case VIDIOC_UNSUBSCRIBE_EVENT:
> > > -             return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
> > > +             if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> > > +                     return -ENOIOCTLCMD;
> > > +
> > > +             if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> > > +                     return v4l2_subdev_call(sd, core, unsubscribe_event,
> > > +                                             vfh, arg);
> > > +             else
> > +                       return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
> >
> > Thanks for your "more than an hint :)"
> > I'm able to test this on ov5645:
> >
> > Adding:
> >
> > +++ b/drivers/media/i2c/ov5645.c
> > @@ -1238,6 +1238,12 @@ static int ov5645_probe(struct i2c_client *client)
> >
> >         ov5645_init_state(&ov5645->sd, NULL);
> >
> > +       ret = v4l2_subdev_init_finalize(&ov5645->sd);
> > +       if (ret < 0) {
> > +               dev_err(dev, "subdev initialization error %d\n", ret);
> > +               goto err_free_state;
> > +       }
> > +
> >         ret = v4l2_async_register_subdev(&ov5645->sd);
> >         if (ret < 0) {
> >                 dev_err(dev, "could not register v4l2 device\n");
> > @@ -1251,6 +1257,8 @@ static int ov5645_probe(struct i2c_client *client)
> >
> >         return 0;
> >
> > +err_free_state:
> > +       v4l2_subdev_cleanup(&ov5645->sd);
> >  err_pm_runtime:
> >         pm_runtime_disable(dev);
> >         pm_runtime_put_noidle(dev);
> > @@ -1272,6 +1280,7 @@ static void ov5645_remove(struct i2c_client *client)
> >
> >         v4l2_async_unregister_subdev(&ov5645->sd);
> >         media_entity_cleanup(&ov5645->sd.entity);
> > +       v4l2_subdev_cleanup(&ov5645->sd);
> >         v4l2_ctrl_handler_free(&ov5645->ctrls);
> >         pm_runtime_disable(ov5645->dev);
> >         if (!pm_runtime_status_suspended(ov5645->dev))
> >
> > Then from the compliance tool I'm getting now good results:
> >
> > Total for device /dev/v4l-subdev1: 44, Succeeded: 44, Failed: 0, Warnings: 0
> >
> > I will send these 2 patches later if you agree (1 v4l2-subdev 1 ov5645.c)
> > Thanks again.
> >
> Thank you for the patch.
> 
> I am currently working on adding support for V4L2_SUBDEV_FL_HAS_EVENTS
> and subscribe hooks[1] (and some more features [0] for ov5645 driver),
> since the patch series adds internal pad which needs rework based on
> patch series from Sakari which I will do soon and send v3 patches for
> ov5645 driver.
> 
> [0] https://lore.kernel.org/all/20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> [1] https://lore.kernel.org/all/20240910170610.226189-2-prabhakar.mahadev-lad.rj@bp.renesas.com/

Thanks for sharing this.
Nice! then I can drop ov5645 patch and send only v4l2-subdev patch :)

Plan as suggested by Laurent is:

"Instead of patching every subdev driver, should we handle all of this in
the subdev core ? If a control handler is set for the subdev, we could
set the HAS_EVENTS flag automatically, and default to
v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
if there are no control operations"

Using:

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 3a4ba08810d2..fe584998f5e6 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -691,10 +691,24 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
                return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);

        case VIDIOC_SUBSCRIBE_EVENT:
-               return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
+               if (v4l2_subdev_has_op(sd, core, subscribe_event))
+                       return v4l2_subdev_call(sd, core, subscribe_event,
+                                               vfh, arg);
+               else if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
+                       vfh->ctrl_handler)
+                       return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
+               else
+                       return -ENOIOCTLCMD;

        case VIDIOC_UNSUBSCRIBE_EVENT:
-               return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
+               if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
+                       return -ENOIOCTLCMD;
+
+               if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
+                       return v4l2_subdev_call(sd, core, unsubscribe_event,
+                                               vfh, arg);
+               else
+                       return v4l2_event_subdev_unsubscribe(sd, vfh, arg);

 #ifdef CONFIG_VIDEO_ADV_DEBUG
        case VIDIOC_DBG_G_REGISTER:
@@ -1641,6 +1655,9 @@ int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
                }
        }

+       if (sd->ctrl_handler)
+               sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
+
        state = __v4l2_subdev_state_alloc(sd, name, key);
        if (IS_ERR(state))
                return PTR_ERR(state);

In theory v4l2_subdev_init_finalize() and subdev_do_ioctl() will handle
this.

Please Laurent correct me if I'm wrong.
Prabhakar what do you think?
Thanks in advance.


Regards,
Tommaso

> 
> Cheers,
> Prabhakar

