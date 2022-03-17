Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0D54DC17B
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 09:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbiCQIlG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 04:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbiCQIlC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 04:41:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF44E1BE116
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 01:39:45 -0700 (PDT)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AACB493;
        Thu, 17 Mar 2022 09:39:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647506384;
        bh=L9gGgPwusZwQspfFenIk/sbLo9VAkzfX7Jkw6wq/rLI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Vp/D3uu6G+tsQSyDfX2kZyjllLg7+28TBhPE7Wr2IJW5T2mWonkNUBw5/OjpMQLiL
         hMbk1I99kH57I1KDa9lb7btLrsKdFmre266+/kYMUDxJPt1qUBrpL9udUGUcJ8lQsz
         wGb+WzEDOEI/8FKAuT9IIdkGhbJm8FyFq2jRN3SY=
Message-ID: <46af64d9-275a-c32e-757d-d47817729ff0@ideasonboard.com>
Date:   Thu, 17 Mar 2022 10:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 27/36] media: subdev: use streams in
 v4l2_subdev_link_validate()
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-28-tomi.valkeinen@ideasonboard.com>
 <20220316104715.k6f2lurckxispxog@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220316104715.k6f2lurckxispxog@uno.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/03/2022 12:47, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Tue, Mar 01, 2022 at 06:11:47PM +0200, Tomi Valkeinen wrote:
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
>>   drivers/media/v4l2-core/v4l2-subdev.c | 245 ++++++++++++++++++++++++--
>>   1 file changed, 227 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 339d7b15e26c..091b854e00d0 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/videodev2.h>
>>   #include <linux/export.h>
>>   #include <linux/version.h>
>> +#include <linux/sort.h>
> 
> Not sorted, but it was already like this
>>
>>   #include <media/v4l2-ctrls.h>
>>   #include <media/v4l2-device.h>
>> @@ -1035,6 +1036,7 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate_default);
>>
>>   static int
>>   v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>> +				     u32 stream,
> 
> fits on the previous line
> 
>>   				     struct v4l2_subdev_format *fmt)
>>   {
>>   	if (is_media_entity_v4l2_subdev(pad->entity)) {
>> @@ -1046,6 +1048,7 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>>
>>   		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>   		fmt->pad = pad->index;
>> +		fmt->stream = stream;
>>   		return v4l2_subdev_call(sd, pad, get_fmt, state, fmt);
>>   	}
>>
>> @@ -1056,31 +1059,237 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>>   	return -EINVAL;
>>   }
>>
>> -int v4l2_subdev_link_validate(struct media_link *link)
>> +static int cmp_u32(const void *a, const void *b)
>>   {
>> -	struct v4l2_subdev *sink;
>> -	struct v4l2_subdev_format sink_fmt, source_fmt;
>> -	int rval;
>> +	u32 a32 = *(u32 *)a;
>> +	u32 b32 = *(u32 *)b;
>>
>> -	rval = v4l2_subdev_link_validate_get_format(
>> -		link->source, &source_fmt);
>> -	if (rval < 0)
>> -		return 0;
>> +	return a32 > b32 ? 1 : (a32 < b32 ? -1 : 0);
>> +}
>> +
>> +static int v4l2_link_validate_get_streams(struct media_link *link,
>> +					  bool is_source, u32 *out_num_streams,
>> +					  const u32 **out_streams,
>> +					  bool *allocated)
>> +{
>> +	static const u32 default_streams[] = { 0 };
>> +	struct v4l2_subdev_krouting *routing;
>> +	struct v4l2_subdev *subdev;
>> +	u32 num_streams;
>> +	u32 *streams;
>> +	unsigned int i;
>> +	struct v4l2_subdev_state *state;
>> +
>> +	if (is_source)
>> +		subdev = media_entity_to_v4l2_subdev(link->source->entity);
>> +	else
>> +		subdev = media_entity_to_v4l2_subdev(link->sink->entity);
>>
>> -	rval = v4l2_subdev_link_validate_get_format(
>> -		link->sink, &sink_fmt);
>> -	if (rval < 0)
>> +	if (!(subdev->flags & V4L2_SUBDEV_FL_MULTIPLEXED)) {
>> +		*out_num_streams = 1;
>> +		*out_streams = default_streams;
>> +		*allocated = false;
>>   		return 0;
>> +	}
>>
>> -	sink = media_entity_to_v4l2_subdev(link->sink->entity);
>> +	state = v4l2_subdev_get_locked_active_state(subdev);
>>
>> -	rval = v4l2_subdev_call(sink, pad, link_validate, link,
>> -				&source_fmt, &sink_fmt);
>> -	if (rval != -ENOIOCTLCMD)
>> -		return rval;
>> +	routing = &state->routing;
>> +
>> +	streams = kmalloc_array(routing->num_routes, sizeof(u32), GFP_KERNEL);
>> +	if (!streams)
>> +		return -ENOMEM;
>> +
>> +	num_streams = 0;
>> +
>> +	for (i = 0; i < routing->num_routes; ++i) {
>> +		struct v4l2_subdev_route *route = &routing->routes[i];
>> +		int j;
>> +		u32 route_pad;
>> +		u32 route_stream;
>> +		u32 link_pad;
>> +
>> +		if (is_source) {
>> +			route_pad = route->source_pad;
>> +			route_stream = route->source_stream;
>> +			link_pad = link->source->index;
>> +		} else {
>> +			route_pad = route->sink_pad;
>> +			route_stream = route->sink_stream;
>> +			link_pad = link->sink->index;
>> +		}
>> +
>> +		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
>> +			continue;
> 
> Should this check be done before the previous if/else block ?

Yes, and I think this can use for_each_active_route.

>> +
>> +		if (route_pad != link_pad)
>> +			continue;
>> +
>> +		/* look for duplicates... */
>> +		for (j = 0; j < num_streams; ++j) {
>> +			if (streams[j] == route_stream)
>> +				break;
>> +		}
>> +
>> +		/* ...and drop the stream if we already have it */
>> +		if (j != num_streams)
>> +			continue;
> 
> Is this an error ? can the same stream be routed to multiple ones on a
> media link ?

There must have been a reason for me to add this code, but... Indeed, we 
shouldn't have duplicates. I'll change this to an error.

>> +
>> +		streams[num_streams++] = route_stream;
>> +	}
>> +
>> +	sort(streams, num_streams, sizeof(u32), &cmp_u32, NULL);
>>
>> -	return v4l2_subdev_link_validate_default(
>> -		sink, link, &source_fmt, &sink_fmt);
>> +	*out_num_streams = num_streams;
>> +	*out_streams = streams;
>> +	*allocated = true;
>> +
>> +	return 0;
>> +}
>> +
>> +static int v4l2_subdev_link_validate_locked(struct media_link *link)
>> +{
>> +	struct v4l2_subdev *sink_subdev =
>> +		media_entity_to_v4l2_subdev(link->sink->entity);
>> +	struct device *dev = sink_subdev->entity.graph_obj.mdev->dev;
>> +	u32 num_source_streams;
>> +	const u32 *source_streams;
>> +	bool source_allocated;
>> +	u32 num_sink_streams;
>> +	const u32 *sink_streams;
>> +	bool sink_allocated;
>> +	unsigned int sink_idx;
>> +	unsigned int source_idx;
>> +	int ret;
>> +
>> +	dev_dbg(dev, "validating link \"%s\":%u -> \"%s\":%u\n",
>> +		link->source->entity->name, link->source->index,
>> +		link->sink->entity->name, link->sink->index);
>> +
>> +	ret = v4l2_link_validate_get_streams(link, true, &num_source_streams,
>> +					     &source_streams,
>> +					     &source_allocated);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = v4l2_link_validate_get_streams(link, false, &num_sink_streams,
>> +					     &sink_streams, &sink_allocated);
>> +	if (ret)
>> +		goto free_source;
>> +
>> +	/*
>> +	 * It is ok to have more source streams than sink streams as extra
>> +	 * source streams can just be ignored (i.e. they go nowhere), but extra
> 
> Nit on the "(i.e. they go nowhere)" bit:
> 
> If it's ok to have more source streams than sinks, the extra sources
> will not be connected. So I would drop or change the above phrase as
> to me it sounds like sink streams go somewhere, while source stream
> are rather not connected (or not active).

Ok, I'll clarify.

>> +	 * sink streams is an error.
>> +	 */
>> +	if (num_source_streams < num_sink_streams) {
>> +		dev_err(dev,
>> +			"Not enough source streams: %d < %d\n",
>> +			num_source_streams, num_sink_streams);
>> +		ret = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	/* Validate source and sink stream formats */
>> +
>> +	source_idx = 0;
>> +
>> +	for (sink_idx = 0; sink_idx < num_sink_streams; ++sink_idx) {
>> +		struct v4l2_subdev_format sink_fmt, source_fmt;
>> +		u32 stream;
>> +
>> +		stream = sink_streams[sink_idx];
>> +
>> +		for (; source_idx < num_source_streams; ++source_idx) {
>> +			if (source_streams[source_idx] == stream)
>> +				break;
>> +		}
>> +
>> +		if (source_idx == num_source_streams) {
>> +			dev_err(dev, "No source stream for sink stream %u\n",
>> +				stream);
>> +			ret = -EINVAL;
>> +			goto out;
>> +		}
>> +
>> +		dev_dbg(dev, "validating stream \"%s\":%u:%u -> \"%s\":%u:%u\n",
>> +			link->source->entity->name, link->source->index, stream,
>> +			link->sink->entity->name, link->sink->index, stream);
>> +
>> +		ret = v4l2_subdev_link_validate_get_format(link->source, stream,
>> +							   &source_fmt);
>> +		if (ret < 0) {
>> +			dev_dbg(dev, "Failed to get format for \"%s\":%u:%u (but that's ok)\n",
> 
> For my education: why is it ok not to have a format for the stream ?

I don't know, but afaics that's how it has always been. In upstream 
v4l2_subdev_link_validate() returns 0 if 
v4l2_subdev_link_validate_get_format() fails.

> Don't we risk to pass a non-initialized source/sink_fmt to
> link_validate() in that case ?

We don't call link_validate, we accept the stream right away.

>> +				link->source->entity->name, link->source->index,
>> +				stream);
>> +			ret = 0;
>> +			continue;
>> +		}
>> +
>> +		ret = v4l2_subdev_link_validate_get_format(link->sink, stream,
>> +							   &sink_fmt);
>> +		if (ret < 0) {
>> +			dev_dbg(dev, "Failed to get format for \"%s\":%u:%u (but that's ok)\n",
>> +				link->sink->entity->name, link->sink->index,
>> +				stream);
>> +			ret = 0;
>> +			continue;
>> +		}
>> +
>> +		/* TODO: add stream number to link_validate() */
>> +		ret = v4l2_subdev_call(sink_subdev, pad, link_validate, link,
>> +				       &source_fmt, &sink_fmt);
>> +		if (!ret)
>> +			continue;
>> +
>> +		if (ret != -ENOIOCTLCMD)
>> +			goto out;
>> +
>> +		ret = v4l2_subdev_link_validate_default(sink_subdev, link,
>> +							&source_fmt, &sink_fmt);
>> +
>> +		if (ret)
>> +			goto out;
>> +	}
>> +
>> +out:
> 
> I would call it free_sinks:

Ok.

  Tomi
