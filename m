Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9A442806C
	for <lists+linux-media@lfdr.de>; Sun, 10 Oct 2021 12:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbhJJKXZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Oct 2021 06:23:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60586 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbhJJKXZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Oct 2021 06:23:25 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABD942FD;
        Sun, 10 Oct 2021 12:21:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633861285;
        bh=jn/ZyXXK32Hasm7SUIlQPn8GnD22YxpUqaqvXd6YTrU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZXzP/pCcJUG8KRYC0Aobp4rOO32OZ1klK5bNNAse7mNTv7Xy0/pHM0DxXGlaEve1I
         X2Dwagnf7gR9lHQCMmOrX+L6NoupoXhBrwrDk+mh0PtZ9WKgJA4elzwMwOMuCNlpEn
         +kH0e2ezPw/r8qDs3xcUOMo27+juvZw8KpTn5Y28=
Date:   Sun, 10 Oct 2021 13:21:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v9 29/36] media: subdev: add v4l2_subdev_set_routing
 helper()
Message-ID: <YWK+meG0VMWSeouu@pendragon.ideasonboard.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-30-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211005085750.138151-30-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Oct 05, 2021 at 11:57:43AM +0300, Tomi Valkeinen wrote:
> Add a helper function to set the subdev routing. The helper can be used
> from subdev driver's set_routing op to store the routing table.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 28 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 16 +++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 14b8282fe45b..af53f827ec27 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1151,3 +1151,31 @@ void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
>  	mutex_unlock(&state->lock);
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_unlock_state);
> +
> +int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state,
> +			    struct v4l2_subdev_krouting *routing)
> +{
> +	struct v4l2_subdev_krouting *dst = &state->routing;
> +	const struct v4l2_subdev_krouting *src = routing;
> +
> +	lockdep_assert_held(&state->lock);

Calling this function doesn't make much sense if the subdev doesn't have
the V4L2_SUBDEV_FL_MULTIPLEXED set, right ? If that's correct, should
this be documented below, and/or possibly checked here ?

	if (WARN_ON(!(sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED)))
		return -E???;

> +
> +	kvfree(dst->routes);
> +	dst->routes = NULL;
> +	dst->num_routes = 0;
> +
> +	if (src->num_routes > 0) {
> +		dst->routes = kvmalloc_array(src->num_routes,
> +					     sizeof(*src->routes), GFP_KERNEL);

How many routes do we typically expect, is it worth a vmalloc ? If not,
kmemdup() could be a candidate (as I think by the time we get here,
num_routes should have been validated to not overflow, but please tell
me if I got this part wrong).

> +		if (!dst->routes)
> +			return -ENOMEM;
> +
> +		memcpy(dst->routes, src->routes,
> +		       src->num_routes * sizeof(*src->routes));
> +		dst->num_routes = src->num_routes;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 8b2cf3190276..b6c5cd00831e 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1437,4 +1437,20 @@ v4l2_subdev_validate_and_lock_state(struct v4l2_subdev *sd,
>  	return state;
>  }
>  
> +/**
> + * v4l2_subdev_set_routing() - Set given routing to subdev state
> + * @sd: The subdevice
> + * @state: The subdevice state
> + * @routing: Routing that will be copied to subdev state
> + *
> + * This will release old routing table (if any) from the state, allocate
> + * enough space for the given routing, and copy the routing.
> + *
> + * This can be used from the subdev driver's set_routing op, after validating
> + * the routing.
> + */
> +int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state,
> +			    struct v4l2_subdev_krouting *routing);
> +
>  #endif

-- 
Regards,

Laurent Pinchart
