Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64F6865D549
	for <lists+linux-media@lfdr.de>; Wed,  4 Jan 2023 15:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjADOPE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Jan 2023 09:15:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239660AbjADOOj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Jan 2023 09:14:39 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3164A3D9E4
        for <linux-media@vger.kernel.org>; Wed,  4 Jan 2023 06:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672841657; x=1704377657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eMusruD1Fx4qT9EOXzPlabtPan6o7e7x0HMym+K3ErA=;
  b=V3e5pBM54Q/i39ehLku8WTsLg3vn3DMf5cDQpjnbvwekw2dbpuc3AN+d
   WQXGaXe7R29T3eDNHG3G4cALJs7jygLQsiGHkXeH0XE+UsOMu2mEDP4rU
   LmbZz9LaKrMhMULzlMcSVJiX0Mu1c1FC7hhH9B6epQTBlZ1sqXj9jdtvn
   +c89E0M21GYnOOkA7MeoTFC1kdrkhYX1yDHzMuIT9pmkj9ViXOMxBCAhS
   kl3hcEAFaqmvB0nTDkJaEXaHIuCo2b8tkNzM51+gAhLuGY5YN/fKjeNwd
   rhkaAqCMA368KOXmPArkzUtdaZJcCGQ7LgOL8QeI4ONw58c2sdhjWdIOP
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="384233004"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; 
   d="scan'208";a="384233004"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 06:14:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="605191802"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; 
   d="scan'208";a="605191802"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 06:14:14 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id B7C3D20078;
        Wed,  4 Jan 2023 16:14:11 +0200 (EET)
Date:   Wed, 4 Jan 2023 14:14:11 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v2 1/1] media: Documentation: Interaction between routes,
 formats and selections
Message-ID: <Y7WJsx4E2rdoc88y@paasikivi.fi.intel.com>
References: <20221207105809.911482-1-sakari.ailus@linux.intel.com>
 <Y5GtAmFjcaxSZ5y/@pendragon.ideasonboard.com>
 <Y6Aioq4eXrzlaqki@paasikivi.fi.intel.com>
 <Y6ndIdtiZ91GxPar@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6ndIdtiZ91GxPar@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Dec 26, 2022 at 07:42:57PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Mon, Dec 19, 2022 at 08:36:50AM +0000, Sakari Ailus wrote:
> > On Thu, Dec 08, 2022 at 11:23:14AM +0200, Laurent Pinchart wrote:
> > > On Wed, Dec 07, 2022 at 12:58:09PM +0200, Sakari Ailus wrote:
> > > > Document how setting up routes interacts with formats and selections.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > > since v1:
> > > > 
> > > > - Rewording changes based on Tomi's comments. In particular stricter
> > > >   separation between "stream" and "stream ID".
> > > > 
> > > >  .../userspace-api/media/v4l/dev-subdev.rst    | 50 ++++++++++++++-----
> > > >  1 file changed, 37 insertions(+), 13 deletions(-)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > index 5075b1828b32d..92710bb9a0caa 100644
> > > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > @@ -406,6 +406,8 @@ pixel array is not rectangular but cross-shaped or round. The maximum
> > > >  size may also be smaller than the BOUNDS rectangle.
> > > >  
> > > >  
> > > > +.. _format-propagation:
> > > > +
> > > >  Order of configuration and format propagation
> > > >  ---------------------------------------------
> > > >  
> > > > @@ -507,12 +509,12 @@ source pads.
> > > >  Streams, multiplexed media pads and internal routing
> > > >  ----------------------------------------------------
> > > >  
> > > > -Commonly V4L2 subdevices support only separate video streams, that is, only a
> > > > -single stream can pass through a media link and a media pad. Thus each pad
> > > > -contains a format configuration for that single stream. In some cases a subdev
> > > > -can do stream processing and split a stream into two or compose two streams
> > > > -into one, but the inputs and outputs for the subdev are still a single stream
> > > > -per pad.
> > > > +Simple V4L2 subdevices do not support multiple, unrelated video streams,
> > > > +and only a single stream can pass through a media link and a media pad.
> > > > +Thus each pad contains a format and selection configuration for that
> > > > +single stream. A subdev can do stream processing and split a stream into
> > > > +two or compose two streams into one, but the inputs and outputs for the
> > > > +subdev are still a single stream per pad.
> > > >  
> > > >  Some hardware, e.g. MIPI CSI-2, support multiplexed streams, that is, multiple
> > > >  data streams are transmitted on the same bus, which is represented by a media
> > > > @@ -539,14 +541,33 @@ streams from one end of the link to the other, and subdevices have routing
> > > >  tables which describe how the incoming streams from sink pads are routed to the
> > > >  source pads.
> > > >  
> > > > -A stream ID (often just "stream") is a media link-local identifier for a stream.
> > > > +A stream ID is a media link-local identifier for a stream.
> > > >  In other words, a particular stream ID must exist on both sides of a media
> > > >  link, but another stream ID can be used for the same stream at the other side
> > > > -of the subdevice.
> > > > +of the subdevice. The same stream ID is used to refer to the stream on
> > > > +both pads of the link on all ioctls operating on pads.
> > > > +
> > > > +A stream at a specific point in the media pipeline is identified by the
> > > > +sub-devdev and a pad ID-stream ID pair. For subdevices that do not support
> > > > +multiplexed streams the 'stream' field is always 0.
> > > > +
> > > > +Interaction between routes, formats and selections
> > > 
> > > s/selections/selection rectangles/
> > > 
> > > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > +
> > > > +The addition of routes to the V4L2 sub-device interface moves the
> > > > +sub-device formats and selections from pads to pad ID-stream ID pairs.
> > > 
> > > This reads as "pad" "ID-stream" "ID" "pairs". Even knowing how the API
> > > behaves, I had trouble understanding this.
> > 
> > Well, that's perhaps a bit exaggerated but I agree the readability could be
> > improved.
> 
> I promise I wasn't exagerating, I had to re-read the sentence multiple
> times before getting what it meant :-)
> 
> > Maybe:
> > 
> > 	(pad ID, stream ID) pair
> > 
> > ? Not exactly great perhaps but should be easier to read.
> 
> How about
> 
>   The addition of routes to the V4L2 sub-device interface moves the
>   sub-device formats and selections from pads to (pad, stream) pairs.
> 
> ? The text doesn't say "from pad IDs", so you could drop ID completely.

