Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E20507BE815
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 19:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377439AbjJIRbo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 13:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377889AbjJIRbm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 13:31:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D699E
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 10:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696872701; x=1728408701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fnabzN5blFINwANzPhS3DJPFyA1looK1c+3DmJYD9TU=;
  b=PuBuPiGof7Gx8sxoWlIeeNTrZtDRZD7ew8KscGNKeBFSMjMy02qJglIH
   V73hV+sIsb3mg2lLavtl+h2emz0YHmbYQhn9+cUD1zwEuEDf2cPyb3oo5
   2WZXbUkAeTkc0YI6gBnO1StQL8YWqBu20oX21H3Bue1aI+6zoZF+1EEVT
   zaM5nop7xJb4XTt+r932dxq1SCeUnpNLdwPhQmLzGhC62w2vK0v0uF7/o
   htLn1wW3XkgHYxo+3+AdMu3XmXX9RdsfY6zzU2pPhs1HZsW1D2yt6nEZt
   4kyLylCwNg+IOJrLpjXQIbhNZqZ9oNcDTeB7F9qJAN942btDG/f8d4OE7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="363556399"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="363556399"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 10:31:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="869325719"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="869325719"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 10:31:14 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id A2F9D12023A;
        Mon,  9 Oct 2023 20:31:11 +0300 (EEST)
Date:   Mon, 9 Oct 2023 17:31:11 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 10/28] media: Documentation: v4l: Document source
 routes
Message-ID: <ZSQ43xXTfDwuOaQ4@kekkonen.localdomain>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003120813.77726-1-sakari.ailus@linux.intel.com>
 <4896e6d7-c3c6-475d-a989-9f2d8c867a1f@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4896e6d7-c3c6-475d-a989-9f2d8c867a1f@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Oct 05, 2023 at 12:26:41PM +0200, Hans Verkuil wrote:
> On 03/10/2023 14:07, Sakari Ailus wrote:
> > Document how internal pads are used on source routes. Use the IMX219
> > camera sensor as an example.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/dev-subdev.rst    | 179 ++++++++++++++++++
> >  1 file changed, 179 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index a387e8a15b8d..fb73a95401c3 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
> >  sub-device and a (pad, stream) pair. For sub-devices that do not support
> >  multiplexed streams the 'stream' field is always 0.
> >  
> > +.. _v4l2-subdev-source-routes:
> > +
> > +Internal pads and source routes
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +Cases where a single sub-device source pad is traversed by multiple streams one
> 
> Comma after "streams"
> 
> > +or more of which originate from within the sub-device itself are special as
> 
> and comma after "itself".

Yes.

> 
> > +there is no external sink pad for such routes. In those cases, the sources of
> > +the internally generated streams are represented by internal sink pads, which
> > +are sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
> > +pad flag set.
> > +
> > +Internal pads have all the properties of an external pad, including formats and
> 
> Perhaps the glossary should have definitions for "internal pad" and "external pad"?
> Or define it somewhere in:
> 
> https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/mediactl/media-controller.html

I'll add them to the glossary.

> 
> > +selections. The format in this case is the source format of the stream. An
> > +internal pad always has a single stream only (0).
> > +
> > +*Source routes* are routes from an internal sink pad to an external source
> > +pad. In most cases source routes are not modifiable but they can be activated
> > +and deactivated using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > +<v4l2-subdev-routing-flags>` flag, depending on driver capabilities.
> > +
> >  Interaction between routes, streams, formats and selections
> >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >  
> > @@ -668,3 +689,161 @@ To configure this pipeline, the userspace must take the following steps:
> >     the configurations along the stream towards the receiver, using
> >     :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
> >     stream endpoint in each sub-device.
> > +
> > +Internal pads setup example
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +A simple example of a multiplexed stream setup might be as follows:
> > +
> > +- A CCS camera sensor source sub-device, with one sink pad (0), one source pad
> > +  (1), an internal sink pad (2) that represents the source of embedded
> > +  data. There are two routes, one from the sink pad to the source, and another
> > +  from the internal sink pad to the source pad. The embedded data stream needs
> > +  to be enabled by activating the related route. The configuration of the rest
> > +  of the CCS sub-devices is omitted from this example.
> > +
> > +- Multiplexer bridge (Bridge). The bridge has one sink pad, connected to the
> > +  sensor (pad 0), and one source pad (pad 1), which outputs two streams.
> 
> I think this should mention "CSI" somewhere, since this transmits over the CSI bus.

I'll add CSI-2 in v7.

I'll also remove the bridge in v7 as this isn't a common configuration.

> 
> > +
> > +- Receiver in the SoC (Receiver). The receiver has a single sink pad (pad 0),
> > +  connected to the bridge, and two source pads (pads 1-2), going to the DMA
> > +  engine. The receiver demultiplexes the incoming streams to the source pads.
> 
> Ditto: this receives data from the CSI bus.

Yes.

> 
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
> 
> image data -> an image data

Yes.

> 
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
> "pixel data format"? That doesn't sound right for embedded data.

This is meant to convey that the configuration of embedded data stream is
dictated by the pixel data stream: I don't think it'd be useful to be able
to configure it the other way around. In hardware there's a dependency in
any case. Also, user space that isn't aware of the embedded data just does
configure the pixel data stream.

-- 
Regards,

Sakari Ailus
