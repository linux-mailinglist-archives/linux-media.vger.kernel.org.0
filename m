Return-Path: <linux-media+bounces-19689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA2B99F2DB
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 18:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 503FD1C20F54
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 16:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B9B1F76A5;
	Tue, 15 Oct 2024 16:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuVlxedn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64CE1F669D;
	Tue, 15 Oct 2024 16:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729010284; cv=none; b=ndgaMqCU4AkE//OD/BFkzUgl4r6VT5XCmu5DeC+6ABrW7oIiD/pjmxzjsMNUoPAxbIpZOMv0TzGwkiZ9SiD0liyi5oQMQIG2ruS5pC2fkyiK/ix8ri1m5QrEntcmlCa+9y7mQ0f9BrAz3Pcbkes6syTk16uvYGKnVJO0pRZqEg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729010284; c=relaxed/simple;
	bh=8w1iR0zvbN/ZBwNVvoBGf+AClDWD7hdnukw2E795tTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYw5Buj69x8oPtFF6ACjvuCF/Vc7iEzzXguIT2+9lZ3YKZp8yjUKy8RVB5lUCQ5QWFVGFC3ISmRfSLMIkQ2t4NmI+bxJjGPdDKlci+6vsfr59Cyuq959tiVPyW2PRqI3s+jUp3XG8H5AbOrfH+ssW2FI7jOGf6VjhKJ+hYiJTjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuVlxedn; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43116f8a3c9so63965995e9.1;
        Tue, 15 Oct 2024 09:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729010281; x=1729615081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=moWlBlhIq7J94/Ccf7u63ctUmFKrHYk781of5hC/ErM=;
        b=iuVlxednNSo9j13qlJ5BDiRDSfvkp53yUvL5/ifSnj28p2HT8RVbkbMKCwefy2kFgu
         WY+JRckrBswPednzHf4gQLycp6dLp7tKrak+EaQvYxVAeSbhEGIZnq/Ow16qSggi6krS
         282MvzIVgX4G4CdxmQXEORvl+xbFYcxUoOvh+6mdBM/JOgmYKcX93Llb+SrQ6s53IsMj
         Iyo/mVFRC60h3jRsm/9KUI8ZzUGdtM5GNWbI2Ri9UJ3h2JLl89qD5/bYhV6Wsse0hW70
         0NKrpeylsoGKI+HDa+XbC3PEago8WpLQaq4Va3j9ZewnLgxygO7F5LnkeBc7OR+/y/ZA
         sFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729010281; x=1729615081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moWlBlhIq7J94/Ccf7u63ctUmFKrHYk781of5hC/ErM=;
        b=dbxY6L88KelCcxS0iHfG4UBEUaiUBCcOdkbDcftvX6CHQyeW+duIyRdbuZ/kcUvbHg
         qONWQk2W4p9mAog8RRWH2flJlKmmoK3dAJTfUWSmsR1hvzNBkdXFPIT5XhKZoYbF6wuw
         xFJ4f3UrPoWPfNVSaxcX/DD4pGjCZpFhTAeSqfNF0+d0k8WvjIvRJphiY2zRAbBIkQaO
         6QklGT6GKili+aH1JLTQ/+S9rIQiZfphK5mdyHR9ik493Z1VAux1AvCVIDlMb4F0rLHg
         uffNl+8BCMaGGUNj3QSR70cqeeMFiIVMmcDwh0hQu33BV1WdC1jQ5/NhdynCsc7o7c0s
         xRDg==
X-Forwarded-Encrypted: i=1; AJvYcCX9bDIZ1L+D6eyEoc5vndG0tHVY19hS2AAp3K0REkF6ZaQHtuO0OtmUt1PlqyD/I9dZafcGqCfO4WUn97U=@vger.kernel.org, AJvYcCXOb3j85rh7MlBI5VQkpfBejYJH1GirM7eUxuSuflnFrWmsgutNC316JDBZmt0SgCMXgIHchsuS2z62wk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPaBbR/WGIJNMU93n+JN1sOQQL+alvlJ8KDmeOINJJun9oACmv
	Ju7KMaP8ZJNtN8g5ivEvYwsBRWuMP2ui+ENkmt2tEuBvtjZdJiI0
