Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BADF3DEAC4
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 12:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235292AbhHCKWJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 06:22:09 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45546 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234977AbhHCKWI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 06:22:08 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 173ALtDt093867;
        Tue, 3 Aug 2021 05:21:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1627986115;
        bh=0rFPPIm8s/K8Tqe4kBoT8WA+c6sVPE/4uaUaFpES20k=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=DOJil9JAGfsK2SjMsBSB2z9GsTwYfmAgQF4LEzGmkjY8GU0ol8y2Vbz1So8wo9qX+
         Sv01BFROiUWMp9NS7ssjZFjvfyZwX6w3mwfx2SZPLwdwmeiRt0JFaejVsnqviBXbEn
         DDvfpWLxYiMleNpMCHvHYdKbNIasHYU18Dqac+do=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 173ALt1e053175
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Aug 2021 05:21:55 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 3 Aug
 2021 05:21:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 3 Aug 2021 05:21:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 173ALr14128886;
        Tue, 3 Aug 2021 05:21:54 -0500
Date:   Tue, 3 Aug 2021 15:51:53 +0530
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v3 38/38] media: ti-vpe: cal: add multiplexed streams
 support
Message-ID: <20210803102153.zwdydnrhyhclstb4@ti.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-39-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210524110909.672432-39-tomi.valkeinen@ideasonboard.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thanks for your work on this. I have used your patches to add 
multiplexed stream support on J721E. A few thoughts below that came to 
my mind when implementing it.

