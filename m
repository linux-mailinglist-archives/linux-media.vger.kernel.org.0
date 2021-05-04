Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 066C83725F3
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 08:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbhEDGun (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 02:50:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43786 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbhEDGun (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 May 2021 02:50:43 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1B7B58E;
        Tue,  4 May 2021 08:49:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620110987;
        bh=XLkxwvAZSxHrcrFzR/qa2S/ekh8LGDvfQ6wIKBf4MIM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=QtxlCaMiynsy3d77xCD8BhV4F7X/WCL2a6bKUHy+TKclJSFBpbBRHrYPik4iAd22s
         QBbet6fdLZcitmdKAg/uaDihNLiWMgms1zNRTuMq5SYuttou8GvhcIplmqI2ud3SF+
         EhOEA/6ElT9m4VgQwAb69NnppK/4Bxbf/PAX6XR0=
Subject: Re: [PATCH v5 22/24] v4l: subdev: add v4l2_subdev_get_format_dir()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-23-tomi.valkeinen@ideasonboard.com>
 <YHyCwzfrhVFkPXoW@pendragon.ideasonboard.com>
 <d24ad349-0aef-e4cb-59d7-0db52c730f25@ideasonboard.com>
 <YIoPSoQTb3loaQFu@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <f7b920be-29ce-51ce-b499-227ac2253e5c@ideasonboard.com>
Date:   Tue, 4 May 2021 09:49:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YIoPSoQTb3loaQFu@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/04/2021 04:43, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Wed, Apr 21, 2021 at 04:04:22PM +0300, Tomi Valkeinen wrote:
>> On 18/04/2021 22:04, Laurent Pinchart wrote:
>>> On Thu, Apr 15, 2021 at 04:04:48PM +0300, Tomi Valkeinen wrote:
>>>> Add v4l2_subdev_get_format_dir() which can be used to find subdev format
>>>> for a specific stream on a multiplexed pad. The function will follow the
>>>> routes and links until it finds a non-multiplexed pad.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>> ---
>>>>    drivers/media/v4l2-core/v4l2-subdev.c | 96 +++++++++++++++++++++++++++
>>>>    include/media/v4l2-subdev.h           | 26 ++++++++
>>>>    2 files changed, 122 insertions(+)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>>>> index 7a4f71d8c6c3..430dbdaab080 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>>> @@ -998,6 +998,102 @@ bool v4l2_subdev_has_route(struct v4l2_subdev_krouting *routing,
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(v4l2_subdev_has_route);
>>>>    
>>>> +int v4l2_subdev_get_format_dir(struct media_pad *pad, u16 stream,
>>>> +			       enum v4l2_direction dir,
>>>> +			       struct v4l2_subdev_format *fmt)
>>>> +{
>>>> +	struct device *dev = pad->entity->graph_obj.mdev->dev;
>>>> +	int ret;
>>>> +	int i;
>>>> +
>>>> +	dev_dbg(dev, "%s '%s':%u:%u %s\n", __func__,
>>>> +		pad->entity->name, pad->index, stream,
>>>> +		dir == V4L2_DIR_SOURCEWARD ? "sourceward" : "sinkward");
>>>> +
>>>> +	while (true) {
>>>> +		struct v4l2_subdev_krouting routing;
>>>> +		struct v4l2_subdev_route *route;
>>>> +
>>>> +		if (pad->entity->obj_type != MEDIA_ENTITY_TYPE_V4L2_SUBDEV)
>>>> +			return -EINVAL;
>>>> +
>>>> +		ret = v4l2_subdev_link_validate_get_format(pad, fmt);
>>>> +		if (ret == 0)
>>>> +			return 0;
>>>> +		else if (ret != -ENOIOCTLCMD)
>>>> +			return ret;
>>>> +
>>>> +		if (pad->flags &
>>>> +		    (dir == V4L2_DIR_SINKWARD ? MEDIA_PAD_FL_SOURCE :
>>>> +						MEDIA_PAD_FL_SINK)) {
>>>> +			pad = media_entity_remote_pad(pad);
>>>> +
>>>> +			if (!pad)
>>>> +				return -EINVAL;
>>>> +
>>>> +			if (pad->entity->obj_type != MEDIA_ENTITY_TYPE_V4L2_SUBDEV)
>>>> +				return -EINVAL;
>>>> +
>>>> +			ret = v4l2_subdev_link_validate_get_format(pad, fmt);
>>>> +			if (ret == 0)
>>>> +				return 0;
>>>> +			else if (ret != -ENOIOCTLCMD)
>>>> +				return ret;
>>>> +		}
>>>> +
>>>> +		ret = v4l2_subdev_get_krouting(media_entity_to_v4l2_subdev(pad->entity), &routing);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		route = NULL;
>>>> +		for (i = 0; i < routing.num_routes; ++i) {
>>>> +			u16 near_pad = dir == V4L2_DIR_SINKWARD ?
>>>> +					       routing.routes[i].sink_pad :
>>>> +					       routing.routes[i].source_pad;
>>>> +			u16 near_stream = dir == V4L2_DIR_SINKWARD ?
>>>> +						  routing.routes[i].sink_stream :
>>>> +						  routing.routes[i].source_stream;
>>>> +
>>>> +			if (!(routing.routes[i].flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
>>>> +				continue;
>>>> +
>>>> +			if (near_pad != pad->index)
>>>> +				continue;
>>>> +
>>>> +			if (near_stream != stream)
>>>> +				continue;
>>>> +
>>>> +			if (route) {
>>>> +				dev_err(dev,
>>>> +					"%s: '%s' has multiple active routes for stream %u\n",
>>>> +					__func__, pad->entity->name, stream);
>>>> +				v4l2_subdev_free_routing(&routing);
>>>> +				return -EINVAL;
>>>> +			}
>>>> +
>>>> +			route = &routing.routes[i];
>>>> +		}
>>>> +
>>>> +		if (!route) {
>>>> +			dev_err(dev, "%s: no route found in '%s' for stream %u\n",
>>>> +				__func__, pad->entity->name, stream);
>>>> +			v4l2_subdev_free_routing(&routing);
>>>> +			return -EINVAL;
>>>> +		}
>>>> +
>>>> +		if (dir == V4L2_DIR_SINKWARD) {
>>>> +			pad = &pad->entity->pads[route->source_pad];
>>>> +			stream = route->source_stream;
>>>> +		} else {
>>>> +			pad = &pad->entity->pads[route->sink_pad];
>>>> +			stream = route->sink_stream;
>>>> +		}
>>>> +
>>>> +		v4l2_subdev_free_routing(&routing);
>>>> +	}
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_format_dir);
>>>> +
>>>>    int v4l2_subdev_link_validate(struct media_link *link)
>>>>    {
>>>>    	struct v4l2_subdev *sink;
>>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>>>> index 1843b77dd843..730631f9a091 100644
>>>> --- a/include/media/v4l2-subdev.h
>>>> +++ b/include/media/v4l2-subdev.h
>>>> @@ -1239,4 +1239,30 @@ void v4l2_subdev_cpy_routing(struct v4l2_subdev_krouting *dst,
>>>>    bool v4l2_subdev_has_route(struct v4l2_subdev_krouting *routing,
>>>>    			   unsigned int pad0, unsigned int pad1);
>>>>    
>>>> +/**
>>>> + * enum v4l2_direction - Direction either towards the source or the sink
>>>> + *
>>>> + * @V4L2_DIR_SOURCEWARD: Direction towards the source.
>>>> + * @V4L2_DIR_SINKWARD: Direction towards the sink.
>>>> + */
>>>> +enum v4l2_direction {
>>>> +	V4L2_DIR_SOURCEWARD,
>>>> +	V4L2_DIR_SINKWARD,
>>>> +};
>>>> +
>>>> +/**
>>>> + * v4l2_subdev_get_format_dir() - Find format by following streams
>>>
>>> The name is a bit cryptic, and the usage pattern error-prone. Can we do
>>> better ?  In particular, if we could limit the usage of this function to
>>> be called on a non-multiplexed pad, we could drop the stream argument.
>>> Deducing the direction argument from the type of pad would also make the
>>> API simpler.
>>
>> Hmm, but that's not what the function does. It follows a specific
>> stream, from a multiplexed pad, so it has to get the stream as a parameter.
>>
>> We can't deduct the direction from the type of the pad. We can of course
>> define that given a source pad this function goes sourceward. But if
>> that's not what the caller wants, then the caller needs to first follow
>> the stream either direction to get a sink pad, and then call this
>> function, which doesn't make sense.
> 
> What do the current callers need ? We don't have to implement something
> that is more generic or featureful than our needs dictate, as this is a
> very ad hoc function anyway. If we really need the full behaviour
> implemented here, we should at the very least rename the function, but I
> think it should be possible to do better overall, perhaps splitting the
> operation in the caller into cleaner functions.

The link validation will call the function with both V4L2_DIR_SOURCEWARD 
and V4L2_DIR_SINKWARD. DS90UB960 driver also uses the function, with 
V4L2_DIR_SOURCEWARD.

The name may not be the most clear one, but it's not easy to invent a 
name for something like this =). Why do you think the usage pattern is 
error prone?

  Tomi
