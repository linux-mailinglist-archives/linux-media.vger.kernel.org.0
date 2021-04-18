Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8B8836371B
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 20:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbhDRSGu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 14:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbhDRSGs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 14:06:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7A1C06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 11:06:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F05A54AB;
        Sun, 18 Apr 2021 20:06:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618769177;
        bh=sSv+2tKGSVuMvhFQtaMTzi0au5dPrwolgF+OCPphW8c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TrzAQGpv4IKclzvkIgUdx4G3CxpSJZ2p4sar8pIYc1kacH/fl9e6JjWGs/DMGOP92
         KNycXKeP9kR5MVKc7WwzoKZR9h0ParG0Te4zvem+GC3UJysSe37hmHzBMYCcD0VAR6
         WmIqIRTgloDbve6Xh1vEhmFNhqhKvJWIGlOyVD7s=
Date:   Sun, 18 Apr 2021 21:06:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 11/24] media: entity: Skip link validation for pads to
 which there is no route to
Message-ID: <YHx1E3AWm2mzD4Gs@pendragon.ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-12-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210415130450.421168-12-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi and Sakari,

Thank you for the patch.

There's an extra "to" in the subject line.

On Thu, Apr 15, 2021 at 04:04:37PM +0300, Tomi Valkeinen wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Links are validated along the pipeline which is about to start streaming.
> Not all the pads in entities that are traversed along that pipeline are
> part of the pipeline, however. Skip the link validation for such pads,
> and while at there rename "other_pad" to "local_pad" to convey the fact
> the route to be checked is internal to the entity.

Both "pad" and "local_pad" are local. I would have kept the "other_pad"
variable name.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/mc/mc-entity.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 28d7fd254c77..fe6cb743c85c 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -482,12 +482,17 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
>  		bitmap_fill(has_no_links, entity->num_pads);
>  
>  		list_for_each_entry(link, &entity->links, list) {
> -			struct media_pad *other_pad =
> +			struct media_pad *local_pad =
>  				link->sink->entity == entity ?
>  				link->sink : link->source;
>  
> +			/* Ignore pads to which there is no route. */
> +			if (!media_entity_has_route(entity, pad->index,
> +						    local_pad->index))
> +				continue;
> +
>  			/* Mark that a pad is connected by a link. */
> -			bitmap_clear(has_no_links, other_pad->index, 1);
> +			bitmap_clear(has_no_links, local_pad->index, 1);
>  
>  			/*
>  			 * Pads that either do not need to connect or
> @@ -496,13 +501,13 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
>  			 */
>  			if (!(pad->flags & MEDIA_PAD_FL_MUST_CONNECT) ||
>  			    link->flags & MEDIA_LNK_FL_ENABLED)
> -				bitmap_set(active, other_pad->index, 1);
> +				bitmap_set(active, local_pad->index, 1);
>  
>  			/*
>  			 * Link validation will only take place for
>  			 * sink ends of the link that are enabled.
>  			 */
> -			if (link->sink != other_pad ||
> +			if (link->sink != local_pad ||
>  			    !(link->flags & MEDIA_LNK_FL_ENABLED))
>  				continue;
>  

-- 
Regards,

Laurent Pinchart
