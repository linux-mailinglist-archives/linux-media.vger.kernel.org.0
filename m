Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9FBB1892A3
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 01:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbgCRARe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 20:17:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59840 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727407AbgCRARe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 20:17:34 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD321F9;
        Wed, 18 Mar 2020 01:17:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584490651;
        bh=Pkmt4J2cFmJ3k4amimX8dF5qUv4iFEjuVFtyJPaPhc0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IaIRjs9OPt8FKB7TLePsIpk1jXWhPmN7FU715kUW/3uwgyD9o2XpfFFb2cH2hoXSN
         3h96cZJQoxmu9PSOSGDdHODRtE7l2jbsHP4OuOKEV0iZMKXcJxKW4ydpS0oTKiHINt
         Hcse+9WIkD14eTgcvy2tnOKn9w5OP4U8LLACz4hI=
Date:   Wed, 18 Mar 2020 02:17:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: v4l2-async: Accept endpoints and devices for
 fwnode matching
Message-ID: <20200318001726.GQ2527@pendragon.ideasonboard.com>
References: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200315125511.25756-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200317124455.GC13878@kekkonen.localdomain>
 <20200317230432.GO2527@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200317230432.GO2527@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Mar 18, 2020 at 01:04:32AM +0200, Laurent Pinchart wrote:
> On Tue, Mar 17, 2020 at 02:44:56PM +0200, Sakari Ailus wrote:
> > On Sun, Mar 15, 2020 at 02:55:11PM +0200, Laurent Pinchart wrote:
> > > fwnode matching was designed to match on nodes corresponding to a
> > > device. Some drivers, however, needed to match on endpoints, and have
> > > passed endpoint fwnodes to v4l2-async. This works when both the subdev
> > > and the notifier use the same fwnode types (endpoint or device), but
> > > makes drivers that use different types incompatible.
> > > 
> > > Fix this by extending the fwnode match to handle fwnodes of different
> > > types. When the types (deduced from the node name) are different,
> > > retrieve the device fwnode for the side that provides an endpoint
> > > fwnode, and compare it with the device fwnode provided by the other
> > > side. This allows interoperability between all drivers, regardless of
> > > which type of fwnode they use for matching.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > > This has been compile-tested only. Prabhakar, could you check if it
> > > fixes your issue ?
> > > 
> > >  drivers/media/v4l2-core/v4l2-async.c | 42 +++++++++++++++++++++++++++-
> > >  1 file changed, 41 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > index 8bde33c21ce4..995e5464cba7 100644
> > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > @@ -71,7 +71,47 @@ static bool match_devname(struct v4l2_subdev *sd,
> > >  
> > >  static bool match_fwnode(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> > >  {
> > > -	return sd->fwnode == asd->match.fwnode;
> > > +	struct fwnode_handle *other_fwnode;
> > > +	struct fwnode_handle *dev_fwnode;
> > > +	bool asd_fwnode_is_ep;
> > > +	bool sd_fwnode_is_ep;
> > > +	const char *name;
> > > +
> > > +	/*
> > > +	 * Both the subdev and the async subdev can provide either an endpoint
> > > +	 * fwnode or a device fwnode. Start with the simple case of direct
> > > +	 * fwnode matching.
> > > +	 */
> > > +	if (sd->fwnode == asd->match.fwnode)
> > > +		return true;
> > > +
> > > +	/*
> > > +	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
> > > +	 * endpoint or a device. If they're of the same type, there's no match.
> > > +	 */
> > > +	name = fwnode_get_name(sd->fwnode);
> > > +	sd_fwnode_is_ep = name && strstarts(name, "endpoint");
> > > +	name = fwnode_get_name(asd->match.fwnode);
> > > +	asd_fwnode_is_ep = name && strstarts(name, "endpoint");
> > 
> > Apart from the fact that you're parsing graph node names here, this looks
> > good.

And why is that an issue btw ? the ACPI fwnode ops seem to provide a
.get_name() operation, would it return the ACPI bus ID here ?

> > How about checking instead that calling
> > fwnode_graph_get_remote_endpoint(fwnode_graph_get_remote_endpoint()) yields
> > the same node? That would ensure you're dealing with endpoint nodes without
> > explicitly parsing the graph in any way.
> 
> Would it be simpler to check for the presence of an endpoint property ?
> 
> > Just remember to drop the references.
> > 
> > > +
> > > +	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
> > > +		return false;
> > > +
> > > +	/*
> > > +	 * The sd and asd fwnodes are of different types. Get the device fwnode
> > > +	 * parent of the endpoint fwnode, and compare it with the other fwnode.
> > > +	 */
> > > +	if (sd_fwnode_is_ep) {
> > > +		dev_fwnode = fwnode_graph_get_port_parent(sd->fwnode);
> > > +		other_fwnode = asd->match.fwnode;
> > > +	} else {
> > > +		dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
> > > +		other_fwnode = sd->fwnode;
> > > +	}
> > > +
> > > +	fwnode_handle_put(dev_fwnode);
> > > +
> > > +	return dev_fwnode == other_fwnode;
> > >  }
> > >  
> > >  static bool match_custom(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)

-- 
Regards,

Laurent Pinchart
