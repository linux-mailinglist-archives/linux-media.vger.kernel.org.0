Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49DEF793C61
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 14:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbjIFMLg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 08:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjIFMLf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 08:11:35 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 569CAE6B
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 05:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694002289; x=1725538289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3TAdyGW64v1bjXiLaOFXQE+ok0LhWHFrplH5zf1NRzE=;
  b=IxSIuiM6ODKiyJGaP/Shxcq89YOqWA0pPVBiQQpxqKVLdq/pukHxKxal
   j3abVkwP07z2LXIuF10tGYAHZNzI/fHDXULaPRWbLUkkzlz3igg5D16fk
   6grDr1ejlMxCHiyAVhNFWD0xLTjE6iqn2C95aUIrgMTF1W1ZjWboZacLY
   5mQdXU8s/g7pwKsKkE81fB0f1lgT6hoenz+MU2PoHl8isJRsQgcU3AEPd
   IG0FRP1U+q/KbJF1TjADoHV2FMfyxcHD4wrSDBnVkv0McFkkP2tepHJ8w
   ySwUS2X961QLExb/B5kFwkwYaCUsLm14bzOa8Z7+3VFRMrMRC9o8RB5T/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="408050606"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="408050606"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 05:11:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="776585520"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="776585520"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 05:11:18 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id B6F5511FC2C;
        Wed,  6 Sep 2023 15:11:15 +0300 (EEST)
Date:   Wed, 6 Sep 2023 12:11:15 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 10/10] media: uapi: v4l: Document source routes
Message-ID: <ZPhsYzcK8gRvSb9W@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-11-sakari.ailus@linux.intel.com>
 <b91681ec-89e0-4347-c289-51498d8b3788@xs4all.nl>
 <ZNYRGA1KAzTrBmkX@kekkonen.localdomain>
 <20230905231702.GJ7971@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905231702.GJ7971@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the review.

On Wed, Sep 06, 2023 at 02:17:02AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Aug 11, 2023 at 10:44:40AM +0000, Sakari Ailus wrote:
> > On Tue, Aug 08, 2023 at 10:55:24AM +0200, Hans Verkuil wrote:
> > > On 08/08/2023 09:55, Sakari Ailus wrote:
> > > > Document how internal pads are used on source routes.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  .../userspace-api/media/v4l/dev-subdev.rst    | 179 ++++++++++++++++++
> > > >  1 file changed, 179 insertions(+)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > index b023918177b5..27b0fe2dc83a 100644
> > > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > @@ -551,6 +551,27 @@ A stream at a specific point in the media pipeline is identified by the
> > > >  sub-device and a (pad, stream) pair. For sub-devices that do not support
> > > >  multiplexed streams the 'stream' field is always 0.
> > > >  
> > > > +.. _v4l2-subdev-source-routes:
> > > > +
> > > > +Internal pads and source routes
> > > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > +
> > > > +Cases where a single sub-device source pad is traversed by multiple streams one
> > > > +or more of which originate from within the sub-device itself are special as
> > > > +there is no external sink pad for such routes. In those cases, the sources of
> > > > +the internally generated streams are represented by internal sink pads, which
> > > > +are sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
> > > > +pad flag set.
> > > > +
> > > > +Internal pads have all the properties of an external pad, including formats and
> > > > +selections. The format in this case is the source format of the stream. An
> > > > +internal pad always has a single stream only (0).
> > > > +
> > > > +/Source routes/ are routes from an internal sink pad to a(n external) source
> 
> "a(n external)" looks weird.

I'll remove the parentheses. Both are applicable. We don't generally call
pads external but saying that here is relevant.

