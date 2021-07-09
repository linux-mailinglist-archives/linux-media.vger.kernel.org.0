Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3CF23C2207
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 12:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbhGIKEw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 06:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbhGIKEw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 06:04:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF13C0613DD
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 03:02:09 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79D75E7;
        Fri,  9 Jul 2021 12:02:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1625824927;
        bh=wersdUzSrsLvAZG1Y9/8MyRHG01igX00+srSUSMitfU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=sCzPWSEiv/XfhPASJOK77MF+rt1LHns9bSTqJVrg6Dv7afSnL00ZTLiCx2bFC5b6Y
         s0H7ohEbHd/rly5jLKvkf12luTNMNz2UXkFq9aTkqVTWwudH2xfD8jnZI9R7RdJhTB
         NDeK5txY3ZQgTaS8SL/+7GcfefHG9FukE5TMs+7A=
Subject: Re: [PATCH v7 24/27] v4l: subdev: use streams in
 v4l2_subdev_link_validate()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <20210524104408.599645-25-tomi.valkeinen@ideasonboard.com>
 <cda0def4-6977-268a-ab7d-5fe2aa4f7fd0@ideasonboard.com>
 <YLwP/EASZaWdslGJ@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <46cc606f-0ecf-218e-f68f-62a1c9bd4f19@ideasonboard.com>