X-Google-Smtp-Source: AGHT+IEcWMsnKPI6HT0uwlX3pmhBkujJurKR7Ja7//+CAfgI3UsAw38unOHFS8032B+cHlh2g7/a/g==
X-Received: by 2002:a05:600c:1c9e:b0:42c:b508:750e with SMTP id 5b1f17b1804b1-431255dae1bmr137566665e9.11.1729010280743;
        Tue, 15 Oct 2024 09:38:00 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-51-176.cust.vodafonedsl.it. [188.217.51.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f6c63c2sm22706175e9.47.2024.10.15.09.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 09:38:00 -0700 (PDT)
Date: Tue, 15 Oct 2024 18:37:58 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5645: add HAS_EVENTS supporty
Message-ID: <Zw6aZiBvRM5hvqVn@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20241014173840.412695-1-tomm.merciai@gmail.com>
 <20241014175452.GB13238@pendragon.ideasonboard.com>
 <Zw4IrU8bOOtq26Gx@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw4IrU8bOOtq26Gx@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>

Hi Laurent,
Back on the topic.

On Tue, Oct 15, 2024 at 08:16:13AM +0200, Tommaso Merciai wrote:
> Hi Laurent,
> Thanks for your review.
> 
> On Mon, Oct 14, 2024 at 08:54:52PM +0300, Laurent Pinchart wrote:
> > Hi Tommaso,
> > 
> > Thank you for the patch.
> > 
> > On Mon, Oct 14, 2024 at 07:38:40PM +0200, Tommaso Merciai wrote:
> > > Controls can be exposed to userspace via a v4l-subdevX device, and
> > > userspace has to be able to subscribe to control events so that it is
> > > notified when the control changes value.
> > > Add missing HAS_EVENTS support: flag and .(un)subscribe_event().
> > > 
> > > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > > ---
> > >  drivers/media/i2c/ov5645.c | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > > index 0c32bd2940ec..2c5145d5c616 100644
> > > --- a/drivers/media/i2c/ov5645.c
> > > +++ b/drivers/media/i2c/ov5645.c
> > > @@ -29,6 +29,7 @@
> > >  #include <linux/slab.h>
> > >  #include <linux/types.h>
> > >  #include <media/v4l2-ctrls.h>
> > > +#include <media/v4l2-event.h>
> > >  #include <media/v4l2-fwnode.h>
> > >  #include <media/v4l2-subdev.h>
> > >  
> > > @@ -1034,6 +1035,11 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
> > >  	.s_stream = ov5645_s_stream,
> > >  };
> > >  
> > > +static const struct v4l2_subdev_core_ops ov5645_subdev_core_ops = {
> > > +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > > +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > > +};
> > > +
> > >  static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> > >  	.enum_mbus_code = ov5645_enum_mbus_code,
> > >  	.enum_frame_size = ov5645_enum_frame_size,
> > > @@ -1043,6 +1049,7 @@ static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> > >  };
> > >  
> > >  static const struct v4l2_subdev_ops ov5645_subdev_ops = {
> > > +	.core = &ov5645_subdev_core_ops,
> > >  	.video = &ov5645_video_ops,
> > >  	.pad = &ov5645_subdev_pad_ops,
> > >  };
> > > @@ -1178,7 +1185,8 @@ static int ov5645_probe(struct i2c_client *client)
> > >  
> > >  	v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
> > >  	ov5645->sd.internal_ops = &ov5645_internal_ops;
> > > -	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > +	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > > +			    V4L2_SUBDEV_FL_HAS_EVENTS;
> > 
> > Instead of patching every subdev driver, should we handle all of this in
> > the subdev core ? If a control handler is set for the subdev, we could
> > set the HAS_EVENTS flag automatically, and default to
> > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > if there are no control operations.

Premit:
 - Don't know if I'm wrong eh.

This can be done into:

__v4l2_subdev_init_finalize()

Adding:

	if (sd->ctrl_handler)
		sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;

And check if there are no control operations using:

bool has_subscribe_event;
bool has_unsubscribe_event;


has_subscribe_event = v4l2_subdev_has_op(sd, core, subscribe_event);
has_unsubscribe_event = v4l2_subdev_has_op(sd, core, unsubscribe_event);

if (!has_subscribe_event)
	assign v4l2_ctrl_subdev_subscribe_event as default .subscribe ops(somehow)

if (!has_unsubscribe_event)
	assign v4l2_event_subdev_unsubscribe as default .unsubscribe ops (somehow)


Or maybe v4l2_subdev_init_finalize() it's too late?
I'm completely wrong? What do you think?

Thanks in advance,
Tommaso

> 
> Well :)
> Not every subdev drivers, but only the ones I'm testing.
> 
> Yesterday I was playing with ov5645 :) And I got:
> 
> v4l2-compliance -d /dev/v4l-subdev1
> 
> test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> fail: v4l2-test-controls.cpp(1108): subscribe event for control 'User Controls' failed
> 
> Joke apart fully agree and thanks for your hint!
> I will take  a look :)
> 
> > 
> > >  	ov5645->pad.flags = MEDIA_PAD_FL_SOURCE;
> > >  	ov5645->sd.dev = &client->dev;
> > >  	ov5645->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > 
> > -- 
> > Regards,
> > 
> > Laurent Pinchart
> 
> Thanks & Regards,
> Tommaso

