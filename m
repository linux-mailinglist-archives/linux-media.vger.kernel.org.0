Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E557A42A7E2
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 17:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237223AbhJLPHz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 11:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237406AbhJLPHy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 11:07:54 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF332C061570
        for <linux-media@vger.kernel.org>; Tue, 12 Oct 2021 08:05:52 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aJLgmsf2Sx7rIaJLjmMRbr; Tue, 12 Oct 2021 17:05:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634051151; bh=SHLrCmvPHx/gR1+GojX0YOq7PZiVywSYfIm/OUgGhrM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=A2Rj78imjH7uSCVwCSiQ5+hTOAHxlHQ+xnL2oAAUnNqfqm+yBb3Pos+5TtLOAkh49
         deFC2OBIigXdOCRLy9N6yGaFEir1u5fnkIyMBuAaqjeXOon2l5q7SMHpmamHEACIUp
         6n+wCb6qooFocKD+XVfBCM/cUbEVxwgAiplrRV1hK1/aPcdjgoE1I79zPr25rDxeSL
         +4QKfbK0foTPnYn39haRURGPrOFnV0HQFnP2tTQk1hY4vUcxX7B4G09btQIUM/hIsX
         vqqoZC0jmtgR9dzUMKxU1fBFWTe52YOavoZc853h44l0gDiQHBzfI7/r0BYIhJtLvZ
         7YN8TYliGKW7w==
Subject: Re: [PATCH v9 28/36] media: subdev: add v4l2_subdev_has_route()
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-29-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a580ccd3-7b84-588c-6065-56dbd5becbf1@xs4all.nl>
Date:   Tue, 12 Oct 2021 17:05:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-29-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfN3pShsh7IQ60ePD0Cxe5ggL5A2GbWVBQJL4xwlraLyzxUrCuuqPawCWMUbMtt5TWXa6RtprCn120LsTvP/fTq4tkzTjxpplBNzl7J5FhF4va7ieElUM
 edejMkGy1YR/lGWaEfkDHM3QOJy0aLhLJMBYMeDMlvI4zMGVe5yoystv2rUth1NSbRedJRwqKv2rQTKklCuBLBvnhZ7qf3dlT8iTA8qfRmmCtssnw1bmPTL5
 viqhc1jDZ5dBlI4mh+Eg97ImZiNzRh3xPPZuK+5oZ/kGvL3YdyLgyHMAgJvxTlc7u1imIQ1uUSrDJEqcQ74tCeeupbJK43x8atvpWIlsGqD1g4NocvB0wOuT
 nhRnmadsFN+mrrjXmzHn1smmjT9rYvPSdpxuAxT/tNIXqWw4V+NX7aIsed4xOhEVc4OF315UzyWpRmddLMdzwC8QF9mzLJCpY7zsqI5jG/Jpge+JhmZY1/Es
 Pzcl9wX6chKSrXwZBoRqb8XPbixsmJcPwxB7jw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 10:57, Tomi Valkeinen wrote:
> Add a v4l2_subdev_has_route() helper function which can be used for
> media_entity_operations.has_route op.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 31 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 16 ++++++++++++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index b4e1f8772d96..14b8282fe45b 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -998,6 +998,37 @@ int v4l2_subdev_link_validate(struct media_link *link)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
>  
> +bool v4l2_subdev_has_route(struct media_entity *entity, unsigned int pad0,
> +			   unsigned int pad1)
> +{
> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> +	struct v4l2_subdev_krouting *routing;
> +	unsigned int i;
> +	struct v4l2_subdev_state *state;
> +
> +	state = v4l2_subdev_lock_active_state(sd);
> +
> +	routing = &state->routing;
> +
> +	for (i = 0; i < routing->num_routes; ++i) {
> +		struct v4l2_subdev_route *route = &routing->routes[i];
> +
> +		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> +			continue;
> +
> +		if ((route->sink_pad == pad0 && route->source_pad == pad1) ||
> +		    (route->source_pad == pad0 && route->sink_pad == pad1)) {
> +			v4l2_subdev_unlock_state(state);
> +			return true;
> +		}
> +	}
> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_has_route);
> +
>  struct v4l2_subdev_state *
>  __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
>  			  struct lock_class_key *lock_key)
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index f318670a49c8..8b2cf3190276 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1226,6 +1226,22 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
>   */
>  int v4l2_subdev_link_validate(struct media_link *link);
>  
> +/**
> + * v4l2_subdev_has_route - MC has_route implementation for subdevs
> + *
> + * @entity: pointer to &struct media_entity
> + * @pad0: pad number for the first pad
> + * @pad1: pad number for the second pad
> + *
> + * This function looks at the routing in subdev's active state and returns if
> + * there is a route connecting pad0 and pad1.
> + *
> + * This function can be used as implementation for
> + * media_entity_operations.has_route.
> + */
> +bool v4l2_subdev_has_route(struct media_entity *entity, unsigned int pad0,
> +			   unsigned int pad1);
> +
>  /**
>   * __v4l2_subdev_state_alloc - allocate v4l2_subdev_state
>   *
> 

