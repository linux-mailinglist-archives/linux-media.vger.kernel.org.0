Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0FC2C8A96
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 16:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbfJBOIa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 10:08:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34778 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbfJBOIa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 10:08:30 -0400
Received: from pendragon.ideasonboard.com (unknown [132.205.230.1])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C95F12BB;
        Wed,  2 Oct 2019 16:08:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570025308;
        bh=TJlBmVA72I0BlAu5M/rbWZ4bVZPDshWR/fw5Gbs/f1U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Us704h4NrqLGVnNWZH+jrSS7X4udG0Rcb7/Vpfj4eSAFdxYzrj3hD4br2h1kTjR0D
         6wD5fsqrPAcpWkLuVFdWRbbVibVGvn7zaS7znPjAD0MXeXwQx5qPiZJhMcwYDrYHpp
         hCH/ujuonW0nOvWMKc6fGpu4H/IBWfegp5y8pypM=
Date:   Wed, 2 Oct 2019 17:08:14 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sergey Zakharchenko <szakharchenko@digital-loggers.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Martin Bodo <martin@digital-loggers.com>,
        "Logan, Peter" <peter.logan@intel.com>,
        Auke Kok <auke-jan.h.kok@intel.com>,
        Sergey Zakharchenko <doublef.mobile@gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Add a quirk to force GEO GC6500
 Camera bits-per-pixel value
Message-ID: <20191002140814.GB5262@pendragon.ideasonboard.com>
References: <201910021929.ij7Rrmvk%lkp@intel.com>
 <20191002130102.97852-1-szakharchenko@digital-loggers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191002130102.97852-1-szakharchenko@digital-loggers.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey,

Thank you for the patch.

On Wed, Oct 02, 2019 at 01:01:02PM +0000, Sergey Zakharchenko wrote:
> This device does not function correctly in raw mode in kernel
> versions validating buffer sizes in bulk mode. It erroneously
> announces 16 bits per pixel instead of 12 for NV12 format, so it
> needs this quirk to fix computed frame size and avoid legitimate
> frames getting discarded.
> 
> Signed-off-by: Sergey Zakharchenko <szakharchenko@digital-loggers.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 27 +++++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 66ee168ddc7e..23f62456946d 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -446,10 +446,12 @@ static int uvc_parse_format(struct uvc_device *dev,
>  	struct usb_host_interface *alts = intf->cur_altsetting;
>  	struct uvc_format_desc *fmtdesc;
>  	struct uvc_frame *frame;
> +	const struct v4l2_format_info *info;
>  	const unsigned char *start = buffer;
>  	unsigned int width_multiplier = 1;
>  	unsigned int interval;
>  	unsigned int i, n;
> +	unsigned int div;
>  	u8 ftype;
>  
>  	format->type = buffer[2];
> @@ -497,6 +499,18 @@ static int uvc_parse_format(struct uvc_device *dev,
>  			}
>  		}
>  
> +		/* Some devices report bpp that doesn't match the format. */
> +		if (dev->quirks & UVC_QUIRK_FORCE_BPP) {
> +			info = v4l2_format_info(format->fcc);
> +			if (info) {
> +				div = info->hdiv * info->vdiv;
> +				n = info->bpp[0] * div;
> +				for (i = 1; i < info->comp_planes; i++)
> +					n += info->bpp[i];
> +				format->bpp = DIV_ROUND_UP(8 * n, div);
> +			}
> +		}

Do you think it would make sense to do this by default, without
requiring a quirk ? Or are there cases where this calculation would lead
to incorrect results while the bpp reported by the camera would be right
?

> +
>  		if (buffer[2] == UVC_VS_FORMAT_UNCOMPRESSED) {
>  			ftype = UVC_VS_FRAME_UNCOMPRESSED;
>  		} else {
> @@ -2384,6 +2398,10 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
>  	.quirks = UVC_QUIRK_FORCE_Y8,
>  };
>  
> +static const struct uvc_device_info uvc_quirk_force_bpp = {
> +	.quirks = UVC_QUIRK_FORCE_BPP,
> +};
> +
>  #define UVC_INFO_QUIRK(q) (kernel_ulong_t)&(struct uvc_device_info){.quirks = q}
>  #define UVC_INFO_META(m) (kernel_ulong_t)&(struct uvc_device_info) \
>  	{.meta_format = m}
> @@ -2869,6 +2887,15 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +	/* GEO Semiconductor GC6500 */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x29fe,
> +	  .idProduct		= 0x4d53,

Could you please keep the entries sorted by idVendor/idProduct ?

> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= (kernel_ulong_t)&uvc_quirk_force_bpp },

As this is the only device using this quirk, you can drop
uvc_quirk_force_bpp and use

	.driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_FORCE_BPP) },

>  	/* Generic USB Video Class */
>  	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
>  	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index c7c1baa90dea..24e3d8c647e7 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -198,6 +198,7 @@
>  #define UVC_QUIRK_RESTRICT_FRAME_RATE	0x00000200
>  #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT	0x00000400
>  #define UVC_QUIRK_FORCE_Y8		0x00000800
> +#define UVC_QUIRK_FORCE_BPP		0x00001000
>  
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED		0x00000001
> 
> base-commit: 20a438d53fd9d12a894161bc56cbeab7a9993c39
> prerequisite-patch-id: 521eb9602d395ea667eecc75cd2273b59cd3ed76

-- 
Regards,

Laurent Pinchart
