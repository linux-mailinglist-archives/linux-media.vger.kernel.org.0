Return-Path: <linux-media+bounces-42952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE541B91C1D
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 16:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 947693BADBD
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 14:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112DF280CC8;
	Mon, 22 Sep 2025 14:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g6AsSLfb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1137527B326;
	Mon, 22 Sep 2025 14:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551978; cv=none; b=B/x07HSuy3cjtFftcD1106b+97P7kGwG9LnSgHgguNDXT1BZcIK8Jxx1nIEDwafJY1PHsgRETtSO7ojaGGCqH/8tLdnaf8xBEacnbooCynBh1bQilKirbTNVUVx+zgGG1fe3yclHTUYszuzlgftAVt2+YhdU5WreOyhdpr5f6mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551978; c=relaxed/simple;
	bh=lIxyAy1YtTah3ISC45oFSsTo/0+R0VopM/MHUttHwMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YlDG5NhpNOsOZfNJB+AQYWguHhFaX837Evnx4vkDtSTC165QeQYHg7FDPg7F6mfvkoYdgCURCp4WkLyolNeOZ1h0Xs/Et6JMZz7X3kx79jrKL+7lOSz0S1AmU5LlxldWZi9v8SzuPlLSA1eJy1FPACQJXXztqNRvstP+EldUeMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g6AsSLfb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F07FA7CE;
	Mon, 22 Sep 2025 16:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758551890;
	bh=lIxyAy1YtTah3ISC45oFSsTo/0+R0VopM/MHUttHwMY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g6AsSLfbgoSQvI1eGAJKJ0HelXmSwO6jgJTg9PEGTQu2LOPq0pzNFRUMlAXt0fGXF
	 D8S5dprcHePgu4TeZvkhjtqVqsrE8GU5rAt9viOSBCP9BvT7D6Go9Tnyi46+YBsVWx
	 LBraoWCqYbRTtkBIGOcQ97yX4ThBQJ9kXTfihmCM=
Message-ID: <4b5e828c-8bbd-474c-a5d4-debc55f57d4f@ideasonboard.com>
Date: Mon, 22 Sep 2025 17:39:28 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/16] media: cadence: csi2rx: add multistream support
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev,
 laurent.pinchart@ideasonboard.com, mripard@kernel.org
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
 vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 sjoerd@collabora.com, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250911102832.1583440-1-r-donadkar@ti.com>
 <20250911102832.1583440-11-r-donadkar@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250911102832.1583440-11-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/09/2025 13:28, Rishikesh Donadkar wrote:
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
> The enable_streams() API in v4l2 supports passing a bitmask to enable
> each pad/stream combination individually on any media subdev. Use this
> API instead of  s_stream() API.
> 
> Implement the enable_stream and disable_stream hooks in place of the
> stream-unaware s_stream hook.
> 
> Implement a fallback s_stream hook that internally calls enable_stream
> on each source pad, for consumer drivers that don't use multi-stream

