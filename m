Return-Path: <linux-media+bounces-19850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 446A09A3BA0
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 12:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F34D028530E
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 10:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0116D201108;
	Fri, 18 Oct 2024 10:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIcLEAK4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B04200CA4;
	Fri, 18 Oct 2024 10:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729247643; cv=none; b=h6/aepQMGoEGaIWi3i/WFVnYA/n+hob+z4OubCconeTUhsbq6Ig3qPYntqlqKcY5WieRTXOduO/DoB38R5T2vXnW+lVFv7WzW4V+szKhqQ05U39jDMtDpSpIBqTgi9cwW0GFT9ZRmilm6QvjXG3PM4lkhQQgSmx+Xx0dkzXLWBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729247643; c=relaxed/simple;
	bh=zmSbKVWAcSH9AYjf4uvMakA4B1sD3MFz/O+twOE/xEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggH43iQZxrmzQTjgyMlGbI8lZdu0nEXaGSnOwS2OWYUSqP8Kyc6YEp3k++cH6ugQG2MrKgX3JFhc559VJNzwEBikg/PGucRsbpyeAw6YLead/uni071torGd6ejIgfbsv2JbyVmIurDXTmY6z+rdyKoYd6vGnnfZkTzvpg6UNI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIcLEAK4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729247641; x=1760783641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zmSbKVWAcSH9AYjf4uvMakA4B1sD3MFz/O+twOE/xEQ=;
  b=kIcLEAK4paGM+Pf+31P/PvzMb642WNj6Js+dZhKYWpXYaJrMlJLdC+Hr
   9rQh9Bg2yM3K+WPciyW9KIkiSp06I0+ZWPYlLzwC8mVXhWY1QDq1h9lGU
   19zZAhML1z4XkA4ONkli9+Y56ZjUzTxFSvqn5of4WN2EG3xa10KdMOZ3t
   fxNDWBtIEYPrXK8zXg8Y50WYhCKvyWJanIShOksDFN0m8/rrIDcaU3RGH
   QJx9mf5Yh/JEzZVw5+KW35K6/ipMOkNTaMjm9b0/eteddWzapE7IGk44X
   /6HCqz2JMH3bO6qDXJapaKe6pTETHkE6KDBEeyGv9OpXddeewJxxbBC7b
   Q==;
X-CSE-ConnectionGUID: N9aGddJeTxa9SLAYtFvokw==
X-CSE-MsgGUID: DuoIF646SVG9x6nJ4gKgqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28651929"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="28651929"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 03:34:01 -0700
X-CSE-ConnectionGUID: MP8sFEEBRVqtJwO4MkX8Eg==
X-CSE-MsgGUID: QZ2uT8ezSYKIXTJpMq7fLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="83468790"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 03:33:59 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D5ACA120D81;
	Fri, 18 Oct 2024 13:33:56 +0300 (EEST)
Date: Fri, 18 Oct 2024 10:33:56 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5645: add HAS_EVENTS supporty
Message-ID: <ZxI5lI1udMkN7K-_@kekkonen.localdomain>
References: <20241014173840.412695-1-tomm.merciai@gmail.com>
 <20241014175452.GB13238@pendragon.ideasonboard.com>
 <Zw4IrU8bOOtq26Gx@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <Zw6aZiBvRM5hvqVn@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20241016200836.GF30496@pendragon.ideasonboard.com>
 <ZxIoR6T6V0WgDdq0@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <CA+V-a8vw=hb+RZ_8haw30QHHRO3fzGoOZyERUba-MV3bYLTxWA@mail.gmail.com>
 <ZxI153rQ/IhCQhh1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZxI153rQ/IhCQhh1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>

Hi folks,

