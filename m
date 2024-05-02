Return-Path: <linux-media+bounces-10650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9358BA305
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 00:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBE041C20F12
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 22:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B5257CA6;
	Thu,  2 May 2024 22:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LF3UXHFy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B4457C9B;
	Thu,  2 May 2024 22:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714688173; cv=none; b=KAL1IWmwEFHwViyXcrn0LbGzpGsAA7n/a5bs9COMXaLfcU7qDVFWN7627f3SxH91RxXXPVRYMk5Xa6DPRk9HEwf5Rn0iYWZc+huaA+UbKGNho4PWlr+1K2muIJYKSEQf98SWYwXiFExbCuRSuIUqEB6ZYtHL/U7l5TsgU0BpTt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714688173; c=relaxed/simple;
	bh=mNelqbd2qDvfPdhh5ZbwSHKsZXOfqstzUVHeNEo0xVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3oSeZDOHhTb2Ex/p6mfWJ8fFTQKPmuqiUPFFBvbtRjFjII+/n6hfGWL4flonYc5Lsd0/0KOE0eJjLFFQPA2UZHdpaFA+9ncyRGNaAfQq18Fe8mCVRMskBQ5Rj9neQjMFV3GlYCbNnfPHnVT3p0OAhmXtD4nkYMb17eKXJUMzZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LF3UXHFy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9383A4CE;
	Fri,  3 May 2024 00:15:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714688112;
	bh=mNelqbd2qDvfPdhh5ZbwSHKsZXOfqstzUVHeNEo0xVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LF3UXHFypUSfEL2CpqufmGyGS1QaLux8lL17JuygwxOWnc1d1z3/JtSM8pLUJ8YQj
	 TGletVId9y4MWMzFUTX4LqpnS0WG5JSROYcieIco5p2PksFBmKauHgdUIluFBrngdj
	 RR5iRRXAm6bihDy4GzunOYSpm6GSn2BFlkreE9XA=
Date: Fri, 3 May 2024 01:16:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 18/19] media: rcar-csi2: Implement set_routing
Message-ID: <20240502221604.GD4959@pendragon.ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-19-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430103956.60190-19-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Apr 30, 2024 at 12:39:54PM +0200, Jacopo Mondi wrote:
> Add the set_routing() subdev operation to allow userspace to activate
> routes on the R-Car CSI-2 receiver.
> 
> Routing for this device is fixed. Validate that the provided route
> respects it.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 48 +++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index ed818a6fa655..47cb12f077e5 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1287,6 +1287,51 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int rcsi2_apply_routing(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *state,
> +			       struct v4l2_subdev_krouting *routing)
> +{
> +	int ret;
> +
> +	ret = v4l2_subdev_routing_validate(sd, routing,
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Routing is fixed for this device.
> +	 *
> +	 * Only routes in the form of CSI2:0/x->CSI2:x+1/0 are allowed.
> +	 *
> +	 * We have anyway to implement set_routing to mark the route as active.

Then it's not fixed :-)

> +	 */
> +	for (unsigned int i = 0; i < routing->num_routes; ++i) {
> +		const struct v4l2_subdev_route *route = &routing->routes[i];
> +		unsigned int pad = route->sink_stream + 1;
> +
> +		if (route->sink_pad != 0)
> +			return -EINVAL;

I don't think this can happen, the core should check the validity of
pads for you.

> +
> +		if (route->source_pad != pad || route->source_stream != 0)
> +			return -EINVAL;

You should adjust invalid routes, not return an error.

> +	}
> +
> +	return v4l2_subdev_set_routing(sd, state, routing);
> +}
> +
> +static int rcsi2_set_routing(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *state,
> +			     enum v4l2_subdev_format_whence which,
> +			     struct v4l2_subdev_krouting *routing)
> +{
> +	struct rcar_csi2 *priv = sd_to_csi2(sd);
> +
> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->stream_count)
> +		return -EBUSY;
> +
> +	return rcsi2_apply_routing(sd, state, routing);
> +}
> +
>  static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
>  	.s_stream = rcsi2_s_stream,
>  };
> @@ -1294,6 +1339,7 @@ static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
>  static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
>  	.set_fmt = rcsi2_set_pad_format,
>  	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_routing = rcsi2_set_routing,
>  };
>  
>  static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
> @@ -1353,7 +1399,7 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
>  		.routes = routes,
>  	};
>  
> -	return v4l2_subdev_set_routing(sd, state, &routing);
> +	return rcsi2_apply_routing(sd, state, &routing);
>  }
>  
>  static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {

-- 
Regards,

Laurent Pinchart

