Return-Path: <linux-media+bounces-19859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7999A3ED5
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 14:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0EB81C24C95
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 12:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E421C3F10;
	Fri, 18 Oct 2024 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUmEx7EI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2C81D5CDB;
	Fri, 18 Oct 2024 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729255806; cv=none; b=p9PGT1zFtp3gnv/3OxAHBZY2bvwYOPI74zCrd88MnqWlat9UrtBdSJxCpwSY7dfLIITfT0w+pyxzudFjUS2EsR0W7LoJqDt6ev3ufH5Kv4ECLa9aE/IkEoyAb5an3iT1zTfWY532vGTrHpk2KIvdCMsTdZt/LnhBqN0WQqbIf10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729255806; c=relaxed/simple;
	bh=MVBaq9ehYrWW1cXVeNiv/CRC8mAcnNds6qMX7HjQ6XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTR2HB6MttgpKOYmn/ptlsQTHuJSNs0NiTIzx6ZqiUvZyU763X6BCIM9vetDdrkxrzk5qpf+g5OwNzg5CYhqCulao/8kqHVH2Wl1B26pfaQuTf08WSRHYG6NUjVPnglRkMRhfltxY+THzWacNM0AJDyqqjS16bRqLofdP1cb36M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUmEx7EI; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c937b5169cso3219525a12.1;
        Fri, 18 Oct 2024 05:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729255803; x=1729860603; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+EeEyMsi8WViTMCIoVYJwkc3MroPy2bvwUyWWPwHVCc=;
        b=RUmEx7EIGxxxsTgTPTdNcqZoUXtt80AyHRQ4fTtGOkbiY+sk8DdqXdoh2O3QmQYnJH
         ypoZzpDqFTtE/5Lie+ZWjf9PJ8PUnMQryr8rBGjt/SA1g6BuUJ4QC4m6H3nqheJtiL3U
         I6ebU2ih8b2ZiGxEH8WHDMDaYQFdzvp8QRtlsA17Jbmza5WC/nvvX+0zVwZUFK0kG33K
         iUgXXirRjVLQfKwVEBLqvvx9qZvsnX2GAz6jPJy17hXom/3Vk+h5bp+VGqf6pPN0gJsq
         uB1kVzHbDxpWahJALA4YpJl+BmTFsVmgVH3AYoIwgs5jo8n0TGz6lE4AwHGL3LLsLr8Z
         oAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729255803; x=1729860603;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+EeEyMsi8WViTMCIoVYJwkc3MroPy2bvwUyWWPwHVCc=;
        b=YRUldnhcegFi19L1NEtlg5gPHa0iknHVvzO7vokplZSjikBW+xuCXkNM7/JxvFfvjs
         XTw8ruDxgBMszDR819tQW2kRfn+tPwCXCptnAhZYXwWUgjkNUNMob64b60jUbTY4AX5j
         1tdg8UyE21gNfa7CCDA8gTrzPStM6WcYo0K8hhoEqFIDzBiTmY+ILLq3gqkoMawRFQsN
         qQz17P37BDtRDOBNbvPwcZz+xld9Sd4KWTSz3u5VuV1VRCzc/AlbJJQlGqHLrp+XWTVk
         EwaRkNU7Wam5/2SCoAc6K4E9LwCMkn/TOHc0L5+VxfpZ/hcKkfpxdgZ9qJgJ94skjZ1N
         SMvw==
X-Forwarded-Encrypted: i=1; AJvYcCWwqVS9H3a7/wzFGQyGv8+37Rs0nZni8At3CG4cYYwKk+q19+DXq+7R9iEtF8IpBDzk0L6jfd0UT/OZHFM=@vger.kernel.org, AJvYcCXNgnP44/6w+E0PScfTsV/uG7dVFGScvbCm1qTwVp4gGLiK8w5hP1fOXSlqaV49RSrLOZNp4z5aNws1tU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2FyS72+YGem8gbjnYo7DrAX8BL8zGfhCaHy+nXwIOk8anhZ+i
	JbLj57c7VVBoKWI60DPB1pOcj8b5+1HlG0FGM0iLKnbRlm5vSsFo
