Return-Path: <linux-media+bounces-19845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5539A39CC
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 11:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CBD0B2354D
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 09:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039611EE030;
	Fri, 18 Oct 2024 09:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPlW4y9n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D05190665;
	Fri, 18 Oct 2024 09:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729243213; cv=none; b=H6I77zC6dvQfcBQD442jjaSIImpmWzH+0uiG1DXrMtu9uM529N65rwvqq5lbwH7itedN4A25KOqiEC5pWnNHY0hmK7oDQimwq6hX7ToUUZLiTZPQn26ZLOas/3iSRJIn3SwIsjYdNVHhvDdFqfcOoJ181WW3xJxtljQdGje8rlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729243213; c=relaxed/simple;
	bh=0Q2KDEP0qq3PAiq/FDJibeD0M+vUwjUeKaUtocNKyOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhFEOuk4cIAB5HoDrb3Ve1aBuu5r1cpLBDzWtr+m6F1pl1ToLX7Osy9rfCsOIrq87NEDgmYntei3GDN/LzhxUFHDRn+IX8yet1wm1bvcmGTUpIusgMKdXxmkoGftYNEv7nH/ypeAxca1WAB0501Y4UNja6GXa80mRGswAz9Sr8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPlW4y9n; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4314f38d274so24613135e9.1;
        Fri, 18 Oct 2024 02:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729243210; x=1729848010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oxu7aS4Jv02dvxySCdMe6qqTPQFuzAQt/P2vOVwqeLs=;
        b=GPlW4y9nzEhQV/UM/0ItXAzuBBbj8Qq+0l/90vW7JOWzVTtpK6UHFslmjwjhm2d+Fn
         TWggR95Ok1puSHW+aH7roXIksIXYg6I1zm+qTmmgi5Fzmxsv1iZfCKgvSeyrn/H7Fcx9
         77G9s/xK8uf9mpuFYdABi3zN2sOBk6/fquftAsK/vlrCvsUw6AptcSQyI6XhqxqCt05D
         tcoAuGfvs4PHeJJbsHM6gXB0WxApw774w8yYDbF/A7SCY4L8VcxnI2/9ma99anWLmSEm
         x4LEBoAKE1ghao8tVjbuI5unr/53JVCOzzJ/xzl2wJx/cvT3+DdpF/h9WcQMV3tLFh+h
         9Zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729243210; x=1729848010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oxu7aS4Jv02dvxySCdMe6qqTPQFuzAQt/P2vOVwqeLs=;
        b=P3CoZWoW5GZIq+ZBmrJ7csczE23haZzG7LM8XX7gBsSgey+GRV9oqkcCnHZoXGW9k+
         ElmOe6pSeqFahRGX3qEPQHKB5rLmJd9+yMibeoGvZe+mSVJh1ll6FCs2MmmRJ3N/7D7c
         3F2uk8n2/MRFw4yU8hIwVwtnLjgYuQYUdTiDakpl4dZ43a6Gd+fIIeZzkW8dORoB/KeQ
         FlViI5FLDJGLchfQp6zuOBF6NjNkyBOC/XJYRd5a1zUjcNOb4LrwWM+eks+FUs6qPE09
         F9389w4Gubv2ub35VV8PHD02u3uQ82QrifUasJJANhpxNimD+i1Z7CMsVppHKTQf/GJS
         76kw==
X-Forwarded-Encrypted: i=1; AJvYcCV/mgZo0FL/W/PGxc+gDcHXF0jkUl/yKwTQviGOOIhIou1vec2PEixH1dDzGiVByZLxDPbwrOeTGUt2dns=@vger.kernel.org, AJvYcCWIWL3t4nPEi2yeFZtpUPPgnk3UUmKCjzC5iAYohMxrwRHfT5mIBBdj2g/bqGtDulRXwFC31uukfS6f2qI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhwhyx+i5hPnT85+hL23Hu4C004TtTq+wYFEbKZ1s672tV7WBi
	BN4WB/6wjnn8Z8pKVMr+pEGOyL75krF9XGXAA9u2AGJTaXZaqMnu
