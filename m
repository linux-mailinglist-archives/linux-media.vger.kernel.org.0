Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D71356A6A94
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 11:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjCAKK6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 05:10:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjCAKKj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 05:10:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D43B3B860
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 02:10:30 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36085890;
        Wed,  1 Mar 2023 11:10:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677665428;
        bh=h8Jfb9x2zWgr1o/299lediEsiULS2JhzffiCRzu5sIk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KmcnvocbnCO4UuojQBRHrFm2e+Vk16aG1xjmI2DhzVBtnGFtCU5wDPxgnNIErLLJj
         f/DbZxzKHaBR/07oWFQOsOJvpuOD2s9fl/jiSziaIJuDnnS9o/90IHd2ZgL/YhnqS3
         /Y+pk3wP+7Eigs3UbBGxV2PhApWwBA1MqmBY9xmM=
Message-ID: <df145b13-832e-2def-24f5-b74a7bee1ecd@ideasonboard.com>
Date:   Wed, 1 Mar 2023 12:10:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/4] media: ti: cal: Add multiplexed streams support
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>
References: <20230228171620.330978-1-tomi.valkeinen@ideasonboard.com>
 <20230228171620.330978-5-tomi.valkeinen@ideasonboard.com>
 <20230301095802.jpjdeviejv44tcyg@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230301095802.jpjdeviejv44tcyg@uno.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/03/2023 11:58, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Tue, Feb 28, 2023 at 07:16:20PM +0200, Tomi Valkeinen wrote:
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
>>   drivers/media/platform/ti/cal/cal-camerarx.c | 267 ++++++++++++++-----
>>   drivers/media/platform/ti/cal/cal-video.c    | 121 ++++++---
>>   drivers/media/platform/ti/cal/cal.c          |  43 ++-
>>   drivers/media/platform/ti/cal/cal.h          |   3 +-
>>   4 files changed, 330 insertions(+), 104 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
>> index 95e0ad59a39b..8e373c817cdf 100644
>> --- a/drivers/media/platform/ti/cal/cal-camerarx.c
>> +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
>> @@ -49,21 +49,38 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
>>   {
>>   	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
>>   	u32 num_lanes = mipi_csi2->num_data_lanes;
>> -	const struct cal_format_info *fmtinfo;
>>   	struct v4l2_subdev_state *state;
>> -	struct v4l2_mbus_framefmt *fmt;
>>   	u32 bpp;
>>   	s64 freq;
>>
>> +	/*
>> +	 * v4l2_get_link_freq() uses V4L2_CID_LINK_FREQ first, and falls back
>> +	 * to V4L2_CID_PIXEL_RATE if V4L2_CID_LINK_FREQ is not available.
>> +	 *
>> +	 * With multistream input there is no single pixel rate, and thus we
>> +	 * cannot use V4L2_CID_PIXEL_RATE, so we pass 0 as the bpp which
>> +	 * causes v4l2_get_link_freq() to return an error if it falls back to
>> +	 * V4L2_CID_PIXEL_RATE.
>> +	 */
>> +
>>   	state = v4l2_subdev_get_locked_active_state(&phy->subdev);
>>
>> -	fmt = v4l2_subdev_get_pad_format(&phy->subdev, state, CAL_CAMERARX_PAD_SINK);
>> +	if (state->routing.num_routes > 1) {
>> +		bpp = 0;
>> +	} else {
>> +		struct v4l2_subdev_route *route = &state->routing.routes[0];
>> +		const struct cal_format_info *fmtinfo;
>> +		struct v4l2_mbus_framefmt *fmt;
>>
>> -	fmtinfo = cal_format_by_code(fmt->code);
>> -	if (!fmtinfo)
>> -		return -EINVAL;
>> +		fmt = v4l2_subdev_state_get_stream_format(
>> +			state, route->sink_pad, route->sink_stream);
>>
>> -	bpp = fmtinfo->bpp;
>> +		fmtinfo = cal_format_by_code(fmt->code);
>> +		if (!fmtinfo)
>> +			return -EINVAL;
>> +
>> +		bpp = fmtinfo->bpp;
>> +	}
>>
>>   	freq = v4l2_get_link_freq(phy->source->ctrl_handler, bpp, 2 * num_lanes);
>>   	if (freq < 0) {
>> @@ -284,15 +301,32 @@ static void cal_camerarx_ppi_disable(struct cal_camerarx *phy)
>>   			0, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
>>   }
>>
>> -static int cal_camerarx_start(struct cal_camerarx *phy)
>> +static int cal_camerarx_start(struct cal_camerarx *phy, u32 sink_stream)
>>   {
>> +	struct media_pad *remote_pad;
>>   	s64 link_freq;
>>   	u32 sscounter;
>>   	u32 val;
>>   	int ret;
>>
>> +	remote_pad = media_pad_remote_pad_first(&phy->pads[CAL_CAMERARX_PAD_SINK]);
>> +
>> +	/*
>> +	 * We need to enable the PHY hardware when enabling the first stream,
>> +	 * but for the following streams we just propagate the enable_streams
>> +	 * to the source.
>> +	 */
>> +
>>   	if (phy->enable_count > 0) {
>> +		ret = v4l2_subdev_enable_streams(phy->source, remote_pad->index,
>> +						 BIT(sink_stream));
>> +		if (ret) {
>> +			phy_err(phy, "enable streams failed in source: %d\n", ret);
>> +			return ret;
>> +		}
>> +
>>   		phy->enable_count++;
>> +
>>   		return 0;
>>   	}
>>
>> @@ -394,7 +428,8 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
>>   	 * Start the source to enable the CSI-2 HS clock. We can now wait for
>>   	 * CSI-2 PHY reset to complete.
>>   	 */
>> -	ret = v4l2_subdev_call(phy->source, video, s_stream, 1);
>> +	ret = v4l2_subdev_enable_streams(phy->source, remote_pad->index,
>> +					 BIT(sink_stream));
>>   	if (ret) {
>>   		v4l2_subdev_call(phy->source, core, s_power, 0);
>>   		cal_camerarx_disable_irqs(phy);
>> @@ -425,12 +460,22 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
>>   	return 0;
>>   }
>>
>> -static void cal_camerarx_stop(struct cal_camerarx *phy)
>> +static void cal_camerarx_stop(struct cal_camerarx *phy, u32 sink_stream)
>>   {
>> +	struct media_pad *remote_pad;
>>   	int ret;
>>
>> -	if (--phy->enable_count > 0)
>> +	remote_pad = media_pad_remote_pad_first(&phy->pads[CAL_CAMERARX_PAD_SINK]);
>> +
>> +	if (--phy->enable_count > 0) {
>> +		ret = v4l2_subdev_disable_streams(phy->source,
>> +						  remote_pad->index,
>> +						  BIT(sink_stream));
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
>> +					  BIT(sink_stream));
>> +	if (ret)
>>   		phy_err(phy, "stream off failed in subdev\n");
>>
>>   	ret = v4l2_subdev_call(phy->source, core, s_power, 0);
>> @@ -599,30 +646,56 @@ static inline struct cal_camerarx *to_cal_camerarx(struct v4l2_subdev *sd)
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
>> +	u32 sink_stream;
>> +	int ret;
>>
>> -	state = v4l2_subdev_lock_and_get_active_state(sd);
>> +	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0,
>> +						    NULL, &sink_stream);
>> +	if (ret)
>> +		return ret;
>>
>> -	if (enable)
>> -		ret = cal_camerarx_start(phy);
>> -	else
>> -		cal_camerarx_stop(phy);
>> +	return cal_camerarx_start(phy, sink_stream);
>> +}
>>
>> -	v4l2_subdev_unlock_state(state);
>> +static int cal_camerarx_sd_disable_streams(struct v4l2_subdev *sd,
>> +					   struct v4l2_subdev_state *state,
>> +					   u32 pad, u64 streams_mask)
>> +{
>> +	struct cal_camerarx *phy = to_cal_camerarx(sd);
>> +	u32 sink_stream;
>> +	int ret;
>>
>> -	return ret;
>> +	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0,
>> +						    NULL, &sink_stream);
>> +	if (ret)
>> +		return ret;
>> +
>> +	cal_camerarx_stop(phy, sink_stream);
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
>> @@ -630,8 +703,12 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
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
>> @@ -656,8 +733,12 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
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
>> @@ -713,36 +794,78 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
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
>> +static int cal_camerarx_set_routing(struct v4l2_subdev *sd,
>> +				    struct v4l2_subdev_state *state,
>> +				    struct v4l2_subdev_krouting *routing)
>> +{
>> +	static const struct v4l2_mbus_framefmt format = {
>> +		.width = 640,
>> +		.height = 480,
>> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
>> +		.field = V4L2_FIELD_NONE,
>> +		.colorspace = V4L2_COLORSPACE_SRGB,
>> +		.ycbcr_enc = V4L2_YCBCR_ENC_601,
>> +		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
>> +		.xfer_func = V4L2_XFER_FUNC_SRGB,
>> +	};
>> +	int ret;
>> +
>> +	ret = v4l2_subdev_routing_validate(sd, routing,
>> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
>> +					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
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
>> +	return cal_camerarx_set_routing(sd, state, routing);
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
>> -			.code = MEDIA_BUS_FMT_UYVY8_1X16,
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
>> +	return cal_camerarx_set_routing(sd, state, &routing);
>>   }
>>
>>   static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>> @@ -751,54 +874,76 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>>   	struct cal_camerarx *phy = to_cal_camerarx(sd);
>>   	struct v4l2_mbus_frame_desc remote_desc;
>>   	const struct media_pad *remote_pad;
>> +	struct v4l2_subdev_state *state;
>> +	u32 sink_stream;
>> +	unsigned int i;
>>   	int ret;
>>
>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>> +
>> +	ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
>> +						    pad, 0,
>> +						    NULL, &sink_stream);
>> +	if (ret)
>> +		goto out_unlock;
>> +
>>   	remote_pad = media_pad_remote_pad_first(&phy->pads[CAL_CAMERARX_PAD_SINK]);
>> -	if (!remote_pad)
>> -		return -EPIPE;
>> +	if (!remote_pad) {
>> +		ret = -EPIPE;
>> +		goto out_unlock;
>> +	}
>>
>>   	ret = v4l2_subdev_call(phy->source, pad, get_frame_desc,
>>   			       remote_pad->index, &remote_desc);
>>   	if (ret)
>> -		return ret;
>> +		goto out_unlock;
>>
>>   	if (remote_desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
>>   		dev_err(phy->cal->dev,
>>   			"Frame descriptor does not describe CSI-2 link");
> 
> I'm all for using standard debug functions, but the rest of the driver
> uses cal_err etc. As long as this is intentional, I'm fine with it

Ah, right. I just automatically write dev_err/dev_dbg...

>> -		return -EINVAL;
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	}
>> +
>> +	for (i = 0; i < remote_desc.num_entries; i++) {
>> +		if (remote_desc.entry[i].stream == sink_stream)
>> +			break;
>>   	}
>>
>> -	if (remote_desc.num_entries > 1)
>> -		dev_dbg(phy->cal->dev,
>> -			"Multiple streams not supported in remote frame descriptor, using the first one\n");
>> +	if (i == remote_desc.num_entries) {
> 
> I would have kept an error message here, or do you think this cannot
> happen, or is it possible that a wrong implementation on the
> transmitter's get_frame_desc could trigger it ?

Hmm. Well, I think the only way this could happen if there's a 
driver/framework bug. The likely case would be that the source device 
provides streams, but its get_frame_desc doesn't actually describe the 
streams.

I can add a debug print.

  Tomi

