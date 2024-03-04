Return-Path: <linux-media+bounces-6341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 438E986FDC4
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 10:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D87551F20F78
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 09:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B49924215;
	Mon,  4 Mar 2024 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R7ILTgRa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397E7225DE
	for <linux-media@vger.kernel.org>; Mon,  4 Mar 2024 09:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709544641; cv=none; b=oHQKLgnTSNxNJDZeiwlcDR+dybGkdumtFEVixyy8tSDAU/afdUpUrKFKW+yB9mJC0uGdQ0GzqFEf00rXndRxTZtMAdVSwch8Ga4wSKA8wBy8LZFAWp+NVmzsg24uPS8EhiicMSbnfruRciLvfH2yY87JD537lX6ux7JHadhuyjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709544641; c=relaxed/simple;
	bh=kN+Gj/oKE2u9w/hGJOdMkpy8OzPQ95lgoL75GmXFxx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsdaj65UR9Rn+eHmxUDrHVgalVeuWKNFsOKGMMY7QcE+5omM3+FMdtiA5Q5zgn9B+yvmwHZmkSjRzU3W3FqKr12hceHJgnSPt9HPexgYpstcneZHfaTdsFf8UEtMkm/F3fiq32loshoKWvVX6BwHVPNGwC+6dX413Vqsh5IHhpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R7ILTgRa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CEE0BD1;
	Mon,  4 Mar 2024 10:30:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709544621;
	bh=kN+Gj/oKE2u9w/hGJOdMkpy8OzPQ95lgoL75GmXFxx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R7ILTgRaJhNUZtrGJqjs2WldNoNW9iG/GfI3vI3y+ClPwl2lPwdia1emFEhQGx5lf
	 PpOUzDjUYeJfEDmQGpd8YYsY62yTDdzvpb/bOAQKs983AKpPuNGEXubAphK/U7PAh6
	 RTBmumR6MDWuIoTkzwfQxwjydaIn7SnzmKo5QHSA=
Date: Mon, 4 Mar 2024 10:30:34 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, David Plowman <david.plowman@raspberrypi.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Naushir Patuck <naush@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v6 03/15] media: i2c: imx219: Report internal routes to
 userspace
Message-ID: <4xorn6jhgjgdyzqnzt5kwtb6goej2a25yfyazd7gnxwzneiu7i@h4zyrdy7gvaw>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-4-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240301213231.10340-4-laurent.pinchart@ideasonboard.com>

Hi Laurent

On Fri, Mar 01, 2024 at 11:32:18PM +0200, Laurent Pinchart wrote:
> Usage of internal pads creates a route internal to the subdev, and the
> V4L2 camera sensor API requires such routes to be reported to userspace.
> Create the route in the .init_cfg() operation.

It's now "init_state()"

>
> Internal routing support requires stream support, so set the
> V4L2_SUBDEV_FL_HAS_STREAMS flag and switch formats and selection
> rectangles access from pads to streams. As the route is immutable,
> there's no need to implement the .set_routing() operation, and we can
> hardcode the sink and source stream IDs to 0.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 817bf192e4d9..52afb821f667 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -381,7 +381,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  	int ret = 0;
>
>  	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
> -	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
> +
> +	format = v4l2_subdev_state_get_opposite_stream_format(state,
> +							      IMX219_PAD_IMAGE,
> +							      0);

Is this change necessary ?

Apart from this
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>
>  	if (ctrl->id == V4L2_CID_VBLANK) {
>  		int exposure_max, exposure_def;
> @@ -993,15 +996,35 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
>  static int imx219_init_state(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_state *state)
>  {
> +	struct v4l2_subdev_route routes[1] = {
> +		{
> +			.sink_pad = IMX219_PAD_IMAGE,
> +			.sink_stream = 0,
> +			.source_pad = IMX219_PAD_SOURCE,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +	struct v4l2_subdev_krouting routing = {
> +		.len_routes = ARRAY_SIZE(routes),
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
>  	struct v4l2_subdev_format fmt = {
>  		.which = V4L2_SUBDEV_FORMAT_TRY,
>  		.pad = IMX219_PAD_SOURCE,
> +		.stream = 0,
>  		.format = {
>  			.code = MEDIA_BUS_FMT_SRGGB10_1X10,
>  			.width = supported_modes[0].width,
>  			.height = supported_modes[0].height,
>  		},
>  	};
> +	int ret;
> +
> +	ret = v4l2_subdev_set_routing(sd, state, &routing);
> +	if (ret)
> +		return ret;
>
>  	imx219_set_pad_format(sd, state, &fmt);
>
> @@ -1260,7 +1283,8 @@ static int imx219_probe(struct i2c_client *client)
>
>  	/* Initialize subdev */
>  	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> -			    V4L2_SUBDEV_FL_HAS_EVENTS;
> +			    V4L2_SUBDEV_FL_HAS_EVENTS |
> +			    V4L2_SUBDEV_FL_STREAMS;
>  	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>
>  	/*
> --
> Regards,
>
> Laurent Pinchart
>
>

