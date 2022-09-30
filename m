Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 960225F0BC8
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 14:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbiI3MeH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 08:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiI3MeG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 08:34:06 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540671730E2
        for <linux-media@vger.kernel.org>; Fri, 30 Sep 2022 05:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664541244; x=1696077244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WO3GE/2ObUa15c9wL4XKyJhzrzyJt6X3VLcSi5IKDvI=;
  b=dyGlZE7i4DizUrqNuFYurly0HnrXbaLrrP2u3agkN6pDyTj8O4FuwZRV
   TmETCX399Z2Xt7q9ZL/27EY6Y/EXp0aiPCOpITUTe8EnoRgfuY+jo+3Gm
   EWuqqb0OUHJDeYQq/hA3GtV3AZj/Ym2JgVbTkXZwrYeHo3zda7ADTtnmZ
   BV1wHEuVl6LRlcyo8xS+fWfNi4bHxtLI83SixOksjHdfQPxSobuzIVQ8d
   InRejpsANiNrOpV5Koy2qNvKcpvDcG+YPhmziUen5NiscQF509lTY5s3Y
   shnjJ2PGESeuuA7DaJ+gp36mv6Y0JjxPVNQpLMMuqaBb7xIS8hx9183zH
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="366228794"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; 
   d="scan'208";a="366228794"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2022 05:34:03 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="622756632"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; 
   d="scan'208";a="622756632"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2022 05:34:00 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 37CB820215;
        Fri, 30 Sep 2022 15:33:58 +0300 (EEST)
Date:   Fri, 30 Sep 2022 12:33:58 +0000
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
Subject: Re: [PATCH v14 19/34] media: Documentation: Add GS_ROUTING
 documentation
Message-ID: <YzbiNmtE8MLRjikr@paasikivi.fi.intel.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
 <20220831141357.1396081-20-tomi.valkeinen@ideasonboard.com>
 <YzKRMiumNoskMuxw@paasikivi.fi.intel.com>
 <97c4d4bc-9907-3ffc-1839-2678a30d53c4@ideasonboard.com>
 <YzLPOXkaWQe33g+q@paasikivi.fi.intel.com>
 <65aa282f-b75b-6cef-c1e8-94d9beb8971c@ideasonboard.com>
 <YzNnd2uoKk6JhyYC@paasikivi.fi.intel.com>
 <549f6c1b-7956-649a-ed60-eac73a56fdd4@ideasonboard.com>
 <YzbRJp6lUB9wCO+Q@paasikivi.fi.intel.com>
 <afb7a387-62ea-c252-d440-d5f8a0bb0d17@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afb7a387-62ea-c252-d440-d5f8a0bb0d17@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Fri, Sep 30, 2022 at 03:10:16PM +0300, Tomi Valkeinen wrote:
> Hei,
> 
> On 30/09/2022 14:21, Sakari Ailus wrote:
> > Moi,
> > 
> > On Wed, Sep 28, 2022 at 10:54:44AM +0300, Tomi Valkeinen wrote:
> > > Hi,
> > > 
> > > On 28/09/2022 00:13, Sakari Ailus wrote:
> > > > Moi,
> > > > 
> > > > On Tue, Sep 27, 2022 at 03:33:15PM +0300, Tomi Valkeinen wrote:
> > > > > On 27/09/2022 13:23, Sakari Ailus wrote:
> > > > > 
> > > > > <snip>
> > > > > 
> > > > > > > > > +All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called. This
> > > > > > > > > +means that the userspace mut reconfigure all streams after calling the ioctl
> > > > > > > > > +with e.g. ``VIDIOC_SUBDEV_S_FMT``.
> > > > > > > > 
> > > > > > > > How about this:
> > > > > > > > 
> > > > > > > > Calling ``VIDIOC_SUBDEV_S_ROUTING`` will cause the selections and subdev
> > > > > > > > formats being propagated from the sink pads towards the sources.
> > > > > > > 
> > > > > > > Hmm, but that's not true. The selections and formats will be zeroed, unless
> > > > > > > the driver initializes them to a value. There's no propagation done.
> > > > > > 
> > > > > > They need to be propagated. The driver is responsible for maintaining a
> > > > > > valid configuration for the processing steps in a sub-device, and with
> > > > > > routes that must apply to routes as well.
> > > > > 
> > > > > Hmm, no, they don't need to be propagated. The driver needs to initialize
> > > > > the formats and selections to valid configuration, that is true, but it
> > > > > doesn't mean the driver propagates settings from the sink pads to the source
> > > > > pads. In theory the formats on sink and source sides could be different.
> > > > 
> > > > After propagation, the user may set the format (or selection) later on in
> > > > the processing steps. The propagation is required by the spec and I don't
> > > > see why it would be different for drivers with support for streams. Of
> > > > course this needs to take place taking hardware limitations into account.
> > > 
> > > I don't disagree with the above, but I still don't see why it matters here.
> > 
> > It does. The user needs to be able to rely on the ability of the driver to
> > maintain valid internal configuration. That user generally has less
> > information on this than the driver.
> 
> I had a short chat with Sakari, and it seems there's no real issue here,
> mostly just a misunderstanding.
> 
> The action point is to clarify what "reset" means (it means resetting to
> driver default values, keeping the subdev configuration valid). And perhaps
> also highlighting somewhere that when e.g. setting the formats, propagation
> happens with subdevices using routes too.

Thanks. Sometimes e-mail just isn't enough. :-)