On Fri, Oct 18, 2024 at 12:18:15PM +0200, Tommaso Merciai wrote:
> Hi Prabhakar,
> Thanks for your comments.
> 
> On Fri, Oct 18, 2024 at 10:57:49AM +0100, Lad, Prabhakar wrote:
> > Hi Tommaso,
> > 
> > On Fri, Oct 18, 2024 at 10:28 AM Tommaso Merciai <tomm.merciai@gmail.com> wrote:
> > >
> > > Hi Laurent,
> > >
> > > On Wed, Oct 16, 2024 at 11:08:36PM +0300, Laurent Pinchart wrote:
> > > > Hi Tommaso,
> > > >
> > > > On Tue, Oct 15, 2024 at 06:37:58PM +0200, Tommaso Merciai wrote:
> > > > > On Tue, Oct 15, 2024 at 08:16:13AM +0200, Tommaso Merciai wrote:
> > > > > > On Mon, Oct 14, 2024 at 08:54:52PM +0300, Laurent Pinchart wrote:
> > > > > > > On Mon, Oct 14, 2024 at 07:38:40PM +0200, Tommaso Merciai wrote:
> > > > > > > > Controls can be exposed to userspace via a v4l-subdevX device, and
> > > > > > > > userspace has to be able to subscribe to control events so that it is
> > > > > > > > notified when the control changes value.
> > > > > > > > Add missing HAS_EVENTS support: flag and .(un)subscribe_event().
> > > > > > > >
> > > > > > > > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > > > > > > > ---
> > > > > > > >  drivers/media/i2c/ov5645.c | 10 +++++++++-
> > > > > > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > > > > > > > index 0c32bd2940ec..2c5145d5c616 100644
> > > > > > > > --- a/drivers/media/i2c/ov5645.c
> > > > > > > > +++ b/drivers/media/i2c/ov5645.c
> > > > > > > > @@ -29,6 +29,7 @@
> > > > > > > >  #include <linux/slab.h>
> > > > > > > >  #include <linux/types.h>
> > > > > > > >  #include <media/v4l2-ctrls.h>
> > > > > > > > +#include <media/v4l2-event.h>
> > > > > > > >  #include <media/v4l2-fwnode.h>
> > > > > > > >  #include <media/v4l2-subdev.h>
> > > > > > > >
> > > > > > > > @@ -1034,6 +1035,11 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
> > > > > > > >       .s_stream = ov5645_s_stream,
> > > > > > > >  };
> > > > > > > >
> > > > > > > > +static const struct v4l2_subdev_core_ops ov5645_subdev_core_ops = {
> > > > > > > > +     .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > > > > > > > +     .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > > > > > > > +};
> > > > > > > > +
> > > > > > > >  static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> > > > > > > >       .enum_mbus_code = ov5645_enum_mbus_code,
> > > > > > > >       .enum_frame_size = ov5645_enum_frame_size,
> > > > > > > > @@ -1043,6 +1049,7 @@ static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> > > > > > > >  };
> > > > > > > >
> > > > > > > >  static const struct v4l2_subdev_ops ov5645_subdev_ops = {
> > > > > > > > +     .core = &ov5645_subdev_core_ops,
> > > > > > > >       .video = &ov5645_video_ops,
> > > > > > > >       .pad = &ov5645_subdev_pad_ops,
> > > > > > > >  };
> > > > > > > > @@ -1178,7 +1185,8 @@ static int ov5645_probe(struct i2c_client *client)
> > > > > > > >
> > > > > > > >       v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
> > > > > > > >       ov5645->sd.internal_ops = &ov5645_internal_ops;
> > > > > > > > -     ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > > > > > > +     ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > > > > > > > +                         V4L2_SUBDEV_FL_HAS_EVENTS;
> > > > > > >
> > > > > > > Instead of patching every subdev driver, should we handle all of this in
> > > > > > > the subdev core ? If a control handler is set for the subdev, we could
> > > > > > > set the HAS_EVENTS flag automatically, and default to
> > > > > > > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > > > > > > if there are no control operations.
> > > > >
> > > > > Premit:
> > > > >  - Don't know if I'm wrong eh.
> > > >
> > > > Nobody knows :-)
> > > >
> > > > > This can be done into:
> > > > >
> > > > > __v4l2_subdev_init_finalize()
> > > > >
> > > > > Adding:
> > > > >
> > > > >     if (sd->ctrl_handler)
> > > > >             sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
> > > > >
> > > > > And check if there are no control operations using:
> > > > >
> > > > > bool has_subscribe_event;
> > > > > bool has_unsubscribe_event;
> > > > >
> > > > >
> > > > > has_subscribe_event = v4l2_subdev_has_op(sd, core, subscribe_event);
> > > > > has_unsubscribe_event = v4l2_subdev_has_op(sd, core, unsubscribe_event);
> > > > >
> > > > > if (!has_subscribe_event)
> > > > >     assign v4l2_ctrl_subdev_subscribe_event as default .subscribe ops(somehow)
> > > >
> > > > We can't change the ops structure as it's constant. Something like this
> > > > could do:
> > > >
> > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > index 3a4ba08810d2..41ae18a0d41e 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > @@ -691,10 +691,24 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > > >               return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
> > > >
> > > >       case VIDIOC_SUBSCRIBE_EVENT:
> > > > -             return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
> > > > +             if (v4l2_subdev_has_op(sd, core, subscribe_event))
> > > > +                     return v4l2_subdev_call(sd, core, subscribe_event, vfh,
> > > > +                                             arg);
> > > > +             else if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
> > > > +                      vfh->ctrl_handler)
> > > > +                     return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> > > > +             else
> > > > +                     return -ENOIOCTLCMD;
> > > >
> > > >       case VIDIOC_UNSUBSCRIBE_EVENT:
> > > > -             return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
> > > > +             if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> > > > +                     return -ENOIOCTLCMD;
> > > > +
> > > > +             if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> > > > +                     return v4l2_subdev_call(sd, core, unsubscribe_event,
> > > > +                                             vfh, arg);
> > > > +             else
> > > +                       return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
> > >
> > > Thanks for your "more than an hint :)"
> > > I'm able to test this on ov5645:
> > >
> > > Adding:
> > >
> > > +++ b/drivers/media/i2c/ov5645.c
> > > @@ -1238,6 +1238,12 @@ static int ov5645_probe(struct i2c_client *client)
> > >
> > >         ov5645_init_state(&ov5645->sd, NULL);
> > >
> > > +       ret = v4l2_subdev_init_finalize(&ov5645->sd);
> > > +       if (ret < 0) {
> > > +               dev_err(dev, "subdev initialization error %d\n", ret);
> > > +               goto err_free_state;
> > > +       }
> > > +
> > >         ret = v4l2_async_register_subdev(&ov5645->sd);
> > >         if (ret < 0) {
> > >                 dev_err(dev, "could not register v4l2 device\n");
> > > @@ -1251,6 +1257,8 @@ static int ov5645_probe(struct i2c_client *client)
> > >
> > >         return 0;
> > >
> > > +err_free_state:
> > > +       v4l2_subdev_cleanup(&ov5645->sd);
> > >  err_pm_runtime:
> > >         pm_runtime_disable(dev);
> > >         pm_runtime_put_noidle(dev);
> > > @@ -1272,6 +1280,7 @@ static void ov5645_remove(struct i2c_client *client)
> > >
> > >         v4l2_async_unregister_subdev(&ov5645->sd);
> > >         media_entity_cleanup(&ov5645->sd.entity);
> > > +       v4l2_subdev_cleanup(&ov5645->sd);
> > >         v4l2_ctrl_handler_free(&ov5645->ctrls);
> > >         pm_runtime_disable(ov5645->dev);
> > >         if (!pm_runtime_status_suspended(ov5645->dev))
> > >
> > > Then from the compliance tool I'm getting now good results:
> > >
> > > Total for device /dev/v4l-subdev1: 44, Succeeded: 44, Failed: 0, Warnings: 0
> > >
> > > I will send these 2 patches later if you agree (1 v4l2-subdev 1 ov5645.c)
> > > Thanks again.
> > >
> > Thank you for the patch.
> > 
> > I am currently working on adding support for V4L2_SUBDEV_FL_HAS_EVENTS
> > and subscribe hooks[1] (and some more features [0] for ov5645 driver),
> > since the patch series adds internal pad which needs rework based on
> > patch series from Sakari which I will do soon and send v3 patches for
> > ov5645 driver.
> > 
> > [0] https://lore.kernel.org/all/20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> > [1] https://lore.kernel.org/all/20240910170610.226189-2-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> Thanks for sharing this.
> Nice! then I can drop ov5645 patch and send only v4l2-subdev patch :)
> 
> Plan as suggested by Laurent is:
> 
> "Instead of patching every subdev driver, should we handle all of this in
> the subdev core ? If a control handler is set for the subdev, we could
> set the HAS_EVENTS flag automatically, and default to
> v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> if there are no control operations"
> 
> Using:
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 3a4ba08810d2..fe584998f5e6 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -691,10 +691,24 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>                 return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
> 
>         case VIDIOC_SUBSCRIBE_EVENT:
> -               return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
> +               if (v4l2_subdev_has_op(sd, core, subscribe_event))
> +                       return v4l2_subdev_call(sd, core, subscribe_event,
> +                                               vfh, arg);
> +               else if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&

Useless use of else. Same below.

> +                       vfh->ctrl_handler)
> +                       return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> +               else
> +                       return -ENOIOCTLCMD;
> 
>         case VIDIOC_UNSUBSCRIBE_EVENT:
> -               return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
> +               if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> +                       return -ENOIOCTLCMD;
> +
> +               if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> +                       return v4l2_subdev_call(sd, core, unsubscribe_event,
> +                                               vfh, arg);
> +               else
> +                       return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
> 
>  #ifdef CONFIG_VIDEO_ADV_DEBUG
>         case VIDIOC_DBG_G_REGISTER:
> @@ -1641,6 +1655,9 @@ int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
>                 }
>         }
> 
> +       if (sd->ctrl_handler)
> +               sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
> +
>         state = __v4l2_subdev_state_alloc(sd, name, key);
>         if (IS_ERR(state))
>                 return PTR_ERR(state);
> 
> In theory v4l2_subdev_init_finalize() and subdev_do_ioctl() will handle
> this.
> 
> Please Laurent correct me if I'm wrong.
> Prabhakar what do you think?
> Thanks in advance.

Looks good to me, with the above comment.

-- 
Kind regards,

Sakari Ailus