X-Google-Smtp-Source: AGHT+IGfR//VHZxN3ka+n1W03gBB8S9kLYXgIcikPZ+kX3jf7BpLks4r1INGYHJ3MF6g2L5LrT7mPg==
X-Received: by 2002:a05:6402:24a0:b0:5c9:662:4bbe with SMTP id 4fb4d7f45d1cf-5ca0b0f4885mr2298940a12.15.1729255802594;
        Fri, 18 Oct 2024 05:50:02 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-51-176.cust.vodafonedsl.it. [188.217.51.176])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ca0b087b70sm699288a12.39.2024.10.18.05.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 05:50:02 -0700 (PDT)
Date: Fri, 18 Oct 2024 14:50:00 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5645: add HAS_EVENTS supporty
Message-ID: <ZxJZeFj1kiNq3ko5@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20241014175452.GB13238@pendragon.ideasonboard.com>
 <Zw4IrU8bOOtq26Gx@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <Zw6aZiBvRM5hvqVn@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20241016200836.GF30496@pendragon.ideasonboard.com>
 <ZxIoR6T6V0WgDdq0@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <CA+V-a8vw=hb+RZ_8haw30QHHRO3fzGoOZyERUba-MV3bYLTxWA@mail.gmail.com>
 <ZxI153rQ/IhCQhh1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ZxI5lI1udMkN7K-_@kekkonen.localdomain>
 <ZxI89bbErj3yazVH@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ZxI-nvE4G18cbS5x@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZxI-nvE4G18cbS5x@kekkonen.localdomain>

Hi Sakari,
Thanks for your comment.

