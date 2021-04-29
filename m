Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4625836E2F2
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 03:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbhD2B2k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 21:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhD2B2k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 21:28:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EBE9C06138B
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 18:27:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DCE08E5;
        Thu, 29 Apr 2021 03:27:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619659671;
        bh=aVx3wJzFyEZuPYQIcDdTeCq7zrdPRDwYCuiUGKbp6RM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GHIs6Ryr9o3OLv/+WnjVO7bwmapq4NjlFMAdWZpz7/H5JJj/QKwUaipn6foCSZQTo
         J4vI+sgQs85cyg0OWo05gmoFpJWEd0iXoliIQvNBMOB4jmHYNVg9101FDSNelFS9Fq
         8YKQ+mwIkLraUs21Odxd4sg8VD4h4PIU+dLD0qzA=
Date:   Thu, 29 Apr 2021 04:27:45 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 00/24] v4l: subdev internal routing
Message-ID: <YIoLkTGv3QtqvT5m@pendragon.ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <YHxtL6CM+AaV9+AG@pendragon.ideasonboard.com>
 <c3a6de40-e99a-7f4e-f36f-1b161d3be6df@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c3a6de40-e99a-7f4e-f36f-1b161d3be6df@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Wed, Apr 21, 2021 at 03:57:07PM +0300, Tomi Valkeinen wrote:
> On 18/04/2021 20:32, Laurent Pinchart wrote:
> > On Thu, Apr 15, 2021 at 04:04:26PM +0300, Tomi Valkeinen wrote:
> >> Hi,
> >>
> >> This is an RFC for subdev internal routing which is needed for
> >> multiplexed streams support. I believe this is essentially a v5 of the
> >> series, the v4 posted here:
> >>
> >> https://lore.kernel.org/linux-media/20190328200608.9463-1-jacopo+renesas@jmondi.org/
> >>
> >> Most of the patches are not changed (aside from fixing rebase issues
> >> etc). The major changes in this version are:
> >>
> >> 1) Added 'which' field to the routing structs. It is currently not used,
> >> as implementing it is not trivial. However, I think it's good to add it
> >> to the uAPI now, and require the field to be set to
> >> V4L2_SUBDEV_FORMAT_ACTIVE for now. See this RFC for an idea how this
> >> could be implemented:
> >>
> >> https://lore.kernel.org/linux-media/20210409133659.389544-1-tomi.valkeinen@ideasonboard.com/
> > 
> > I've reviewed that, and I like it, but it's not straightforward to
> > understand from that patch how you envision TRY to be implemented.
> 
> To be honest I don't have much at all experience with TRY. But, afaics, 
> if we have means to store the TRY routes, and that is passed to the 
> relevant ioctls in the subdev's, isn't that enough? It's up to the 
> driver to implement the TRY functionality.

That should be fine yes.

> Although currently the S_ROUTING won't return anything to the userspace, 
> it's supposed to either accept the routing table or return an error, 
> whereas the S_FMT will do it's best to come up with a working setup and 
> return it.

That part is fine, as long as userspace has a way to figure out what
routes can be enabled, it's an good behaviour.

> >> 2) No hardcoded maximum number of routes. Defining a maximum is not
> >> possible, as there can be an arbitrary amount of routes per pad, and
> >> there can be an arbitrary amount of pads per subdev. This series
> >> allocates space for the routing table dynamically, which unfortunately
> >> leads to not-just-a-few allocs and frees.
> >>
> >> 3) When searching for a format for a stream, the v4 looked for a
> >> non-multiplexed pad only as far as the "other" side of the subdev. It
> >> wouldn't work for a subdev which has multiplexed sink and source pads.
> >> This series implements a "deep" get-format (v4l2_subdev_get_format_dir)
> >> which follows a stream either towards the original source or the final
> >> sink, while looking for a non-multiplexed pad with a format.
> >>
> >> Some thoughts:
> >>
> >> 1) Link validation and v4l2_subdev_get_format_dir need to look at the
> >> routing, and this leads to multiple allocs to get a copy of the routing
> >> table. There might be a possibility here to keep a table allocated and
> >> re-use it in consecutive get_routing calls.
> >>
> >> Or even better, perhaps the kAPI could be changed so that allocs are not
> >> needed. I thought about a kAPI where the subdev just returns a pointer
> >> to its routing table, but then we hit the life-cycle problem: how to
> >> ensure the table won't be freed or changed until the caller is done.
> > 
> > Storing the routing table in the v4l2_subdev_config (or
> > v4l2_subdev_state) would be one way to do so, and I'd like to explore
> > that direction. State lifetime is indeed an issue, and one simple option
> > would be to just take the graph lock to modify the routing.
> > 
> >> 2) The routing uAPI is a bit vague. There is no way for the userspace to
> >> figure out what kind of routing is allowed. Also, the existence of a
> >> route in the routing table already indicates that the route is active,
> >> but we also have V4L2_SUBDEV_ROUTE_FL_ACTIVE. I decided to keep
> >> V4L2_SUBDEV_ROUTE_FL_ACTIVE for now, even if it doesn't really provide
> >> any feature.
> > 
> > We can't report all possible routes if we take streams into account, but
> > maybe we could report all possible routes between pads ? This could go
> > through a separate ioctl.
> 
> That should be doable, but I wonder how much it helps. We should also 
> somehow indicate if, say, routes from two source pads can go to the same 
> sink pads, or can two streams from a single source pad go to separate 
> sink pads, and so on. Is it better just to document what the driver 
> supports for a specific hardware, than try to come up with a machine 
> readable representation of the possible routings.

I'd like userspace to have at least some level of genericity. I have two
devices in mind that have cross-bar switches between CSI-2 receivers and
DMA engines (or further processing pipelines), and I'd like that part to
be handled by userspace code that isn't device-specific. We can focus on
the API to configure routing first, and then see how discoverability
could be implemented.

-- 
Regards,

Laurent Pinchart
