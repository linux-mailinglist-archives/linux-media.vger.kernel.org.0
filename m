Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC411487D5E
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 20:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233600AbiAGT5O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jan 2022 14:57:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbiAGT5N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jan 2022 14:57:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6876C061574
        for <linux-media@vger.kernel.org>; Fri,  7 Jan 2022 11:57:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B0A08D7;
        Fri,  7 Jan 2022 20:57:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641585431;
        bh=FuQZV7KdGpycla39S9ITe/23IB6qXtJ4P9MKeQVJpWc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qp1cuaSKk6lJudvFvZad96ePPeapPkYVGsgWjOHUb4C/n3I9NGZlVVABUkLG+vNSW
         8Tw4K3cgveQQodP+RVBs8rHX6A8qVL4toMZVjFRhDon//3BZb/eUcs3W/QLJd4ozBv
         7sPpXEAlEpnufulJqswb9GNorFcW/wpCPQJzgKb8=
Date:   Fri, 7 Jan 2022 21:57:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v10 19/38] media: entity: Add only connected pads to the
 pipeline
Message-ID: <YdibD8U7jxAi+s7n@pendragon.ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-20-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211130141536.891878-20-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi and Sakari,

Thank you for the patch.

On Tue, Nov 30, 2021 at 04:15:17PM +0200, Tomi Valkeinen wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> A single entity may contain multiple pipelines. Only add pads that were
> connected to the pad through which the entity was reached to the pipeline.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/mc/mc-entity.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 072f017b399a..4eb4b94c09e2 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -474,7 +474,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,

Adding a bit more context:

	while ((pad = media_graph_walk_next(graph))) {
		struct media_entity *entity = pad->entity;
		bool skip_validation = pad->pipe != NULL;
		struct media_pad *iter;

		DECLARE_BITMAP(active, MEDIA_ENTITY_MAX_PADS);
		DECLARE_BITMAP(has_no_links, MEDIA_ENTITY_MAX_PADS);
>  
>  		ret = 0;
>  
> -		media_entity_for_each_pad(entity, iter) {
> +		media_entity_for_each_routed_pad(pad, iter) {
>  			if (iter->pipe && iter->pipe != pipe) {
>  				pr_err("Pipe active for %s. Can't start for %s\n",
>  				       entity->name, iter->entity->name);

So here 'iter' is a pad that is reached using an internal route from the
pad 'pad'. 'pad' and 'iter' thus belong to the same entity. 'entity' is
pad->entity, so, unless I'm mistaken, entity->name and
iter->entity->name are the same. I think the message should be reworked.

> @@ -563,10 +563,9 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
>  	media_graph_walk_start(graph, pad_err);
>  
>  	while ((pad_err = media_graph_walk_next(graph))) {
> -		struct media_entity *entity = pad_err->entity;
>  		struct media_pad *iter;
>  
> -		media_entity_for_each_pad(entity, iter) {
> +		media_entity_for_each_routed_pad(pad_err, iter) {
>  			/* Sanity check for negative stream_count */
>  			if (!WARN_ON_ONCE(iter->stream_count <= 0)) {
>  				--iter->stream_count;
> @@ -619,10 +618,9 @@ void __media_pipeline_stop(struct media_pad *pad)
>  	media_graph_walk_start(graph, pad);
>  
>  	while ((pad = media_graph_walk_next(graph))) {
> -		struct media_entity *entity = pad->entity;
>  		struct media_pad *iter;
>  
> -		media_entity_for_each_pad(entity, iter) {
> +		media_entity_for_each_routed_pad(pad, iter) {
>  			/* Sanity check for negative stream_count */
>  			if (!WARN_ON_ONCE(iter->stream_count <= 0)) {
>  				iter->stream_count--;

-- 
Regards,

Laurent Pinchart
