Return-Path: <linux-media+bounces-21935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 317309D7D0A
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 09:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6710282554
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 08:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8319C18BC20;
	Mon, 25 Nov 2024 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wb+VZV3K"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B84D188CCA;
	Mon, 25 Nov 2024 08:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732523969; cv=none; b=pYJa636oWzUXuHN4H4vjvyLqC5nVTfSCvL4kSx+DaTPgbT7rdh/heJ93PmUBhdeqikMFRMp3uviF0hVc1vUpjacycnW3xH7Y1UsBDaiijNwQWRws97ftypyZB76UJF1kEVwSfWGXQM/TIoxhRvPLzN0/bbIRf4p/eB9NV7d8Pds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732523969; c=relaxed/simple;
	bh=nr06fqkuz9zpacW3uVo8w69JrdlPRi65u6sEjvA77k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqI9l8uSYu2LFPC2bUYsYOtWIoYNXJpoR4kCioigRbgKZMmr14g4KpS+qOy6wdtpgngcgkp3lT6b736OPMfm8WejUpSoqCVq6NdbeUTGz6fjpGXHbZZiHJQVEv7aiFb8qp4AujO2l+UzZcLmw4pbNij/5XZ5BF8/c6Iv65uyuQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wb+VZV3K; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732523968; x=1764059968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nr06fqkuz9zpacW3uVo8w69JrdlPRi65u6sEjvA77k4=;
  b=Wb+VZV3KI6tX09VxsHe5P9jy2J1bTk5jV5/ct3gWS5oKwu3TFxbxmAw0
   09gmqRSis6LqLV44IfJzr3XQdpe4ratNqOTR8gcVxLi8Yu43uZXJ7299q
   xH5iE6uL/X6W0EHFnqPMMu9n2k15u1qoEWTdA0WJXDTr1OGuiZ8LWXwAn
   mcuarFuodkYzKD8JsOtBDzAabmF+2JbMg2eVaqmmmQZaMx4H0gGQM7hlI
   pwtchpMBrGmbqQlZvw779BVcGscFumswEf/0AjizE3we970MmEusFYR9Z
   rkNAKMLqoTdDVsdQtDK0VA8zrpyzkuJGmyWn3ho4lc7bguPxYT7YyLlmG
   A==;
X-CSE-ConnectionGUID: O+l5uiuyShKgMLc3RuQr9Q==
X-CSE-MsgGUID: gr1yt95ITb6xVXK6M2bSrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="44011933"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="44011933"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 00:39:27 -0800
X-CSE-ConnectionGUID: we5vnRDFSYCGBG2Dr8gRdw==
X-CSE-MsgGUID: N4hgFqsfTXq99OuJMNJU+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="91315411"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 00:39:25 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CAC2911F7E7;
	Mon, 25 Nov 2024 10:39:22 +0200 (EET)
Date: Mon, 25 Nov 2024 08:39:22 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l: subdev: Prevent NULL routes access
Message-ID: <Z0Q3ukermwmPax2b@kekkonen.localdomain>
References: <20241122143717.173344-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122143717.173344-1-demonsingur@gmail.com>

Hi Cosmin,

Thanks for the patch.

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
> 
> Fix it.

While I think moving the code to copy the routing table seems reasonable,
is there a need to make num_routes == 0 a special case? No memcpy()
implementation should access destination or source if the size is 0.

> 
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

Same here.

> +
>  	if (route)
>  		++route;
>  	else

-- 
Kind regards,

Sakari Ailus

