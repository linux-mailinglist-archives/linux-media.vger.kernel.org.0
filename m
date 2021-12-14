Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5584474DD7
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 23:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233326AbhLNWWN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 17:22:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbhLNWWM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 17:22:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83237C061574
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 14:22:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B30B48C4;
        Tue, 14 Dec 2021 23:22:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639520530;
        bh=Djanrb1qArmdt1u2pGupDqDFG1HBvjOlso+yEQW/YtA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NplJSJh8y0uUkg1U/xTMlIyorkI6pfgNT8GxSFyg86uOFCdSLBSeZ7cgxGsZotiUH
         634wHyI8zDmMCy7nTjJMsPnz0PuNQT9puw0cqJVNQhBP6GB/XkV+d2zP2M/VMW1xgp
         IRxHf4EuxtEd2tZrhMh6P+EEY5d0C0gHxPJ8Josw=
Date:   Wed, 15 Dec 2021 00:22:08 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        sakari.ailus@linux.intel.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH 5/5] media: v4l2-async: Create links during
 v4l2_async_match_notify()
Message-ID: <YbkZEDKHP2gyKjqd@pendragon.ideasonboard.com>
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211213232849.40071-6-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211213232849.40071-6-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Dec 13, 2021 at 11:28:49PM +0000, Daniel Scally wrote:
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
> Changes since the rfc:
> 
> 	- None
> 
>  drivers/media/v4l2-core/v4l2-async.c | 51 ++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 0404267f1ae4..6575b1cbe95f 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -275,6 +275,45 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
>  static int
>  v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
>  
> +static int
> +__v4l2_async_create_ancillary_link(struct v4l2_async_notifier *notifier,
> +				   struct v4l2_subdev *sd)
> +{
> +	struct media_link *link;
> +
> +	if (sd->entity.function != MEDIA_ENT_F_LENS &&
> +	    sd->entity.function != MEDIA_ENT_F_FLASH)
> +		return -EINVAL;
> +
> +	link = media_create_ancillary_link(&notifier->sd->entity, &sd->entity,

Is there a guarantee at this point that notifier->sd->entity has already
been registered with the media_device ? That's done by
media_device_register_entity() called from
v4l2_device_register_subdev().

> +					   MEDIA_LNK_FL_ENABLED |
> +					   MEDIA_LNK_FL_IMMUTABLE);
> +
> +	return IS_ERR(link) ? PTR_ERR(link) : 0;
> +}
> +
> +/*
> + * Setup links on behalf of the notifier and subdev, where it's obvious what

s/Setup/Create/ ("link setup" refers to another operation, enabling and
disabling links at runtime)

> + * should be done. At the moment, we only support cases where the notifier
> + * is a sensor and the subdev is a lens.

s/sensor/camera sensor/
s/lens/lens controller/

> + *
> + * TODO: Setup pad links if the notifier's function is MEDIA_ENT_F_VID_IF_BRIDGE
> + * and the subdev's is MEDIA_ENT_F_CAM_SENSOR
> + */
> +static int v4l2_async_try_create_links(struct v4l2_async_notifier *notifier,
> +				       struct v4l2_subdev *sd)
> +{
> +	if (!notifier->sd)
> +		return 0;
> +
> +	switch (notifier->sd->entity.function) {
> +	case MEDIA_ENT_F_CAM_SENSOR:
> +		return __v4l2_async_create_ancillary_link(notifier, sd);
> +	default:
> +		return 0;
> +	}
> +}
> +
>  static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>  				   struct v4l2_device *v4l2_dev,
>  				   struct v4l2_subdev *sd,
> @@ -293,6 +332,18 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>  		return ret;
>  	}
>  
> +	/*
> +	 * Depending of the function of the entities involved, we may want to
> +	 * create links between them (for example between a sensor and its lens
> +	 * or between a sensor's source pad and the connected device's sink
> +	 * pad)

s/)/)./

> +	 */
> +	ret = v4l2_async_try_create_links(notifier, sd);
> +	if (ret) {
> +		v4l2_device_unregister_subdev(sd);
> +		return ret;
> +	}
> +
>  	/* Remove from the waiting list */
>  	list_del(&asd->list);
>  	sd->asd = asd;

-- 
Regards,

Laurent Pinchart
