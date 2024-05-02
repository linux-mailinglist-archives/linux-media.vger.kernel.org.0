Return-Path: <linux-media+bounces-10640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B37958BA00C
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 20:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D65441C21E4A
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 18:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA7E16FF2B;
	Thu,  2 May 2024 18:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sPqElGxZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B07173345;
	Thu,  2 May 2024 18:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714673421; cv=none; b=PgOuQOz/OlweCJBtzHmDOklV7ZXp5+Q7H3Hwu6XQG3ANReoaA1B7nkL9e0K0jkOh2wt7M8UqTerfgRPxJ4HOJmpOw8Tf9blWOhbSaRxY10BpTQoiQS3dKliQ6uwXhtCjOBjl/97dxMJ6VObgux8KC36T3Sb3kltZp7oqhwD1SgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714673421; c=relaxed/simple;
	bh=q88Ccf/0Z471+bvYBtY9Z2N8aRxza/c+Xk+7KsuNxPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czAv1Yioe00kf6dDMCed2zWDL+o6uMjwrXwGb+/OcGnW5veVwO41kInP8VI6i3ZoW8ScYhr8kCyqlz8Zjl29v9BUl4XVJj7Iti9xRcasZ84QnCD8ibbyvGWEFeephrNDhqkBXeAH3vEZCu4lQXLKCtNObv+wz7n4m2pe7CDD4hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sPqElGxZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C63963B;
	Thu,  2 May 2024 20:09:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714673359;
	bh=q88Ccf/0Z471+bvYBtY9Z2N8aRxza/c+Xk+7KsuNxPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sPqElGxZeixwH+49ztTu8jV5WL/Qw9mxDQl9yhcBKoRq/5MKDgXxkhiKfbeXAd0ya
	 L4NdxPbktttIUe4HeqyYkDmjUHW4iDltoujstMtQIV18tZHvRj47YxoL8xpfs7m04M
	 e0cL5Wpkf1K5NQ3BjHDIutG3hrhj9PU/TAhrieQY=
