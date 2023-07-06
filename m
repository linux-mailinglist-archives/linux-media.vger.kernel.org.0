Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E64A74994A
	for <lists+linux-media@lfdr.de>; Thu,  6 Jul 2023 12:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbjGFKUs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jul 2023 06:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjGFKUr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jul 2023 06:20:47 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F90EDD
        for <linux-media@vger.kernel.org>; Thu,  6 Jul 2023 03:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688638846; x=1720174846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b2g0Rq7Dh/JNTqpY93Q3NLRNNcLg8Tc0J1kamb0/pC4=;
  b=acxX6V+u9HKkJHqlXknmvg2doqrYCd/IvLEarK7K1yKDurMqfGlWEAn8
   hc+slxCf5zZg5n9FJgwE3NaA5/rfVSWjy6kRKH9EDAWZAHG1d9wM5iVqt
   bXOLgp3L0R+2OtCOYRwqxul7hsdwUo/PoDcV4IQj/wwJvuDjRlks03vpl
   YNMNB58YSXIprj4Qo2E5+Njrnmpq/PqJJ7Hq03AzXo/J1riP6/Ai8zLDz
   5KzcWbeoX+jy8BXyzMFcJ5QbGXAtZL8l9EsiiOGGeTIyELu9WyfL3XEWO
   NXzAxEVbsApHmyKDQvp0/paO2nB3RM3HmJI7aunyy/W92E203DOKtz2UN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="366141743"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="366141743"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 03:20:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="669712938"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="669712938"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 03:20:44 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 105F211F9ED;
        Thu,  6 Jul 2023 13:20:41 +0300 (EEST)
Date:   Thu, 6 Jul 2023 10:20:41 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl
Subject: Re: [PATCH 4/7] media: uapi: v4l: Document source routes
Message-ID: <ZKaVeU4TmbFWcIUZ@kekkonen.localdomain>
References: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
 <20230630204338.126583-5-sakari.ailus@linux.intel.com>
 <qiomumxpmbhtowvpdorruk74gcrsbab6c5vfchcfmdt5cd34pi@i7cdk3g6f2ff>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qiomumxpmbhtowvpdorruk74gcrsbab6c5vfchcfmdt5cd34pi@i7cdk3g6f2ff>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for the review.

On Mon, Jul 03, 2023 at 09:47:37AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Fri, Jun 30, 2023 at 11:43:35PM +0300, Sakari Ailus wrote:
> > Document how internal pads are used on source routes.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/dev-subdev.rst    | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index a4f1df7093e8..5a46c9a9d352 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -551,6 +551,26 @@ A stream at a specific point in the media pipeline is identified by the
> >  sub-device and a (pad, stream) pair. For sub-devices that do not support
> >  multiplexed streams the 'stream' field is always 0.
> >
> > +.. _v4l2-subdev-source-routes:
> > +
> > +Source routes
> > +^^^^^^^^^^^^^
> 
> I always found the concept of source routes a bit confusing, should we
> instead just present internal pads ?
> 
> > +
> > +Cases where a single sub-device pad is a source of multiple streams are special
> > +as there is no external sink pad for such a route. In those cases, the sources
> > +of the streams are indicated by source routes that have an internal source pad
> > +as the sink pad of such a route. Internal source pads have the
> > +:ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>` and ``MEDIA_PAD_FL_SINK``
> > +pad flags set.
> 
> All this last part is a little bit hard to parse, not your fault but
> the fact "internal source pads" are actually "SINK" pads is a bit
> confusing ?

Some confusion is bound to remain as we're using the sink end of the route
as a source.

> 
> Can we remove the "source route" concept to avoid mixing source/sink ?
> 
> This can be rewritten as
> 
> Internal pads
> ^^^^^^^^^^^^^
> 
> Cases where a single sub-device pad is a source of multiple streams are special
> as there is no external sink pad for such a route. A typical example is a
> sensor device which produces a video stream and a metadata stream of
> embedded data. To support such cases internal pads are introduced as
> sink pads of such internally generated streams.
> Internal source pads have the :ref:`MEDIA_PAD_FL_INTERNAL
> <MEDIA-PAD-FL-INTERNAL>` and ``MEDIA_PAD_FL_SINK`` pad flags set.

The latter part of this requires some further work.

> 
> > +Internal source pads have all the properties of a sink pad in such case,
> 
> Also here, "Internal source pads" are actually sinks :)
> 
> I would drop "source" from "Internal source pads"

Yes, I forgot to rework some of the documentation. I agree internal source
pads should no longer be mentioned as we no longer have the INTERNAL_SOURCE
flag.

> 
> 
> > +including formats and selections. The format in this case is the source format
> > +of the stream. An internal pad always has a single stream only (0).
> > +
> > +Generally source routes are not modifiable but they can be activated and
> 
> s/source routes/internal routes/ ?

I still think source routes make sense. But they should probably be added
to glossary somewhere.

> 
> > +deactivated using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > +<v4l2-subdev-routing-flags>` flag, depending on driver capabilities.
> > +
> >  Interaction between routes, streams, formats and selections
> >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >

-- 
Kind regards,

Sakari Ailus
