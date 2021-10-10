Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D669427E3A
	for <lists+linux-media@lfdr.de>; Sun, 10 Oct 2021 03:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbhJJB0J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Oct 2021 21:26:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45902 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbhJJB0G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Oct 2021 21:26:06 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 151B149C;
        Sun, 10 Oct 2021 03:24:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633829047;
        bh=oI2IRjKNMvuEYUvh2i4RswmjY3UBqpF7l+5X14IPdi8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RrNPN95USIElViS0y3ZCpxthci2/N2dJn5C5STo1qokwoiDOeK4W7Ml/QNj3ZWhp7
         pFW2UWAB/oSERoHi99lqmtYdmMmikve8nIEHw07aEnetCl9RZVugEhPbcPIuAE9mFz
         z13F1JsAcdQXXQoce7tviCFK0XowlKpxM9INgt+E=
Date:   Sun, 10 Oct 2021 04:23:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v9 36/36] media: subdev: add v4l2_routing_simple_verify()
 helper
Message-ID: <YWJArM0uUL8UebwU@pendragon.ideasonboard.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-37-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211005085750.138151-37-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Oct 05, 2021 at 11:57:50AM +0300, Tomi Valkeinen wrote:
> Add a helper for verifying routing for the common case of
> non-overlapping 1-to-1 streams.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 24 ++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 14 ++++++++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 22a9bea0fa85..2a64ff003e4b 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1569,3 +1569,27 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
> +
> +int v4l2_routing_simple_verify(const struct v4l2_subdev_krouting *routing)
> +{
> +	unsigned int i, j;
> +
> +	for (i = 0; i < routing->num_routes; ++i) {
> +		const struct v4l2_subdev_route *route = &routing->routes[i];
> +
> +		for (j = i + 1; j < routing->num_routes; ++j) {
> +			const struct v4l2_subdev_route *r = &routing->routes[j];
> +
> +			if (route->sink_pad == r->sink_pad &&
> +			    route->sink_stream == r->sink_stream)
> +				return -EINVAL;
> +
> +			if (route->source_pad == r->source_pad &&
> +			    route->source_stream == r->source_stream)
> +				return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_routing_simple_verify);
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 1a4df0aafe8a..5e50f2ded653 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1565,4 +1565,18 @@ v4l2_state_get_opposite_stream_format(struct v4l2_subdev_state *state, u32 pad,
>  int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format);
>  
> +/**
> + * v4l2_routing_simple_verify() - Verify that all streams are non-overlapping
> + *				  1-to-1 streams

Let's reflect this in the function name then, we can call it
v4l2_routing_verify_1_to_1(). This will make it possible to add a
v4l2_subdev_routing_validate_1_to_n() later.

I'd rename verify to validate though, and add subdev to the function
name, calling it v4l2_subdev_routing_validate_1_to_1().

> + * @routing: routing to verify
> + *
> + * This verifies that the given routing contains only non-overlapping 1-to-1
> + * streams. In other words, no two streams have the same source or sink
> + * stream ID on a single pad. This is the most common case of routing
> + * supported by devices.
> + *
> + * Returns 0 on success, error value otherwise.
> + */
> +int v4l2_routing_simple_verify(const struct v4l2_subdev_krouting *routing);
> +
>  #endif

-- 
Regards,

Laurent Pinchart
