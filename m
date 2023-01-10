Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C67A9663F36
	for <lists+linux-media@lfdr.de>; Tue, 10 Jan 2023 12:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbjAJL0R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Jan 2023 06:26:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbjAJL0O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Jan 2023 06:26:14 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8868F025
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 03:26:12 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E67F74D4;
        Tue, 10 Jan 2023 12:26:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673349970;
        bh=QzKeWhzGnzTDRbYjjkcep8PlWlIeq6tghcJeelwDM5E=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=QLPdvaaLj5F1UagjkF1t3IYauWW9Ez50CzMUcCfPOf95cPfk7UNRx3kd3S4W4sWVX
         yMlDraaNAwddUzxTFGim4cE2i122TT/TZV0KuZMrQY1bc3PCBgy+Eh1OF3wUb3IzdL
         riG7D4PDNwoXbHimzTY8lcrbb3ojWkRRCTYqYU+M=
Message-ID: <e97557a5-a44c-00bb-c247-71565c344f31@ideasonboard.com>
Date:   Tue, 10 Jan 2023 13:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/1] media: Documentation: Update documentation for
 streams
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20221215121634.287100-1-tomi.valkeinen@ideasonboard.com>
 <20230110091707.2003226-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230110091707.2003226-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/01/2023 11:17, Sakari Ailus wrote:
> Document how streams interacts with formats and selections.
> 
> Update documentation in respect to what is allowed, in particular streams
> are only supported via full routes, source-only routes are not supported
> right now.
> 
> The centerpiece of the API additions are streams. Albeit routes are
> configured via S_ROUTING IOCTL that also declares streams, it is streams
> that are accessed through other APIs. Thus refer to streams instead of
> routes in documentation.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Hi folks,
> 
> This replaces my earlier documetation patch. The commit message and the
> subject have changed and the content reflects this. Largely this means
> removing a few features of the interface --- for now.
> 
> The intent is to be able to merge this very soon, thus those portions that
> are still debated have been dropped (no more dependencies between streams,
> for instance).
> 
>   .../userspace-api/media/v4l/dev-subdev.rst    | 121 +++++++++---------
>   1 file changed, 58 insertions(+), 63 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index 072e82b2b2786..d2badf21a62cd 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -406,6 +406,8 @@ pixel array is not rectangular but cross-shaped or round. The maximum
>   size may also be smaller than the BOUNDS rectangle.
>   
>   
> +.. _format-propagation:
> +
>   Order of configuration and format propagation
>   ---------------------------------------------
>   
> @@ -507,12 +509,12 @@ source pads.
>   Streams, multiplexed media pads and internal routing
>   ----------------------------------------------------
>   
> -Commonly V4L2 subdevices support only separate video streams, that is, only a
> -single stream can pass through a media link and a media pad. Thus each pad
> -contains a format configuration for that single stream. In some cases a subdev
> -can do stream processing and split a stream into two or compose two streams
> -into one, but the inputs and outputs for the subdev are still a single stream
> -per pad.
> +Simple V4L2 subdevices do not support multiple, unrelated video streams,
> +and only a single stream can pass through a media link and a media pad.
> +Thus each pad contains a format and selection configuration for that
> +single stream. A subdev can do stream processing and split a stream into
> +two or compose two streams into one, but the inputs and outputs for the
> +subdev are still a single stream per pad.
>   
>   Some hardware, e.g. MIPI CSI-2, support multiplexed streams, that is, multiple
>   data streams are transmitted on the same bus, which is represented by a media
> @@ -539,14 +541,35 @@ streams from one end of the link to the other, and subdevices have routing
>   tables which describe how the incoming streams from sink pads are routed to the
>   source pads.
>   
> -A stream ID (often just "stream") is a media link-local identifier for a stream.
> -In other words, a particular stream ID must exist on both sides of a media
> +A stream ID is a media pad-local identifier for a stream. Streams IDs of
> +the same stream must be equal on both ends of a link. In other words,
> +a particular stream ID must exist on both sides of a media
>   link, but another stream ID can be used for the same stream at the other side
> -of the subdevice.
> +of the subdevice. The same stream ID is used to refer to the stream on
> +both pads of the link on all ioctls operating on pads.

