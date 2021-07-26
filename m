Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 793AD3D57C2
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 12:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbhGZKIl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 06:08:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43264 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbhGZKIk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 06:08:40 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CC5D332;
        Mon, 26 Jul 2021 12:49:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627296548;
        bh=jisFqdIMU8JaO25cDE3wA37JCUAha4BG7IHrN9wEKck=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=IF+WZsHNstbMc1B7v7wBOjEa+dhZcHN7kHOpOODIN3MiTr6d9l05WfWad6dYowl8c
         1onsZqRpvjx0zEqXNpcrRt40TjVkz68HzZY7FmQc1ugNfZElDJw4qjCBdwYUc7yHZI
         GbYcJtMqJ/qnw+nEjExSQ0UsmAi5LxH/YY9PZiPw=
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <YLwReuwLm7S/4hgz@pendragon.ideasonboard.com>
 <20210709151821.ogra3s2ulnsvkyqa@uno.localdomain>
 <9b6ce019-8e38-886a-0c61-6f437ca9a915@ideasonboard.com>
 <20210710084239.rgksudxtrrocufuc@uno.localdomain>
 <def272e2-6404-7167-b54f-80f49ad7a874@ideasonboard.com>
 <20210723102102.6nlozc7jeaaxnm5o@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v7 00/27] v4l: subdev internal routing and streams
Message-ID: <0698d361-c1d4-9db3-3959-0bfc54643889@ideasonboard.com>
Date:   Mon, 26 Jul 2021 13:49:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723102102.6nlozc7jeaaxnm5o@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 23/07/2021 13:21, Jacopo Mondi wrote:

>> This current series version has a routing table, set with the set-routing
>> ioctl. When the routing is set, you could think that a set of "virtual" pads
>> is created (identified by (pad, stream) pair), where each route endpoint has
>> a pad. Those pads can then be configured similarly to the "normal" pads.
>>
> 
> And that's for routes inside an entity. Am I wrong that in this
> version multiplexed (or virtual) pads identified by the (pad, stream)
> pair have a format assigned at both ends of a link ?

Yes, that is correct.

>>>>>      Also link validation is of course a bit more complex as shown by
>>>>>      731facccc987 ("v4l: subdev: Take routing information into account in link validation")
>>>>>      which was part of the previous series, but it's totally up to the
>>>>>      core..
>>>>>
>>>>> Moving everything to the pads by adding a 'stream' field basically
>>>>> makes all pads potentially multiplexed, reducing the problem of format
>>>>> configuration/validation to a 1-to-1 {pad, stream} pair validation
>>>>> which allows to collapse the topology and maintain the current one.
>>>>
>>>> Yes. I think I have problem understanding the counter arguments as I don't
>>>> really see a difference with a) two subdevs, each with two non-multiplexed
>>>> pads, linked 1-to-1 and b) two subdevs, each with one multiplexed pad, with
>>>> two routes.
>>>
>>> My main concerns are:
>>>
>>> - Usage of format configuration to establish routing as per above.
>>>     Format assignment gets a routing semantic associated, which is an
>>>     implicit behavior difficult to control and inspect for applications.
>>
>> Again, either I'm totally misunderstanding what you're saying, or you are
>> talking about the method that has not been implemented.
>>
> 
> For routing internal to entities as you said GS_ROUTING is still in
> place, so my argument is moot. However I think it still applies to
> multiplexed ends of a cross-entity link (see below).
> 
> 
>>> - Userspace is in control of connecting endpoints on the multiplexed
>>>     bus by assigning formats, this has two consequences:
>>>     - A 1-to-1 mapping between streams on the two sides of the
>>>       multiplexed bus which prevents routing multiple streams to the
>>>       same endpoint (is this correct ?)
>>
>> No, you can have multiple streams with the same endpoint (i.e. the same
>> (pad, stream) for source/sink side).
>>
>>>     - As the only information about a 'stream' on the multiplexed bus is
>>>       the format it transports, it is required to assign to the stream
>>>       identifier a semantic (ie stream 0 = virtual channel 0). The
>>>       previous version had the information of what's transported on the
>>>       multiplexed bus hidden from userspace and delegated to the
>>>       frame_desc kAPI. This way it was possible to describe precisely
>>>       what's sent on the bus, with bus-specific structures (ie struct
>>>       v4l2_mbus_frame_desc_entry.bus.csi2)
>>
>> That is how it's in this series too. The difference is that in the previous
>> version, when a driver needed to know something about the stream which was
>> not in the frame_desc, it had to start traversing the graph to find out a
>> non-multiplexed pad. With this version the driver has the information in its
>> (pad, stream) pair.
> 
> That's a (desirable) consequence of the fact multiplexed ends of a
> link have a format assigned, right ?

