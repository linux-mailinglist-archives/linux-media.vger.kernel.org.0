Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC917B9F51
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 16:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234198AbjJEOVm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 10:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbjJEOTs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 10:19:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E6D126A4B
        for <linux-media@vger.kernel.org>; Thu,  5 Oct 2023 05:37:08 -0700 (PDT)
Received: from [192.168.88.20] (91-157-153-81.elisa-laajakaista.fi [91.157.153.81])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92AF29C4;
        Thu,  5 Oct 2023 14:35:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696509319;
        bh=gG2f73NRyKP8UbUGqyMUimz1D3WybHYqoRn3UW5CFO0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=V+QQ7CkzajV6j1QgLP2abq3qKnXbu5rbUqDfhas6fsnUux2kb2s2HEY1vMm9ZEujV
         pLod3Sj9ksIIxF5BwLY5ty65Z27m8RBE96MZ5J/tMz2OoJLGqe9ZE0eE/uqUnGs65G
         wK4x1+akh1bn4BhMznySvcc1QGKxBlIPPWwfjXpA=
Message-ID: <46ccf3be-5948-c458-5736-6ab103fc826d@ideasonboard.com>
Date:   Thu, 5 Oct 2023 15:37:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 10/28] media: Documentation: v4l: Document source
 routes
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003120813.77726-1-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20231003120813.77726-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/10/2023 15:07, Sakari Ailus wrote:
> Document how internal pads are used on source routes. Use the IMX219
> camera sensor as an example.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   .../userspace-api/media/v4l/dev-subdev.rst    | 179 ++++++++++++++++++
>   1 file changed, 179 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index a387e8a15b8d..fb73a95401c3 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
>   sub-device and a (pad, stream) pair. For sub-devices that do not support
>   multiplexed streams the 'stream' field is always 0.
>   
> +.. _v4l2-subdev-source-routes:
> +
> +Internal pads and source routes
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Cases where a single sub-device source pad is traversed by multiple streams one
> +or more of which originate from within the sub-device itself are special as
> +there is no external sink pad for such routes. In those cases, the sources of
> +the internally generated streams are represented by internal sink pads, which
> +are sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
> +pad flag set.
> +
> +Internal pads have all the properties of an external pad, including formats and
> +selections. The format in this case is the source format of the stream. An
> +internal pad always has a single stream only (0).
> +
> +*Source routes* are routes from an internal sink pad to an external source
> +pad. In most cases source routes are not modifiable but they can be activated
> +and deactivated using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +<v4l2-subdev-routing-flags>` flag, depending on driver capabilities.
> +
>   Interaction between routes, streams, formats and selections
>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   
> @@ -668,3 +689,161 @@ To configure this pipeline, the userspace must take the following steps:
>      the configurations along the stream towards the receiver, using
>      :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
>      stream endpoint in each sub-device.
> +
> +Internal pads setup example
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +A simple example of a multiplexed stream setup might be as follows:
> +
> +- A CCS camera sensor source sub-device, with one sink pad (0), one source pad
> +  (1), an internal sink pad (2) that represents the source of embedded

Wouldn't a simpler and better example be a sensor with a single 
sub-device, with two internal pads and one external pad? Now your 
example is a partial example, as the sensor subdevice has a external 
sink pad connected to something which is not covered in the example.

Or is part of the point here to show an example with a subdevice with 
both internal and external sink pads?

> +  data. There are two routes, one from the sink pad to the source, and another
> +  from the internal sink pad to the source pad. The embedded data stream needs
> +  to be enabled by activating the related route. The configuration of the rest
> +  of the CCS sub-devices is omitted from this example.
> +
> +- Multiplexer bridge (Bridge). The bridge has one sink pad, connected to the
> +  sensor (pad 0), and one source pad (pad 1), which outputs two streams.

What does it multiplex if there's a single input and a single output?

> +- Receiver in the SoC (Receiver). The receiver has a single sink pad (pad 0),
> +  connected to the bridge, and two source pads (pads 1-2), going to the DMA
> +  engine. The receiver demultiplexes the incoming streams to the source pads.
> +
> +- DMA Engines in the SoC (DMA Engine), one for each stream. Each DMA engine is
> +  connected to a single source pad in the receiver.
> +
> +The sensor, the bridge and the receiver are modeled as V4L2 sub-devices,
> +exposed to userspace via /dev/v4l-subdevX device nodes. The DMA engines are
> +modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
> +
> +To configure this pipeline, the userspace must take the following steps:
> +
> +1) Set up media links between entities: connect the sensors to the bridge,
> +   bridge to the receiver, and the receiver to the DMA engines. This step does
> +   not differ from normal non-multiplexed media controller setup.
> +
> +2) Configure routing
> +
> +.. flat-table:: Camera sensor
> +    :header-rows: 1
> +
> +    * - Sink Pad/Stream
> +      - Source Pad/Stream
> +      - Routing Flags
> +      - Comments
> +    * - 0/0
> +      - 1/0
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Pixel data stream from the sink pad
> +    * - 2/0
> +      - 1/1
> +      - **V4L2_SUBDEV_ROUTE_FL_ACTIVE**

Why is this one bold?

> +      - Metadata stream from the internal sink pad
> +
> +.. flat-table:: Bridge routing table
> +    :header-rows: 1
> +
> +    * - Sink Pad/Stream
> +      - Source Pad/Stream
> +      - Routing Flags
> +      - Comments
> +    * - 0/0
> +      - 1/0
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Pixel data stream from camera sensor
> +    * - 0/1
> +      - 1/1
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Metadata stream from camera sensor
> +
> +.. flat-table:: Receiver routing table
> +    :header-rows:  1
> +
> +    * - Sink Pad/Stream
> +      - Source Pad/Stream
> +      - Routing Flags
> +      - Comments
> +    * - 0/0
> +      - 1/0
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Pixel data stream from camera sensor
> +    * - 0/1
> +      - 2/0
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Metadata stream from camera sensor
> +
> +The options available in sensor's routing configuration are dictated by
> +hardware capabilities: typically camera sensors always produce image data
> +stream while the embedded data stream typically can be either enabled or
> +disabled.
> +
> +3) Configure formats and selections
> +
> +   This example assumes that the formats are propagated from sink pad to the
> +   source pad as-is. The tables contain fields of both struct v4l2_subdev_format
> +   and struct v4l2_mbus_framefmt.
> +
> +.. flat-table:: Formats set on the sub-devices. Bold values are set, others are
> +                static or propagated.
> +    :header-rows: 1
> +    :fill-cells:
> +
> +    * - Sub-device
> +      - Pad/Stream
> +      - Width
> +      - Height
> +      - Code
> +    * - :rspan:`3` Camera sensor sub-device (IMX219)
> +      - 1/0
> +      - 3296
> +      - 2480
> +      - MEDIA_BUS_FMT_SRGGB10
> +    * - 0/0

I think the 0/0 stream should be the first one in the table.

> +      - **3296**
> +      - **2480**
> +      - **MEDIA_BUS_FMT_SRGGB10**
> +    * - 2/0
> +      - 3296
> +      - 2
> +      - MEDIA_BUS_FMT_IMX219_EMBEDDED
> +    * - 1/1
> +      - 3296
> +      - 2
> +      - MEDIA_BUS_FMT_META_10
> +    * - :rspan:`3` Bridge
> +      - 0/0
> +      - **3296**
> +      - **2480**
> +      - **MEDIA_BUS_FMT_SRGGB10**
> +    * - 1/0
> +      - 3296
> +      - 2480
> +      - MEDIA_BUS_FMT_SRGGB10
> +    * - 0/1
> +      - **3296**
> +      - **2**
> +      - **MEDIA_BUS_FMT_META_10**
> +    * - 1/1
> +      - 3296
> +      - 2
> +      - MEDIA_BUS_FMT_META_10
> +    * - :rspan:`3` Receiver
> +      - 0/0
> +      - **3296**
> +      - **2480**
> +      - **MEDIA_BUS_FMT_SRGGB10**
> +    * - 1/0
> +      - 3296
> +      - 2480
> +      - MEDIA_BUS_FMT_SRGGB10
> +    * - 0/1
> +      - **3296**
> +      - **2**
> +      - **MEDIA_BUS_FMT_META_10**
> +    * - 2/0
> +      - 3296
> +      - 2
> +      - MEDIA_BUS_FMT_META_10
> +
> +The embedded data format does not need to be configured as the format is
> +dictated by the pixel data format in this case.