On Fri, Oct 18, 2024 at 10:55:26AM +0000, Sakari Ailus wrote:
> Hi Tommaso,
> 
> On Fri, Oct 18, 2024 at 12:48:21PM +0200, Tommaso Merciai wrote:
> > Hi Sakari,
> > Thanks for your review.
> > 
> > On Fri, Oct 18, 2024 at 10:33:56AM +0000, Sakari Ailus wrote:
> > > Hi folks,
> > > 
> > > On Fri, Oct 18, 2024 at 12:18:15PM +0200, Tommaso Merciai wrote:
> > > > Hi Prabhakar,
> > > > Thanks for your comments.
> > > > 
> > > > On Fri, Oct 18, 2024 at 10:57:49AM +0100, Lad, Prabhakar wrote:
> > > > > Hi Tommaso,
> > > > > 
> > > > > On Fri, Oct 18, 2024 at 10:28 AM Tommaso Merciai <tomm.merciai@gmail.com> wrote:
> > > > > >
> > > > > > Hi Laurent,
> > > > > >
> > > > > > On Wed, Oct 16, 2024 at 11:08:36PM +0300, Laurent Pinchart wrote:
> > > > > > > Hi Tommaso,
> > > > > > >
> > > > > > > On Tue, Oct 15, 2024 at 06:37:58PM +0200, Tommaso Merciai wrote:
> > > > > > > > On Tue, Oct 15, 2024 at 08:16:13AM +0200, Tommaso Merciai wrote:
> > > > > > > > > On Mon, Oct 14, 2024 at 08:54:52PM +0300, Laurent Pinchart wrote:
> > > > > > > > > > On Mon, Oct 14, 2024 at 07:38:40PM +0200, Tommaso Merciai wrote:
> > > > > > > > > > > Controls can be exposed to userspace via a v4l-subdevX device, and
> > > > > > > > > > > userspace has to be able to subscribe to control events so that it is
> > > > > > > > > > > notified when the control changes value.
> > > > > > > > > > > Add missing HAS_EVENTS support: flag and .(un)subscribe_event().
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > > > > > > > > > > ---
> > > > > > > > > > >  drivers/media/i2c/ov5645.c | 10 +++++++++-
> > > > > > > > > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > > > > > > > > > > index 0c32bd2940ec..2c5145d5c616 100644
> > > > > > > > > > > --- a/drivers/media/i2c/ov5645.c
> > > > > > > > > > > +++ b/drivers/media/i2c/ov5645.c
> > > > > > > > > > > @@ -29,6 +29,7 @@
> > > > > > > > > > >  #include <linux/slab.h>
> > > > > > > > > > >  #include <linux/types.h>
> > > > > > > > > > >  #include <media/v4l2-ctrls.h>
> > > > > > > > > > > +#include <media/v4l2-event.h>
> > > > > > > > > > >  #include <media/v4l2-fwnode.h>
> > > > > > > > > > >  #include <media/v4l2-subdev.h>
> > > > > > > > > > >
> > > > > > > > > > > @@ -1034,6 +1035,11 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
> > > > > > > > > > >       .s_stream = ov5645_s_stream,
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > > +static const struct v4l2_subdev_core_ops ov5645_subdev_core_ops = {
> > > > > > > > > > > +     .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > > > > > > > > > > +     .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > >  static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> > > > > > > > > > >       .enum_mbus_code = ov5645_enum_mbus_code,
> > > > > > > > > > >       .enum_frame_size = ov5645_enum_frame_size,
> > > > > > > > > > > @@ -1043,6 +1049,7 @@ static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > >  static const struct v4l2_subdev_ops ov5645_subdev_ops = {
> > > > > > > > > > > +     .core = &ov5645_subdev_core_ops,
> > > > > > > > > > >       .video = &ov5645_video_ops,
> > > > > > > > > > >       .pad = &ov5645_subdev_pad_ops,
> > > > > > > > > > >  };
> > > > > > > > > > > @@ -1178,7 +1185,8 @@ static int ov5645_probe(struct i2c_client *client)
> > > > > > > > > > >
> > > > > > > > > > >       v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
> > > > > > > > > > >       ov5645->sd.internal_ops = &ov5645_internal_ops;
> > > > > > > > > > > -     ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > > > > > > > > > +     ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > > > > > > > > > > +                         V4L2_SUBDEV_FL_HAS_EVENTS;
> > > > > > > > > >
> > > > > > > > > > Instead of patching every subdev driver, should we handle all of this in
> > > > > > > > > > the subdev core ? If a control handler is set for the subdev, we could
> > > > > > > > > > set the HAS_EVENTS flag automatically, and default to
> > > > > > > > > > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > > > > > > > > > if there are no control operations.
> > > > > > > >
> > > > > > > > Premit:
> > > > > > > >  - Don't know if I'm wrong eh.
> > > > > > >
> > > > > > > Nobody knows :-)
> > > > > > >
> > > > > > > > This can be done into:
> > > > > > > >
> > > > > > > > __v4l2_subdev_init_finalize()
> > > > > > > >
> > > > > > > > Adding:
> > > > > > > >
> > > > > > > >     if (sd->ctrl_handler)
> > > > > > > >             sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
> > > > > > > >
> > > > > > > > And check if there are no control operations using:
> > > > > > > >
> > > > > > > > bool has_subscribe_event;
> > > > > > > > bool has_unsubscribe_event;
> > > > > > > >
> > > > > > > >
> > > > > > > > has_subscribe_event = v4l2_subdev_has_op(sd, core, subscribe_event);
> > > > > > > > has_unsubscribe_event = v4l2_subdev_has_op(sd, core, unsubscribe_event);
> > > > > > > >
> > > > > > > > if (!has_subscribe_event)
> > > > > > > >     assign v4l2_ctrl_subdev_subscribe_event as default .subscribe ops(somehow)
> > > > > > >
> > > > > > > We can't change the ops structure as it's constant. Something like this
> > > > > > > could do:
> > > > > > >
> > > > > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > > > index 3a4ba08810d2..41ae18a0d41e 100644
> > > > > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > > > > @@ -691,10 +691,24 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > > > > > >               return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
> > > > > > >
> > > > > > >       case VIDIOC_SUBSCRIBE_EVENT:
> > > > > > > -             return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
> > > > > > > +             if (v4l2_subdev_has_op(sd, core, subscribe_event))
> > > > > > > +                     return v4l2_subdev_call(sd, core, subscribe_event, vfh,
> > > > > > > +                                             arg);
> > > > > > > +             else if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
> > > > > > > +                      vfh->ctrl_handler)
> > > > > > > +                     return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> > > > > > > +             else
> > > > > > > +                     return -ENOIOCTLCMD;
> > > > > > >
> > > > > > >       case VIDIOC_UNSUBSCRIBE_EVENT:
> > > > > > > -             return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
> > > > > > > +             if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> > > > > > > +                     return -ENOIOCTLCMD;
> > > > > > > +
> > > > > > > +             if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> > > > > > > +                     return v4l2_subdev_call(sd, core, unsubscribe_event,
> > > > > > > +                                             vfh, arg);
> > > > > > > +             else
> > > > > > +                       return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
> > > > > >
> > > > > > Thanks for your "more than an hint :)"
> > > > > > I'm able to test this on ov5645:
> > > > > >
> > > > > > Adding:
> > > > > >
> > > > > > +++ b/drivers/media/i2c/ov5645.c
> > > > > > @@ -1238,6 +1238,12 @@ static int ov5645_probe(struct i2c_client *client)
> > > > > >
> > > > > >         ov5645_init_state(&ov5645->sd, NULL);
> > > > > >
> > > > > > +       ret = v4l2_subdev_init_finalize(&ov5645->sd);
> > > > > > +       if (ret < 0) {
> > > > > > +               dev_err(dev, "subdev initialization error %d\n", ret);
> > > > > > +               goto err_free_state;
> > > > > > +       }
> > > > > > +
> > > > > >         ret = v4l2_async_register_subdev(&ov5645->sd);
> > > > > >         if (ret < 0) {
> > > > > >                 dev_err(dev, "could not register v4l2 device\n");
> > > > > > @@ -1251,6 +1257,8 @@ static int ov5645_probe(struct i2c_client *client)
> > > > > >
> > > > > >         return 0;
> > > > > >
> > > > > > +err_free_state:
> > > > > > +       v4l2_subdev_cleanup(&ov5645->sd);
> > > > > >  err_pm_runtime:
> > > > > >         pm_runtime_disable(dev);
> > > > > >         pm_runtime_put_noidle(dev);
> > > > > > @@ -1272,6 +1280,7 @@ static void ov5645_remove(struct i2c_client *client)
> > > > > >
> > > > > >         v4l2_async_unregister_subdev(&ov5645->sd);
> > > > > >         media_entity_cleanup(&ov5645->sd.entity);
> > > > > > +       v4l2_subdev_cleanup(&ov5645->sd);
> > > > > >         v4l2_ctrl_handler_free(&ov5645->ctrls);
> > > > > >         pm_runtime_disable(ov5645->dev);
> > > > > >         if (!pm_runtime_status_suspended(ov5645->dev))
> > > > > >
> > > > > > Then from the compliance tool I'm getting now good results:
> > > > > >
> > > > > > Total for device /dev/v4l-subdev1: 44, Succeeded: 44, Failed: 0, Warnings: 0
> > > > > >
> > > > > > I will send these 2 patches later if you agree (1 v4l2-subdev 1 ov5645.c)
> > > > > > Thanks again.
> > > > > >
> > > > > Thank you for the patch.
> > > > > 
> > > > > I am currently working on adding support for V4L2_SUBDEV_FL_HAS_EVENTS
> > > > > and subscribe hooks[1] (and some more features [0] for ov5645 driver),
> > > > > since the patch series adds internal pad which needs rework based on
> > > > > patch series from Sakari which I will do soon and send v3 patches for
> > > > > ov5645 driver.
> > > > > 
> > > > > [0] https://lore.kernel.org/all/20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> > > > > [1] https://lore.kernel.org/all/20240910170610.226189-2-prabhakar.mahadev-lad.rj@bp.renesas.com/
> > > > 
> > > > Thanks for sharing this.
> > > > Nice! then I can drop ov5645 patch and send only v4l2-subdev patch :)
> > > > 
> > > > Plan as suggested by Laurent is:
> > > > 
> > > > "Instead of patching every subdev driver, should we handle all of this in
> > > > the subdev core ? If a control handler is set for the subdev, we could
> > > > set the HAS_EVENTS flag automatically, and default to
> > > > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > > > if there are no control operations"
> > > > 
> > > > Using:
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > index 3a4ba08810d2..fe584998f5e6 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > @@ -691,10 +691,24 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > > >                 return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
> > > > 
> > > >         case VIDIOC_SUBSCRIBE_EVENT:
> > > > -               return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
> > > > +               if (v4l2_subdev_has_op(sd, core, subscribe_event))
> > > > +                       return v4l2_subdev_call(sd, core, subscribe_event,
> > > > +                                               vfh, arg);
> > > > +               else if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
> > > 
> > > Useless use of else. Same below.
> > 
> > Better:
> > 
> > 	case VIDIOC_SUBSCRIBE_EVENT:
> > 		if (v4l2_subdev_has_op(sd, core, subscribe_event))
> > 			return v4l2_subdev_call(sd, core, subscribe_event,
> > 						vfh, arg);
> > 
> > 		return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> > 
> > 	case VIDIOC_UNSUBSCRIBE_EVENT:
> > 		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> > 			return v4l2_subdev_call(sd, core, unsubscribe_event,
> > 						vfh, arg);
> > 
> > 		return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
> > 
> > Because V4L2_SUBDEV_FL_HAS_EVENTS and vfh->ctrl_handler are already
> > check right?
> 
> v4l2_ctrl_subdev_{,un}subscribe_event() does check for the presence of the
> control handler, but return -EINVAL if one doesn't exist. We should however
> return -ENOIOCTLCMD, to indicate there's no such IOCTL if the HAS_EVENTS
> flag is missing.

