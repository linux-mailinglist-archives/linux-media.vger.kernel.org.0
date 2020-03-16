Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 153A018684D
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 10:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730423AbgCPJ4s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 05:56:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34526 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730025AbgCPJ4r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 05:56:47 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC69AA3B;
        Mon, 16 Mar 2020 10:56:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584352605;
        bh=KQzCDEzosk0OtYICUWi7wqC64t0xB5zHpPYBGUK3JJo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WCx7Gy9rsGwz+xTOLLMuCtqY6MyrgLZbO92LZtlqwuaXWoR0QwEkdn8juql9putjs
         0kvnv70TiGPruGkfbCv7SSqo4jpTPf6aGsmqgKDMqzz1muCJ82daSrIv0dj6yEab/J
         mZX75ZhpiVQhfBsYP/eRM2B4HNwJhX2y9vvpkb8k=
Date:   Mon, 16 Mar 2020 11:56:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: v4l2-async: Accept endpoints and devices for
 fwnode matching
Message-ID: <20200316095638.GQ4732@pendragon.ideasonboard.com>
References: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200315125511.25756-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200315214707.uo246kwe3njtc452@uno.localdomain>
 <20200316063444.GE4732@pendragon.ideasonboard.com>
 <20200316085934.c4lwqreaki2sbamm@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200316085934.c4lwqreaki2sbamm@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Mar 16, 2020 at 09:59:34AM +0100, Jacopo Mondi wrote:
> On Mon, Mar 16, 2020 at 08:34:44AM +0200, Laurent Pinchart wrote:
> > On Sun, Mar 15, 2020 at 10:47:07PM +0100, Jacopo Mondi wrote:
> >> On Sun, Mar 15, 2020 at 02:55:11PM +0200, Laurent Pinchart wrote:
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
> >>
> >> I'm sorry but I'm not sure why would make a difference compared to
> >> what Kieran's patch did.
> >> https://lore.kernel.org/patchwork/patch/788637/
> >>
> >> If the bridge matches on device node, and the remote registers more
> >> than one endpoints it is possible to get a false match.
> >
> > How so ? If a notifier entry points to a device node, and two subdevs
> > are registered with different endpoint nodes that are both part of the
> > same device node, the notifier will get either of them. Which subdev
> > match the notifier won't be guaranteed, but that's what the notifier
> > asked for if it contains a device node and not an endpoint node: any
> > subdev corresponding to the device node.
> >
> > In practice notifiers will need to move to endpoint matching if they
> > want to get a particular subdev of a device, and this change allows
> > doing so without mass-patching every driver. It allows a notifier to
> > switch to endpoint nodes, while subdevs still use device nodes and are
> > gradually ported.
> 
> In case a device has two CSI-2 receivers, different IPs, different
> drivers which register different notifiers, and they are connected in
> DTS to a device like adv748x which registers two async
> devices for its two CSI-2 transmitter on endpoints, depending on which
> CSI-2 receiver gets probed first, it matches any of the two CSI-2 Tx.
> The media graph would complete but it won't be what's described in
> dts.
> 
> I agree it's unlikely, and having something like this or what kieran
> did in is better than the current situation, so I'm not pushing this
> back, at all. Just pointing possible reasons why we still don't have
> any solution to this issue in mainline.

Regardless of whether it's likely or not, to support this correctly,
endpoint matching is required, there's no way around that. This change
doesn't introduce any regression, and allows migrating subdevs and
subdevs users independently from each other, so I see no drawback :-)

> >> I'm not sure how that would happen in practice, as the bridge would be
> >> registering the fwnode of the remote device twice, but I think that
> >> was the reason kieran's patch has not been collected or am I
> >> mistaken ?
> >>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
