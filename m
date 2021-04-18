Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0207C36374C
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 21:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbhDRTTY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 15:19:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:32820 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhDRTTX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 15:19:23 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41F864AB;
        Sun, 18 Apr 2021 21:18:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618773534;
        bh=JhE7fA8Y1kUeJqPS/b4thKW3pmCmTYoeGY1Fp9yNESo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h0yB37XZkjQK3ZBMcQ8yWXKCr5ymN7RLpQ6IERaQOre35bTAIkG7s3Z7yVClzR9W0
         RGsbZnRPol0fxXvTy609k7Ql2Vdt9757J8f5YyjyiCcHEK08RMNgFbVDmTmwMVozz8
         ex7lZpWmTlnuI/5MctZ0SIZU/6Ga7IKA8Jnj3IXI=
Date:   Sun, 18 Apr 2021 22:18:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 21/24] v4l: subdev: routing kernel helper functions
Message-ID: <YHyGGsTw8S/kth34@pendragon.ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-22-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210415130450.421168-22-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Thu, Apr 15, 2021 at 04:04:47PM +0300, Tomi Valkeinen wrote:
> Add helper functions for routing.
> 
> TODO: add docs.

I was going to mention that :-) Before doing this, however, we should
consider integration of the routing table in the v4l2_subdev_state, as
it will change the API needs. How does v4l2_subdev_duplicate_state()
sound ? ;-)

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 89 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 14 +++++
>  2 files changed, 103 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 95a4c3091fa6..7a4f71d8c6c3 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -909,6 +909,95 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>  	return -EINVAL;
>  }
>  
> +int v4l2_subdev_get_krouting(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_krouting *routing)
> +{
> +	int ret;
> +
> +	routing->which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +	routing->routes = NULL;
> +	routing->num_routes = 0;
> +
> +	ret = v4l2_subdev_call(sd, pad, get_routing, routing);
> +	if (ret == 0)
> +		return 0;
> +	if (ret != -ENOSPC)
> +		return ret;
> +
> +	routing->routes = kvmalloc_array(routing->num_routes,
> +					 sizeof(*routing->routes), GFP_KERNEL);
> +	if (!routing->routes)
> +		return -ENOMEM;
> +
> +	ret = v4l2_subdev_call(sd, pad, get_routing, routing);
> +	if (ret) {
> +		kvfree(routing->routes);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_krouting);
> +
> +void v4l2_subdev_free_routing(struct v4l2_subdev_krouting *routing)
> +{
> +	kvfree(routing->routes);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_free_routing);
> +
> +void v4l2_subdev_cpy_routing(struct v4l2_subdev_krouting *dst,
> +			     const struct v4l2_subdev_krouting *src)
> +{
> +	memcpy(dst->routes, src->routes,
> +	       src->num_routes * sizeof(*src->routes));
> +	dst->num_routes = src->num_routes;
> +	dst->which = src->which;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_cpy_routing);
> +
> +int v4l2_subdev_dup_routing(struct v4l2_subdev_krouting *dst,
> +			    const struct v4l2_subdev_krouting *src)
> +{
> +	if (dst->routes)
> +		kvfree(dst->routes);
> +
> +	if (src->num_routes == 0) {
> +		dst->which = src->which;
> +		dst->routes = NULL;
> +		dst->num_routes = 0;
> +		return 0;
> +	}
> +
> +	dst->routes = kvmalloc_array(src->num_routes, sizeof(*src->routes),
> +				     GFP_KERNEL);
> +	if (!dst->routes)
> +		return -ENOMEM;
> +
> +	v4l2_subdev_cpy_routing(dst, src);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_dup_routing);
> +
> +bool v4l2_subdev_has_route(struct v4l2_subdev_krouting *routing,
> +			   unsigned int pad0, unsigned int pad1)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < routing->num_routes; ++i) {
> +		struct v4l2_subdev_route *route = &routing->routes[i];
> +
> +		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> +			continue;
> +
> +		if (route->sink_pad == pad0 && route->source_pad == pad1)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_has_route);
> +
>  int v4l2_subdev_link_validate(struct media_link *link)
>  {
>  	struct v4l2_subdev *sink;
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 3826ab918731..1843b77dd843 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1225,4 +1225,18 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
>  void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
>  			      const struct v4l2_event *ev);
>  
> +int v4l2_subdev_get_krouting(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_krouting *routing);
> +
> +void v4l2_subdev_free_routing(struct v4l2_subdev_krouting *routing);
> +
> +int v4l2_subdev_dup_routing(struct v4l2_subdev_krouting *dst,
> +			    const struct v4l2_subdev_krouting *src);
> +
> +void v4l2_subdev_cpy_routing(struct v4l2_subdev_krouting *dst,
> +			     const struct v4l2_subdev_krouting *src);
> +
> +bool v4l2_subdev_has_route(struct v4l2_subdev_krouting *routing,
> +			   unsigned int pad0, unsigned int pad1);
> +
>  #endif

-- 
Regards,

Laurent Pinchart
