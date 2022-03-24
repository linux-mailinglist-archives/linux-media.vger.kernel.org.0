Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE924E69D4
	for <lists+linux-media@lfdr.de>; Thu, 24 Mar 2022 21:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353403AbiCXUbW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Mar 2022 16:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353388AbiCXUbV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Mar 2022 16:31:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67BED62104
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 13:29:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C3871A38;
        Thu, 24 Mar 2022 21:29:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648153785;
        bh=s38NHcCDaOo6hTIuBCvgGMnpdDyb9MJyuvWEV2EaIvQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AMkdxu7WgmbM2ldx3ZRiSwUCOZSzE6f62vK5AbG86v7lYfGvv00hCiEOA5vyXHV0B
         L9Nm2R0UW9wZzWKNczRbTSMeyWBKkb+M9XS0124N90741ivuL5JQe//3UQE5L1c7hq
         5cEEWm2LLsHGuT+8DGCxroB5zdzm311JcX3ZULPE=
Date:   Thu, 24 Mar 2022 22:29:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, Colin King <colin.king@canonical.com>
Subject: Re: [PATCH v2] media: uvcvideo: Fix memory leak if
 uvc_ctrl_add_mapping fails
Message-ID: <YjzUuKxG5jJ8M0CH@pendragon.ideasonboard.com>
References: <20211008120914.69175-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211008120914.69175-1-ribalda@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Fri, Oct 08, 2021 at 02:09:14PM +0200, Ricardo Ribalda wrote:
> If the mapping fails, the name field is not freed on exit.
> Take the same approach as with the menu_info and have two different
> allocations with two different life cycles.
> 
> Fixes: 07adedb5c606 ("media: uvcvideo: Use control names from framework")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> To be applied after [PATCH][next] media: uvcvideo: Fix memory leak of object map on error exit path
> 
> Changelog v2: use kstrdup functions
> 
>  drivers/media/usb/uvc/uvc_ctrl.c | 10 ++++++++++
>  drivers/media/usb/uvc/uvc_v4l2.c | 12 +++++++-----
>  2 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 30bfe9069a1f..6bd7c30dfb75 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2188,11 +2188,21 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  	if (map == NULL)
>  		return -ENOMEM;
>  
> +	/* For UVCIOC_CTRL_MAP custom controls */
> +	if (mapping->name) {
> +		map->name = kstrdup(mapping->name, GFP_KERNEL);
> +		if (!map->name) {
> +			kfree(map);
> +			return -ENOMEM;
> +		}
> +	}
> +
>  	INIT_LIST_HEAD(&map->ev_subs);
>  
>  	size = sizeof(*mapping->menu_info) * mapping->menu_count;
>  	map->menu_info = kmemdup(mapping->menu_info, size, GFP_KERNEL);
>  	if (map->menu_info == NULL) {
> +		kfree(map->name);
>  		kfree(map);
>  		return -ENOMEM;
>  	}

Looks good to me.

> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 711556d13d03..43bd8809241c 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -42,8 +42,8 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>  	map->id = xmap->id;
>  	/* Non standard control id. */
>  	if (v4l2_ctrl_get_name(map->id) == NULL) {
> -		map->name = kmemdup(xmap->name, sizeof(xmap->name),
> -				    GFP_KERNEL);
> +		map->name = kstrndup(xmap->name, sizeof(xmap->name),
> +				     GFP_KERNEL);
>  		if (!map->name) {
>  			ret = -ENOMEM;
>  			goto free_map;

But do we actually have to duplicate the name here, can't we set

		map->name = xmap->name;

? We probably want to also set

		xmap->name[sizeof(xmap->name) - 1] = '\0';

> @@ -69,14 +69,14 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>  		if (xmap->menu_count == 0 ||
>  		    xmap->menu_count > UVC_MAX_CONTROL_MENU_ENTRIES) {
>  			ret = -EINVAL;
> -			goto free_map;
> +			goto free_map_name;
>  		}
>  
>  		size = xmap->menu_count * sizeof(*map->menu_info);
>  		map->menu_info = memdup_user(xmap->menu_info, size);
>  		if (IS_ERR(map->menu_info)) {
>  			ret = PTR_ERR(map->menu_info);
> -			goto free_map;
> +			goto free_map_name;
>  		}
>  
>  		map->menu_count = xmap->menu_count;
> @@ -86,12 +86,14 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>  		uvc_dbg(chain->dev, CONTROL,
>  			"Unsupported V4L2 control type %u\n", xmap->v4l2_type);
>  		ret = -ENOTTY;
> -		goto free_map;
> +		goto free_map_name;
>  	}
>  
>  	ret = uvc_ctrl_add_mapping(chain, map);
>  
>  	kfree(map->menu_info);
> +free_map_name:
> +	kfree(map->name);
>  free_map:
>  	kfree(map);
>  
> -- 
> 2.33.0.882.g93a45727a2-goog
> 

-- 
Regards,

Laurent Pinchart
