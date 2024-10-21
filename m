Return-Path: <linux-media+bounces-19976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C177E9A5E47
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 10:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E03B01C21517
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 08:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B849E1E1C03;
	Mon, 21 Oct 2024 08:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4MqpvlP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166A81E0E11;
	Mon, 21 Oct 2024 08:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729498385; cv=none; b=WhE89Ux33K+YX/goNPtgj//VSfYfaV+DtX9CIhsm40WZul3ozmPqi9IXpJbIUGz8XAPzH8fkP+Vv9RsXmYU3qTRcPSiAnvIOl+yxnr/rp3sumZcEJCSwfutjlvhhQiYz1oSDwWigMOKrVt5gwQyfFwFtJ+rWREpIyw/kSfpxJ90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729498385; c=relaxed/simple;
	bh=VxGqKEGCnBkJCvO3qGHM5rWV2Hs+c2kSKdV7faUoDJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnWJSmiyFPk9Upd8ECerfu2acgZoooflOGSTYT8A+VbHopj1XAkkxUMHyk5dcSzZ/5FjeI1G1EU9XXapPjEIaN8QAN12IqfbxVZ8Pn6da+3NSd57rnl2GZtO69+qacALIPKKxO3lJKUG8yWFRaoyntSeO0j0lQ1mWWRfhNvkGg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4MqpvlP; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9a850270e2so293127466b.0;
        Mon, 21 Oct 2024 01:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729498381; x=1730103181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g9Ky9EMNkbbRjWKUs8mDwmXwg2t/TZHXkf923bR2tnY=;
        b=C4MqpvlPOATgJ+vF6qk8F4f6BbVMyYcl//WNunQln7wUJdotdw8o9WBsBkdU0vUMOc
         RmHc05E81QfggAI/bVVC7IJiujtCePz6f/TpAcbljhp9AqYDzzfU6ldi95+lvqJfvXK3
         jd5E+CzIiea3O3InIUdIEM90NsbN/HV+/63hfaz70tFtCgBUbIscoS/x/9j9Qz+QUOhF
         NI8GX+3In7j1vB34Uz2zRQcXI8hBLKPs8iQtbWOd+sr1Jcq0rtrTPwWTtl+cP9AC2FdM
         2YEPQBv3ZpCegBd9HP2xRpDOy/tZVLGojXZJce+OXDXFatebhzyOuP1/wqbuvlvBP7P/
         y+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729498381; x=1730103181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9Ky9EMNkbbRjWKUs8mDwmXwg2t/TZHXkf923bR2tnY=;
        b=kLkytdUO0PGklBDkPiMhzcAbS+WunU1jD2C2zC9Jhq+3tj1E/kcimtX6Tm2nQsgzHn
         C8yLUrxSSkFsu6VuZ/n6t88P/P5sYYYvh8pJXklCJ7Igy8LAS20QVXqd7we4JDayL5TV
         3vaDBJduZFu/rRo2lMNvcfM+ZqLXa3TfgYyQkAJkj2YHbZxvkZYfxgBFMTw7/ckMLaSk
         HCmUTw+TavO5qJrnNEPK+KecXDghr5TPUawHGBfC27ZcfEe9ObQ5z0UIpXKkvbzegjNd
         paXQMyvZ53SkXXMLlBy3mgkbCYPZ92KWjK8eRpHfN/yWVOUw4mRM8UDBcqEIVtGj5le8
         U6cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb/u7e279hwbLYMsOInLZ/Ejke3uXdmo4juHq+UhPsLTcchlWFMzCixhK0FKSOLrbLYwxm/zEltGnxk/o=@vger.kernel.org, AJvYcCWi1gxlLWL+UX0kd0oFx2sWi6pGYGOrk6jvQq1CuB2DvzlDu6CTbZINNptc8JpR3ST6LAHCiKMa3doWC94=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvz+/IhTQjYUZyAdfkr5I7k07JVcqDY4JtZ8ZNbzlJSbdR8r/g
	OQ7aQNqIt5nKa/eDPlIFKxyC3JBuBy18ghQpO+x6ZmkjbGTgwhuc
