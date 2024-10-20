Return-Path: <linux-media+bounces-19925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A6D9A54D6
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 17:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8E5E1F21B49
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 15:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F1419414E;
	Sun, 20 Oct 2024 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WiIQ4kIH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13718193438;
	Sun, 20 Oct 2024 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729439208; cv=none; b=JLLPIk+R7GI0Xbj3ANTSef3/rtypiLSJw0EJFjmsaLC3d8AY63MlMuIUZ5hkI5ESW2V1FYi7bHNJ6NDRiU9W+VQbvAYM3Yrf1UYxazMlnFlf+pYdK8YkJTNT9CvLdta58ZmL9TtodCLMxZJBElck+THVTXmz7T8i4vb3l3IRhTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729439208; c=relaxed/simple;
	bh=gJ8X6N9zExu19W2hdDaFSkCjONNgku3YCa/bnej9AbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUeuugNaH9FiKhAhWRFVwVWYtLvb491LOcw8pvb+hIG+/Qx1SEP827zDtv9e+RTQzONK7uaidTiUp14F0thHStzncPTbV2n80iDTGJDPkvj4dYCv5Kpy8u244BcGjYz21Z1gWj8cd2hp/Vg3G/w/+sCDp0uEhbOCa45pxQYzx6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WiIQ4kIH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FB85352;
	Sun, 20 Oct 2024 17:44:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729439098;
	bh=gJ8X6N9zExu19W2hdDaFSkCjONNgku3YCa/bnej9AbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WiIQ4kIHg8W+NxjoUDz1kqQPhwNt8okJ3f5wfg1yKsgvo+4cEAWZ8A1cdVfgAEBUP
	 nTOVVETGthvxyNJGB48zgDvD2lQJYNR6rJlTnRK0h30a6ZKa5yYqnOE1N21hID5bud
	 yEVf2J3nzNm257VYiQwFV66+0wydFQZGfz/dqUtA=
Date: Sun, 20 Oct 2024 18:46:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>, prabhakar.csengg@gmail.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: Refactor events
Message-ID: <20241020154638.GC7770@pendragon.ideasonboard.com>
References: <20241018171104.1624426-1-tomm.merciai@gmail.com>
 <ZxK3VsNdFjULfRxK@kekkonen.localdomain>
 <ZxQtlwVZ9JfIM8tl@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ZxTfZ1GOMdOmrmTt@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZxTfZ1GOMdOmrmTt@kekkonen.localdomain>

On Sun, Oct 20, 2024 at 10:45:59AM +0000, Sakari Ailus wrote:
> Hi Tommaso,
> 
> On Sun, Oct 20, 2024 at 12:07:19AM +0200, Tommaso Merciai wrote:
> > Hi Sakari,
> > 
> > On Fri, Oct 18, 2024 at 07:30:30PM +0000, Sakari Ailus wrote:
> > > Hi Tommaso,
> > > 
> > > Thanks for working on this.
> > 
> > In real it's a Laurent's suggestion :)
> > 
> > > 
> > > On Fri, Oct 18, 2024 at 07:11:03PM +0200, Tommaso Merciai wrote:
> > > > Controls can be exposed to userspace via a v4l-subdevX device, and
> > > > userspace has to be able to subscribe to control events so that it is
> > > > notified when the control changes value.
> > > > If a control handler is set for the subdev then set the HAS_EVENTS
> > > > flag automatically into v4l2_subdev_init_finalize() and use
> > > > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > > > as default if subdev don't have .(un)subscribe control operations.
> > > > 
> > > > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++++++++++--
> > > >  1 file changed, 20 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > index 3a4ba08810d2..77ca829b9983 100644
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
> > > > +		     vfh->ctrl_handler)
> > > > +			return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> > > > +
> > > > +		return -ENOIOCTLCMD;
> > > 
> > > While this mostly does the same thing, I prefer the order of tests below.
> > > Could you align event subscription with unsubscription?
> > 
> > What about:
> > 
> > 	case VIDIOC_SUBSCRIBE_EVENT:
> > 		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> > 			return -ENOIOCTLCMD;
> > 
> > 		if (v4l2_subdev_has_op(sd, core, subscribe_event))
> > 			return v4l2_subdev_call(sd, core, subscribe_event,
> > 						vfh, arg);
> > 
> > 		if (!vfh->ctrl_handler)
> > 			return -ENOTTY;
> > 
> > 		return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> 
> Oh, right. Actually the earlier unsubscription didn't always produce
> correct results. I missed that. This is needlessly complicated at the
> moment. So I'd do:
> 
> 	case VIDIOC_SUBSCRIBE_EVENT:
> 		if (v4l2_subdev_has_op(sd, core, subscribe_event))
> 			return v4l2_subdev_call(sd, core, subscribe_event,
> 						vfh, arg);
> 
> 		return (sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
> 			vfh->ctrl_handler ?
> 			v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg) :
> 			-ENOIOCTLCMD;

Let's make this clearer:


		if (sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
		    vfh->ctrl_handler)
			return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);

		return -ENOIOCTLCMD;

> 
> 	case VIDIOC_UNSUBSCRIBE_EVENT:
> 		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> 			return v4l2_subdev_call(sd, core, unsubscribe_event,
> 						vfh, arg);
> 
> 		return sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS ?
> 			v4l2_event_subdev_unsubscribe(sd, vfh, arg) :
> 			-ENOIOCTLCMD;

		if (sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS)
			return v4l2_event_subdev_unsubscribe(sd, vfh, arg);

		return -ENOIOCTLCMD;

> 
> 
> > 
> > 	case VIDIOC_UNSUBSCRIBE_EVENT:
> > 		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> > 			return -ENOIOCTLCMD;
> > 
> > 		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> > 			return v4l2_subdev_call(sd, core, unsubscribe_event,
> > 						vfh, arg);
> > 
> > 		return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
> > 
> > ?
> > 
> > > >  
> > > >  	case VIDIOC_UNSUBSCRIBE_EVENT:
> > > > -		return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
> > > > +		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> > > > +			return -ENOIOCTLCMD;
> > > > +
> > > > +		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> > > > +			return v4l2_subdev_call(sd, core, unsubscribe_event,
> > > > +						vfh, arg);
> > > > +
> > > > +		return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
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

-- 
Regards,

Laurent Pinchart