That changes the meaning of it, for "stream" and "stream ID" are not the
same things. I wonder if we could come up with another name for stream ID.

> 
> > > > +Besides the usual pad ID, also the stream ID needs to be provided for
> > > > +setting formats and selections.
> > > > +
> > > > +Instead of the sub-device wide merging of streams from all source pads
> > > > +towards all sink pads, data flows for each route are separate from each
> > > > +other. Any number of routes from streams on sink pads towards streams on
> > > > +source pads is allowed, to the extent supported by drivers. For every
> > > > +stream on a sink pad, however, only a single route is allowed.
> > > 
> > > This explains routes, not format and selection rectangles.
> > 
> > Perhaps a few more words on formats and selections would be appropriate
> > indeed.
> > 
> > > > -A stream at a specific point in the media pipeline is identified with the
> > > > -subdev and a (pad, stream) pair. For subdevices that do not support
> > > > -multiplexed streams the 'stream' is always 0.
> > > > +Stream IDs, part of routes, are configured by using the
> > > > +:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. This will
> > > > +also revert the format and selection configuration to device defaults.
> > > 
> > > I don't expect someone who doesn't have detailed knowledge of the
> > > implementation to understand what you mean here :-(
> > > 
> > > >  Configuring streams
> > > >  ^^^^^^^^^^^^^^^^^^^
> > > > @@ -565,8 +586,11 @@ Controller API <media_controller>`
> > > >  setting the routing table will reset all the stream configurations in a media
> > > >  entity.
> > > >  
> > > > -3) Configure streams. Each route endpoint must be configured
> > > > -with :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`.
> > > > +3) Configure formats and selections. Each route is configured separately
> > > 
> > > We don't configure routes but streams, don't we ? Mentioning routes here
> > > seems confusing to me.
> > 
> > Well, routing, format and selection APIs all apply to streams, don't they?
> 
> Yes, but a route is a connection between two streams within a subdev, so
> formats and selection rectangles are not configured on routes but on
> streams.

It could be confusing for the reader to refer to streams only, as the
formats (and selections) are propagated along the route. I'll see if I
could include streams here.

> 
> > I'll see if I can make this easier to grasp.
> > 
> > > > +as documented plain subdevices in :ref:`<format-propagation>`. The stream
> > > 
> > > Did you mean "as documented for plain subdevices" ?
> > 
> > Yes.
> > 
> > > This is the part that bothers me. I don't think we can consider the
> > > configuration of routes to be independent in the general case. How the
> > > formats and selection rectangle of different streams interact with each
> > > other is what I'd like to see documented.
> > 
> > That is device specific in the end. Even without routes there are hardware
> > specific limitations on what can be done, in this case it's just that other
> > routes can be limiting as well.
> 
> That's right, but the V4L2 subdevice model nonetheless has a set of
> rules that govern how formats and selection rectangles interact with
> each other. Those rules are expected to apply to all devices and
> drivers.

Yes, but in this case the formats and selections do not depend only on
other formats and selections earlier on in the chain, but those configured
on other stream IDs on that pad as well. There's not much we can say about
that while keeping the interface functional. The behaviour does need to be
specified more precisely, such as telling which stream is a master (could
be called e.g. cat) of another, in order to convey it is affected by
configuration of another stream.

> 
> In practice we have many drivers (in particular camera sensor drivers)
> that behave incorrectly. One could argue that this means the rules are
> not applicable, and we shouldn't try to carry this over to streams. For
> devices that require a custom userspace anyway (such as ISPs), this
> could be acceptable. For other devices, and in particular for camera
> sensor drivers, I strongly disagree. We need a stricter set of rules to
> make it possible to implement a generic userspace.
> 
> > But as both are configured by the user, what takes priority, the
> > pre-existing configuration or the new configuration set by the user? I
> > think we indeed need rules for that.
> > 
> > > As this is an area that has been entirely unexplored until now as far as
> > > I can tell, I would be fine if we wanted to merge streams support
> > > without support for selection rectangles to start with, and experiment
> > > with the selection API later, once we have good use cases that can be
> > > used for design and development.
> > 
> > Formats have dependencies, too, but perhaps a little less than if you add
> > selections to the mix, too. In any case this should be documented in a
> > different section.
> 
> You can pick the section in which you'd like to document this :-)
> 
> > > > +ID is set to the same stream ID associated with either sink or source pads
> > > > +of routes configured using the :ref:`VIDIOC_SUBDEV_S_ROUTING
> > > > +<VIDIOC_SUBDEV_G_ROUTING>` ioctl.
> > > >  
> > > >  Multiplexed streams setup example
> > > >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 

-- 
Kind regards,

Sakari Ailus
