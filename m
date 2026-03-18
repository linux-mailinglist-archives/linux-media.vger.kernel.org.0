Return-Path: <linux-media+bounces-56248-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEbMCKMVu2k3ewIAu9opvQ
	(envelope-from <linux-media+bounces-56248-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 22:14:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BB32C2E40
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 22:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E31631423DF
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 21:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5168A374197;
	Wed, 18 Mar 2026 21:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AJM0GXe2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7139E36B056;
	Wed, 18 Mar 2026 21:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773868343; cv=none; b=PDSPg2EIJ3nle7yE1WoP1fTsGGPD3JXydc5V3jiqxMxQCammotAP/4fGUZLRtJj34zUEG1u0YAzgUU1TUQNwEAZ7N8gJOJg62nZ83h3w3A5aDOvPFvYJ5gdlAsoqFo8CbdaUu/jBNJ0X47IbtAjUxtx7NvsviI+SW39O/uiFYXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773868343; c=relaxed/simple;
	bh=zg/3t0qp8+ciCvlKuslm/cMGKcZ+aYB36gIJbtqY+1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlhOQq2jWSkqCDNmfNnu56jVZL9hDnz8jg+9OlhoPwUQS2XAOJLrPVw7CNpnzCy57vuFYbRXs1msPHOK1p+OK0IdZb9i7+GYumj2QeEooqrJNny4ZY2Wab9LlowGmq/cbXScj5BS+3qKp1Tc9qoW45NkyqSAz2f4ppRBXuX8AcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AJM0GXe2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 60448379;
	Wed, 18 Mar 2026 22:11:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773868267;
	bh=zg/3t0qp8+ciCvlKuslm/cMGKcZ+aYB36gIJbtqY+1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJM0GXe2sxbzyKf3zm0E51gupyQzyALgDSOkYVgwS2sNp8ByoFnfAhmTGbpdSBwRt
	 KWtSEWp+kwnI4TksZ9/B4fJOGpIzN4EiV8IpU1tdE5CSK9KGCk/DyfCcueCPYyahFT
	 loxI/Oi7BuovJTCSeTqcasfJk4uWFyfZguQGG4BE=
Date: Wed, 18 Mar 2026 23:12:18 +0200
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
Subject: Re: [PATCH v5 05/10] media: rcar-isp: Switch to Streams API
Message-ID: <20260318211218.GI716464@killaraus.ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
 <20260311-rcar-streams-v5-5-3e6c957d7567@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311-rcar-streams-v5-5-3e6c957d7567@ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56248-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 78BB32C2E40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:53:18PM +0200, Tomi Valkeinen wrote:
> Switch to Streams API with a single hardcoded route.
> 
> For single-stream use case there should be no change in behavior.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 69 ++++++++++++++++++++++---
>  1 file changed, 62 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index 58a9a3bd9f75..8ac45516aa39 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -124,6 +124,17 @@ static const struct rcar_isp_format rcar_isp_formats[] = {
>  	},
>  };
>  
> +static const struct v4l2_mbus_framefmt risp_default_fmt = {
> +	.width = 1920,
> +	.height = 1080,
> +	.code = MEDIA_BUS_FMT_RGB888_1X24,
> +	.colorspace = V4L2_COLORSPACE_SRGB,
> +	.field = V4L2_FIELD_NONE,
> +	.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
> +	.quantization = V4L2_QUANTIZATION_DEFAULT,
> +	.xfer_func = V4L2_XFER_FUNC_DEFAULT,
> +};
> +
>  static const struct rcar_isp_format *risp_code_to_fmt(unsigned int code)
>  {
>  	unsigned int i;
> @@ -216,13 +227,20 @@ static void risp_power_off(struct rcar_isp *isp)
>  
>  static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
>  {
> +	const struct v4l2_subdev_route *route;
>  	const struct v4l2_mbus_framefmt *fmt;
>  	const struct rcar_isp_format *format;
>  	unsigned int vc;
>  	u32 sel_csi = 0;
>  	int ret;
>  
> -	fmt = v4l2_subdev_state_get_format(state, RCAR_ISP_SINK);
> +	if (state->routing.num_routes != 1)
> +		return -EINVAL;
> +
> +	route = &state->routing.routes[0];
> +
> +	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> +					   route->sink_stream);
>  	if (!fmt)
>  		return -EINVAL;
>  
> @@ -341,7 +359,7 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
>  			       struct v4l2_subdev_state *state,
>  			       struct v4l2_subdev_format *format)
>  {
> -	struct v4l2_mbus_framefmt *framefmt;
> +	struct v4l2_mbus_framefmt *fmt;
>  
>  	if (format->pad > RCAR_ISP_SINK)
>  		return v4l2_subdev_get_fmt(sd, state, format);
> @@ -349,10 +367,20 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
>  	if (!risp_code_to_fmt(format->format.code))
>  		format->format.code = rcar_isp_formats[0].code;
>  
> -	for (unsigned int i = 0; i < RCAR_ISP_NUM_PADS; i++) {
> -		framefmt = v4l2_subdev_state_get_format(state, i);
> -		*framefmt = format->format;
> -	}
> +	/* Set sink format. */
> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	*fmt = format->format;
> +
> +	/* Propagate the format to the source pad. */
> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> +							   format->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	*fmt = format->format;
>  
>  	return 0;
>  }
> @@ -369,6 +397,32 @@ static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {
>  	.pad	= &risp_pad_ops,
>  };
>  
> +static int risp_init_state(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *state)
> +{
> +	static struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = RCAR_ISP_SINK,
> +			.sink_stream = 0,
> +			.source_pad = RCAR_ISP_PORT0,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +
> +	static const struct v4l2_subdev_krouting routing = {
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
> +
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
> +						&risp_default_fmt);
> +}
> +
> +static const struct v4l2_subdev_internal_ops risp_internal_ops = {
> +	.init_state = risp_init_state,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Async handling and registration of subdevices and links
>   */
> @@ -526,11 +580,12 @@ static int risp_probe(struct platform_device *pdev)
>  
>  	isp->subdev.owner = THIS_MODULE;
>  	isp->subdev.dev = &pdev->dev;
> +	isp->subdev.internal_ops = &risp_internal_ops;
>  	v4l2_subdev_init(&isp->subdev, &rcar_isp_subdev_ops);
>  	v4l2_set_subdevdata(&isp->subdev, &pdev->dev);
>  	snprintf(isp->subdev.name, sizeof(isp->subdev.name), "%s %s",
>  		 KBUILD_MODNAME, dev_name(&pdev->dev));
> -	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>  
>  	isp->subdev.entity.function = MEDIA_ENT_F_VID_MUX;
>  	isp->subdev.entity.ops = &risp_entity_ops;
> 

-- 
Regards,

Laurent Pinchart