This sentence feels a bit confusing. What's it trying to say? That the 
same Stream ID has to be on the pads on both sides of the link? Wasn't 
that already covered earlier?

> +A stream at a specific point in the media pipeline is identified by the
> +sub-devdev and a (pad, stream) pair. For subdevices that do not support

Typo there in "sub-devdev". Also, there seems to be a lot of 
"sub-device" and "subdevice" words in the text. Which one is it?

> +multiplexed streams the 'stream' field is always 0.
> +
> +Interaction between routes, streams, formats and selections
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The addition of streams to the V4L2 sub-device interface moves the sub-device
> +formats and selections from pads to (pad, stream) pairs. Besides the
> +usual pad, also the stream ID needs to be provided for setting formats and

Here, and already earlier, you first say "stream" and then "stream ID". 
Are they the same thing? You removed my "stream ID (often just 
"stream")" text, which I had included to clarify that those two terms 
are interchangeable in certain contexts where it's obvious.

> +selections. The order of configuring formats and selections along a stream is
> +the same as without streams (see :ref:`format-propagation`).
> +
> +Instead of the sub-device wide merging of streams from all source pads
> +towards all sink pads, data flows for each route are separate from each

Shouldn't the above be from sink pads towards source pads?

> +other. Any number of routes from streams on sink pads towards streams on
> +source pads is allowed, to the extent supported by drivers. For every
> +stream on a sink pad, however, only a single route is allowed.

I don't follow here. Don't you first say that any number of routes is 
ok, then you say only a single route is ok?

> -A stream at a specific point in the media pipeline is identified with the
> -subdev and a (pad, stream) pair. For subdevices that do not support
> -multiplexed streams the 'stream' is always 0.
> +Any configurations of a stream within a pad, such as format or selections,
> +are independent of similar configurations on other streams. This is
> +subject to change in the future.

Hmm, what does this mean? Isn't this device specific? The format for a 
video stream will affect the format for a metadata stream from the same 
source.

>   Configuring streams
>   ^^^^^^^^^^^^^^^^^^^
> @@ -560,34 +583,37 @@ There are three steps in configuring the streams:
>   1) Set up links. Connect the pads between subdevices using the :ref:`Media
>   Controller API <media_controller>`
>   
> -2) Routing. The routing table for the subdevice must be set with
> +2) Streams. Streams are declared and their routing is configured by
> +setting the routing table for the subdevice must be set with

Hmm, maybe s/must be set with/using/

