Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E473AF4FA
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 20:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbhFUSZN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 14:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231803AbhFUSZJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 14:25:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4540C061574;
        Mon, 21 Jun 2021 11:22:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6725A5E17;
        Mon, 21 Jun 2021 20:22:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624299772;
        bh=B1hshC97pO+3kI/cTa6a+7piw5qtRoHK8S+RKnL0igM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C2mx3gUm+ombWTc95lt8BfRA+wZZLxWWqZZw9KFkDGW+Ye6txj68Lbo64VULEEuA3
         IDyhTBqBRX84YdkwnzoDTuriqXVjPF1DanNmtF7RlDhSumcs+R5NPikhh+SakMqA/t
         0o1SyqYn6APMM1/8KCPLDvtZwhUGb8nt6xhGQXUs=
Date:   Mon, 21 Jun 2021 21:22:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvc: limit max bandwidth for HDMI capture
Message-ID: <YNDY4iesZGF+7Cr0@pendragon.ideasonboard.com>
References: <b791d5874c83663505cbd4f74907ac38d00bb727.1612206534.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b791d5874c83663505cbd4f74907ac38d00bb727.1612206534.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thank you for the patch.

On Mon, Feb 01, 2021 at 08:08:59PM +0100, Mauro Carvalho Chehab wrote:
> This device:
>         534d:2109 MacroSilicon
> 
> Announces that it supports several frame intervals for
> their resolutions for MJPEG compression:
> 
>         VideoStreaming Interface Descriptor:
>         bLength                            46
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1920
>         wHeight                          1080
>         dwMinBitRate                   768000
>         dwMaxBitRate                196608000
>         dwMaxVideoFrameBufferSize     4147200
>         dwDefaultFrameInterval         166666
>         bFrameIntervalType                  5
>         dwFrameInterval( 0)            166666
>         dwFrameInterval( 1)            333333
>         dwFrameInterval( 2)            400000
>         dwFrameInterval( 3)            500000
>         dwFrameInterval( 4)           1000000
> 
> However, the highest frame interval (166666), which means 60 fps
> is not supported. For such resolution, the maximum interval
> is, instead 333333 (30 fps).

What happens if you try to select it ?

> The last format that supports such frame interval is 1280x720.
> 
> Add a quirk to estimate a raw bandwidth, by doing:
>         width * height * framerate
> E. g.:
>         1920 * 1080 * 30 = 62208000
> 
> if the bandwidth is greater than such threshold, get
> the next value from the dwFrameInterval.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 15 +++++++++++++++
>  drivers/media/usb/uvc/uvc_video.c  | 26 +++++++++++++++++++++++---
>  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
>  3 files changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 1abc122a0977..c83a329f6527 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2339,6 +2339,7 @@ static int uvc_probe(struct usb_interface *intf,
>  	dev->info = info ? info : &uvc_quirk_none;
>  	dev->quirks = uvc_quirks_param == -1
>  		    ? dev->info->quirks : uvc_quirks_param;
> +	dev->max_bandwidth = dev->info->max_bandwidth;
>  
>  	if (id->idVendor && id->idProduct)
>  		uvc_dbg(dev, PROBE, "Probing known UVC device %s (%04x:%04x)\n",
> @@ -2615,6 +2616,11 @@ static const struct uvc_device_info uvc_quirk_fix_bandwidth = {
>  	.quirks = UVC_QUIRK_FIX_BANDWIDTH,
>  };
>  
> +static const struct uvc_device_info uvc_quirk_fix_bw_622 = {
> +	.quirks = UVC_QUIRK_FIX_BANDWIDTH,
> +	.max_bandwidth = 62208000,
> +};
> +
>  static const struct uvc_device_info uvc_quirk_probe_def = {
>  	.quirks = UVC_QUIRK_PROBE_DEF,
>  };
> @@ -2830,6 +2836,15 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= (kernel_ulong_t)&uvc_quirk_fix_bandwidth },
> +	/* MacroSilicon HDMI capture */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x534d,
> +	  .idProduct		= 0x2109,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= (kernel_ulong_t)&uvc_quirk_fix_bw_622 },
>  	/* Genesys Logic USB 2.0 PC Camera */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index f2f565281e63..4afc1fbe0801 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -162,9 +162,29 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>  	if ((ctrl->dwMaxPayloadTransferSize & 0xffff0000) == 0xffff0000)
>  		ctrl->dwMaxPayloadTransferSize &= ~0xffff0000;
>  
> -	if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) &&
> -	    stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH &&
> -	    stream->intf->num_altsetting > 1) {
> +
> +	if (!(stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH))
> +		return;
> +
> +	/* Handle UVC_QUIRK_FIX_BANDWIDTH */
> +
> +	if (format->flags & UVC_FMT_FLAG_COMPRESSED &&
> +	    stream->dev->max_bandwidth && frame->bFrameIntervalType) {
> +		u32 bandwidth;
> +
> +		for (i = 0; i < frame->bFrameIntervalType - 1; ++i) {

Why - 1 ?

> +			bandwidth = frame->wWidth * frame->wHeight;
> +			bandwidth *= 10000000 / frame->dwFrameInterval[i];
> +
> +			if (bandwidth <= stream->dev->max_bandwidth)
> +				break;
> +		}
> +
> +		ctrl->dwFrameInterval = frame->dwFrameInterval[i];

This doesn't seem correct, you're selecting the first frame internal
below the bandwidth limit, even if the user explicitly requests a lower
frame rate.

> +		return;
> +	}
> +
> +	if (stream->intf->num_altsetting > 1) {

There's an incorrect change in logic here. Before the patch this code
would run only for !UVC_FMT_FLAG_COMPRESSED, while with the patch, it will
run if UVC_FMT_FLAG_COMPRESSED && !(stream->dev->max_bandwidth &&
frame->bFrameIntervalType).

>  		u32 interval;
>  		u32 bandwidth;
>  
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 97df5ecd66c9..b44e0cd4c826 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -658,6 +658,7 @@ static inline u32 uvc_urb_index(const struct uvc_urb *uvc_urb)
>  
>  struct uvc_device_info {
>  	u32	quirks;
> +	u32	max_bandwidth;
>  	u32	meta_format;
>  	u16	uvc_version;
>  };
> @@ -667,6 +668,7 @@ struct uvc_device {
>  	struct usb_interface *intf;
>  	unsigned long warnings;
>  	u32 quirks;
> +	u32 max_bandwidth;

uvc_device has a uvc_device_info pointer, there's no need to copy the
field here.

>  	int intfnum;
>  	char name[32];
>  

-- 
Regards,

Laurent Pinchart
