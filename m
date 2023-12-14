Return-Path: <linux-media+bounces-2396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA2D812A48
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 09:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0691A1C214DF
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 08:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6042B208BD;
	Thu, 14 Dec 2023 08:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGJdfAk8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5669B106
	for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 00:26:05 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-336353782efso1923623f8f.0
        for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 00:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702542364; x=1703147164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G/avHuLAO2zV9ZzTswBSbhN7rIDw1N1/gcHI8szTbCc=;
        b=MGJdfAk8BKniUw6Jh9zN+UlOisq/TvxLhKOEecKOFFOIF9NOP6qPI0qkPzsiJI83W/
         8e3klKXx4oyyd5/ZxPfuS+k4TDGTa2fF5P5XiRpQ1ghiAecdYRu1tLCVBF3+8vFCqSo6
         jLhDodnmOxNZV+yunc4dfNwXt3tWB64P0rmy0hW1hJD9c2yjcGCayAm96zK63NiaY2iN
         D27YWDDxNrj+dQWZA9ZfO+SwEGPLj0bS9aRdz8ATx5Zb4Nm79mz7j/3N6ziqmbhCux+j
         xtvgdg267ogpVP3IKVgts40ZAf3B2SV8ZHwntRwZ45c5VIiuUhzVxkL4fRErbp/m2ALU
         R42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702542364; x=1703147164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/avHuLAO2zV9ZzTswBSbhN7rIDw1N1/gcHI8szTbCc=;
        b=bMNspVw7WQSlJvsCcWQhX9VooGGCzb8rKbC5phcy1Sw2XMpXvk09XpjcEGAJ9QTCcb
         WPn0TaFWJVapWk5QV5a+ToU2WUEyTdbsOM6XsYroV0C7A1mJcrtbOjk+etnyoxEidrNx
         cFV0ECmvvr71o4vlDbMIIBT7nJf9eqIq1ZjqO1RwzzElsvR+7XOCVoAGXRGYVRS1xOjD
         QENngAB06viLL9foleorKAgRRneEORKniZh1hgI5/I/KyqtyQsKJQdDQpI/Og0uSEP5l
         yGmHCFD+Zs0W9V/CqkwOebWe6n/rUqHZh85NqZnxNOzHCo5NH7gbAdW46SKoKNjobirU
         /v/g==
X-Gm-Message-State: AOJu0YwImG3tkmtmUBrC0x09ElYax7tGMbjGHMnUaTqhvK6ZQ59r7Iz2
	PC1CrJmUXaIyVkh98oPa+R7w2phkf+c=
X-Google-Smtp-Source: AGHT+IGqExwgjt55twLoScy37lcZjpcfmizG5cyoPu30JoAS2bqWe56DjBc31jqxGgu2c1vl068B9Q==
X-Received: by 2002:a5d:458c:0:b0:336:4538:c575 with SMTP id p12-20020a5d458c000000b003364538c575mr469478wrq.60.1702542363395;
        Thu, 14 Dec 2023 00:26:03 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-59-229.cust.vodafonedsl.it. [188.217.59.229])
        by smtp.gmail.com with ESMTPSA id x14-20020adfdd8e000000b0033630da3528sm5780629wrl.25.2023.12.14.00.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 00:26:03 -0800 (PST)
Date: Thu, 14 Dec 2023 09:26:01 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v6 4/8] media: v4l2-subdev: Store frame interval in
 subdev state
Message-ID: <ZXq8Gc+1gqVFbTAR@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20231213150010.25593-1-laurent.pinchart@ideasonboard.com>
 <20231213150010.25593-5-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213150010.25593-5-laurent.pinchart@ideasonboard.com>

Hi Laurent,

Applying this patch I received the following error from checkpatch.pl
maybe is a false positive or maybe I miss somenthing. Btw hope this help. :)

Applying: media: v4l2-subdev: Store frame interval in subdev state
No codespell typos will be found - file '/usr/share/codespell/dictionary.txt': No such file or directory
ERROR: Macros with complex values should be enclosed in parentheses
#135: FILE: include/media/v4l2-subdev.h:1411:
+#define v4l2_subdev_state_get_interval(state, pad, ...)			\
+	__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
+		(state, pad, ##__VA_ARGS__)

ERROR: space prohibited before that ',' (ctx:WxW)
#136: FILE: include/media/v4l2-subdev.h:1412:
+	__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\

Thanks & Regards,
Tommaso


On Wed, Dec 13, 2023 at 05:00:06PM +0200, Laurent Pinchart wrote:
> Subdev states store all standard pad configuration data, except for
> frame intervals. Fix it by adding interval fields in the
> v4l2_subdev_pad_config and v4l2_subdev_stream_config structures, with
> corresponding accessor functions and a helper function to implement the
> .get_frame_interval() operation.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v3:
> 
> - Use __v4l2_subdev_state_gen_call()
> 
> Changes since v2:
> 
> - Remove WARN_ON() on invalid pad
> - Add lockdep_assert_held()
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 52 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 43 ++++++++++++++++++++++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 30131a37f2d5..4c6198c48dd6 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1652,6 +1652,42 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
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
> +		if (pad >= state->sd->entity.num_pads)
> +			return NULL;
> +
> +		return &state->pads[pad].interval;
> +	}
> +
> +	lockdep_assert_held(state->lock);
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
> @@ -1718,6 +1754,22 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
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
> index 0ab7dce098e6..a9e6b8146279 100644
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
> @@ -1392,6 +1396,27 @@ struct v4l2_rect *
>  __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
>  				unsigned int pad, u32 stream);
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
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  
>  /**
> @@ -1411,6 +1436,24 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
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
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 