Got it thanks.
I think with your review will be:

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 3a4ba08810d2..77ca829b9983 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -691,10 +691,25 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
                return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);

        case VIDIOC_SUBSCRIBE_EVENT:
-               return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
+               if (v4l2_subdev_has_op(sd, core, subscribe_event))
+                       return v4l2_subdev_call(sd, core, subscribe_event,
+                                               vfh, arg);
+
+               if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
+                    vfh->ctrl_handler)
+                       return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
+
+               return -ENOIOCTLCMD;

        case VIDIOC_UNSUBSCRIBE_EVENT:
-               return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
+               if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
+                       return -ENOIOCTLCMD;
+
+               if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
+                       return v4l2_subdev_call(sd, core, unsubscribe_event,
+                                               vfh, arg);
+
+               return v4l2_event_subdev_unsubscribe(sd, vfh, arg);

 #ifdef CONFIG_VIDEO_ADV_DEBUG
        case VIDIOC_DBG_G_REGISTER:
@@ -1641,6 +1656,9 @@ int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
                }
        }

+       if (sd->ctrl_handler)
+               sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
+
        state = __v4l2_subdev_state_alloc(sd, name, key);
        if (IS_ERR(state))
                return PTR_ERR(state);

Just dropping else.
I will send a patch later if you all agree.
Thanks All. :)

