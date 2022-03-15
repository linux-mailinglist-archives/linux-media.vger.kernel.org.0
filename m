Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD1234DA680
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 00:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352677AbiCOX6n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 19:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344372AbiCOX6m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 19:58:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54426DEA7
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 16:57:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C187A67;
        Wed, 16 Mar 2022 00:57:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647388648;
        bh=0H7ZHZHlOnyteW5l9VvECWwbV+cCuaRhVPfrerh95Q0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GCTDXOZDjYWt/nz5c+8TejhQCqekW0OIPSP+sJRmVIcX6MyALNJyDjALr3iobsAU5
         vP1Bpg/QL9Ao8+xPZX4rFYBuaRJivOSKygCFI7y6Kq6CbOa8ybPeVPmfCVsvixRYr1
         L4XOk3rgtp2vi7+IEGK/Mn4ndypUQkbY1Eg0sJP4=
Date:   Wed, 16 Mar 2022 01:57:10 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        sakari.ailus@linux.intel.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH v3 5/5] media: v4l2-async: Create links during
 v4l2_async_match_notify()
Message-ID: <YjEn1tMZ4O8vup5e@pendragon.ideasonboard.com>
References: <20220302220304.1327896-1-djrscally@gmail.com>
 <20220302220304.1327896-6-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220302220304.1327896-6-djrscally@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Wed, Mar 02, 2022 at 10:03:04PM +0000, Daniel Scally wrote:
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Changes since v2:
> 
> 	- Stopped checking the notifier entity's function when creating the new
> 	links, and just create them whenever the subdev entity's function is either
> 	a lens controller or a flash. (Sakari)
> 
> Changes since v1:
> 
> 	- Added #ifdef guards for CONFIG_MEDIA_CONTROLLER
> 	- Some spelling and nomenclature cleanup (Laurent)
> 
> Changes since the rfc:
> 
> 	- None
> 
>  drivers/media/v4l2-core/v4l2-async.c | 31 ++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 0404267f1ae4..436bd6900fd8 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -275,6 +275,24 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
>  static int
>  v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
>  
> +static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> +					     struct v4l2_subdev *sd)
> +{
> +	struct media_link *link = NULL;
> +
> +#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> +
> +	if (sd->entity.function != MEDIA_ENT_F_LENS &&
> +	    sd->entity.function != MEDIA_ENT_F_FLASH)
> +		return 0;
> +
> +	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
> +
> +#endif
> +
> +	return IS_ERR(link) ? PTR_ERR(link) : 0;
> +}
> +
>  static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>  				   struct v4l2_device *v4l2_dev,
>  				   struct v4l2_subdev *sd,
> @@ -293,6 +311,19 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>  		return ret;
>  	}
>  
> +	/*
> +	 * Depending of the function of the entities involved, we may want to
> +	 * create links between them (for example between a sensor and its lens
> +	 * or between a sensor's source pad and the connected device's sink
> +	 * pad).
> +	 */
> +	ret = v4l2_async_create_ancillary_links(notifier, sd);
> +	if (ret) {
> +		v4l2_async_nf_call_unbind(notifier, sd, asd);
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
