Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6CA186018
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 22:44:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729210AbgCOVoZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Mar 2020 17:44:25 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:44991 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729166AbgCOVoZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Mar 2020 17:44:25 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6F304240008;
        Sun, 15 Mar 2020 21:44:11 +0000 (UTC)
Date:   Sun, 15 Mar 2020 22:47:07 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: v4l2-async: Accept endpoints and devices for
 fwnode matching
Message-ID: <20200315214707.uo246kwe3njtc452@uno.localdomain>
References: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200315125511.25756-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200315125511.25756-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Mar 15, 2020 at 02:55:11PM +0200, Laurent Pinchart wrote:
> fwnode matching was designed to match on nodes corresponding to a
> device. Some drivers, however, needed to match on endpoints, and have
> passed endpoint fwnodes to v4l2-async. This works when both the subdev
> and the notifier use the same fwnode types (endpoint or device), but
> makes drivers that use different types incompatible.
>
> Fix this by extending the fwnode match to handle fwnodes of different
> types. When the types (deduced from the node name) are different,
> retrieve the device fwnode for the side that provides an endpoint
> fwnode, and compare it with the device fwnode provided by the other
> side. This allows interoperability between all drivers, regardless of
> which type of fwnode they use for matching.
>

I'm sorry but I'm not sure why would make a difference compared to
what Kieran's patch did.
https://lore.kernel.org/patchwork/patch/788637/

If the bridge matches on device node, and the remote registers more
than one endpoints it is possible to get a false match.

I'm not sure how that would happen in practice, as the bridge would be
registering the fwnode of the remote device twice, but I think that
was the reason kieran's patch has not been collected or am I
mistaken ?

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> This has been compile-tested only. Prabhakar, could you check if it
> fixes your issue ?
>
>  drivers/media/v4l2-core/v4l2-async.c | 42 +++++++++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 8bde33c21ce4..995e5464cba7 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -71,7 +71,47 @@ static bool match_devname(struct v4l2_subdev *sd,
>
>  static bool match_fwnode(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
>  {
> -	return sd->fwnode == asd->match.fwnode;
> +	struct fwnode_handle *other_fwnode;
> +	struct fwnode_handle *dev_fwnode;
> +	bool asd_fwnode_is_ep;
> +	bool sd_fwnode_is_ep;
> +	const char *name;
> +
> +	/*
> +	 * Both the subdev and the async subdev can provide either an endpoint
> +	 * fwnode or a device fwnode. Start with the simple case of direct
> +	 * fwnode matching.
> +	 */
> +	if (sd->fwnode == asd->match.fwnode)
> +		return true;
> +
> +	/*
> +	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
> +	 * endpoint or a device. If they're of the same type, there's no match.
> +	 */
> +	name = fwnode_get_name(sd->fwnode);
> +	sd_fwnode_is_ep = name && strstarts(name, "endpoint");
> +	name = fwnode_get_name(asd->match.fwnode);
> +	asd_fwnode_is_ep = name && strstarts(name, "endpoint");
> +
> +	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
> +		return false;
> +
> +	/*
> +	 * The sd and asd fwnodes are of different types. Get the device fwnode
> +	 * parent of the endpoint fwnode, and compare it with the other fwnode.
> +	 */
> +	if (sd_fwnode_is_ep) {
> +		dev_fwnode = fwnode_graph_get_port_parent(sd->fwnode);
> +		other_fwnode = asd->match.fwnode;
> +	} else {
> +		dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
> +		other_fwnode = sd->fwnode;
> +	}
> +
> +	fwnode_handle_put(dev_fwnode);
> +
> +	return dev_fwnode == other_fwnode;
>  }
>
>  static bool match_custom(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> --
> Regards,
>
> Laurent Pinchart
>
