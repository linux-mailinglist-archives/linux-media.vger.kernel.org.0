Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D93F456AE4D
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 00:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236920AbiGGWWf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 18:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237054AbiGGWWe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 18:22:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD51F61D44
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 15:22:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E5C956D;
        Fri,  8 Jul 2022 00:22:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657232550;
        bh=z2aKlY4jQcZl3GH/YpxyQaBYXsMiZnWV4vFjKYGGTxc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IsFi314X4+kK983ro8+2truR/y/JNYGJ6iu9UXNhZsgFsUY7NJ/uheTkp2p7baEQo
         35q+S6zpCv3OpycMUmD4AuTfTefAu/UL6lqglbWjkaFqU6+Sg4io6EyOmOqHTHToR8
         wxuePgn44HgDu7OPtVdFnQP3id5p47kOJATZLwT8=
Date:   Fri, 8 Jul 2022 01:22:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yunke Cao <yunkec@google.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3] media: uvcvideo: use entity get_cur in uvc_ctrl_set
Message-ID: <YsdcjHSixBrwerlq@pendragon.ideasonboard.com>
References: <20220707085331.283402-1-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220707085331.283402-1-yunkec@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke,

Thank you for the patch.

On Thu, Jul 07, 2022 at 05:53:31PM +0900, Yunke Cao wrote:
> Entity controls should get_cur using an entity-defined function
> instead of via a query. Fix this in uvc_ctrl_set.
> 
> Fixes: 65900c581d01 ("media: uvcvideo: Allow entity-defined get_info and get_cur")
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
> Changelog since v2:
> -Move the logic of setting ctrl_data to 0 into load_cur.
> -Do not initialize ret=0.
> -Fix __uvc_ctrl_get() spacing.
> -Fix typo in the title.
> 
> Changelog since v1:
> -Factored out common logic into __uvc_ctrl_load_cur().
> 
>  drivers/media/usb/uvc/uvc_ctrl.c | 85 ++++++++++++++++++--------------
>  1 file changed, 48 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 0e78233fc8a0..181ce4b5db1e 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -963,35 +963,57 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
>  	return value;
>  }
>  
> +static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
> +			       struct uvc_control *ctrl)
> +{
> +	int ret;
> +
> +	if (ctrl->loaded)
> +		return 0;
> +
> +	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0) {
> +		memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> +		       0, ctrl->info.size);
> +		ctrl->loaded = 1;
> +
> +		return 0;
> +	}
> +
> +	if (ctrl->entity->get_cur) {
> +		ret = ctrl->entity->get_cur(chain->dev,
> +			ctrl->entity,
> +			ctrl->info.selector,
> +			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> +			ctrl->info.size);

I'll take this as an opportunity to realign the code:

	u8 *data;

	...

	data = uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT);

	if (ctrl->entity->get_cur)
		ret = ctrl->entity->get_cur(chain->dev, ctrl->entity,
					    ctrl->info.selector, data,
					    ctrl->info.size);
	else
		...

I'll send a v4 for your review :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	} else {
> +		ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> +				     ctrl->entity->id, chain->dev->intfnum,
> +				     ctrl->info.selector,
> +				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> +				     ctrl->info.size);
> +	}
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	ctrl->loaded = 1;
> +
> +	return ret;
> +}
> +
>  static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> -	struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
> -	s32 *value)
> +			  struct uvc_control *ctrl,
> +			  struct uvc_control_mapping *mapping,
> +			  s32 *value)
>  {
>  	int ret;
>  
>  	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
>  		return -EACCES;
>  
> -	if (!ctrl->loaded) {
> -		if (ctrl->entity->get_cur) {
> -			ret = ctrl->entity->get_cur(chain->dev,
> -				ctrl->entity,
> -				ctrl->info.selector,
> -				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> -				ctrl->info.size);
> -		} else {
> -			ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> -				ctrl->entity->id,
> -				chain->dev->intfnum,
> -				ctrl->info.selector,
> -				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> -				ctrl->info.size);
> -		}
> -		if (ret < 0)
> -			return ret;
> -
> -		ctrl->loaded = 1;
> -	}
> +	ret = __uvc_ctrl_load_cur(chain, ctrl);
> +	if (ret < 0)
> +		return ret;
>  
>  	*value = __uvc_ctrl_get_value(mapping,
>  				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> @@ -1783,21 +1805,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  	 * needs to be loaded from the device to perform the read-modify-write
>  	 * operation.
>  	 */
> -	if (!ctrl->loaded && (ctrl->info.size * 8) != mapping->size) {
> -		if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0) {
> -			memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> -				0, ctrl->info.size);
> -		} else {
> -			ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> -				ctrl->entity->id, chain->dev->intfnum,
> -				ctrl->info.selector,
> -				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> -				ctrl->info.size);
> -			if (ret < 0)
> -				return ret;
> -		}
> -
> -		ctrl->loaded = 1;
> +	if ((ctrl->info.size * 8) != mapping->size) {
> +		ret = __uvc_ctrl_load_cur(chain, ctrl);
> +		if (ret < 0)
> +			return ret;
>  	}
>  
>  	/* Backup the current value in case we need to rollback later. */

-- 
Regards,

Laurent Pinchart
