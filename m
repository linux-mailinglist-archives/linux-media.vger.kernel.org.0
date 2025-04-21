Return-Path: <linux-media+bounces-30620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEB3A95224
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 15:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C92A188D6AB
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB53266B4F;
	Mon, 21 Apr 2025 13:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tjj/0M36"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9FD266591;
	Mon, 21 Apr 2025 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243829; cv=none; b=jNbrB4LYixIawN8vI8dmwYW4D8H7ew3A0D5n3LD4hgC56jcnnIaJZFdv8nnVH7kVhR2GsegVJzZdvhBXVL4Ctz8H7iAmBiiFf2qp7gshku88VmK0obw04MDi2PDGo3tvEvyQyitZK1WGEb4vJKNCENdsADrEAPhme4jpXwnnC2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243829; c=relaxed/simple;
	bh=IQpFlSoN+Hc9SPc5gSeB5ytQkmTLnGIbzB4raanhZ0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIDBHA4iffUbSw1MVAR9TJDVl7An9LC+7lPrdb7ZfMtwirZexNxwW2tqFk7LlJcT6Li2pBt4UncoxQMXrg2FdxnJkqjuqV3WC6xUaMENITnjTtitWoCKmVMXq45YmU7w78oJD2eECr514Ro4tiMQhcIbh45ekXkF3qhGh/xK9m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tjj/0M36; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 503EE6D5;
	Mon, 21 Apr 2025 15:54:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745243697;
	bh=IQpFlSoN+Hc9SPc5gSeB5ytQkmTLnGIbzB4raanhZ0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tjj/0M36rT2yseaIj+h5k/7ZxOtUHC9zOCzBttMTJd+XR5+QsRBmdC6baxWlojqhq
	 VE1YCqODmixJ6nmVOzZWy3zcXdyO/fRZXJmHmce3XLuWDwWYiMRbz0YuxKjpnCvZwb
	 CsYLrGuAyl9GKnNy70TnE0TT+GxUPQPKA/I9rGkU=
Date: Mon, 21 Apr 2025 16:57:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: jai.luthra@linux.dev, mripard@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	devarsht@ti.com, y-abhilashchandra@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	vaishnav.a@ti.com, s-jain1@ti.com, vigneshr@ti.com,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com,
	changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com
Subject: Re: [PATCH v3 10/13] media: cadence: csi2rx: Enable multi-stream
 support
Message-ID: <20250421135702.GJ29483@pendragon.ideasonboard.com>
References: <20250417065554.437541-1-r-donadkar@ti.com>
 <20250417065554.437541-11-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065554.437541-11-r-donadkar@ti.com>

Hi Rishikesh,

Thank you for the patch.

On Thu, Apr 17, 2025 at 12:25:51PM +0530, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> Cadence CSI-2 bridge IP supports capturing multiple virtual "streams"
> of data over the same physical interface using MIPI Virtual Channels.
> 
> The V4L2 subdev APIs should reflect this capability and allow per-stream
> routing and controls.
> 
> While the hardware IP supports usecases where streams coming in the sink
> pad can be broadcasted to multiple source pads, the driver will need
> significant re-architecture to make that possible. The two users of this
> IP in mainline linux are TI Shim and StarFive JH7110 CAMSS, and both
> have only integrated the first source pad i.e stream0 of this IP. So for
> now keep it simple and only allow 1-to-1 mapping of streams from sink to
> source, without any broadcasting.
> 
> With stream routing now supported in the driver, implement the
> enable_stream and disable_stream hooks in place of the stream-unaware
> s_stream hook.
> 
> This allows consumer devices like a DMA bridge or ISP, to enable
> particular streams on a source pad, which in turn can be used to enable
> only particular streams on the CSI-TX device connected on the sink pad.
> 
> Implement a fallback s_stream hook that internally calls enable_stream
> on each source pad, for consumer drivers that don't use multi-stream
> APIs to still work.

Can't you use v4l2_subdev_s_stream_helper() ? If not, please briefly
explain why in the commit message.

> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 378 ++++++++++++++-----
>  1 file changed, 288 insertions(+), 90 deletions(-)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index df05d278df379..95beb6623de8c 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -90,6 +90,7 @@ struct csi2rx_priv {
>  	struct reset_control		*pixel_rst[CSI2RX_STREAMS_MAX];
>  	struct phy			*dphy;
>  
> +	u32				vc_select[CSI2RX_STREAMS_MAX];
>  	u8				lanes[CSI2RX_LANES_MAX];
>  	u8				num_lanes;
>  	u8				max_lanes;
> @@ -179,29 +180,36 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
>  
>  static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>  {
> -	struct media_pad *src_pad =
> -		&csi2rx->source_subdev->entity.pads[csi2rx->source_pad];
> +	struct v4l2_ctrl_handler *handler = csi2rx->source_subdev->ctrl_handler;
>  	union phy_configure_opts opts = { };
>  	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> -	struct v4l2_subdev_format sd_fmt = {
> -		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
> -		.pad	= CSI2RX_PAD_SINK,
> -	};
> +	struct v4l2_mbus_framefmt *framefmt;
> +	struct v4l2_subdev_state *state;
>  	const struct csi2rx_fmt *fmt;
>  	s64 link_freq;
>  	int ret;
>  
> -	ret = v4l2_subdev_call_state_active(&csi2rx->subdev, pad, get_fmt,
> -					    &sd_fmt);
> -	if (ret < 0)
> -		return ret;
> -
> -	fmt = csi2rx_get_fmt_by_code(sd_fmt.format.code);
> +	if (v4l2_ctrl_find(handler, V4L2_CID_LINK_FREQ)) {
> +		link_freq = v4l2_get_link_freq(handler, 0, 0);
> +	} else {
> +		state = v4l2_subdev_get_locked_active_state(&csi2rx->subdev);
> +		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK,
> +							0);
> +		fmt = csi2rx_get_fmt_by_code(framefmt->code);
> +
> +		link_freq = v4l2_get_link_freq(handler, fmt->bpp,
> +					       2 * csi2rx->num_lanes);
> +
> +		dev_warn(csi2rx->dev,
> +			 "Guessing link frequency using bitdepth of stream 0.\n");
> +		dev_warn(csi2rx->dev,
> +			 "V4L2_CID_LINK_FREQ control is required for multi format sources.\n");
> +	}

Why do you need this complexity, instead of calling the
v4l2_get_link_freq() variant that takes the source pad as its first
argument ?

>  
> -	link_freq = v4l2_get_link_freq(src_pad,
> -				       fmt->bpp, 2 * csi2rx->num_lanes);
> -	if (link_freq < 0)
> +	if (link_freq < 0) {
> +		dev_err(csi2rx->dev, "Unable to calculate link frequency\n");
>  		return link_freq;
> +	}
>  
>  	ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq,
>  							 csi2rx->num_lanes, cfg);
> @@ -224,18 +232,10 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>  static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  {
>  	unsigned int i;
> -	struct media_pad *remote_pad;
>  	unsigned long lanes_used = 0;
>  	u32 reg;
>  	int ret;
>  
> -	remote_pad = media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SINK]);
> -	if (!remote_pad) {
> -		dev_err(csi2rx->dev,
> -			"Failed to find connected source\n");
> -		return -ENODEV;
> -	}
> -
>  	ret = clk_prepare_enable(csi2rx->p_clk);
>  	if (ret)
>  		return ret;
> @@ -302,11 +302,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF,
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
> @@ -319,17 +315,10 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  
>  	reset_control_deassert(csi2rx->sys_rst);
>  
> -	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev,
> -					 remote_pad->index, BIT(0));
> -	if (ret)
> -		goto err_disable_sysclk;
> -
>  	clk_disable_unprepare(csi2rx->p_clk);
>  
>  	return 0;
>  
> -err_disable_sysclk:
> -	clk_disable_unprepare(csi2rx->sys_clk);
>  err_disable_pixclk:
>  	for (; i > 0; i--) {
>  		reset_control_assert(csi2rx->pixel_rst[i - 1]);
> @@ -348,7 +337,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  
>  static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  {
> -	struct media_pad *remote_pad;
>  	unsigned int i;
>  	u32 val;
>  	int ret;
> @@ -377,13 +365,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  	reset_control_assert(csi2rx->p_rst);
>  	clk_disable_unprepare(csi2rx->p_clk);
>  
> -	remote_pad = media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SINK]);
> -	if (!remote_pad ||
> -	    v4l2_subdev_disable_streams(csi2rx->source_subdev,
> -					remote_pad->index, BIT(0))) {
> -		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
> -	}
> -
>  	if (csi2rx->dphy) {
>  		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
>  
> @@ -392,37 +373,153 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  	}
>  }
>  
> -static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
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
> +static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
>  {
>  	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> -	int ret = 0;
> +	struct media_pad *remote_pad;
> +	u64 sink_streams;
> +	int ret;
> +
> +	remote_pad = media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SINK]);
> +	if (!remote_pad) {
> +		dev_err(csi2rx->dev,
> +			"Failed to find connected source\n");
> +		return -ENODEV;
> +	}
> +
> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
> +						       CSI2RX_PAD_SINK,
> +						       &streams_mask);
>  
>  	mutex_lock(&csi2rx->lock);

