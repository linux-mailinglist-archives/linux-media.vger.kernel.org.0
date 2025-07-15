Return-Path: <linux-media+bounces-37795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11042B0610C
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 16:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE25B5A6700
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 14:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50793292B49;
	Tue, 15 Jul 2025 14:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEMqbCoX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A93291C22
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 14:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752588564; cv=none; b=CZDLf5yZK3SFrXkQKFsBo+LDfMnpSy+0Fq7hqhMMUJeGaBIN5IN0kAbzFmUMVrhvZv0w7Mnh+MVmsGwoAGb7Kw7mTTk2O5nKdv70i2JNdDh6AlSEH8dRA7RK+hd0sxP6+iFkwNzF6LODl1WmN/+J2HGKYrEk7s4xlhsIGEXsmJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752588564; c=relaxed/simple;
	bh=nFDzKYtNHaJIOQWVDSZ4dmg9qybXatVIOHx5KbBEv8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZ/gxY0THCKGUF3hx+m/KliHQq2MRCOclJmwnQyQQjkYlvsYUEFYFLhmwRvhUpNXuZvz9aJbOrlwSuxZM7s0FNJ9u7MoaHmFLFEEqvaeGjTZ3bRu0ZRbOYx3jTowtgHfjdJ5HbXSjmA8UxNVjoAsn+9LmPQ64CI2RdLfDmXV/wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEMqbCoX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752588563; x=1784124563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nFDzKYtNHaJIOQWVDSZ4dmg9qybXatVIOHx5KbBEv8Q=;
  b=aEMqbCoXcPALGeFWyifMKKe4OztpyivJ7qXTQJq4IvuSbHHk+CtIWMyL
   9WqdwJOlNxM1JMCR7XsfAnlUDbDN0+REIVfwEtctO2z1dqoGb5Ck1+oZ7
   gSD1O/pCmyk0pG/LUbM/e4freMvatqHyR+C/+B9yzEWQlrHKJ0JjJMYM2
   3niAlti59rvh3+MjXXtoKqPmKu+dqB2uHlq9ILG/UG/5rQz4n0NNRSrBQ
   ZRzpD4R6bXIEdCthNKa+YVxbVzQodBHpfpQgxw9FGKsUZR/qwEYIQdWEW
   bZKQckPlWCqDCCwLtDrpWJlYQD0jdi8u3TSxtMkrJROoNwLUFSCu8X0bd
   A==;
X-CSE-ConnectionGUID: 7J8HBmLPRS+I/4M/qLUyFw==
X-CSE-MsgGUID: buZQG2YER4u57siFCPisOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58574029"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="58574029"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 07:09:09 -0700
X-CSE-ConnectionGUID: UKxSkIT8RBCeBz0nTFlfPA==
X-CSE-MsgGUID: vD6HtOS+TwaFP4btDWClzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="156637396"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.145])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 07:09:06 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D041811F8D4;
	Tue, 15 Jul 2025 17:09:03 +0300 (EEST)
Date: Tue, 15 Jul 2025 14:09:03 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 11/13] media: v4l2-subdev: Introduce
 v4l2_subdev_find_route()
Message-ID: <aHZg_4msVzCuQ3t5@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-12-sakari.ailus@linux.intel.com>
 <fez66dv6tnyuhdfkqsy7fuwmq7kpw4vnuxaqq6j4butyjhfj3q@mz6zp7ensofq>
 <aFwpolfI0Ox9he4t@kekkonen.localdomain>
 <20250626222047.GE30016@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626222047.GE30016@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, Jun 27, 2025 at 01:20:47AM +0300, Laurent Pinchart wrote:
> On Wed, Jun 25, 2025 at 04:53:54PM +0000, Sakari Ailus wrote:
> > On Fri, Jun 20, 2025 at 10:14:58AM +0200, Jacopo Mondi wrote:
> > > On Thu, Jun 19, 2025 at 11:15:44AM +0300, Sakari Ailus wrote:
> > > > v4l2_subdev_find_route() is like v4l2_subdev_routing_find_opposite_end(),
> > > > with the difference that it's more flexible: it can look up only active
> > > > routes and can find multiple routes, too.
> > > >
> > > > v4l2_subdev_find_route() is intended to replace
> > > > v4l2_subdev_routing_find_opposite_end().
> > > 
> > > To me this feels like v4l2_subdev_find_route() could be used to
> > > implement more helpers like v4l2_subdev_routing_find_opposite_end()
> > > for drivers instead of going the other way around.
> > > 
> > > let's see what the use cases are
> > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-subdev.c | 56 ++++++++++++++++++---------
> > > >  include/media/v4l2-subdev.h           | 19 +++++++++
> > > >  2 files changed, 56 insertions(+), 19 deletions(-)
> > > >
> > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > index c549a462dac7..13d6e96daf3a 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > @@ -1996,34 +1996,52 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
> > > >
> > > > -int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
> > > > -					  u32 pad, u32 stream, u32 *other_pad,
> > > > -					  u32 *other_stream)
> > > > +struct v4l2_subdev_route *
> > > > +v4l2_subdev_find_route(const struct v4l2_subdev_krouting *routing,
> > > > +		       u32 pad, u32 stream, bool active, unsigned int index)
> > > >  {
> > > >  	unsigned int i;
> > > >
> > > >  	for (i = 0; i < routing->num_routes; ++i) {
> > > >  		struct v4l2_subdev_route *route = &routing->routes[i];
> > > >
> > > > -		if (route->source_pad == pad &&
> > > > -		    route->source_stream == stream) {
> > > > -			if (other_pad)
> > > > -				*other_pad = route->sink_pad;
> > > > -			if (other_stream)
> > > > -				*other_stream = route->sink_stream;
> > > > -			return 0;
> > > > -		}
> > > > +		if (active && !(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> > > > +			continue;
> > > 
> > > I know currently v4l2_subdev_routing_find_opposite_end() does return
> > > any route that matches the provided 'pad' and 'stream' included
> > > non-active ones, but I wonder if this is desirable. What is the use
> > > case for enumerating a non-active route between two pads ?
> > 
> > Good question. v4l2_subdev_routing_find_opposite_end() nevertheless returns
> > them. And the caller won't get the route for checking the state either.
> 
> I'm tempted to check the callers of the function and change the
> behaviour to only return active routes.

I can prepend a patch to do the change there so it won't happen here.

> 
> > > (it is also my impression that all drivers that use
> > > v4l2_subdev_routing_find_opposite_end() assume the route is active)
> > > 
> > > Also I wonder if the usage of V4L2_SUBDEV_ROUTE_FL_ACTIVE is clearly
> > > defined, or, in other words, what is the use case for userspace to
> > > create non-active routes, given that any new VIDIOC_SUBDEV_S_ROUTING
> > > will anyway re-create the routing table (that's a different question,
> > > on the ioctl definition and not on this change though)
> > 
> > I think it is. Please review the UAPI documentation in the metadata series.
> > :-)
> 
> Section "Device types and routing setup" in
> Documentation/userspace-api/media/v4l/dev-subdev.rst is the best
> documentation we have at the moment.
> 
> We essentially have two models for internal routing. In the first model,
> which I'll nickname the crossbar switch model, a large number of routes
> are possible (up to any input to any output types of scenarios). In this
> case, routes are created by userspace, and all routes in the routing
> table are expected to be active. Any inactive route provided by
> userspace would be dropped by the driver and not be included in the
> routing table.
> 
> The second model covers devices such as camera sensors, where a small
> fixed set of routes are hardcoded. The routing table is fixed, an some
> routes (the ones not marked with the IMMUTABLE flag) can be
> enabled/disabled by userspace using the V4L2_SUBDEV_ROUTE_FL_ACTIVE.
> This allows userspace to enumerate the available routes.
> 
> Documentation/userspace-api/media/v4l/dev-subdev.rst should document
> more clearly that we do not allow any hybrid behaviour at the moment.

I agree.

> 
> > > >
> > > > -		if (route->sink_pad == pad && route->sink_stream == stream) {
> > > > -			if (other_pad)
> > > > -				*other_pad = route->source_pad;
> > > > -			if (other_stream)
> > > > -				*other_stream = route->source_stream;
> > > > -			return 0;
> > > > -		}
> > > > +		if ((route->source_pad != pad ||
> > > > +		     route->source_stream != stream) &&
> > > > +		    (route->sink_pad != pad || route->sink_stream != stream))
> > > > +			continue;
> > > > +
> > > > +		if (index--)
> > > > +			continue;
> > > > +
> > > > +		return route;
> > > >  	}
> > > >
> > > > -	return -EINVAL;
> > > > +	return ERR_PTR(-ENOENT);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(v4l2_subdev_find_route);
> > > > +
> > > > +int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
> > > > +					  u32 pad, u32 stream, u32 *other_pad,
> > > > +					  u32 *other_stream)
> > > > +{
> > > > +	struct v4l2_subdev_route *route;
> > > > +
> > > > +	route = v4l2_subdev_find_route(routing, pad, stream, false, 0);
> > > > +	if (IS_ERR(route))
> > > > +		return PTR_ERR(route);
> > > > +
> > > > +	bool is_source = route->source_pad == pad;
> > > > +
> > > > +	if (other_pad)
> > > > +		*other_pad = is_source ? route->sink_pad : route->source_pad;
> > > > +	if (other_stream)
> > > > +		*other_stream = is_source ?
> > > > +			route->sink_stream : route->source_stream;
> 
> Having to do this is_source dance makes v4l2_subdev_find_route()
> annoying to use. It may be fine when using the function to implement
> other helpers, but I wouldn't like to see this being done in drivers.
> Maybe we can avoid exporting v4l2_subdev_find_route() for now to ensure
> that, the only user in this series is in v4l2-mc.c.

Sounds reasonable.

> 
> > > > +
> > > > +	return 0;
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(v4l2_subdev_routing_find_opposite_end);
> > > >
> > > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > > index deab128a4779..9ed8600ba3d4 100644
> > > > --- a/include/media/v4l2-subdev.h
> > > > +++ b/include/media/v4l2-subdev.h
> > > > @@ -1547,6 +1547,23 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> > > >  				     const struct v4l2_subdev_krouting *routing,
> > > >  				     const struct v4l2_mbus_framefmt *fmt);
> > > >
> > > > +/**
> > > > + * v4l2_subdev_find_route() - Find routes from a (pad, stream) pair
> > > 
> > > from or for ?
> > 
> > From or to. I'll fix this in the next version.
> > 
> > > 
> > > > + * @routing: routing used to find the opposite side
> > > 
> > > I would not say "opposite side" but rather
> > > 
> > >       @routing: routing table used to enumerate routes
> > 
> > How about simply "the routing table"?
> > 
> > > 
> > > > + * @pad: pad id
> > > > + * @stream: stream id
> > > > + * @active: set to true for looking up only active routes
> > > > + * @index: for accessing more than one route from the pad
> > > 
> > > I understand this but maybe
> > > 
> > >      @index: route index for enumerating multiple routes
> > > ?
> > 
> > Sounds good.
> 
> I'm curious to know how this parameter will be used. In the only user
> (in patch 12/13), it is hardcoded to 0. I'm not sure indexing routes
> will be very useful for drivers.

Looks like it'll be needed by v4l2_subdev_set_streams_enabled(), as a
result on discussion related to it.

> 
> > > > + *
> > > > + * Find a route from the routing table where one end has (pad, stream) pair
> > > > + * matching @pad and @stream.
> > > 
> > >     * If multiple routes in @routing match @pad and @stream, return
> > >     * the @index one.
> > >     *
> > >     * Set @active to true to only enumerate active routes.
> > > 
> > > > + *
> > > > + * Returns the route on success or -ENOENT if no matching route is found.
> > > 
> > > I see other functions documentation using
> > > 
> > >     * Return:
> > > 
> > > is this a kernel-doc thing ?
> > 
> > Yes, makes sense.
> > 
> > > > + */
> > > > +struct v4l2_subdev_route *
> > > > +v4l2_subdev_find_route(const struct v4l2_subdev_krouting *routing,
> > > > +		       u32 pad, u32 stream, bool active, unsigned int index);
> > > > +
> > > >  /**
> > > >   * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream
> > > >   * @routing: routing used to find the opposite side
> > > > @@ -1555,6 +1572,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> > > >   * @other_pad: pointer used to return the opposite pad
> > > >   * @other_stream: pointer used to return the opposite stream
> > > >   *
> > > > + * Prefer v4l2_subdev_find_route() over v4l2_subdev_routing_find_opposite_end().
> > > > + *
> > > 
> > > As said, I'm not sure if that's preferred or we should rather create
> > > more helpers using v4l2_subdev_find_route() internally. Time will tell
> > > I guess ?
> > 
> > I agree.
> > 
> > The benefit of the older function was that it returns information that
> > doesn't need a lock for accessing it.
> 
> I'm not sure to follow you here. v4l2_subdev_find_route() has the same
> locking requirements as v4l2_subdev_routing_find_opposite_end().

The function itself does, but a lock is not required for accessing
information returned by v4l2_subdev_routing_find_opposite_end() (unlike
v4l2_subdev_find_route()).

> 
> Given that v4l2_subdev_find_route() has a single user, and that the only
> difference in that user compared to
> v4l2_subdev_routing_find_opposite_end() is that only active routes are
> considered, I would prefer modifying
> v4l2_subdev_routing_find_opposite_end() to ignore inactive routes after
> checking that no caller would break.

-- 
Regards,

Sakari Ailus

