Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE4695E92BA
	for <lists+linux-media@lfdr.de>; Sun, 25 Sep 2022 13:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbiIYL0l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Sep 2022 07:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231790AbiIYL0j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Sep 2022 07:26:39 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D9D32F3B9
        for <linux-media@vger.kernel.org>; Sun, 25 Sep 2022 04:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664105198; x=1695641198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1c9I7ccATtOOdW3mOpBFCyma5avL04QJjLOrZXzjl1Q=;
  b=NrKwH4SnRgyie/2a0lxI9ZSohxBuoLxH6RV1DB/zIIqLSAGwKiGKMNTh
   5wqVbZZl+SnrCwpHorML6Syxb29YRySEy4/ctnGdCxorFiM4hKsPnTaoe
   1kjqf9LPrCpksC1LPcBMdX4VNVKdlqdyttpM4dwU6c+oxy1U9C4SGcHGr
   36VNjKbojs5ARgagBMuKXXu9L2C7RYN2NffZmpyqcBN3/tQa0yADqpcbl
   NEIV3UtSOFXSUv7JMjGGkDokz8NUhe/+H5BoD9K7Gn/EQ4Y4Q3yyNlRXF
   4pXJ+tyuqF9ZiH5En1KaN58rC9R4YTwgfQSA79tSVFpGX3v/1qfLOsj7S
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10480"; a="287986258"
X-IronPort-AV: E=Sophos;i="5.93,344,1654585200"; 
   d="scan'208";a="287986258"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2022 04:26:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,344,1654585200"; 
   d="scan'208";a="865813084"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2022 04:26:35 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 8B6D020077;
        Sun, 25 Sep 2022 14:26:33 +0300 (EEST)
Date:   Sun, 25 Sep 2022 11:26:33 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v14 22/34] media: subdev: add v4l2_subdev_set_routing
 helper()
Message-ID: <YzA66QYWk6AX8KoJ@paasikivi.fi.intel.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
 <20220831141357.1396081-23-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831141357.1396081-23-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Wed, Aug 31, 2022 at 05:13:45PM +0300, Tomi Valkeinen wrote:
> Add a helper function to set the subdev routing. The helper can be used
> from subdev driver's set_routing op to store the routing table.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 28 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 16 +++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 1ce9a7dc0c6e..f3f872c72180 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1180,6 +1180,34 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
>  
> +int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state,
> +			    const struct v4l2_subdev_krouting *routing)
> +{
> +	struct v4l2_subdev_krouting *dst = &state->routing;
> +	const struct v4l2_subdev_krouting *src = routing;
> +	struct v4l2_subdev_krouting new_routing = { 0 };
> +
> +	lockdep_assert_held(state->lock);
> +
> +	if (src->num_routes > 0) {
> +		new_routing.routes = kmemdup(src->routes,
> +			src->num_routes * sizeof(*src->routes),

This can overflow.

> +			GFP_KERNEL);

Apart from that:

		new_routing.routes =
			kmemdup(src->routes,
				src->num_routes * sizeof(*src->routes),
				GFP_KERNEL);

> +
> +		if (!new_routing.routes)
> +			return -ENOMEM;
> +	}
> +
> +	new_routing.num_routes = src->num_routes;
> +
> +	kfree(dst->routes);
> +	*dst = new_routing;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
> +
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>  
>  #endif /* CONFIG_MEDIA_CONTROLLER */
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 2d1509556ce0..b29003de8b0a 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1412,6 +1412,22 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
>  int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format);
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
> +			    const struct v4l2_subdev_krouting *routing);
> +
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>  
>  #endif /* CONFIG_MEDIA_CONTROLLER */

-- 
Terveisin,

Sakari Ailus
