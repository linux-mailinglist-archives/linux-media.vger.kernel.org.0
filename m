Return-Path: <linux-media+bounces-9930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B528AE522
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 13:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 775441C22C95
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 11:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6C314BFA2;
	Tue, 23 Apr 2024 11:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RqiZ7GbC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661B314B064
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 11:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713872530; cv=none; b=kHE+GJ85PwK5QwoSy5G5zh0vONYUV/P05jjr81c2rHO+cJ25eeAx4113a4LoA8AfUAvHXlDq8FpDdfAi4P+LNP/4QlGW9Dv3mhwXDwDjWXg3g0RHrLIWVZUKNYw5aRnGCv2PT7MiLQG40JYutvNJPMi8LzW+xPr0f0MB9rFQJDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713872530; c=relaxed/simple;
	bh=b1aFQ7Gu5mB5Z3vxtkG/SknQm7DbTj8YFLlufo8c3cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meb5s5pOxl+gUktE6xTh9GyTLB/qsJtdPor4dl5ZDcpatREh8o1mCXwsOWq/qkXE4d6bDU0SZYx9JVvBXqXnfBLA1fDe5ik0ULCTkAdfrsMPQYSrCb9MtS9vbKHYdUKM9FIIo5SAaaCjstr9z7QkmFqB4/tdSzMJgBczYbHVVlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RqiZ7GbC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [94.107.229.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E483365D;
	Tue, 23 Apr 2024 13:41:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713872475;
	bh=b1aFQ7Gu5mB5Z3vxtkG/SknQm7DbTj8YFLlufo8c3cg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RqiZ7GbCAAcpQtIwVX4Zv8Grp190+8kue8xjwNZWLxp6LccBFBbocDr1kLx/NRwmw
	 5mxdHRAlbmOxZv4YHf7ax2jlpd+Zflab/WBqEEyqHrbeQ+ttRxpfYk5QziJ5lWueMC
	 AZfYd1QgpP9It5Rzb+YFmsIzeQzuxLSXS8FI70ek=
Date: Tue, 23 Apr 2024 14:41:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 16/46] media: v4l: subdev: Return routes set using
 S_ROUTING
Message-ID: <20240423114158.GB22574@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-17-sakari.ailus@linux.intel.com>
 <20240419225552.GK6414@pendragon.ideasonboard.com>
 <ZieSJ_UEUL3tOzzB@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZieSJ_UEUL3tOzzB@kekkonen.localdomain>

On Tue, Apr 23, 2024 at 10:49:11AM +0000, Sakari Ailus wrote:
> On Sat, Apr 20, 2024 at 01:55:52AM +0300, Laurent Pinchart wrote:
> > On Tue, Apr 16, 2024 at 10:32:49PM +0300, Sakari Ailus wrote:
> > > Return the routes set using S_ROUTING back to the user. Also reflect this
> > > in documentation.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../media/v4l/vidioc-subdev-g-routing.rst            |  7 ++-----
> > >  drivers/media/v4l2-core/v4l2-subdev.c                | 12 +++++++++++-
> > >  2 files changed, 13 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > index 27eb4c82a0e1..88df7bf80b00 100644
> > > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > @@ -44,7 +44,8 @@ Drivers report their current routing tables using the
> > >  ``VIDIOC_SUBDEV_G_ROUTING`` ioctl and application may enable or disable routes
> > >  with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
> > >  setting or clearing flags of the ``flags`` field of a struct
> > > -:c:type:`v4l2_subdev_route`.
> > > +:c:type:`v4l2_subdev_route`. Similarly to ``VIDIOC_SUBDEV_G_ROUTING``, also
> > > +``VIDIOC_SUBDEV_S_ROUTING`` returns the routes back to the user.
> > 
> > :c:type:`v4l2_subdev_route`. Similarly to ``VIDIOC_SUBDEV_G_ROUTING``,
> > ``VIDIOC_SUBDEV_S_ROUTING`` also returns the routes back to the user.
> 
> The intention here is to say that S_ROUTING returns the routes back to the
> user, just as G_ROUTING does. Moving "also" after S_ROUTING makes the
> meaning of the sentence unclear.

Keeping it before makes it sound non-native English to me :-) But I'm
not a native speaker.

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks!
> 
> > >  
> > >  All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called.
> > >  This means that the userspace must reconfigure all stream formats and selections
> > > @@ -157,10 +158,6 @@ On success 0 is returned, on error -1 and the ``errno`` variable is set
> > >  appropriately. The generic error codes are described at the
> > >  :ref:`Generic Error Codes <gen-errors>` chapter.
> > >  
> > > -ENOSPC
> > > -   The application provided ``num_routes`` is not big enough to contain
> > > -   all the available routes the subdevice exposes.
> > > -
> > >  EINVAL
> > >     The sink or source pad identifiers reference a non-existing pad or reference
> > >     pads of different types (ie. the sink_pad identifiers refers to a source
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index 904378007a79..36b2f78cd551 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -959,8 +959,18 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > >  		krouting.len_routes = routing->len_routes;
> > >  		krouting.routes = routes;
> > >  
> > > -		return v4l2_subdev_call(sd, pad, set_routing, state,
> > > +		rval = v4l2_subdev_call(sd, pad, set_routing, state,
> > >  					routing->which, &krouting);
> > > +		if (rval < 0)
> > > +			return rval;
> > > +
> > > +		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> > > +		       state->routing.routes,
> > > +		       min(state->routing.num_routes, routing->len_routes) *
> > > +		       sizeof(*state->routing.routes));
> > > +		routing->num_routes = state->routing.num_routes;
> > > +
> > > +		return 0;
> > >  	}
> > >  
> > >  	case VIDIOC_SUBDEV_G_ROUTING: {

-- 
Regards,

Laurent Pinchart

