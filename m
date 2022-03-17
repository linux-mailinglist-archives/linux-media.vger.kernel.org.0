Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 802694DC00C
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 08:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbiCQHUH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 03:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbiCQHUF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 03:20:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A325190B4F
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 00:18:48 -0700 (PDT)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37BC3EE;
        Thu, 17 Mar 2022 08:18:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647501525;
        bh=btJKf+rKmiAI7OzI1WItAz1K6tsbNDkpzMIjBZ1t3/w=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=pr76V/zyaQTcja4LFn73UeZn51Gzrc7pZjQDb58GHiVFDEKYCAKQutZbvfEl7DuOf
         KtZ9v5e4iCte8zlmSWJrZu6a0CLumDrrDxjcNpGqXI4VzKwbhbeqqrQdcHOAT6FvcC
         Jy8MkSkHcgyfr7ZBt92PlOZ5rjjOyJi12FhpZDiU=
Message-ID: <68a3f1e2-bf50-263f-607c-cfcc25f978ce@ideasonboard.com>
Date:   Thu, 17 Mar 2022 09:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 25/36] media: Documentation: add multiplexed streams
 documentation
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
 <20220301161156.1119557-26-tomi.valkeinen@ideasonboard.com>
 <20220316090404.jnwkiu6qe2qvfblc@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220316090404.jnwkiu6qe2qvfblc@uno.localdomain>
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

On 16/03/2022 11:04, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Tue, Mar 01, 2022 at 06:11:45PM +0200, Tomi Valkeinen wrote:
>> Add documentation related to multiplexed streams.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   .../driver-api/media/v4l2-subdev.rst          |   8 +
>>   .../userspace-api/media/v4l/dev-subdev.rst    | 165 ++++++++++++++++++
>>   2 files changed, 173 insertions(+)
>>
>> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
>> index 115211cef4d1..80654f1bcac9 100644
>> --- a/Documentation/driver-api/media/v4l2-subdev.rst
>> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
>> @@ -593,6 +593,14 @@ before calling v4l2_subdev_init_finalize():
>>
>>   This shares the driver's private mutex between the controls and the states.
>>
>> +Streams, multiplexed media pads and internal routing
>> +----------------------------------------------------
>> +
>> +A subdevice driver can implement support for multiplexed streams by setting
> 
> Let me start by being picky with a minor thing: the rest of the
> documentation seems to use "sub-device". Here you have "sub-device",
> "subdevice" and "subdev". I think "sub-device" should be used
> everywhere

I can see lots of all those three in the docs, so I don't really know 
which one to pick...

>> +the V4L2_SUBDEV_FL_MULTIPLEXED subdev flag and implementing support for
>> +centrally managed subdev active state, routing and stream based
>> +configuration.
>> +
>>   V4L2 sub-device functions and data structures
>>   ---------------------------------------------
>>
>> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
>> index a67c2749089a..fd042afeddd6 100644
>> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
>> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
>> @@ -503,3 +503,168 @@ source pads.
>>       :maxdepth: 1
>>
>>       subdev-formats
>> +
>> +Streams, multiplexed media pads and internal routing
>> +----------------------------------------------------
>> +
>> +Commonly V4L2 subdevices support only separate video streams, that is, each
>> +link in the media graph and each pad in a subdevice pass through a single
>> +video stream. Thus each pad contains a format configuration for that single
> 
> Isn't it the other way around ? A single video stream passes through a
> media link.

It's a bit confusing. I meant "pass through" as in "each link and pad 
let a single stream pass through". How about:

Commonly V4L2 subdevices support only separate video streams, that is, 
only a single stream can pass through a media link and a media pad.

>> +stream. In some cases a subdev can do stream processing and split a stream
>> +into two or compose two streams into one, but the inputs and outputs for the
>> +subdev are still a single stream per pad.
>> +
>> +Some hardware, e.g. MIPI CSI-2, support multiplexed streams, that is, a single
>> +bus carries multiple streams. Thus a camera could output two streams, a pixel
>> +stream and a metadata stream, and a bridge subdev could route the streams
>> +from multiple input pads into a single output pad.
> 
> I would use sink/source and not input/output and slightly rephrase
> this, because I understand your "bridge subdev" in this example is a
> CSI-2 transmitter but "bridge" usually refers to receiver drivers on
> the SoC.

Ok. In DRM, bridges are not the display controllers in the SoC, but the 
"bridges" between the SoC and the panel.