>   :ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that
> -setting the routing table will reset all the stream configurations in a media
> -entity.
> +setting the routing table will reset formats and selections in the
> +sub-device to default values.
>   
> -3) Configure streams. Each route endpoint must be configured
> -with :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`.
> +3) Configure formats and selections. Formats and selections of each stream
> +are configured separately as documented for plain subdevices in
> +:ref:`<format-propagation>`. The stream ID is set to the same stream ID
> +associated with either sink or source pads of routes configured using the
> +:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.

Is this trying to say that the stream ID numbers used in the 
VIDIOC_SUBDEV_G_ROUTING call are the same used in the format and 
selection configuration? Isn't that obvious already? I at least find the 
sentence a bit confusing.

>   Multiplexed streams setup example
>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   
>   A simple example of a multiplexed stream setup might be as follows:
>   
> -- Two identical sensors (Sensor A and Sensor B). Each sensor has a single source
> -  pad (pad 0) which carries two streams, pixel data stream and metadata
> -  stream.
> +- Two identical sensors (Sensor A and Sensor B). The sensors produce image
> +  data only and hence do not need specific support for streams.

Hmm, I have already changed all this in the v16, and I think I had other 
changes in the docs too. What's this patch based on?

>   - Multiplexer bridge (Bridge). The bridge has two sink pads, connected to the
> -  sensors (pads 0, 1), and one source pad (pad 2), which outputs all 4
> -  streams.
> +  sensors (pads 0, 1), and one source pad (pad 2), which outputs both of
> +  the streams.
>   
>   - Receiver in the SoC (Receiver). The receiver has a single sink pad (pad 0),
>     connected to the bridge, and four source pads (pads 1-4), going to the DMA
> -  engine. The receiver demultiplexes the incoming streams to the four source
> +  engine. The receiver demultiplexes the incoming streams to two the source
>     pads.
>   
>   - Four DMA Engines in the SoC (DMA Engine). Each DMA engine is connected to a
> -  single source pad in the receiver.
> +  single source pad in the receive via a link, two of which are active.
>   
>   The sensors, the bridge and the receiver are modeled as V4L2 subdevices,
>   exposed to userspace via /dev/v4l-subdevX device nodes. The DMA engines are
> @@ -599,23 +625,7 @@ To configure this pipeline, the userspace must take the following steps:
>   bridge to the receiver, and the receiver to the DMA engines. This step does
>   not differ from normal non-multiplexed media controller setup.
>   
> -2) Configure routing.
> -
> -.. flat-table:: Sensor routing table (identical on both sensors)
> -    :header-rows:  1
> -
> -    * - Sink Pad/Stream
> -      - Source Pad/Stream
> -      - Routing Flags
> -      - Comments
> -    * - 0/0 (unused)
> -      - 0/0
> -      - V4L2_SUBDEV_ROUTE_FL_ACTIVE | V4L2_SUBDEV_ROUTE_FL_SOURCE_ONLY
> -      - Pixel data stream. Source route, i.e. the sink fields are unused.
> -    * - 0/0 (unused)
> -      - 0/1
> -      - V4L2_SUBDEV_ROUTE_FL_ACTIVE | V4L2_SUBDEV_ROUTE_FL_SOURCE_ONLY
> -      - Metadata stream. Source route, i.e. the sink fields are unused.
> +2) Configure routing
>   
>   .. flat-table:: Bridge routing table
>       :header-rows:  1
> @@ -628,18 +638,10 @@ not differ from normal non-multiplexed media controller setup.
>         - 2/0
>         - V4L2_SUBDEV_ROUTE_FL_ACTIVE
>         - Pixel data stream from Sensor A
> -    * - 0/1
> -      - 2/1
> -      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> -      - Metadata stream from Sensor A
>       * - 1/0
> -      - 2/2
> +      - 2/1
>         - V4L2_SUBDEV_ROUTE_FL_ACTIVE
>         - Pixel data stream from Sensor B
> -    * - 1/1
> -      - 2/3
> -      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> -      - Metadata stream from Sensor B
>   
>   .. flat-table:: Receiver routing table
>       :header-rows:  1
> @@ -655,22 +657,15 @@ not differ from normal non-multiplexed media controller setup.
>       * - 0/1
>         - 2/0
>         - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> -      - Metadata stream from Sensor A
> -    * - 0/2
> -      - 3/0
> -      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
>         - Pixel data stream from Sensor B
> -    * - 0/3
> -      - 4/0
> -      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> -      - Metadata stream from Sensor B
>   
> -3) Configure streams
> +3) Configure formats and selections
>   
> -After configuring the routing table, the next step is configuring the streams.
> -This step is similar to configuring the pads in a non-multiplexed streams
> -setup, with the difference that we need to configure each (pad, stream) pair
> -(i.e. route endpoint) instead of just a pad.
> +After configuring the routing table, the next step is configuring the
> +formats and selections for the streams. This step is similar to
> +configuring the pads in a non-multiplexed streams setup, with the

As you say "configuring the formats and selections for the streams", 
maybe similarly you could say "is similar to configuring the formats and 
selections for the pads".

> +difference that we need to configure each (pad, stream) pair instead of
> +just a pad.

Do we "configure the streams/pads", or do we "configure the formats and 
selections for the streams/pads"?

  Tomi

