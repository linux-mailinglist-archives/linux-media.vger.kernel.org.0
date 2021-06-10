Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0558A3A313D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 18:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbhFJQr5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 12:47:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48054 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231409AbhFJQr4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 12:47:56 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D402B8D4;
        Thu, 10 Jun 2021 18:45:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623343559;
        bh=Dy9AkWJ+lxryWOuKwyfMEDCTmEOcXm1vEzTBB1ta4p4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vXTHT5fDBwRHyydVuiQR1CYa/CsQeLR4YtoXgAOFgJBWycd5eyqh2VU9+RKGIpq7o
         IpPRF+vj70HA8h9Q/fs6tA0vm2I1tyV5i9CKWGWatIdX3AhyGZfc9QXuAZwD2mj2j7
         Kn8wbyw1b/1NmcN8uDRygkkF6CBV2ckgVL0SI3dg=
Date:   Thu, 10 Jun 2021 19:45:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH v9 11/22] media: uvcvideo: Set unique vdev name based in
 type
Message-ID: <YMJBsysskTVelGLO@pendragon.ideasonboard.com>
References: <20210326095840.364424-1-ribalda@chromium.org>
 <20210326095840.364424-12-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210326095840.364424-12-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Fri, Mar 26, 2021 at 10:58:29AM +0100, Ricardo Ribalda wrote:
> All the entities must have a unique name. We can have a descriptive and
> unique name by appending the function and the entity->id.
> 
> This is even resilent to multi chain devices.
> 
> Fixes v4l2-compliance:
> Media Controller ioctls:
>                 fail: v4l2-test-media.cpp(205): v2_entity_names_set.find(key) != v2_entity_names_set.end()
>         test MEDIA_IOC_G_TOPOLOGY: FAIL
>                 fail: v4l2-test-media.cpp(394): num_data_links != num_links
> 	test MEDIA_IOC_ENUM_ENTITIES/LINKS: FAIL
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 35873cf2773d..76ab6acecbc9 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2163,6 +2163,7 @@ int uvc_register_video_device(struct uvc_device *dev,
>  			      const struct v4l2_ioctl_ops *ioctl_ops)
>  {
>  	int ret;
> +	const char *name;

Please swap the two variables.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	/* Initialize the video buffers queue. */
>  	ret = uvc_queue_init(queue, type, !uvc_no_drop_param);
> @@ -2190,16 +2191,20 @@ int uvc_register_video_device(struct uvc_device *dev,
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>  	default:
>  		vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> +		name = "Video Capture";
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>  		vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
> +		name = "Video Output";
>  		break;
>  	case V4L2_BUF_TYPE_META_CAPTURE:
>  		vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
> +		name = "Metadata";
>  		break;
>  	}
>  
> -	strscpy(vdev->name, dev->name, sizeof(vdev->name));
> +	snprintf(vdev->name, sizeof(vdev->name), "%s %u", name,
> +		 stream->header.bTerminalLink);
>  
>  	/*
>  	 * Set the driver data before calling video_register_device, otherwise

-- 
Regards,

Laurent Pinchart