X-Google-Smtp-Source: AGHT+IE7AznbKuRbPEcL50uPSYz10OJVhjTCkxblruqPL518uSHr3Vnx+XV+D1ZorUI0J7TcH2Ex6g==
X-Received: by 2002:a17:907:1c26:b0:a99:3c32:b538 with SMTP id a640c23a62f3a-a9a69cccdd9mr1238237066b.42.1729498381003;
        Mon, 21 Oct 2024 01:13:01 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-51-176.cust.vodafonedsl.it. [188.217.51.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a915720fesm173285166b.167.2024.10.21.01.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 01:13:00 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:12:58 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-subdev: Refactor events
Message-ID: <ZxYNCmZhGTICDfDC@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20241020163534.1720297-1-tomm.merciai@gmail.com>
 <20241020164354.GG7770@pendragon.ideasonboard.com>
 <ZxX2SVl/p0i7Nemi@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20241021073034.GC14328@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021073034.GC14328@pendragon.ideasonboard.com>

On Mon, Oct 21, 2024 at 10:30:34AM +0300, Laurent Pinchart wrote:
> On Mon, Oct 21, 2024 at 08:35:53AM +0200, Tommaso Merciai wrote:
> > Hi Laurent,
> > Thanks for your review.
> > 
> > On Sun, Oct 20, 2024 at 07:43:54PM +0300, Laurent Pinchart wrote:
> > > Hi Tommaso,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Sun, Oct 20, 2024 at 06:35:32PM +0200, Tommaso Merciai wrote:
> > > > Controls can be exposed to userspace via a v4l-subdevX device, and
> > > > userspace has to be able to subscribe to control events so that it is
> > > > notified when the control changes value.
> > > > If a control handler is set for the subdev then set the HAS_EVENTS
> > > > flag automatically into v4l2_subdev_init_finalize() and use
> > > > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > > > as default if subdev don't have .(un)subscribe control operations.
> > > 
> > > I would add here
> > > 
> > > This simplifies subdev drivers by avoiding the need to set the
> > > V4L2_SUBDEV_FL_HAS_EVENTS flag and plug the event handlers, and ensures
> > > consistency of the API exposed to userspace.
> > > 
> > > And you can also add
> > > 
> > > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > 
> > > > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > > 
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Oks, Thanks again.
> > 
> > > Now, can we simplify sensor drivers to drop the event handlers and the
> > > flag ? :-)
> > 
> > Yep, plan is add all to support v4l2_subdev_init_finalize()
> > Removing:
> > 
> >  .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> >  .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > 
> > if are used. And ofc V4L2_SUBDEV_FL_HAS_EVENTS.
> 
> What I meant is looking at the I2C sensor drivers that currently
> 
> - call v4l2_subdev_init_finalize()
> - set V4L2_SUBDEV_FL_HAS_EVENTS
> - set the .subscribe_event() and .unsubscribe_event() handlers
> 
> and dropping the flag and handlers from them. Is that what you plan to
> work on ?

Yep, I will take a look on that. :)

Thanks & Regards,
Tommaso

> 
> > Meanwhile I think I will send v3 with your
> > suggestions. :)
> > 
> > > > ---
> > > > Changes since v1:
> > > >  - Aligned event subscription with unsubscription as suggested by LPinchart,
> > > >    SAilus
> > > > 
> > > >  drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++++++++++--
> > > >  1 file changed, 20 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > index 3a4ba08810d2..fad8fa1f63e8 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > @@ -691,10 +691,25 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > > >  		return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
> > > >  
> > > >  	case VIDIOC_SUBSCRIBE_EVENT:
> > > > -		return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
> > > > +		if (v4l2_subdev_has_op(sd, core, subscribe_event))
> > > > +			return v4l2_subdev_call(sd, core, subscribe_event,
> > > > +						vfh, arg);
> > > > +
> > > > +		if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
> > > > +		    vfh->ctrl_handler)
> > > > +			return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> > > > +
> > > > +		return -ENOIOCTLCMD;
> > > >  
> > > >  	case VIDIOC_UNSUBSCRIBE_EVENT:
> > > > -		return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
> > > > +		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> > > > +			return v4l2_subdev_call(sd, core, unsubscribe_event,
> > > > +						vfh, arg);
> > > > +
> > > > +		if (sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS)
> > > > +			return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
> > > > +
> > > > +		return -ENOIOCTLCMD;
> > > >  
> > > >  #ifdef CONFIG_VIDEO_ADV_DEBUG
> > > >  	case VIDIOC_DBG_G_REGISTER:
> > > > @@ -1641,6 +1656,9 @@ int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
> > > >  		}
> > > >  	}
> > > >  
> > > > +	if (sd->ctrl_handler)
> > > > +		sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
> > > > +
> > > >  	state = __v4l2_subdev_state_alloc(sd, name, key);
> > > >  	if (IS_ERR(state))
> > > >  		return PTR_ERR(state);
> 
> -- 
> Regards,
> 
> Laurent Pinchart

