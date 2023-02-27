Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA20B6A3D6B
	for <lists+linux-media@lfdr.de>; Mon, 27 Feb 2023 09:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbjB0Itt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Feb 2023 03:49:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjB0ItU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Feb 2023 03:49:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D322330A
        for <linux-media@vger.kernel.org>; Mon, 27 Feb 2023 00:41:52 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F7C756A;
        Mon, 27 Feb 2023 09:35:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677486927;
        bh=Vdji9HuDbHtmm8yqicJzVT3vuTXBFE2Cw57fiyKEEn8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=WJz/rV/gMflTKXGMXJbm9jKG8YfdN4dHh4yJe8fEvF6RXz7y4bSBH6mUBUggFcInc
         2Y4eCM1cUFUiyG6TVZXhuhmQdy8ePWDT+VP8nWRjjsUxSJeclxwso/GpKgbO4gGcAD
         vNbQLzt3iqRIo9GU9pQ0Qdy3p1mxcIewKMTJXjFU=
Message-ID: <8bd2d620-c10f-a58f-aeb8-3fda56263efe@ideasonboard.com>
Date:   Mon, 27 Feb 2023 10:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 3/3] media: ti: cal: add multiplexed streams support
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        niklas soderlund <niklas.soderlund@ragnatech.se>
References: <20230222125630.421020-1-tomi.valkeinen@ideasonboard.com>
 <20230222125630.421020-4-tomi.valkeinen@ideasonboard.com>
 <20230224154855.kmiwg2h5b3vq272l@uno.localdomain>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230224154855.kmiwg2h5b3vq272l@uno.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 24/02/2023 17:48, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Wed, Feb 22, 2023 at 02:56:30PM +0200, Tomi Valkeinen wrote:
>> Add routing and stream_config support to CAL driver.
>>
>> Add multiplexed streams support. CAL has 8 dma-engines and can capture 8
>> separate streams at the same time.
>>
>> Add 8 video device nodes, each representing a single dma-engine, and set
>> the number of source pads on camerarx to 8. Each video node can be
>> connected to any of the source pads on either of the camerarx instances
>> using media links. Camerarx internal routing is used to route the
>> incoming CSI-2 streams to one of the 8 source pads.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti/cal/cal-camerarx.c | 233 ++++++++++++++-----
>>   drivers/media/platform/ti/cal/cal-video.c    | 146 +++++++++---
>>   drivers/media/platform/ti/cal/cal.c          |  65 ++++--
>>   drivers/media/platform/ti/cal/cal.h          |   4 +-
>>   4 files changed, 342 insertions(+), 106 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
>> index faafbd0e9240..49ae29065cd1 100644
>> --- a/drivers/media/platform/ti/cal/cal-camerarx.c
>> +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
>> @@ -49,21 +49,41 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
>>   {
>>   	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
>>   	u32 num_lanes = mipi_csi2->num_data_lanes;
>> -	const struct cal_format_info *fmtinfo;
>>   	struct v4l2_subdev_state *state;
>> -	struct v4l2_mbus_framefmt *fmt;
>>   	u32 bpp;
>>   	s64 freq;
>>
>> -	state = v4l2_subdev_get_locked_active_state(&phy->subdev);
>> +	/*
>> +	 * v4l2_get_link_freq() uses V4L2_CID_LINK_FREQ first, and falls back
>> +	 * to V4L2_CID_PIXEL_RATE if V4L2_CID_LINK_FREQ is not available.
>> +	 *
>> +	 * With multistream input there is no single pixel rate, and thus we
>> +	 * cannot use V4L2_CID_PIXEL_RATE, so we pass 0 as the bpp which
>> +	 * causes v4l2_get_link_freq() to return an error if it falls back to
>> +	 * V4L2_CID_PIXEL_RATE.
>> +	 */
> 
> To recap a bit of our offline discussion:
> - max9286 GMSL deserializer (as a comparison for a multiplexed
>    transmitter) use PIXEL_RATE to report the cumulative pixel rate of
>    enabled transmitters. This is because the R-Car CSI-2 receiver on
>    which use PIXEL_RATE to compute the link freq [1]
> 
> - according to [2]
>    pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample (on D-PHY)
> 
>    from which:
>    link_freq = pixel_rate * bits_per_sample / (2 * nr_of_lanes)
> 
>    This works as long the reported pixel rate includes visible and
>    blankings, something I'm not sure how many transmitters handle
>    correctly as PIXEL_RATE control is meant to report the visible pixel
>    sampling rate on the pixel array.
> 
> I guess we should go towards mandating LINK_FREQ for transmitters.
> 
> cc-Niklas for opinions on R-Car CSI-2 rcsi2_calc_mbps()
> 
> [1] https://elixir.bootlin.com/linux/v6.2/source/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c#L608
> [2] https://www.kernel.org/doc/html/latest/driver-api/media/tx-rx.html#csi-2-transmitter-drivers
> 
>>
>> -	fmt = v4l2_subdev_get_pad_format(&phy->subdev, state, CAL_CAMERARX_PAD_SINK);
>> +	state = v4l2_subdev_get_locked_active_state(&phy->subdev);
>>
>> -	fmtinfo = cal_format_by_code(fmt->code);
>> -	if (!fmtinfo)
>> +	if (state->routing.num_routes == 0)
>>   		return -EINVAL;
> 
> This function is in the call path of .enable_streams which if I'm not
> reading the code wrong is called with
> 
> int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
> {
> 
>          ...
> 
> 	for_each_active_route(&state->routing, route)
> 		source_mask |= BIT_ULL(route->source_stream);
> 
> 	if (enable)
> 		return v4l2_subdev_enable_streams(sd, pad_index, source_mask);
> 
>          ...
> }
> 
> int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
> 			       u64 streams_mask)
> {
> 	struct device *dev = sd->entity.graph_obj.mdev->dev;
> 	struct v4l2_subdev_state *state;
> 	u64 found_streams = 0;
> 	unsigned int i;
> 	int ret;
> 
> 	/* A few basic sanity checks first. */
> 	if (pad >= sd->entity.num_pads)
> 		return -EINVAL;
> 
> 	if (!streams_mask)
> 		return 0;
> 
>          ...
> }
> 
> So the question is: can we get to enable_streams without enabled
> routes (sorry I should have tested before asking it but I don't have a
> multiplexed setup easily accessible) ?

No, I don't think we can. Why do you ask?

>>
>> -	bpp = fmtinfo->bpp;
>> +	if (state->routing.num_routes > 1) {
>> +		bpp = 0;
>> +	} else {
>> +		const struct cal_format_info *fmtinfo;
>> +		struct v4l2_subdev_route *route = &state->routing.routes[0];
> 
> Nit: if I'm not mistaken along the driver reverse-xmas-tree (I
> know...) is respected. Can you do it here as well ?

Sure.