Date: Thu, 2 May 2024 21:10:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 08/19] media: max9286: Add support for subdev active state
Message-ID: <20240502181009.GO15807@pendragon.ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-9-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430103956.60190-9-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Apr 30, 2024 at 12:39:44PM +0200, Jacopo Mondi wrote:
> Use the subdev active state in the max9286 driver to store the
> image format.
> 
> Replace the .open() function call with the .init_state() one and
> simplify the set/get_pad_fmt() operations.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 110 ++++++++++++------------------------
>  1 file changed, 37 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index d685d445cf23..fb13bfde42df 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -19,7 +19,6 @@
>  #include <linux/i2c.h>
>  #include <linux/i2c-mux.h>
>  #include <linux/module.h>
> -#include <linux/mutex.h>
>  #include <linux/of_graph.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
> @@ -198,12 +197,8 @@ struct max9286_priv {
>  	struct v4l2_ctrl *pixelrate_ctrl;
>  	unsigned int pixelrate;
>  
> -	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
>  	struct v4l2_fract interval;
>  
> -	/* Protects controls and fmt structures */
> -	struct mutex mutex;
> -
>  	unsigned int nsources;
>  	unsigned int source_mask;
>  	unsigned int route_mask;
> @@ -788,19 +783,23 @@ static void max9286_v4l2_notifier_unregister(struct max9286_priv *priv)
>  static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct max9286_priv *priv = sd_to_max9286(sd);
> +	struct v4l2_subdev_state *state;
>  	struct max9286_source *source;
>  	unsigned int i;
>  	bool sync = false;
> -	int ret;
> +	int ret = 0;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>  
>  	if (enable) {
>  		const struct v4l2_mbus_framefmt *format;
> +		unsigned int source_idx = __ffs(priv->bound_sources);
>  
>  		/*
>  		 * Get the format from the first used sink pad, as all sink
>  		 * formats must be identical.
>  		 */
> -		format = &priv->fmt[__ffs(priv->bound_sources)];
> +		format = v4l2_subdev_state_get_format(state, source_idx);

It would be simpler to get the format from the source pad, as all
formats are identical unless I'm mistaken. It may become more complex
when introducing streams though.

>  
>  		max9286_set_video_format(priv, format);
>  		max9286_set_fsync_period(priv);
> @@ -816,12 +815,12 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  		for_each_source(priv, source) {
>  			ret = v4l2_subdev_call(source->sd, video, s_stream, 1);
>  			if (ret)
> -				return ret;
> +				goto err_unlock;
>  		}
>  
>  		ret = max9286_check_video_links(priv);
>  		if (ret)
> -			return ret;
> +			goto err_unlock;
>  
>  		/*
>  		 * Wait until frame synchronization is locked.
> @@ -842,7 +841,8 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  		if (!sync) {
>  			dev_err(&priv->client->dev,
>  				"Failed to get frame synchronization\n");
> -			return -EXDEV; /* Invalid cross-device link */
> +			ret = -EXDEV; /* Invalid cross-device link */
> +			goto err_unlock;
>  		}
>  
>  		/*
> @@ -865,7 +865,10 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  		max9286_i2c_mux_close(priv);
>  	}
>  
> -	return 0;
> +err_unlock:

As this is used in the success path too, name the label 'done' or 'out'
or 'unlock'.

> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
>  }
>  
>  static int max9286_get_frame_interval(struct v4l2_subdev *sd,
> @@ -922,29 +925,16 @@ static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -static struct v4l2_mbus_framefmt *
> -max9286_get_pad_format(struct max9286_priv *priv,
> -		       struct v4l2_subdev_state *sd_state,
> -		       unsigned int pad, u32 which)
> -{
> -	switch (which) {
> -	case V4L2_SUBDEV_FORMAT_TRY:
> -		return v4l2_subdev_state_get_format(sd_state, pad);
> -	case V4L2_SUBDEV_FORMAT_ACTIVE:
> -		return &priv->fmt[pad];
> -	default:
> -		return NULL;
> -	}
> -}
> -
>  static int max9286_set_fmt(struct v4l2_subdev *sd,
> -			   struct v4l2_subdev_state *sd_state,
> +			   struct v4l2_subdev_state *state,
>  			   struct v4l2_subdev_format *format)
>  {
> -	struct max9286_priv *priv = sd_to_max9286(sd);
> -	struct v4l2_mbus_framefmt *cfg_fmt;
>  	unsigned int i;
>  
> +	/*
> +	 * Disable setting format on the source pad: format is propagated
> +	 * from the sinks.
> +	 */
>  	if (format->pad == MAX9286_SRC_PAD)
>  		return -EINVAL;

Return v4l2_subdev_get_fmt().

>  
> @@ -957,42 +947,13 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>  	if (i == ARRAY_SIZE(max9286_formats))
>  		format->format.code = max9286_formats[0].code;
>  
> -	cfg_fmt = max9286_get_pad_format(priv, sd_state, format->pad,
> -					 format->which);
> -	if (!cfg_fmt)
> -		return -EINVAL;
> -
> -	mutex_lock(&priv->mutex);
> -	*cfg_fmt = format->format;
> -	mutex_unlock(&priv->mutex);
> -
> -	return 0;
> -}
> -
> -static int max9286_get_fmt(struct v4l2_subdev *sd,
> -			   struct v4l2_subdev_state *sd_state,
> -			   struct v4l2_subdev_format *format)
> -{
> -	struct max9286_priv *priv = sd_to_max9286(sd);
> -	struct v4l2_mbus_framefmt *cfg_fmt;
> -	unsigned int pad = format->pad;
> +	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
>  
>  	/*
> -	 * Multiplexed Stream Support: Support link validation by returning the
> -	 * format of the first bound link. All links must have the same format,
> -	 * as we do not support mixing and matching of cameras connected to the
> -	 * max9286.
> +	 * Apply the same format on the source pad: all links must have the
> +	 * same format.
>  	 */
> -	if (pad == MAX9286_SRC_PAD)
> -		pad = __ffs(priv->bound_sources);
> -
> -	cfg_fmt = max9286_get_pad_format(priv, sd_state, pad, format->which);
> -	if (!cfg_fmt)
> -		return -EINVAL;
> -
> -	mutex_lock(&priv->mutex);
> -	format->format = *cfg_fmt;
> -	mutex_unlock(&priv->mutex);
> +	*v4l2_subdev_state_get_format(state, MAX9286_SRC_PAD) = format->format;

If you want to keep the current behaviour, you should propagate the
format to the source pad for the first sink pad only.

>  
>  	return 0;
>  }
> @@ -1003,7 +964,7 @@ static const struct v4l2_subdev_video_ops max9286_video_ops = {
>  
>  static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
>  	.enum_mbus_code = max9286_enum_mbus_code,
> -	.get_fmt	= max9286_get_fmt,
> +	.get_fmt	= v4l2_subdev_get_fmt,
>  	.set_fmt	= max9286_set_fmt,
>  	.get_frame_interval = max9286_get_frame_interval,
>  	.set_frame_interval = max9286_set_frame_interval,
> @@ -1030,13 +991,14 @@ static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
>  	*fmt = max9286_default_format;
>  }
>  
> -static int max9286_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
> +static int max9286_init_state(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *state)
>  {
>  	struct v4l2_mbus_framefmt *format;
>  	unsigned int i;
>  
>  	for (i = 0; i < MAX9286_N_SINKS; i++) {
> -		format = v4l2_subdev_state_get_format(fh->state, i);
> +		format = v4l2_subdev_state_get_format(state, i);
>  		max9286_init_format(format);
>  	}

You need to initialize the source pad format too.

>  
> @@ -1044,7 +1006,7 @@ static int max9286_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
>  }
>  
>  static const struct v4l2_subdev_internal_ops max9286_subdev_internal_ops = {
> -	.open = max9286_open,
> +	.init_state = max9286_init_state,
>  };
>  
>  static const struct media_entity_operations max9286_media_ops = {
> @@ -1079,10 +1041,6 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  	}
>  
>  	/* Configure V4L2 for the MAX9286 itself */
> -
> -	for (i = 0; i < MAX9286_N_SINKS; i++)
> -		max9286_init_format(&priv->fmt[i]);
> -
>  	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
>  	priv->sd.internal_ops = &max9286_subdev_internal_ops;
>  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> @@ -1109,14 +1067,21 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  	if (ret)
>  		goto err_async;
>  
> +	priv->sd.state_lock = priv->ctrls.lock;
> +	ret = v4l2_subdev_init_finalize(&priv->sd);
> +	if (ret)
> +		goto err_async;
> +
>  	ret = v4l2_async_register_subdev(&priv->sd);
>  	if (ret < 0) {
>  		dev_err(dev, "Unable to register subdevice\n");
> -		goto err_async;
> +		goto err_subdev;
>  	}
>  
>  	return 0;
>  
> +err_subdev:
> +	v4l2_subdev_cleanup(&priv->sd);
>  err_async:
>  	v4l2_ctrl_handler_free(&priv->ctrls);
>  	max9286_v4l2_notifier_unregister(priv);
> @@ -1126,6 +1091,7 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  
>  static void max9286_v4l2_unregister(struct max9286_priv *priv)
>  {
> +	v4l2_subdev_cleanup(&priv->sd);
>  	v4l2_ctrl_handler_free(&priv->ctrls);
>  	v4l2_async_unregister_subdev(&priv->sd);
>  	max9286_v4l2_notifier_unregister(priv);
> @@ -1629,8 +1595,6 @@ static int max9286_probe(struct i2c_client *client)
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	mutex_init(&priv->mutex);
> -
>  	priv->client = client;
>  
>  	/* GPIO values default to high */

-- 
Regards,

Laurent Pinchart

