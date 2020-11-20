Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36F062BB191
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 18:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728860AbgKTRjU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 12:39:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728820AbgKTRjU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 12:39:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 366E9C0613CF
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 09:39:20 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 324D3240;
        Fri, 20 Nov 2020 18:39:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605893957;
        bh=0epi1bPOjzu+ioEotkJMMOHNz2huDY7dgPzDI83Kuik=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=FuXQ7UZYlayFe1urf0oJgUvrw4sKT8ogey9f48vGe31tw2y6+/59sdtsw9rBlkhV3
         qWGzsxlZD9cZ3s+o5NX9Bs9ScZFFPYniRQvTL5ltLlu3+/8LEDu597IZzhwepdNoKt
         tMNpEaFm8J03zInYzCMxMvCrkDJyqTEtbepFBS0s=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] media: uvcvideo: Force UVC version to 1.0a for 1bcf:0b40
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
References: <20201120153055.16803-1-laurent.pinchart@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <7a698f20-1edc-f36c-99a9-3653851fbd7c@ideasonboard.com>
Date:   Fri, 20 Nov 2020 17:39:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120153055.16803-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 20/11/2020 15:30, Laurent Pinchart wrote:
> The Shenzhen Aoni Electronic Co.,Ltd 2K FHD camera reports a UVC 1.10
> version, but implements UVC 1.0a as shown by the UVC probe control being
> 26 bytes long. Force the UVC version for that device.
> 

I wonder if that was a typo someone made confusing 0xa with '10' some
point in the development?

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reported-by: Doncho Minkov <donchominkov@gmail.com>
> Tested-by: Doncho Minkov <donchominkov@gmail.com>

Painful to manually track these things, but I see the UVC driver already
handles lots of quirks like that.

So:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_driver.c | 17 +++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index ddb9eaa11be7..ae970f19bfca 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2274,6 +2274,12 @@ static int uvc_probe(struct usb_interface *intf,
>  			"linux-uvc-devel mailing list.\n");
>  	}
>  
> +	if (dev->info->uvc_version) {
> +		dev->uvc_version = dev->info->uvc_version;
> +		uvc_printk(KERN_INFO, "Forcing UVC version to %u.%02x\n",
> +			   dev->uvc_version >> 8, dev->uvc_version & 0xff);
> +	}
> +
>  	/* Register the V4L2 device. */
>  	if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
>  		goto error;
> @@ -2923,6 +2929,17 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
> +	/* Shenzhen Aoni Electronic Co.,Ltd 2K FHD camera */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x1bcf,
> +	  .idProduct		= 0x0b40,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
> +		.uvc_version = 0x010a,
> +	  } },
>  	/* SiGma Micro USB Web Camera */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index a3dfacf069c4..8ec9eca07f06 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -635,6 +635,7 @@ static inline u32 uvc_urb_index(const struct uvc_urb *uvc_urb)
>  struct uvc_device_info {
>  	u32	quirks;
>  	u32	meta_format;
> +	u16	uvc_version;
>  };
>  
>  struct uvc_device {
> 
