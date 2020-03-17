Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEE1B1891C5
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 00:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgCQXIO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 19:08:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59542 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgCQXIO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 19:08:14 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22F55F9;
        Wed, 18 Mar 2020 00:08:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584486491;
        bh=CwzmiW67mT66jrB4UoV1tKHEC3jmH278FnGskhEWm+Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SSWhEiHBvl7sja9QjESzkXY2801RCxO9gJG3168ON3aZd7k10cjKV3bC11FP8FV3F
         K3BtEY9PvOKaBIby7t3JUNv7zlZbYHsVJzjX8qsd0JSqs1VnFtIOHPU6pt5wiZNfbK
         +owzBPY9v3kyGpWWK1A6YBS6gyTT30wQVGyPtXp4=
Date:   Wed, 18 Mar 2020 01:08:05 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: v4l2-async: Accept endpoints and devices for
 fwnode matching
Message-ID: <20200317230805.GP2527@pendragon.ideasonboard.com>
References: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200315125511.25756-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200316214012.GB2324872@oden.dyn.berto.se>
 <20200316214727.GX4732@pendragon.ideasonboard.com>
 <b647c536-98cb-9ecc-d6b3-14954da78868@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b647c536-98cb-9ecc-d6b3-14954da78868@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Tue, Mar 17, 2020 at 12:33:07PM +0000, Kieran Bingham wrote:
> On 16/03/2020 21:47, Laurent Pinchart wrote:
> > On Mon, Mar 16, 2020 at 10:40:12PM +0100, Niklas Söderlund wrote:
> >> On 2020-03-15 14:55:11 +0200, Laurent Pinchart wrote:
> >>> fwnode matching was designed to match on nodes corresponding to a
> >>> device. Some drivers, however, needed to match on endpoints, and have
> >>> passed endpoint fwnodes to v4l2-async. This works when both the subdev
> >>> and the notifier use the same fwnode types (endpoint or device), but
> >>> makes drivers that use different types incompatible.
> >>>
> >>> Fix this by extending the fwnode match to handle fwnodes of different
> >>> types. When the types (deduced from the node name) are different,
> >>> retrieve the device fwnode for the side that provides an endpoint
> >>> fwnode, and compare it with the device fwnode provided by the other
> >>> side. This allows interoperability between all drivers, regardless of
> >>> which type of fwnode they use for matching.
> >>>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>
> >> I tested this on R-Car CSI-2 and ADV748x without any regressions. As 
> >> Jacopo already pointed out it's similar to what have been tried before 
> 
> This was the patch that I had believed was accepted, but ended up stuck
> in Sakari's tree:
> 
> https://git.linuxtv.org/sailus/media_tree.git/commit/?h=fwnode-const&id=35c32d99b2c3f5086b911ec817926de9b7bc3b41
> 
> (it's already a little bit-rotted though)

Yes, I noticed that. I don't mind dropping this patch if you rebase
yours, as long as we merge a fix :-)

> >> and have the potential problem for new transmitters registering multiple 
> >> endpoints (like ADV748x) being used together with older receivers who 
> >> register a single device node in v4l-async. But this do not introduce 
> 
> So if an 'old' receiver wants to use the 'new' features, it must upgrade
> to endpoint matching.
> 
> I think that's fine.

Yes that's the idea. It will however not have to upgrade all the subdev
drivers it uses at the same time.

> >> any regressions and is a good first step to move everything to endpoint 
> >> matching.
> >>
> >> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >>
> >> Maybe a info message should be logged if a match is made between 
> >> endpoint and node? It would make it easy to spot if one needs to debug a 
> >> miss match and would be a clear message one driver should be moved to 
> >> endpoint matching. Maybe adding such a log message would count as a 
> >> regression for some.
> > 
> > WARN("FIX YOUR DRIVER TO USE ENDPOINT MATCHING") ? :-)
> 
> Indeed, a notification that they need to update their matching would be
> useful in that scenario.
> 
> I believe we need to move forward with this somehow, as we have Xilinx
> trying to use MAX9286 with Xilinx drivers, (endpoint matching subdev
> with dev node matching receiver) and Renesas trying to use non-endpoint
> subdevices against an endpoint matched RCar-VIN ...?
> 
> > Jokes aside, something a bit less harsh such as "Matching endpoint with
> > device node, consider fixing driver %s to use endpoints" wouldn't be a
> > bad idea.
> 
> Yes, Is there anything else we can do? Even if we 'started' converting
> other receivers to match on endpoints, it would take time - so I think
> an intermediate stage like this is still very useful.
> 
> Of course this patch also lets us push the updates back to those who
> care about those drivers too ...

Exactly :-)

> >>> ---
> >>> This has been compile-tested only. Prabhakar, could you check if it
> >>> fixes your issue ?
> >>>
> >>>  drivers/media/v4l2-core/v4l2-async.c | 42 +++++++++++++++++++++++++++-
> >>>  1 file changed, 41 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> >>> index 8bde33c21ce4..995e5464cba7 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-async.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-async.c
> >>> @@ -71,7 +71,47 @@ static bool match_devname(struct v4l2_subdev *sd,
> >>>  
> >>>  static bool match_fwnode(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> >>>  {
> >>> -	return sd->fwnode == asd->match.fwnode;
> >>> +	struct fwnode_handle *other_fwnode;
> >>> +	struct fwnode_handle *dev_fwnode;
> >>> +	bool asd_fwnode_is_ep;
> >>> +	bool sd_fwnode_is_ep;
> >>> +	const char *name;
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
> >>> +	 */
> >>> +	name = fwnode_get_name(sd->fwnode);
> >>> +	sd_fwnode_is_ep = name && strstarts(name, "endpoint");
> >>> +	name = fwnode_get_name(asd->match.fwnode);
> >>> +	asd_fwnode_is_ep = name && strstarts(name, "endpoint");
> >>> +
> >>> +	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
> >>> +		return false;
> 
> Ok, so this looks like a good safety check for edge cases which would
> potentially have got through in my version.
> 
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
> 
> It seems in my implementation these got leaked too :-)
> 
> I'm sold. This one is better than the old version I had.
> 
> Hopefully we can get this moving so that we can progress towards
> endpoint matching throughout next.
> 
> (Ideally with a warning to convert non-endpoint matching drivers...)
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thank you. I'll add a warning and agree with Sakari on the best method
to check if a node is an endpoint node, and will then resubmit.

> >>> +
> >>> +	return dev_fwnode == other_fwnode;
> >>>  }
> >>>  
> >>>  static bool match_custom(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)

-- 
Regards,

Laurent Pinchart