...

> > > If we have a CSI-2 receiver that has a hardcoded handling of the VC & DT,
> > > how does the userspace configure the routes? The userspace doesn't see the
> > > VCs or DTs. We could have static routes defined in the receiver subdevice,
> > > but does that help?
> > 
> > Good point. I think not.
> > 
> > I guess we would then leave the routes for the user to create and driver to
> > try to configure the hardware accordingly or fail in link validation?
> > 
> > Perhaps we won't need a static route flag then after all.
> > 
> > > 
> > > The HW I use, TI's CAL, has the means to configure VC/DT freely. But it has
> > > 8 DMA engines, and, of course, each stream has to go to a single DMA engine.
> > > So I think we could say that it has 8 static streams, and the user can only
> > > enable or disable them. But I'm not sure how much adding a new flag for this
> > > helps.
> > 
> > Could this be limited by only allowing to create eight routes?
> 
> Yes, and the driver should do that. But the driver should also verify the
> routing, so that each DMA engine only gets one route.
> 
> So here it might be possible to use a STATIC flag for the routes. Afaics,
> the only benefit of that would be to give a hint to the userspace about the
> possible routes. It's difficult to say if it's worth the trouble.

I'm fine with leaving out the flag. It seems it wouldn't have been as
useful in practice as I originally thought.

> 
> > > > Using one flag for two different purposes may thus prove problematic over
> > > > time. I'd thus define another for the other purpose. In the worst case it
> > > > won't be needed and we can make it obsolete later on.
> > > 
> > > I'd like to have a clear example of a setup where we need this flag and
> > > benefit from it before adding it.
> > > 
> > > In the CAL case I don't see much benefit. I think the only thing it gives us
> > > is a minimal discovery mechanism for the userspace to understand how CAL
> > > routes can be configured. I say minimal, as it still won't cover it fully as
> > > the validity of the routing depends on the actual VCs and DTs too (which
> > > will be found out only at the stream start time).
> > > 
> > > And this would only give us discovery for the receiver and wouldn't help
> > > with the bridges.
> > > 
> > > > > > > 
> > > > > > > But as I said above, I haven't figured out a use for this.
> > > > > > > 
> > > > > > > > > +      - 1
> > > > > > > > > +      - The route is immutable. Set by the driver.
> > > > > > > > > +    * - V4L2_SUBDEV_ROUTE_FL_SOURCE
> > > > > > > > > +      - 2
> > > > > > > > > +      - The route is a source route, and the ``sink_pad`` and ``sink_stream``
> > > > > > > > > +        fields are unused. Set by the driver.
> > > > > > > > > +
> > > > > > > > > +Return Value
> > > > > > > > > +============
> > > > > > > > > +
> > > > > > > > > +On success 0 is returned, on error -1 and the ``errno`` variable is set
> > > > > > > > > +appropriately. The generic error codes are described at the
> > > > > > > > > +:ref:`Generic Error Codes <gen-errors>` chapter.
> > > > > > > > > +
> > > > > > > > > +ENOSPC
> > > > > > > > > +   The number of provided route entries is less than the available ones.
> > > > > > > > 
> > > > > > > > What does "available ones" mean in this context? More than is supported?
> > > > > > > > Wouldn't E2BIG be the appropriate code in that case?
> > > > > > > 
> > > > > > > Good question. I don't think I wrote this part =). ENOSPC refers to the case
> > > > > > > where VIDIOC_SUBDEV_G_ROUTING is called without enough space for the routing
> > > > > > > table. So "available ones" mean the routes in the subdev's routing table,
> > > > > > > and "provided route entries" refers to the userspace target routing table.
> > > > > > > 
> > > > > > > It sounds pretty odd, and obviously needs a clarification.
> > > > > > 
> > > > > > I think I actually can think what this did mean. It means that the
> > > > > > num_routes is smaller than the number of routes in a routing table when
> > > > > > G_ROUTING is called. For that I think ENOSPC is the right code actually.
> > > > > > 
> > > > > > But also I think we need to document what happens when there are too many
> > > > > > routes. For that E2BIG would be appropriate.
> > > > > 
> > > > > v4l2-ioctl.c returns EINVAL if there are over 256 routes. The drivers
> > > > > should, of course, do additional check if needed. In v4l2-ioctl.c it seems
> > > > > common to return EINVAL if there's too much data, but we can of course
> > > > > define E2BIG for routing ioctls.
> > > > 
> > > > The number (256) is just the current limit. I don't expect more though.
> > > > 
> > > > But the user space could know the number is too large if we have a proper
> > > > error code for it. Up to you. However at least documentation needs to be
> > > > amended since this case remains undocumented.
> > > 
> > > I can change the returned error from EINVAL to E2BIG and document it. But
> > > everything else in check_array_args return EINVAL, so it would be going into
> > > different direction.
> > 
> > Could this be beneficial in telling the user too many routes have been
> > configured (as I wrote above)?
> 
> Yes, I think the driver should return E2BIG if there are too many routes.
> 
> But my question is, should v4l2-ioctl.c return E2BIG for > 256 routes?
> That's not how it works for all the other ioctls there, they return EINVAL.
> I don't mind changing that to E2BIG, but usually it's nice if the code is
> consistent.

From the user's point of view the "too many routes" condition is the same
independently of whether the information comes from the framework or the
driver. So I think using -E2BIG in the framework is the right thing to do.

-- 
Terveisin,

Sakari Ailus