>> +		struct v4l2_mbus_framefmt *fmt;
>> +
>> +		fmt = v4l2_subdev_state_get_stream_format(
>> +			state, route->sink_pad, route->sink_stream);
>> +
>> +		fmtinfo = cal_format_by_code(fmt->code);
>> +		if (!fmtinfo)
>> +			return -EINVAL;
>> +
>> +		bpp = fmtinfo->bpp;
>> +	}
>>
>>   	freq = v4l2_get_link_freq(phy->source->ctrl_handler, bpp, 2 * num_lanes);
>>   	if (freq < 0) {
>> @@ -284,15 +304,28 @@ static void cal_camerarx_ppi_disable(struct cal_camerarx *phy)
>>   			0, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
>>   }
>>
>> -static int cal_camerarx_start(struct cal_camerarx *phy)
>> +static int cal_camerarx_start(struct cal_camerarx *phy, u32 pad, u32 stream)
>>   {
>> +	struct media_pad *remote_pad;
>>   	s64 link_freq;
>>   	u32 sscounter;
>>   	u32 val;
>>   	int ret;
>>
>> +	remote_pad = media_pad_remote_pad_first(&phy->pads[pad]);
>> +
> 
> Would it hurt a comment here to explain that in case it's the first to
> be enabled you need to start the RX and power up the transmitter,
> otherwise it's enough to enable the additional stream ?

I'll add a comment.

>>   	if (phy->enable_count > 0) {
>>   		phy->enable_count++;
>> +
>> +		ret = v4l2_subdev_enable_streams(phy->source, remote_pad->index,
>> +						 BIT(stream));
>> +		if (ret) {
>> +			phy->enable_count--;
> 
> You can avoid this by enable_count++ after the error check ?

Yep.

>> +
>> +			phy_err(phy, "enable streams failed in source: %d\n", ret);
>> +			return ret;
>> +		}
>> +
>>   		return 0;
>>   	}
>>
>> @@ -394,7 +427,9 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
>>   	 * Start the source to enable the CSI-2 HS clock. We can now wait for
>>   	 * CSI-2 PHY reset to complete.
>>   	 */
>> -	ret = v4l2_subdev_call(phy->source, video, s_stream, 1);
>> +
> 
> Intentional additional blank line ?

No.

>> +	ret = v4l2_subdev_enable_streams(phy->source, remote_pad->index,
>> +					 BIT(stream));
>>   	if (ret) {
>>   		v4l2_subdev_call(phy->source, core, s_power, 0);
>>   		cal_camerarx_disable_irqs(phy);
>> @@ -425,12 +460,22 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
>>   	return 0;
>>   }
>>
>> -static void cal_camerarx_stop(struct cal_camerarx *phy)
>> +static void cal_camerarx_stop(struct cal_camerarx *phy, u32 pad, u32 stream)
>>   {
>> +	struct media_pad *remote_pad;
>>   	int ret;
>>
>> -	if (--phy->enable_count > 0)
>> +	remote_pad = media_pad_remote_pad_first(&phy->pads[pad]);
>> +
>> +	if (--phy->enable_count > 0) {
>> +		ret = v4l2_subdev_disable_streams(phy->source,
>> +						  remote_pad->index,
>> +						  BIT(stream));
>> +		if (ret)
>> +			phy_err(phy, "stream off failed in subdev\n");
>> +
>>   		return;
>> +	}
>>
>>   	cal_camerarx_ppi_disable(phy);
>>
>> @@ -450,7 +495,9 @@ static void cal_camerarx_stop(struct cal_camerarx *phy)
>>   	/* Disable the phy */
>>   	cal_camerarx_disable(phy);
>>
>> -	if (v4l2_subdev_call(phy->source, video, s_stream, 0))
>> +	ret = v4l2_subdev_disable_streams(phy->source, remote_pad->index,
>> +					  BIT(stream));
>> +	if (ret)
>>   		phy_err(phy, "stream off failed in subdev\n");
>>
>>   	ret = v4l2_subdev_call(phy->source, core, s_power, 0);
>> @@ -626,30 +673,62 @@ static inline struct cal_camerarx *to_cal_camerarx(struct v4l2_subdev *sd)
>>   	return container_of(sd, struct cal_camerarx, subdev);
>>   }
>>
>> -static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
>> +struct cal_camerarx *
>> +cal_camerarx_get_phy_from_entity(struct media_entity *entity)
>> +{
>> +	struct v4l2_subdev *sd;
>> +
>> +	sd = media_entity_to_v4l2_subdev(entity);
>> +	if (!sd)
>> +		return NULL;
>> +
>> +	return to_cal_camerarx(sd);
>> +}
>> +
>> +static int cal_camerarx_sd_enable_streams(struct v4l2_subdev *sd,
>> +					  struct v4l2_subdev_state *state,
>> +					  u32 pad, u64 streams_mask)
>>   {
>>   	struct cal_camerarx *phy = to_cal_camerarx(sd);
>> -	struct v4l2_subdev_state *state;
>> -	int ret = 0;
>> +	u32 other_pad, other_stream;
>> +	int ret;
>>
>> -	state = v4l2_subdev_lock_and_get_active_state(sd);
>> +	if (WARN_ON(streams_mask != 1))
> 
> as streams_mask is unsigned and you can't get here if streams_mask ==
> 0, I wonder if checking for > 1 isn't more explicit. A detail though.

Well, we need streams_mask to be exactly 1. I think the current test 
says that. If we'd check for > 1, the reader's thoughts might be that 0 
and 1 are ok, which is not the case.

Then again, I think the whole check can be dropped. We're calling it 
from inside the CAL driver, always with 1, so there's little chance it 
could be != 1.

>> +		return -EINVAL;
>>
>> -	if (enable)
>> -		ret = cal_camerarx_start(phy);
>> -	else
>> -		cal_camerarx_stop(phy);
>> +	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0,
>> +						    &other_pad, &other_stream);
>> +	if (ret)
>> +		return ret;
>>
>> -	v4l2_subdev_unlock_state(state);
>> +	return cal_camerarx_start(phy, other_pad, other_stream);
>> +}
>>
>> -	return ret;
>> +static int cal_camerarx_sd_disable_streams(struct v4l2_subdev *sd,
>> +					   struct v4l2_subdev_state *state,
>> +					   u32 pad, u64 streams_mask)
>> +{
>> +	struct cal_camerarx *phy = to_cal_camerarx(sd);
>> +	u32 other_pad, other_stream;
>> +	int ret;
>> +
>> +	if (WARN_ON(streams_mask != 1))
>> +		return -EINVAL;
>> +
>> +	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0,
>> +						    &other_pad, &other_stream);
>> +	if (ret)
>> +		return ret;
>> +
>> +	cal_camerarx_stop(phy, other_pad, other_stream);
>> +
>> +	return 0;
>>   }
>>
>>   static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
>>   					  struct v4l2_subdev_state *state,
>>   					  struct v4l2_subdev_mbus_code_enum *code)
>>   {
>> -	struct cal_camerarx *phy = to_cal_camerarx(sd);
>> -
>>   	/* No transcoding, source and sink codes must match. */
>>   	if (cal_rx_pad_is_source(code->pad)) {
>>   		struct v4l2_mbus_framefmt *fmt;
>> @@ -657,8 +736,12 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
>>   		if (code->index > 0)
>>   			return -EINVAL;
>>
>> -		fmt = v4l2_subdev_get_pad_format(&phy->subdev, state,
>> -						 CAL_CAMERARX_PAD_SINK);
>> +		fmt = v4l2_subdev_state_get_opposite_stream_format(state,
>> +								   code->pad,
>> +								   code->stream);
>> +		if (!fmt)
>> +			return -EINVAL;
>> +
>>   		code->code = fmt->code;
>>   	} else {
>>   		if (code->index >= cal_num_formats)
>> @@ -683,8 +766,12 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
>>   	if (cal_rx_pad_is_source(fse->pad)) {
>>   		struct v4l2_mbus_framefmt *fmt;
>>
>> -		fmt = v4l2_subdev_get_pad_format(sd, state,
>> -						 CAL_CAMERARX_PAD_SINK);
>> +		fmt = v4l2_subdev_state_get_opposite_stream_format(state,
>> +								   fse->pad,
>> +								   fse->stream);
>> +		if (!fmt)
>> +			return -EINVAL;
>> +
>>   		if (fse->code != fmt->code)
>>   			return -EINVAL;
>>
>> @@ -740,57 +827,96 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
>>
>>   	/* Store the format and propagate it to the source pad. */
>>
>> -	fmt = v4l2_subdev_get_pad_format(sd, state, CAL_CAMERARX_PAD_SINK);
>> +	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
>> +						  format->stream);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>>   	*fmt = format->format;
>>
>> -	fmt = v4l2_subdev_get_pad_format(sd, state,
>> -					 CAL_CAMERARX_PAD_FIRST_SOURCE);
>> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
>> +							   format->stream);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>>   	*fmt = format->format;
>>
>>   	return 0;
>>   }
>>
>> +static int _cal_camerarx_sd_set_routing(struct v4l2_subdev *sd,
>> +					struct v4l2_subdev_state *state,
>> +					struct v4l2_subdev_krouting *routing)
> 
> Functions starting with _ are a bit unusual :)

