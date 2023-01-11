Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4871D665937
	for <lists+linux-media@lfdr.de>; Wed, 11 Jan 2023 11:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233905AbjAKKmz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Jan 2023 05:42:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233529AbjAKKmy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Jan 2023 05:42:54 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA4F12718
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 02:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673433772; x=1704969772;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ylHWGTBC1ynn9CAeCc9nwR1AUXK33vBQQP3eQjpqemE=;
  b=YVOPh6S5ykcKKRxbJylJhkTEqEE1APF19t7n+TIq7qmUqawUYKooeMfQ
   WlbNixRt4Yl8AKGP7IzCVe3vxHYWziiYaOag76rfAIAmkUrImNNSG2EbY
   0tnOYp4vX+yXvDHC4Fi/Eq7j6aNWRDnRtulAjSk0BFFZioFIalbXUduOK
   cql/odo8o2scYNtAFAxuDZQ2o0aUUaLnkRR+Cu9tiDk1tg4QjFPUBLN/V
   fl5X46gzwruUGU/0afxLLd9d5aTBiO4nfKkKlASiFGzq5/nk8Xu492QwL
   5daPkzfM6wFYfe9KzE6mrovo79VadKD7lxJ+ANoHa98LxEEXTwkYQ0mgB
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="409624361"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="409624361"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 02:42:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607304158"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="607304158"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 02:42:49 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id D7BE62010E;
        Wed, 11 Jan 2023 12:42:46 +0200 (EET)
Date:   Wed, 11 Jan 2023 10:42:46 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH 1/1] media: Documentation: Update documentation for
 streams
Message-ID: <Y76SpkZTxtPvpXtU@paasikivi.fi.intel.com>
References: <20221215121634.287100-1-tomi.valkeinen@ideasonboard.com>
 <20230110091707.2003226-1-sakari.ailus@linux.intel.com>
 <e97557a5-a44c-00bb-c247-71565c344f31@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e97557a5-a44c-00bb-c247-71565c344f31@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Tue, Jan 10, 2023 at 01:26:06PM +0200, Tomi Valkeinen wrote:
> On 10/01/2023 11:17, Sakari Ailus wrote:
> > Document how streams interacts with formats and selections.
> > 
> > Update documentation in respect to what is allowed, in particular streams
> > are only supported via full routes, source-only routes are not supported
> > right now.
> > 
> > The centerpiece of the API additions are streams. Albeit routes are
> > configured via S_ROUTING IOCTL that also declares streams, it is streams
> > that are accessed through other APIs. Thus refer to streams instead of
> > routes in documentation.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Hi folks,
> > 
> > This replaces my earlier documetation patch. The commit message and the
> > subject have changed and the content reflects this. Largely this means
> > removing a few features of the interface --- for now.
> > 
> > The intent is to be able to merge this very soon, thus those portions that
> > are still debated have been dropped (no more dependencies between streams,
> > for instance).
> > 
> >   .../userspace-api/media/v4l/dev-subdev.rst    | 121 +++++++++---------
> >   1 file changed, 58 insertions(+), 63 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index 072e82b2b2786..d2badf21a62cd 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -406,6 +406,8 @@ pixel array is not rectangular but cross-shaped or round. The maximum
> >   size may also be smaller than the BOUNDS rectangle.
> > +.. _format-propagation:
> > +
> >   Order of configuration and format propagation
> >   ---------------------------------------------
> > @@ -507,12 +509,12 @@ source pads.
> >   Streams, multiplexed media pads and internal routing
> >   ----------------------------------------------------
> > -Commonly V4L2 subdevices support only separate video streams, that is, only a
> > -single stream can pass through a media link and a media pad. Thus each pad
> > -contains a format configuration for that single stream. In some cases a subdev
> > -can do stream processing and split a stream into two or compose two streams
> > -into one, but the inputs and outputs for the subdev are still a single stream
> > -per pad.
> > +Simple V4L2 subdevices do not support multiple, unrelated video streams,
> > +and only a single stream can pass through a media link and a media pad.
> > +Thus each pad contains a format and selection configuration for that
> > +single stream. A subdev can do stream processing and split a stream into
> > +two or compose two streams into one, but the inputs and outputs for the
> > +subdev are still a single stream per pad.
> >   Some hardware, e.g. MIPI CSI-2, support multiplexed streams, that is, multiple
> >   data streams are transmitted on the same bus, which is represented by a media
> > @@ -539,14 +541,35 @@ streams from one end of the link to the other, and subdevices have routing
> >   tables which describe how the incoming streams from sink pads are routed to the
> >   source pads.
> > -A stream ID (often just "stream") is a media link-local identifier for a stream.
> > -In other words, a particular stream ID must exist on both sides of a media
> > +A stream ID is a media pad-local identifier for a stream. Streams IDs of
> > +the same stream must be equal on both ends of a link. In other words,
> > +a particular stream ID must exist on both sides of a media
> >   link, but another stream ID can be used for the same stream at the other side
> > -of the subdevice.
> > +of the subdevice. The same stream ID is used to refer to the stream on
> > +both pads of the link on all ioctls operating on pads.
> 
> This sentence feels a bit confusing. What's it trying to say? That the same
> Stream ID has to be on the pads on both sides of the link? Wasn't that
> already covered earlier?

