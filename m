Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB255187514
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 22:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732750AbgCPVre (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 17:47:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40354 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732567AbgCPVre (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 17:47:34 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88162AC1;
        Mon, 16 Mar 2020 22:47:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584395252;
        bh=fuOVxwtUqKmFbrNjHiBCLgLqL3ddlyEdFohqvsGGjFc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WROT50KQYNCAhYYgYK+vJk2dN/XeRRhNffo1Vxi3McwDBE6LdVpSRzGGDlI4K7PkD
         XCLMPUKQyJK5rSSLB/dPcLgImxcJ0RwcQGN7MMS4fYSBccJOx10MGDPMPkTegpH3Jq
         Y8T4QKi/N4Q9tvP9l8XXL4P1BlOg8VNUKF/qdhrg=
Date:   Mon, 16 Mar 2020 23:47:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: v4l2-async: Accept endpoints and devices for
 fwnode matching
Message-ID: <20200316214727.GX4732@pendragon.ideasonboard.com>
References: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200315125511.25756-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200316214012.GB2324872@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200316214012.GB2324872@oden.dyn.berto.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Mon, Mar 16, 2020 at 10:40:12PM +0100, Niklas Söderlund wrote:
> On 2020-03-15 14:55:11 +0200, Laurent Pinchart wrote:
> > fwnode matching was designed to match on nodes corresponding to a
> > device. Some drivers, however, needed to match on endpoints, and have
> > passed endpoint fwnodes to v4l2-async. This works when both the subdev
> > and the notifier use the same fwnode types (endpoint or device), but
> > makes drivers that use different types incompatible.
> > 
> > Fix this by extending the fwnode match to handle fwnodes of different
> > types. When the types (deduced from the node name) are different,
> > retrieve the device fwnode for the side that provides an endpoint
> > fwnode, and compare it with the device fwnode provided by the other
> > side. This allows interoperability between all drivers, regardless of
> > which type of fwnode they use for matching.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> I tested this on R-Car CSI-2 and ADV748x without any regressions. As 
> Jacopo already pointed out it's similar to what have been tried before 
> and have the potential problem for new transmitters registering multiple 
> endpoints (like ADV748x) being used together with older receivers who 
> register a single device node in v4l-async. But this do not introduce 
> any regressions and is a good first step to move everything to endpoint 
> matching.
> 
> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Maybe a info message should be logged if a match is made between 
> endpoint and node? It would make it easy to spot if one needs to debug a 
> miss match and would be a clear message one driver should be moved to 
> endpoint matching. Maybe adding such a log message would count as a 
> regression for some.

WARN("FIX YOUR DRIVER TO USE ENDPOINT MATCHING") ? :-)

Jokes aside, something a bit less harsh such as "Matching endpoint with
device node, consider fixing driver %s to use endpoints" wouldn't be a
bad idea.

> > ---
> > This has been compile-tested only. Prabhakar, could you check if it
> > fixes your issue ?
> > 
> >  drivers/media/v4l2-core/v4l2-async.c | 42 +++++++++++++++++++++++++++-
> >  1 file changed, 41 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 8bde33c21ce4..995e5464cba7 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -71,7 +71,47 @@ static bool match_devname(struct v4l2_subdev *sd,
> >  
> >  static bool match_fwnode(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> >  {
> > -	return sd->fwnode == asd->match.fwnode;
> > +	struct fwnode_handle *other_fwnode;
> > +	struct fwnode_handle *dev_fwnode;
> > +	bool asd_fwnode_is_ep;
> > +	bool sd_fwnode_is_ep;
> > +	const char *name;
> > +
> > +	/*
> > +	 * Both the subdev and the async subdev can provide either an endpoint
> > +	 * fwnode or a device fwnode. Start with the simple case of direct
> > +	 * fwnode matching.
> > +	 */
> > +	if (sd->fwnode == asd->match.fwnode)
> > +		return true;
> > +
> > +	/*
> > +	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
> > +	 * endpoint or a device. If they're of the same type, there's no match.
> > +	 */
> > +	name = fwnode_get_name(sd->fwnode);
> > +	sd_fwnode_is_ep = name && strstarts(name, "endpoint");
> > +	name = fwnode_get_name(asd->match.fwnode);
> > +	asd_fwnode_is_ep = name && strstarts(name, "endpoint");
> > +
> > +	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
> > +		return false;
> > +
> > +	/*
> > +	 * The sd and asd fwnodes are of different types. Get the device fwnode
> > +	 * parent of the endpoint fwnode, and compare it with the other fwnode.
> > +	 */
> > +	if (sd_fwnode_is_ep) {
> > +		dev_fwnode = fwnode_graph_get_port_parent(sd->fwnode);
> > +		other_fwnode = asd->match.fwnode;
> > +	} else {
> > +		dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
> > +		other_fwnode = sd->fwnode;
> > +	}
> > +
> > +	fwnode_handle_put(dev_fwnode);
> > +
> > +	return dev_fwnode == other_fwnode;
> >  }
> >  
> >  static bool match_custom(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)

-- 
Regards,

Laurent Pinchart