Date:   Fri, 9 Jul 2021 13:02:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YLwP/EASZaWdslGJ@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 06/06/2021 02:59, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, May 28, 2021 at 02:34:55PM +0300, Tomi Valkeinen wrote:
>> On 24/05/2021 13:44, Tomi Valkeinen wrote:
>>> Update v4l2_subdev_link_validate() to use routing and streams for
>>> validation.
>>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> ---
>>>    drivers/media/v4l2-core/v4l2-subdev.c | 184 +++++++++++++++++++++++---
>>>    1 file changed, 166 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>>> index da6ea9b14631..b30b456d8d99 100644
>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>> @@ -16,6 +16,7 @@
>>>    #include <linux/videodev2.h>
>>>    #include <linux/export.h>
>>>    #include <linux/version.h>
>>> +#include <linux/sort.h>
>>>    
>>>    #include <media/v4l2-ctrls.h>
>>>    #include <media/v4l2-device.h>
>>> @@ -894,6 +895,7 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate_default);
>>>    
>>>    static int
>>>    v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>>> +				     u32 stream,
>>>    				     struct v4l2_subdev_format *fmt)
>>>    {
>>>    	if (is_media_entity_v4l2_subdev(pad->entity)) {
>>> @@ -902,6 +904,7 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>>>    
>>>    		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>>    		fmt->pad = pad->index;
>>> +		fmt->stream = stream;
>>>    		return v4l2_subdev_call(sd, pad, get_fmt, NULL, fmt);
>>>    	}
>>>    
>>> @@ -1012,31 +1015,176 @@ bool v4l2_subdev_has_route(struct v4l2_subdev_krouting *routing,
>>>    }
>>>    EXPORT_SYMBOL_GPL(v4l2_subdev_has_route);
>>>    
>>> +static int cmp_u32(const void *a, const void *b)
>>> +{
>>> +	u32 a32 = *(u32 *)a;
>>> +	u32 b32 = *(u32 *)b;
>>> +
>>> +	return a32 > b32 ? 1 : (a32 < b32 ? -1 : 0);
>>> +}
>>> +
>>>    int v4l2_subdev_link_validate(struct media_link *link)
>>>    {
>>> -	struct v4l2_subdev *sink;
>>> -	struct v4l2_subdev_format sink_fmt, source_fmt;
>>> -	int rval;
>>> +	int ret;
>>> +	unsigned int i;
>>>    
> 
> No need for a blank line, and I'd move i and ret (in that order) after
> the variables below.
> 
>>> -	rval = v4l2_subdev_link_validate_get_format(
>>> -		link->source, &source_fmt);
>>> -	if (rval < 0)
>>> -		return 0;
>>> +	struct v4l2_subdev *source_subdev =
>>> +		media_entity_to_v4l2_subdev(link->source->entity);
>>> +	struct v4l2_subdev *sink_subdev =
>>> +		media_entity_to_v4l2_subdev(link->sink->entity);
>>> +	struct device *dev = sink_subdev->entity.graph_obj.mdev->dev;
>>>    
> 
> No need for a blank line here either.
> 
>>> -	rval = v4l2_subdev_link_validate_get_format(
>>> -		link->sink, &sink_fmt);
>>> -	if (rval < 0)
>>> -		return 0;
>>> +	struct v4l2_subdev_krouting routing;
>>>    
> 
> Same.
> 
>>> -	sink = media_entity_to_v4l2_subdev(link->sink->entity);
>>> +	static const u32 default_streams[] = { 0 };
> 
> I'd move this one at the top.

Ok (to all above).

>>>    
>>> -	rval = v4l2_subdev_call(sink, pad, link_validate, link,
>>> -				&source_fmt, &sink_fmt);
>>> -	if (rval != -ENOIOCTLCMD)
>>> -		return rval;
>>> +	u32 num_source_streams = 0;
>>> +	const u32 *source_streams;
>>> +	u32 num_sink_streams = 0;
>>> +	const u32 *sink_streams;
>>> +
>>> +	dev_dbg(dev, "validating link \"%s\":%u -> \"%s\":%u\n",
>>> +		link->source->entity->name, link->source->index,
>>> +		link->sink->entity->name, link->sink->index);
>>> +
>>> +	/* Get source streams */
>>> +
>>> +	memset(&routing, 0, sizeof(routing));
>>> +
>>> +	ret = v4l2_subdev_get_routing(source_subdev, NULL, &routing);
>>> +
>>> +	if (ret && ret != -ENOIOCTLCMD)
>>> +		return ret;
>>> +
>>> +	if (ret == -ENOIOCTLCMD) {
>>> +		num_source_streams = 1;
>>> +		source_streams = default_streams;
>>> +	} else {
>>> +		u32 *streams;
>>> +
>>> +		streams = kmalloc_array(routing.num_routes, sizeof(u32),
>>> +					GFP_KERNEL);
>>> +
>>> +		for (i = 0; i < routing.num_routes; ++i) {
>>> +			struct v4l2_subdev_route *route = &routing.routes[i];
>>> +
>>> +			if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
>>> +				continue;
>>> +
>>> +			if (route->source_pad == link->source->index)
>>> +				streams[num_source_streams++] =
>>> +					route->source_stream;
>>> +		}
>>> +
>>> +		sort(streams, num_source_streams, sizeof(u32), &cmp_u32, NULL);
>>> +
>>> +		source_streams = streams;
>>> +
>>> +		v4l2_subdev_free_routing(&routing);
>>> +	}
> 
> Could this be moved to a separate function ? The code below is very
> similar.

Yes. It makes handling of the default_streams a bit more complex, but 
it's still cleaner to have a separate func.

>>> +
>>> +	/* Get sink streams */
>>> +
>>> +	memset(&routing, 0, sizeof(routing));
>>> +
>>> +	ret = v4l2_subdev_get_routing(sink_subdev, NULL, &routing);
>>> +
>>> +	if (ret && ret != -ENOIOCTLCMD)
>>> +		return ret;
>>> +
>>> +	if (ret == -ENOIOCTLCMD) {
>>> +		num_sink_streams = 1;
>>> +		sink_streams = default_streams;
>>> +	} else {
>>> +		u32 *streams;
>>>    
>>> -	return v4l2_subdev_link_validate_default(
>>> -		sink, link, &source_fmt, &sink_fmt);
>>> +		streams = kmalloc_array(routing.num_routes, sizeof(u32),
>>> +					GFP_KERNEL);
>>> +
>>> +		for (i = 0; i < routing.num_routes; ++i) {
>>> +			struct v4l2_subdev_route *route = &routing.routes[i];
>>> +
>>> +			if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
>>> +				continue;
>>> +
>>> +			if (route->sink_pad == link->sink->index)
>>> +				streams[num_sink_streams++] =
>>> +					route->sink_stream;
>>> +		}
>>> +
>>> +		sort(streams, num_sink_streams, sizeof(u32), &cmp_u32, NULL);
> 
> Are you aware that there can be duplicate in the streams array, as a
> given stream on a sink pad can be routed to multiple source pads ? I
> think that will fail the sink and source streams match test below.

Yes, I have fixed that issue.

>>> +
>>> +		sink_streams = streams;
>>> +
>>> +		v4l2_subdev_free_routing(&routing);
>>> +	}
>>> +
>>> +	if (num_source_streams != num_sink_streams) {
>>> +		dev_err(dev,
>>> +			"Sink and source stream count mismatch: %d vs %d\n",
>>> +			num_source_streams, num_sink_streams);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	/* Validate source and sink stream formats */
>>> +
>>> +	for (i = 0; i < num_source_streams; ++i) {
>>> +		struct v4l2_subdev_format sink_fmt, source_fmt;
>>> +		u32 stream;
>>> +		int ret;
>>> +
>>> +		if (source_streams[i] != sink_streams[i]) {
>>> +			dev_err(dev, "Sink and source streams do not match\n");
>>> +			return -EINVAL;
>>> +		}
> 
> What if the source subdev as a route enabled that produces a stream, and
> the sink subdev has not corresponding enabled route ? Isn't this a valid
> configuration ? For instance, when a CSI-2 sensor produces image data
> and embedded data in two streams with different CSI-2 DT, the embedded
> data doesn't have to be captured, it could be dropped in the CSI-2
> receiver.

Yes. Although in some cases the sink may not be able to drop the stream, 
but I don't think we can know that here. So I've fixed this to allow 
more source streams than sink streams.

  Tomi
