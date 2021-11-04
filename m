Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D77914453D3
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 14:27:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231500AbhKDN35 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 09:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbhKDN3z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 09:29:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74AE9C061714
        for <linux-media@vger.kernel.org>; Thu,  4 Nov 2021 06:27:17 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95882D8B;
        Thu,  4 Nov 2021 14:27:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636032434;
        bh=W4P99cTtRlgbs1KNT92rPLUbRq10hc1aoPBwrxYM0Oc=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=kl29ENEHOSV0PkzoW01Jx69AWYMmV9SKh5hOZTfnK6xF3i5nFtdKWOku0YdhNFpbm
         LKYhezb4lSNmMdy/pW/ht7VejXv3cG70ALM3lXqTL8yjriW5v0Im2bKmTapwkjeQTV
         1gYvPudz2p35WNVjqvWAyCGx3PlZJIKSID5r/PCE=
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-31-tomi.valkeinen@ideasonboard.com>
 <d89afbd7-2f12-5231-a227-853f7e975e8e@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v9 30/36] media: Documentation: add multiplexed streams
 documentation
Message-ID: <d42b3782-12a0-9dbe-06b6-32f7aea44529@ideasonboard.com>
Date:   Thu, 4 Nov 2021 15:27:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d89afbd7-2f12-5231-a227-853f7e975e8e@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/10/2021 18:34, Hans Verkuil wrote:
> On 05/10/2021 10:57, Tomi Valkeinen wrote:
>> Add documentation related to multiplexed streams.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   .../driver-api/media/v4l2-subdev.rst          |   8 +
>>   .../userspace-api/media/v4l/dev-subdev.rst    | 164 ++++++++++++++++++
>>   2 files changed, 172 insertions(+)
>>
>> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
>> index c3fd57fff668..410e03a29f2a 100644
>> --- a/Documentation/driver-api/media/v4l2-subdev.rst
>> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
>> @@ -546,6 +546,14 @@ subdev drivers. In these cases the called subdev ops must also handle the NULL
>>   case. This can be easily managed by the use of
>>   v4l2_subdev_validate_and_lock_state() helper.
>>   
>> +Streams, multiplexed media pads and internal routing
>> +----------------------------------------------------
>> +
>> +A subdevice driver can implement support for multiplexed streams by setting
>> +the V4L2_SUBDEV_FL_MULTIPLEXED subdev flag and implementing support for
>> +centrally managed subdev active state, routing and stream based
>> +configuration.
>> +
>>   V4L2 sub-device functions and data structures
>>   ---------------------------------------------
>>   
>> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
>> index a67c2749089a..ea3efa97bb08 100644
>> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
>> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
>> @@ -503,3 +503,167 @@ source pads.
>>       :maxdepth: 1
>>   
>>       subdev-formats
>> +
>> +Streams, multiplexed media pads and internal routing
>> +----------------------------------------------------
>> +
>> +Commonly V4L2 subdevices support only separate video streams, that is, each
>> +link in the media grap and each pad in a subdevice passes through a single
> 
> passes -> pass
> grap -> graph
> 
>> +video stream. Thus each pad contains a format configuration for that single
>> +stream. In some cases a subdev can do stream processing and split a stream
>> +into two or compose two streams into one, but the inputs and outputs for the
>> +subdev are still a single stream per pad.
>> +
>> +Some hardware, e.g. MIPI CSI-2, support multiplexed streams, that is, a single
>> +bus carries multiple streams. Thus a camera could output two streams, a pixel
>> +stream and a metadata stream, and a bridge subdev could route the streams
>> +from multiple input pads into a single output pad.
>> +
>> +Subdevice drivers that support multiplexed streams are compatible with
>> +non-multiplexed subdev drivers, but, of course, requires such a routing
> 
> requires such -> require
> 
>> +configuration where the link between those two types of drivers contain only
> 
> contain -> contains
> 
>> +a single stream.
>> +
>> +Understanding streams
>> +^^^^^^^^^^^^^^^^^^^^^
>> +
>> +A stream is a stream of content (e.g. pixel data or metadata) flowing through
>> +the media pipeline from a source (e.g. a sensor) towards the final sink
>> +(e.g. a receiver in a SoC). Each media link carries all the streams from
> 
> 'receiver' is a bit vague. What sort of receiver are we talking about here?
> What about: 'a receiver and demultiplexer in a SoC'. This implies that it is
> the block that can receive a multiplexed stream and demux it. The demuxing
> part is the critical feature of this block IMHO.
> 
>> +one end of the link to the other, whereas subdevices have routing tables
> 
> 'whereas' is an odd word. Would simply 'and' not be a better word to use here?
> 
>> +which describe how the incoming streams from sink pads are routed to the
>> +source pads.
>> +
>> +A stream ID (often just "stream") is a media link-local identifier for a
>> +stream. In other words, configuration for a particular stream ID must exist
> 
> configuration -> a configuration
> 
>> +on both sides of a media link, but another stream ID can be used for the same
>> +stream at the other side of the subdevice.
>> +
>> +A stream at a specific point in the media pipeline is identified with the
>> +subdev and a (pad, stream) pair. For subdevices that do not support
>> +multiplexed streams the 'stream' is always 0.
> 
> I find this section confusing. I think there are two issues here: what exactly is
> meant with 'media link': a link between two pads from different entities?

Yes. Isn't "media link" the common word for it?

> And I also think that 'subdev' is sometimes used where 'media entity' is actually
> meant. E.g. "at the other side of the subdevice" makes no sense, but "between two
> other entities" makes more sense.

That's true. Here we talk specifically about media entities which are 
v4l2 subdevs. Should I say "v4l2 subdev media entities"?

>> +
>> +Configuring streams
>> +^^^^^^^^^^^^^^^^^^^
>> +
>> +The configuration of the streams is done individually for each subdevice and
>> +the validity of the streams between subdevices is validated when the pipeline
>> +is started.
> 
> Here too I think you really mean 'entities'. A subdev device node controls an
> entity. It might be me, but when I think of a media stream I see it as a data
> stream running through entities, and subdevs are just the interfaces through
> which the entities are controlled.

I just group the media entity and the subdev together =). I understand 
they're separate things, or at least were designed so originally.

But what belongs to the media entity and what belongs to the v4l2 
subdev? If streams belong to the media side, should the routing be moved 
to media entities (and the ioctl too)?

Above says "The configuration of the streams is done individually for 
each subdevice". We call an ioctl in the subdev, and the subdev driver 
stores the stream configuration in the subdev's active state. Isn't that 
just "subdev" stuff then, media entity is not involved?

>> +
>> +There are three steps in configuring the streams:
>> +
>> +1) Set up links. Connect the pads between subdevices using the :ref:`Media
>> +Controller API <media_controller>`
>> +
>> +2) Routing. The routing table for the subdevice must be set with
>> +:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
>> +
>> +3) Configure streams. Each route endpoint must be configured
>> +with :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`.
>> +
>> +Multiplexed streams setup example
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> +
>> +A simple example of a multiplexed stream setup might be as follows:
>> +
>> +- Two identical sensors (Sensor A and Sensor B). Each sensor has a single
>> +  source pad (pad 0), and outputs two streams, pixel data and metadata.
>> +
>> +- Multiplexer bridge (Bridge). The bridge has two sink pads, connected to the
>> +  sensors (pads 0, 1), and one source pad (pad 2), which outputs all 4
>> +  streams.
>> +
>> +- Receiver in the SoC (Receiver). The receiver has a single sink pad (pad 0),
>> +  connected to the bridge, and four source pads (pads 1-4), going to the DMA
>> +  engine. The receiver demultiplexes the incoming streams to the four source
>> +  pads.
>> +
>> +- Four DMA Engines in the SoC (DMA Engine). Each DMA engine is connected to a
>> +  single source pad in the receiver.
>> +
>> +The sensors, the bridge and the receiver are modeled as V4L2 subdevices,
>> +exposed to userspace via /dev/v4l-subdevX device nodes. The DMA engines are
>> +modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
>> +
>> +To configure this pipeline, the userspace must take the following steps:
>> +
>> +1) Set up media links between entities: connect the sensors to the bridge,
>> +bridge to the receiver, and the receiver to the DMA engines. This step does
>> +not differ from normal non-multiplexed media controller setup.
>> +
>> +2) Configure routing.
>> +
>> +.. flat-table:: Sensor routing table (identical on both sensors)
>> +    :header-rows:  1
>> +
>> +    * - Sink Pad/Stream
>> +      - Source Pad/Stream
>> +      - Routing Flags
>> +      - Comments
>> +    * - 0/0 (unused)
>> +      - 0/0
>> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE | V4L2_SUBDEV_ROUTE_FL_SOURCE
>> +      - Pixel data stream. Source route, i.e. the sink fields are unused.
>> +    * - 0/0 (unused)
>> +      - 0/1
>> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE | V4L2_SUBDEV_ROUTE_FL_SOURCE
>> +      - Metadata stream. Source route, i.e. the sink fields are unused.
>> +
>> +.. flat-table:: Bridge routing table
>> +    :header-rows:  1
>> +
>> +    * - Sink Pad/Stream
>> +      - Source Pad/Stream
>> +      - Routing Flags
>> +      - Comments
>> +    * - 0/0
>> +      - 2/0
>> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
>> +      - Pixel data stream from Sensor A
>> +    * - 0/1
>> +      - 2/1
>> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
>> +      - Metadata stream from Sensor A
>> +    * - 1/0
>> +      - 2/2
>> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
>> +      - Pixel data stream from Sensor B
>> +    * - 1/1
>> +      - 2/3
>> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
>> +      - Metadata stream from Sensor B
>> +
>> +.. flat-table:: Receiver routing table
>> +    :header-rows:  1
>> +
>> +    * - Sink Pad/Stream
>> +      - Source Pad/Stream
>> +      - Routing Flags
>> +      - Comments
>> +    * - 0/0
>> +      - 1/0
>> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
>> +      - Pixel data stream from Sensor A
>> +    * - 0/1
>> +      - 2/0
>> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
>> +      - Metadata stream from Sensor A
>> +    * - 0/2
>> +      - 3/0
>> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
>> +      - Pixel data stream from Sensor B
>> +    * - 0/3
>> +      - 4/0
>> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
>> +      - Metadata stream from Sensor B
>> +
>> +3) Configure streams
>> +
>> +After configuring the routing table, the next step is configuring the streams.
>> +This step is similar to configuring the pads in a non-multiplexed streams
>> +setup, with the difference that we need to configure each (pad, stream) pair
>> +(i.e. route endpoint), instead of just a pad.
>> +
>> +Presuming there are no format conversions in the pipeline, the userspace needs
> 
> Presuming -> Assuming
> 
>> +to configure all the route endpoints using four formats (two pixel formats
>> +and two metadata formats) with VIDIOC_SUBDEV_S_FMT.
>>
> 
> Actually, if there are format conversions, wouldn't you still do the same thing?
> 
> Is that 'Presuming...pipeline,' needed at all?

I think what I wrote is confusing. I was just highlighting that when you 
have a pipeline with no conversions, you need to use exactly four 
formats (v4l2_mbus_framefmt) on all the stream endpoints across all the 
subdevs. If your pipeline does conversions, you need to use more formats 
to reflect the conversion.

I'll rewrite it.

  Tomi