> What about
> 
> Some hardware, e.g. MIPI CSI-2, support multiplexed streams, that is,
> multiple data streams are transmitted on the same bus, which is
> represented by a media link connecting a transmitter source pad with a
> sink pad on the receiver. In example, a camera sensor can produce two
> distinct streams, a pixel stream and a metadata stream, which are
> transmitted on the multiplexed data bus, represented by a media link
> which connects the single sensor's source pad with the receiver sink
> pad. The stream-aware receiver will de-multiplex the streams received
> on the its sink pad and allows to route them individually to one of
> its source pads.

This sounds fine.

>            Sensor                   Receiver
>          +----------+           +--------------+
>          |  Pixel   |           |  ___________(1)
>          |       \_(0) --------(0)/            |
>          |  Meta /  |           | \___________(2)
>          |          |           |              |
>          +----------+           +---------------
> 
> (not sure if makes sense to have a drawing here, but... )
> 
>> +
>> +Subdevice drivers that support multiplexed streams are compatible with
>> +non-multiplexed subdev drivers, but, of course, require a routing configuration
>> +where the link between those two types of drivers contains only a single
>> +stream.
>> +
>> +Understanding streams
>> +^^^^^^^^^^^^^^^^^^^^^
>> +
>> +A stream is a stream of content (e.g. pixel data or metadata) flowing through
>> +the media pipeline from a source (e.g. a sensor) towards the final sink(e.g. a
> 
> space between "sink("
> 
>> +receiver and demultiplexer in a SoC). Each media link carries all the streams
> 
> the enabled streams ?
> 
>> +from one end of the link to the other, and subdevices have routing tables which
>> +describe how the incoming streams from sink pads are routed to the source
>> +pads.
> 
> "... from sink pad", singular..

No, the routing table describes how the streams from the sink pads are 
routed to the source pads. Why would it be singular?

> I would rather say "how the incoming streams from the multiplexed sink
> pad are routed to source pads".
> 
>> +
>> +A stream ID (often just "stream") is a media link-local identifier for a
>> +stream. In other words, a configuration for a particular stream ID must exist
> 
> s/In other words//

Why would you remove it? The sentence explains the previous sentence in 
a more verbose way.

> Should the configuration on both ends of the link also be identical ?

If you refer to the format etc. config, the same rules apply here as for 
non-multiplexed case. I'm not sure if they need to be identical, but 
they have to match. But I'm not really talking about configuration here.

>> +on both sides of a media link, but another stream ID can be used for the same
>> +stream at the other side of the subdevice.
> 
> I would
> 
> A stream ID (often just "stream") is a media link-local identifier for a
> stream. The configuration for a stream ID must exist and be identical
> on both ends of a media link connecting two multiplexed pads.

You're describing a different thing there. I'm talking about the stream 
IDs. I think it becomes clearer if I remove "a configuration for". So:

> A stream ID (often just "stream") is a media link-local identifier for a stream.
> In other words, a particular stream ID must exist on both sides of a media
> link, but another stream ID can be used for the same stream at the other side
> of the subdevice.

So it's explaining the stream IDs, how a single stream can be 
represented by multiple stream IDs.

> and leave the bits about routing out ?
> 
>> +
>> +A stream at a specific point in the media pipeline is identified with the
>> +subdev and a (pad, stream) pair. For subdevices that do not support
>> +multiplexed streams the 'stream' is always 0.
>> +
>> +Configuring streams
>> +^^^^^^^^^^^^^^^^^^^
>> +
>> +The configuration of the streams is done individually for each subdevice and
>> +the validity of the streams between subdevices is validated when the pipeline
>> +is started.
>> +
>> +There are three steps in configuring the streams:
>> +
>> +1) Set up links. Connect the pads between subdevices using the :ref:`Media
>> +Controller API <media_controller>`
>> +
>> +2) Routing. The routing table for the subdevice must be set with
>> +:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that
>> +setting the routing table will reset all the stream configurations.
> 
> "stream configurations in a media entity".

Ok.

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
> 
> a single source pad (pad 0) which carries two streams: a pixel data
> stream and a metadata stream.

Ok.

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
>> +(i.e. route endpoint) instead of just a pad.
>> +
>> +A common way to accomplish this is to start from the sensors and propagate the
>> +configurations along the stream towards the receiver, using VIDIOC_SUBDEV_S_FMT
> 
> using the :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls
> 
>> +to configure each stream endpoint in each subdev.
> 
> All minors or just suggestions:
> 
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks!

  Tomi
