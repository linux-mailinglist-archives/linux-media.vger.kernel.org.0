Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C32D764580F
	for <lists+linux-media@lfdr.de>; Wed,  7 Dec 2022 11:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbiLGKi3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Dec 2022 05:38:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbiLGKiQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Dec 2022 05:38:16 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D9B60E8
        for <linux-media@vger.kernel.org>; Wed,  7 Dec 2022 02:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670409495; x=1701945495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nCtmHEL+L/Lg35lVKxZMqJmnF9bRBloCdnBgS6C+XNc=;
  b=h7W+bsxy8Tjh7SZlmS6hwBkoF9WFyTPDuf/E5jk7UQax/YQdog1l506G
   p7lz07RyhPMdTHl/ME7Own9nHWF76J584IT8l8xiC8yihZA0PBB5GU267
   HqIaSIQsvDJ9T8sfOajNYDUijRDYjjmrSfGrEyN81F01TpqDxdO3pZhmA
   lzGJwBZrR3HAVicJfYBBCcKpuo8r8EYUqZiCWrX/YH3O8N4UA76NdUGfl
   byyRa5T1iaR2zZ8+gXMuX/tXxdP+/eeuqG9SH9KUKdCjdfcXVHNK3lftR
   ftzg/MOsc6giiNKvJo04WfZtNjuQfOKr+2fUQ2ZV235K4bZ/07ZeUA/Bz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="403131683"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="403131683"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 02:38:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="679089197"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="679089197"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 02:38:11 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id BDBC12029D;
        Wed,  7 Dec 2022 12:38:08 +0200 (EET)
Date:   Wed, 7 Dec 2022 10:38:08 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH 1/1] media: Documentation: Interaction between routes,
 formats and selections
Message-ID: <Y5BtELJRWi4+ixbu@paasikivi.fi.intel.com>
References: <20221003121852.616745-10-tomi.valkeinen@ideasonboard.com>
 <20221011104729.1058-1-sakari.ailus@linux.intel.com>
 <dbe3ff30-df57-e981-90c1-3b917e9ee65f@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbe3ff30-df57-e981-90c1-3b917e9ee65f@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Wed, Oct 12, 2022 at 01:30:53PM +0300, Tomi Valkeinen wrote:
> Hoi,
> 
> On 11/10/2022 13:47, Sakari Ailus wrote:
> > Document how setting up routes interacts with formats and selections.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Moi,
> > 
> > This could be added on top of the set.
> > 
> > Comments are welcome.
> > 
> >   .../userspace-api/media/v4l/dev-subdev.rst    | 48 ++++++++++++++-----
> >   1 file changed, 37 insertions(+), 11 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index 5075b1828b32d..830235eb01598 100644
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
> > +Commonly V4L2 subdevices do not support multiple, unrelated video streams.
> 
> I wonder if we should use some other word than "commonly", as it seems
> pretty common nowadays that there is at least a embedded data. Should we
> instead say, e.g., "Simple V4L2 subdevices..."
> 
> > +Only a single stream can pass through a media link and a media
> 
> This could be a continuation of the previous sentence: "... video streams,
> and only a single stream..."

Sounds good (for both).

> 
> > +pad. Thus each pad contains a format and selection configuration for that single stream.
> > +A subdev can do stream processing and split a stream into
> > +two or compose two streams into one, but the inputs and outputs for the
> > +subdev are still a single stream per pad.
> >   Some hardware, e.g. MIPI CSI-2, support multiplexed streams, that is, multiple
> >   data streams are transmitted on the same bus, which is represented by a media
> > @@ -539,15 +541,37 @@ streams from one end of the link to the other, and subdevices have routing
> >   tables which describe how the incoming streams from sink pads are routed to the
> >   source pads.
> > -A stream ID (often just "stream") is a media link-local identifier for a stream.
> > +A stream ID is a media link-local identifier for a stream.
> >   In other words, a particular stream ID must exist on both sides of a media
> >   link, but another stream ID can be used for the same stream at the other side
> > -of the subdevice.
> > +of the subdevice. The same stream ID is used to refer to the stream on
> > +both pads of the link on all ioctls operating on pads.
> >   A stream at a specific point in the media pipeline is identified with the
> > -subdev and a (pad, stream) pair. For subdevices that do not support
> > +subdev and a pad--stream pair. For subdevices that do not support
> 
> Is there a double-dash on purpose?

