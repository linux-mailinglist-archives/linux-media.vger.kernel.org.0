Return-Path: <linux-media+bounces-10636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0408B9FCA
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 19:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A8491C21D9D
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 17:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4F3171065;
	Thu,  2 May 2024 17:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eBeyF8X5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9666816D4FC;
	Thu,  2 May 2024 17:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714672210; cv=none; b=iqT7N7aa+hBsCxQySKPBOovADfzULeUY4dw/o3x2Pio4ahhBcmYcx+95G/3fzR0qSRO3kErTT7ZkZmN/Oxl0CaFmoJO6ar9mB5SO55A3bySkImwPFuamkFyswW7eRLhj3Xnm9ZAZtj2Q/OU+DS6qZO3qwTkPa8mRFJ7vwGejbOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714672210; c=relaxed/simple;
	bh=9LJQmtV+oE4txYT+4TMGYz846c/C4765U9W5VoCZMuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UaUph5YV3hkXdakB2Dk7GZHuBfEFzGex+S2ws9g4/meTfaL2iqZ8q12GruBucQFs09SYJZcQGu/mUV/RyqrOfm+bgCK+LjAVwv+hWKEoap1RcyHLNZB942F8WDKRghPiJG7h5toiWX78INeWSS1NWsCINyqK5eLXf/ZB5tQFRfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eBeyF8X5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7525552;
	Thu,  2 May 2024 19:49:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714672149;
	bh=9LJQmtV+oE4txYT+4TMGYz846c/C4765U9W5VoCZMuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBeyF8X50AK4EB4S+teinQvNxaYIUa+53reiEPSoYuUytjUyFvuVg2numSgXZPxNP
	 PE4Wu16JRZmG4OwJKBzzhWTxswf13FKpyn5uD6FxdnXb20vVKVe/bUf722uvgo9qUk
	 1JYE7UR9OzsaCwJQdUkkzEV6SUgV9b9r39Q0Wc50=
Date: Thu, 2 May 2024 20:49:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 05/19] media: adv748x: Implement set_routing()
Message-ID: <20240502174959.GK15807@pendragon.ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-6-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430103956.60190-6-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Apr 30, 2024 at 12:39:41PM +0200, Jacopo Mondi wrote:
> Implement the set_routing() pad operation to control the MIPI CSI-2
> Virtual Channel on which the video stream is sent on according to
> the active route source stream number.

While 01/19 needs to implement .init_state(), you should only initialize
formats there. The routing initialization of 03/19 should be moved to
this patch.

> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 43 +++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index ace4e1d904d9..7fa72340e66e 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -57,6 +57,38 @@ static int adv748x_csi2_register_link(struct adv748x_csi2 *tx,
>  	return 0;
>  }
>  
> +static int adv748x_csi2_apply_routing(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_state *state,
> +				      struct v4l2_subdev_krouting *routing)
> +{
> +	struct v4l2_subdev_route *route;
> +	int ret;
> +
> +	/* Only one route at the time can be active. */

s/the time/a time/

> +	if (routing->num_routes > 1)
> +		return -EINVAL;

You should adjust routes instead of returning -EINVAL.

> +
> +	/*
> +	 * Validate the route: sink pad and sink stream shall be 0 and only
> +	 * 4 source streams are supported (one for each supported MIPI CSI-2
> +	 * channel).

s/channel/virtual channel/

> +	 */
> +	route = &routing->routes[0];
> +
> +	if (route->sink_pad != ADV748X_CSI2_SINK || route->sink_stream)
> +		return -EINVAL;
> +	if (route->source_pad != ADV748X_CSI2_SOURCE ||
> +	    route->source_stream > 4)
> +		return -EINVAL;

Adjust instead of returning an error. The pad checks can be dropped, as
the core ensures sink_pad and source_pad reference a valid sink and
source pad respectively.

I'm not sure the source stream check is right either. I understand
you'll use that to select a virtual channel, but the routing API isn't
meant to let userspace configure virtual channel numbers explicitly.

> +
> +	ret = v4l2_subdev_routing_validate(sd, routing,
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_subdev_set_routing(sd, state, routing);
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * v4l2_subdev_internal_ops
>   */
> @@ -79,7 +111,7 @@ static int adv748x_csi2_init_state(struct v4l2_subdev *sd,
>  		.routes = routes,
>  	};
>  
> -	return v4l2_subdev_set_routing(sd, state, &routing);
> +	return adv748x_csi2_apply_routing(sd, state, &routing);
>  }
>  
>  /*
> @@ -200,10 +232,19 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
>  	return 0;
>  }
>  
> +static int adv748x_csi2_set_routing(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_state *state,
> +				    enum v4l2_subdev_format_whence which,
> +				    struct v4l2_subdev_krouting *routing)
> +{
> +	return adv748x_csi2_apply_routing(sd, state, routing);
> +}
> +
>  static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = adv748x_csi2_set_format,
>  	.get_mbus_config = adv748x_csi2_get_mbus_config,
> +	.set_routing = adv748x_csi2_set_routing,
>  };
>  
>  /* -----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart

