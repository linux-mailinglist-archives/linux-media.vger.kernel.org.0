Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F111A36E342
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 04:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhD2Cbh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 22:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbhD2Cbg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 22:31:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E11C06138B
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 19:30:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A51C6BC0;
        Thu, 29 Apr 2021 04:30:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619663449;
        bh=+E8xF8cq9ii1k/zK1LBJzmR+xeq7xXzWYj9kFM4mTBg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JFhGnQY+BoC2tl7MA2M9IwXUK2YMVucXqIr3krKh4DcLM2swc0XvnLV43t2+ZpQJY
         8d16+fH8Z1jBwixph22CeRgwUgEB7Nd7pMh00J6eCWygZseZD1bk6+jLR/dgEUlDUY
         dAzd/x8d8L0rGUw/LCTGR1F+lC0l3QlF7JgBkhB8=
Date:   Thu, 29 Apr 2021 05:30:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v6 11/24] media: entity: Skip link validation for pads to
 which there is no route to
Message-ID: <YIoaUxAolUtn8Wfn@pendragon.ideasonboard.com>
References: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
 <20210427124523.990938-12-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210427124523.990938-12-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi and Sakari,

Thank you for the patch.

On Tue, Apr 27, 2021 at 03:45:10PM +0300, Tomi Valkeinen wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Links are validated along the pipeline which is about to start streaming.
> Not all the pads in entities that are traversed along that pipeline are
> part of the pipeline, however. Skip the link validation for such pads,
> and while at there rename "other_pad" to "local_pad" to convey the fact
> the route to be checked is internal to the entity.

After sorting out the "other_pad" name as discussed in v5,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/mc/mc-entity.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index d00c7397e09a..a4cca53124b2 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -482,27 +482,32 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
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
>  			 * are connected through an enabled link are
>  			 * fine.
>  			 */
> -			if (!(other_pad->flags & MEDIA_PAD_FL_MUST_CONNECT) ||
> +			if (!(local_pad->flags & MEDIA_PAD_FL_MUST_CONNECT) ||
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
