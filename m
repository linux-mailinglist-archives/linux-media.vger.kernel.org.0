Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 291666671A9
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 13:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234855AbjALMHi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 07:07:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbjALMGt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 07:06:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C5E3E842
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 04:01:45 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2A70832;
        Thu, 12 Jan 2023 13:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673524903;
        bh=Xab481CDEN6scDR8NioFnm321cJBdbf2avTTra2jt0Q=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=XfMeS9zTH8IMiCmfuKWSxHUp3V9E0jsU7MWMdnSjaULiceBUjhrIQPrk6pBYnZ1ki
         RCgBXrBRgUMNCv7z/JM4hQr3hGvHCn97ifpT1/IL31PJJ/iKlLHtaAAYLAWzCo6HTk
         JDniQ+HZX2Xtc/E/9b7sDJncyHCM86o0I73AybSI=
Message-ID: <05cdffdc-4e67-7fa5-c1d6-c1c711da8e00@ideasonboard.com>
Date:   Thu, 12 Jan 2023 14:01:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/1] media: Documentation: Update documentation for
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
 <20230112114848.2005581-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230112114848.2005581-1-sakari.ailus@linux.intel.com>
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

On 12/01/2023 13:48, Sakari Ailus wrote:
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

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

> ---
> since v2:
> 
> - Include sub-device term alignment changes and rewrite of the 3rd point
>    of stream-based configuration missed in v2.
> 
>   .../userspace-api/media/v4l/dev-subdev.rst    | 84 ++++++++++++-------
>   1 file changed, 55 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index 7d1b8ebd4e173..51cae93e4c527 100644
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
> +Simple V4L2 sub-devices do not support multiple, unrelated video streams,
> +and only a single stream can pass through a media link and a media pad.
> +Thus each pad contains a format and selection configuration for that
> +single stream. A subdev can do stream processing and split a stream into
> +two or compose two streams into one, but the inputs and outputs for the
> +subdev are still a single stream per pad.
>   
>   Some hardware, e.g. MIPI CSI-2, support multiplexed streams, that is, multiple
>   data streams are transmitted on the same bus, which is represented by a media
> @@ -535,38 +537,62 @@ Understanding streams
>   A stream is a stream of content (e.g. pixel data or metadata) flowing through
>   the media pipeline from a source (e.g. a sensor) towards the final sink (e.g. a
>   receiver and demultiplexer in a SoC). Each media link carries all the enabled
> -streams from one end of the link to the other, and subdevices have routing
> +streams from one end of the link to the other, and sub-devices have routing
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
> +of the sub-device.
> +
> +A stream at a specific point in the media pipeline is identified by the
> +sub-device and a (pad, stream) pair. For sub-devices that do not support
> +multiplexed streams the 'stream' field is always 0.
> +
> +Interaction between routes, streams, formats and selections
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The addition of streams to the V4L2 sub-device interface moves the sub-device
> +formats and selections from pads to (pad, stream) pairs. Besides the
> +usual pad, also the stream ID needs to be provided for setting formats and
> +selections. The order of configuring formats and selections along a stream is
> +the same as without streams (see :ref:`format-propagation`).
> +
> +Instead of the sub-device wide merging of streams from all sink pads
> +towards all source pads, data flows for each route are separate from each
> +other. Any number of routes from streams on sink pads towards streams on
> +source pads is allowed, to the extent supported by drivers. For every
> +stream on a source pad, however, only a single route is allowed.
>   
> -A stream at a specific point in the media pipeline is identified with the
> -subdev and a (pad, stream) pair. For subdevices that do not support
> -multiplexed streams the 'stream' is always 0.
> +Any configurations of a stream within a pad, such as format or selections,
> +are independent of similar configurations on other streams. This is
> +subject to change in the future.
>   
>   Configuring streams
>   ^^^^^^^^^^^^^^^^^^^
>   
> -The configuration of the streams is done individually for each subdevice and
> -the validity of the streams between subdevices is validated when the pipeline
> +The configuration of the streams is done individually for each sub-device and
> +the validity of the streams between sub-devices is validated when the pipeline
>   is started.
>   
>   There are three steps in configuring the streams:
>   
> -1) Set up links. Connect the pads between subdevices using the :ref:`Media
> +1) Set up links. Connect the pads between sub-devices using the :ref:`Media
>   Controller API <media_controller>`
>   
> -2) Routing. The routing table for the subdevice must be set with
> +2) Streams. Streams are declared and their routing is configured by
> +setting the routing table for the sub-device using
>   :ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that
> -setting the routing table will reset all the stream configurations in a media
> -entity.
> +setting the routing table will reset formats and selections in the
> +sub-device to default values.
>   
> -3) Configure streams. Each route endpoint must be configured
> -with :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`.
> +3) Configure formats and selections. Formats and selections of each stream
> +are configured separately as documented for plain sub-devices in
> +:ref:`<format-propagation>`. The stream ID is set to the same stream ID
> +associated with either sink or source pads of routes configured using the
> +:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
>   
>   Multiplexed streams setup example
>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> @@ -586,7 +612,7 @@ A simple example of a multiplexed stream setup might be as follows:
>   - DMA Engines in the SoC (DMA Engine), one for each stream. Each DMA engine is
>     connected to a single source pad in the receiver.
>   
> -The sensors, the bridge and the receiver are modeled as V4L2 subdevices,
> +The sensors, the bridge and the receiver are modeled as V4L2 sub-devices,
>   exposed to userspace via /dev/v4l-subdevX device nodes. The DMA engines are
>   modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
>   
> @@ -596,7 +622,7 @@ To configure this pipeline, the userspace must take the following steps:
>   bridge to the receiver, and the receiver to the DMA engines. This step does
>   not differ from normal non-multiplexed media controller setup.
>   
> -2) Configure routing.
> +2) Configure routing
>   
>   .. flat-table:: Bridge routing table
>       :header-rows:  1
> @@ -630,14 +656,14 @@ not differ from normal non-multiplexed media controller setup.
>         - V4L2_SUBDEV_ROUTE_FL_ACTIVE
>         - Pixel data stream from Sensor B
>   
> -3) Configure streams
> +3) Configure formats and selections
>   
> -After configuring the routing table, the next step is configuring the streams.
> -This step is similar to configuring the pads in a non-multiplexed streams
> -setup, with the difference that we need to configure each (pad, stream) pair
> -(i.e. route endpoint) instead of just a pad.
> +After configuring routing, the next step is configuring the formats and
> +selections for the streams. This is similar to performing this step without
> +streams, with just one exception: the ``stream`` field needs to be assigned
> +to the value of the stream ID.
>   
>   A common way to accomplish this is to start from the sensors and propagate the
>   configurations along the stream towards the receiver,
>   using :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
> -stream endpoint in each subdev.
> +stream endpoint in each sub-device.

