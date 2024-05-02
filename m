Return-Path: <linux-media+bounces-10643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5108BA045
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 20:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 143611C2283A
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 18:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6707617334D;
	Thu,  2 May 2024 18:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dbeAlH4C"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744E0173333;
	Thu,  2 May 2024 18:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714674335; cv=none; b=g2iak0R9Apiaucea9m3WaYCf9hMrS26DyxrQySjK3iBYxLwvJh19tv2JQJveBc14nMOFdTp9yIasXSg5lQLqIqwx3F2h1Tz5mnvHy/54mwz+Wmc499FjFG1is58HrRQa+T3jE1X6TGhlq3joPKBkGIpqSHXW8fODtqmnLH/V4Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714674335; c=relaxed/simple;
	bh=Jobfj23woBRqbFwDFnHmIlJbdX8z0GptcjYzKyKTIu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYF5odag1bBoIoDkY+OHgpAHq83EuzOfwO+hm6DfDNlXAuiJ7nYRaNYsvPmWIBAp3o5dKzmyAgqnRVlq/DJRbec9RGA7cBMwkkXDUZ//VIzcfVyM2940dqaGYpy5cJWKAHwMI2DrPPQOB+zIFUcHRpKqlPCkX8ny0OORUH4K3ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dbeAlH4C; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 045C963B;
	Thu,  2 May 2024 20:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714674275;
	bh=Jobfj23woBRqbFwDFnHmIlJbdX8z0GptcjYzKyKTIu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dbeAlH4CkOxq/t0vjek6hH5trI0lYVFKSutgXSAwnMG3vui3fijn7XNeDe94xHect
	 xnh2okkuzd+CPMQdPl2LvljSAGHadnY//6Yk4Pc68Q0U0vo8YcnijO+XOrmpwDU7Sd
	 Smmd+6k55zc6dUJbRKyuytaNLoihBgBUmmsMD5vY=
Date: Thu, 2 May 2024 21:25:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 11/19] media: max9286: Use V4L2 Streams
Message-ID: <20240502182526.GR15807@pendragon.ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-12-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430103956.60190-12-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Apr 30, 2024 at 12:39:47PM +0200, Jacopo Mondi wrote:
> Use V4L2 streams by introducing a static route table that reports
> how the enabled source links are routed through the CSI-2 source pad.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 43 +++++++++++++++++++++++--------------
>  1 file changed, 27 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index ae1b73fde832..f203e4527257 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -800,7 +800,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  		 * Get the format from the first used sink pad, as all sink
>  		 * formats must be identical.
>  		 */
> -		format = v4l2_subdev_state_get_format(state, source_idx);
> +		format = v4l2_subdev_state_get_format(state, source_idx, 0);
>  
>  		max9286_set_video_format(priv, format);
>  		max9286_set_fsync_period(priv, state);
> @@ -918,13 +918,14 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>  	if (i == ARRAY_SIZE(max9286_formats))
>  		format->format.code = max9286_formats[0].code;
>  
> -	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
> +	*v4l2_subdev_state_get_format(state, format->pad, 0) = format->format;
>  
>  	/*
> -	 * Apply the same format on the source pad: all links must have the
> +	 * Apply the same format on the opposite stream: all links must have the
>  	 * same format.
>  	 */
> -	*v4l2_subdev_state_get_format(state, MAX9286_SRC_PAD) = format->format;
> +	*v4l2_subdev_state_get_opposite_stream_format(state, format->pad, 0) =
> +		format->format;

This would look nicer with an intermediate local variable.

>  
>  	return 0;
>  }
> @@ -957,23 +958,32 @@ static const struct v4l2_mbus_framefmt max9286_default_format = {
>  	.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
>  };
>  
> -static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
> -{
> -	*fmt = max9286_default_format;
> -}
> -
>  static int max9286_init_state(struct v4l2_subdev *sd,
>  			      struct v4l2_subdev_state *state)
>  {
> -	struct v4l2_mbus_framefmt *format;
> -	unsigned int i;
> +	struct v4l2_subdev_route routes[MAX9286_N_SINKS];
> +	struct max9286_priv *priv = sd_to_max9286(sd);
> +	struct max9286_source *source;
> +	unsigned int num_routes = 0;
>  
> -	for (i = 0; i < MAX9286_N_SINKS; i++) {
> -		format = v4l2_subdev_state_get_format(state, i);
> -		max9286_init_format(format);
> +	for_each_source(priv, source) {
> +		struct v4l2_subdev_route *route = &routes[num_routes++];
> +		unsigned int index = to_index(priv, source);
> +
> +		route->sink_pad = index;
> +		route->sink_stream = 0;
> +		route->source_pad = MAX9286_SRC_PAD;
> +		route->source_stream = index;
> +		route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
>  	}
>  
> -	return 0;
> +	struct v4l2_subdev_krouting routing = {
> +		.num_routes = num_routes,

You need to set .len_routes too (the field will appear in v6.10, it's in
the stage tree already).

> +		.routes = routes,
> +	};
> +
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
> +						&max9286_default_format);
>  }
>  
>  static const struct v4l2_subdev_internal_ops max9286_subdev_internal_ops = {
> @@ -1014,7 +1024,8 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  	/* Configure V4L2 for the MAX9286 itself */
>  	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
>  	priv->sd.internal_ops = &max9286_subdev_internal_ops;
> -	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			  V4L2_SUBDEV_FL_STREAMS;
>  
>  	v4l2_ctrl_handler_init(&priv->ctrls, 1);
>  	priv->pixelrate_ctrl = v4l2_ctrl_new_std(&priv->ctrls,

-- 
Regards,

Laurent Pinchart

