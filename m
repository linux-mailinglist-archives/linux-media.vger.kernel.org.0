Return-Path: <linux-media+bounces-1672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B783B80558A
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 14:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BCC22819B9
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 13:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DAA5C90D;
	Tue,  5 Dec 2023 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UdsMpgdQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4EB8194
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 05:10:48 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16F0636C;
	Tue,  5 Dec 2023 14:10:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701781807;
	bh=eGko6lMvTT693bBo+xL3dPSOf72+ORyTUnSp4D29kGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdsMpgdQKx91m46my4Oe/euPvPpYqRrB92XcFGL34xjLagNW9KK5SOp8ufto8ZWEI
	 1QNoKPBs0wXPe0VRenDy30/u2lH88K2u8wgFZEQkQoG5hct8rwU6wpllBrRQrfMNM9
	 kzICJ/WWU/1Gm+RyLufzI4j9FxlV+toyzkFYJxs8=
Date: Tue, 5 Dec 2023 15:10:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	hverkuil@xs4all.nl
Subject: Re: [PATCH v2 1/1] media: v4l: Make sub-device state information
 available to non-MC users
Message-ID: <20231205131054.GA29506@pendragon.ideasonboard.com>
References: <20231205130001.875327-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231205130001.875327-1-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Dec 05, 2023 at 03:00:01PM +0200, Sakari Ailus wrote:
> The sub-device state information access function were only available if
> CONFIG_MEDIA_CONTROLLER was defined whereas the functions themselves were
> used by non-MC-enabled drivers, too. Fix this by moving the definitions
> out of CONFIG_MEDIA_CONTROLLER dependent parts. Also make the MC dependent
> features conditional to CONFIG_MEDIA_CONTROLLER.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312051913.e5iif8Qz-lkp@intel.com/
> Fixes: bc0e8d91feec ("media: v4l: subdev: Switch to stream-aware state functions")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Thanks to Laurent for review.
> 
> since v1:
> 
> - I thought the c file had already this fixed. Also fixed that now and
>   changed the commit message accordingly.
> 
>  drivers/media/v4l2-core/v4l2-subdev.c | 216 ++++++++++++++------------
>  include/media/v4l2-subdev.h           | 158 +++++++++----------
>  2 files changed, 193 insertions(+), 181 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 4fbefe4cd714..30746a7df259 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1533,108 +1533,6 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
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
> -		if (pad >= state->sd->entity.num_pads)
> -			return NULL;
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
> -		if (pad >= state->sd->entity.num_pads)
> -			return NULL;
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
> -		if (pad >= state->sd->entity.num_pads)
> -			return NULL;
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
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  
>  static int
> @@ -2272,6 +2170,120 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_s_stream_helper);
>  
>  #endif /* CONFIG_MEDIA_CONTROLLER */
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
> +		if (pad >= state->sd->entity.num_pads)

This won't work, v4l2_subdev has no entity field when
CONFIG_MEDIA_CONTROLLER is not defined. Please compile-test further
versions of this patch.

Now, for an attempt to review v3 before you post it: dropping the

#if defined(CONFIG_MEDIA_CONTROLLER)

around the entity field of v4l2_subdev won't work either, as the
saa6752hs driver doesn't initialize the entity, so num_fields will be at
best memset to 0, at worst random. This check will then always fail.

