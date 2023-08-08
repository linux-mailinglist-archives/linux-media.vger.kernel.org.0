Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD137740FE
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 19:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234155AbjHHRNO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 13:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232555AbjHHRMh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 13:12:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014411BAF9
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 09:05:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 37B4D62414
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 08:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC4CC433C8;
        Tue,  8 Aug 2023 08:55:25 +0000 (UTC)
Message-ID: <b91681ec-89e0-4347-c289-51498d8b3788@xs4all.nl>
Date:   Tue, 8 Aug 2023 10:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 10/10] media: uapi: v4l: Document source routes
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-11-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230808075538.3043934-11-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/08/2023 09:55, Sakari Ailus wrote:
> Document how internal pads are used on source routes.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/dev-subdev.rst    | 179 ++++++++++++++++++
>  1 file changed, 179 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index b023918177b5..27b0fe2dc83a 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -551,6 +551,27 @@ A stream at a specific point in the media pipeline is identified by the
>  sub-device and a (pad, stream) pair. For sub-devices that do not support
>  multiplexed streams the 'stream' field is always 0.
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
> +/Source routes/ are routes from an internal sink pad to a(n external) source

'/Source routes/' appears just like that in the generated documentation, that's
probably not what you intended.

> +pad. Generally source routes are not modifiable but they can be activated and
> +deactivated using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +<v4l2-subdev-routing-flags>` flag, depending on driver capabilities.
> +
>  Interaction between routes, streams, formats and selections
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  
> @@ -666,3 +687,161 @@ A common way to accomplish this is to start from the sensors and propagate the
>  configurations along the stream towards the receiver,
>  using :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
>  stream endpoint in each sub-device.
> +
> +Internal pads setup example
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +A simple example of a multiplexed stream setup might be as follows:
> +
> +- A CCS camera sensor source sub-device, with one sink pad (0), one source pad

Explain what 'CCS' means: probably a link to MIPI CCS is sufficient, but for newbies
'CCS' doesn't provide any information.

> +  (1), an internal sink pad (2) that represents the source of embedded

So since the INTERNAL flag is associated with a sink pad, this is now called an
'internal sink' instead of 'internal source' as it was before. I agree with that,
but note that the phrase 'internal source' is still used in several places,
including the cover letter. For the next version you post, please check for that
and change the terminology since mixing the two is very confusing :-)

> +  data. There are two routes, one from the sink pad to the source, and another
> +  from the internal sink pad to the source pad. The embedded data stream needs
> +  to be enabled by activating the related route. The configuration of the rest
> +  of the CCS sub-devices is omitted from this example.
> +
> +- Multiplexer bridge (Bridge). The bridge has one sink pad, connected to the
> +  sensor (pad 0), and one source pad (pad 1), which outputs two streams.
> +
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

Huh? It is a sensor subdev, so aren't both pixel data and metadata
coming from an internal sink?

I think you are actually describing the internal subdev of a CCS
sensor here, but that is not clear from the description at all.

Since CCS sensors are relatively common (I think), it might be
good to give a fully fledged example.

But suppose you have a non-CCS sensor that generates the pixel data
and metadata, then you would have two internal sink pads and one
source pad for two streams, right?

And very simple sensors that currently just have a single source pad
could be describes as having an internal sink pad connected to the
source pad by a fixed route. But we don't do that, because it is
overkill. Correct? If so, then this might be useful information to add
to answer the question why some sensors have internal sinks and others
do not.

> +    * - 2/0
> +      - 1/1
> +      - **V4L2_SUBDEV_ROUTE_FL_ACTIVE**
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
> +The options available in sensor's routing configuration are dictated by hardware
> +capabilities: typically camera sensors always produce image data stream while
> +the embedded data stream typically can be either enabled or disabled.
> +
> +3) Configure formats and selections
> +
> +This example assumes that the formats are propagated from sink pad to the source
> +pad as-is. The tables contain fields of both struct v4l2_subdev_format and
> +struct v4l2_mbus_framefmt. The full configuration of CCS camera sensor is out of
> +scope of this example.
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
> +    * - :rspan:`3` Camera sensor sub-device (CCS source sub-device)
> +      - 0/0
> +      - 640
> +      - 480
> +      - MEDIA_BUS_FMT_SGRBG10
> +    * - 1/0
> +      - 640
> +      - 480
> +      - **MEDIA_BUS_FMT_SGRBG10**
> +    * - 2/0
> +      - 640
> +      - 2
> +      - MEDIA_BUS_FMT_CCS_EMBEDDED_10
> +    * - 1/1
> +      - 640
> +      - 2
> +      - MEDIA_BUS_FMT_META_10
> +    * - :rspan:`3` Bridge
> +      - 0/0
> +      - **640**
> +      - **480**
> +      - **MEDIA_BUS_FMT_SGRBG10**
> +    * - 1/0
> +      - 640
> +      - 480
> +      - MEDIA_BUS_FMT_SGRBG10
> +    * - 0/1
> +      - **640**
> +      - **2**
> +      - **MEDIA_BUS_FMT_META_10**
> +    * - 1/1
> +      - 640
> +      - 2
> +      - MEDIA_BUS_FMT_META_10
> +    * - :rspan:`3` Receiver
> +      - 0/0
> +      - **640**
> +      - **480**
> +      - **MEDIA_BUS_FMT_SGRBG10**
> +    * - 1/0
> +      - 640
> +      - 480
> +      - MEDIA_BUS_FMT_SGRBG10
> +    * - 0/1
> +      - **640**
> +      - **2**
> +      - **MEDIA_BUS_FMT_META_10**
> +    * - 2/0
> +      - 640
> +      - 2
> +      - MEDIA_BUS_FMT_META_10
> +
> +The embedded data format does not need to be configured as the format is
> +dictated by the pixel data format in this case.

Regards,

	Hans
