Return-Path: <linux-media+bounces-19969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 307ED9A5D1A
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 09:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4F42B24660
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 07:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65A81D1308;
	Mon, 21 Oct 2024 07:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Rbq1pPkB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CDC1D2B3C;
	Mon, 21 Oct 2024 07:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495844; cv=none; b=UG0PXj0bXH4RF1k1+7iy9qAgVGNmecBuj8U+GC3BoVz0iZ7l/zWPseBj8XpSAlqgIO9VAg2MhgUnICGzKXGwDwAWvTPb/npTa2WS2p9Mq7uQUrfW3WfK0XkUUNgL2x7ZSwiXk/vW9zfblmlI9UmernQn3yG137Uijlr2Am+3YzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495844; c=relaxed/simple;
	bh=Z6UlwbDUZSsB4+wZPsrAxz492+YRijjGRP/qPbVeUAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYirPGawC7AIBMI1I3YflSM9BPKu3QfcK2FN1dAk/sIhqy+wd3kXm4Ic894dNQYI/cNX8ZMVOrikwiYV3MSzHuwmm9UzJIIQk3T+iBtFqKHrH4B+lwZUaz6L+EcJHJ6IiHPyTytrVQ2Osel5oFOzfO+hxIPy+YN3R6xdb3rD9WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Rbq1pPkB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 390444CF;
	Mon, 21 Oct 2024 09:28:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729495734;
	bh=Z6UlwbDUZSsB4+wZPsrAxz492+YRijjGRP/qPbVeUAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rbq1pPkBq4mkzTcm+SJgMmN8QtaO4t3IK9ODdHey1uaF2wWU8q/2RcLETFO/ecJA7
	 26YuktdaAafimJvvBi2sntpIVclOBGpUQbZpC2p3xxX4tef3KMkJy6BJcVveZ7etWY
	 E45S/uveLe4B1/4GLqMOAsWgaDzmNRWj+vTzuyqA=
Date: Mon, 21 Oct 2024 10:30:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: sakari.ailus@linux.intel.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-subdev: Refactor events
Message-ID: <20241021073034.GC14328@pendragon.ideasonboard.com>
References: <20241020163534.1720297-1-tomm.merciai@gmail.com>
 <20241020164354.GG7770@pendragon.ideasonboard.com>
 <ZxX2SVl/p0i7Nemi@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZxX2SVl/p0i7Nemi@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>

On Mon, Oct 21, 2024 at 08:35:53AM +0200, Tommaso Merciai wrote:
> Hi Laurent,
> Thanks for your review.
> 
> On Sun, Oct 20, 2024 at 07:43:54PM +0300, Laurent Pinchart wrote:
> > Hi Tommaso,
> > 
> > Thank you for the patch.
> > 
> > On Sun, Oct 20, 2024 at 06:35:32PM +0200, Tommaso Merciai wrote:
> > > Controls can be exposed to userspace via a v4l-subdevX device, and
> > > userspace has to be able to subscribe to control events so that it is
> > > notified when the control changes value.
> > > If a control handler is set for the subdev then set the HAS_EVENTS
> > > flag automatically into v4l2_subdev_init_finalize() and use
> > > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > > as default if subdev don't have .(un)subscribe control operations.
> > 
> > I would add here
> > 
> > This simplifies subdev drivers by avoiding the need to set the
> > V4L2_SUBDEV_FL_HAS_EVENTS flag and plug the event handlers, and ensures
> > consistency of the API exposed to userspace.
> > 
> > And you can also add
> > 
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Oks, Thanks again.
> 
> > Now, can we simplify sensor drivers to drop the event handlers and the
> > flag ? :-)
> 
> Yep, plan is add all to support v4l2_subdev_init_finalize()
> Removing:
> 
>  .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>  .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> 
> if are used. And ofc V4L2_SUBDEV_FL_HAS_EVENTS.

What I meant is looking at the I2C sensor drivers that currently

- call v4l2_subdev_init_finalize()
- set V4L2_SUBDEV_FL_HAS_EVENTS
- set the .subscribe_event() and .unsubscribe_event() handlers

and dropping the flag and handlers from them. Is that what you plan to
work on ?

> Meanwhile I think I will send v3 with your
> suggestions. :)
> 
> > > ---
> > > Changes since v1:
> > >  - Aligned event subscription with unsubscription as suggested by LPinchart,
> > >    SAilus
> > > 
> > >  drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++++++++++--
> > >  1 file changed, 20 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index 3a4ba08810d2..fad8fa1f63e8 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -691,10 +691,25 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > >  		return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
> > >  
> > >  	case VIDIOC_SUBSCRIBE_EVENT:
> > > -		return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
> > > +		if (v4l2_subdev_has_op(sd, core, subscribe_event))
> > > +			return v4l2_subdev_call(sd, core, subscribe_event,
> > > +						vfh, arg);
> > > +
> > > +		if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
> > > +		    vfh->ctrl_handler)
> > > +			return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> > > +
> > > +		return -ENOIOCTLCMD;
> > >  
> > >  	case VIDIOC_UNSUBSCRIBE_EVENT:
> > > -		return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
> > > +		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> > > +			return v4l2_subdev_call(sd, core, unsubscribe_event,
> > > +						vfh, arg);
> > > +
> > > +		if (sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS)
> > > +			return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
> > > +
> > > +		return -ENOIOCTLCMD;
> > >  
> > >  #ifdef CONFIG_VIDEO_ADV_DEBUG
> > >  	case VIDIOC_DBG_G_REGISTER:
> > > @@ -1641,6 +1656,9 @@ int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
> > >  		}
> > >  	}
> > >  
> > > +	if (sd->ctrl_handler)
> > > +		sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
> > > +
> > >  	state = __v4l2_subdev_state_alloc(sd, name, key);
> > >  	if (IS_ERR(state))
> > >  		return PTR_ERR(state);

-- 
Regards,

Laurent Pinchart

