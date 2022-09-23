Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3C985E77A6
	for <lists+linux-media@lfdr.de>; Fri, 23 Sep 2022 11:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbiIWJu7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Sep 2022 05:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231570AbiIWJus (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Sep 2022 05:50:48 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED0E2182E
        for <linux-media@vger.kernel.org>; Fri, 23 Sep 2022 02:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663926638; x=1695462638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4azUKgLI8aepqIOyWqJdnwl5ryT2aTQ0LBhY1oCfZnE=;
  b=PrNl6LsD5K9jRIkeye9RPf8Y/BlP02rkByDt6LnvP9d2uiI6m2SbnQjV
   4L/AQLUTG3qCFYl/H/rcFX+/bJk7iXMQRBaTznn71dS9Wv8cyPDlkEd7C
   FzEz5EDnDMNmOHfThDlKOLK8xLrGd0op/Iuha7DeFId4ExFOHhOZ6skHa
   BKC8OcfzSQqEdNB5s8y5657L/8KutOMd8TWBF4voa8/qLNrC3KhfOYMUb
   syf9jsldPuwh3zUa5qSL0EiyJGm/+wgjjaAc0a/AYfRLBrzqEjxCXGJ23
   VC2NLjQQ4xzPtmvQUUY18p6RpCu1a+f1uwuYN/YwIEwuTIE1hXWrTZugo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="298156731"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="298156731"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 02:50:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="682604310"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 02:50:35 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 8F98D20124;
        Fri, 23 Sep 2022 12:50:33 +0300 (EEST)
Date:   Fri, 23 Sep 2022 09:50:33 +0000
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
Subject: Re: [PATCH v14 21/34] media: subdev: add
 v4l2_subdev_has_pad_interdep()
Message-ID: <Yy2BaQrIUsw2AUlB@paasikivi.fi.intel.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
 <20220831141357.1396081-22-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831141357.1396081-22-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Wed, Aug 31, 2022 at 05:13:44PM +0300, Tomi Valkeinen wrote:
> Add a v4l2_subdev_has_pad_interdep() helper function which can be used
> for media_entity_operations.has_pad_interdep op.
> 
> It considers two pads interdependent if there is an active route between
> pad0 and pad1.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 31 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 17 +++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index af1f53d99507..1ce9a7dc0c6e 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1045,6 +1045,37 @@ int v4l2_subdev_link_validate(struct media_link *link)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
>  
> +bool v4l2_subdev_has_pad_interdep(struct media_entity *entity,
> +				  unsigned int pad0, unsigned int pad1)
> +{
> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> +	struct v4l2_subdev_krouting *routing;
> +	unsigned int i;
> +	struct v4l2_subdev_state *state;

Please declare i after state.

> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
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
> +EXPORT_SYMBOL_GPL(v4l2_subdev_has_pad_interdep);
> +
>  struct v4l2_subdev_state *
>  __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
>  			  struct lock_class_key *lock_key)
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index f38943932cfe..2d1509556ce0 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1235,6 +1235,23 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
>   */
>  int v4l2_subdev_link_validate(struct media_link *link);
>  
> +/**
> + * v4l2_subdev_has_pad_interdep - MC has_pad_interdep implementation for subdevs
> + *
> + * @entity: pointer to &struct media_entity
> + * @pad0: pad number for the first pad
> + * @pad1: pad number for the second pad
> + *
> + * This function is an implementation of the media_entity_operations.has_pad_interdep

Please run

$ scripts/checkpatch.pl --strict --max-line-length=80

on this.

> + * operation for subdevs that implement the multiplexed streams API (as
> + * indicated by the V4L2_SUBDEV_FL_STREAMS subdev flag).
> + *
> + * It considers two pads interdependent if there is an active route between pad0
> + * and pad1.
> + */
> +bool v4l2_subdev_has_pad_interdep(struct media_entity *entity,
> +				  unsigned int pad0, unsigned int pad1);
> +
>  /**
>   * __v4l2_subdev_state_alloc - allocate v4l2_subdev_state
>   *

-- 
Terveisin,
Sakari Ailus
