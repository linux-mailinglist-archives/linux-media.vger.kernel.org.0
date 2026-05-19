Return-Path: <linux-media+bounces-62132-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIUDL21SDGpxfQUAu9opvQ
	(envelope-from <linux-media+bounces-62132-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:07:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2A457E4F9
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E862303A4E1
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 12:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5FA4C9564;
	Tue, 19 May 2026 12:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRkb9nJX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6EC4C0439;
	Tue, 19 May 2026 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779192362; cv=none; b=J82GPW/HzTsmLvlrS1wYdgLt/WwSbgZrWTH1hmzIz/6wnFYTFz3PhRkdtuzMDqYcmPoZIfI3weVFkJZG4poBZADH/QB2y1EbUvfwhxfJxXdSqqrqKFf8+JnjAdE3YFHBxh87972hsuGDPIfNdm7+Y1YOL3phG55Cw82a5U4cLuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779192362; c=relaxed/simple;
	bh=cuhVHEWM65taIZm9uhCTLowFLxCgYllTQXO9OsH8CtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=inAguRBOGtCa17JfkJ2fQb+FXUUyZPfs3gwvOYjIAvGmowqB4KpTgKfzZk5w3mcPUSVVxMfZP0d3w6SjUOEm6WCmI14HhV/4IDdXCTFKM30tmZGp0ns2RlGvBnJuV2lNzidEy7co8L97JK6QhRoUeDLu91NpbeDopQESnJT8r1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRkb9nJX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779192361; x=1810728361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cuhVHEWM65taIZm9uhCTLowFLxCgYllTQXO9OsH8CtQ=;
  b=DRkb9nJX4adFF8jDEU7a+VZ7mOBT9z7xhubSjZ1NxkTl2QdZzYOB8iYy
   NU341S5ZgXu+W2uRJ2FIcOB4jfTCslOMo9Rf2dybJMnw7AfA+6HajJH6m
   W6oYC+4fP89ZHzEeX6GZLrVhyWdiCXZho0xPjNmE0qs6Xg2nWulkRF0S8
   PWM6VNkZbMN94pqgTNIFOsaeFY6rPvUYqgMG1vrUIto6SDyDdSvJi1Ptj
   nJHYyRM1nSPfd693LBOg4EcupWfgqDchYlOy0daVDK5gA4UF+SYW4mpbs
   MMNRGFQJktGeDgPTnSebXWeQgjxMaeNtLcjSOW/OKGuDoMBIJ9o1wyMU7
   w==;
X-CSE-ConnectionGUID: 2DqTow/uScqNitSSya9Z3A==
X-CSE-MsgGUID: kv+HEyy6R62wSR8J4xdlbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="102742402"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="102742402"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:05:59 -0700
X-CSE-ConnectionGUID: DP1PpljRQ82610RPWE5eEA==
X-CSE-MsgGUID: b1SyTBUuR+u0BOqGZ54wzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="244044464"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.204])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:05:52 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B3650120E58;
	Tue, 19 May 2026 15:05:48 +0300 (EEST)
Date: Tue, 19 May 2026 15:05:48 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com,
	mripard@kernel.org, y-abhilashchandra@ti.com, devarsht@ti.com,
	s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de,
	conor+dt@kernel.org, hverkuil-cisco@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com,
	changhuang.liang@starfivetech.com, sjoerd@collabora.com,
	dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v12 11/17] media: cadence: csi2rx: add multistream support
Message-ID: <agxSHK-Edk8zoJmx@kekkonen.localdomain>
References: <20260313090701.646534-1-r-donadkar@ti.com>
 <20260313090701.646534-12-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313090701.646534-12-r-donadkar@ti.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62132-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,ideasonboard.com,kernel.org,ti.com,pengutronix.de,xs4all.nl,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,kekkonen.localdomain:mid,ti.com:email,starfivetech.com:email,ideasonboard.com:email]
X-Rspamd-Queue-Id: 4D2A457E4F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rishikesh,

