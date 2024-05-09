Return-Path: <linux-media+bounces-11216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B098C1150
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 16:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A1F528587D
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 14:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D24F133423;
	Thu,  9 May 2024 14:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dlmPCkiF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21DA1E49B;
	Thu,  9 May 2024 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715265369; cv=none; b=oJfjlB4Xm7GSkWPVLSM0eszrU6/f6XKs+Dcvn7h9KSOlwh217O5Bden7UlzBRDw33jyYY9hhfF+TMnmEm74LpFjQCoc/Gm6IrRtb4dENb7VgC8l4XSFlu5CI0tZZpzfumGIC6sUIEsdU3LklXrJxLYyAekTyXnzW78MH6Q3mly4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715265369; c=relaxed/simple;
	bh=XIn2Jd242VnX4AdxCtwXUWzx1SDAr11YkztLAmK8gj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvUVtMjJen+V0xYektJx+4De9H5wdHwSbVjPZqCgW/3IXBME8wA7p5/L5ayWgWFUbxknnoKiQxKI3/bSGUv7l+CwCUfY/TQYFgk2LV3H8ZjB9HEGBzUQ3/lD8yMibE+5cYviP3Hh4mF6OEKRK0ePFSHF58AxNraiGwEzXJ8zUsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dlmPCkiF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FE3D3D5;
	Thu,  9 May 2024 16:36:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715265361;
	bh=XIn2Jd242VnX4AdxCtwXUWzx1SDAr11YkztLAmK8gj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dlmPCkiF+Lqb4S0I+q2CVgAPkhhaRNYGOLrDmeKNydxfqiB87t/KgB6fn/z3aSl7h
	 e1MVtPO0OoW20KSlOSIP3Npggf9g7AEm33DpL9Nr3ZrsdK6KK7fopvelScWIzW20vW
	 xGPMz5pOxeAnzDsfFL3snfvqN30tMOsfFCs22sco=
Date: Thu, 9 May 2024 17:35:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 10/11] media: max9286: Use the subdev active state
Message-ID: <20240509143556.GG17123@pendragon.ideasonboard.com>
References: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
 <20240506164941.110389-11-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240506164941.110389-11-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, May 06, 2024 at 06:49:38PM +0200, Jacopo Mondi wrote:
> Use the subdev active state in the max9286 driver to store the
> image format.
> 
> Replace the .open() function call with the .init_state() one and
> simplify the set/get_pad_fmt() operations.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 130 ++++++++++++------------------------
>  1 file changed, 44 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 5321238cad60..7fad190cd9b3 100644
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
> @@ -788,19 +783,22 @@ static void max9286_v4l2_notifier_unregister(struct max9286_priv *priv)
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
>  
>  		/*
> -		 * Get the format from the first used sink pad, as all sink
> -		 * formats must be identical.
> +		 * Get the format from the source pad, as all formats must be
> +		 * identical.
>  		 */
> -		format = &priv->fmt[__ffs(priv->bound_sources)];
> +		format = v4l2_subdev_state_get_format(state, MAX9286_SRC_PAD);
>  
>  		max9286_set_video_format(priv, format);
>  		max9286_set_fsync_period(priv);
> @@ -816,12 +814,12 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  		for_each_source(priv, source) {
>  			ret = v4l2_subdev_call(source->sd, video, s_stream, 1);
>  			if (ret)
> -				return ret;
> +				goto unlock;
>  		}
>  
>  		ret = max9286_check_video_links(priv);
>  		if (ret)
> -			return ret;
> +			goto unlock;
>  
>  		/*
>  		 * Wait until frame synchronization is locked.
> @@ -842,7 +840,8 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  		if (!sync) {
>  			dev_err(&priv->client->dev,
>  				"Failed to get frame synchronization\n");
> -			return -EXDEV; /* Invalid cross-device link */
> +			ret = -EXDEV; /* Invalid cross-device link */
> +			goto unlock;
>  		}
>  
>  		/*
> @@ -865,7 +864,10 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  		max9286_i2c_mux_close(priv);
>  	}
>  
> -	return 0;
> +unlock:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
>  }
>  
>  static int max9286_get_frame_interval(struct v4l2_subdev *sd,
> @@ -922,31 +924,20 @@ static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
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
>  	struct max9286_priv *priv = sd_to_max9286(sd);
> -	struct v4l2_mbus_framefmt *cfg_fmt;
> +	unsigned int pad;
>  	unsigned int i;
>  
> +	/*
> +	 * Disable setting format on the source pad: format is propagated
> +	 * from the sinks.
> +	 */
>  	if (format->pad == MAX9286_SRC_PAD)
> -		return -EINVAL;
> +		return v4l2_subdev_get_fmt(sd, state, format);
>  
>  	/* Validate the format. */
>  	for (i = 0; i < ARRAY_SIZE(max9286_formats); ++i) {
> @@ -957,42 +948,16 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
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
> +	 * Apply the same format on the source pad. As all links must have the
> +	 * same format we do so only when the first source format is set.
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
> +	pad = __ffs(priv->bound_sources);
> +	if (pad == format->pad)
> +		*v4l2_subdev_state_get_format(state,
> +					      MAX9286_SRC_PAD) = format->format;

In wrote in my review of the previous version:

We don't enforce the requirement that formats on all sink pads must be
identical. Should we fix that ? One way to do so would be to propagate
formats to all the other sinks, in addition to propagating it to the
source.

I haven't seen a reply, maybe you missed the comment.

>  
>  	return 0;
>  }
> @@ -1003,7 +968,7 @@ static const struct v4l2_subdev_video_ops max9286_video_ops = {
>  
>  static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
>  	.enum_mbus_code = max9286_enum_mbus_code,
> -	.get_fmt	= max9286_get_fmt,
> +	.get_fmt	= v4l2_subdev_get_fmt,
>  	.set_fmt	= max9286_set_fmt,
>  	.get_frame_interval = max9286_get_frame_interval,
>  	.set_frame_interval = max9286_set_frame_interval,
> @@ -1025,26 +990,17 @@ static const struct v4l2_mbus_framefmt max9286_default_format = {
>  	.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
>  };
>  
> -static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
> +static int max9286_init_state(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *state)
>  {
> -	*fmt = max9286_default_format;
> -}
> -
> -static int max9286_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
> -{
> -	struct v4l2_mbus_framefmt *format;
> -	unsigned int i;
> -
> -	for (i = 0; i < MAX9286_N_SINKS; i++) {
> -		format = v4l2_subdev_state_get_format(fh->state, i);
> -		max9286_init_format(format);
> -	}
> +	for (unsigned int i = 0; i < MAX9286_N_PADS; i++)
> +		*v4l2_subdev_state_get_format(state, i) = max9286_default_format;
>  
>  	return 0;
>  }
>  
>  static const struct v4l2_subdev_internal_ops max9286_subdev_internal_ops = {
> -	.open = max9286_open,
> +	.init_state = max9286_init_state,
>  };
>  
>  static const struct media_entity_operations max9286_media_ops = {
> @@ -1079,10 +1035,6 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
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
> @@ -1109,14 +1061,21 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
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
> @@ -1126,6 +1085,7 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  
>  static void max9286_v4l2_unregister(struct max9286_priv *priv)
>  {
> +	v4l2_subdev_cleanup(&priv->sd);
>  	v4l2_ctrl_handler_free(&priv->ctrls);
>  	v4l2_async_unregister_subdev(&priv->sd);
>  	max9286_v4l2_notifier_unregister(priv);
> @@ -1629,8 +1589,6 @@ static int max9286_probe(struct i2c_client *client)
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

