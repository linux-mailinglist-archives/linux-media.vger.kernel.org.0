Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCE42DF60E
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 17:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727663AbgLTQQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 11:16:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbgLTQQb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 11:16:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0905CC0613CF;
        Sun, 20 Dec 2020 08:15:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C26A593;
        Sun, 20 Dec 2020 17:15:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608480947;
        bh=VZLJPMjPtyGsIw6ilq6Yr9TNEQ0z+NX3LMCImjnLscc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YcrCH8A1jls8EPKYeV8GAPY4UwxotKCpPZUoHJZBnISXHhyP5TaOPMVcb/cR7Zemv
         CLuJ/QFeDkWqlYTnue/FzOMrLM04WtZG6dH7a67ckkEkHVvybsc/32ks0ekvPgPg8i
         ieojYrgP1uOoCuUMclvgM9dILLUicDPMdSax/1Z0=
Date:   Sun, 20 Dec 2020 18:15:39 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/9] media: uvcvideo: Entity defined get_info and
 get_cur
Message-ID: <X994q+x5mEAaLeZQ@pendragon.ideasonboard.com>
References: <20201215154439.69062-1-ribalda@chromium.org>
 <20201215154439.69062-5-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201215154439.69062-5-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

Maybe s/Entity defined/Allow entity-defined/ in the subject line ?

On Tue, Dec 15, 2020 at 04:44:34PM +0100, Ricardo Ribalda wrote:
> Allows controls to get their properties and current value
> from an entity-defined function instead of via a query to the USB
> device.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 22 ++++++++++++++++++----
>  drivers/media/usb/uvc/uvcvideo.h |  5 +++++
>  2 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 9f6174a10e73..531816762892 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -980,10 +980,20 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
>  		return -EACCES;
>  
>  	if (!ctrl->loaded) {
> -		ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, ctrl->entity->id,
> -				chain->dev->intfnum, ctrl->info.selector,
> +		if (ctrl->entity->get_cur) {
> +			ret = ctrl->entity->get_cur(chain->dev,
> +				ctrl->entity,
> +				ctrl->info.selector,
>  				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
>  				ctrl->info.size);
> +		} else {
> +			ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> +				ctrl->entity->id,
> +				chain->dev->intfnum,
> +				ctrl->info.selector,
> +				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> +				ctrl->info.size);

We could possibly set entity->get_cur by default to a function wrapping
uvc_query_ctrl() to avoid the condition here. This isn't mandatory for
now though, but I'll toy with it on top of the series to avoid storing
function pointers in a non-const structure.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		}
>  		if (ret < 0)
>  			return ret;
>  
> @@ -1687,8 +1697,12 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
>  	if (data == NULL)
>  		return -ENOMEM;
>  
> -	ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id, dev->intfnum,
> -			     info->selector, data, 1);
> +	if (ctrl->entity->get_info)
> +		ret = ctrl->entity->get_info(dev, ctrl->entity,
> +					     ctrl->info.selector, data);
> +	else
> +		ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id,
> +				     dev->intfnum, info->selector, data, 1);
>  	if (!ret)
>  		info->flags |= (data[0] & UVC_CONTROL_CAP_GET ?
>  				UVC_CTRL_FLAG_GET_CUR : 0)
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 00f985001c1d..ae464ba83f4f 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -353,6 +353,11 @@ struct uvc_entity {
>  	u8 bNrInPins;
>  	u8 *baSourceID;
>  
> +	int (*get_info)(struct uvc_device *dev, struct uvc_entity *entity,
> +			u8 cs, u8 *caps);
> +	int (*get_cur)(struct uvc_device *dev, struct uvc_entity *entity,
> +		       u8 cs, void *data, u16 size);
> +
>  	unsigned int ncontrols;
>  	struct uvc_control *controls;
>  };

-- 
Regards,

Laurent Pinchart
