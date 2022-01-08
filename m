Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5735F4886E9
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 00:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234957AbiAHXbL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jan 2022 18:31:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbiAHXbK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Jan 2022 18:31:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD48C06173F
        for <linux-media@vger.kernel.org>; Sat,  8 Jan 2022 15:31:10 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C101AA1B;
        Sun,  9 Jan 2022 00:31:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641684669;
        bh=Ql6qoOkpaHgHtSqgtVilQRl45AqiQPtRwMB1iE8pm34=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mvb3AIGpK3ya53sszSHKwseunCaLHZivL3RilMt0Y/iuBF40u9T2XW4jx+LoOL358
         xZLuMcwItVnBTyxKhH+ps+U9BBOy8w0PW48Q7NdVk0MjOLva6vSWWmX/dBGbftCoum
         nar2bUa0zn9bFhJjrbsx6Gn4aMWwrJ8tIPRF21JY=
Date:   Sun, 9 Jan 2022 01:31:00 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v10 15/38] media: entity: Add media_entity_has_route()
 function
Message-ID: <YdoetFOzx099fajp@pendragon.ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-16-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211130141536.891878-16-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Tomi,

Thank you for the patch.

On Tue, Nov 30, 2021 at 04:15:13PM +0200, Tomi Valkeinen wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> This is a wrapper around the media entity has_route operation.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/mc/mc-entity.c | 19 +++++++++++++++++++
>  include/media/media-entity.h | 17 +++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index b44ab423b49b..a83f004efd37 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -229,6 +229,25 @@ EXPORT_SYMBOL_GPL(media_entity_pads_init);
>   * Graph traversal
>   */
>  
> +bool media_entity_has_route(struct media_entity *entity, unsigned int pad0,
> +			    unsigned int pad1)
> +{
> +	if (pad0 >= entity->num_pads || pad1 >= entity->num_pads)
> +		return false;
> +
> +	if (pad0 == pad1)
> +		return true;
> +
> +	if (!entity->ops || !entity->ops->has_route)
> +		return true;
> +
> +	if (entity->pads[pad1].index < entity->pads[pad0].index)
> +		swap(pad0, pad1);
> +
> +	return entity->ops->has_route(entity, pad0, pad1);
> +}
> +EXPORT_SYMBOL_GPL(media_entity_has_route);

As this function is only used in mc-entity.c, can we avoid exposing it
for now ? It's a new API, and I'd rather be notified if drivers start
using it directly by requiring a patch to expose the function at that
point.

> +
>  static struct media_pad *
>  media_pad_other(struct media_pad *pad, struct media_link *link)
>  {
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index ad4020b2df65..b3069eef7fdb 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -904,6 +904,23 @@ int media_entity_get_fwnode_pad(struct media_entity *entity,
>  __must_check int media_graph_walk_init(
>  	struct media_graph *graph, struct media_device *mdev);
>  
> +/**
> + * media_entity_has_route - Check if two entity pads are connected internally
> + *
> + * @entity: The entity
> + * @pad0: The first pad index
> + * @pad1: The second pad index
> + *
> + * This function can be used to check whether two pads of an entity are
> + * connected internally in the entity.
> + *
> + * The caller must hold entity->graph_obj.mdev->mutex.
> + *
> + * Return: true if the pads are connected internally and false otherwise.
> + */
> +bool media_entity_has_route(struct media_entity *entity, unsigned int pad0,
> +			    unsigned int pad1);
> +
>  /**
>   * media_graph_walk_cleanup - Release resources used by graph walk.
>   *

-- 
Regards,

Laurent Pinchart
