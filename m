Return-Path: <linux-media+bounces-35894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A77AE8B19
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 19:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 806777BB319
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 17:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA63E2D8DBB;
	Wed, 25 Jun 2025 16:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZADpfoR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE6D2D5C89
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 16:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750870443; cv=none; b=HTW1Pbx05r/6qGjM2EcL1LKRZ9y5mSpzfBxhWQAc14ytp8ZWdmHf3Fcrs3KbafjwKgv0AUO0/X3f16yTxKJQLGqeUxna929FBMT9sX7I2j+gZFRp2BdoFeJI/oA3bedYMcflfg5mscN0FYLF57YSAob2r1wphe2WCR2gOL9WpH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750870443; c=relaxed/simple;
	bh=o6UrV5JR/M2BjIVu1rHv65TsxPIMuRbVhqE7CPB8hRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKNZ/HWLXD/yAg2wHfP6EbsiCHRvy3r/ssym7SfmGqqZ8VBYkjLFGEH27d0BVquEqU04jzYJJ+4LEU1Gfos8RWcSFI0rXj9r3y72usrVYZ869xuFcJa5+bZowZN+mDfbBPego0favyGkehWZgek4uaIzkdNZ2SUlUgt6uArk510=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZADpfoR; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750870441; x=1782406441;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o6UrV5JR/M2BjIVu1rHv65TsxPIMuRbVhqE7CPB8hRc=;
  b=JZADpfoRoZIOZ7IUnY8QbwsIGUN9ySGUnNx74hSKKYfsTofBBgA4OuOK
   80d8WMjdd2xHePmWpsCsJBHbIFkCvL4Vgl5bPdXIEA2hFtvv8lCjhgz3V
   Ru/RikbA9x5QoZMigI0I99NUC0WuBLZae17SHyofrctgBcxZDO8MWQBam
   B60BSjYSkk5yXthwnx1yaemOUzAP8kEqANM+7pHR/F9OF/4BgzohR+EXb
   QbqyOrYHwBzCHeL5I/zj2xKorrAuWlufXPv2zqZqptmxmhq0hhMWktUQJ
   NWObdo2JcutD6RAcOIi62VkNjzAfhSGtb8OM8GrsGk65ruLHtPcgTIxUA
   g==;
X-CSE-ConnectionGUID: 2IZ7GbArTg+Lck2GFXCK6g==
X-CSE-MsgGUID: PS8TQYVKSnevoxKqbdAvoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53247131"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="53247131"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:54:01 -0700
X-CSE-ConnectionGUID: N3J2VF0UTsmg9+U2dY0UtA==
X-CSE-MsgGUID: kxROZZq/QTKZJXugdXIcIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="156293152"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.57])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:53:58 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E4D2A11F737;
	Wed, 25 Jun 2025 19:53:54 +0300 (EEST)
Date: Wed, 25 Jun 2025 16:53:54 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 11/13] media: v4l2-subdev: Introduce
 v4l2_subdev_find_route()
Message-ID: <aFwpolfI0Ox9he4t@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-12-sakari.ailus@linux.intel.com>
 <fez66dv6tnyuhdfkqsy7fuwmq7kpw4vnuxaqq6j4butyjhfj3q@mz6zp7ensofq>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fez66dv6tnyuhdfkqsy7fuwmq7kpw4vnuxaqq6j4butyjhfj3q@mz6zp7ensofq>

Hi Jacopo,

Thanks for the review.

