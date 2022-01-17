Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E95C2491237
	for <lists+linux-media@lfdr.de>; Tue, 18 Jan 2022 00:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234551AbiAQXNY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jan 2022 18:13:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbiAQXNY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jan 2022 18:13:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C331C061574
        for <linux-media@vger.kernel.org>; Mon, 17 Jan 2022 15:13:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F931315;
        Tue, 18 Jan 2022 00:13:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642461201;
        bh=oeuB5kywWKdsPFMg+U1pvXXbGzEt30H3yXbGh7z/BQE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FuIXla2Qwuyf5NBAAnLNc73H/3N2ViW3bRPhu5avfq0Ta09jRHn6j+uBga6mSsZOx
         y6oXtLcFj9LeYj3nqYOadR8ityKp1aiIe7xWaib9lfMmerpelME4YHHONZEQsUPGHa
         ngRi74zxYu8HfFcj4Qygev7qAstSWRsOaNJ2xiSE=
Date:   Tue, 18 Jan 2022 01:13:08 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v10 16/38] media: entity: Use routing information during
 graph traversal
Message-ID: <YeX4BHSWo4yxgRMB@pendragon.ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-17-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211130141536.891878-17-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Tomi,

Thank you for the patch.

On Tue, Nov 30, 2021 at 04:15:14PM +0200, Tomi Valkeinen wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Take internal routing information as reported by the entity has_route
> operation into account during graph traversal to avoid following
> unrelated links.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/mc/mc-entity.c | 46 ++++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index a83f004efd37..58cdc9c6b342 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -248,15 +248,6 @@ bool media_entity_has_route(struct media_entity *entity, unsigned int pad0,
>  }
>  EXPORT_SYMBOL_GPL(media_entity_has_route);
>  
> -static struct media_pad *
> -media_pad_other(struct media_pad *pad, struct media_link *link)
> -{
> -	if (link->source == pad)
> -		return link->sink;
> -	else
> -		return link->source;
> -}
> -
>  /* push an entity to traversal stack */
>  static void stack_push(struct media_graph *graph, struct media_pad *pad)
>  {
> @@ -327,7 +318,8 @@ static void media_graph_walk_iter(struct media_graph *graph)
>  {
>  	struct media_pad *pad = stack_top(graph);
>  	struct media_link *link;
> -	struct media_pad *next;
> +	struct media_pad *remote;
> +	struct media_pad *local;
>  
>  	link = list_entry(link_top(graph), typeof(*link), list);
>  
> @@ -341,24 +333,42 @@ static void media_graph_walk_iter(struct media_graph *graph)
>  		return;
>  	}
>  
> -	/* Get the entity at the other end of the link. */
> -	next = media_pad_other(pad, link);
> +	/*
> +	 * Get the local pad, the remote pad and the entity at the other
> +	 * end of the link.
> +	 */
> +	if (link->source->entity == pad->entity) {
> +		remote = link->sink;
> +		local = link->source;
> +	} else {
> +		remote = link->source;
> +		local = link->sink;
> +	}
> +
> +	/*
> +	 * Are the local pad and the pad we came from connected
> +	 * internally in the entity ?
> +	 */
> +	if (!media_entity_has_route(pad->entity, pad->index, local->index)) {

This will fail on the following graph:

+-------------+      +--------------+      +---------+
|             |      |            [1| ---> |0] DMA 0 |
|             |      |              |      +---------+
|   Source  [0| ---> |0] Broadcast  |
|             |      |              |      +---------+
|             |      |            [2| ---> |0] DMA 1 |
+-------------+      +--------------+      +---------+

The broadcast entity forwards the input unchanged to the two outputs.

If we walk the pipeline starting from the video node corresponding to
DMA 0, the pipeline will contain DMA 0, broadcast and source, but will
fail to find DMA 1, because pads 1 and 2 on the broadcast entity don't
have a route connecting them.

I have an alternative implementation of the pipeline walk algorithm that
fixes this, and takes streams into account. I'll send an RFC series.

> +		link_top(graph) = link_top(graph)->next;
> +		return;
> +	}
>  
>  	/* Has the entity already been visited? */
> -	if (media_entity_enum_test_and_set(&graph->ent_enum, next->entity)) {
> +	if (media_entity_enum_test_and_set(&graph->ent_enum, remote->entity)) {
>  		link_top(graph) = link_top(graph)->next;
>  		dev_dbg(pad->graph_obj.mdev->dev,
>  			"walk: skipping entity '%s' (already seen)\n",
> -			next->entity->name);
> +			remote->entity->name);
>  		return;
>  	}
>  
>  	/* Push the new entity to stack and start over. */
>  	link_top(graph) = link_top(graph)->next;
> -	stack_push(graph, next);
> -	dev_dbg(next->graph_obj.mdev->dev, "walk: pushing '%s':%u on stack\n",
> -		next->entity->name, next->index);
> -	lockdep_assert_held(&next->graph_obj.mdev->graph_mutex);
> +	stack_push(graph, remote);
> +	dev_dbg(remote->graph_obj.mdev->dev, "walk: pushing '%s':%u on stack\n",
> +		remote->entity->name, remote->index);
> +	lockdep_assert_held(&remote->graph_obj.mdev->graph_mutex);
>  }
>  
>  struct media_pad *media_graph_walk_next(struct media_graph *graph)

-- 
Regards,

Laurent Pinchart
