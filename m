Return-Path: <linux-media+bounces-15358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ACF93D104
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 12:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 873CD1C20D64
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 10:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF293178CC8;
	Fri, 26 Jul 2024 10:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nmIXf6kK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B38A2B9C4;
	Fri, 26 Jul 2024 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721989285; cv=none; b=Z3Mac/tQ2s9qLlXTUlZcukLfgfUEcmTbRtM+jsGoVrKbCWZ0xu28AcUN+r6p7X2KpsyHxFCcgh8ZV20OvFSD2HEyvx5bH6/7HdcxpL/LgHsQvYOCcMMjRNoqzbh0e2yIUUJ9qp6rnr1V39cWfI/T6Zn4hftaSMHUjNzjmk+KQC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721989285; c=relaxed/simple;
	bh=bWot52Jg2oYDZltORl2de2g466YnDLqgolMN8hyid3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLElLoi5mwmSGLX903T8Q844ctv3gstxsbAkw5jTmfpIx8xtEERhk9EkvykpV+1gYIuMmKQhlENaSWST32+ZxEPZyL+bXLEQnjEX3ItKXOLsLTAIcCiL0GHQxPNd3s9U5jyCAl9qU/RyM7F4T899YVIBANjZifUrQCMPcze2Xp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nmIXf6kK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFE4F83F;
	Fri, 26 Jul 2024 12:20:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721989231;
	bh=bWot52Jg2oYDZltORl2de2g466YnDLqgolMN8hyid3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nmIXf6kKinySmEB9yYmsmKm1I1crdB1iu4uwB9mC3WP+fnFuGw/WKojEEUVatv0Nx
	 KbGiKPG4W2IKmF6+cvGL+Xes7fWSuvLanh8t3Ct81FzMDWrANHMxJxn3iPMjs7slce
	 3lcOK5rAj79tcK+YsSK3QhgGBGmu5jGAVrDqCaY4=
Date: Fri, 26 Jul 2024 13:20:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: chenchangcheng <ccc194101@163.com>
Cc: wangyongjun@kylinos.cn, zhoulei@kylinos.cn, liuyihu@kylinos.cn,
	lizhenneng@kylinos.cn, lihongtao@kylinos.cn, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>
Subject: Re: [PATCH] media: uvcvideo: Block AlcorMicroCorp camera from
 reporting key events.
Message-ID: <20240726102057.GA28621@pendragon.ideasonboard.com>
References: <20240723082955.2911825-1-ccc194101@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240723082955.2911825-1-ccc194101@163.com>

Hi Chen Changcheng,

Thank you for the patch.

On Tue, Jul 23, 2024 at 04:29:55PM +0800, chenchangcheng wrote:
> From: chenchangcheng <chenchangcheng@kylinos.cn>
> 
> When opening the camera, it will send an interrupt transmission
> to the host, which is a request initiated by VS to press a button.
> But the camera does't have a physical button to send interrupt
> transmission.

Could you please send the output of `lsusb -v -d 1dfc:8513` (running as
root if possible) ?

> This button will cause the upper layer to actively turn off the camera.
> Ultimately, it resulted in the failure to open the camera.

That sounds like a weird behaviour. What upper layers are doing this ?

> Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>
> Change-Id: Ie86c311569e8bdc891dc8af12febf6e8643e082f
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
>  drivers/media/usb/uvc/uvc_status.c | 6 +++++-
>  drivers/media/usb/uvc/uvcvideo.h   | 1 +
>  3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 07128e0..0bdd23b 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2891,6 +2891,15 @@ static const struct usb_device_id uvc_ids[] = {
>            .bInterfaceClass      = USB_CLASS_VENDOR_SPEC,
>            .bInterfaceSubClass   = 1,
>            .bInterfaceProtocol   = 0 },
> +	/*  AlcorMicroCorp Nantian Camera 8513 */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x1dfc,
> +	  .idProduct		= 0x8513,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_IGNORE_STATUS_EVENT) },
>  	/* Generic USB Video Class */
>  	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
>  	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index 2bdb0ff..17d68e8 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -99,8 +99,12 @@ static void uvc_event_streaming(struct uvc_device *dev,
>  	}
>  
>  	if (status->bEvent == 0) {
> -		if (len < 4)
> +		if (len < 4 || (dev->quirks & UVC_QUIRK_IGNORE_STATUS_EVENT)) {
> +			uvc_trace(UVC_TRACE_STATUS, "Ignore button (intf %u) %s\n",
> +			  status->bOriginator,
> +			  status->bValue[0] ? "pressed" : "released");
>  			return;
> +		}
>  		uvc_trace(UVC_TRACE_STATUS, "Button (intf %u) %s len %d\n",
>  			  status->bOriginator,
>  			  status->bValue[0] ? "pressed" : "released", len);
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index c7c1baa..8ac3c28 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -198,6 +198,7 @@
>  #define UVC_QUIRK_RESTRICT_FRAME_RATE	0x00000200
>  #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT	0x00000400
>  #define UVC_QUIRK_FORCE_Y8		0x00000800
> +#define UVC_QUIRK_IGNORE_STATUS_EVENT	0x00001000
>  
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED		0x00000001

-- 
Regards,

Laurent Pinchart

