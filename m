Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC86936E3E1
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 06:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237915AbhD2Dq6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 23:46:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42520 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238032AbhD2Dq5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 23:46:57 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2F99BC0;
        Thu, 29 Apr 2021 05:46:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619667970;
        bh=SU28/jFnXbe/k9NXYsNWnCz4tlKq9/2iXGDdZinZOqY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=co6aBr0jnuUonavnr2NKAmPWRtasvgyLa9XjAqwgH9UcVV0UmeXd3XcxATiOxhSjb
         Oq7+FWx65BXer6cLLsTgASAZc3ZK2XJGkWVGJde4CVExsS6KyvO59tQHANNlT+IfP6
         QGd9LEikktVkvPM+9ymCf/aQVkPlu8xHX09GHPJU=
Date:   Thu, 29 Apr 2021 06:46:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v6 20/24] v4l: subdev: routing kernel helper functions
Message-ID: <YIor+41ZQDLgDTqj@pendragon.ideasonboard.com>
References: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
 <20210427124523.990938-21-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210427124523.990938-21-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Apr 27, 2021 at 03:45:19PM +0300, Tomi Valkeinen wrote:
> Add helper functions for routing.
> 
> TODO: add docs.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 90 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 14 +++++
>  2 files changed, 104 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index ad79ce121cee..31e279292ea6 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -910,6 +910,96 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>  	return -EINVAL;
>  }
>  
> +int v4l2_subdev_get_krouting(struct v4l2_subdev *sd,

I wonder if we could call the function v4l2_subdev_get_routing(), the
functions below don't have a k prefix.

> +			     struct v4l2_subdev_krouting *routing)
> +{
> +	int ret;
> +
> +	routing->which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +	routing->routes = NULL;
> +	routing->num_routes = 0;
> +
> +	ret = v4l2_subdev_call(sd, pad, get_routing, routing);
> +	if (ret == 0)
> +		return 0;
> +	if (ret != -ENOSPC)
> +		return ret;
> +
> +	routing->routes = kvmalloc_array(routing->num_routes,
> +					 sizeof(*routing->routes), GFP_KERNEL);
> +	if (!routing->routes)
> +		return -ENOMEM;
> +
> +	ret = v4l2_subdev_call(sd, pad, get_routing, routing);
> +	if (ret) {
> +		kvfree(routing->routes);

Should we handle the case where the subdev configuration gets changed
between the two calls, and the number of routes increases ? If that can
happen, there's also a risk for the routing configuration to be stale
already when this function returns, so it's probably the caller that
needs to ensure this can't happen.

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_krouting);
> +
> +void v4l2_subdev_free_routing(struct v4l2_subdev_krouting *routing)
> +{
> +	kvfree(routing->routes);
> +	routing->routes = NULL;

I'd set num_routes to 0 too.

> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_free_routing);
> +
> +void v4l2_subdev_cpy_routing(struct v4l2_subdev_krouting *dst,
> +			     const struct v4l2_subdev_krouting *src)
> +{
> +	memcpy(dst->routes, src->routes,
> +	       src->num_routes * sizeof(*src->routes));

Is there a guarantee that dst has allocated enough entries in routes ?
It seems a bit fragile.

> +	dst->num_routes = src->num_routes;
> +	dst->which = src->which;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_cpy_routing);
> +
> +int v4l2_subdev_dup_routing(struct v4l2_subdev_krouting *dst,
> +			    const struct v4l2_subdev_krouting *src)
> +{
> +	if (dst->routes)
> +		kvfree(dst->routes);

I'd set routes to NULL and num_routes to 0 here, so that num_routes
would be 0 if the allocation fails below. The performance impact will be
negligible, and the data will be more coherent. We could set num_routes
to 0 in the allocation error path, but splitting the kvfree() and the
routes and num_routes assignments opens the door to more bugs when this
function will be extended/refactored.

> +
> +	if (src->num_routes == 0) {
> +		dst->which = src->which;
> +		dst->routes = NULL;
> +		dst->num_routes = 0;
> +		return 0;
> +	}
> +
> +	dst->routes = kvmalloc_array(src->num_routes, sizeof(*src->routes),
> +				     GFP_KERNEL);
> +	if (!dst->routes)
> +		return -ENOMEM;
> +
> +	v4l2_subdev_cpy_routing(dst, src);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_dup_routing);
> +
> +bool v4l2_subdev_has_route(struct v4l2_subdev_krouting *routing,
> +			   unsigned int pad0, unsigned int pad1)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < routing->num_routes; ++i) {
> +		struct v4l2_subdev_route *route = &routing->routes[i];
> +
> +		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> +			continue;
> +
> +		if (route->sink_pad == pad0 && route->source_pad == pad1)

pad0 and pad1 should be renamed to sink_pad and source_pad if that's how
they need to be used. Given that this function is called in the media
entity .has_route() operation, which only guarantees that pad0 < pad 1,
we probably want to support the case where pad0 is a source pad and pad1
a sink pad.

I'm trying to recall why the media entity operation was designed this
way, and I think it was meant to support testing if two sink pads or two
source pads are connected by routes, indirectly. For instance, if a
subdev has one sink pad A and two source pads B and C, active routes
from A to B and from A to C should result in .has_route(B, C) returning
true. If I remember correctly, this was needed by the graph traversal
code, but that would need to be double-checked.

> +			return true;
> +	}
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_has_route);
> +
>  int v4l2_subdev_link_validate(struct media_link *link)
>  {
>  	struct v4l2_subdev *sink;
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index c45f5f0156c9..1235d4832b76 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1235,4 +1235,18 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
>  void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
>  			      const struct v4l2_event *ev);
>  
> +int v4l2_subdev_get_krouting(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_krouting *routing);
> +
> +void v4l2_subdev_free_routing(struct v4l2_subdev_krouting *routing);
> +
> +int v4l2_subdev_dup_routing(struct v4l2_subdev_krouting *dst,
> +			    const struct v4l2_subdev_krouting *src);
> +
> +void v4l2_subdev_cpy_routing(struct v4l2_subdev_krouting *dst,
> +			     const struct v4l2_subdev_krouting *src);
> +
> +bool v4l2_subdev_has_route(struct v4l2_subdev_krouting *routing,
> +			   unsigned int pad0, unsigned int pad1);
> +
>  #endif

-- 
Regards,

Laurent Pinchart
