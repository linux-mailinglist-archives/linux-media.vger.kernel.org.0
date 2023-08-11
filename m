Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA9E778C35
	for <lists+linux-media@lfdr.de>; Fri, 11 Aug 2023 12:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234975AbjHKKos (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Aug 2023 06:44:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234069AbjHKKoq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Aug 2023 06:44:46 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FF3E12C
        for <linux-media@vger.kernel.org>; Fri, 11 Aug 2023 03:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691750686; x=1723286686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LEQrvtoib1rbvRYfpkhq9+Wnda+vuEaahoHEU5oSvu8=;
  b=n/0/QJksE4bZBaJQIf2OBQH8TeTg5Cfbi+wZtYi2ggR4U/pBfG0rHgHv
   0F2Iw6nSvGBTgC6WRkEKzasv980XnvaP81ZzaXgXICPkZYtcDm/DCh55N
   qAykOwyyIATjs3AOrqeI8AqVixNTPGX01eVtMhS99dD86d4YaXc5T+6cB
   1rQX3iDcgH4uwt8BI7pHPSuoefvo+YGkRm2mu6F3Y3cpo5w108Zi/UWmx
   FqKbL/RPvY9iGsBadkT0hf+1PRk81SFDRAQvlmiKGP0f4TBoFI1QOqypP
   Gvt1QWXuwvAd8mn/tNAQoQl+UEWQlGaLP9aoMpRZGmys934vz6BhsgpDU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="356610355"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="356610355"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 03:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="762161782"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="762161782"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 03:44:43 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id A6A8B11FAE0;
        Fri, 11 Aug 2023 13:44:40 +0300 (EEST)
Date:   Fri, 11 Aug 2023 10:44:40 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 10/10] media: uapi: v4l: Document source routes
Message-ID: <ZNYRGA1KAzTrBmkX@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-11-sakari.ailus@linux.intel.com>
 <b91681ec-89e0-4347-c289-51498d8b3788@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b91681ec-89e0-4347-c289-51498d8b3788@xs4all.nl>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the review.

On Tue, Aug 08, 2023 at 10:55:24AM +0200, Hans Verkuil wrote:
> On 08/08/2023 09:55, Sakari Ailus wrote:
> > Document how internal pads are used on source routes.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/dev-subdev.rst    | 179 ++++++++++++++++++
> >  1 file changed, 179 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index b023918177b5..27b0fe2dc83a 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -551,6 +551,27 @@ A stream at a specific point in the media pipeline is identified by the
> >  sub-device and a (pad, stream) pair. For sub-devices that do not support
> >  multiplexed streams the 'stream' field is always 0.
> >  
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
> > +/Source routes/ are routes from an internal sink pad to a(n external) source
> 
> '/Source routes/' appears just like that in the generated documentation, that's
> probably not what you intended.

This was intended to be *Source routes*. I'll address it in v4.

