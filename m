Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 545667BE7E0
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 19:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377914AbjJIR0a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 13:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377887AbjJIR00 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 13:26:26 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5052DCF
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 10:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696872383; x=1728408383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j1RFWkhh/NeItYjsURAFnKG5hSpcm57bK05xhzjjv+c=;
  b=oDPNvFJ43uDfi6tvwr4DKEnp8rvEFaZGSlH+cfQwTrlEEUkD3ZS/TNJx
   spKC930CEz+18w2dZMFGvQ1THDqsq6zXTNBhgrY9HRexuIUXtYNv9YRFO
   tqYX3WZ2ijMttCGrpR/b/unDFXuBek937w02jC610p5MnFqVdiSaj+57K
   p4pVLPeXLnqWT5Ns2nhAPR50ASsQHKSuRDX7987ET++44A8Sg5ARe5yNA
   Up7CV3r+CdvmRF9KDMjP/n1G3mmrQ0ktVVqjL6gqv6Cu7RIfH4UvJo1sZ
   pt/REq0IrDsCyzMkHXwxlAVArRirrM/w8RK2UR0sDQodC8EKgZLbT4YXE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="450701086"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="450701086"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 10:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="788246664"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="788246664"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 10:26:20 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 4CF5D12023A;
        Mon,  9 Oct 2023 20:26:17 +0300 (EEST)
Date:   Mon, 9 Oct 2023 17:26:17 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 10/28] media: Documentation: v4l: Document source
 routes
Message-ID: <ZSQ3uT6EgpMOD4BJ@kekkonen.localdomain>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003120813.77726-1-sakari.ailus@linux.intel.com>
 <46ccf3be-5948-c458-5736-6ab103fc826d@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46ccf3be-5948-c458-5736-6ab103fc826d@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Thu, Oct 05, 2023 at 03:37:01PM +0300, Tomi Valkeinen wrote:
> On 03/10/2023 15:07, Sakari Ailus wrote:
> > Document how internal pads are used on source routes. Use the IMX219
> > camera sensor as an example.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   .../userspace-api/media/v4l/dev-subdev.rst    | 179 ++++++++++++++++++
> >   1 file changed, 179 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index a387e8a15b8d..fb73a95401c3 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
> >   sub-device and a (pad, stream) pair. For sub-devices that do not support
> >   multiplexed streams the 'stream' field is always 0.
> > +.. _v4l2-subdev-source-routes:
> > +
> > +Internal pads and source routes
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +Cases where a single sub-device source pad is traversed by multiple streams one
> > +or more of which originate from within the sub-device itself are special as
> > +there is no external sink pad for such routes. In those cases, the sources of
> > +the internally generated streams are represented by internal sink pads, which
> > +are sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
> > +pad flag set.
> > +
> > +Internal pads have all the properties of an external pad, including formats and
> > +selections. The format in this case is the source format of the stream. An
> > +internal pad always has a single stream only (0).
> > +
> > +*Source routes* are routes from an internal sink pad to an external source
> > +pad. In most cases source routes are not modifiable but they can be activated
> > +and deactivated using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > +<v4l2-subdev-routing-flags>` flag, depending on driver capabilities.
> > +
> >   Interaction between routes, streams, formats and selections
> >   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > @@ -668,3 +689,161 @@ To configure this pipeline, the userspace must take the following steps:
> >      the configurations along the stream towards the receiver, using
> >      :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
> >      stream endpoint in each sub-device.
> > +
> > +Internal pads setup example
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +A simple example of a multiplexed stream setup might be as follows:
> > +
> > +- A CCS camera sensor source sub-device, with one sink pad (0), one source pad
> > +  (1), an internal sink pad (2) that represents the source of embedded
> 
> Wouldn't a simpler and better example be a sensor with a single sub-device,
> with two internal pads and one external pad? Now your example is a partial
> example, as the sensor subdevice has a external sink pad connected to
> something which is not covered in the example.
> 
> Or is part of the point here to show an example with a subdevice with both
> internal and external sink pads?

Ah. I forgot to change this part of the text --- I'll address this for v7.
There was supposed to be a single sub-device here.

> 
> > +  data. There are two routes, one from the sink pad to the source, and another
> > +  from the internal sink pad to the source pad. The embedded data stream needs
> > +  to be enabled by activating the related route. The configuration of the rest
> > +  of the CCS sub-devices is omitted from this example.
> > +
> > +- Multiplexer bridge (Bridge). The bridge has one sink pad, connected to the
> > +  sensor (pad 0), and one source pad (pad 1), which outputs two streams.
> 
> What does it multiplex if there's a single input and a single output?

The name is probably from the other example --- simply "bridge" is probably
a better name for this.

> 
> > +- Receiver in the SoC (Receiver). The receiver has a single sink pad (pad 0),
> > +  connected to the bridge, and two source pads (pads 1-2), going to the DMA
> > +  engine. The receiver demultiplexes the incoming streams to the source pads.
> > +
> > +- DMA Engines in the SoC (DMA Engine), one for each stream. Each DMA engine is
> > +  connected to a single source pad in the receiver.
> > +
> > +The sensor, the bridge and the receiver are modeled as V4L2 sub-devices,
> > +exposed to userspace via /dev/v4l-subdevX device nodes. The DMA engines are
> > +modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
> > +
> > +To configure this pipeline, the userspace must take the following steps:
> > +
> > +1) Set up media links between entities: connect the sensors to the bridge,
> > +   bridge to the receiver, and the receiver to the DMA engines. This step does
> > +   not differ from normal non-multiplexed media controller setup.
> > +
> > +2) Configure routing
> > +
> > +.. flat-table:: Camera sensor
> > +    :header-rows: 1
> > +
> > +    * - Sink Pad/Stream
> > +      - Source Pad/Stream
> > +      - Routing Flags
> > +      - Comments
> > +    * - 0/0
> > +      - 1/0
> > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > +      - Pixel data stream from the sink pad
> > +    * - 2/0
> > +      - 1/1
> > +      - **V4L2_SUBDEV_ROUTE_FL_ACTIVE**
> 
> Why is this one bold?

Leftover from old CCS example. I'll remove it.

> 
> > +      - Metadata stream from the internal sink pad
> > +
> > +.. flat-table:: Bridge routing table
> > +    :header-rows: 1
> > +
> > +    * - Sink Pad/Stream
> > +      - Source Pad/Stream
> > +      - Routing Flags
> > +      - Comments
> > +    * - 0/0
> > +      - 1/0
> > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > +      - Pixel data stream from camera sensor
> > +    * - 0/1
> > +      - 1/1
> > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > +      - Metadata stream from camera sensor
> > +
> > +.. flat-table:: Receiver routing table
> > +    :header-rows:  1
> > +
> > +    * - Sink Pad/Stream
> > +      - Source Pad/Stream
> > +      - Routing Flags
> > +      - Comments
> > +    * - 0/0
> > +      - 1/0
> > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > +      - Pixel data stream from camera sensor
> > +    * - 0/1
> > +      - 2/0
> > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > +      - Metadata stream from camera sensor
> > +
> > +The options available in sensor's routing configuration are dictated by
> > +hardware capabilities: typically camera sensors always produce image data
> > +stream while the embedded data stream typically can be either enabled or
> > +disabled.
> > +
> > +3) Configure formats and selections
> > +
> > +   This example assumes that the formats are propagated from sink pad to the
> > +   source pad as-is. The tables contain fields of both struct v4l2_subdev_format
> > +   and struct v4l2_mbus_framefmt.
> > +
> > +.. flat-table:: Formats set on the sub-devices. Bold values are set, others are
> > +                static or propagated.
> > +    :header-rows: 1
> > +    :fill-cells:
> > +
> > +    * - Sub-device
> > +      - Pad/Stream
> > +      - Width
> > +      - Height
> > +      - Code
> > +    * - :rspan:`3` Camera sensor sub-device (IMX219)
> > +      - 1/0
> > +      - 3296
> > +      - 2480
> > +      - MEDIA_BUS_FMT_SRGGB10
> > +    * - 0/0
> 
> I think the 0/0 stream should be the first one in the table.

The order here is that of routes: this route is from pad/stream 1/0 to 0/0.

I could add this to the text above.

> 
> > +      - **3296**
> > +      - **2480**
> > +      - **MEDIA_BUS_FMT_SRGGB10**
> > +    * - 2/0
> > +      - 3296
> > +      - 2
> > +      - MEDIA_BUS_FMT_IMX219_EMBEDDED
> > +    * - 1/1
> > +      - 3296
> > +      - 2
> > +      - MEDIA_BUS_FMT_META_10
> > +    * - :rspan:`3` Bridge
> > +      - 0/0
> > +      - **3296**
> > +      - **2480**
> > +      - **MEDIA_BUS_FMT_SRGGB10**
> > +    * - 1/0
> > +      - 3296
> > +      - 2480
> > +      - MEDIA_BUS_FMT_SRGGB10
> > +    * - 0/1
> > +      - **3296**
> > +      - **2**
> > +      - **MEDIA_BUS_FMT_META_10**
> > +    * - 1/1
> > +      - 3296
> > +      - 2
> > +      - MEDIA_BUS_FMT_META_10
> > +    * - :rspan:`3` Receiver
> > +      - 0/0
> > +      - **3296**
> > +      - **2480**
> > +      - **MEDIA_BUS_FMT_SRGGB10**
> > +    * - 1/0
> > +      - 3296
> > +      - 2480
> > +      - MEDIA_BUS_FMT_SRGGB10
> > +    * - 0/1
> > +      - **3296**
> > +      - **2**
> > +      - **MEDIA_BUS_FMT_META_10**
> > +    * - 2/0
> > +      - 3296
> > +      - 2
> > +      - MEDIA_BUS_FMT_META_10
> > +
> > +The embedded data format does not need to be configured as the format is
> > +dictated by the pixel data format in this case.
> 

-- 
Regards,

Sakari Ailus
