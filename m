Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B821586570
	for <lists+linux-media@lfdr.de>; Mon,  1 Aug 2022 08:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbiHAG71 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Aug 2022 02:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiHAG7Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Aug 2022 02:59:25 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0510C26117
        for <linux-media@vger.kernel.org>; Sun, 31 Jul 2022 23:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659337161; x=1690873161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o7mvsy/JPzfi6PYe7W9zMRW2wb2omypi5q014J/Bduw=;
  b=XpQqzg99FDvkzENRt1LPFN7nizcf/Gz0DgtfcVxcoKANS56QKdTIsQHm
   wrVMvI27Uy156ZV+cybUYK3DLOjP8Qipgz7keVMCl03WiJL6ISWQqxN5j
   pAlgiNMycJXh6VmkYVAflkVIm1L2aURmlXunnoI6447keROrDi4yOi8qZ
   D9kvy3b+xyLmnNmpdqE+dsFZwjRiCXgVnCdY/KzPcHYLBcuUYaEkX5Wj8
   5v87bMqEZsCyGZd1ICjpjrQ6iqAqASUVT0rFOWrWtr/tT+vyFwX+lZYwp
   LTNtNrlDoyDngMAVhtP5O4M+uA/Aa21TBJMLDI1ybZnxtETUw/bOX4QAF
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10425"; a="275978591"
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="275978591"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2022 23:59:20 -0700
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="728348050"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2022 23:59:17 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 968BE2019B;
        Mon,  1 Aug 2022 09:59:15 +0300 (EEST)
Date:   Mon, 1 Aug 2022 06:59:15 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v12 15/30] media: subdev: add v4l2_subdev_set_routing
 helper()
Message-ID: <Yud5w0xS/zv3auYR@paasikivi.fi.intel.com>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-16-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727103639.581567-16-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Wed, Jul 27, 2022 at 01:36:24PM +0300, Tomi Valkeinen wrote:
> Add a helper function to set the subdev routing. The helper can be used
> from subdev driver's set_routing op to store the routing table.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 27 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 16 ++++++++++++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index befd00ebf381..0b841cf74c74 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1176,6 +1176,33 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
>  
> +int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state,
> +			    struct v4l2_subdev_krouting *routing)
> +{
> +	struct v4l2_subdev_krouting *dst = &state->routing;
> +	const struct v4l2_subdev_krouting *src = routing;
> +
> +	lockdep_assert_held(state->lock);
> +
> +	kfree(dst->routes);
> +	dst->routes = NULL;
> +	dst->num_routes = 0;

Shouldn't you keep the old routing around until memory allocation (and
anything else that can fail) has succeeded?

> +
> +	if (src->num_routes > 0) {
> +		dst->routes = kmemdup(src->routes,
> +				      src->num_routes * sizeof(*src->routes),
> +				      GFP_KERNEL);
> +		if (!dst->routes)
> +			return -ENOMEM;
> +
> +		dst->num_routes = src->num_routes;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
> +
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>  
>  #endif /* CONFIG_MEDIA_CONTROLLER */
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index decd1e1c3d39..37081a2e6697 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1407,6 +1407,22 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
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
> +			    struct v4l2_subdev_krouting *routing);
> +
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>  
>  #endif /* CONFIG_MEDIA_CONTROLLER */

-- 
Terveisin,

Sakari Ailus