> +			return NULL;
> +
> +		return &state->pads[pad].format;
> +	}
> +
> +#ifdef CONFIG_MEDIA_CONTROLLER
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
> +#endif /* CONFIG_MEDIA_CONTROLLER */
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
> +		if (pad >= state->sd->entity.num_pads)
> +			return NULL;
> +
> +		return &state->pads[pad].crop;
> +	}
> +
> +#ifdef CONFIG_MEDIA_CONTROLLER
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
> +#endif /* CONFIG_MEDIA_CONTROLLER */
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
> +		if (pad >= state->sd->entity.num_pads)
> +			return NULL;
> +
> +		return &state->pads[pad].compose;
> +	}
> +
> +#ifdef CONFIG_MEDIA_CONTROLLER
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
> +#endif /* CONFIG_MEDIA_CONTROLLER */
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose);
> +
>  void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
>  {
>  	INIT_LIST_HEAD(&sd->list);
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 8b08f6640dee..0099e177980e 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1186,6 +1186,85 @@ static inline void *v4l2_get_subdev_hostdata(const struct v4l2_subdev *sd)
>  	return sd->host_priv;
>  }
>  
> +/*
> + * A macro to generate the macro or function name for sub-devices state access
> + * wrapper macros below.
> + */
> +#define __v4l2_subdev_state_gen_call(NAME, _1, ARG, ...)	\
> +	__v4l2_subdev_state_get_ ## NAME ## ARG
> +
> +/**
> + * v4l2_subdev_state_get_format() - Get pointer to a stream format
> + * @state: subdevice state
> + * @pad: pad id
> + * @...: stream id (optional argument)
> + *
> + * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
> + * stream in the subdev state.
> + *
> + * For stream-unaware drivers the format for the corresponding pad is returned.
> + * If the pad does not exist, NULL is returned.
> + */
> +/*
> + * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
> + * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
> + * macro below is to come up with the name of the function or macro to call,
> + * using the last two arguments (_stream and _pad). The selected function or
> + * macro is then called using the arguments specified by the caller. A similar
> + * arrangement is used for v4l2_subdev_state_crop() and
> + * v4l2_subdev_state_compose() below.
> + */
> +#define v4l2_subdev_state_get_format(state, pad, ...)			\
> +	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
> +		(state, pad, ##__VA_ARGS__)
> +#define __v4l2_subdev_state_get_format_pad(state, pad)	\
> +	__v4l2_subdev_state_get_format(state, pad, 0)
> +struct v4l2_mbus_framefmt *
> +__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> +			       unsigned int pad, u32 stream);
> +
> +/**
> + * v4l2_subdev_state_get_crop() - Get pointer to a stream crop rectangle
> + * @state: subdevice state
> + * @pad: pad id
> + * @...: stream id (optional argument)
> + *
> + * This returns a pointer to crop rectangle for the given pad + stream in the
> + * subdev state.
> + *
> + * For stream-unaware drivers the crop rectangle for the corresponding pad is
> + * returned. If the pad does not exist, NULL is returned.
> + */
> +#define v4l2_subdev_state_get_crop(state, pad, ...)			\
> +	__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
> +		(state, pad, ##__VA_ARGS__)
> +#define __v4l2_subdev_state_get_crop_pad(state, pad)	\
> +	__v4l2_subdev_state_get_crop(state, pad, 0)
> +struct v4l2_rect *
> +__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> +			     u32 stream);
> +
> +/**
> + * v4l2_subdev_state_get_compose() - Get pointer to a stream compose rectangle
> + * @state: subdevice state
> + * @pad: pad id
> + * @...: stream id (optional argument)
> + *
> + * This returns a pointer to compose rectangle for the given pad + stream in the
> + * subdev state.
> + *
> + * For stream-unaware drivers the compose rectangle for the corresponding pad is
> + * returned. If the pad does not exist, NULL is returned.
> + */
> +#define v4l2_subdev_state_get_compose(state, pad, ...)			\
> +	__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
> +		(state, pad, ##__VA_ARGS__)
> +#define __v4l2_subdev_state_get_compose_pad(state, pad)	\
> +	__v4l2_subdev_state_get_compose(state, pad, 0)
> +struct v4l2_rect *
> +__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> +				unsigned int pad, u32 stream);
> +
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  
>  /**
> @@ -1394,85 +1473,6 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
>  	return sd->active_state;
>  }
>  
> -/*
> - * A macro to generate the macro or function name for sub-devices state access
> - * wrapper macros below.
> - */
> -#define __v4l2_subdev_state_gen_call(NAME, _1, ARG, ...)	\
> -	__v4l2_subdev_state_get_ ## NAME ## ARG
> -
> -/**
> - * v4l2_subdev_state_get_format() - Get pointer to a stream format
> - * @state: subdevice state
> - * @pad: pad id
> - * @...: stream id (optional argument)
> - *
> - * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
> - * stream in the subdev state.
> - *
> - * For stream-unaware drivers the format for the corresponding pad is returned.
> - * If the pad does not exist, NULL is returned.
> - */
> -/*
> - * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
> - * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
> - * macro below is to come up with the name of the function or macro to call,
> - * using the last two arguments (_stream and _pad). The selected function or
> - * macro is then called using the arguments specified by the caller. A similar
> - * arrangement is used for v4l2_subdev_state_crop() and
> - * v4l2_subdev_state_compose() below.
> - */
> -#define v4l2_subdev_state_get_format(state, pad, ...)			\
> -	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
> -		(state, pad, ##__VA_ARGS__)
> -#define __v4l2_subdev_state_get_format_pad(state, pad)	\
> -	__v4l2_subdev_state_get_format(state, pad, 0)
> -struct v4l2_mbus_framefmt *
> -__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> -			       unsigned int pad, u32 stream);
> -
> -/**
> - * v4l2_subdev_state_get_crop() - Get pointer to a stream crop rectangle
> - * @state: subdevice state
> - * @pad: pad id
> - * @...: stream id (optional argument)
> - *
> - * This returns a pointer to crop rectangle for the given pad + stream in the
> - * subdev state.
> - *
> - * For stream-unaware drivers the crop rectangle for the corresponding pad is
> - * returned. If the pad does not exist, NULL is returned.
> - */
> -#define v4l2_subdev_state_get_crop(state, pad, ...)			\
> -	__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
> -		(state, pad, ##__VA_ARGS__)
> -#define __v4l2_subdev_state_get_crop_pad(state, pad)	\
> -	__v4l2_subdev_state_get_crop(state, pad, 0)
> -struct v4l2_rect *
> -__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> -			     u32 stream);
> -
> -/**
> - * v4l2_subdev_state_get_compose() - Get pointer to a stream compose rectangle
> - * @state: subdevice state
> - * @pad: pad id
> - * @...: stream id (optional argument)
> - *
> - * This returns a pointer to compose rectangle for the given pad + stream in the
> - * subdev state.
> - *
> - * For stream-unaware drivers the compose rectangle for the corresponding pad is
> - * returned. If the pad does not exist, NULL is returned.
> - */
> -#define v4l2_subdev_state_get_compose(state, pad, ...)			\
> -	__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
> -		(state, pad, ##__VA_ARGS__)
> -#define __v4l2_subdev_state_get_compose_pad(state, pad)	\
> -	__v4l2_subdev_state_get_compose(state, pad, 0)
> -struct v4l2_rect *
> -__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> -				unsigned int pad, u32 stream);
> -
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  
>  /**

-- 
Regards,

Laurent Pinchart

