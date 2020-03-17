Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1B0188476
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 13:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgCQMp3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 08:45:29 -0400
Received: from mga12.intel.com ([192.55.52.136]:16383 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725906AbgCQMp3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 08:45:29 -0400
IronPort-SDR: kNuS2SlAN9wbPuy+t+B5uLkpDnl3JlGA2IY+zK+g/IyBU87i6zWtsMQc7WSWPOR/hGLKrTAUQw
 972w5OIPP/tA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2020 05:45:28 -0700
IronPort-SDR: OiFu698YsYtiM7g7UspstHNCnbBEgiiMWzr2XWojQgL726p5Zj9ur6IQfWWFMn3eS8R90ALF/r
 rpzamf1qSnNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,564,1574150400"; 
   d="scan'208";a="244467828"
Received: from rosenste-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.252.41.149])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2020 05:45:26 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 67C2321DEC; Tue, 17 Mar 2020 14:44:56 +0200 (EET)
Date:   Tue, 17 Mar 2020 14:44:56 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: v4l2-async: Accept endpoints and devices for
 fwnode matching
Message-ID: <20200317124455.GC13878@kekkonen.localdomain>
References: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200315125511.25756-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200315125511.25756-1-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the patch.

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

Apart from the fact that you're parsing graph node names here, this looks
good.

How about checking instead that calling
fwnode_graph_get_remote_endpoint(fwnode_graph_get_remote_endpoint()) yields
the same node? That would ensure you're dealing with endpoint nodes without
explicitly parsing the graph in any way.

Just remember to drop the references.

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
