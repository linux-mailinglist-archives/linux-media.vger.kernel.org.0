Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7845FD5AB
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 09:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiJMHma (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 03:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiJMHm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 03:42:29 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4329B12587D
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 00:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665646948; x=1697182948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=O2iaRfwzJiP0DmlLT+sGTI2EjopBx21dp80D5iGKn+g=;
  b=OEy5Lao3rrLhl3MusK8YsgDD88BJv4KKATBPy9KchpylOtflrp0bhbI5
   vJj5xlDjAWk5JODjsRnIa76Z7AM9uhQQ37oHT6fhvON+0QhhKlbuF7War
   ZLaWTQKP8DBxMvXZ3yg81Nt7ppIRQ8u8yRmJvDsDKqyfIIE+nj2ireVDM
   rxo6e0ivLzBZnM5RBY+2OdsVp+jj9hxmStogE9uKVR6UsY3F+ENz2UDHA
   DeafWjkbQ+WTx4KWnd66Kmbdo8+1bo43phm9Oh1mkV01yj+hnAXt6z1z6
   Ul0F/Ptodovdh9EKFQB4UAbKxhQkypxD7vy0VHv0G4vI1Umo/2c/hOWNd
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="306642427"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="306642427"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 00:41:42 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="716232422"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="716232422"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 00:41:40 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 1B111203F0;
        Thu, 13 Oct 2022 10:41:38 +0300 (EEST)
Date:   Thu, 13 Oct 2022 07:41:38 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Dafna Hirschfeld <dafna@fastmail.com>, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v15 08/19] media: subdev: Add for_each_active_route()
 macro
Message-ID: <Y0fBMnu9QXplW+FW@paasikivi.fi.intel.com>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
 <20221003121852.616745-9-tomi.valkeinen@ideasonboard.com>
 <20221009053859.fmiiwdu4rjxe5c7g@guri>
 <c8a132f8-0f42-a720-72d1-06c29a90c5fc@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8a132f8-0f42-a720-72d1-06c29a90c5fc@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 12, 2022 at 09:15:31AM +0300, Tomi Valkeinen wrote:
> On 09/10/2022 08:38, Dafna Hirschfeld wrote:
> > On 03.10.2022 15:18, Tomi Valkeinen wrote:
> > > From: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > 
> > > Add a for_each_active_route() macro to replace the repeated pattern
> > > of iterating on the active routes of a routing table.
> > > 
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > ---
> > > .clang-format                         |  1 +
> > > drivers/media/v4l2-core/v4l2-subdev.c | 20 ++++++++++++++++++++
> > > include/media/v4l2-subdev.h           | 13 +++++++++++++
> > > 3 files changed, 34 insertions(+)
> > > 
> > > diff --git a/.clang-format b/.clang-format
> > > index 1247d54f9e49..31f39ae78f7b 100644
> > > --- a/.clang-format
> > > +++ b/.clang-format
> > > @@ -190,6 +190,7 @@ ForEachMacros:
> > >   - 'for_each_active_dev_scope'
> > >   - 'for_each_active_drhd_unit'
> > >   - 'for_each_active_iommu'
> > > +  - 'for_each_active_route'
> > >   - 'for_each_aggr_pgid'
> > >   - 'for_each_available_child_of_node'
> > >   - 'for_each_bench'
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c
> > > b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index 3ae4f39a50e4..1049c07d2e49 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -1212,6 +1212,26 @@ int v4l2_subdev_set_routing(struct
> > > v4l2_subdev *sd,
> > > }
> > > EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
> > > 
> > > +struct v4l2_subdev_route *
> > > +__v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting
> > > *routing,
> > > +                struct v4l2_subdev_route *route)
> > > +{
> > > +    if (route)
> > > +        ++route;
> > > +    else
> > > +        route = &routing->routes[0];
> > > +
> > > +    for (; route < routing->routes + routing->num_routes; ++route) {
> > > +        if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> > > +            continue;
> > > +
> > > +        return route;
> > > +    }
> > > +
> > > +    return NULL;
> > > +}
> > > +EXPORT_SYMBOL_GPL(__v4l2_subdev_next_active_route);
> > > +
> > > #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
> > > 
> > > #endif /* CONFIG_MEDIA_CONTROLLER */
> > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > index 7962e6572bda..89e58208e330 100644
> > > --- a/include/media/v4l2-subdev.h
> > > +++ b/include/media/v4l2-subdev.h
> > > @@ -1435,6 +1435,19 @@ int v4l2_subdev_set_routing(struct
> > > v4l2_subdev *sd,
> > >                 struct v4l2_subdev_state *state,
> > >                 const struct v4l2_subdev_krouting *routing);
> > > 
> > > +struct v4l2_subdev_route *
> > > +__v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting
> > > *routing,
> > > +                struct v4l2_subdev_route *route);
> > > +
> > > +/**
> > > + * for_each_active_route - iterate on all active routes of a
> > > routing table
> > > + * @routing: The routing table
> > > + * @route: The route iterator
> > > + */
> > > +#define for_each_active_route(routing, route) \
> > > +    for ((route) = NULL;                  \
> > > +         ((route) = __v4l2_subdev_next_active_route((routing),
> > > (route)));)
> > Hi, shouldn't it be something like:
> >      for ((route) = NULL; (route) ; (route) =
> > __v4l2_subdev_next_active_route((routing), (route)))
> 
> What you suggest would never do anything: you initialize route to NULL, and
> then check if the route is !NULL.
> 
> I also find the current version a bit "interesting", but afaics, it works
> correctly.

It would look better IMO written differently, yes. But this likely results
in fewer instructions so I'm fine with it. ;)

-- 
Sakari Ailus