After reading the paragraph again, I think the last sentence can be dropped
indeed.

> 
> > +A stream at a specific point in the media pipeline is identified by the
> > +sub-devdev and a (pad, stream) pair. For subdevices that do not support
> 
> Typo there in "sub-devdev". Also, there seems to be a lot of "sub-device"
> and "subdevice" words in the text. Which one is it?

It's intended to be "sub-device". Sometimes it is shortedned to "subdev",
but this is documentation so I'd avoid it here. "Subdevice" seems to be
only present on routing documentation. I'll replace all instances with
"sub-device".

> 
> > +multiplexed streams the 'stream' field is always 0.
> > +
> > +Interaction between routes, streams, formats and selections
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +The addition of streams to the V4L2 sub-device interface moves the sub-device
> > +formats and selections from pads to (pad, stream) pairs. Besides the
> > +usual pad, also the stream ID needs to be provided for setting formats and
> 
> Here, and already earlier, you first say "stream" and then "stream ID". Are
> they the same thing? You removed my "stream ID (often just "stream")" text,
> which I had included to clarify that those two terms are interchangeable in
> certain contexts where it's obvious.

It says above that "A stream ID is a media pad-local identifier for a
stream".

I think (pad, stream) pair is fine --- we don't talk about pad IDs either.

> 
> > +selections. The order of configuring formats and selections along a stream is
> > +the same as without streams (see :ref:`format-propagation`).
> > +
> > +Instead of the sub-device wide merging of streams from all source pads
> > +towards all sink pads, data flows for each route are separate from each
> 
> Shouldn't the above be from sink pads towards source pads?

Uh, yes. I'll fix for v2.

> 
> > +other. Any number of routes from streams on sink pads towards streams on
> > +source pads is allowed, to the extent supported by drivers. For every
> > +stream on a sink pad, however, only a single route is allowed.
> 
> I don't follow here. Don't you first say that any number of routes is ok,
> then you say only a single route is ok?

The latter "sink" should have been "source". I'll fix it.

> 
> > -A stream at a specific point in the media pipeline is identified with the
> > -subdev and a (pad, stream) pair. For subdevices that do not support
> > -multiplexed streams the 'stream' is always 0.
> > +Any configurations of a stream within a pad, such as format or selections,
> > +are independent of similar configurations on other streams. This is
> > +subject to change in the future.
> 
> Hmm, what does this mean? Isn't this device specific? The format for a video
> stream will affect the format for a metadata stream from the same source.

Correct, but we don't support these yet. They should of course follow soon
after the initial merge.

> 
> >   Configuring streams
> >   ^^^^^^^^^^^^^^^^^^^
> > @@ -560,34 +583,37 @@ There are three steps in configuring the streams:
> >   1) Set up links. Connect the pads between subdevices using the :ref:`Media
> >   Controller API <media_controller>`
> > -2) Routing. The routing table for the subdevice must be set with
> > +2) Streams. Streams are declared and their routing is configured by
> > +setting the routing table for the subdevice must be set with
> 
> Hmm, maybe s/must be set with/using/

Yes.

