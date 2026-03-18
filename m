Return-Path: <linux-media+bounces-56247-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKzRKecTu2k3ewIAu9opvQ
	(envelope-from <linux-media+bounces-56247-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 22:06:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9A52C2D4E
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 22:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E0803133B66
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 21:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD7B3750AE;
	Wed, 18 Mar 2026 21:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TBCUkTOe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24EB37473B;
	Wed, 18 Mar 2026 21:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773867904; cv=none; b=YuwPyx/pXFufnRUQ8AU+DpBnfvNUwDqlfAma39rCWFe7ATzoTGLYIuHNAb0lacHXb5+HT+eRi1PIqopL3qj6A2iQ1oHw1oQ57sS78g8DHlRWCEeaBN0g9Pf1I/xXE3TxTtP/CaNEPDRDGQm2bAl/GBuRVWSaJmieMw+1i4au90Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773867904; c=relaxed/simple;
	bh=Y+TTm7LhRDRl0boggQFNNWSh8RBq+c8ZAl7sMd04cC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofT2pp0Diox82mOcOnh8jBws9zuFv7KlOkFADB9LK4LU2aZg1MwHVfNhK5oIswRlLF9kpsOzb4RX7gfJ0Cdh5GvhB18oh++ZAGgxOv8WUgYQSs9EHUYMtRw9+BGuiFWSOQnjR/4R3tmFuYZfJJlhsIVLmSsCps2VxcRCw7ysj8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TBCUkTOe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F0453379;
	Wed, 18 Mar 2026 22:03:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773867824;
	bh=Y+TTm7LhRDRl0boggQFNNWSh8RBq+c8ZAl7sMd04cC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBCUkTOeCX+Qhe7GIBeInXHQ+2mcjv4XffKaSQ0b58pnVDxaJzkrQmENd7GojqjmJ
	 GgHyL8+97fBEpwx9iSVVeI2ogbGsX9MxaYWOdmyZ+ILCUl1Oj3mANEDOH24cqDja/F
	 fDZK+Rgh04OcsSjErBbMLSxFpOpBTvnFmifTFDqw=
Date: Wed, 18 Mar 2026 23:04:55 +0200
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
Subject: Re: [PATCH v5 04/10] media: rcar-csi2: Switch to Streams API
Message-ID: <20260318210455.GH716464@killaraus.ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
 <20260311-rcar-streams-v5-4-3e6c957d7567@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311-rcar-streams-v5-4-3e6c957d7567@ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56247-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 4A9A52C2D4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:53:17PM +0200, Tomi Valkeinen wrote:
> Switch to Streams API with a single hardcoded route.
> 
> For single-stream use case there should be no change in behavior.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 64 +++++++++++++++++++++++-------
>  1 file changed, 50 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 158fa447e668..ad62c95c8f9a 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1023,17 +1023,24 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>  	 */
>  	freq = v4l2_get_link_freq(remote_pad, 0, 0);
>  	if (freq < 0) {
> +		const struct v4l2_subdev_route *route;
>  		const struct rcar_csi2_format *format;
>  		const struct v4l2_mbus_framefmt *fmt;
>  		unsigned int lanes;
>  		unsigned int bpp;
>  		int ret;
>  
> +		if (state->routing.num_routes != 1)
> +			return -EINVAL;
> +
>  		ret = rcsi2_get_active_lanes(priv, &lanes);
>  		if (ret)
>  			return ret;
>  
> -		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> +		route = &state->routing.routes[0];
> +
> +		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> +						   route->sink_stream);
>  		if (!fmt)
>  			return -EINVAL;
>  
> @@ -1062,6 +1069,7 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>  static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>  				     struct v4l2_subdev_state *state)
>  {
> +	const struct v4l2_subdev_route *route;
>  	const struct rcar_csi2_format *format;
>  	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
>  	const struct v4l2_mbus_framefmt *fmt;
> @@ -1070,7 +1078,16 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>  	int mbps, ret;
>  
>  	/* Use the format on the sink pad to compute the receiver config. */
> -	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> +
> +	if (state->routing.num_routes != 1)
> +		return -EINVAL;
> +
> +	route = &state->routing.routes[0];
> +
> +	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> +					   route->sink_stream);
> +	if (!fmt)
> +		return -EINVAL;
>  
>  	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
>  		fmt->width, fmt->height,
> @@ -1892,8 +1909,7 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  				struct v4l2_subdev_state *state,
>  				struct v4l2_subdev_format *format)
>  {
> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -	unsigned int num_pads = rcsi2_num_pads(priv);
> +	struct v4l2_mbus_framefmt *fmt;
>  
>  	if (format->pad > RCAR_CSI2_SINK)
>  		return v4l2_subdev_get_fmt(sd, state, format);
> @@ -1901,11 +1917,20 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  	if (!rcsi2_code_to_fmt(format->format.code))
>  		format->format.code = rcar_csi2_formats[0].code;
>  
> -	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
> +	/* Set sink format. */
> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> +	if (!fmt)
> +		return -EINVAL;

Can the call return NULL, isn't it checked by the subdev core already ?

> +
> +	*fmt = format->format;
> +
> +	/* Propagate the format to the source pad. */
> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> +							   format->stream);
> +	if (!fmt)
> +		return -EINVAL;

I wonder if this error check could be omitted too. If there's a format
for the sink stream, it means there's a route, so the opposite stream
format should be guaranteed to exist. Or maybe it's too late and I
should go to bed :-)

Looking at what other drivers do, they all check the return value of the
function, so let's keep it as-is for now.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
> -	/* Propagate the format to the source pads. */
> -	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < num_pads; i++)
> -		*v4l2_subdev_state_get_format(state, i) = format->format;
> +	*fmt = format->format;
>  
>  	return 0;
>  }
> @@ -1925,8 +1950,15 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
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
> @@ -1939,10 +1971,13 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
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
> @@ -2599,7 +2634,8 @@ static int rcsi2_probe(struct platform_device *pdev)
>  	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
>  	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
>  		 KBUILD_MODNAME, dev_name(&pdev->dev));
> -	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			     V4L2_SUBDEV_FL_STREAMS;
>  
>  	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>  	priv->subdev.entity.ops = &rcar_csi2_entity_ops;
> 

-- 
Regards,

Laurent Pinchart

