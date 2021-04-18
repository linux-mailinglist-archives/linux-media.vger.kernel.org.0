Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50A58363720
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 20:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhDRSUh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 14:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbhDRSUh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 14:20:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93420C06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 11:20:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EFAF4AB;
        Sun, 18 Apr 2021 20:20:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618770006;
        bh=FY6Gfwz2M1nF9SibDkAR/vmp7RPX3lF0uV2gVJ33Sk8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wDLqerXJno0NcF4Wh5nBi1GBPAFNqENwx/MZoptoExPsyabiTWzcMpPIXLRXht6TC
         X+G33fh+PT5jZjvz3SgerL5nkEnyfF3fD+VaeS0QAfXuShXqBXwxJiV8En39SnMFjE
         xYPeZKclx6c5GKejPtVKMxKOSfUL6UCKauZJuGdU=
Date:   Sun, 18 Apr 2021 21:20:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 12/24] media: entity: Add an iterator helper for
 connected pads
Message-ID: <YHx4U8F/g8dTusc+@pendragon.ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-13-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210415130450.421168-13-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi and Sakari,

Thank you for the patch.

On Thu, Apr 15, 2021 at 04:04:38PM +0300, Tomi Valkeinen wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Add a helper macro for iterating over pads that are connected through
> enabled routes. This can be used to find all the connected pads within an
> entity, for instance starting from the pad which has been obtained during
> the graph walk.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> - Make __media_entity_next_routed_pad() return NULL and adjust the
>   iterator to handle that
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  include/media/media-entity.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 73de1c335e4e..edd6f60ed6b4 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -916,6 +916,33 @@ __must_check int media_graph_walk_init(
>  bool media_entity_has_route(struct media_entity *entity, unsigned int pad0,
>  			    unsigned int pad1);
>  
> +static inline struct media_pad *__media_entity_next_routed_pad(
> +	struct media_pad *start, struct media_pad *iter)
> +{
> +	struct media_entity *entity = start->entity;
> +
> +	for (; iter < &entity->pads[entity->num_pads]; iter++)
> +		if (media_entity_has_route(entity, start->index, iter->index))
> +			return iter;

I'd use curly braces.

> +
> +	return NULL;
> +}

Does this need to be inlined ?

> +
> +/**
> + * media_entity_for_each_routed_pad - Iterate over entity pads connected by routes

"routed" sounds a bit weird. Would media_entity_for_each_connected_pad()
be a better name ?

> + *
> + * @start: The stating pad

s/stating/starting/

> + * @iter: The iterator pad
> + *
> + * Iterate over all pads connected through routes from a given pad

"from the @start pad"

> + * within an entity. The iteration will include the starting pad itself.

s/starting/@start/

I wonder if it wouldn't be more logical to not include the start pad.
That wouldn't match the current usage patterns, which would need to be
adapted accordingly, but I'm worried that including the start pad will
lead to annoying bugs in the future. Maybe I worry too much.

And now that I reread the patch, I also wonder if "start" is a good
name, as it implies we start the enumeration from a given pad, while we
enumerate all pads connected to a given pad. I'm not sure what a better
name would be though, maybe just pad ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + */
> +#define media_entity_for_each_routed_pad(start, iter)			\
> +	for (iter = __media_entity_next_routed_pad(			\
> +		     start, (start)->entity->pads);			\
> +	     iter != NULL;						\
> +	     iter = __media_entity_next_routed_pad(start, iter + 1))
> +
>  /**
>   * media_graph_walk_cleanup - Release resources used by graph walk.
>   *

-- 
Regards,

Laurent Pinchart
