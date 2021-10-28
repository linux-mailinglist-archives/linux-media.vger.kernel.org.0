Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F99043DD64
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 11:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbhJ1JFN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 05:05:13 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:44235 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhJ1JFN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 05:05:13 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D4BE5FF808;
        Thu, 28 Oct 2021 09:02:41 +0000 (UTC)
Date:   Thu, 28 Oct 2021 11:03:31 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 06/13] media: subdev: Add for_each_active_route() macro
Message-ID: <20211028090331.sccuthk5h3tw22f3@uno.localdomain>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
 <20211017182449.64192-7-jacopo+renesas@jmondi.org>
 <8c16cd01-48c6-ecc8-4437-e597559f492f@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8c16cd01-48c6-ecc8-4437-e597559f492f@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Thu, Oct 28, 2021 at 11:32:12AM +0300, Tomi Valkeinen wrote:
> On 17/10/2021 21:24, Jacopo Mondi wrote:
> > Add a for_each_active_route() macro to replace the repeated pattern
> > of iterating on the active routes of a routing table.
> >
> > Replace the existing occurrences of such pattern in the codebase.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >   drivers/media/i2c/ds90ub913.c             |  8 ++------
> >   drivers/media/i2c/ds90ub953.c             |  7 ++-----
> >   drivers/media/i2c/ds90ub960.c             |  8 ++------
> >   drivers/media/i2c/max9286.c               | 10 ++--------
> >   drivers/media/platform/ti-vpe/cal-video.c |  9 ++-------
> >   drivers/media/v4l2-core/v4l2-subdev.c     | 18 ++++++++++++++++++
> >   include/media/v4l2-subdev.h               | 11 +++++++++++
> >   7 files changed, 39 insertions(+), 32 deletions(-)
> >
>
> ...
>
> > +struct v4l2_subdev_route *next_active_route(const struct v4l2_subdev_krouting *routing,
> > +					    struct v4l2_subdev_route *route)
> > +{
> > +	if (route)
> > +		++route;
> > +	else
> > +		route = &routing->routes[0];
> > +
> > +	for (; route < routing->routes + routing->num_routes; ++route) {
> > +		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> > +			continue;
> > +
> > +		return route;
> > +	}
> > +
> > +	return NULL;
> > +}
>
> Also, this must be exported. I'll add that. And probably better to have a

Does it ? I would rather have it in the header, as this is only
meant to be called by the for_each_active_route() macro, and not by
other users. However it seemed to be rather long to be defined as a
static inline function in the header, so I opted to move it to the c
file.

To be honest, it's not clear to me what happens if a module calls the
for_each_active_route() macro that calls this non-exported function,
so you're probably correct.

However exporting the symbol makes it available globally, but I guess
that's not a big deal if it's clearly documented that drivers shall
not call this directly (or maybe we want it to be available globally,
why not...)

> prefix in the function name.

This might be a good idea!

Thanks
   j

>
>  Tomi
