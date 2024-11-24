Return-Path: <linux-media+bounces-21869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E8A9D6CD0
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 07:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B12F1B21355
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 06:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB99C2AD02;
	Sun, 24 Nov 2024 06:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KflbeIQW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325D61FDA;
	Sun, 24 Nov 2024 06:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732430983; cv=none; b=kXB4bgBaX2mz0owGbOYdCk4Sj8gYEp1TN2JnTOIOqPP/IagUszHy0H/d1uZy/BgplOuRA7Dga+KYEyBf6ICsZMXhPF+LRLQ4cLV+FOUXpSK0/9G1ffcTyMAHTGb+PTh86SB6/04g967pC9MIA33P82uFdot2kwnA9tvERAHHsKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732430983; c=relaxed/simple;
	bh=56NZeVgEqDseacOk/VSKGfdQ+vXX19KpODinrcPF32w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cp96gJIbSvN0Qd+lwVkCnxHA3MpIcwKoBCIUemFCDiwFUW9FT28X8R4ZsVOlb4KdKgtB6Ndl1TleT77lORHTGUnzjxdxw5qwio08IDrTqDOltmWaopgiwcjkyK8bnVqGrE5lZKGcDnOl53bdDyAynvTKQejGfFfBjymB04fwdU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KflbeIQW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BC1F581;
	Sun, 24 Nov 2024 07:49:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732430957;
	bh=56NZeVgEqDseacOk/VSKGfdQ+vXX19KpODinrcPF32w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KflbeIQWWfuSVB4h0O4KZN4Ht0JpVTFtxLp12AGApMXxXJwNTtWIVqAonbLqnvG8u
	 wnKqn1kJr26fhCu/ISid9CnFGtUpGuIMLiO17BpzRcxyPKOz2vBF35ECYmNdGL+Zac
	 3jzYaMMJly3AUSuVWfrIgRdVTpt9kbuQJKkYGQdw=
Date: Sun, 24 Nov 2024 08:49:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l: subdev: Prevent NULL routes access
Message-ID: <20241124064929.GE19381@pendragon.ideasonboard.com>
References: <20241122143717.173344-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122143717.173344-1-demonsingur@gmail.com>

On Fri, Nov 22, 2024 at 04:37:12PM +0200, Cosmin Tanislav wrote:
> When using v4l2_subdev_set_routing to set a subdev's routing, and the
> passed routing.num_routes is 0, kmemdup is not called to populate the
> routes of the new routing (which is fine, since we wouldn't want to pass
> a possible NULL value to kmemdup).
> 
> This results in subdev's routing.routes to be NULL.
> 
> routing.routes is further used in some places without being guarded by
> the same num_routes non-zero condition.

What other places is that ? Have you experienced a crash anywhere ?

> 
> Fix it.
> 

A Fixes: tag would be good to help backporting.

> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 46 +++++++++++++--------------
>  1 file changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index cde1774c9098d..4f0eecd7fd66f 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -605,6 +605,23 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>  			     v4l2_subdev_get_unlocked_active_state(sd);
>  }
>  
> +static void subdev_copy_krouting(struct v4l2_subdev_routing *routing,
> +				 struct v4l2_subdev_krouting *krouting)

The second argument should be const.

> +{
> +	memset(routing->reserved, 0, sizeof(routing->reserved));
> +
> +	if (!krouting->routes) {
> +		routing->num_routes = 0;
> +		return;
> +	}
> +
> +	memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> +	       krouting->routes,
> +	       min(krouting->num_routes, routing->len_routes) *
> +	       sizeof(*krouting->routes));
> +	routing->num_routes = krouting->num_routes;
> +}
> +
>  static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  			    struct v4l2_subdev_state *state)
>  {
> @@ -976,7 +993,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  
>  	case VIDIOC_SUBDEV_G_ROUTING: {
>  		struct v4l2_subdev_routing *routing = arg;
> -		struct v4l2_subdev_krouting *krouting;
>  
>  		if (!v4l2_subdev_enable_streams_api)
>  			return -ENOIOCTLCMD;
> @@ -984,15 +1000,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
>  			return -ENOIOCTLCMD;
>  
> -		memset(routing->reserved, 0, sizeof(routing->reserved));
> -
> -		krouting = &state->routing;
> -
> -		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> -		       krouting->routes,
> -		       min(krouting->num_routes, routing->len_routes) *
> -		       sizeof(*krouting->routes));
> -		routing->num_routes = krouting->num_routes;
> +		subdev_copy_krouting(routing, &state->routing);
>  
>  		return 0;
>  	}
> @@ -1016,8 +1024,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		if (routing->num_routes > routing->len_routes)
>  			return -EINVAL;
>  
> -		memset(routing->reserved, 0, sizeof(routing->reserved));
> -
>  		for (i = 0; i < routing->num_routes; ++i) {
>  			const struct v4l2_subdev_route *route = &routes[i];
>  			const struct media_pad *pads = sd->entity.pads;
> @@ -1046,12 +1052,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		 * the routing table.
>  		 */
>  		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
> -			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> -			       state->routing.routes,
> -			       min(state->routing.num_routes, routing->len_routes) *
> -			       sizeof(*state->routing.routes));
> -			routing->num_routes = state->routing.num_routes;
> -
> +			subdev_copy_krouting(routing, &state->routing);
>  			return 0;
>  		}
>  
> @@ -1064,11 +1065,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		if (rval < 0)
>  			return rval;
>  
> -		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> -		       state->routing.routes,
> -		       min(state->routing.num_routes, routing->len_routes) *
> -		       sizeof(*state->routing.routes));
> -		routing->num_routes = state->routing.num_routes;
> +		subdev_copy_krouting(routing, &state->routing);
>  
>  		return 0;
>  	}
> @@ -1956,6 +1953,9 @@ struct v4l2_subdev_route *
>  __v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
>  				struct v4l2_subdev_route *route)
>  {
> +	if (!routing->routes)
> +		return NULL;
> +
>  	if (route)
>  		++route;
>  	else

-- 
Regards,

Laurent Pinchart