> 
> > +pad. Generally source routes are not modifiable but they can be activated and
> > +deactivated using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > +<v4l2-subdev-routing-flags>` flag, depending on driver capabilities.
> > +
> >  Interaction between routes, streams, formats and selections
> >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >  
> > @@ -666,3 +687,161 @@ A common way to accomplish this is to start from the sensors and propagate the
> >  configurations along the stream towards the receiver,
> >  using :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
> >  stream endpoint in each sub-device.
> > +
> > +Internal pads setup example
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +A simple example of a multiplexed stream setup might be as follows:
> > +
> > +- A CCS camera sensor source sub-device, with one sink pad (0), one source pad
> 
> Explain what 'CCS' means: probably a link to MIPI CCS is sufficient, but for newbies
> 'CCS' doesn't provide any information.
> 
> > +  (1), an internal sink pad (2) that represents the source of embedded
> 
> So since the INTERNAL flag is associated with a sink pad, this is now called an
> 'internal sink' instead of 'internal source' as it was before. I agree with that,
> but note that the phrase 'internal source' is still used in several places,
> including the cover letter. For the next version you post, please check for that
> and change the terminology since mixing the two is very confusing :-)

Are you referring to this patch? There don't seem to be any references to
"intenal source pads" left.

> 
> > +  data. There are two routes, one from the sink pad to the source, and another
> > +  from the internal sink pad to the source pad. The embedded data stream needs
> > +  to be enabled by activating the related route. The configuration of the rest
> > +  of the CCS sub-devices is omitted from this example.
> > +
> > +- Multiplexer bridge (Bridge). The bridge has one sink pad, connected to the
> > +  sensor (pad 0), and one source pad (pad 1), which outputs two streams.
> > +
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
> 
> Huh? It is a sensor subdev, so aren't both pixel data and metadata
> coming from an internal sink?

The CCS driver exposes three sub-devices, so in this case the sink pad
isn't internal. Almost (?) all other sensor drivers have a single
sub-device only, perhaps I'll change the example to align with one of
those.

> 
> I think you are actually describing the internal subdev of a CCS
> sensor here, but that is not clear from the description at all.
> 
> Since CCS sensors are relatively common (I think), it might be
> good to give a fully fledged example.
> 
> But suppose you have a non-CCS sensor that generates the pixel data
> and metadata, then you would have two internal sink pads and one
> source pad for two streams, right?
> 
> And very simple sensors that currently just have a single source pad
> could be describes as having an internal sink pad connected to the
> source pad by a fixed route. But we don't do that, because it is
> overkill. Correct? If so, then this might be useful information to add
> to answer the question why some sensors have internal sinks and others
> do not.
> 
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
> > +The options available in sensor's routing configuration are dictated by hardware
> > +capabilities: typically camera sensors always produce image data stream while
> > +the embedded data stream typically can be either enabled or disabled.
> > +
> > +3) Configure formats and selections
> > +
> > +This example assumes that the formats are propagated from sink pad to the source
> > +pad as-is. The tables contain fields of both struct v4l2_subdev_format and
> > +struct v4l2_mbus_framefmt. The full configuration of CCS camera sensor is out of
> > +scope of this example.
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
> > +    * - :rspan:`3` Camera sensor sub-device (CCS source sub-device)
> > +      - 0/0
> > +      - 640
> > +      - 480
> > +      - MEDIA_BUS_FMT_SGRBG10
> > +    * - 1/0
> > +      - 640
> > +      - 480
> > +      - **MEDIA_BUS_FMT_SGRBG10**
> > +    * - 2/0
> > +      - 640
> > +      - 2
> > +      - MEDIA_BUS_FMT_CCS_EMBEDDED_10
> > +    * - 1/1
> > +      - 640
> > +      - 2
> > +      - MEDIA_BUS_FMT_META_10
> > +    * - :rspan:`3` Bridge
> > +      - 0/0
> > +      - **640**
> > +      - **480**
> > +      - **MEDIA_BUS_FMT_SGRBG10**
> > +    * - 1/0
> > +      - 640
> > +      - 480
> > +      - MEDIA_BUS_FMT_SGRBG10
> > +    * - 0/1
> > +      - **640**
> > +      - **2**
> > +      - **MEDIA_BUS_FMT_META_10**
> > +    * - 1/1
> > +      - 640
> > +      - 2
> > +      - MEDIA_BUS_FMT_META_10
> > +    * - :rspan:`3` Receiver
> > +      - 0/0
> > +      - **640**
> > +      - **480**
> > +      - **MEDIA_BUS_FMT_SGRBG10**
> > +    * - 1/0
> > +      - 640
> > +      - 480
> > +      - MEDIA_BUS_FMT_SGRBG10
> > +    * - 0/1
> > +      - **640**
> > +      - **2**
> > +      - **MEDIA_BUS_FMT_META_10**
> > +    * - 2/0
> > +      - 640
> > +      - 2
> > +      - MEDIA_BUS_FMT_META_10
> > +
> > +The embedded data format does not need to be configured as the format is
> > +dictated by the pixel data format in this case.

-- 
Kind regards,

Sakari Ailus
