Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82CA2DF625
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 17:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgLTQxz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 11:53:55 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50564 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgLTQxz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 11:53:55 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02072593;
        Sun, 20 Dec 2020 17:53:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608483192;
        bh=W38Os3LeFsG0OCjw20jdhF30qk2KPMoK4s3jCwIZw8Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jCtHKn2w600zjivfRv/qAk4F9DF4ChswiAnMowBcR+a4MkNOolZ+mJ7lPCtTIEGm6
         haWUPqauOtyq23NFLeWFzxHvmt2WjtoQC5V2clnXnf1qvx/CS62ZaUG4IXP+i6ZqUA
         v2NyrY4z/gT2Xq5CmeMde84fTWxIKMPsWn1NWhKo=
Date:   Sun, 20 Dec 2020 18:53:04 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/9] media: uvcvideo: Allow external entities
Message-ID: <X9+BcPNyFs0oWxQN@pendragon.ideasonboard.com>
References: <20201215154439.69062-1-ribalda@chromium.org>
 <20201215154439.69062-3-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201215154439.69062-3-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Tue, Dec 15, 2020 at 04:44:32PM +0100, Ricardo Ribalda wrote:
> Increase the size of the id, to avoid collisions with external entities.

Could you expand the commit message a bit to explain what external
entities are ?

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 2 +-
>  drivers/media/usb/uvc/uvcvideo.h   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 4cdd65d252d9..9f4451a2e0a6 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1024,7 +1024,7 @@ static const u8 uvc_media_transport_input_guid[16] =
>  	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
>  static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
>  
> -static struct uvc_entity *uvc_alloc_entity(u16 type, u8 id,
> +static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
>  		unsigned int num_pads, unsigned int extra_size)
>  {
>  	struct uvc_entity *entity;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index df7bf2d104a3..00f985001c1d 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -301,7 +301,7 @@ struct uvc_entity {
>  					 * chain. */
>  	unsigned int flags;
>  
> -	u8 id;
> +	u16 id; /* 0-255: usb entity. 256-65535: external entities */

How about

	/*
	 * Entities exposed by the UVC device use IDs 0-255, extra entities
	 * implemented by the driver (such as the GPIO entity) use IDs 256 and
	 * up.
	 */

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	u16 type;
>  	char name[64];
>  	u8 guid[16];

-- 
Regards,

Laurent Pinchart