Indeed a single one is correct here. I'l replace it, also below.

> 
> Btw, above you removed the "(often just "stream")", but here you use
> "stream" instead of "stream ID".

We shouldn't mix the two, indeed, as they are different. Indeed, I'll read
this through once more with that in mind.

> 
> >   multiplexed streams the 'stream' is always 0.
> > +Interaction between routes, formats and selections
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +The addition of routes to the V4L2 sub-device interface moves the
> > +sub-device formats and selections from pads to pad--stream pairs. Instead
> 
> I guess it is, as you use it here also...
> 
> > +of the sub-device wide merging of streams from all source pads towards all
> > +sink pads, this takes place separately for each route. The stream ID on
> > +the sink pad for each configured route is used to configure format and
> > +selections on the sink pad. Similarly, the stream ID on the source pad of
> > +each configured route is used to configure format and selections on the
> > +source pad.
> 
> Hmm, "stream ID is used to configure format" sounds odd to me. The ioctl is
> used to configure the format, but rather than using only pad ID to identify
> the configuration target, you now use pad ID - stream ID pair.

The text continues to say "on the sink pad". I think it's fine as-is.

> 
> And is that just extra duplication above to talk separately about sink and
> source sides? They don't matter here, the point is just the pad-stream vs
> only pad.

Yes, I'll rework the text for v2.

> 
> > +
> > +Any number of routes from streams on sink pads towards streams on source
> 
> This also sounds a bit odd to me: "a route from a stream on a sink pad". I
> think we're missing a word here which means the specific point of a stream
> in the pipeline.
> 
> I have suggested "stream endpoint", but it's not really an "end" point.
> "Stream waypoint"? So you would configure a format to a subdev's stream
> waypoint. And "Any number of routes from stream waypoints on sink pads
> towards stream waypoints on source pads".
> 
> So a "stream waypoint" would be a triplet of subdev-padID-streamID, or just
> padID-streamID if the subdev is obvious.
> 
> Even if we don't find a perfect or even a very good term for this, I think
> we should just use something. Using just "stream" makes things quite
> confusing, in my opinion.
> 
> > +pads is allowed, to the extent supported by drivers. For every stream on a
> > +sink pad, however, only a single route is allowed.
> 
> Hmm, why is that?

We could try to define and document what it would semantically mean but
there likely wouldn't be any devices that support it. The wording makes
future extensions possible in case we'll need it.

> 
> > +
> > +Pad--stream pairs are not static but are replaced by calls to the
> > +:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. This also
> > +applies to stream format and selection configurations which that are
> 
> Should that "applies to" be "affects the"?

I'll reword the paragraph.

> 
> > +reverted to driver defaults.
> > +
> >   Configuring streams
> >   ^^^^^^^^^^^^^^^^^^^
> > @@ -565,8 +589,10 @@ Controller API <media_controller>`
> >   setting the routing table will reset all the stream configurations in a media
> >   entity.
> > -3) Configure streams. Each route endpoint must be configured
> 
> Oh, here I seem to use "route endpoint".
> 
> > -with :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`.
> > +3) Configure formats and selections on routes. Each route is configured
> 
> I'm not sure if we "configure formats on routes". Earlier I think we've
> talked about configuring the streams (stream waypoints).

Each route has two pad id-stream id pairs (unless sink or source). But yes,
it would be more precise to also refer to pad / stream id pairs instead of
just routes. The propagation takes place in a route still.

I'll rework this for v2.

> 
> > +separately as documented plain subdevices in :ref:`<format-propagation>`.
> 
> Is there something missing from above? Or drop "plain subdevices"?

Yes.

> 
> > +The stream ID is set to the same stream ID used on sink and source pads of
> > +the :ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
> 
> Yes. But I think this could be said more clearly if we have a good word for
> the padID-streamID pair.

Good point. Unless it is clear enough that it refers to just that, it
probably will create more confusion than prevent any. If we didn't have
stream that means a different thing it'd be easy. I'm fine with the current
terminology though.

-- 
Terveisin,

Sakari Ailus
