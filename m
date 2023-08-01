Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 958CD76B81C
	for <lists+linux-media@lfdr.de>; Tue,  1 Aug 2023 16:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbjHAO5c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Aug 2023 10:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231809AbjHAO5b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Aug 2023 10:57:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6660122
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 07:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690901849; x=1722437849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=63hQSRWluWdL0m6ik+cPNe3ahzlzxaZKxEmGlI6Qw1Q=;
  b=cH7jWUGuWYXFXTMYmWwM5tP3UEoAS9adP2qOpQoW8mkjZrl1Gd3mW+K4
   YTSOssrr8etdNSOlfqpkOM6GQAPxA7vv+qSxuN0DnY6m+Nn/ABxmpy/z6
   +FlucDoGnu8FjGgWva4ohr4if3K35qJ4EpNuI85c1j3gWO2h57+mVbzIa
   fyjBAx0911xAEcfJLnT6mCdD8EZesH8MoQd9B6lUhtC6RvGtzhoAZzYr5
   0TSm5vhuhmFeKg/yvxX2HY72ojXKycU0ztflJUVjgJU+MokmyMjfqkmdt
   F0Xn0yet+OyFoV3Q+gsdXXKOGP24vibj4++Szd4MPA5JHZ3duUux9o03A
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="433158105"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="433158105"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 07:56:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="818823007"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="818823007"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 07:56:52 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 5271211FAE8;
        Tue,  1 Aug 2023 17:56:49 +0300 (EEST)
Date:   Tue, 1 Aug 2023 14:56:49 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl
Subject: Re: [PATCH 4/7] media: uapi: v4l: Document source routes
Message-ID: <ZMkdMf+5bZrGvunR@kekkonen.localdomain>
References: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
 <20230630204338.126583-5-sakari.ailus@linux.intel.com>
 <qiomumxpmbhtowvpdorruk74gcrsbab6c5vfchcfmdt5cd34pi@i7cdk3g6f2ff>
 <ZKlS3e5BJqvTEk+5@kekkonen.localdomain>
 <wenqkwuulzv45uheym3h2mwkgxfeatmtwh4tabvf7pwmoilfgo@akjhsd7d4bp6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wenqkwuulzv45uheym3h2mwkgxfeatmtwh4tabvf7pwmoilfgo@akjhsd7d4bp6>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Jul 10, 2023 at 02:53:50PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Sat, Jul 08, 2023 at 12:13:17PM +0000, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Mon, Jul 03, 2023 at 09:47:37AM +0200, Jacopo Mondi wrote:
> > > Hi Sakari
> > >
> > > On Fri, Jun 30, 2023 at 11:43:35PM +0300, Sakari Ailus wrote:
> > > > Document how internal pads are used on source routes.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  .../userspace-api/media/v4l/dev-subdev.rst    | 20 +++++++++++++++++++
> > > >  1 file changed, 20 insertions(+)
> > > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > index a4f1df7093e8..5a46c9a9d352 100644
> > > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > @@ -551,6 +551,26 @@ A stream at a specific point in the media pipeline is identified by the
> > > >  sub-device and a (pad, stream) pair. For sub-devices that do not support
> > > >  multiplexed streams the 'stream' field is always 0.
> > > >
> > > > +.. _v4l2-subdev-source-routes:
> > > > +
> > > > +Source routes
> > > > +^^^^^^^^^^^^^
> > >
> > > I always found the concept of source routes a bit confusing, should we
> > > instead just present internal pads ?
> > >
> > > > +
> > > > +Cases where a single sub-device pad is a source of multiple streams are special
> > > > +as there is no external sink pad for such a route. In those cases, the sources
> > > > +of the streams are indicated by source routes that have an internal source pad
> > > > +as the sink pad of such a route. Internal source pads have the
> > > > +:ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>` and ``MEDIA_PAD_FL_SINK``
> > > > +pad flags set.
> > >
> > > All this last part is a little bit hard to parse, not your fault but
> > > the fact "internal source pads" are actually "SINK" pads is a bit
> > > confusing ?
> > >
> > > Can we remove the "source route" concept to avoid mixing source/sink ?
> > >
> > > This can be rewritten as
> > >
> > > Internal pads
> > > ^^^^^^^^^^^^^
> > >
> > > Cases where a single sub-device pad is a source of multiple streams are special
> > > as there is no external sink pad for such a route. A typical example is a
> > > sensor device which produces a video stream and a metadata stream of
> > > embedded data. To support such cases internal pads are introduced as
> > > sink pads of such internally generated streams.
> > > Internal source pads have the :ref:`MEDIA_PAD_FL_INTERNAL
> > > <MEDIA-PAD-FL-INTERNAL>` and ``MEDIA_PAD_FL_SINK`` pad flags set.
> > >
> > > > +Internal source pads have all the properties of a sink pad in such case,
> > >
> > > Also here, "Internal source pads" are actually sinks :)
> > >
> > > I would drop "source" from "Internal source pads"
> >
> > How about this (compared to the patch):
> >
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index 5a46c9a9d352..9d544a29e78a 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -553,21 +553,23 @@ multiplexed streams the 'stream' field is always 0.
> >
> >  .. _v4l2-subdev-source-routes:
> >
> > -Source routes
> > -^^^^^^^^^^^^^
> > -
> > -Cases where a single sub-device pad is a source of multiple streams are special
> > -as there is no external sink pad for such a route. In those cases, the sources
> > -of the streams are indicated by source routes that have an internal source pad
> > -as the sink pad of such a route. Internal source pads have the
> > -:ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>` and ``MEDIA_PAD_FL_SINK``
> > -pad flags set.
> > -
> > -Internal source pads have all the properties of a sink pad in such case,
> > -including formats and selections. The format in this case is the source format
> > -of the stream. An internal pad always has a single stream only (0).
> > -
> > -Generally source routes are not modifiable but they can be activated and
> > +Internal pads and source routes
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +Cases where a single sub-device source pad is traversed by multiple streams one
> > +or more of which originate from within the sub-device itself are special as
> > +there is no external sink pad for such routes. In those cases, the sources of
> 
> "external" made me think of "a different entity". Can we just drop it
> or am I too easy to confuse ?

Now that we have an INTERNAL flag, we need to differentiate with internal
pads and external pads. Routes are inherently internal to the entity, after
all, so there should be little room for confusion.

And there is a pad, just that it happens to have the INTERNAL flag...

> 
> > +the internally generated streams are indicated by internal pads, pads which have
> 
> s/indicated by/represented by/ ?
> 
> 'internal pads, pads...'
> 
> or
> 
> /internal pads, which are sink pads with the
> :ref:`MEDIA_PAD_FL_INTERNAL` <MEDIA-PAD-FL-INTERNAL> pad flag set.'
> 
> and drop the "on the sink pad of the route" ?

How about:

	In those cases, the sources of the internally generated streams are
	indicated by internal sink pads, which are sink pads that have the
	:ref:`MEDIA_PAD_FL_INTERNAL` <MEDIA-PAD-FL-INTERNAL> pad flag set.

The intent was to explain the properties of the internal pads.

> 
> 
> > +a :ref:`MEDIA_PAD_FL_INTERNAL` <MEDIA-PAD-FL-INTERNAL> pad flag set on the sink
> > +pad of the route. A typical use case for these is a camera sensor device which
> > +produces a pixel data stream and an embedded data stream.
> 
> This case is represented with two internal sink pads for the video and
> the data streams and a single multiplexed source pad that connects to
> the next entity in the pipeline.

How about:

	This case is represented with two internal sink pads, one for the
	video and another for the embedded data streams and a single source
	pad that connects to the next entity in the pipeline.

I feel this can, as the previous sentence, moved to the example section.

> 
> > +
> > +Internal pads have all the properties of an external pad, including formats and
> > +selections. The format in this case is the source format of the stream. An
> > +internal pad always has a single stream only (0).
> > +
> > +/Source routes/ are routes from an internal sink pad to a(n external) source
> > +pad. Generally source routes are not modifiable but they can be activated and
> >  deactivated using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
> >  <v4l2-subdev-routing-flags>` flag, depending on driver capabilities.
> 
> If you want to keep the part about source routes, this form is ok with
> me!

Thanks. I think it'd be useful to be able to refer to something like
"source routes", as the alternative is to try to refer to "internal source
pads" that have the sink pad flag set...

> 
> >
> > I'll also check the ACTIVE route flag, it wasn't merged with the rest of
> > the Tomi's streams series.

-- 
Kind regards,

Sakari Ailus
