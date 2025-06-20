Return-Path: <linux-media+bounces-35469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA4BAE15A1
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 10:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B1B218916B8
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 08:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E727B21FF31;
	Fri, 20 Jun 2025 08:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XCKkWUSf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E82D229B37
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 08:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407306; cv=none; b=D3vfJ32+3B7RCPS8iBLhSSFHkuPj84H+9KJYSTB1ND7ueZP7+eCcqqZjCHtLTk7oVPgxfU17rK8P8N5p+Oa4PuX9ATBMaENiCSsC09ny5+7DI/IMSZfnPQ7FjrCOdQproATHEJx/F8S5IGTuSbBeMF4kJCPZ/lOAbfLNpA4M4qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407306; c=relaxed/simple;
	bh=p5qvaWx/Bftv0u7aeBIJQcrKOLSg4Lfh1Yq5Smgh2QI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hnk4uUtYQ2SrkQZyxR1mONc2lKE8XF0ZnPE6KZMKwhF9UfYv+ODeDdPWwphKSqWfvc/e8vBCgjdDpdOFlG3ku7O1ho0mHJBnr1zwD/IntsnkZdEUJyGD+SGymBwzlc1YYqHGAvZ1msu15UcVDB4R3pNvXuh/n930phh27GK2smQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XCKkWUSf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B22FD7FA;
	Fri, 20 Jun 2025 10:14:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750407287;
	bh=p5qvaWx/Bftv0u7aeBIJQcrKOLSg4Lfh1Yq5Smgh2QI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCKkWUSfcKOXbtQ/jsBChwREtg8RMQtK/2ZYW0ceP7xO+Xxic4K+p2Uj3FbKUf8or
	 MM7yqIXo/zl9ZN6meMAPrcwVObgUwEXbXaQRknd/M96D3MYpx2ERPLEKdea65wHWYL
	 40KfkKP+iecZh5PD55casaZJO7LmlVsxyQdkH6Gc=
Date: Fri, 20 Jun 2025 10:14:58 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com, 
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com, tomi.valkeinen@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 11/13] media: v4l2-subdev: Introduce
 v4l2_subdev_find_route()
Message-ID: <fez66dv6tnyuhdfkqsy7fuwmq7kpw4vnuxaqq6j4butyjhfj3q@mz6zp7ensofq>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-12-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619081546.1582969-12-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 11:15:44AM +0300, Sakari Ailus wrote:
> v4l2_subdev_find_route() is like v4l2_subdev_routing_find_opposite_end(),
> with the difference that it's more flexible: it can look up only active
> routes and can find multiple routes, too.
>
> v4l2_subdev_find_route() is intended to replace
> v4l2_subdev_routing_find_opposite_end().

To me this feels like v4l2_subdev_find_route() could be used to
implement more helpers like v4l2_subdev_routing_find_opposite_end()
for drivers instead of going the other way around.

let's see what the use cases are

