Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19A364E8A74
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 00:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236895AbiC0WUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Mar 2022 18:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232336AbiC0WUS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Mar 2022 18:20:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C76A0E0CC
        for <linux-media@vger.kernel.org>; Sun, 27 Mar 2022 15:18:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E8132F7;
        Mon, 28 Mar 2022 00:18:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648419516;
        bh=iyYx8xuvB+IFQHIOlMbGBXD6/T6nblEEr/kpP5lIR2g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wiECim0I2z6LScPupQXlbu81sFVqMrBTEKD6PqsjH6sl0wOS+4LieEgE+l0DAiHbC
         9KZ3ov9MQx9DRrftGkhRGXQRtmf6q4I+Hqtrgct4+3ZdYgRhuRyateR3AYoYtQpNoD
         0h0fnyILyAzyHBrnXWaEdAH7uDZ5brraMQKo7Rtk=
Date:   Mon, 28 Mar 2022 01:18:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, Colin King <colin.i.king@gmail.com>,
        tfiga@chromium.org
Subject: Re: [PATCH v4] media: uvcvideo: Fix memory leak if
 uvc_ctrl_add_mapping fails
Message-ID: <YkDiumT/5oHnZLaQ@pendragon.ideasonboard.com>
References: <20220324224232.385888-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220324224232.385888-1-ribalda@chromium.org>
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

On Thu, Mar 24, 2022 at 11:42:32PM +0100, Ricardo Ribalda wrote:
> Move all the life cycle of the name to add_mapping. This simplifies
> the error handling inside uvc_ioctl_ctrl_map and solves a memory leak
> when kemmdup fails.
> 
> Fixes: 07adedb5c606 ("media: uvcvideo: Use control names from framework")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> 
> Laurent:
> Please note that I have added xmap->name[0] == '\0' check!

Could you mention it in the commit message then ?

>  drivers/media/usb/uvc/uvc_ctrl.c | 10 ++++++++++
>  drivers/media/usb/uvc/uvc_v4l2.c |  8 ++++----
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index b4f6edf968bc..8b3bd516cb2f 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2188,11 +2188,21 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  	if (map == NULL)
>  		return -ENOMEM;
>  
> +	/* For UVCIOC_CTRL_MAP custom controls */

s/controls/controls./

My R-B still applies.

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
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 711556d13d03..ac829fb44b77 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -42,12 +42,12 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>  	map->id = xmap->id;
>  	/* Non standard control id. */
>  	if (v4l2_ctrl_get_name(map->id) == NULL) {
> -		map->name = kmemdup(xmap->name, sizeof(xmap->name),
> -				    GFP_KERNEL);
> -		if (!map->name) {
> -			ret = -ENOMEM;
> +		if (xmap->name[0] == '\0') {
> +			ret = -EINVAL;
>  			goto free_map;
>  		}
> +		xmap->name[sizeof(xmap->name) - 1] = '\0';
> +		map->name = xmap->name;
>  	}
>  	memcpy(map->entity, xmap->entity, sizeof(map->entity));
>  	map->selector = xmap->selector;

-- 
Regards,

Laurent Pinchart