X-Google-Smtp-Source: AGHT+IEzesBa7EdinoBbue9zF/6mRcpA92tyNukPTgU3ZZhCU3Hx3wKED8/AwnFcpiT8PwGZB1Cd1g==
X-Received: by 2002:a05:600c:3b1e:b0:42c:a8cb:6a5a with SMTP id 5b1f17b1804b1-43161636cd1mr17115065e9.15.1729243209528;
        Fri, 18 Oct 2024 02:20:09 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-51-176.cust.vodafonedsl.it. [188.217.51.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e4424asm18495345e9.32.2024.10.18.02.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 02:20:09 -0700 (PDT)
Date: Fri, 18 Oct 2024 11:20:07 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5645: add HAS_EVENTS supporty
Message-ID: <ZxIoR6T6V0WgDdq0@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20241014173840.412695-1-tomm.merciai@gmail.com>
 <20241014175452.GB13238@pendragon.ideasonboard.com>
 <Zw4IrU8bOOtq26Gx@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <Zw6aZiBvRM5hvqVn@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20241016200836.GF30496@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016200836.GF30496@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Oct 16, 2024 at 11:08:36PM +0300, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> On Tue, Oct 15, 2024 at 06:37:58PM +0200, Tommaso Merciai wrote:
> > On Tue, Oct 15, 2024 at 08:16:13AM +0200, Tommaso Merciai wrote:
> > > On Mon, Oct 14, 2024 at 08:54:52PM +0300, Laurent Pinchart wrote:
> > > > On Mon, Oct 14, 2024 at 07:38:40PM +0200, Tommaso Merciai wrote:
> > > > > Controls can be exposed to userspace via a v4l-subdevX device, and
> > > > > userspace has to be able to subscribe to control events so that it is
> > > > > notified when the control changes value.
> > > > > Add missing HAS_EVENTS support: flag and .(un)subscribe_event().
> > > > > 
> > > > > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > > > > ---
> > > > >  drivers/media/i2c/ov5645.c | 10 +++++++++-
> > > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > > > > index 0c32bd2940ec..2c5145d5c616 100644
> > > > > --- a/drivers/media/i2c/ov5645.c
> > > > > +++ b/drivers/media/i2c/ov5645.c
> > > > > @@ -29,6 +29,7 @@
> > > > >  #include <linux/slab.h>
> > > > >  #include <linux/types.h>
> > > > >  #include <media/v4l2-ctrls.h>
> > > > > +#include <media/v4l2-event.h>
> > > > >  #include <media/v4l2-fwnode.h>
> > > > >  #include <media/v4l2-subdev.h>
> > > > >  
> > > > > @@ -1034,6 +1035,11 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
> > > > >  	.s_stream = ov5645_s_stream,
> > > > >  };
> > > > >  
> > > > > +static const struct v4l2_subdev_core_ops ov5645_subdev_core_ops = {
> > > > > +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > > > > +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > > > > +};
> > > > > +
> > > > >  static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> > > > >  	.enum_mbus_code = ov5645_enum_mbus_code,
> > > > >  	.enum_frame_size = ov5645_enum_frame_size,
> > > > > @@ -1043,6 +1049,7 @@ static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> > > > >  };
> > > > >  
> > > > >  static const struct v4l2_subdev_ops ov5645_subdev_ops = {
> > > > > +	.core = &ov5645_subdev_core_ops,
> > > > >  	.video = &ov5645_video_ops,
> > > > >  	.pad = &ov5645_subdev_pad_ops,
> > > > >  };
> > > > > @@ -1178,7 +1185,8 @@ static int ov5645_probe(struct i2c_client *client)
> > > > >  
> > > > >  	v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
> > > > >  	ov5645->sd.internal_ops = &ov5645_internal_ops;
> > > > > -	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > > > +	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > > > > +			    V4L2_SUBDEV_FL_HAS_EVENTS;
> > > > 
> > > > Instead of patching every subdev driver, should we handle all of this in
> > > > the subdev core ? If a control handler is set for the subdev, we could
> > > > set the HAS_EVENTS flag automatically, and default to
> > > > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > > > if there are no control operations.
> > 
> > Premit:
> >  - Don't know if I'm wrong eh.
> 
> Nobody knows :-)
> 
> > This can be done into:
> > 
> > __v4l2_subdev_init_finalize()
> > 
> > Adding:
> > 
> > 	if (sd->ctrl_handler)
> > 		sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
> > 
> > And check if there are no control operations using:
> > 
> > bool has_subscribe_event;
> > bool has_unsubscribe_event;
> > 
> > 
> > has_subscribe_event = v4l2_subdev_has_op(sd, core, subscribe_event);
> > has_unsubscribe_event = v4l2_subdev_has_op(sd, core, unsubscribe_event);
> > 
> > if (!has_subscribe_event)
> > 	assign v4l2_ctrl_subdev_subscribe_event as default .subscribe ops(somehow)
> 
> We can't change the ops structure as it's constant. Something like this
> could do:
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 3a4ba08810d2..41ae18a0d41e 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -691,10 +691,24 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
> 
>  	case VIDIOC_SUBSCRIBE_EVENT:
> -		return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
> +		if (v4l2_subdev_has_op(sd, core, subscribe_event))
> +			return v4l2_subdev_call(sd, core, subscribe_event, vfh,
> +						arg);
> +		else if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
> +			 vfh->ctrl_handler)
> +			return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> +		else
> +			return -ENOIOCTLCMD;
> 
>  	case VIDIOC_UNSUBSCRIBE_EVENT:
> -		return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
> +		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> +			return -ENOIOCTLCMD;
> +
> +		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> +			return v4l2_subdev_call(sd, core, unsubscribe_event,
> +						vfh, arg);
> +		else
+			return v4l2_event_subdev_unsubscribe(sd, vfh, arg);