Can you use lock guards ? It will simplify error handling.

> +	/*
> +	 * If we're not the first users, there's no need to
> +	 * enable the whole controller.
> +	 */
> +	if (!csi2rx->count) {

I would have stored the bitmask of enabled streams instead of a count,
but it doesn't matter that much.

> +		ret = csi2rx_start(csi2rx);
> +		if (ret)
> +			goto err_stream_start;
> +	}
>  
> -	if (enable) {
> -		/*
> -		 * If we're not the first users, there's no need to
> -		 * enable the whole controller.
> -		 */
> -		if (!csi2rx->count) {
> -			ret = csi2rx_start(csi2rx);
> -			if (ret)
> -				goto out;
> -		}
> +	/* Start streaming on the source */
> +	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev, remote_pad->index,
> +					 sink_streams);
> +	if (ret) {
> +		dev_err(csi2rx->dev,
> +			"Failed to start streams %#llx on subdev\n",
> +			sink_streams);
> +		goto err_subdev_enable;
> +	}
>  
> -		csi2rx->count++;
> -	} else {
> -		csi2rx->count--;
> +	csi2rx->count++;
> +	mutex_unlock(&csi2rx->lock);
> +
> +	return 0;
> +
> +err_subdev_enable:
> +	if (!csi2rx->count)
> +		csi2rx_stop(csi2rx);
> +err_stream_start:
> +	mutex_unlock(&csi2rx->lock);
> +	return ret;
> +}
> +
> +static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
> +{
> +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> +	struct media_pad *remote_pad;
> +	u64 sink_streams;
> +
> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
> +						       CSI2RX_PAD_SINK,
> +						       &streams_mask);
>  
> -		/*
> -		 * Let the last user turn off the lights.
> -		 */
> -		if (!csi2rx->count)
> -			csi2rx_stop(csi2rx);
> +	remote_pad = media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SINK]);
> +	if (!remote_pad ||
> +	    v4l2_subdev_disable_streams(csi2rx->source_subdev,
> +					remote_pad->index, sink_streams)) {
> +		dev_err(csi2rx->dev, "Couldn't disable our subdev\n");
>  	}
>  
> -out:
> +	mutex_lock(&csi2rx->lock);
> +	csi2rx->count--;
> +	/*
> +	 * Let the last user turn off the lights.
> +	 */

This can become a single line.

> +	if (!csi2rx->count)
> +		csi2rx_stop(csi2rx);
>  	mutex_unlock(&csi2rx->lock);
> +
> +	return 0;
> +}
> +
> +static int csi2rx_s_stream_fallback(struct v4l2_subdev *sd, int enable)
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
>  	return ret;
>  }
>  
> @@ -438,12 +535,58 @@ static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
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
> +	csi2rx_update_vc_select(csi2rx, state);

When setting routing on the TRY state this will update the active state,
which isn't correct. Can you call this function when starting the device
instead ?

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
> @@ -455,14 +598,16 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
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
> @@ -470,40 +615,92 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
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
>  static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
>  				 struct v4l2_mbus_frame_desc *fd)
>  {
>  	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> +	struct v4l2_mbus_frame_desc source_fd = {0};
> +	struct v4l2_subdev_route *route;
> +	struct v4l2_subdev_state *state;
> +	int ret;
>  
> -	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
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
> +
> +	return ret;
>  }
>  
>  static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
> -	.enum_mbus_code	= csi2rx_enum_mbus_code,
> -	.get_fmt	= v4l2_subdev_get_fmt,
> -	.set_fmt	= csi2rx_set_fmt,
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
>  static const struct v4l2_subdev_video_ops csi2rx_video_ops = {
> -	.s_stream	= csi2rx_s_stream,
> +	.s_stream	= csi2rx_s_stream_fallback,
>  };
>  
>  static const struct v4l2_subdev_ops csi2rx_subdev_ops = {
> @@ -735,7 +932,8 @@ static int csi2rx_probe(struct platform_device *pdev)
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
Regards,

Laurent Pinchart