On Fri, Jun 20, 2025 at 10:14:58AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, Jun 19, 2025 at 11:15:44AM +0300, Sakari Ailus wrote:
> > v4l2_subdev_find_route() is like v4l2_subdev_routing_find_opposite_end(),
> > with the difference that it's more flexible: it can look up only active
> > routes and can find multiple routes, too.
> >
> > v4l2_subdev_find_route() is intended to replace
> > v4l2_subdev_routing_find_opposite_end().
> 
> To me this feels like v4l2_subdev_find_route() could be used to
> implement more helpers like v4l2_subdev_routing_find_opposite_end()
> for drivers instead of going the other way around.
> 
> let's see what the use cases are
> 
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 56 ++++++++++++++++++---------
> >  include/media/v4l2-subdev.h           | 19 +++++++++
> >  2 files changed, 56 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index c549a462dac7..13d6e96daf3a 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -1996,34 +1996,52 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
> >
> > -int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
> > -					  u32 pad, u32 stream, u32 *other_pad,
> > -					  u32 *other_stream)
> > +struct v4l2_subdev_route *
> > +v4l2_subdev_find_route(const struct v4l2_subdev_krouting *routing,
> > +		       u32 pad, u32 stream, bool active, unsigned int index)
> >  {
> >  	unsigned int i;
> >
> >  	for (i = 0; i < routing->num_routes; ++i) {
> >  		struct v4l2_subdev_route *route = &routing->routes[i];
> >
> > -		if (route->source_pad == pad &&
> > -		    route->source_stream == stream) {
> > -			if (other_pad)
> > -				*other_pad = route->sink_pad;
> > -			if (other_stream)
> > -				*other_stream = route->sink_stream;
> > -			return 0;
> > -		}
> > +		if (active && !(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> > +			continue;
> 
> I know currently v4l2_subdev_routing_find_opposite_end() does return
> any route that matches the provided 'pad' and 'stream' included
> non-active ones, but I wonder if this is desirable. What is the use
> case for enumerating a non-active route between two pads ?

Good question. v4l2_subdev_routing_find_opposite_end() nevertheless returns
them. And the caller won't get the route for checking the state either.

> 
> (it is also my impression that all drivers that use
> v4l2_subdev_routing_find_opposite_end() assume the route is active)
> 
> Also I wonder if the usage of V4L2_SUBDEV_ROUTE_FL_ACTIVE is clearly
> defined, or, in other words, what is the use case for userspace to
> create non-active routes, given that any new VIDIOC_SUBDEV_S_ROUTING
> will anyway re-create the routing table (that's a different question,
> on the ioctl definition and not on this change though)

I think it is. Please review the UAPI documentation in the metadata series.
:-)

> 
> >
> > -		if (route->sink_pad == pad && route->sink_stream == stream) {
> > -			if (other_pad)
> > -				*other_pad = route->source_pad;
> > -			if (other_stream)
> > -				*other_stream = route->source_stream;
> > -			return 0;
> > -		}
> > +		if ((route->source_pad != pad ||
> > +		     route->source_stream != stream) &&
> > +		    (route->sink_pad != pad || route->sink_stream != stream))
> > +			continue;
> > +
> > +		if (index--)
> > +			continue;
> > +
> > +		return route;
> >  	}
> >
> > -	return -EINVAL;
> > +	return ERR_PTR(-ENOENT);
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_subdev_find_route);
> > +
> > +int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
> > +					  u32 pad, u32 stream, u32 *other_pad,
> > +					  u32 *other_stream)
> > +{
> > +	struct v4l2_subdev_route *route;
> > +
> > +	route = v4l2_subdev_find_route(routing, pad, stream, false, 0);
> > +	if (IS_ERR(route))
> > +		return PTR_ERR(route);
> > +
> > +	bool is_source = route->source_pad == pad;
> > +
> > +	if (other_pad)
> > +		*other_pad = is_source ? route->sink_pad : route->source_pad;
> > +	if (other_stream)
> > +		*other_stream = is_source ?
> > +			route->sink_stream : route->source_stream;
> > +
> > +	return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_subdev_routing_find_opposite_end);
> >
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index deab128a4779..9ed8600ba3d4 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1547,6 +1547,23 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> >  				     const struct v4l2_subdev_krouting *routing,
> >  				     const struct v4l2_mbus_framefmt *fmt);
> >
> > +/**
> > + * v4l2_subdev_find_route() - Find routes from a (pad, stream) pair
> 
> from or for ?

From or to. I'll fix this in the next version.

> 
> > + * @routing: routing used to find the opposite side
> 
> I would not say "opposite side" but rather
> 
>       @routing: routing table used to enumerate routes

How about simply "the routing table"?

> 
> > + * @pad: pad id
> > + * @stream: stream id
> > + * @active: set to true for looking up only active routes
> > + * @index: for accessing more than one route from the pad
> 
> I understand this but maybe
> 
>      @index: route index for enumerating multiple routes
> ?

Sounds good.

> 
> > + *
> > + * Find a route from the routing table where one end has (pad, stream) pair
> > + * matching @pad and @stream.
> 
>     * If multiple routes in @routing match @pad and @stream, return
>     * the @index one.
>     *
>     * Set @active to true to only enumerate active routes.
> 
> > + *
> > + * Returns the route on success or -ENOENT if no matching route is found.
> 
> I see other functions documentation using
> 
>     * Return:
> 
> is this a kernel-doc thing ?

Yes, makes sense.

> 
> > + */
> > +struct v4l2_subdev_route *
> > +v4l2_subdev_find_route(const struct v4l2_subdev_krouting *routing,
> > +		       u32 pad, u32 stream, bool active, unsigned int index);
> > +
> >  /**
> >   * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream
> >   * @routing: routing used to find the opposite side
> > @@ -1555,6 +1572,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> >   * @other_pad: pointer used to return the opposite pad
> >   * @other_stream: pointer used to return the opposite stream
> >   *
> > + * Prefer v4l2_subdev_find_route() over v4l2_subdev_routing_find_opposite_end().
> > + *
> 
> As said, I'm not sure if that's preferred or we should rather create
> more helpers using v4l2_subdev_find_route() internally. Time will tell
> I guess ?

I agree.

The benefit of the older function was that it returns information that
doesn't need a lock for accessing it.

-- 
Regards,

Sakari Ailus