Thanks for your "more than an hint :)"
I'm able to test this on ov5645:

Adding:

+++ b/drivers/media/i2c/ov5645.c
@@ -1238,6 +1238,12 @@ static int ov5645_probe(struct i2c_client *client)
 
        ov5645_init_state(&ov5645->sd, NULL);
 
+       ret = v4l2_subdev_init_finalize(&ov5645->sd);
+       if (ret < 0) {
+               dev_err(dev, "subdev initialization error %d\n", ret);
+               goto err_free_state;
+       }
+
        ret = v4l2_async_register_subdev(&ov5645->sd);
        if (ret < 0) {
                dev_err(dev, "could not register v4l2 device\n");
@@ -1251,6 +1257,8 @@ static int ov5645_probe(struct i2c_client *client)
 
        return 0;
 
+err_free_state:
+       v4l2_subdev_cleanup(&ov5645->sd);
 err_pm_runtime:
        pm_runtime_disable(dev);
        pm_runtime_put_noidle(dev);
@@ -1272,6 +1280,7 @@ static void ov5645_remove(struct i2c_client *client)
 
        v4l2_async_unregister_subdev(&ov5645->sd);
        media_entity_cleanup(&ov5645->sd.entity);
+       v4l2_subdev_cleanup(&ov5645->sd);
        v4l2_ctrl_handler_free(&ov5645->ctrls);
        pm_runtime_disable(ov5645->dev);
        if (!pm_runtime_status_suspended(ov5645->dev))

Then from the compliance tool I'm getting now good results:

Total for device /dev/v4l-subdev1: 44, Succeeded: 44, Failed: 0, Warnings: 0

I will send these 2 patches later if you agree (1 v4l2-subdev 1 ov5645.c)
Thanks again.

Regards,
Tommaso

> 
>  #ifdef CONFIG_VIDEO_ADV_DEBUG
>  	case VIDIOC_DBG_G_REGISTER:
> 
> > if (!has_unsubscribe_event)
> > 	assign v4l2_event_subdev_unsubscribe as default .unsubscribe ops (somehow)
> > 
> > 
> > Or maybe v4l2_subdev_init_finalize() it's too late?
> > I'm completely wrong? What do you think?
> 
> I like v4l2_subdev_init_finalize() as we're pushing all subdev drivers
> to use it, so it's an extra incentive.
> 
> > > Well :)
> > > Not every subdev drivers, but only the ones I'm testing.
> > > 
> > > Yesterday I was playing with ov5645 :) And I got:
> > > 
> > > v4l2-compliance -d /dev/v4l-subdev1
> > > 
> > > test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> > > fail: v4l2-test-controls.cpp(1108): subscribe event for control 'User Controls' failed
> > > 
> > > Joke apart fully agree and thanks for your hint!
> > > I will take  a look :)
> > > 
> > > > >  	ov5645->pad.flags = MEDIA_PAD_FL_SOURCE;
> > > > >  	ov5645->sd.dev = &client->dev;
> > > > >  	ov5645->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> 
> -- 
> Regards,
> 
> Laurent Pinchart

