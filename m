Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B24325FECFE
	for <lists+linux-media@lfdr.de>; Fri, 14 Oct 2022 13:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbiJNLLP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Oct 2022 07:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbiJNLK4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Oct 2022 07:10:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 579231C4920
        for <linux-media@vger.kernel.org>; Fri, 14 Oct 2022 04:10:42 -0700 (PDT)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DC076DE;
        Fri, 14 Oct 2022 13:10:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665745839;
        bh=EKcKtDR72ZkB6RGdEjmXqqHuTFjlq53U0UJ7So5mB1w=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=RZKi32oHOaz2HanqkRR7cZZYROvJksIJ4B9RQVZYQy7K+MtanwXi1N+IZF1NQ7qVk
         X0MLBE7qJJ9yrNdmASa+zte6fZ7rj+8mrf1M/RANenOYqk3qXjVRuTucC9LU2mozte
         5A3EuawNbWE8jKn+zFhqxqCCkDfMKU5lQvPCSD04=
Message-ID: <7007e416-e9ee-008a-bd63-3a01b8a02af3@ideasonboard.com>
Date:   Fri, 14 Oct 2022 14:10:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v15 11/19] media: subdev: use streams in
 v4l2_subdev_link_validate()
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
 <20221003121852.616745-12-tomi.valkeinen@ideasonboard.com>
 <Y0k//ATM3oDFdn+a@paasikivi.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y0k//ATM3oDFdn+a@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/10/2022 13:54, Sakari Ailus wrote:
> Moi,
> 
> On Mon, Oct 03, 2022 at 03:18:44PM +0300, Tomi Valkeinen wrote:
>> Update v4l2_subdev_link_validate() to use routing and streams for
>> validation.
>>
>> Instead of just looking at the format on the pad on both ends of the
>> link, the routing tables are used to collect all the streams going from
>> the source to the sink over the link, and the streams' formats on both
>> ends of the link are verified.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 182 +++++++++++++++++++++++---
>>   1 file changed, 162 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index be778e619694..1cea6ec750c0 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -1014,7 +1014,7 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate_default);
>>   
>>   static int
>> -v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>> +v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
>>   				     struct v4l2_subdev_format *fmt)
>>   {
>>   	if (is_media_entity_v4l2_subdev(pad->entity)) {
>> @@ -1023,7 +1023,11 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>>   
>>   		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>   		fmt->pad = pad->index;
>> -		return v4l2_subdev_call_state_active(sd, pad, get_fmt, fmt);
>> +		fmt->stream = stream;
>> +
>> +		return v4l2_subdev_call(sd, pad, get_fmt,
>> +					v4l2_subdev_get_locked_active_state(sd),
>> +					fmt);
>>   	}
>>   
>>   	WARN(pad->entity->function != MEDIA_ENT_F_IO_V4L,
>> @@ -1033,31 +1037,169 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>>   	return -EINVAL;
>>   }
>>   
>> +#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>> +
>> +static void __v4l2_link_validate_get_streams(struct media_pad *pad,
>> +					     u64 *streams_mask)
>> +{
>> +	struct v4l2_subdev_route *route;
>> +	struct v4l2_subdev_state *state;
>> +	struct v4l2_subdev *subdev;
>> +
>> +	subdev = media_entity_to_v4l2_subdev(pad->entity);
>> +
>> +	*streams_mask = 0;
>> +
>> +	state = v4l2_subdev_get_locked_active_state(subdev);
>> +	if (WARN_ON(!state))
>> +		return;
>> +
>> +	for_each_active_route(&state->routing, route) {
>> +		u32 route_pad;
>> +		u32 route_stream;
>> +
>> +		if (pad->flags & MEDIA_PAD_FL_SOURCE) {
>> +			route_pad = route->source_pad;
>> +			route_stream = route->source_stream;
>> +		} else {
>> +			route_pad = route->sink_pad;
>> +			route_stream = route->sink_stream;
>> +		}
>> +
>> +		if (route_pad != pad->index)
>> +			continue;
>> +
>> +		*streams_mask |= BIT_ULL(route_stream);
>> +	}
>> +}
>> +
>> +#endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>> +
>> +static void v4l2_link_validate_get_streams(struct media_pad *pad,
>> +					   u64 *streams_mask)
>> +{
>> +	struct v4l2_subdev *subdev = media_entity_to_v4l2_subdev(pad->entity);
>> +
>> +	if (!(subdev->flags & V4L2_SUBDEV_FL_STREAMS)) {
>> +		/* Non-streams subdevs have an implicit stream 0 */
>> +		*streams_mask = BIT_ULL(0);
>> +		return;
>> +	}
>> +
>> +#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>> +	__v4l2_link_validate_get_streams(pad, streams_mask);
>> +#else
>> +	/* This shouldn't happen */
>> +	*streams_mask = 0;
>> +#endif
>> +}
>> +
>> +static int v4l2_subdev_link_validate_locked(struct media_link *link)
>> +{
>> +	struct v4l2_subdev *sink_subdev =
>> +		media_entity_to_v4l2_subdev(link->sink->entity);
>> +	struct device *dev = sink_subdev->entity.graph_obj.mdev->dev;
>> +	u64 source_streams_mask;
>> +	u64 sink_streams_mask;
>> +	u64 dangling_sink_streams;
>> +	u32 stream;
>> +	int ret;
>> +
>> +	dev_dbg(dev, "validating link \"%s\":%u -> \"%s\":%u\n",
>> +		link->source->entity->name, link->source->index,
>> +		link->sink->entity->name, link->sink->index);
>> +
>> +	v4l2_link_validate_get_streams(link->source, &source_streams_mask);
>> +	v4l2_link_validate_get_streams(link->sink, &sink_streams_mask);
>> +
>> +	/*
>> +	 * It is ok to have more source streams than sink streams as extra
>> +	 * source streams can just be ignored by the receiver, but having extra
>> +	 * sink streams is an error as streams must have a source.
>> +	 */
>> +	dangling_sink_streams = (source_streams_mask ^ sink_streams_mask) &
>> +				sink_streams_mask;
>> +	if (dangling_sink_streams) {
>> +		dev_err(dev, "Dangling sink streams: mask %#llx\n",
>> +			dangling_sink_streams);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Validate source and sink stream formats */
>> +
>> +	for_each_set_bit(stream, (void *)&sink_streams_mask, 64) {
> 
> Does this work as expected? The second argument is expected to be unsigned
> long (or an array of two of them) whereas you have a u64.

Where do you see that? I thought find_next_bit (used by 
for_each_set_bit) is given a start address and arbitrarily large 
bit-size number.

  Tomi

