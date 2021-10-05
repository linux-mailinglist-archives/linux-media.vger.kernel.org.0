Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 869134223F4
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 12:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233727AbhJEK4H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 06:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233514AbhJEK4H (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 06:56:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D50C06161C
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 03:54:16 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2786625B;
        Tue,  5 Oct 2021 12:54:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633431254;
        bh=Uh5th9cqc93UOD5bk4A0OkKYdsWrvD/9NyPQmS2TA2c=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=QWgCHTzjPK+JUUGc100catxbE6u1ugYG07nCgG3rGUF5OBmv0qyLETFmY7xAQjpjt
         /j76XQWm7P9uhnaya9wmAXFCHby1ySR8IPX4bIk/e3RS5uk7OIn+r0zqqjs7J5WZIT
         1+80j+Pre2bTmAHJ43zm6vkfbfFgvNPX5tnbGMQQ=
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-29-tomi.valkeinen@ideasonboard.com>
 <c79b503e-cb83-61cb-f1d0-982e49a6f0cc@collabora.com>
 <30a468fe-e813-2b30-49e8-86192379c238@ideasonboard.com>
 <a0fdefe3-092d-221a-8030-e984617e0677@collabora.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v8 28/36] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
Message-ID: <08abde6b-7298-3fb0-09ce-ff1b0f6d00c7@ideasonboard.com>
Date:   Tue, 5 Oct 2021 13:54:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a0fdefe3-092d-221a-8030-e984617e0677@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 05/10/2021 13:19, Dafna Hirschfeld wrote:
> 
> 
> On 04.10.21 07:15, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 03/10/2021 22:52, Dafna Hirschfeld wrote:
>>
>>>> +/**
>>>> + * struct v4l2_subdev_route - A route inside a subdev
>>>> + *
>>>> + * @sink_pad: the sink pad index
>>>> + * @sink_stream: the sink stream identifier
>>>> + * @source_pad: the source pad index
>>>> + * @source_stream: the source stream identifier
>>>> + * @flags: route flags V4L2_SUBDEV_ROUTE_FL_*
>>>> + * @reserved: drivers and applications must zero this array
>>>> + */
>>>> +struct v4l2_subdev_route {
>>>> +    __u32 sink_pad;
>>>> +    __u32 sink_stream;
>>>> +    __u32 source_pad;
>>>> +    __u32 source_stream;
>>>> +    __u32 flags;
>>>> +    __u32 reserved[5];
>>>> +};
>>>> +
>>>
>>> I don't understand that struct, what is the meaning of the two 
>>> sink_stream, source_stream fields?
>>> What is the relation between sink_pad and source_pad? A 'route' 
>>> between two pads means that 'streams' can flow through them?
>>>
>>> If I have for example:
>>>
>>> sink_pad = sink_stream = 0
>>> source_pad = source_stream = 1
>>>
>>> what does that mean?
>>
>> It means that a stream with stream ID 0 that comes to the subdev's 
>> sink pad 0 will be routed to the subdev's source pad 1 with stream ID 1.
>>
>> So the sink_pad and source_pad tell via which pads the streams flows.
>>
>> Stream IDs are numbers used to uniquely identify the stream for the 
>> specific pad. In other words, for the subdev's pad 0, each stream ID 
>> must be unique. That pad 0 is linked (media link) to another subdev's 
>> pad, and on that pad there must be streams with the matching IDs.

Btw, I've just sent v9 of the series, which includes documentation that 
covers this.

> Ok, so the stream ID for the same stream changes from link to link.

Not necessarily, but yes, it may.

> So different streams can have the same ID on different pads?

True.

> Won't it be more simple if the stream ID is forced to stay the same 
> along all the links and pads?

I don't think so.

For one, it would be difficult, or at least laborious, to verify that 
the above holds true.

Also, streams can appear and disappear, e.g. a single stream in a 
subdev's input side might be split or duplicated into multiple streams 
on the output side.

And I think that it makes sense that e.g. a sensor that outputs two 
streams (pixel & metadata) can have a hardcoded routing, with pad 0 and 
streams 0 and 1. Stream 0 is always the pixel data, and stream 1 is 
always the metadata, and the user knows this so he can connect those 
streams appropriately. If you have multiple cameras, such a scheme would 
not be possible.

What would be the benefit of such rule? Afaik, it would be just for the 
benefit of the human who writes the configuration for the pipeline. And 
with the current series, nothing prevents the user from assigning 
"unique" stream IDs for the pipeline being configured. You can pick 
stream ID 6001 for pixel stream from camera 1, and keep that stream ID 
for the whole pipeline for that stream (assuming the stream won't be split).

That said, I agree that "stream ID" kind of sounds like something used 
to identify the stream, regardless where in the pipeline we look. But 
that is not the case. As I write in the docs: "A stream ID (often just 
"stream") is a media link-local identifier for a stream".

  Tomi
