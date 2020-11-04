Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912F52A6306
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 12:13:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728535AbgKDLNn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 06:13:43 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56846 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgKDLNn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 06:13:43 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFA4E563;
        Wed,  4 Nov 2020 12:13:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604488421;
        bh=BUoB7ASl4pFDE9oczGQW16yG2S3XGXPGXygU4ZvISvU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bUlIHHeBA+gflc8mVjYnnRMDBafAEFlIwVII0ZDZJmat3inDHLot41cuKFX5gZ109
         fhFLC1uEMOQLVo90k5+MrnSEqovmaDn+liSjE2VkEI3/S9Oe0EdePvmPOyr1EWa7NR
         6ViJsSlwpj7lT1S6jfN5IbPJLt6YMrhuvr75HjQM=
Date:   Wed, 4 Nov 2020 13:12:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH 2/6] media: uvcvideo: Add UVC_CTRL_FLAG_ENTITY_GET_CUR
Message-ID: <20201104111253.GA6196@pendragon.ideasonboard.com>
References: <20201022133753.310506-1-ribalda@chromium.org>
 <20201022133753.310506-3-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201022133753.310506-3-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Thu, Oct 22, 2020 at 03:37:49PM +0200, Ricardo Ribalda wrote:
> This flag allows controls to get their current value from an entity
> defined function instead of via a query to the USB device.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 17 +++++++++++++----
>  include/uapi/linux/uvcvideo.h    |  1 +
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 7acdc055613b..0a8835742d49 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1001,10 +1001,19 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
>  		return -EACCES;
>  
>  	if (!ctrl->loaded) {
> -		ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, ctrl->entity->id,
> -				chain->dev->intfnum, ctrl->info.selector,
> -				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> -				ctrl->info.size);
> +		if (ctrl->info.flags & UVC_CTRL_FLAG_ENTITY_GET_CUR) {

Same question as for 2/6, do we need this flag ?

> +			if (!ctrl->entity->get_cur)
> +				return -EINVAL;
> +			ret = ctrl->entity->get_cur(ctrl->entity,
> +					ctrl->info.selector,
> +					uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> +					ctrl->info.size);
> +		} else {
> +			ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, ctrl->entity->id,
> +					     chain->dev->intfnum, ctrl->info.selector,
> +					     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> +					     ctrl->info.size);
> +		}
>  		if (ret < 0)
>  			return ret;
>  
> diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo.h
> index 69b636290c31..cb91797d2a09 100644
> --- a/include/uapi/linux/uvcvideo.h
> +++ b/include/uapi/linux/uvcvideo.h
> @@ -32,6 +32,7 @@
>  #define UVC_CTRL_FLAG_ASYNCHRONOUS	(1 << 8)
>  /* Entity queries */
>  #define UVC_CTRL_FLAG_ENTITY_GET_INFO	(1 << 9)
> +#define UVC_CTRL_FLAG_ENTITY_GET_CUR	(1 << 10)
>  
>  #define UVC_CTRL_FLAG_GET_RANGE \
>  	(UVC_CTRL_FLAG_GET_CUR | UVC_CTRL_FLAG_GET_MIN | \

-- 
Regards,

Laurent Pinchart
