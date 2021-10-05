Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5970422335
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 12:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233077AbhJEKVH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 06:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbhJEKVG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 06:21:06 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A675C06161C
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 03:19:16 -0700 (PDT)
Received: from [IPv6:2a02:810a:880:f54:513a:8ecc:d1c4:6cb5] (unknown [IPv6:2a02:810a:880:f54:513a:8ecc:d1c4:6cb5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 272291F438B7;
        Tue,  5 Oct 2021 11:19:14 +0100 (BST)
Subject: Re: [PATCH v8 28/36] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
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
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <a0fdefe3-092d-221a-8030-e984617e0677@collabora.com>
Date:   Tue, 5 Oct 2021 12:19:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <30a468fe-e813-2b30-49e8-86192379c238@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 04.10.21 07:15, Tomi Valkeinen wrote:
> Hi,
> 
> On 03/10/2021 22:52, Dafna Hirschfeld wrote:
> 
>>> +/**
>>> + * struct v4l2_subdev_route - A route inside a subdev
>>> + *
>>> + * @sink_pad: the sink pad index
>>> + * @sink_stream: the sink stream identifier
>>> + * @source_pad: the source pad index
>>> + * @source_stream: the source stream identifier
>>> + * @flags: route flags V4L2_SUBDEV_ROUTE_FL_*
>>> + * @reserved: drivers and applications must zero this array
>>> + */
>>> +struct v4l2_subdev_route {
>>> +    __u32 sink_pad;
>>> +    __u32 sink_stream;
>>> +    __u32 source_pad;
>>> +    __u32 source_stream;
>>> +    __u32 flags;
>>> +    __u32 reserved[5];
>>> +};
>>> +
>>
>> I don't understand that struct, what is the meaning of the two sink_stream, source_stream fields?
>> What is the relation between sink_pad and source_pad? A 'route' between two pads means that 'streams' can flow through them?
>>
>> If I have for example:
>>
>> sink_pad = sink_stream = 0
>> source_pad = source_stream = 1
>>
>> what does that mean?
> 
> It means that a stream with stream ID 0 that comes to the subdev's sink pad 0 will be routed to the subdev's source pad 1 with stream ID 1.
> 
> So the sink_pad and source_pad tell via which pads the streams flows.
> 
> Stream IDs are numbers used to uniquely identify the stream for the specific pad. In other words, for the subdev's pad 0, each stream ID must be unique. That pad 0 is linked (media link) to another subdev's pad, and on that pad there must be streams with the matching IDs.

Ok, so the stream ID for the same stream changes from link to link.

So different streams can have the same ID on different pads?

Won't it be more simple if the stream ID is forced to stay the same along all the links and pads?

> 
>   Tomi
