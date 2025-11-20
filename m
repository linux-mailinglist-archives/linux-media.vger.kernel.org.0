Return-Path: <linux-media+bounces-47491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5DCC740AB
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 13:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 29FC34E79AD
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 12:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF98337BA1;
	Thu, 20 Nov 2025 12:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6EvMImJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06296372AB6;
	Thu, 20 Nov 2025 12:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763643195; cv=none; b=n/I+Z3zFn4N8VGMv4HnVlk0d0w2i422iANPzXjcfuWjlr9teKI6bMJpg0fjHZLjE4ZvrZRuwnEKUn/BGLPukpA45I5zQS9K44FqJq20cyF1B0RVfXPYolZAhsQtq58lgEwuK4RtlUqr+UnoUalvuujd4vJKXm8LOu/o4cYV/m2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763643195; c=relaxed/simple;
	bh=wAIwwWOILZdo8CYRLJsfXOMDadh16/79zV2pg0ZVkOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORdEClhBVbOWtS7XbL8TS4C66q4lLlK86Rb55oAVKs24pMnv/QfLddW1d3pHRa0UnunXLSlMfWVuNyhBbtI25mGFBIiep8z9zTVhu1qSbEXxVnEzjGNFVGxvVLPHvRPlr/3qZcIdTDU6YvWJVsR7lVd6J4UvzLaAmZk/UuGyOGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6EvMImJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763643193; x=1795179193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wAIwwWOILZdo8CYRLJsfXOMDadh16/79zV2pg0ZVkOU=;
  b=g6EvMImJFyfWYQq66MP3Dch2LkPvTLBz3+fRrij4+DMP76vr8ooSwUel
   rW2PCwmXe7p0XKgtd7vNkbTW0Yaty2Vcngz8IrJXIDSh1EHGvSdkWR6hw
   z/X6YZdBwbWj73a3JK+k49LhYGeIjb9I1PhXPkvmmohhvG64KykWABRN4
   0REb2VOKfduXbtc9/5N51O4JevBiO06J4tT64yEPHT2fJHSMk7dWZIivJ
   sk/MhFztEk9C00XOchQLZFwCeVzcUkEfmgl1Tf7ALN5p0nCNpGr+hYZJR
   H9FpaDq19IErEGpcvm64vNJ17pMPtZzxYQPrcMTMalMgnE32eKUjLLegw
   g==;
X-CSE-ConnectionGUID: CGfPz9B6T3awQEXukmENJA==
X-CSE-MsgGUID: 8o2eBlpuQSO230tk8sW5Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77177260"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="77177260"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 04:53:12 -0800
X-CSE-ConnectionGUID: fKJt8wZbRwOTmi2Zut8bUQ==
X-CSE-MsgGUID: tshPo2xZSGqS4VeqqpgPYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="214721964"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.114])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 04:53:07 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F02B1121DCE;
	Thu, 20 Nov 2025 14:53:04 +0200 (EET)
Date: Thu, 20 Nov 2025 14:53:04 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com,
	mripard@kernel.org, y-abhilashchandra@ti.com, devarsht@ti.com,
	s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de,
	conor+dt@kernel.org, hverkuil-cisco@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com,
	changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
	sjoerd@collabora.com, dan.carpenter@linaro.org,
	hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 12/18] media: cadence: csi2rx: add multistream support
Message-ID: <aR8PMEHTJJVlg0YM@kekkonen.localdomain>
References: <20251112115459.2479225-1-r-donadkar@ti.com>
 <20251112115459.2479225-13-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112115459.2479225-13-r-donadkar@ti.com>

Hi Rishikesh,

I'm not commenting on the use of {en,dis}able_streams in the series; it may
be this area will need some work in general, including in V4L2 core.

