Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80BAA36E3AE
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 05:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhD2D1y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 23:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbhD2D1y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 23:27:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCBFC06138B
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 20:27:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97258BC0;
        Thu, 29 Apr 2021 05:27:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619666826;
        bh=qPzxEps9A+vJ4O456HUHAAYlmgvpM2Znpkr9Wr4rivE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QYGZ+AdSigoXidipiU5GdyOo4PoDqZcsW+8Ab2XL34RNX3Tt/tjh6neRyzh3/c5b6
         +pWxpwdHlCJnR3NjABdRm1dorHKk7j18BJcOztFi/wovVINnuKkE0cQHfyxiwD+SVO
         Pt+tbF+lBOfTXZYp29Leauf+ABys2HYj/U8cngl4=
Date:   Thu, 29 Apr 2021 06:27:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com
Subject: Re: [PATCH 3/4] media: ti-vpe: cal: add routing support
Message-ID: <YIonhCOpnYIh8dOL@pendragon.ideasonboard.com>
References: <20210427132028.1005757-1-tomi.valkeinen@ideasonboard.com>
 <20210427132028.1005757-4-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210427132028.1005757-4-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Apr 27, 2021 at 04:20:27PM +0300, Tomi Valkeinen wrote:
> Add routing support. As we still only support a single stream (i.e. a
> single route), the routing is not really used for anything yet.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 64 ++++++++++++++++++++
>  drivers/media/platform/ti-vpe/cal.h          |  2 +
>  2 files changed, 66 insertions(+)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> index 36103f5af6e9..3470f6dc0ec1 100644
> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> @@ -805,6 +805,37 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int cal_camerarx_sd_get_routing(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_krouting *routing)
> +{
> +	struct cal_camerarx *phy = to_cal_camerarx(sd);
> +	struct v4l2_subdev_krouting *src;

const, as src isn't modified.

> +
> +	src = &phy->routing;

That could be written

	const struct v4l2_subdev_krouting *src = &phy->routing;

> +
> +	if (routing->num_routes < src->num_routes) {
> +		routing->num_routes = src->num_routes;
> +		return -ENOSPC;
> +	}
> +
> +	v4l2_subdev_cpy_routing(routing, src);
> +
> +	return 0;
> +}
> +
> +static int cal_camerarx_sd_set_routing(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_krouting *routing)
> +{
> +	struct cal_camerarx *phy = to_cal_camerarx(sd);
> +	int ret;

Shouldn't you reject !ACTIVE configs ? Same in
cal_camerarx_sd_get_routing() I suppose.

> +
> +	ret = v4l2_subdev_dup_routing(&phy->routing, routing);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
>  				    struct v4l2_subdev_pad_config *cfg)
>  {
> @@ -837,6 +868,8 @@ static const struct v4l2_subdev_pad_ops cal_camerarx_pad_ops = {
>  	.enum_frame_size = cal_camerarx_sd_enum_frame_size,
>  	.get_fmt = cal_camerarx_sd_get_fmt,
>  	.set_fmt = cal_camerarx_sd_set_fmt,
> +	.get_routing = cal_camerarx_sd_get_routing,
> +	.set_routing = cal_camerarx_sd_set_routing,
>  };
>  
>  static const struct v4l2_subdev_ops cal_camerarx_subdev_ops = {
> @@ -844,8 +877,18 @@ static const struct v4l2_subdev_ops cal_camerarx_subdev_ops = {
>  	.pad = &cal_camerarx_pad_ops,
>  };
>  
> +static bool cal_camerarx_has_route(struct media_entity *entity, unsigned int pad0,
> +			  unsigned int pad1)
> +{
> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> +	struct cal_camerarx *phy = to_cal_camerarx(sd);
> +
> +	return v4l2_subdev_has_route(&phy->routing, pad0, pad1);
> +}
> +
>  static struct media_entity_operations cal_camerarx_media_ops = {
>  	.link_validate = v4l2_subdev_link_validate,
> +	.has_route = cal_camerarx_has_route,
>  };
>  
>  /* ------------------------------------------------------------------
> @@ -862,6 +905,20 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	int ret;
>  	unsigned int i;
>  
> +	struct v4l2_subdev_route routes[] = { {
> +		.sink_pad = 0,
> +		.sink_stream = 0,
> +		.source_pad = 1,
> +		.source_stream = 0,
> +		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +	} };
> +
> +	struct v4l2_subdev_krouting routing = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.num_routes = 1,
> +		.routes = routes,
> +	};

I'd move this above the other variables. Blank lines are not customary.

> +
>  	phy = kzalloc(sizeof(*phy), GFP_KERNEL);
>  	if (!phy)
>  		return ERR_PTR(-ENOMEM);
> @@ -914,6 +971,11 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	if (ret)
>  		goto error;
>  
> +	/* Initialize routing to single route to the fist source pad */

s/fist/first/
s/pad/pad./

> +	ret = cal_camerarx_sd_set_routing(sd, &routing);
> +	if (ret)
> +		goto error;
> +
>  	ret = v4l2_device_register_subdev(&cal->v4l2_dev, sd);
>  	if (ret)
>  		goto error;
> @@ -921,6 +983,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	return phy;
>  
>  error:
> +	v4l2_subdev_free_routing(&phy->routing);
>  	media_entity_cleanup(&phy->subdev.entity);
>  	kfree(phy);
>  	return ERR_PTR(ret);
> @@ -932,6 +995,7 @@ void cal_camerarx_destroy(struct cal_camerarx *phy)
>  		return;
>  
>  	v4l2_device_unregister_subdev(&phy->subdev);
> +	v4l2_subdev_free_routing(&phy->routing);
>  	media_entity_cleanup(&phy->subdev.entity);
>  	of_node_put(phy->source_ep_node);
>  	of_node_put(phy->source_node);
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index 3aea444f8bf8..c96364eb0930 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -184,6 +184,8 @@ struct cal_camerarx {
>  	struct mutex		mutex;
>  
>  	unsigned int enable_count;
> +
> +	struct v4l2_subdev_krouting routing;

Looking forward to storing this in v4l2_subdev_config, and embedding an
instance of v4l2_subdev_config in v4l2_subdev :-)
cal_camerarx_has_route() could then be replaced by a generic V4L2 subdev
helper, and so could cal_camerarx_sd_get_routing().

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  };
>  
>  struct cal_dev {

-- 
Regards,

Laurent Pinchart
