Return-Path: <linux-media+bounces-33932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF0AACB121
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 16:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 163157A4D53
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 14:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A1B22A81F;
	Mon,  2 Jun 2025 14:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B4yHCEcl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D4D1FBC8C;
	Mon,  2 Jun 2025 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873213; cv=none; b=pYGDff3i8wG1r+A7QIDDSDIkfbKzbYeP0rufqIV3yn+25jlfva40j5xyz3Y0YFAviu1A+H75Xveh844TnStRVKhydjE47wVdyS/R8NiHkA60E/scJDjl2FKIarHKA6+xGWQE1EhKFDtV2rkjHFGxRJe88JLx+I7exbH0+ccxRuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873213; c=relaxed/simple;
	bh=wzdXv0J62meupiqoL3PfTMvL1b06X3EOV3Vf2o7pHMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1X82Fexlli1SGSGEorb7pF9uoxp+36SJErtdZBb9axBu8SwuKxmsHTGeg/rB9VYoowXWB10WXE+QVOXS4yAEjH3iM3hm47zcLVMEHgsbdZAmz7YX4S+nCfoIB8APET3FyclUt276mHTivTNRCZasPw8C/unlHb16BDquEcKF34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B4yHCEcl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C63F6379;
	Mon,  2 Jun 2025 16:06:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748873209;
	bh=wzdXv0J62meupiqoL3PfTMvL1b06X3EOV3Vf2o7pHMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B4yHCEclb6A/nzw2hUHyA8nrGs2cAelBZxUQkdiV9XR9Aqbwg6f/NmY2dq32eRX/U
	 9NwRE7HSYJZX0DpP6lh5oTDx7xMZsmqzESX/bQACH5eVscq8UMe5ZqiGZ98o+d4LWI
	 RwV0KGLH9XJRHsgEWbG8vCoz/sD4qEgvaVkc4iIc=
Date: Mon, 2 Jun 2025 17:06:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 08/15] media: rcar-csi2: Switch to Streams API
Message-ID: <20250602140641.GF23515@pendragon.ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-8-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-rcar-streams-v3-8-026655df7138@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, May 30, 2025 at 04:50:37PM +0300, Tomi Valkeinen wrote:
> Switch to Streams API with a single hardcoded route. This breaks any
> existing userspace which depended on the custom rcar streams
> implementation, but a single camera use case should continue to work.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 47 +++++++++++++++++++++---------
>  1 file changed, 33 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index e0a0fd96459b..20bd44274bd2 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1028,7 +1028,7 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>  		if (ret)
>  			return ret;
>  
> -		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> +		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
>  		if (!fmt)
>  			return -EINVAL;
>  
> @@ -1069,7 +1069,7 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>  	int mbps, ret;
>  
>  	/* Use the format on the sink pad to compute the receiver config. */
> -	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
>  
>  	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
>  		fmt->width, fmt->height,
> @@ -1650,8 +1650,7 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  				struct v4l2_subdev_state *state,
>  				struct v4l2_subdev_format *format)
>  {
> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -	unsigned int num_pads = rcsi2_num_pads(priv);
> +	struct v4l2_mbus_framefmt *fmt;
>  
>  	if (format->pad > RCAR_CSI2_SINK)
>  		return v4l2_subdev_get_fmt(sd, state, format);
> @@ -1659,11 +1658,20 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  	if (!rcsi2_code_to_fmt(format->format.code))
>  		format->format.code = rcar_csi2_formats[0].code;
>  
> -	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
> +	/* Set sink format */

s/format/format./

> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	*fmt = format->format;
> +
> +	/* Propagate to source format */

Same here. Although I'd write

	/* Propagate the format to the source pad. */

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> +							   format->stream);
> +	if (!fmt)
> +		return -EINVAL;
>  
> -	/* Propagate the format to the source pads. */
> -	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < num_pads; i++)
> -		*v4l2_subdev_state_get_format(state, i) = format->format;
> +	*fmt = format->format;
>  
>  	return 0;
>  }
> @@ -1683,8 +1691,15 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
>  static int rcsi2_init_state(struct v4l2_subdev *sd,
>  			    struct v4l2_subdev_state *state)
>  {
> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -	unsigned int num_pads = rcsi2_num_pads(priv);
> +	static struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = RCAR_CSI2_SINK,
> +			.sink_stream = 0,
> +			.source_pad = RCAR_CSI2_SOURCE_VC0,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
>  
>  	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
>  		.width		= 1920,
> @@ -1697,10 +1712,13 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
>  		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
>  	};
>  
> -	for (unsigned int i = RCAR_CSI2_SINK; i < num_pads; i++)
> -		*v4l2_subdev_state_get_format(state, i) = rcar_csi2_default_fmt;
> +	static const struct v4l2_subdev_krouting routing = {
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
>  
> -	return 0;
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
> +						&rcar_csi2_default_fmt);
>  }
>  
>  static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
> @@ -2356,7 +2374,8 @@ static int rcsi2_probe(struct platform_device *pdev)
>  	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
>  	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
>  		 KBUILD_MODNAME, dev_name(&pdev->dev));
> -	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			     V4L2_SUBDEV_FL_STREAMS;
>  
>  	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>  	priv->subdev.entity.ops = &rcar_csi2_entity_ops;

-- 
Regards,

Laurent Pinchart