On Wed, Nov 12, 2025 at 05:24:53PM +0530, Rishikesh Donadkar wrote:
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
> Implement a fallback s_stream hook that internally calls enable_stream
> on each source pad, for consumer drivers that don't use multi-stream
> APIs to still work. The helper function v4l2_subdev_s_stream_helper()
> form the v4l2 framework is not used here as it is meant only for the
> subedvs that have a single source pad and this hardware IP supports
> having multiple source pads.
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 283 ++++++++++++++++---
>  1 file changed, 236 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 3688077fa8347..833bc134f17cb 100644
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
> @@ -273,30 +274,43 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
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
> +		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
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
> @@ -394,11 +408,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
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
> @@ -486,18 +496,59 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
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
> +	/* Capture VC=0 by default */
> +	for (i = 0; i < CSI2RX_STREAMS_MAX; i++)
> +		csi2rx->vc_select[i] = CSI2RX_STREAM_DATA_CFG_VC_SELECT(0);
> +
> +	ret = csi2rx_get_frame_desc_from_source(csi2rx, &fd);
> +	if (ret || fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> +		dev_dbg(csi2rx->dev,
> +			"Failed to get source frame desc, allowing only VC=0\n");
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
> @@ -505,10 +556,11 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
>  
>  	/* Start streaming on the source */
>  	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev, csi2rx->source_pad,
> -					 BIT(0));
> +					 sink_streams);
>  	if (ret) {
>  		dev_err(csi2rx->dev,
> -			"Failed to start streams %d on subdev\n", 0);
> +			"Failed to start streams %#llx on subdev\n",
> +			sink_streams);
>  		if (!csi2rx->count)
>  			csi2rx_stop(csi2rx);
>  		return ret;
> @@ -523,9 +575,14 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
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
> -					csi2rx->source_pad, BIT(0))) {
> +						 csi2rx->source_pad, sink_streams)) {
>  		dev_err(csi2rx->dev, "Couldn't disable our subdev\n");
>  	}
>  
> @@ -538,6 +595,36 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
>  	return 0;
>  }
>  
> +static int csi2rx_s_stream_fallback(struct v4l2_subdev *sd, int enable)

What do you need this for? I presume you'd have a sub-device driver
downstream calling this, but wouldn't you always use {en,dis}able_streams
from that driver?

> +{
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_subdev_route *route;
> +	u64 mask[CSI2RX_PAD_MAX] = {0};
> +	int i, ret;
> +
> +	/* Find the stream mask on all source pads */
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
> +		for_each_active_route(&state->routing, route) {
> +			if (route->source_pad == i)
> +				mask[i] |= BIT_ULL(route->source_stream);
> +		}
> +	}
> +	v4l2_subdev_unlock_state(state);
> +
> +	/* Start streaming on each pad */
> +	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
> +		if (enable)
> +			ret = v4l2_subdev_enable_streams(sd, i, mask[i]);
> +		else
> +			ret = v4l2_subdev_disable_streams(sd, i, mask[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return ret;
> +}
> +
>  static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
>  				 struct v4l2_subdev_state *state,
>  				 struct v4l2_subdev_mbus_code_enum *code_enum)
> @@ -550,12 +637,56 @@ static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
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
> @@ -567,14 +698,16 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
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
> @@ -582,21 +715,22 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
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
> @@ -630,17 +764,70 @@ static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
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
> +
> +		fd->num_entries++;
> +	}
> +
> +err_missing_stream:
> +	v4l2_subdev_unlock_state(state);
>  
> -	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
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
> +};
> +
> +static const struct v4l2_subdev_video_ops csi2rx_video_ops = {
> +	.s_stream	= csi2rx_s_stream_fallback,
>  };
>  
>  static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
> @@ -649,6 +836,7 @@ static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
>  
>  static const struct v4l2_subdev_ops csi2rx_subdev_ops = {
>  	.core		= &csi2rx_core_ops,
> +	.video		= &csi2rx_video_ops,
>  	.pad		= &csi2rx_pad_ops,
>  };
>  
> @@ -876,7 +1064,8 @@ static int csi2rx_probe(struct platform_device *pdev)
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

