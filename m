Return-Path: <linux-media+bounces-19924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC789A5386
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 12:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D08E91F21C96
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 10:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0136166F00;
	Sun, 20 Oct 2024 10:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RubCtQ2p"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB9D6AA7;
	Sun, 20 Oct 2024 10:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729421168; cv=none; b=m7FvWs3cl0RzDMO04fCFwolfoIiUTwAy4SITjU5P8hTVWZLXUL8zVc3PMY4zpkmJ0IFgoRrYv5BsP6qhXX7gfVN/pN/mpzoCZauApERDiSP2+9Jt7KWVCGzMjrlT3roj9xjJDrhzpqgi9QU8OuHz5VEp89bG7ssIrVEe+KEwtwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729421168; c=relaxed/simple;
	bh=0XhLUi2QSo07min72woGCvHWNfk5RNmyOWYj3D88ugA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlXU4dVejFC+FaHw4304dvVZk7mJ3FjGXrldrcQEVYow5xggQ4HaJpNcIkbtfiXml2p6H92TLvBf3zA46XrkColxU5QC1DshfqyK8syBFbfunJ0F4SmrMwx21t4NioUMINpWMN3vh5midVA1CH9psC48Y6LzIlaM9bHzimF/WXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RubCtQ2p; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729421166; x=1760957166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0XhLUi2QSo07min72woGCvHWNfk5RNmyOWYj3D88ugA=;
  b=RubCtQ2pcaA95rHFHhdaTSyc36xCLsv9QFGXDPM57bdyltDTDV75XZBW
   WevSMatp4PLvZxgRqo+Y7kuZH2jyaUgRJLm4nlwGbj3N9kC7yBB7TFRe/
   dWiUNMOQipyYK44mvxaf67AchLp3gifUdbDDQ6iAZGUhp47zIuM5w4K88
   QUxbqZ3VeG83IuG0aVKOoGk5mVZfc6F2Zx/RB1FE3S93qK8oMNtC0LlTc
   7QtQ91eyDqkrxgvQPqVJ4sAewZhv0uI3Xx0n2+uKx4JVzzXHvseS468dy
   tHtPjU+4N4LHhZb0uHLSNDrJmLBpuX0WVGf1NSouRh7CC7E7aSttYkfG8
   Q==;
X-CSE-ConnectionGUID: 4V8BCFvsT+KBvLuOVoe1UQ==
X-CSE-MsgGUID: 8FmA7dc3T+mi12Qwils6wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="39530527"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="39530527"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 03:46:06 -0700
X-CSE-ConnectionGUID: mWSdEmY5S62M85EmvaF/sg==
X-CSE-MsgGUID: uvvOuuk/Q8OYVJkyyWbBGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="79224218"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 03:46:03 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E20DA11F802;
	Sun, 20 Oct 2024 13:45:59 +0300 (EEST)
Date: Sun, 20 Oct 2024 10:45:59 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, prabhakar.csengg@gmail.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: Refactor events
Message-ID: <ZxTfZ1GOMdOmrmTt@kekkonen.localdomain>
References: <20241018171104.1624426-1-tomm.merciai@gmail.com>
 <ZxK3VsNdFjULfRxK@kekkonen.localdomain>
 <ZxQtlwVZ9JfIM8tl@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxQtlwVZ9JfIM8tl@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>

Hi Tommaso,

On Sun, Oct 20, 2024 at 12:07:19AM +0200, Tommaso Merciai wrote:
> Hi Sakari,
> 
> On Fri, Oct 18, 2024 at 07:30:30PM +0000, Sakari Ailus wrote:
> > Hi Tommaso,
> > 
> > Thanks for working on this.
> 
> In real it's a Laurent's suggestion :)
> 
> > 
> > On Fri, Oct 18, 2024 at 07:11:03PM +0200, Tommaso Merciai wrote:
> > > Controls can be exposed to userspace via a v4l-subdevX device, and
> > > userspace has to be able to subscribe to control events so that it is
> > > notified when the control changes value.
> > > If a control handler is set for the subdev then set the HAS_EVENTS
> > > flag automatically into v4l2_subdev_init_finalize() and use
> > > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > > as default if subdev don't have .(un)subscribe control operations.
> > > 
> > > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++++++++++--
> > >  1 file changed, 20 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index 3a4ba08810d2..77ca829b9983 100644
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
> > > +		     vfh->ctrl_handler)
> > > +			return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> > > +
> > > +		return -ENOIOCTLCMD;
> > 
> > While this mostly does the same thing, I prefer the order of tests below.
> > Could you align event subscription with unsubscription?
> 
> What about:
> 
> 	case VIDIOC_SUBSCRIBE_EVENT:
> 		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> 			return -ENOIOCTLCMD;
> 
> 		if (v4l2_subdev_has_op(sd, core, subscribe_event))
> 			return v4l2_subdev_call(sd, core, subscribe_event,
> 						vfh, arg);
> 
> 		if (!vfh->ctrl_handler)
> 			return -ENOTTY;
> 
> 		return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);

Oh, right. Actually the earlier unsubscription didn't always produce
correct results. I missed that. This is needlessly complicated at the
moment. So I'd do:

	case VIDIOC_SUBSCRIBE_EVENT:
		if (v4l2_subdev_has_op(sd, core, subscribe_event))
			return v4l2_subdev_call(sd, core, subscribe_event,
						vfh, arg);

		return (sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
			vfh->ctrl_handler ?
			v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg) :
			-ENOIOCTLCMD;

	case VIDIOC_UNSUBSCRIBE_EVENT:
		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
			return v4l2_subdev_call(sd, core, unsubscribe_event,
						vfh, arg);

		return sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS ?
			v4l2_event_subdev_unsubscribe(sd, vfh, arg) :
			-ENOIOCTLCMD;


> 
> 	case VIDIOC_UNSUBSCRIBE_EVENT:
> 		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> 			return -ENOIOCTLCMD;
> 
> 		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> 			return v4l2_subdev_call(sd, core, unsubscribe_event,
> 						vfh, arg);
> 
> 		return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
> 
> ?
> 
> Thanks & Regards,
> Tommaso
> 
> > 
> > >  
> > >  	case VIDIOC_UNSUBSCRIBE_EVENT:
> > > -		return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
> > > +		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> > > +			return -ENOIOCTLCMD;
> > > +
> > > +		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> > > +			return v4l2_subdev_call(sd, core, unsubscribe_event,
> > > +						vfh, arg);
> > > +
> > > +		return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
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
> > 
> > -- 
> > Kind regards,
> > 
> > Sakari Ailus

-- 
Sakari Ailus