Hmm, well... I don't have any ideas for a good name =). 
cal_camerarx_sd_set_routing_impl() ?

>> +{
>> +	static const struct v4l2_mbus_framefmt format = {
>> +		.width = 640,
>> +		.height = 480,
>> +		.code = MEDIA_BUS_FMT_UYVY8_2X8,
>> +		.field = V4L2_FIELD_NONE,
>> +		.colorspace = V4L2_COLORSPACE_SRGB,
>> +		.ycbcr_enc = V4L2_YCBCR_ENC_601,
>> +		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
>> +		.xfer_func = V4L2_XFER_FUNC_SRGB,
>> +	};
>> +	int ret;
>> +
>> +	ret = v4l2_subdev_routing_validate(sd, routing, V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int cal_camerarx_sd_set_routing(struct v4l2_subdev *sd,
>> +				       struct v4l2_subdev_state *state,
>> +				       enum v4l2_subdev_format_whence which,
>> +				       struct v4l2_subdev_krouting *routing)
>> +{
>> +	return _cal_camerarx_sd_set_routing(sd, state, routing);
>> +}
>> +
>>   static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
>>   				    struct v4l2_subdev_state *state)
>>   {
>> -	struct v4l2_subdev_format format = {
>> -		.which = state ? V4L2_SUBDEV_FORMAT_TRY
>> -		: V4L2_SUBDEV_FORMAT_ACTIVE,
>> -		.pad = CAL_CAMERARX_PAD_SINK,
>> -		.format = {
>> -			.width = 640,
>> -			.height = 480,
>> -			.code = MEDIA_BUS_FMT_UYVY8_2X8,
>> -			.field = V4L2_FIELD_NONE,
>> -			.colorspace = V4L2_COLORSPACE_SRGB,
>> -			.ycbcr_enc = V4L2_YCBCR_ENC_601,
>> -			.quantization = V4L2_QUANTIZATION_LIM_RANGE,
>> -			.xfer_func = V4L2_XFER_FUNC_SRGB,
>> -		},
>> +	struct v4l2_subdev_route routes[] = { {
>> +		.sink_pad = 0,
>> +		.sink_stream = 0,
>> +		.source_pad = 1,
>> +		.source_stream = 0,
>> +		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
>> +	} };
>> +
>> +	struct v4l2_subdev_krouting routing = {
>> +		.num_routes = 1,
>> +		.routes = routes,
>>   	};
>>
>> -	return cal_camerarx_sd_set_fmt(sd, state, &format);
>> +	/* Initialize routing to single route to the fist source pad */
>> +	return _cal_camerarx_sd_set_routing(sd, state, &routing);
>>   }
>>
>> -static const struct v4l2_subdev_video_ops cal_camerarx_video_ops = {
>> -	.s_stream = cal_camerarx_sd_s_stream,
>> -};
>> -
>>   static const struct v4l2_subdev_pad_ops cal_camerarx_pad_ops = {
>> +	.enable_streams = cal_camerarx_sd_enable_streams,
>> +	.disable_streams = cal_camerarx_sd_disable_streams,
>>   	.init_cfg = cal_camerarx_sd_init_cfg,
>>   	.enum_mbus_code = cal_camerarx_sd_enum_mbus_code,
>>   	.enum_frame_size = cal_camerarx_sd_enum_frame_size,
>>   	.get_fmt = v4l2_subdev_get_fmt,
>>   	.set_fmt = cal_camerarx_sd_set_fmt,
>> +	.set_routing = cal_camerarx_sd_set_routing,
>>   };
>>
>>   static const struct v4l2_subdev_ops cal_camerarx_subdev_ops = {
>> -	.video = &cal_camerarx_video_ops,
>>   	.pad = &cal_camerarx_pad_ops,
>>   };
>>
>>   static struct media_entity_operations cal_camerarx_media_ops = {
>>   	.link_validate = v4l2_subdev_link_validate,
>> +	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
>>   };
>>
>>   /* ------------------------------------------------------------------
>> @@ -842,11 +968,12 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>>   	sd = &phy->subdev;
>>   	v4l2_subdev_init(sd, &cal_camerarx_subdev_ops);
>>   	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>> -	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>>   	snprintf(sd->name, sizeof(sd->name), "CAMERARX%u", instance);
>>   	sd->dev = cal->dev;
>>
>>   	phy->pads[CAL_CAMERARX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>> +
> 
> Intentional ?
> 
>>   	for (i = CAL_CAMERARX_PAD_FIRST_SOURCE; i < CAL_CAMERARX_NUM_PADS; ++i)
>>   		phy->pads[i].flags = MEDIA_PAD_FL_SOURCE;
>>   	sd->entity.ops = &cal_camerarx_media_ops;
>> @@ -879,7 +1006,9 @@ void cal_camerarx_destroy(struct cal_camerarx *phy)
>>   		return;
>>
>>   	v4l2_device_unregister_subdev(&phy->subdev);
>> +
>>   	v4l2_subdev_cleanup(&phy->subdev);
>> +
> 
> ditto

I can drop these.

>>   	media_entity_cleanup(&phy->subdev.entity);
>>   	of_node_put(phy->source_ep_node);
>>   	of_node_put(phy->source_node);
>> diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
>> index d363e123d4bb..71578bfc97ba 100644
>> --- a/drivers/media/platform/ti/cal/cal-video.c
>> +++ b/drivers/media/platform/ti/cal/cal-video.c
>> @@ -119,12 +119,13 @@ static int __subdev_get_format(struct cal_ctx *ctx,
>>   {
>>   	struct v4l2_subdev_format sd_fmt;
>>   	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
>> +	struct v4l2_subdev *sd = ctx->phy->source;
>>   	int ret;
>>
>>   	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>   	sd_fmt.pad = 0;
>>
>> -	ret = v4l2_subdev_call(ctx->phy->source, pad, get_fmt, NULL, &sd_fmt);
>> +	ret = v4l2_subdev_call_state_active(sd, pad, get_fmt, &sd_fmt);
>>   	if (ret)
>>   		return ret;
>>
>> @@ -141,13 +142,14 @@ static int __subdev_set_format(struct cal_ctx *ctx,
>>   {
>>   	struct v4l2_subdev_format sd_fmt;
>>   	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
>> +	struct v4l2_subdev *sd = ctx->phy->source;
>>   	int ret;
>>
>>   	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>   	sd_fmt.pad = 0;
>>   	*mbus_fmt = *fmt;
>>
>> -	ret = v4l2_subdev_call(ctx->phy->source, pad, set_fmt, NULL, &sd_fmt);
>> +	ret = v4l2_subdev_call_state_active(sd, pad, set_fmt, &sd_fmt);
>>   	if (ret)
>>   		return ret;
>>
>> @@ -189,6 +191,7 @@ static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
>>   				      struct v4l2_format *f)
>>   {
>>   	struct cal_ctx *ctx = video_drvdata(file);
>> +	struct v4l2_subdev *sd = ctx->phy->source;
>>   	const struct cal_format_info *fmtinfo;
>>   	struct v4l2_subdev_frame_size_enum fse;
>>   	int found;
>> @@ -213,8 +216,8 @@ static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
>>   	for (fse.index = 0; ; fse.index++) {
>>   		int ret;
>>
>> -		ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_size,
>> -				       NULL, &fse);
>> +		ret = v4l2_subdev_call_state_active(sd, pad, enum_frame_size,
>> +						    &fse);
>>   		if (ret)
>>   			break;
>>
>> @@ -250,6 +253,7 @@ static int cal_legacy_s_fmt_vid_cap(struct file *file, void *priv,
>>   				    struct v4l2_format *f)
>>   {
>>   	struct cal_ctx *ctx = video_drvdata(file);
>> +	struct v4l2_subdev *sd = &ctx->phy->subdev;
>>   	struct vb2_queue *q = &ctx->vb_vidq;
>>   	struct v4l2_subdev_format sd_fmt = {
>>   		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>> @@ -289,7 +293,7 @@ static int cal_legacy_s_fmt_vid_cap(struct file *file, void *priv,
>>   	ctx->v_fmt.fmt.pix.field = sd_fmt.format.field;
>>   	cal_calc_format_size(ctx, fmtinfo, &ctx->v_fmt);
>>
>> -	v4l2_subdev_call(&ctx->phy->subdev, pad, set_fmt, NULL, &sd_fmt);
>> +	v4l2_subdev_call_state_active(sd, pad, set_fmt, &sd_fmt);
>>
>>   	ctx->fmtinfo = fmtinfo;
>>   	*f = ctx->v_fmt;
>> @@ -301,6 +305,7 @@ static int cal_legacy_enum_framesizes(struct file *file, void *fh,
>>   				      struct v4l2_frmsizeenum *fsize)
>>   {
>>   	struct cal_ctx *ctx = video_drvdata(file);
>> +	struct v4l2_subdev *sd = ctx->phy->source;
>>   	const struct cal_format_info *fmtinfo;
>>   	struct v4l2_subdev_frame_size_enum fse;
>>   	int ret;
>> @@ -318,8 +323,7 @@ static int cal_legacy_enum_framesizes(struct file *file, void *fh,
>>   	fse.code = fmtinfo->code;
>>   	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>
>> -	ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_size, NULL,
>> -			       &fse);
>> +	ret = v4l2_subdev_call_state_active(sd, pad, enum_frame_size, &fse);
>>   	if (ret)
>>   		return ret;
>>
>> @@ -361,6 +365,7 @@ static int cal_legacy_enum_frameintervals(struct file *file, void *priv,
>>   					  struct v4l2_frmivalenum *fival)
>>   {
>>   	struct cal_ctx *ctx = video_drvdata(file);
>> +	struct v4l2_subdev *sd = ctx->phy->source;
>>   	const struct cal_format_info *fmtinfo;
>>   	struct v4l2_subdev_frame_interval_enum fie = {
>>   		.index = fival->index,
>> @@ -375,8 +380,8 @@ static int cal_legacy_enum_frameintervals(struct file *file, void *priv,
>>   		return -EINVAL;
>>
>>   	fie.code = fmtinfo->code;
>> -	ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_interval,
>> -			       NULL, &fie);
>> +
>> +	ret = v4l2_subdev_call_state_active(sd, pad, enum_frame_interval, &fie);
>>   	if (ret)
>>   		return ret;
>>   	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
>> @@ -694,8 +699,8 @@ static int cal_video_check_format(struct cal_ctx *ctx)
>>   {
>>   	const struct cal_format_info *rx_fmtinfo;
>>   	const struct v4l2_mbus_framefmt *format;
>> -	struct v4l2_subdev_state *state;
>>   	struct media_pad *remote_pad;
>> +	struct v4l2_subdev_state *state;
>>   	int ret = 0;
>>
>>   	remote_pad = media_pad_remote_pad_first(&ctx->pad);
>> @@ -704,7 +709,8 @@ static int cal_video_check_format(struct cal_ctx *ctx)
>>
>>   	state = v4l2_subdev_lock_and_get_active_state(&ctx->phy->subdev);
>>
>> -	format = v4l2_subdev_get_pad_format(&ctx->phy->subdev, state, remote_pad->index);
>> +	format = v4l2_subdev_state_get_stream_format(state, remote_pad->index,
>> +						     0);
>>   	if (!format) {
>>   		ret = -EINVAL;
>>   		goto out;
>> @@ -733,10 +739,52 @@ static int cal_video_check_format(struct cal_ctx *ctx)
>>   static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   {
>>   	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
>> +	struct media_pad *remote_pad;
>>   	struct cal_buffer *buf;
>>   	dma_addr_t addr;
>>   	int ret;
>>
>> +	remote_pad = media_pad_remote_pad_first(&ctx->pad);
>> +	if (!remote_pad) {
>> +		ctx_err(ctx, "Context not connected\n");
>> +		ret = -ENODEV;
>> +		goto error_release_buffers;
>> +	}
>> +
>> +	if (cal_mc_api) {
>> +		struct v4l2_subdev_route *route = NULL;
>> +		struct v4l2_subdev_route *r;
>> +		struct v4l2_subdev_state *state;
>> +
>> +		/* Find the PHY connected to this video device */
>> +
>> +		ctx->phy = cal_camerarx_get_phy_from_entity(remote_pad->entity);
>> +
>> +		state = v4l2_subdev_lock_and_get_active_state(&ctx->phy->subdev);
>> +
>> +		/* Find the stream */
>> +
>> +		for_each_active_route(&state->routing, r) {
>> +			if (r->source_pad != remote_pad->index)
>> +				continue;
>> +
>> +			route = r;
>> +
>> +			break;
>> +		}
>> +
>> +		if (!route) {
>> +			v4l2_subdev_unlock_state(state);
>> +			ctx_err(ctx, "Failed to find route\n");
>> +			ret = -ENODEV;
>> +			goto error_release_buffers;
>> +		}
> 
> If I got it right: we inspect the PHY routing table, pick the route that ends in
> the pad connected to the this video device and store the sink-stream
> id. The sink-stream id is used for... digging into the frame_desc
> handling I have a slightly unrelated question if the PHY shouldn't
> implement .get_frame_desc() instead of filtering what is returned from
> the deser's implementation of .get_frame_desc() which is called by
> cal_camerarx_get_remote_frame_desc(). If I'm not mitaken in that case
> you could just call the PHY's .get_frame_desc() instead of inspecting its
> routing table here. Does it make sense..

Indeed, this looks a bit odd. This patch has evolved along the stream 
series, so it has gone though almost total rewrites a few times. And 
there seem to be some odd designs like this.

I think adding .get_frame_desc() to the camerarx makes sense.

>> +
>> +		ctx->stream = route->sink_stream;
>> +
>> +		v4l2_subdev_unlock_state(state);
>> +	}
>> +
>>   	ret = video_device_pipeline_alloc_start(&ctx->vdev);
>>   	if (ret < 0) {
>>   		ctx_err(ctx, "Failed to start media pipeline: %d\n", ret);
>> @@ -775,7 +823,8 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   	cal_ctx_set_dma_addr(ctx, addr);
>>   	cal_ctx_start(ctx);
>>
>> -	ret = v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 1);
>> +	ret = v4l2_subdev_enable_streams(&ctx->phy->subdev, remote_pad->index,
>> +					 BIT(0));
>>   	if (ret)
>>   		goto error_stop;
>>
>> @@ -800,10 +849,14 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   static void cal_stop_streaming(struct vb2_queue *vq)
>>   {
>>   	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
>> +	struct media_pad *remote_pad;
>>
>>   	cal_ctx_stop(ctx);
>>
>> -	v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 0);
>> +	remote_pad = media_pad_remote_pad_first(&ctx->pad);
>> +
>> +	v4l2_subdev_disable_streams(&ctx->phy->subdev, remote_pad->index,
>> +				    BIT(0));
>>
>>   	pm_runtime_put_sync(ctx->cal->dev);
>>
>> @@ -812,6 +865,9 @@ static void cal_stop_streaming(struct vb2_queue *vq)
>>   	cal_release_buffers(ctx, VB2_BUF_STATE_ERROR);
>>
>>   	video_device_pipeline_stop(&ctx->vdev);
>> +
>> +	if (cal_mc_api)
>> +		ctx->phy = NULL;
>>   }
>>
>>   static const struct vb2_ops cal_video_qops = {
>> @@ -845,6 +901,7 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
>>   	const struct cal_format_info *fmtinfo;
>>   	unsigned int i, j, k;
>>   	int ret = 0;
>> +	struct v4l2_subdev *sd = ctx->phy->source;
> 
> Move it up ? :P

Sure.

> The rest (for my undestanding) seems right. By dropping the !mc
> support things would look much simpler :)

Yes, I'd love to drop !mc =).

Thanks!

  Tomi