On Fri, Mar 13, 2026 at 02:36:55PM +0530, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> Cadence CSI-2 bridge IP supports capturing multiple virtual "streams"
> of data over the same physical interface using MIPI Virtual Channels.
> 
> While the hardware IP supports usecases where streams coming in the sink
> pad can be broadcasted to multiple source pads, the driver will need
> significant re-architecture to make that possible. The two users of this
> IP in mainline linux are TI Shim and StarFive JH7110 CAMSS, and both
> have only integrated the first source pad i.e stream0 of this IP. So for
> now keep it simple and only allow 1-to-1 mapping of streams from sink to
> source, without any broadcasting.
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 279 +++++++++++++++----
>  1 file changed, 227 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 52ca940acd7d0..f34df341a2cac 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -135,6 +135,7 @@ struct csi2rx_priv {
>  	struct phy			*dphy;
>  
>  	u8				num_pixels[CSI2RX_STREAMS_MAX];
> +	u32				vc_select[CSI2RX_STREAMS_MAX];
>  	u8				lanes[CSI2RX_LANES_MAX];
>  	u8				num_lanes;
>  	u8				max_lanes;
> @@ -273,30 +274,46 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
>  
>  static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>  {
> -	struct media_pad *src_pad =
> -		&csi2rx->source_subdev->entity.pads[csi2rx->source_pad];
>  	union phy_configure_opts opts = { };
>  	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> -	struct v4l2_subdev_state *state;
>  	struct v4l2_mbus_framefmt *framefmt;
> +	struct v4l2_subdev_state *state;
>  	const struct csi2rx_fmt *fmt;
> +	struct v4l2_subdev_route *route;
> +	int source_pad = csi2rx->source_pad;
> +	struct media_pad *pad = &csi2rx->source_subdev->entity.pads[source_pad];
>  	s64 link_freq;
>  	int ret;
> +	u32 bpp;
>  
>  	state = v4l2_subdev_get_locked_active_state(&csi2rx->subdev);
>  
> -	framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
> -	if (!framefmt) {
> -		dev_err(csi2rx->dev, "Did not find active sink format\n");
> -		return -EINVAL;
> -	}
> +	/*
> +	 * For multi-stream transmitters there is no single pixel rate.
> +	 *
> +	 * In multistream usecase pass bpp as 0 so that v4l2_get_link_freq()
> +	 * returns an error if it falls back to V4L2_CID_PIXEL_RATE.
> +	 */
> +	if (state->routing.num_routes > 1) {
> +		bpp = 0;
> +	} else {
> +		route = &state->routing.routes[0];
> +		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK,
> +							route->sink_stream);
> +		if (!framefmt) {
> +			dev_err(csi2rx->dev, "Did not find active sink format\n");
> +			return -EINVAL;
> +		}
>  
> -	fmt = csi2rx_get_fmt_by_code(framefmt->code);
> +		fmt = csi2rx_get_fmt_by_code(framefmt->code);
> +		bpp = fmt->bpp;
> +	}
>  
> -	link_freq = v4l2_get_link_freq(src_pad,
> -				       fmt->bpp, 2 * csi2rx->num_lanes);
> -	if (link_freq < 0)
> +	link_freq = v4l2_get_link_freq(pad, bpp, 2 * csi2rx->num_lanes);
> +	if (link_freq < 0) {
> +		dev_err(csi2rx->dev, "Unable to calculate link frequency\n");
>  		return link_freq;
> +	}
>  
>  	ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq,
>  							 csi2rx->num_lanes, cfg);
> @@ -394,11 +411,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  					  csi2rx->num_pixels[i]),
>  		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
>  
> -		/*
> -		 * Enable one virtual channel. When multiple virtual channels
> -		 * are supported this will have to be changed.
> -		 */
> -		writel(CSI2RX_STREAM_DATA_CFG_VC_SELECT(0),
> +		writel(csi2rx->vc_select[i],
>  		       csi2rx->base + CSI2RX_STREAM_DATA_CFG_REG(i));
>  
>  		writel(CSI2RX_STREAM_CTRL_START,
> @@ -486,18 +499,57 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
>  	return 0;
>  }
>  
> +static void csi2rx_update_vc_select(struct csi2rx_priv *csi2rx,
> +				    struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_mbus_frame_desc fd = {0};
> +	struct v4l2_subdev_route *route;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = csi2rx_get_frame_desc_from_source(csi2rx, &fd);
> +	if (ret || fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> +		dev_dbg(csi2rx->dev,
> +			"Failed to get source frame desc, allowing only VC=0\n");
> +		for (i = 0; i < CSI2RX_STREAMS_MAX; i++)
> +			csi2rx->vc_select[i] = CSI2RX_STREAM_DATA_CFG_VC_SELECT(0);
> +		return;
> +	}
> +
> +	/* If source provides per-stream VC info, use it to filter by VC */
> +	memset(csi2rx->vc_select, 0, sizeof(csi2rx->vc_select));
> +
> +	for_each_active_route(&state->routing, route) {
> +		u32 cdns_stream = route->source_pad - CSI2RX_PAD_SOURCE_STREAM0;
> +
> +		for (i = 0; i < fd.num_entries; i++) {
> +			if (fd.entry[i].stream != route->sink_stream)
> +				continue;
> +
> +			csi2rx->vc_select[cdns_stream] |=
> +				CSI2RX_STREAM_DATA_CFG_VC_SELECT(fd.entry[i].bus.csi2.vc);
> +		}
> +	}
> +}
> +
>  static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
>  				 struct v4l2_subdev_state *state, u32 pad,
>  				 u64 streams_mask)
>  {
>  	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> +	u64 sink_streams;
>  	int ret;
>  
> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
> +						       CSI2RX_PAD_SINK,
> +						       &streams_mask);
> +
>  	/*
>  	 * If we're not the first users, there's no need to
>  	 * enable the whole controller.
>  	 */
>  	if (!csi2rx->count) {
> +		csi2rx_update_vc_select(csi2rx, state);
>  		ret = csi2rx_start(csi2rx);
>  		if (ret)
>  			return ret;
> @@ -505,10 +557,11 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
>  
>  	/* Start streaming on the source */
>  	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev, csi2rx->source_pad,
> -					 BIT_U64(0));
> +					 sink_streams);
>  	if (ret) {
>  		dev_err(csi2rx->dev,
> -			"Failed to start streams %d on subdev\n", 0);
> +			"Failed to start streams %#llx on subdev\n",
> +			sink_streams);
>  		if (!csi2rx->count)
>  			csi2rx_stop(csi2rx);
>  		return ret;
> @@ -523,9 +576,14 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
>  				  u64 streams_mask)
>  {
>  	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> +	u64 sink_streams;
> +
> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
> +						       CSI2RX_PAD_SINK,
> +						       &streams_mask);
>  
>  	if (v4l2_subdev_disable_streams(csi2rx->source_subdev,
> -					csi2rx->source_pad, BIT_U64(0))) {
> +						 csi2rx->source_pad, sink_streams)) {
>  		dev_err(csi2rx->dev, "Couldn't disable our subdev\n");
>  	}
>  
> @@ -550,12 +608,56 @@ static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
>  	return 0;
>  }
>  
> +static int _csi2rx_set_routing(struct v4l2_subdev *subdev,
> +			       struct v4l2_subdev_state *state,
> +			       struct v4l2_subdev_krouting *routing)
> +{
> +	static const struct v4l2_mbus_framefmt format = {
> +		.width = 640,
> +		.height = 480,
> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.field = V4L2_FIELD_NONE,
> +		.colorspace = V4L2_COLORSPACE_SRGB,
> +		.ycbcr_enc = V4L2_YCBCR_ENC_601,
> +		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
> +		.xfer_func = V4L2_XFER_FUNC_SRGB,
> +	};
> +	int ret;
> +
> +	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
> +		return -EINVAL;

Is there a need for this check? The framework already checks the number of
active routes isn't larger than V4L2_FRAME_DESC_ENTRY_MAX.

> +
> +	ret = v4l2_subdev_routing_validate(subdev, routing,
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_subdev_set_routing_with_fmt(subdev, state, routing, &format);
> +}
> +
> +static int csi2rx_set_routing(struct v4l2_subdev *subdev,
> +			      struct v4l2_subdev_state *state,
> +			      enum v4l2_subdev_format_whence which,
> +			      struct v4l2_subdev_krouting *routing)
> +{
> +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> +	int ret;
> +
> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && csi2rx->count)
> +		return -EBUSY;
> +
> +	ret = _csi2rx_set_routing(subdev, state, routing);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
>  			  struct v4l2_subdev_state *state,
>  			  struct v4l2_subdev_format *format)
>  {
>  	struct v4l2_mbus_framefmt *fmt;
> -	unsigned int i;
>  
>  	/* No transcoding, source and sink formats must match. */
>  	if (format->pad != CSI2RX_PAD_SINK)
> @@ -567,14 +669,16 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
>  	format->format.field = V4L2_FIELD_NONE;
>  
>  	/* Set sink format */
> -	fmt = v4l2_subdev_state_get_format(state, format->pad);
> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
>  	*fmt = format->format;
>  
> -	/* Propagate to source formats */
> -	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
> -		fmt = v4l2_subdev_state_get_format(state, i);
> -		*fmt = format->format;
> -	}
> +	/* Propagate to source format */
> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> +							   format->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	*fmt = format->format;
>  
>  	return 0;
>  }
> @@ -582,21 +686,22 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
>  static int csi2rx_init_state(struct v4l2_subdev *subdev,
>  			     struct v4l2_subdev_state *state)
>  {
> -	struct v4l2_subdev_format format = {
> -		.pad = CSI2RX_PAD_SINK,
> -		.format = {
> -			.width = 640,
> -			.height = 480,
> -			.code = MEDIA_BUS_FMT_UYVY8_1X16,
> -			.field = V4L2_FIELD_NONE,
> -			.colorspace = V4L2_COLORSPACE_SRGB,
> -			.ycbcr_enc = V4L2_YCBCR_ENC_601,
> -			.quantization = V4L2_QUANTIZATION_LIM_RANGE,
> -			.xfer_func = V4L2_XFER_FUNC_SRGB,
> +	struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = CSI2RX_PAD_SINK,
> +			.sink_stream = 0,
> +			.source_pad = CSI2RX_PAD_SOURCE_STREAM0,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
>  		},
>  	};
>  
> -	return csi2rx_set_fmt(subdev, state, &format);
> +	struct v4l2_subdev_krouting routing = {
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
> +
> +	return _csi2rx_set_routing(subdev, state, &routing);
>  }
>  
>  int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
> @@ -604,25 +709,44 @@ int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
>  {
>  	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>  	const struct csi2rx_fmt *csi_fmt;
> +	struct v4l2_subdev_route *route;
>  	struct v4l2_subdev_state *state;
>  	struct v4l2_mbus_framefmt *fmt;
> +	int ret = 0;
>  
>  	if (!ppc || pad < CSI2RX_PAD_SOURCE_STREAM0 || pad >= CSI2RX_PAD_MAX)
>  		return -EINVAL;
>  
>  	state = v4l2_subdev_lock_and_get_active_state(subdev);
> -	fmt = v4l2_subdev_state_get_format(state, pad);
> -	csi_fmt = csi2rx_get_fmt_by_code(fmt->code);
> +	/* Check all streams on requested pad */
> +	for_each_active_route(&state->routing, route) {
> +		if (route->source_pad != pad)
> +			continue;
> +
> +		fmt = v4l2_subdev_state_get_format(state, route->source_pad,
> +						   route->source_stream);
> +		if (!fmt) {
> +			ret = -EPIPE;
> +			*ppc = 1;
> +			break;
> +		}
>  
> -	/* Reduce requested PPC if it is too high */
> -	*ppc = min(*ppc, csi_fmt->max_pixels);
> +		csi_fmt = csi2rx_get_fmt_by_code(fmt->code);
> +		if (!csi_fmt) {
> +			ret = -EINVAL;
> +			*ppc = 1;
> +			break;
> +		}
>  
> +		/* Reduce requested PPC if it is too high for this stream */
> +		*ppc = min(*ppc, csi_fmt->max_pixels);
> +	}
>  	v4l2_subdev_unlock_state(state);
>  
>  	csi2rx->num_pixels[pad - CSI2RX_PAD_SOURCE_STREAM0] =
>  		CSI2RX_STREAM_CFG_NUM_PIXELS(*ppc);
>  
> -	return 0;
> +	return ret;
>  }
>  EXPORT_SYMBOL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
>  
> @@ -630,17 +754,66 @@ static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
>  				 struct v4l2_mbus_frame_desc *fd)
>  {
>  	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> +	struct v4l2_mbus_frame_desc source_fd = {0};
> +	struct v4l2_subdev_route *route;
> +	struct v4l2_subdev_state *state;
> +	int ret;
> +
> +	ret = csi2rx_get_frame_desc_from_source(csi2rx, &source_fd);
> +	if (ret)
> +		return ret;
> +
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(subdev);
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
> +		unsigned int i;
> +
> +		if (route->source_pad != pad)
> +			continue;
> +
> +		for (i = 0; i < source_fd.num_entries; i++) {
> +			if (source_fd.entry[i].stream == route->sink_stream) {
> +				source_entry = &source_fd.entry[i];
> +				break;
> +			}
> +		}
> +
> +		if (!source_entry) {
> +			dev_err(csi2rx->dev,
> +				"Failed to find stream from source frame desc\n");
> +			ret = -EPIPE;
> +			goto err_missing_stream;
> +		}
> +
> +		fd->entry[fd->num_entries].stream = route->source_stream;
> +		fd->entry[fd->num_entries].flags = source_entry->flags;
> +		fd->entry[fd->num_entries].length = source_entry->length;
> +		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
> +		fd->entry[fd->num_entries].bus.csi2.vc =
> +			source_entry->bus.csi2.vc;
> +		fd->entry[fd->num_entries].bus.csi2.dt =
> +			source_entry->bus.csi2.dt;
>  
> -	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
> +		fd->num_entries++;

Would v4l2_subdev_get_frame_desc_passthrough() be useful here?

> +	}
> +
> +err_missing_stream:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
>  }
>  
>  static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
> -	.enum_mbus_code	= csi2rx_enum_mbus_code,
> -	.get_fmt	= v4l2_subdev_get_fmt,
> -	.set_fmt	= csi2rx_set_fmt,
> -	.enable_streams         = csi2rx_enable_streams,
> -	.disable_streams        = csi2rx_disable_streams,
> -	.get_frame_desc	= csi2rx_get_frame_desc,
> +	.enum_mbus_code		= csi2rx_enum_mbus_code,
> +	.get_fmt		= v4l2_subdev_get_fmt,
> +	.set_fmt		= csi2rx_set_fmt,
> +	.get_frame_desc		= csi2rx_get_frame_desc,
> +	.set_routing		= csi2rx_set_routing,
> +	.enable_streams		= csi2rx_enable_streams,
> +	.disable_streams	= csi2rx_disable_streams,
>  };
>  
>  static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
> @@ -659,6 +832,7 @@ static const struct v4l2_subdev_internal_ops csi2rx_internal_ops = {
>  static const struct media_entity_operations csi2rx_media_ops = {
>  	.link_validate = v4l2_subdev_link_validate,
>  	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
> +	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
>  };
>  
>  static int csi2rx_async_bound(struct v4l2_async_notifier *notifier,
> @@ -876,7 +1050,8 @@ static int csi2rx_probe(struct platform_device *pdev)
>  	csi2rx->pads[CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>  	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++)
>  		csi2rx->pads[i].flags = MEDIA_PAD_FL_SOURCE;
> -	csi2rx->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	csi2rx->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
> +		V4L2_SUBDEV_FL_STREAMS;
>  	csi2rx->subdev.entity.ops = &csi2rx_media_ops;
>  
>  	ret = media_entity_pads_init(&csi2rx->subdev.entity, CSI2RX_PAD_MAX,

-- 
Kind regards,

Sakari Ailus