On 24/05/21 02:09PM, Tomi Valkeinen wrote:
> Add routing and stream_config support to CAL driver.
> 
> Add multiplexed streams support. CAL has 8 dma-engines and can capture 8
> separate streams at the same time.
> 
> Add 8 video device nodes, each representing a single dma-engine, and set
> the number of source pads on camerarx to 8. Each video node can be
> connected to any of the source pads on either of the camerarx instances
> using media links. Camerarx internal routing is used to route the
> incoming CSI-2 streams to one of the 8 source pads.
> 
> CAL doesn't support transcoding, so the driver currently allows changes
> only on the camerarx sink side, and then copies the sink pad config to
> the source pad. This becomes slighly more complex with 8 source pads and
> multiple streams on the sink pad. A helper,
> cal_camerarx_get_opposite_stream_format(), is added, which uses the
> routing table to get the format from the "opposite" side.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 303 ++++++++++++++++---
>  drivers/media/platform/ti-vpe/cal-video.c    | 103 ++++++-
>  drivers/media/platform/ti-vpe/cal.c          |  34 ++-
>  drivers/media/platform/ti-vpe/cal.h          |  12 +-
>  4 files changed, 385 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> index cb6a37f47432..d09b06780b15 100644
> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> @@ -49,15 +49,33 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
>  {
>  	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
>  	u32 num_lanes = mipi_csi2->num_data_lanes;
> -	const struct cal_format_info *fmtinfo;
>  	u32 bpp;
>  	s64 freq;
>  
> -	fmtinfo = cal_format_by_code(phy->formats[CAL_CAMERARX_PAD_SINK].code);
> -	if (!fmtinfo)
> +	/*
> +	 * With multistream input we don't have bpp, and cannot use
> +	 * V4L2_CID_PIXEL_RATE. Passing 0 as bpp causes v4l2_get_link_freq()
> +	 * to return an error if it falls back to V4L2_CID_PIXEL_RATE.
> +	 */
> +
> +	if (phy->stream_configs.num_configs == 0)
>  		return -EINVAL;
>  
> -	bpp = fmtinfo->bpp;
> +	if (phy->stream_configs.num_configs > 2) {
> +		bpp = 0;
> +	} else {
> +		const struct cal_format_info *fmtinfo;
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		/* The first format is for the sink */
> +		fmt = &phy->stream_configs.configs[0].fmt;
> +
> +		fmtinfo = cal_format_by_code(fmt->code);
> +		if (!fmtinfo)
> +			return -EINVAL;
> +
> +		bpp = fmtinfo->bpp;
> +	}
>  
>  	freq = v4l2_get_link_freq(phy->source->ctrl_handler, bpp, 2 * num_lanes);
>  	if (freq < 0) {
> @@ -619,19 +637,104 @@ static inline struct cal_camerarx *to_cal_camerarx(struct v4l2_subdev *sd)
>  	return container_of(sd, struct cal_camerarx, subdev);
>  }
>  
> -static struct v4l2_mbus_framefmt *
> -cal_camerarx_get_pad_format(struct cal_camerarx *phy,
> -			    struct v4l2_subdev_state *sd_state,
> -			    unsigned int pad, u32 which)
> -{
> -	switch (which) {
> -	case V4L2_SUBDEV_FORMAT_TRY:
> -		return v4l2_subdev_get_try_format(&phy->subdev, sd_state, pad);
> -	case V4L2_SUBDEV_FORMAT_ACTIVE:
> -		return &phy->formats[pad];
> -	default:
> +struct cal_camerarx *
> +cal_camerarx_get_phy_from_entity(struct media_entity *entity)
> +{
> +	struct v4l2_subdev *sd;
> +
> +	sd = media_entity_to_v4l2_subdev(entity);
> +	if (!sd)
>  		return NULL;
> +
> +	return to_cal_camerarx(sd);
> +}
> +
> +static struct v4l2_subdev_krouting *
> +cal_camerarx_get_routing_table(struct cal_camerarx *phy,
> +			       struct v4l2_subdev_state *sd_state, u32 which)
> +{
> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
> +		return &phy->routing;
> +	else
> +		return &sd_state->routing;
> +}
> +
> +static struct v4l2_subdev_stream_configs *
> +cal_camerarx_get_stream_configs(struct cal_camerarx *phy,
> +				struct v4l2_subdev_state *sd_state, u32 which)
> +{
> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
> +		return &phy->stream_configs;
> +	else
> +		return &sd_state->stream_configs;
> +}
> +
> +struct v4l2_mbus_framefmt *
> +cal_camerarx_get_stream_format(struct cal_camerarx *phy,
> +			       struct v4l2_subdev_state *sd_state,
> +			       unsigned int pad, u32 stream, u32 which)
> +{
> +	struct v4l2_subdev_stream_configs *stream_configs;
> +	unsigned int i;
> +
> +	stream_configs = cal_camerarx_get_stream_configs(phy, sd_state, which);
> +
> +	for (i = 0; i < stream_configs->num_configs; ++i) {
> +		if (stream_configs->configs[i].pad == pad &&
> +		    stream_configs->configs[i].stream == stream)
> +			return &stream_configs->configs[i].fmt;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int cal_camerarx_find_opposite_end(struct v4l2_subdev_krouting *routing,
> +					  u32 pad, u32 stream, u32 *other_pad,
> +					  u32 *other_stream)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < routing->num_routes; ++i) {
> +		struct v4l2_subdev_route *route = &routing->routes[i];
> +
> +		if (cal_rx_pad_is_source(pad)) {
> +			if (route->source_pad == pad &&
> +			    route->source_stream == stream) {
> +				*other_pad = route->sink_pad;
> +				*other_stream = route->sink_stream;
> +				return 0;
> +			}
> +		} else {
> +			if (route->sink_pad == pad &&
> +			    route->sink_stream == stream) {
> +				*other_pad = route->source_pad;
> +				*other_stream = route->source_stream;
> +				return 0;
> +			}
> +		}
>  	}
> +
> +	return -EINVAL;
> +}
> +
> +static struct v4l2_mbus_framefmt *
> +cal_camerarx_get_opposite_stream_format(struct cal_camerarx *phy,
> +					struct v4l2_subdev_state *sd_state,
> +					u32 pad, u32 stream, u32 which)
> +{
> +	struct v4l2_subdev_krouting *routing;
> +	u32 other_pad, other_stream;
> +	int ret;
> +
> +	routing = cal_camerarx_get_routing_table(phy, sd_state, which);
> +
> +	ret = cal_camerarx_find_opposite_end(routing, pad, stream, &other_pad,
> +					     &other_stream);
> +	if (ret)
> +		return NULL;
> +
> +	return cal_camerarx_get_stream_format(phy, sd_state, other_pad,
> +					      other_stream, which);
>  }

Would it make sense to move these functions to v4l2 core to reduce 
boilerplate in drivers? Are they generic enough?

>  
>  static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
> @@ -669,9 +772,15 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
>  			goto out;
>  		}
>  
> -		fmt = cal_camerarx_get_pad_format(phy, sd_state,
> -						  CAL_CAMERARX_PAD_SINK,
> -						  code->which);
> +		fmt = cal_camerarx_get_opposite_stream_format(phy, sd_state,
> +					code->pad, code->stream,
> +					code->which);
> +
> +		if (!fmt) {
> +			r = -EINVAL;
> +			goto out;
> +		}
> +
>  		code->code = fmt->code;
>  	} else {
>  		if (code->index >= cal_num_formats) {
> @@ -705,9 +814,14 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
>  	if (cal_rx_pad_is_source(fse->pad)) {
>  		struct v4l2_mbus_framefmt *fmt;
>  
> -		fmt = cal_camerarx_get_pad_format(phy, sd_state,
> -						  CAL_CAMERARX_PAD_SINK,
> -						  fse->which);
> +		fmt = cal_camerarx_get_opposite_stream_format(
> +			phy, sd_state, fse->pad, fse->stream, fse->which);
> +
> +		if (!fmt) {
> +			r = -EINVAL;
> +			goto out;
> +		}
> +
>  		if (fse->code != fmt->code) {
>  			r = -EINVAL;
>  			goto out;
> @@ -747,8 +861,14 @@ static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
>  
>  	mutex_lock(&phy->mutex);
>  
> -	fmt = cal_camerarx_get_pad_format(phy, sd_state, format->pad,
> -					  format->which);
> +	fmt = cal_camerarx_get_stream_format(phy, sd_state, format->pad,
> +					     format->stream, format->which);
> +
> +	if (!fmt) {
> +		mutex_unlock(&phy->mutex);
> +		return -EINVAL;
> +	}
> +
>  	format->format = *fmt;
>  
>  	mutex_unlock(&phy->mutex);
> @@ -764,6 +884,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
>  	const struct cal_format_info *fmtinfo;
>  	struct v4l2_mbus_framefmt *fmt;
>  	unsigned int bpp;
> +	int ret = 0;
>  
>  	/* No transcoding, source and sink formats must match. */

If the bridge can't transcode, does it need {get,set}_fmt ops at all? 
What does it do with this information?

For example, on the cdns-csi2rx bridge driver used on J721E, I did not 
implement these ops at all. You can simply program the hardware to let 
everything through. The only time the bridge needs to know the format is 
when it needs to convert pixel rate to link frequency, but that can be 
done by asking the source.

>  	if (cal_rx_pad_is_source(format->pad))
> @@ -792,40 +913,117 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
>  	/* Store the format and propagate it to the source pad. */
>  	mutex_lock(&phy->mutex);
>  
> -	fmt = cal_camerarx_get_pad_format(phy, sd_state,
> -					  CAL_CAMERARX_PAD_SINK,
> -					  format->which);
> +	fmt = cal_camerarx_get_stream_format(phy, sd_state, format->pad,
> +					     format->stream, format->which);
> +	if (!fmt) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
>  	*fmt = format->format;
>  
> -	fmt = cal_camerarx_get_pad_format(phy, sd_state, CAL_CAMERARX_PAD_FIRST_SOURCE,
> -					  format->which);
> +	fmt = cal_camerarx_get_opposite_stream_format(phy, sd_state, format->pad,
> +						      format->stream,
> +						      format->which);
> +	if (!fmt) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
>  	*fmt = format->format;
>  
> +out:
>  	mutex_unlock(&phy->mutex);
>  
> +	return ret;
> +}
> +
> +static int cal_camerarx_sd_get_routing(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_state *sd_state,
> +				       struct v4l2_subdev_krouting *routing)
> +{
> +	struct cal_camerarx *phy = to_cal_camerarx(sd);
> +	struct v4l2_subdev_krouting *src;
> +
> +	src = cal_camerarx_get_routing_table(phy, sd_state, routing->which);
> +
> +	return v4l2_subdev_cpy_routing(routing, src);
> +}
> +
> +static void cal_camerarx_init_formats(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_state *sd_state,
> +				      u32 which)
> +{
> +	struct cal_camerarx *phy = to_cal_camerarx(sd);
> +
> +	static const struct v4l2_mbus_framefmt format = {
> +		.width = 640,
> +		.height = 480,
> +		.code = MEDIA_BUS_FMT_UYVY8_2X8,
> +		.field = V4L2_FIELD_NONE,
> +		.colorspace = V4L2_COLORSPACE_SRGB,
> +		.ycbcr_enc = V4L2_YCBCR_ENC_601,
> +		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
> +		.xfer_func = V4L2_XFER_FUNC_SRGB,
> +	};
> +
> +	struct v4l2_subdev_stream_configs *stream_configs;
> +	unsigned int i;
> +
> +	stream_configs = cal_camerarx_get_stream_configs(phy, sd_state, which);
> +
> +	for (i = 0; i < stream_configs->num_configs; ++i)
> +		stream_configs->configs[i].fmt = format;
> +}
> +
> +static int cal_camerarx_sd_set_routing(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_state *sd_state,
> +				       struct v4l2_subdev_krouting *routing)
> +{
> +	struct cal_camerarx *phy = to_cal_camerarx(sd);
> +	int ret;
> +	struct v4l2_subdev_krouting *dst;
> +	struct v4l2_subdev_stream_configs *stream_configs;
> +
> +	dst = cal_camerarx_get_routing_table(phy, sd_state, routing->which);
> +	stream_configs =
> +		cal_camerarx_get_stream_configs(phy, sd_state, routing->which);
> +
> +	ret = v4l2_subdev_dup_routing(dst, routing);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_init_stream_configs(stream_configs, dst);
> +	if (ret)
> +		return ret;
> +
> +	/* Initialize stream formats */
> +	cal_camerarx_init_formats(sd, sd_state, routing->which);

What if an application calls this when one or more of the contexts are 
streaming? I don't see you prevent that. Can it lead to any 
undefined/unexpected behaviour?

> +
>  	return 0;
>  }
>  
>  static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
>  				    struct v4l2_subdev_state *sd_state)
>  {
> -	struct v4l2_subdev_format format = {
> -		.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
> -		: V4L2_SUBDEV_FORMAT_ACTIVE,
> -		.pad = CAL_CAMERARX_PAD_SINK,
> -		.format = {
> -			.width = 640,
> -			.height = 480,
> -			.code = MEDIA_BUS_FMT_UYVY8_2X8,
> -			.field = V4L2_FIELD_NONE,
> -			.colorspace = V4L2_COLORSPACE_SRGB,
> -			.ycbcr_enc = V4L2_YCBCR_ENC_601,
> -			.quantization = V4L2_QUANTIZATION_LIM_RANGE,
> -			.xfer_func = V4L2_XFER_FUNC_SRGB,
> -		},
> +	u32 which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> +
> +	struct v4l2_subdev_route routes[] = { {
> +		.sink_pad = 0,
> +		.sink_stream = 0,
> +		.source_pad = 1,
> +		.source_stream = 0,
> +		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +	} };
> +
> +	struct v4l2_subdev_krouting routing = {
> +		.which = which,
> +		.num_routes = 1,
> +		.routes = routes,
>  	};
>  
> -	return cal_camerarx_sd_set_fmt(sd, sd_state, &format);
> +	/* Initialize routing to single route to the fist source pad */
> +	return cal_camerarx_sd_set_routing(sd, sd_state, &routing);
>  }
>  
>  static const struct v4l2_subdev_video_ops cal_camerarx_video_ops = {
> @@ -838,6 +1036,8 @@ static const struct v4l2_subdev_pad_ops cal_camerarx_pad_ops = {
>  	.enum_frame_size = cal_camerarx_sd_enum_frame_size,
>  	.get_fmt = cal_camerarx_sd_get_fmt,
>  	.set_fmt = cal_camerarx_sd_set_fmt,
> +	.get_routing = cal_camerarx_sd_get_routing,
> +	.set_routing = cal_camerarx_sd_set_routing,
>  };
>  
>  static const struct v4l2_subdev_ops cal_camerarx_subdev_ops = {
> @@ -845,8 +1045,18 @@ static const struct v4l2_subdev_ops cal_camerarx_subdev_ops = {
>  	.pad = &cal_camerarx_pad_ops,
>  };
>  
> +static bool cal_camerarx_has_route(struct media_entity *entity, unsigned int pad0,
> +			  unsigned int pad1)
> +{
> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> +	struct cal_camerarx *phy = to_cal_camerarx(sd);
> +
> +	return v4l2_subdev_has_route(&phy->routing, pad0, pad1);
> +}
> +
>  static struct media_entity_operations cal_camerarx_media_ops = {
>  	.link_validate = v4l2_subdev_link_validate,
> +	.has_route = cal_camerarx_has_route,
>  };
>  
>  /* ------------------------------------------------------------------
> @@ -898,11 +1108,12 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	sd = &phy->subdev;
>  	v4l2_subdev_init(sd, &cal_camerarx_subdev_ops);
>  	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> -	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_MULTIPLEXED;
>  	snprintf(sd->name, sizeof(sd->name), "CAMERARX%u", instance);
>  	sd->dev = cal->dev;
>  
>  	phy->pads[CAL_CAMERARX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> +
>  	for (i = CAL_CAMERARX_PAD_FIRST_SOURCE; i < CAL_CAMERARX_NUM_PADS; ++i)
>  		phy->pads[i].flags = MEDIA_PAD_FL_SOURCE;
>  	sd->entity.ops = &cal_camerarx_media_ops;
> @@ -922,6 +1133,8 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	return phy;
>  
>  error:
> +	v4l2_subdev_free_routing(&phy->routing);
> +	v4l2_uninit_stream_configs(&phy->stream_configs);
>  	media_entity_cleanup(&phy->subdev.entity);
>  	kfree(phy);
>  	return ERR_PTR(ret);
> @@ -933,6 +1146,8 @@ void cal_camerarx_destroy(struct cal_camerarx *phy)
>  		return;
>  
>  	v4l2_device_unregister_subdev(&phy->subdev);
> +	v4l2_subdev_free_routing(&phy->routing);
> +	v4l2_uninit_stream_configs(&phy->stream_configs);
>  	media_entity_cleanup(&phy->subdev.entity);
>  	of_node_put(phy->source_ep_node);
>  	of_node_put(phy->source_node);
> diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
> index 8ecae7dc2774..234af40a24fa 100644
> --- a/drivers/media/platform/ti-vpe/cal-video.c
> +++ b/drivers/media/platform/ti-vpe/cal-video.c
> @@ -693,7 +693,11 @@ static int cal_video_check_format(struct cal_ctx *ctx)
>  	if (!remote_pad)
>  		return -ENODEV;
>  
> -	format = &ctx->phy->formats[remote_pad->index];
> +	format = cal_camerarx_get_stream_format(ctx->phy, NULL,
> +						remote_pad->index, 0,
> +						V4L2_SUBDEV_FORMAT_ACTIVE);
> +	if (!format)
> +		return -EINVAL;
>  
>  	if (ctx->fmtinfo->code != format->code ||
>  	    ctx->v_fmt.fmt.pix.height != format->height ||
> @@ -711,6 +715,48 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	dma_addr_t addr;
>  	int ret;
>  
> +	if (cal_mc_api) {
> +		struct v4l2_subdev_route *route = NULL;
> +		struct media_pad *remote_pad;
> +		unsigned int i;
> +
> +		/* Find the PHY connected to this video device */
> +
> +		remote_pad = media_entity_remote_pad(&ctx->pad);
> +		if (!remote_pad) {
> +			ctx_err(ctx, "Context not connected\n");
> +			ret = -ENODEV;
> +			goto error_release_buffers;
> +		}
> +
> +		ctx->phy = cal_camerarx_get_phy_from_entity(remote_pad->entity);
> +
> +		/* Find the stream */
> +
> +		for (i = 0; i < ctx->phy->routing.num_routes; ++i) {
> +			struct v4l2_subdev_route *r =
> +				&ctx->phy->routing.routes[i];
> +
> +			if (!(r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> +				continue;
> +
> +			if (r->source_pad != remote_pad->index)
> +				continue;
> +
> +			route = r;
> +
> +			break;
> +		}
> +
> +		if (!route) {
> +			ctx_err(ctx, "Failed to find route\n");
> +			ret = -ENODEV;
> +			goto error_release_buffers;
> +		}

Is it possible to generalize this boilerplate so every driver does not 
have to repeat it? Do you think it is generic enough?

> +
> +		ctx->stream = route->sink_stream;
> +	}
> +

Applications lose a bit of control over the cameras here. Say you only 
want to use 1 camera and don't care about the rest right now. With the 
current implementation, you propagate the s_stream(1) call to the 
FPD-Link/GMSL/whatever serializer subdev as soon any of the contexts 
start streaming, and don't send s_stream(0) until all contexts stop 
streaming.

We have an all or nothing policy here. Either all cameras are streaming, 
or none are. Would it make sense to add a way to control individual 
cameras? How much more complexity would it add?

On J721E, when you start all cameras but capture only one, the buffer 
for pixel data overflows very quickly and all streams are affected. The 
ability to select the exact cameras to stream could be useful, though I 
am not sure how often anyone would want to do that in a real use case.

>  	ret = media_pipeline_start(ctx->vdev.entity.pads, &ctx->phy->pipe);
>  	if (ret < 0) {
>  		ctx_err(ctx, "Failed to start media pipeline: %d\n", ret);
> @@ -784,6 +830,9 @@ static void cal_stop_streaming(struct vb2_queue *vq)
>  	cal_release_buffers(ctx, VB2_BUF_STATE_ERROR);
>  
>  	media_pipeline_stop(ctx->vdev.entity.pads);
> +
> +	if (cal_mc_api)
> +		ctx->phy = NULL;
>  }
>  
>  static const struct vb2_ops cal_video_qops = {
[...]

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
