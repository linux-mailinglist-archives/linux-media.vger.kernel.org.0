Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED362068E7
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 02:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387922AbgFXANW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 20:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387693AbgFXANW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 20:13:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F1AC061573;
        Tue, 23 Jun 2020 17:13:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CF2D2A9;
        Wed, 24 Jun 2020 02:13:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592957599;
        bh=M68BYCDz1JVEV2EjFuHU6tktuW92HXc9WgbmwmcQSXM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=icZ6D4SBGPXi20NW53ENnACxgYy7LxNuFLyMxoOlv4aNDUjuObLcwQ4/EpXy17f/a
         mYn9gTe0NnFbGm/sMemHFAAw8qTLvvSUupt9cX9O698TMmTTvIWDXGaJAXUM18s4Fm
         pcqUI7ehXrBvamTUm5iCpGMSOffOXtwGXVGkTQy8=
Date:   Wed, 24 Jun 2020 03:12:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3 1/3] media: v4l2-async: Accept endpoints and devices
 for fwnode matching
Message-ID: <20200624001253.GS5870@pendragon.ideasonboard.com>
References: <20200621000028.4591-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621000028.4591-2-laurent.pinchart+renesas@ideasonboard.com>
 <20200623211306.GF870@valkosipuli.retiisi.org.uk>
 <20200623212241.GD5870@pendragon.ideasonboard.com>
 <20200623231205.GG870@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200623231205.GG870@valkosipuli.retiisi.org.uk>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Jun 24, 2020 at 02:12:05AM +0300, Sakari Ailus wrote:
> On Wed, Jun 24, 2020 at 12:22:41AM +0300, Laurent Pinchart wrote:
> > On Wed, Jun 24, 2020 at 12:13:06AM +0300, Sakari Ailus wrote:
> >> On Sun, Jun 21, 2020 at 03:00:26AM +0300, Laurent Pinchart wrote:
> >>> fwnode matching was designed to match on nodes corresponding to a
> >>> device. Some drivers, however, needed to match on endpoints, and have
> >>> passed endpoint fwnodes to v4l2-async. This works when both the subdev
> >>> and the notifier use the same fwnode types (endpoint or device), but
> >>> makes drivers that use different types incompatible.
> >>> 
> >>> Fix this by extending the fwnode match to handle fwnodes of different
> >>> types. When the types (deduced from the presence of remote endpoints)
> >>> are different, retrieve the device fwnode for the side that provides an
> >>> endpoint fwnode, and compare it with the device fwnode provided by the
> >>> other side. This allows interoperability between all drivers, regardless
> >>> of which type of fwnode they use for matching.
> >>> 
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>> ---
> >>> Changes since v2:
> >>> 
> >>> - Add comment to explain that we're matching connecting endpoints
> >>> - Don't check fwnode name to detect endpoint
> >>> ---
> >>>  drivers/media/v4l2-core/v4l2-async.c | 45 +++++++++++++++++++++++++++-
> >>>  1 file changed, 44 insertions(+), 1 deletion(-)
> >>> 
> >>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> >>> index 8bde33c21ce4..f82e0a32647d 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-async.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-async.c
> >>> @@ -71,7 +71,50 @@ static bool match_devname(struct v4l2_subdev *sd,
> >>>  
> >>>  static bool match_fwnode(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> >>>  {
> >>> -	return sd->fwnode == asd->match.fwnode;
> >>> +	struct fwnode_handle *other_fwnode;
> >>> +	struct fwnode_handle *dev_fwnode;
> >>> +	bool asd_fwnode_is_ep;
> >>> +	bool sd_fwnode_is_ep;
> >>> +
> >>> +	/*
> >>> +	 * Both the subdev and the async subdev can provide either an endpoint
> >>> +	 * fwnode or a device fwnode. Start with the simple case of direct
> >>> +	 * fwnode matching.
> >>> +	 */
> >>> +	if (sd->fwnode == asd->match.fwnode)
> >>> +		return true;
> >>> +
> >>> +	/*
> >>> +	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
> >>> +	 * endpoint or a device. If they're of the same type, there's no match.
> >>> +	 * Technically speaking this checks if the nodes refer to a connected
> >>> +	 * endpoint, which is the simplest check that works for both OF and
> >>> +	 * ACPI. This won't make a difference, as drivers should not try to
> >>> +	 * match unconnected endpoints.
> >>> +	 */
> >>> +	sd_fwnode_is_ep = fwnode_property_present(sd->fwnode,
> >>> +						  "remote-endpoint");
> >>> +	asd_fwnode_is_ep = fwnode_property_present(asd->match.fwnode,
> >>> +						   "remote-endpoint");
> >> 
> >> Please don't try parsing graph bindings outside the main parsers.
> > 
> > Why is that ? On the DT side, bindings are considered to be stable, so
> > isolating their parsing in helpers would not help with ABI compatibility
> > anyway. Maybe it would be useful if you could explain how graph parsing
> > works in ACPI ? The fact that there's a remote-endpoint property without
> > endpoints is a the minimum quite puzzling.
> 
> No other drivers (or frameworks to my knowledge) work with the graphs
> directly anymore. There was a staging driver (IMX) that did but that has
> been fixed now. It's easier to ensure the code is correct --- this is
> because the data structure is hard to parse, especially while taking
> firmware type differences into account but the functions that access it are
> relatively simple to use.
> 
> The fwnode property API has operations callbacks that are specific to the
> type of the node. Most access functions have a firmware specific backend.
> 
> With the presence of the "remote-endpoint" property there's no variation
> across the firmware types, at least not right now. But still putting it
> here right now looks like technical debt to me: much of the code parsing
> graph data structure outside the main parser has been buggy in the past.

For my information, could you still briefly explain how remote-endpoint
works on ACPI, without any fwnode named "endpoint" ?

> >> There's no API function to do just this, but you could go and check for the
> >> port parent right away. The code might be even more simple that way.
> > 
> > How will that help ? With OF at least, fwnode_graph_get_port_parent()
> > will return the grand-parent if the passed node isn't an endpoint, not
> > much can be deduced from that.
> 
> I meant to say fwnode_graph_get_remote_endpoint(). You'd need to release
> the fwnode reference, too.

That makes more sense :-)

> >> Alternatively, I guess we could add fwnode_graph_is_endpoint() or something
> >> but I wonder if it'd be worth it just for this.

Would

static inline bool fwnode_graph_is_endpoint(struct fwnode_handle *fwnode)
{
	return fwnode_property_present(fwnode, "remote-endpoint");
}

in include/linux/property.h be acceptable to you ?

> >>> +
> >>> +	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
> >>> +		return false;
> >>> +
> >>> +	/*
> >>> +	 * The sd and asd fwnodes are of different types. Get the device fwnode
> >>> +	 * parent of the endpoint fwnode, and compare it with the other fwnode.
> >>> +	 */
> >>> +	if (sd_fwnode_is_ep) {
> >>> +		dev_fwnode = fwnode_graph_get_port_parent(sd->fwnode);
> >>> +		other_fwnode = asd->match.fwnode;
> >>> +	} else {
> >>> +		dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
> >>> +		other_fwnode = sd->fwnode;
> >>> +	}
> >>> +
> >>> +	fwnode_handle_put(dev_fwnode);
> >>> +
> >>> +	return dev_fwnode == other_fwnode;
> >>>  }
> >>>  
> >>>  static bool match_custom(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)

-- 
Regards,

Laurent Pinchart