> 
> >   :ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that
> > -setting the routing table will reset all the stream configurations in a media
> > -entity.
> > +setting the routing table will reset formats and selections in the
> > +sub-device to default values.
> > -3) Configure streams. Each route endpoint must be configured
> > -with :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`.
> > +3) Configure formats and selections. Formats and selections of each stream
> > +are configured separately as documented for plain subdevices in
> > +:ref:`<format-propagation>`. The stream ID is set to the same stream ID
> > +associated with either sink or source pads of routes configured using the
> > +:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
> 
> Is this trying to say that the stream ID numbers used in the
> VIDIOC_SUBDEV_G_ROUTING call are the same used in the format and selection
> configuration? Isn't that obvious already? I at least find the sentence a
> bit confusing.
> 
> >   Multiplexed streams setup example
> >   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >   A simple example of a multiplexed stream setup might be as follows:
> > -- Two identical sensors (Sensor A and Sensor B). Each sensor has a single source
> > -  pad (pad 0) which carries two streams, pixel data stream and metadata
> > -  stream.
> > +- Two identical sensors (Sensor A and Sensor B). The sensors produce image
> > +  data only and hence do not need specific support for streams.
> 
> Hmm, I have already changed all this in the v16, and I think I had other
> changes in the docs too. What's this patch based on?

As discussed, this patch was based on your streams/work-v16 branch. I'll
rebase this on the last patch of the set, which also means removing this
and related changes.

> 
> >   - Multiplexer bridge (Bridge). The bridge has two sink pads, connected to the
> > -  sensors (pads 0, 1), and one source pad (pad 2), which outputs all 4
> > -  streams.
> > +  sensors (pads 0, 1), and one source pad (pad 2), which outputs both of
> > +  the streams.
> >   - Receiver in the SoC (Receiver). The receiver has a single sink pad (pad 0),
> >     connected to the bridge, and four source pads (pads 1-4), going to the DMA
> > -  engine. The receiver demultiplexes the incoming streams to the four source
> > +  engine. The receiver demultiplexes the incoming streams to two the source
> >     pads.
> >   - Four DMA Engines in the SoC (DMA Engine). Each DMA engine is connected to a
> > -  single source pad in the receiver.
> > +  single source pad in the receive via a link, two of which are active.
> >   The sensors, the bridge and the receiver are modeled as V4L2 subdevices,
> >   exposed to userspace via /dev/v4l-subdevX device nodes. The DMA engines are
> > @@ -599,23 +625,7 @@ To configure this pipeline, the userspace must take the following steps:
> >   bridge to the receiver, and the receiver to the DMA engines. This step does
> >   not differ from normal non-multiplexed media controller setup.
> > -2) Configure routing.
> > -
> > -.. flat-table:: Sensor routing table (identical on both sensors)
> > -    :header-rows:  1
> > -
> > -    * - Sink Pad/Stream
> > -      - Source Pad/Stream
> > -      - Routing Flags
> > -      - Comments
> > -    * - 0/0 (unused)
> > -      - 0/0
> > -      - V4L2_SUBDEV_ROUTE_FL_ACTIVE | V4L2_SUBDEV_ROUTE_FL_SOURCE_ONLY
> > -      - Pixel data stream. Source route, i.e. the sink fields are unused.
> > -    * - 0/0 (unused)
> > -      - 0/1
> > -      - V4L2_SUBDEV_ROUTE_FL_ACTIVE | V4L2_SUBDEV_ROUTE_FL_SOURCE_ONLY
> > -      - Metadata stream. Source route, i.e. the sink fields are unused.
> > +2) Configure routing
> >   .. flat-table:: Bridge routing table
> >       :header-rows:  1
> > @@ -628,18 +638,10 @@ not differ from normal non-multiplexed media controller setup.
> >         - 2/0
> >         - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> >         - Pixel data stream from Sensor A
> > -    * - 0/1
> > -      - 2/1
> > -      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > -      - Metadata stream from Sensor A
> >       * - 1/0
> > -      - 2/2
> > +      - 2/1
> >         - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> >         - Pixel data stream from Sensor B
> > -    * - 1/1
> > -      - 2/3
> > -      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > -      - Metadata stream from Sensor B
> >   .. flat-table:: Receiver routing table
> >       :header-rows:  1
> > @@ -655,22 +657,15 @@ not differ from normal non-multiplexed media controller setup.
> >       * - 0/1
> >         - 2/0
> >         - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > -      - Metadata stream from Sensor A
> > -    * - 0/2
> > -      - 3/0
> > -      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> >         - Pixel data stream from Sensor B
> > -    * - 0/3
> > -      - 4/0
> > -      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > -      - Metadata stream from Sensor B
> > -3) Configure streams
> > +3) Configure formats and selections
> > -After configuring the routing table, the next step is configuring the streams.
> > -This step is similar to configuring the pads in a non-multiplexed streams
> > -setup, with the difference that we need to configure each (pad, stream) pair
> > -(i.e. route endpoint) instead of just a pad.
> > +After configuring the routing table, the next step is configuring the
> > +formats and selections for the streams. This step is similar to
> > +configuring the pads in a non-multiplexed streams setup, with the
> 
> As you say "configuring the formats and selections for the streams", maybe
> similarly you could say "is similar to configuring the formats and
> selections for the pads".

We haven't referred the non-stream aware configuration as being
specifically performed on pads. I think this should be rewritten, not just
slightly adjusted.

How about:

After configuring routing, the next step is configuring the formats and
selections for the streams. This is similar to performing this step without
streams, with just one exception: the ``stream`` field needs to be assigned
to the value of the stream ID.

> 
> > +difference that we need to configure each (pad, stream) pair instead of
> > +just a pad.
> 
> Do we "configure the streams/pads", or do we "configure the formats and
> selections for the streams/pads"?
> 
>  Tomi
> 

-- 
Terveisin,

Sakari Ailus
