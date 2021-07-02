Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B123B9DCE
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 10:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbhGBI7F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 04:59:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49734 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbhGBI7F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 04:59:05 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 114074AB;
        Fri,  2 Jul 2021 10:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1625216191;
        bh=VpoWU/MRe9CK9XzzIog+6F5l4YPloG6GzAl8Xyqh6PQ=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=XpTi1fGqq/qjAjzxIkx1erin5NPViwqBk0YzzVNTjBS5odrJYmOPBkpUVk7uBAY+g
         fjwEvVmx4Gj96CdfUFY4Zg1iMMf/01Da49rj0fO3NUiIhLiKIFuWYQBjhb2xYQqIhJ
         YM/Ak3KF8fUxWMJWuFK2njm1dXxAS1XpeCdmbRb8=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <20210524104408.599645-23-tomi.valkeinen@ideasonboard.com>
 <YLwLzNfyjNN5ASWa@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v7 22/27] v4l: subdev: add stream based configuration
Message-ID: <0014bfbd-e7cf-2162-3309-1310346f482d@ideasonboard.com>
Date:   Fri, 2 Jul 2021 11:56:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YLwLzNfyjNN5ASWa@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 06/06/2021 02:42, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, May 24, 2021 at 01:44:03PM +0300, Tomi Valkeinen wrote:
>> Add support to manage configurations (format, crop, compose) per stream,
>> instead of per pad. This is accomplished with data structures that hold
>> an array of all subdev's stream configurations.
>>
>> The number of streams can vary at runtime based on routing. Every time
>> the routing is changed, the stream configurations need to be
>> re-initialized.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 62 +++++++++++++++++++++++++++
>>   include/media/v4l2-subdev.h           | 55 ++++++++++++++++++++++++
>>   2 files changed, 117 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index ef18682dbc6f..da6ea9b14631 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -1112,3 +1112,65 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
>>   	v4l2_subdev_notify(sd, V4L2_DEVICE_NOTIFY_EVENT, (void *)ev);
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
>> +
>> +int v4l2_init_stream_configs(struct v4l2_subdev_stream_configs *stream_configs,
>> +			     const struct v4l2_subdev_krouting *routing)
>> +{
>> +	u32 num_configs = 0;
>> +	unsigned int i;
>> +	u32 format_idx = 0;
>> +
>> +	v4l2_uninit_stream_configs(stream_configs);
>> +
>> +	/* Count number of formats needed */
>> +	for (i = 0; i < routing->num_routes; ++i) {
>> +		struct v4l2_subdev_route *route = &routing->routes[i];
>> +
>> +		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
>> +			continue;
>> +
>> +		/* Each route needs a format on both ends of the route */
>> +		num_configs += 2;
>> +	}
>> +
>> +	if (num_configs) {
>> +		stream_configs->configs =
>> +			kvcalloc(num_configs, sizeof(*stream_configs->configs),
>> +				 GFP_KERNEL);
>> +
>> +		if (!stream_configs->configs)
>> +			return -ENOMEM;
>> +
>> +		stream_configs->num_configs = num_configs;
>> +	}
>> +
>> +	/* Fill in the 'pad' and stream' value for each item in the array from the routing table */
>> +	for (i = 0; i < routing->num_routes; ++i) {
>> +		struct v4l2_subdev_route *route = &routing->routes[i];
>> +		u32 idx;
>> +
>> +		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
>> +			continue;
>> +
>> +		idx = format_idx++;
>> +
>> +		stream_configs->configs[idx].pad = route->sink_pad;
>> +		stream_configs->configs[idx].stream = route->sink_stream;
>> +
>> +		idx = format_idx++;
>> +
>> +		stream_configs->configs[idx].pad = route->source_pad;
>> +		stream_configs->configs[idx].stream = route->source_stream;
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_init_stream_configs);
>> +
>> +void v4l2_uninit_stream_configs(struct v4l2_subdev_stream_configs *stream_configs)
>> +{
>> +	kvfree(stream_configs->configs);
>> +	stream_configs->configs = NULL;
>> +	stream_configs->num_configs = 0;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_uninit_stream_configs);
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index 87f6bb78bbe9..39c6b811463a 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -661,6 +661,37 @@ struct v4l2_subdev_pad_config {
>>   	struct v4l2_rect try_compose;
>>   };
>>   
>> +/**
>> + * struct v4l2_subdev_stream_config - Used for storing stream configuration.
>> + *
>> + * @pad: pad number
>> + * @stream: stream number
>> + * @fmt: &struct v4l2_mbus_framefmt
>> + * @crop: &struct v4l2_rect to be used for crop
>> + * @compose: &struct v4l2_rect to be used for compose
>> + *
>> + * This structure stores configuration for a stream.
>> + */
>> +struct v4l2_subdev_stream_config {
>> +	u32 pad;
>> +	u32 stream;
>> +
>> +	struct v4l2_mbus_framefmt fmt;
>> +	struct v4l2_rect crop;
>> +	struct v4l2_rect compose;
>> +};
>> +
>> +/**
>> + * struct v4l2_subdev_stream_configs - A collection of stream configs.
>> + *
>> + * @num_configs: number of entries in @config.
>> + * @config: an array of &struct v4l2_subdev_stream_configs.
>> + */
>> +struct v4l2_subdev_stream_configs {
>> +	u32 num_configs;
>> +	struct v4l2_subdev_stream_config *configs;
>> +};
> 
> Honestly, this feels over-complicated and under-specified. What happens

Under-specified I agree, but why is it over-complicated? It's just a 
dynamic map of (pad+stream) -> stream-config. Or do you mean the whole 
approach to multiplexed streams?

> to formats that have been previously configured when routing is changed

Changing routing is a drastic operation, so all formats are reset to 
default.

> ? What happens when changing routing while streaming is in progress ?

It's not allowed (probably my code doesn't check this at the moment).

> All these use cases need to be clearly specified.
> 
> If you want to go in this direction, this needs to be integrated with
> v4l2_subdev_state (which I think you do in a later patch), but also
> handled completely in the core. There's no way drivers will get this
> right, I don't want them to see v4l2_subdev_stream_configs. On the
> upside, embedding v4l2_subdev_state in subdevs would help, but I'm not
> sure if it will be enough.
> 
> Making subdev pad operations handle streams explicitly opens the door to
> thousands of questions, and each of them needs to be answered. I fear
> that's a daunting task.

Yes, that's multiplexed streams for you =).

The previous approach I tried, where pads were either single-stream and 
configurable or multistream and non-configurable, also raised lots of 
questions and the implementation complexity was getting quite horrible. 
E.g. a simple sensor driver that also has metadata had to be split into 
three subdevs, and the need to walk the media graph back and forth lots 
of times was very ugly.

My opinion is that this version is much better. It's quite 
understandable and easy to use from the userspace (taking into account 
that the issue of multiplexed streams is complex, and that the APIs are 
perhaps not yet optimal), and the code on the kernel side resembles the 
non-multiplexed operations, and is more manageable in the drivers than 
with the previous version.

Now that the subdev state has been merged, I can work towards handling 
many of these operations in the v4l2 core. But that's essentially "just" 
kernel cleanup, I don't think that affects much whether this multiplexed 
streams approach in general is ok or not.

  Tomi