Here, the "consumer drivers" means the TI and StarFive drivers, right? I
think it should be easy to avoid the whole fallback mechanism. Just
change the TI and StarFive drivers to use
v4l2_subdev_enable/disable_streams() (with a single stream 0) first.

 Tomi

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
>  drivers/media/platform/cadence/cdns-csi2rx.c | 352 +++++++++++++++----
>  1 file changed, 275 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 3c99de56c095..11b73c79adff 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -141,6 +141,7 @@ struct csi2rx_priv {
>  	struct phy			*dphy;
>  
>  	u8				num_pixels[CSI2RX_STREAMS_MAX];
> +	u32				vc_select[CSI2RX_STREAMS_MAX];
>  	u8				lanes[CSI2RX_LANES_MAX];
>  	u8				num_lanes;
>  	u8				max_lanes;
> @@ -279,29 +280,43 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
>  
>  static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>  {
> -	struct media_pad *src_pad =
> -		&csi2rx->source_subdev->entity.pads[csi2rx->source_pad];
>  	union phy_configure_opts opts = { };
>  	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> -	struct v4l2_subdev_format sd_fmt = {
> -		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
> -		.pad	= CSI2RX_PAD_SINK,
> -	};
> +	struct v4l2_mbus_framefmt *framefmt;
> +	struct v4l2_subdev_state *state;
>  	const struct csi2rx_fmt *fmt;
> +	int source_pad = csi2rx->source_pad;
> +	struct media_pad *pad = &csi2rx->source_subdev->entity.pads[source_pad];
>  	s64 link_freq;
>  	int ret;
> +	u32 bpp;
>  
> -	ret = v4l2_subdev_call_state_active(&csi2rx->subdev, pad, get_fmt,
> -					    &sd_fmt);
> -	if (ret < 0)
> -		return ret;
> +	state = v4l2_subdev_get_locked_active_state(&csi2rx->subdev);
>  
> -	fmt = csi2rx_get_fmt_by_code(sd_fmt.format.code);
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
> +
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
> @@ -399,11 +414,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
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
> @@ -416,16 +427,10 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  
>  	reset_control_deassert(csi2rx->sys_rst);
>  
> -	ret = v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, true);
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
> @@ -474,9 +479,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  	reset_control_assert(csi2rx->p_rst);
>  	clk_disable_unprepare(csi2rx->p_clk);
>  
> -	if (v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, false))
> -		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
> -
>  	if (csi2rx->dphy) {
>  		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
>  
> @@ -500,37 +502,134 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
>  	return 0;
>  }
>  
> -static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
> +static void csi2rx_update_vc_select(struct csi2rx_priv *csi2rx,
> +				    struct v4l2_subdev_state *state)
>  {
> -	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> -	int ret = 0;
> -
> -	mutex_lock(&csi2rx->lock);
> -
> -	if (enable) {
> -		/*
> -		 * If we're not the first users, there's no need to
> -		 * enable the whole controller.
> -		 */
> -		if (!csi2rx->count) {
> -			ret = csi2rx_start(csi2rx);
> -			if (ret)
> -				goto out;
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
>  		}
> +	}
> +}
>  
> -		csi2rx->count++;
> -	} else {
> -		csi2rx->count--;
> +static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
> +{
> +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> +	u64 sink_streams;
> +	int ret;
> +
> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
> +						       CSI2RX_PAD_SINK,
> +						       &streams_mask);
> +
> +	guard(mutex)(&csi2rx->lock);
> +	/*
> +	 * If we're not the first users, there's no need to
> +	 * enable the whole controller.
> +	 */
> +	if (!csi2rx->count) {
> +		csi2rx_update_vc_select(csi2rx, state);
> +		ret = csi2rx_start(csi2rx);
> +		if (ret)
> +			return ret;
> +	}
>  
> -		/*
> -		 * Let the last user turn off the lights.
> -		 */
> +	/* Start streaming on the source */
> +	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev, csi2rx->source_pad,
> +					 sink_streams);
> +	if (ret) {
> +		dev_err(csi2rx->dev,
> +			"Failed to start streams %#llx on subdev\n",
> +			sink_streams);
>  		if (!csi2rx->count)
>  			csi2rx_stop(csi2rx);
> +		return ret;
> +	}
> +
> +	csi2rx->count++;
> +	return 0;
> +}
> +
> +static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
> +{
> +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> +	u64 sink_streams;
> +
> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
> +						       CSI2RX_PAD_SINK,
> +						       &streams_mask);
> +
> +	if (v4l2_subdev_disable_streams(csi2rx->source_subdev,
> +					csi2rx->source_pad, sink_streams)) {
> +		dev_err(csi2rx->dev, "Couldn't disable our subdev\n");
> +	}
> +
> +	guard(mutex)(&csi2rx->lock);
> +	csi2rx->count--;
> +
> +	/* Let the last user turn off the lights. */
> +	if (!csi2rx->count)
> +		csi2rx_stop(csi2rx);
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
>  	}
>  
> -out:
> -	mutex_unlock(&csi2rx->lock);
>  	return ret;
>  }
>  
> @@ -546,12 +645,56 @@ static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
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
> @@ -563,14 +706,16 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
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
> @@ -578,21 +723,22 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
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
> @@ -626,19 +772,70 @@ static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
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
>  static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
> @@ -876,7 +1073,8 @@ static int csi2rx_probe(struct platform_device *pdev)
>  	csi2rx->pads[CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>  	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++)
>  		csi2rx->pads[i].flags = MEDIA_PAD_FL_SOURCE;
> -	csi2rx->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	csi2rx->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
> +		V4L2_SUBDEV_FL_STREAMS;
>  	csi2rx->subdev.entity.ops = &csi2rx_media_ops;
>  
>  	ret = media_entity_pads_init(&csi2rx->subdev.entity, CSI2RX_PAD_MAX,