Yes.

>>
>>>     - This might seem a bit pedantic, but, setting image formats and
>>>       sizes on the endpoints of a multiplexed bus such as CSI-2 is not
>>>       technically correct. CSI-2 transports packets tagged with
>>>       identifiers for the virtual channel and data type they transport
>>>       (and identifiers for the packet type, but that's part of the bus
>>>       protocol). The format and size is relevant for configuring the
>>>       size of the memory area where the receiver dumps the received
>>>       packets, but it's not part of the link configuration itself.
>>>       This was better represented by using the information from the
>>>       remote side frame_desc.
>>
>> Why is a multiplexed CSI-2 bus different than a non-multiplexed parallel
>> bus? Or more specifically, why is a single stream in a multiplexed CSI-2 bus
>> different than the stream in non-multiplexed parallel bus? It's the same
>> data, transported in a slightly different manner.
>>
>> One could, of course, argue that they are not different, and pad
>> configuration for non-multiplexed pads should also be removed.
> 
> While I get where you're going, I don't completely agree. The format
> set on the ends of a non-multiplexed link does not represent what is
> transported there but instructs the receiver (less so the transmitter)
> about what data it should expects to receive and allows drivers to
> prepare for it. The same doesn't apply to multiplexed pads, where
> 'what is expected to receive' is given by the union of the formats of
> the several (pad, stream) endpoints. Assuming my understanding is
> correct, that's what I don't like about having formats on multiplexed
> pads.

Hmm, I don't quite understand your point. Do you mean that in 
non-multiplexed case the format is used to configure the receiver 
hardware, whereas with multiplexed case that is not true?

The format describes the content of a stream. In non-multiplexed case 
there's only one stream. In both cases the frame-desc can be used to 
find out details about the transmission.

Maybe this becomes more clear if you can give some practical examples to 
highlight your concerns?

> Thanks, this helps. Do we concur that the main difference between the
> two version (let's call them v0 and v1) at least from an uAPI perspective,

Let's rather call them v1 and v2, as I've uesd those terms elsewhere 
already =)

> is basically that the ends of a multiplexed link:
> 
> - in v0 had no formats assigned, configuration of the receiver end was
>    performed in-kernel through get_frame_desc()

Yes, although if the driver needs to know details found in the format, 
it has to traverse through the graph to find the data.

> - in v1 each (pad, stream) has a format assigned by userspace and the
>    receiver configuration is deduced from the formats assigned to the
>    several endpoints ?

The receiver configuration needs to be decided based on frame desc, 
formats, link freq control. This is the same for v0.

> I would like to thank you for having bear with me so far and clarify my
> doubts, I hope you'll find energy to clarify my last questions
> here and I hope my understanding is not completely wrong, this is a
> non-easy topic to deal with.

This will perhaps be easier to understand when I provide the drivers 
I've been using for testing. I'll do that for the next version.

> However, I don't want to continue to argue because what I care about
> is getting to have some solution merged, and I feel this discussion is
> not getting any productive for that. What I can offer, if anyway

I disagree, I think it is productive =). I am relatively new to cameras 
and V4L2, so it's important to get opinions. It is also good to get 
questions so that I have to explain what I'm doing, as it often forces 
me to re-think topics that I have already "finished".

> helpful, is in the next weeks (or months?) rebase the work we've done
> on R-Car in the past to support VC multiplexing on your series to have
> more material for comparison. Then the ideal solution would be to pick

This is a good idea, but please wait until the next version of the 
series. While there are currently no changes in the concepts, there are 
quite a lot of kernel side changes due to the new subdev state and using 
that.

> a conference/event most of the interested parties could attend, sit
> down for a few days and find a way to move forward. The linux-media
> mini conferences held around ELC/plumbers had this purpose and helped
> finalize direction for other topics in the past. Considering the
> current situation that's very unlikely to happen, but a virtual
> version of the same could be considered.

I'm happy to have meetings, one-to-one or bigger ones, to discuss this.

  Tomi