>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 56 ++++++++++++++++++---------
>  include/media/v4l2-subdev.h           | 19 +++++++++
>  2 files changed, 56 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index c549a462dac7..13d6e96daf3a 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1996,34 +1996,52 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
>
> -int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
> -					  u32 pad, u32 stream, u32 *other_pad,
> -					  u32 *other_stream)
> +struct v4l2_subdev_route *
> +v4l2_subdev_find_route(const struct v4l2_subdev_krouting *routing,
> +		       u32 pad, u32 stream, bool active, unsigned int index)
>  {
>  	unsigned int i;
>
>  	for (i = 0; i < routing->num_routes; ++i) {
>  		struct v4l2_subdev_route *route = &routing->routes[i];
>
> -		if (route->source_pad == pad &&
> -		    route->source_stream == stream) {
> -			if (other_pad)
> -				*other_pad = route->sink_pad;
> -			if (other_stream)
> -				*other_stream = route->sink_stream;
> -			return 0;
> -		}
> +		if (active && !(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> +			continue;

I know currently v4l2_subdev_routing_find_opposite_end() does return
any route that matches the provided 'pad' and 'stream' included
non-active ones, but I wonder if this is desirable. What is the use
case for enumerating a non-active route between two pads ?

(it is also my impression that all drivers that use
v4l2_subdev_routing_find_opposite_end() assume the route is active)

Also I wonder if the usage of V4L2_SUBDEV_ROUTE_FL_ACTIVE is clearly
defined, or, in other words, what is the use case for userspace to
create non-active routes, given that any new VIDIOC_SUBDEV_S_ROUTING
will anyway re-create the routing table (that's a different question,
on the ioctl definition and not on this change though)

>
> -		if (route->sink_pad == pad && route->sink_stream == stream) {
> -			if (other_pad)
> -				*other_pad = route->source_pad;
> -			if (other_stream)
> -				*other_stream = route->source_stream;
> -			return 0;
> -		}
> +		if ((route->source_pad != pad ||
> +		     route->source_stream != stream) &&
> +		    (route->sink_pad != pad || route->sink_stream != stream))
> +			continue;
> +
> +		if (index--)
> +			continue;
> +
> +		return route;
>  	}
>
> -	return -EINVAL;
> +	return ERR_PTR(-ENOENT);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_find_route);
> +
> +int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
> +					  u32 pad, u32 stream, u32 *other_pad,
> +					  u32 *other_stream)
> +{
> +	struct v4l2_subdev_route *route;
> +
> +	route = v4l2_subdev_find_route(routing, pad, stream, false, 0);
> +	if (IS_ERR(route))
> +		return PTR_ERR(route);
> +
> +	bool is_source = route->source_pad == pad;
> +
> +	if (other_pad)
> +		*other_pad = is_source ? route->sink_pad : route->source_pad;
> +	if (other_stream)
> +		*other_stream = is_source ?
> +			route->sink_stream : route->source_stream;
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_routing_find_opposite_end);
>
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index deab128a4779..9ed8600ba3d4 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1547,6 +1547,23 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
>  				     const struct v4l2_subdev_krouting *routing,
>  				     const struct v4l2_mbus_framefmt *fmt);
>
> +/**
> + * v4l2_subdev_find_route() - Find routes from a (pad, stream) pair

from or for ?

> + * @routing: routing used to find the opposite side

I would not say "opposite side" but rather

      @routing: routing table used to enumerate routes

> + * @pad: pad id
> + * @stream: stream id
> + * @active: set to true for looking up only active routes
> + * @index: for accessing more than one route from the pad

I understand this but maybe

     @index: route index for enumerating multiple routes
?

> + *
> + * Find a route from the routing table where one end has (pad, stream) pair
> + * matching @pad and @stream.

    * If multiple routes in @routing match @pad and @stream, return
    * the @index one.
    *
    * Set @active to true to only enumerate active routes.

> + *
> + * Returns the route on success or -ENOENT if no matching route is found.

I see other functions documentation using

    * Return:

is this a kernel-doc thing ?

> + */
> +struct v4l2_subdev_route *
> +v4l2_subdev_find_route(const struct v4l2_subdev_krouting *routing,
> +		       u32 pad, u32 stream, bool active, unsigned int index);
> +
>  /**
>   * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream
>   * @routing: routing used to find the opposite side
> @@ -1555,6 +1572,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
>   * @other_pad: pointer used to return the opposite pad
>   * @other_stream: pointer used to return the opposite stream
>   *
> + * Prefer v4l2_subdev_find_route() over v4l2_subdev_routing_find_opposite_end().
> + *

As said, I'm not sure if that's preferred or we should rather create
more helpers using v4l2_subdev_find_route() internally. Time will tell
I guess ?

Thanks
  j


>   * This function uses the routing table to find the pad + stream which is
>   * opposite the given pad + stream.
>   *
> --
> 2.39.5
>
>