Regards,
Tommaso

> 
> > > 
> > > > +                       vfh->ctrl_handler)
> > > > +                       return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> > > > +               else
> > > > +                       return -ENOIOCTLCMD;
> > > > 
> > > >         case VIDIOC_UNSUBSCRIBE_EVENT:
> > > > -               return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
> > > > +               if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> > > > +                       return -ENOIOCTLCMD;
> > > > +
> > > > +               if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> > > > +                       return v4l2_subdev_call(sd, core, unsubscribe_event,
> > > > +                                               vfh, arg);
> > > > +               else
> > > > +                       return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
> > > > 
> > > >  #ifdef CONFIG_VIDEO_ADV_DEBUG
> > > >         case VIDIOC_DBG_G_REGISTER:
> > > > @@ -1641,6 +1655,9 @@ int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
> > > >                 }
> > > >         }
> > > > 
> > > > +       if (sd->ctrl_handler)
> > > > +               sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
> > > > +
> > > >         state = __v4l2_subdev_state_alloc(sd, name, key);
> > > >         if (IS_ERR(state))
> > > >                 return PTR_ERR(state);
> > > > 
> > > > In theory v4l2_subdev_init_finalize() and subdev_do_ioctl() will handle
> > > > this.
> > > > 
> > > > Please Laurent correct me if I'm wrong.
> > > > Prabhakar what do you think?
> > > > Thanks in advance.
> > > 
> > > Looks good to me, with the above comment.
> 
> -- 
> Kind regards,
> 
> Sakari Ailus

Thanks & Regards,
Tommaso

