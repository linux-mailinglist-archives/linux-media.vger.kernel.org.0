Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1318A4A7611
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 17:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345937AbiBBQiY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 11:38:24 -0500
Received: from mga12.intel.com ([192.55.52.136]:10432 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231801AbiBBQiX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Feb 2022 11:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643819903; x=1675355903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=46B9ATcsjaW2tDg2VW5g3uE1sBtK/GhWxh2/eTndAeQ=;
  b=F0U3R/lJe2ET0meytbDsah6L1skmDBVGhhx2Rvl2GN1Ftzn26y6nJdM/
   gkXPXojpn7yHI5t2P0X4YGebwjmUAv2RDePU4QVA5AtRy1iF8Rqqf5GFb
   5ZZdD9rD6lD11mkuK0eGdNtzXH5q6HnYJhCNsQaoLzS9HdanRCTNrIgpG
   5KaO7H3fqo47BZ8KrQSlkJFcNK+nXXTEQl4tX/a53vSWfUQTRPZ8CX0T5
   lbhYKqg9COqopEVe6JGfNP2FaDCnOBA+U0It5h7pMAoyRjtWHvBAWid78
   jgA6TG/+Ld5ZSbeNe6hDqFJ2F01YmCTcTtCYPpj3aP9pgKr0FzYqGGV4L
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="227926563"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="227926563"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 08:38:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="497800799"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 08:38:17 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id BD18820139;
        Wed,  2 Feb 2022 18:38:14 +0200 (EET)
Date:   Wed, 2 Feb 2022 18:38:14 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        laurent.pinchart@ideasonboard.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH v2 6/6] media: v4l2-async: Create links during
 v4l2_async_match_notify()
Message-ID: <YfqzdowSDlF9VwFP@paasikivi.fi.intel.com>
References: <20220130235821.48076-1-djrscally@gmail.com>
 <20220130235821.48076-7-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220130235821.48076-7-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thanks for the update.

On Sun, Jan 30, 2022 at 11:58:21PM +0000, Daniel Scally wrote:
> Upon an async fwnode match, there's some typical behaviour that the
> notifier and matching subdev will want to do. For example, a notifier
> representing a sensor matching to an async subdev representing its
> VCM will want to create an ancillary link to expose that relationship
> to userspace.
> 
> To avoid lots of code in individual drivers, try to build these links
> within v4l2 core.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes since v1:
> 
> 	- Added #ifdef guards for CONFIG_MEDIA_CONTROLLER
> 	- Some spelling and nomenclature cleanup (Laurent)
> 
> Changes since the rfc:
> 
> 	- None
> 
>  drivers/media/v4l2-core/v4l2-async.c | 56 ++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 0404267f1ae4..8980534e755e 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -275,6 +275,50 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
>  static int
>  v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
>  
> +static int
> +__v4l2_async_create_ancillary_link(struct v4l2_async_notifier *notifier,
> +				   struct v4l2_subdev *sd)
> +{
> +	struct media_link *link = NULL;
> +
> +#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> +
> +	if (sd->entity.function != MEDIA_ENT_F_LENS &&
> +	    sd->entity.function != MEDIA_ENT_F_FLASH)
> +		return -EINVAL;
> +
> +	link = media_create_ancillary_link(&notifier->sd->entity, &sd->entity);
> +
> +#endif
> +
> +	return IS_ERR(link) ? PTR_ERR(link) : 0;
> +}
> +
> +/*
> + * Create links on behalf of the notifier and subdev, where it's obvious what
> + * should be done. At the moment, we only support cases where the notifier
> + * is a camera sensor and the subdev is a lens controller.

I think I'd rather change this so that ancillary links are created for lens
and flash subdevs, independently of the function of the notifier subdev.

Are there cases where this would go wrong currently, or in the future? I
can't think of any right now at least. I guess we could add more
information in the future to convey here if needed.

> + *
> + * TODO: Create data links if the notifier's function is
> + * MEDIA_ENT_F_VID_IF_BRIDGE and the subdev's is MEDIA_ENT_F_CAM_SENSOR.
> + */
> +static int v4l2_async_try_create_links(struct v4l2_async_notifier *notifier,
> +				       struct v4l2_subdev *sd)

How about calling this v4l2_async_create_ancillary_links()?

> +{
> +#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> +
> +	if (!notifier->sd)
> +		return 0;
> +
> +	switch (notifier->sd->entity.function) {
> +	case MEDIA_ENT_F_CAM_SENSOR:
> +		return __v4l2_async_create_ancillary_link(notifier, sd);
> +	}
> +
> +#endif
> +	return 0;
> +}
> +
>  static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>  				   struct v4l2_device *v4l2_dev,
>  				   struct v4l2_subdev *sd,
> @@ -293,6 +337,18 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>  		return ret;
>  	}
>  
> +	/*
> +	 * Depending of the function of the entities involved, we may want to
> +	 * create links between them (for example between a sensor and its lens
> +	 * or between a sensor's source pad and the connected device's sink
> +	 * pad).
> +	 */
> +	ret = v4l2_async_try_create_links(notifier, sd);
> +	if (ret) {

The notifier's bound function has been called already. The unbound function
needs to be thus called here, too.

> +		v4l2_device_unregister_subdev(sd);
> +		return ret;
> +	}
> +
>  	/* Remove from the waiting list */
>  	list_del(&asd->list);
>  	sd->asd = asd;

-- 
Kind regards,

Sakari Ailus
