Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABA62063F0
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 23:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393363AbgFWVNc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 17:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392026AbgFWVNb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 17:13:31 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D9BC061573;
        Tue, 23 Jun 2020 14:13:31 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id CEADD634C87;
        Wed, 24 Jun 2020 00:13:06 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jnqE6-000199-OR; Wed, 24 Jun 2020 00:13:06 +0300
Date:   Wed, 24 Jun 2020 00:13:06 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3 1/3] media: v4l2-async: Accept endpoints and devices
 for fwnode matching
Message-ID: <20200623211306.GF870@valkosipuli.retiisi.org.uk>
References: <20200621000028.4591-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621000028.4591-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200621000028.4591-2-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Jun 21, 2020 at 03:00:26AM +0300, Laurent Pinchart wrote:
> fwnode matching was designed to match on nodes corresponding to a
> device. Some drivers, however, needed to match on endpoints, and have
> passed endpoint fwnodes to v4l2-async. This works when both the subdev
> and the notifier use the same fwnode types (endpoint or device), but
> makes drivers that use different types incompatible.
> 
> Fix this by extending the fwnode match to handle fwnodes of different
> types. When the types (deduced from the presence of remote endpoints)
> are different, retrieve the device fwnode for the side that provides an
> endpoint fwnode, and compare it with the device fwnode provided by the
> other side. This allows interoperability between all drivers, regardless
> of which type of fwnode they use for matching.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> Changes since v2:
> 
> - Add comment to explain that we're matching connecting endpoints
> - Don't check fwnode name to detect endpoint
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 45 +++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 8bde33c21ce4..f82e0a32647d 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -71,7 +71,50 @@ static bool match_devname(struct v4l2_subdev *sd,
>  
>  static bool match_fwnode(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
>  {
> -	return sd->fwnode == asd->match.fwnode;
> +	struct fwnode_handle *other_fwnode;
> +	struct fwnode_handle *dev_fwnode;
> +	bool asd_fwnode_is_ep;
> +	bool sd_fwnode_is_ep;
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
> +	 * Technically speaking this checks if the nodes refer to a connected
> +	 * endpoint, which is the simplest check that works for both OF and
> +	 * ACPI. This won't make a difference, as drivers should not try to
> +	 * match unconnected endpoints.
> +	 */
> +	sd_fwnode_is_ep = fwnode_property_present(sd->fwnode,
> +						  "remote-endpoint");
> +	asd_fwnode_is_ep = fwnode_property_present(asd->match.fwnode,
> +						   "remote-endpoint");

Please don't try parsing graph bindings outside the main parsers.

There's no API function to do just this, but you could go and check for the
port parent right away. The code might be even more simple that way.

Alternatively, I guess we could add fwnode_graph_is_endpoint() or something
but I wonder if it'd be worth it just for this.

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

-- 
Kind regards,

Sakari Ailus
