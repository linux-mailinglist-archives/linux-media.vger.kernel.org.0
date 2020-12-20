Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C55EA2DF60A
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 17:10:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbgLTQJP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 11:09:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbgLTQJP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 11:09:15 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1B5C0613CF;
        Sun, 20 Dec 2020 08:08:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93202593;
        Sun, 20 Dec 2020 17:08:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608480512;
        bh=X9U+cgDYeATk7RDb1fplYd2bSepUY/ecs77jyCb5w8U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IKP3DZgm7CSzzIe6acTYRIDo/KLajo+tRFMbvVhTDUrOBMt2HaDsMcKKbaV+dts99
         wx5JrVkkdBrq6F6rJVf03eeRLECHiReNh5GReM5T+SDRu0JsVg9AxtJjZBV0xwP26H
         pgnB6hNUXkbM+TC5PRMiAltgt8LzRr/x+LylaRRE=
Date:   Sun, 20 Dec 2020 18:08:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/9] media: uvcvideo: Allow entities with no pads
Message-ID: <X992+VVFUzOXN5ir@pendragon.ideasonboard.com>
References: <20201215154439.69062-1-ribalda@chromium.org>
 <20201215154439.69062-4-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201215154439.69062-4-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Tue, Dec 15, 2020 at 04:44:33PM +0100, Ricardo Ribalda wrote:
> Avoid an underflow while calculating the number of inputs for entities
> with zero pads.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 9f4451a2e0a6..534629ecd60d 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1033,7 +1033,11 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
>  	unsigned int i;
>  
>  	extra_size = roundup(extra_size, sizeof(*entity->pads));
> -	num_inputs = (type & UVC_TERM_OUTPUT) ? num_pads : num_pads - 1;
> +	if (num_pads)
> +		num_inputs = (type & UVC_TERM_OUTPUT) ? num_pads :
> +								num_pads - 1;

This is a weird indentation. How about the following ?

		num_inputs = type & UVC_TERM_OUTPUT ? num_pads : num_pads - 1;

I can fix this when applying.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	else
> +		num_inputs = 0;
>  	size = sizeof(*entity) + extra_size + sizeof(*entity->pads) * num_pads
>  	     + num_inputs;
>  	entity = kzalloc(size, GFP_KERNEL);
> @@ -1066,7 +1070,7 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
>  
>  	for (i = 0; i < num_inputs; ++i)
>  		entity->pads[i].flags = MEDIA_PAD_FL_SINK;
> -	if (!UVC_ENTITY_IS_OTERM(entity))
> +	if (!UVC_ENTITY_IS_OTERM(entity) && num_pads)
>  		entity->pads[num_pads-1].flags = MEDIA_PAD_FL_SOURCE;
>  
>  	entity->bNrInPins = num_inputs;

-- 
Regards,

Laurent Pinchart
