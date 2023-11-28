Return-Path: <linux-media+bounces-1195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C397FB616
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C86351C21005
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 09:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3684A980;
	Tue, 28 Nov 2023 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FC336AFA
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 09:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB2FC433C7;
	Tue, 28 Nov 2023 09:43:00 +0000 (UTC)
Message-ID: <cce5102a-edc7-441a-b1f3-704a237fe273@xs4all.nl>
Date: Tue, 28 Nov 2023 10:42:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] media: v4l2-subdev: Store frame interval in subdev
 state
Content-Language: en-US, nl
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20231127111359.30315-1-laurent.pinchart@ideasonboard.com>
 <20231127111703.30527-1-laurent.pinchart@ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231127111703.30527-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2023 12:17, Laurent Pinchart wrote:
> Subdev states store all standard pad configuration data, except for
> frame intervals. Fix it by adding interval fields in the
> v4l2_subdev_pad_config and v4l2_subdev_stream_config structures, with
> corresponding accessor functions and a helper function to implement the
> .get_frame_interval() operation.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Use __v4l2_subdev_state_gen_call()
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 50 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 43 +++++++++++++++++++++++
>  2 files changed, 93 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 4cbe4024ff67..559d6a5082b1 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1651,6 +1651,40 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
>  }
>  EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose);
>  
> +struct v4l2_fract *
> +__v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
> +				 unsigned int pad, u32 stream)
> +{
> +	struct v4l2_subdev_stream_configs *stream_configs;
> +	unsigned int i;
> +
> +	if (WARN_ON(!state))
> +		return NULL;
> +
> +	lockdep_assert_held(state->lock);
> +
> +	if (state->pads) {
> +		if (stream)
> +			return NULL;
> +
> +		if (WARN_ON(pad >= state->sd->entity.num_pads))
> +			pad = 0;

In the other variants (e.g. __v4l2_subdev_state_get_compose) there
is no WARN_ON and it just returns NULL.

> +
> +		return &state->pads[pad].interval;
> +	}

The other variants have a lockdep_assert_held(state->lock); here.

I think this should be the same as the other variants.

> +
> +	stream_configs = &state->stream_configs;
> +
> +	for (i = 0; i < stream_configs->num_configs; ++i) {
> +		if (stream_configs->configs[i].pad == pad &&
> +		    stream_configs->configs[i].stream == stream)
> +			return &stream_configs->configs[i].interval;
> +	}
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_interval);
> +
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  
>  static int
> @@ -1717,6 +1751,22 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
>  
> +int v4l2_subdev_get_frame_interval(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state,
> +				   struct v4l2_subdev_frame_interval *fi)
> +{
> +	struct v4l2_fract *interval;
> +
> +	interval = v4l2_subdev_state_get_interval(state, fi->pad, fi->stream);
> +	if (!interval)
> +		return -EINVAL;
> +
> +	fi->interval = *interval;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_interval);
> +
>  int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
>  			    struct v4l2_subdev_state *state,
>  			    const struct v4l2_subdev_krouting *routing)
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index b2dbaa739afa..4d87e8ece872 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -681,11 +681,13 @@ struct v4l2_subdev_ir_ops {
>   * @format: &struct v4l2_mbus_framefmt
>   * @crop: &struct v4l2_rect to be used for crop
>   * @compose: &struct v4l2_rect to be used for compose
> + * @interval: frame interval
>   */
>  struct v4l2_subdev_pad_config {
>  	struct v4l2_mbus_framefmt format;
>  	struct v4l2_rect crop;
>  	struct v4l2_rect compose;
> +	struct v4l2_fract interval;
>  };
>  
>  /**
> @@ -697,6 +699,7 @@ struct v4l2_subdev_pad_config {
>   * @fmt: &struct v4l2_mbus_framefmt
>   * @crop: &struct v4l2_rect to be used for crop
>   * @compose: &struct v4l2_rect to be used for compose
> + * @interval: frame interval
>   *
>   * This structure stores configuration for a stream.
>   */
> @@ -708,6 +711,7 @@ struct v4l2_subdev_stream_config {
>  	struct v4l2_mbus_framefmt fmt;
>  	struct v4l2_rect crop;
>  	struct v4l2_rect compose;
> +	struct v4l2_fract interval;
>  };
>  
>  /**
> @@ -1494,6 +1498,24 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
>  int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format);
>  
> +/**
> + * v4l2_subdev_get_frame_interval() - Fill frame interval based on state
> + * @sd: subdevice
> + * @state: subdevice state
> + * @fi: pointer to &struct v4l2_subdev_frame_interval
> + *
> + * Fill @fi->interval field based on the information in the @fi struct.
> + *
> + * This function can be used by the subdev drivers which support active state to
> + * implement v4l2_subdev_pad_ops.get_frame_interval if the subdev driver does
> + * not need to do anything special in their get_frame_interval op.
> + *
> + * Returns 0 on success, error value otherwise.
> + */
> +int v4l2_subdev_get_frame_interval(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state,
> +				   struct v4l2_subdev_frame_interval *fi);
> +
>  /**
>   * v4l2_subdev_set_routing() - Set given routing to subdev state
>   * @sd: The subdevice
> @@ -1539,6 +1561,27 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
>  				     const struct v4l2_subdev_krouting *routing,
>  				     const struct v4l2_mbus_framefmt *fmt);
>  
> +/**
> + * v4l2_subdev_state_get_interval() - Get pointer to a stream frame interval
> + * @state: subdevice state
> + * @pad: pad id
> + * @...: stream id (optional argument)
> + *
> + * This returns a pointer to the frame interval for the given pad + stream in
> + * the subdev state.
> + *
> + * For stream-unaware drivers the frame interval for the corresponding pad is
> + * returned. If the pad does not exist, NULL is returned.
> + */
> +#define v4l2_subdev_state_get_interval(state, pad, ...)			\
> +	__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
> +		(state, pad, ##__VA_ARGS__)
> +#define __v4l2_subdev_state_get_interval_pad(state, pad)	\
> +	__v4l2_subdev_state_get_interval(state, pad, 0)
> +struct v4l2_fract *
> +__v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
> +				 unsigned int pad, u32 stream);
> +
>  /**
>   * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream
>   * @routing: routing used to find the opposite side

Regards,

	Hans

