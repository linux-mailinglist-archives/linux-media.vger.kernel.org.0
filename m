Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5FB365D92
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 18:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbhDTQmX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 12:42:23 -0400
Received: from mga05.intel.com ([192.55.52.43]:45655 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232767AbhDTQmW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 12:42:22 -0400
IronPort-SDR: l7/KVfX+vLbSDKNP1apKt6p1yuXsSaYTHAiaf8ODRwzuDCRsy4WaKK6pxXZ2/fNLhsHpkWD9H/
 bX0fZ5W2vEKw==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="280871417"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; 
   d="scan'208";a="280871417"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 09:41:51 -0700
IronPort-SDR: DB1f4PkyUSGSKFrQvNcL6lmUGdeN7hDd3TrfO3wIvlen/n9ag+M3U5DearT2EMufcqUtDZtgsY
 H1Vj5vGxMc+A==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; 
   d="scan'208";a="452570551"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 09:41:49 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 9B1F92051E;
        Tue, 20 Apr 2021 19:41:47 +0300 (EEST)
Date:   Tue, 20 Apr 2021 19:41:47 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 20/24] v4l: mc: Add an S_ROUTING helper function for
 power state changes
Message-ID: <20210420164147.GV3@paasikivi.fi.intel.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-21-tomi.valkeinen@ideasonboard.com>
 <YHyArMhUhcamSf++@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YHyArMhUhcamSf++@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Apr 18, 2021 at 09:55:40PM +0300, Laurent Pinchart wrote:
> Hi Tomi and Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Apr 15, 2021 at 04:04:46PM +0300, Tomi Valkeinen wrote:
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > With the addition of the has_route() media entity operation, all pads of an
> > entity are no longer interconnected. The S_ROUTING IOCTL for sub-devices can
> > be used to enable and disable routes for an entity. The consequence is that
> > the routing information has to be taken into account in use count
> > calculation: disabling a route has a very similar effect on use counts as
> > has disabling a link.
> > 
> > Add a helper function for drivers implementing VIDIOC_SUBDEV_S_ROUTING
> > IOCTL to take the change into account.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/v4l2-core/v4l2-mc.c | 34 +++++++++++++++++++++++++++++++
> >  include/media/v4l2-mc.h           | 22 ++++++++++++++++++++
> >  2 files changed, 56 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
> > index 35d18ed89fa5..71acb389aa7b 100644
> > --- a/drivers/media/v4l2-core/v4l2-mc.c
> > +++ b/drivers/media/v4l2-core/v4l2-mc.c
> > @@ -588,3 +588,37 @@ int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_pipeline_link_notify);
> > +
> > +int v4l2_subdev_routing_pm_use(struct media_entity *entity,
> > +			       struct v4l2_subdev_route *route)
> > +{
> > +	struct media_graph *graph =
> > +		&entity->graph_obj.mdev->pm_count_walk;
> > +	struct media_pad *source = &entity->pads[route->source_pad];
> > +	struct media_pad *sink = &entity->pads[route->sink_pad];
> > +	int source_use;
> > +	int sink_use;
> > +	int ret;
> > +
> > +	source_use = pipeline_pm_use_count(source, graph);
> > +	sink_use = pipeline_pm_use_count(sink, graph);
> > +
> > +	if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE)) {
> > +		/* Route disabled. */
> > +		pipeline_pm_power(source, -sink_use, graph);
> > +		pipeline_pm_power(sink, -source_use, graph);
> > +		return 0;
> > +	}
> > +
> > +	/* Route enabled. */
> > +	ret = pipeline_pm_power(source, sink_use, graph);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = pipeline_pm_power(sink, source_use, graph);
> > +	if (ret < 0)
> > +		pipeline_pm_power(source, -sink_use, graph);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_subdev_routing_pm_use);
> 
> .s_power() is getting deprecated for sensors. Sakari, should we move
> away from pipeline-based power management and drop this patch, or is it
> too early ?

Good question.

I've previously requested that instead of adding s_power support for bridge
and ISP drivers, sensor drivers used with them should be converted to
runtime PM instead. So proceeding along those lines, this code isn't
necessary. I'd actually drop it if there's no sound use case (I don't think
so).

> 
> > diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
> > index c181685923d5..ab8f4dc143aa 100644
> > --- a/include/media/v4l2-mc.h
> > +++ b/include/media/v4l2-mc.h
> > @@ -18,6 +18,7 @@
> >  /* We don't need to include pci.h or usb.h here */
> >  struct pci_dev;
> >  struct usb_device;
> > +struct v4l2_subdev_route;
> >  
> >  #ifdef CONFIG_MEDIA_CONTROLLER
> >  /**
> > @@ -184,6 +185,22 @@ void v4l2_pipeline_pm_put(struct media_entity *entity);
> >  int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
> >  			      unsigned int notification);
> >  
> > +/**
> > + * v4l2_subdev_routing_pm_use - Handle power state changes due to S_ROUTING
> > + * @entity: The entity
> > + * @route: The new state of the route
> > + *
> > + * Propagate the use count across a route in a pipeline whenever the
> > + * route is enabled or disabled. The function is called before
> > + * changing the route state when enabling a route, and after changing
> > + * the route state when disabling a route.
> > + *
> > + * Return 0 on success or a negative error code on failure. Powering entities
> > + * off is assumed to never fail. This function will not fail for disconnection
> > + * events.
> 
> "disconnection events" make me think about hotplug. How about "will not
> fail when disabling a route" ?
> 
> > + */
> > +int v4l2_subdev_routing_pm_use(struct media_entity *entity,
> > +			       struct v4l2_subdev_route *route);
> >  #else /* CONFIG_MEDIA_CONTROLLER */
> >  
> >  static inline int v4l2_mc_create_media_graph(struct media_device *mdev)
> > @@ -219,5 +236,10 @@ static inline int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
> >  	return 0;
> >  }
> >  
> > +static inline int v4l2_subdev_routing_pm_use(struct media_entity *entity,
> > +					     struct v4l2_subdev_route *route)
> > +{
> > +	return 0;
> > +}
> 
> Missing blank line.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> (assuming we want to keep the patch)
> 
> >  #endif /* CONFIG_MEDIA_CONTROLLER */
> >  #endif /* _V4L2_MC_H */
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Sakari Ailus