> 
> > > '/Source routes/' appears just like that in the generated documentation, that's
> > > probably not what you intended.
> > 
> > This was intended to be *Source routes*. I'll address it in v4.
> > 
> > > > +pad. Generally source routes are not modifiable but they can be activated and
> > > > +deactivated using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > > +<v4l2-subdev-routing-flags>` flag, depending on driver capabilities.
> 
> We need to update the documentation of the routing API to clearly
> explain the different models (i.e. specifying all routes, active and
> inactive, vs. including only active routes). That's out of scope for
> this patch, but it could be done in the same series.

I agree.

With this series eventually merged, I'm also hoping we could enable the
streams API.

> 
> > > > +
> > > >  Interaction between routes, streams, formats and selections
> > > >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > >  
> > > > @@ -666,3 +687,161 @@ A common way to accomplish this is to start from the sensors and propagate the
> > > >  configurations along the stream towards the receiver,
> > > >  using :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
> > > >  stream endpoint in each sub-device.
> > > > +
> > > > +Internal pads setup example
> > > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > +
> > > > +A simple example of a multiplexed stream setup might be as follows:
> > > > +
> > > > +- A CCS camera sensor source sub-device, with one sink pad (0), one source pad
> > > 
> > > Explain what 'CCS' means: probably a link to MIPI CCS is sufficient, but for newbies
> > > 'CCS' doesn't provide any information.
> > > 
> > > > +  (1), an internal sink pad (2) that represents the source of embedded
> > > 
> > > So since the INTERNAL flag is associated with a sink pad, this is now called an
> > > 'internal sink' instead of 'internal source' as it was before. I agree with that,
> > > but note that the phrase 'internal source' is still used in several places,
> > > including the cover letter. For the next version you post, please check for that
> > > and change the terminology since mixing the two is very confusing :-)
> > 
> > Are you referring to this patch? There don't seem to be any references to
> > "intenal source pads" left.
> > 
> > > > +  data. There are two routes, one from the sink pad to the source, and another
> > > > +  from the internal sink pad to the source pad. The embedded data stream needs
> > > > +  to be enabled by activating the related route. The configuration of the rest
> > > > +  of the CCS sub-devices is omitted from this example.
> 
> CCS is complex, with its multiple subdevs. I think a simpler raw sensor
> without a scaler, using a single subdev, would be a better example.
> 
> > > > +
> > > > +- Multiplexer bridge (Bridge). The bridge has one sink pad, connected to the
> > > > +  sensor (pad 0), and one source pad (pad 1), which outputs two streams.
> > > > +
> > > > +- Receiver in the SoC (Receiver). The receiver has a single sink pad (pad 0),
> > > > +  connected to the bridge, and two source pads (pads 1-2), going to the DMA
> > > > +  engine. The receiver demultiplexes the incoming streams to the source pads.
> > > > +
> > > > +- DMA Engines in the SoC (DMA Engine), one for each stream. Each DMA engine is
> > > > +  connected to a single source pad in the receiver.
> > > > +
> > > > +The sensor, the bridge and the receiver are modeled as V4L2 sub-devices,
> > > > +exposed to userspace via /dev/v4l-subdevX device nodes. The DMA engines are
> > > > +modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
> > > > +
> > > > +To configure this pipeline, the userspace must take the following steps:
> > > > +
> > > > +1) Set up media links between entities: connect the sensors to the bridge,
> > > > +   bridge to the receiver, and the receiver to the DMA engines. This step does
> > > > +   not differ from normal non-multiplexed media controller setup.
> > > > +
> > > > +2) Configure routing
> > > > +
> > > > +.. flat-table:: Camera sensor
> > > > +    :header-rows: 1
> > > > +
> > > > +    * - Sink Pad/Stream
> > > > +      - Source Pad/Stream
> > > > +      - Routing Flags
> > > > +      - Comments
> > > > +    * - 0/0
> > > > +      - 1/0
> > > > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > > +      - Pixel data stream from the sink pad
> > > 
> > > Huh? It is a sensor subdev, so aren't both pixel data and metadata
> > > coming from an internal sink?
> > 
> > The CCS driver exposes three sub-devices, so in this case the sink pad
> > isn't internal. Almost (?) all other sensor drivers have a single
> > sub-device only, perhaps I'll change the example to align with one of
> > those.
> 
> Ah, it looks like we have thought about the same thing :-)
> 
> > > I think you are actually describing the internal subdev of a CCS
> > > sensor here, but that is not clear from the description at all.
> > > 
> > > Since CCS sensors are relatively common (I think), it might be
> > > good to give a fully fledged example.
> > > 
> > > But suppose you have a non-CCS sensor that generates the pixel data
> > > and metadata, then you would have two internal sink pads and one
> > > source pad for two streams, right?
> > > 
> > > And very simple sensors that currently just have a single source pad
> > > could be describes as having an internal sink pad connected to the
> > > source pad by a fixed route. But we don't do that, because it is
> > > overkill. Correct? If so, then this might be useful information to add
> > > to answer the question why some sensors have internal sinks and others
> > > do not.
> > > 
> > > > +    * - 2/0
> > > > +      - 1/1
> > > > +      - **V4L2_SUBDEV_ROUTE_FL_ACTIVE**
> > > > +      - Metadata stream from the internal sink pad
> > > > +
> > > > +.. flat-table:: Bridge routing table
> > > > +    :header-rows: 1
> > > > +
> > > > +    * - Sink Pad/Stream
> > > > +      - Source Pad/Stream
> > > > +      - Routing Flags
> > > > +      - Comments
> > > > +    * - 0/0
> > > > +      - 1/0
> > > > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > > +      - Pixel data stream from camera sensor
> > > > +    * - 0/1
> > > > +      - 1/1
> > > > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > > +      - Metadata stream from camera sensor
> > > > +
> > > > +.. flat-table:: Receiver routing table
> > > > +    :header-rows:  1
> > > > +
> > > > +    * - Sink Pad/Stream
> > > > +      - Source Pad/Stream
> > > > +      - Routing Flags
> > > > +      - Comments
> > > > +    * - 0/0
> > > > +      - 1/0
> > > > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > > +      - Pixel data stream from camera sensor
> > > > +    * - 0/1
> > > > +      - 2/0
> > > > +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > > +      - Metadata stream from camera sensor
> > > > +
> > > > +The options available in sensor's routing configuration are dictated by hardware
> > > > +capabilities: typically camera sensors always produce image data stream while
> > > > +the embedded data stream typically can be either enabled or disabled.
> > > > +
> > > > +3) Configure formats and selections
> > > > +
> > > > +This example assumes that the formats are propagated from sink pad to the source
> > > > +pad as-is. The tables contain fields of both struct v4l2_subdev_format and
> > > > +struct v4l2_mbus_framefmt. The full configuration of CCS camera sensor is out of
> > > > +scope of this example.
> > > > +
> > > > +.. flat-table:: Formats set on the sub-devices. Bold values are set, others are
> > > > +                static or propagated.
> > > > +    :header-rows: 1
> > > > +    :fill-cells:
> > > > +
> > > > +    * - Sub-device
> > > > +      - Pad/Stream
> > > > +      - Width
> > > > +      - Height
> > > > +      - Code
> > > > +    * - :rspan:`3` Camera sensor sub-device (CCS source sub-device)
> > > > +      - 0/0
> > > > +      - 640
> > > > +      - 480
> > > > +      - MEDIA_BUS_FMT_SGRBG10
> > > > +    * - 1/0
> > > > +      - 640
> > > > +      - 480
> > > > +      - **MEDIA_BUS_FMT_SGRBG10**
> > > > +    * - 2/0
> > > > +      - 640
> > > > +      - 2
> > > > +      - MEDIA_BUS_FMT_CCS_EMBEDDED_10
> > > > +    * - 1/1
> > > > +      - 640
> > > > +      - 2
> > > > +      - MEDIA_BUS_FMT_META_10
> > > > +    * - :rspan:`3` Bridge
> > > > +      - 0/0
> > > > +      - **640**
> > > > +      - **480**
> > > > +      - **MEDIA_BUS_FMT_SGRBG10**
> > > > +    * - 1/0
> > > > +      - 640
> > > > +      - 480
> > > > +      - MEDIA_BUS_FMT_SGRBG10
> > > > +    * - 0/1
> > > > +      - **640**
> > > > +      - **2**
> > > > +      - **MEDIA_BUS_FMT_META_10**
> > > > +    * - 1/1
> > > > +      - 640
> > > > +      - 2
> > > > +      - MEDIA_BUS_FMT_META_10
> > > > +    * - :rspan:`3` Receiver
> > > > +      - 0/0
> > > > +      - **640**
> > > > +      - **480**
> > > > +      - **MEDIA_BUS_FMT_SGRBG10**
> > > > +    * - 1/0
> > > > +      - 640
> > > > +      - 480
> > > > +      - MEDIA_BUS_FMT_SGRBG10
> > > > +    * - 0/1
> > > > +      - **640**
> > > > +      - **2**
> > > > +      - **MEDIA_BUS_FMT_META_10**
> > > > +    * - 2/0
> > > > +      - 640
> > > > +      - 2
> > > > +      - MEDIA_BUS_FMT_META_10
> > > > +
> > > > +The embedded data format does not need to be configured as the format is
> > > > +dictated by the pixel data format in this case.

-- 
Regards,

Sakari Ailus
