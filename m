Return-Path: <linux-media+bounces-568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CD27F0226
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 20:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3970DB20A89
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 19:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700931A738;
	Sat, 18 Nov 2023 19:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Cfpc4tfV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F6584
	for <linux-media@vger.kernel.org>; Sat, 18 Nov 2023 11:01:19 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A530DA7;
	Sat, 18 Nov 2023 20:00:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700334049;
	bh=YiZGPHh5JcdUN9BYdm33x3VqHKv1xbIyM8GpRzaqXYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cfpc4tfVnZaV81wkG45IxkG1k1QUveEXnTDb1SmtktbyYjo6jhuuEq7JRsgTImWNM
	 Ni0NzymKHJTM6XulPvmQOOKBoA6Q5uWroGE4pSSRrlaoSPFlPlrmFDvko0r6PlegaL
	 Yu+ul6exXYq1hMnDsTGnOx/PRl5mogN/U4ulvN0U=
Date: Sat, 18 Nov 2023 21:01:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 6/9] media: v4l: subdev: Always compile sub-device
 state access functions
Message-ID: <20231118190124.GA28790@pendragon.ideasonboard.com>
References: <20231117101140.1338288-1-sakari.ailus@linux.intel.com>
 <20231117101140.1338288-7-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231117101140.1338288-7-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Fri, Nov 17, 2023 at 12:11:36PM +0200, Sakari Ailus wrote:
> Compile sub-device state information access functions
> v4l2_subdev_state_get_{format,crop,compose} unconditionally as they are
> now also used by plain V4L2 drivers.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 252 +++++++++++++-------------
>  include/media/v4l2-subdev.h           | 128 ++++++-------
>  2 files changed, 190 insertions(+), 190 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 06988e3a6f10..41fe9fa5c21a 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1531,6 +1531,132 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
>  
> +struct v4l2_mbus_framefmt *
> +__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> +			       unsigned int pad, u32 stream)
> +{
> +	struct v4l2_subdev_stream_configs *stream_configs;
> +	unsigned int i;
> +
> +	if (WARN_ON_ONCE(!state))
> +		return NULL;
> +
> +	if (state->pads) {
> +		if (stream)
> +			return NULL;
> +
> +		/*
> +		 * Set the pad to 0 on error as this is aligned with the
> +		 * behaviour of the pad state information access functions. The
> +		 * purpose of setting pad to 0 here is to avoid accessing memory
> +		 * outside the pads array, but still issuing warning of the
> +		 * invalid access while making the caller's error handling
> +		 * easier.
> +		 */
> +		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
> +			pad = 0;
> +
> +		return &state->pads[pad].format;
> +	}
> +
> +	lockdep_assert_held(state->lock);
> +
> +	stream_configs = &state->stream_configs;
> +
> +	for (i = 0; i < stream_configs->num_configs; ++i) {
> +		if (stream_configs->configs[i].pad == pad &&
> +		    stream_configs->configs[i].stream == stream)
> +			return &stream_configs->configs[i].fmt;
> +	}
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_format);
> +
> +struct v4l2_rect *
> +__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> +			     u32 stream)
> +{
> +	struct v4l2_subdev_stream_configs *stream_configs;
> +	unsigned int i;
> +
> +	if (WARN_ON_ONCE(!state))
> +		return NULL;
> +
> +	if (state->pads) {
> +		if (stream)
> +			return NULL;
> +
> +		/*
> +		 * Set the pad to 0 on error as this is aligned with the
> +		 * behaviour of the pad state information access functions. The
> +		 * purpose of setting pad to 0 here is to avoid accessing memory
> +		 * outside the pads array, but still issuing warning of the
> +		 * invalid access while making the caller's error handling
> +		 * easier.
> +		 */
> +		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
> +			pad = 0;
> +
> +		return &state->pads[pad].crop;
> +	}
> +
> +	lockdep_assert_held(state->lock);
> +
> +	stream_configs = &state->stream_configs;
> +
> +	for (i = 0; i < stream_configs->num_configs; ++i) {
> +		if (stream_configs->configs[i].pad == pad &&
> +		    stream_configs->configs[i].stream == stream)
> +			return &stream_configs->configs[i].crop;
> +	}
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_crop);
> +
> +struct v4l2_rect *
> +__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> +				unsigned int pad, u32 stream)
> +{
> +	struct v4l2_subdev_stream_configs *stream_configs;
> +	unsigned int i;
> +
> +	if (WARN_ON_ONCE(!state))
> +		return NULL;
> +
> +	if (state->pads) {
> +		if (stream)
> +			return NULL;
> +
> +		/*
> +		 * Set the pad to 0 on error as this is aligned with the
> +		 * behaviour of the pad state information access functions. The
> +		 * purpose of setting pad to 0 here is to avoid accessing memory
> +		 * outside the pads array, but still issuing warning of the
> +		 * invalid access while making the caller's error handling
> +		 * easier.
> +		 */
> +		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
> +			pad = 0;
> +
> +		return &state->pads[pad].compose;
> +	}
> +
> +	lockdep_assert_held(state->lock);
> +
> +	stream_configs = &state->stream_configs;
> +
> +	for (i = 0; i < stream_configs->num_configs; ++i) {
> +		if (stream_configs->configs[i].pad == pad &&
> +		    stream_configs->configs[i].stream == stream)
> +			return &stream_configs->configs[i].compose;
> +	}
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose);
> +
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  
>  static int
> @@ -1677,132 +1803,6 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
>  
> -struct v4l2_mbus_framefmt *
> -__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> -			       unsigned int pad, u32 stream)
> -{
> -	struct v4l2_subdev_stream_configs *stream_configs;
> -	unsigned int i;
> -
> -	if (WARN_ON_ONCE(!state))
> -		return NULL;
> -
> -	if (state->pads) {
> -		if (stream)
> -			return NULL;
> -
> -		/*
> -		 * Set the pad to 0 on error as this is aligned with the
> -		 * behaviour of the pad state information access functions. The
> -		 * purpose of setting pad to 0 here is to avoid accessing memory
> -		 * outside the pads array, but still issuing warning of the
> -		 * invalid access while making the caller's error handling
> -		 * easier.
> -		 */
> -		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
> -			pad = 0;
> -
> -		return &state->pads[pad].format;
> -	}
> -
> -	lockdep_assert_held(state->lock);
> -
> -	stream_configs = &state->stream_configs;
> -
> -	for (i = 0; i < stream_configs->num_configs; ++i) {
> -		if (stream_configs->configs[i].pad == pad &&
> -		    stream_configs->configs[i].stream == stream)
> -			return &stream_configs->configs[i].fmt;
> -	}
> -
> -	return NULL;
> -}
> -EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_format);
> -
> -struct v4l2_rect *
> -__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> -			     u32 stream)
> -{
> -	struct v4l2_subdev_stream_configs *stream_configs;
> -	unsigned int i;
> -
> -	if (WARN_ON_ONCE(!state))
> -		return NULL;
> -
> -	if (state->pads) {
> -		if (stream)
> -			return NULL;
> -
> -		/*
> -		 * Set the pad to 0 on error as this is aligned with the
> -		 * behaviour of the pad state information access functions. The
> -		 * purpose of setting pad to 0 here is to avoid accessing memory
> -		 * outside the pads array, but still issuing warning of the
> -		 * invalid access while making the caller's error handling
> -		 * easier.
> -		 */
> -		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
> -			pad = 0;
> -
> -		return &state->pads[pad].crop;
> -	}
> -
> -	lockdep_assert_held(state->lock);
> -
> -	stream_configs = &state->stream_configs;
> -
> -	for (i = 0; i < stream_configs->num_configs; ++i) {
> -		if (stream_configs->configs[i].pad == pad &&
> -		    stream_configs->configs[i].stream == stream)
> -			return &stream_configs->configs[i].crop;
> -	}
> -
> -	return NULL;
> -}
> -EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_crop);
> -
> -struct v4l2_rect *
> -__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> -				unsigned int pad, u32 stream)
> -{
> -	struct v4l2_subdev_stream_configs *stream_configs;
> -	unsigned int i;
> -
> -	if (WARN_ON_ONCE(!state))
> -		return NULL;
> -
> -	if (state->pads) {
> -		if (stream)
> -			return NULL;
> -
> -		/*
> -		 * Set the pad to 0 on error as this is aligned with the
> -		 * behaviour of the pad state information access functions. The
> -		 * purpose of setting pad to 0 here is to avoid accessing memory
> -		 * outside the pads array, but still issuing warning of the
> -		 * invalid access while making the caller's error handling
> -		 * easier.
> -		 */
> -		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
> -			pad = 0;
> -
> -		return &state->pads[pad].compose;
> -	}
> -
> -	lockdep_assert_held(state->lock);
> -
> -	stream_configs = &state->stream_configs;
> -
> -	for (i = 0; i < stream_configs->num_configs; ++i) {
> -		if (stream_configs->configs[i].pad == pad &&
> -		    stream_configs->configs[i].stream == stream)
> -			return &stream_configs->configs[i].compose;
> -	}
> -
> -	return NULL;
> -}
> -EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose);
> -
>  int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
>  					  u32 pad, u32 stream, u32 *other_pad,
>  					  u32 *other_stream)
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index c8ac91a2cdb8..80744d87bae4 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1470,70 +1470,6 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
>  	return sd->active_state;
>  }
>  
> -#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> -
> -/**
> - * v4l2_subdev_get_fmt() - Fill format based on state
> - * @sd: subdevice
> - * @state: subdevice state
> - * @format: pointer to &struct v4l2_subdev_format
> - *
> - * Fill @format->format field based on the information in the @format struct.
> - *
> - * This function can be used by the subdev drivers which support active state to
> - * implement v4l2_subdev_pad_ops.get_fmt if the subdev driver does not need to
> - * do anything special in their get_fmt op.
> - *
> - * Returns 0 on success, error value otherwise.
> - */
> -int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> -			struct v4l2_subdev_format *format);
> -
> -/**
> - * v4l2_subdev_set_routing() - Set given routing to subdev state
> - * @sd: The subdevice
> - * @state: The subdevice state
> - * @routing: Routing that will be copied to subdev state
> - *
> - * This will release old routing table (if any) from the state, allocate
> - * enough space for the given routing, and copy the routing.
> - *
> - * This can be used from the subdev driver's set_routing op, after validating
> - * the routing.
> - */
> -int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
> -			    struct v4l2_subdev_state *state,
> -			    const struct v4l2_subdev_krouting *routing);
> -
> -struct v4l2_subdev_route *
> -__v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
> -				struct v4l2_subdev_route *route);
> -
> -/**
> - * for_each_active_route - iterate on all active routes of a routing table
> - * @routing: The routing table
> - * @route: The route iterator
> - */
> -#define for_each_active_route(routing, route) \
> -	for ((route) = NULL;                  \
> -	     ((route) = __v4l2_subdev_next_active_route((routing), (route)));)
> -
> -/**
> - * v4l2_subdev_set_routing_with_fmt() - Set given routing and format to subdev
> - *					state
> - * @sd: The subdevice
> - * @state: The subdevice state
> - * @routing: Routing that will be copied to subdev state
> - * @fmt: Format used to initialize all the streams
> - *
> - * This is the same as v4l2_subdev_set_routing, but additionally initializes
> - * all the streams using the given format.
> - */
> -int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> -				     struct v4l2_subdev_state *state,
> -				     const struct v4l2_subdev_krouting *routing,
> -				     const struct v4l2_mbus_framefmt *fmt);
> -
>  /*
>   * A macro to generate the macro or function name for sub-devices state access
>   * wrapper macros below.
> @@ -1613,6 +1549,70 @@ struct v4l2_rect *
>  __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
>  				unsigned int pad, u32 stream);
>  
> +#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> +
> +/**
> + * v4l2_subdev_get_fmt() - Fill format based on state
> + * @sd: subdevice
> + * @state: subdevice state
> + * @format: pointer to &struct v4l2_subdev_format
> + *
> + * Fill @format->format field based on the information in the @format struct.
> + *
> + * This function can be used by the subdev drivers which support active state to
> + * implement v4l2_subdev_pad_ops.get_fmt if the subdev driver does not need to
> + * do anything special in their get_fmt op.
> + *
> + * Returns 0 on success, error value otherwise.
> + */
> +int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> +			struct v4l2_subdev_format *format);
> +
> +/**
> + * v4l2_subdev_set_routing() - Set given routing to subdev state
> + * @sd: The subdevice
> + * @state: The subdevice state
> + * @routing: Routing that will be copied to subdev state
> + *
> + * This will release old routing table (if any) from the state, allocate
> + * enough space for the given routing, and copy the routing.
> + *
> + * This can be used from the subdev driver's set_routing op, after validating
> + * the routing.
> + */
> +int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state,
> +			    const struct v4l2_subdev_krouting *routing);
> +
> +struct v4l2_subdev_route *
> +__v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
> +				struct v4l2_subdev_route *route);
> +
> +/**
> + * for_each_active_route - iterate on all active routes of a routing table
> + * @routing: The routing table
> + * @route: The route iterator
> + */
> +#define for_each_active_route(routing, route) \
> +	for ((route) = NULL;                  \
> +	     ((route) = __v4l2_subdev_next_active_route((routing), (route)));)
> +
> +/**
> + * v4l2_subdev_set_routing_with_fmt() - Set given routing and format to subdev
> + *					state
> + * @sd: The subdevice
> + * @state: The subdevice state
> + * @routing: Routing that will be copied to subdev state
> + * @fmt: Format used to initialize all the streams
> + *
> + * This is the same as v4l2_subdev_set_routing, but additionally initializes
> + * all the streams using the given format.
> + */
> +int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> +				     struct v4l2_subdev_state *state,
> +				     const struct v4l2_subdev_krouting *routing,
> +				     const struct v4l2_mbus_framefmt *fmt);
> +
>  /**
>   * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream
>   * @routing: routing used to find the opposite side

-- 
Regards,

Laurent Pinchart

