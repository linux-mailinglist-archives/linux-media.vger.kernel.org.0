Return-Path: <linux-media+bounces-10634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6B18B9FAC
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 19:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A5F8B21560
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 17:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B0516FF52;
	Thu,  2 May 2024 17:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Szc1OO81"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA1315B559;
	Thu,  2 May 2024 17:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714671661; cv=none; b=aKsyvP34SnLNWHr6kK2xntqwIg7zX3OZKRKBTn6pG7CuCZ3WPXarXu0cqMC/GvYafbbySP/+SKOQ/m0miezywylAa0omPj0o1I9gvIHebnKEneEmXHhDNIHqLWymuCDR9qDTlZSfRLRmDNOMFnWYHEEaXgbT1391RK3s7SUGrE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714671661; c=relaxed/simple;
	bh=8yUCw3MvQGmT5jYYasgC1/b4ryP9VjTpFsesNqEK0XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGMEI309MbkbwhQwoypqyhOhQkUVrn4SYXiOUax3walGtaTvTISJo0xTOdEOFUe3ICA+8ZHGxGPQSsJ9TuVpeRio7vAfZ21Gp/soiMZJOEhcSbwmH0NkUsT6GLcUojuaCNunVLJ6bCEi242qyjxx2V4taGIDwc99maxBQD3dE5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Szc1OO81; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DDF8552;
	Thu,  2 May 2024 19:40:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714671600;
	bh=8yUCw3MvQGmT5jYYasgC1/b4ryP9VjTpFsesNqEK0XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Szc1OO81PPL8gWEdFVqdP6BeUhQrUWnI+SbmrKzLsQn+BTSiq1LlmQ+GgMbWDDLwP
	 yeoTYIG5QekJ1YPiAl2cOH2C8ei3edrGhpZuJKjRqMu2vVwmTvhLy+MygY222UX8wp
	 vIkBsjjxj75xCWQTf0SA92QJuPI9RpR8I/CGdkHs=
Date: Thu, 2 May 2024 20:40:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 03/19] media: adv748x: Use V4L2 streams
Message-ID: <20240502174051.GI15807@pendragon.ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-4-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430103956.60190-4-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Apr 30, 2024 at 12:39:39PM +0200, Jacopo Mondi wrote:
> Initialize the CSI-2 subdevice with the V4L2_SUBDEV_FL_STREAMS flag
> and initialize a simple routing table by implementing the .init_state()
> operation.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 28 ++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 60bf1dc0f58b..d929db7e8ef2 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -59,7 +59,30 @@ static int adv748x_csi2_register_link(struct adv748x_csi2 *tx,
>  
>  /* -----------------------------------------------------------------------------
>   * v4l2_subdev_internal_ops
> - *
> + */
> +
> +static int adv748x_csi2_init_state(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = ADV748X_CSI2_SINK,
> +			.sink_stream = 0,
> +			.source_pad = ADV748X_CSI2_SOURCE,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +
> +	struct v4l2_subdev_krouting routing = {
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
> +
> +	return v4l2_subdev_set_routing(sd, state, &routing);

You need to initialize formats too.

> +}
> +
> +/*
>   * We use the internal registered operation to be able to ensure that our
>   * incremental subdevices (not connected in the forward path) can be registered
>   * against the resulting video path and media device.
> @@ -109,6 +132,7 @@ static int adv748x_csi2_registered(struct v4l2_subdev *sd)
>  }
>  
>  static const struct v4l2_subdev_internal_ops adv748x_csi2_internal_ops = {
> +	.init_state = adv748x_csi2_init_state,

The .init_state() operation needs to be provided along with the call to
v4l2_subdev_init_finalize() in patch 01/19.

>  	.registered = adv748x_csi2_registered,
>  };
>  
> @@ -245,7 +269,7 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
>  		return 0;
>  
>  	adv748x_subdev_init(&tx->sd, state, &adv748x_csi2_ops,
> -			    MEDIA_ENT_F_VID_IF_BRIDGE, 0,
> +			    MEDIA_ENT_F_VID_IF_BRIDGE, V4L2_SUBDEV_FL_STREAMS,
>  			    is_txa(tx) ? "txa" : "txb");
>  
>  	/* Register internal ops for incremental subdev registration */
> -- 
> 2.44.0
> 

-- 
Regards,

Laurent Pinchart

