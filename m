Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0738124FF5
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 19:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbfLRSAU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 13:00:20 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35930 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbfLRSAT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 13:00:19 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6824B23;
        Wed, 18 Dec 2019 19:00:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576692018;
        bh=2pNViaI4WpvnYdYaJPn2gOobjSUeJxh1eSUdNzo/TI4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kSrNdrt2LwD83BCNms9qxJ5i5FWHG0r2Uw7XXcbUEuC8nbAV0OC4Qq6mMjbol8kSq
         8/64k0XjLqGypISnAUn6qzFtp1+QlWYQwCBCn2Kjk9G+n1OwVn7VCCqFV5jkyCalF/
         iM+VDq7BPltQegmd3kCYrercYWSPnUyfNODHYJD4=
Date:   Wed, 18 Dec 2019 20:00:06 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sergey Zakharchenko <szakharchenko@digital-loggers.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Martin Bodo <martin@digital-loggers.com>,
        "Logan, Peter" <peter.logan@intel.com>,
        Auke Kok <auke-jan.h.kok@intel.com>,
        Sergey Zakharchenko <doublef.mobile@gmail.com>
Subject: Re: [PATCH v3] media: uvcvideo: Add a quirk to force GEO GC6500
 Camera bits-per-pixel value
Message-ID: <20191218180006.GD17876@pendragon.ideasonboard.com>
References: <CADYCxoMAD_scAwGE89oULPgOWOjji6ADTXkG30oRwNLjPdAJrw@mail.gmail.com>
 <20191003093123.3407-1-szakharchenko@digital-loggers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191003093123.3407-1-szakharchenko@digital-loggers.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey,

I'm sorry for the late reply, this patch fell through the cracks :-S

On Thu, Oct 03, 2019 at 09:31:23AM +0000, Sergey Zakharchenko wrote:
> This device does not function correctly in raw mode in kernel
> versions validating buffer sizes in bulk mode. It erroneously
> announces 16 bits per pixel instead of 12 for NV12 format, so it
> needs this quirk to fix computed frame size and avoid legitimate
> frames getting discarded.
> 
> Signed-off-by: Sergey Zakharchenko <szakharchenko@digital-loggers.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 23 +++++++++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 66ee168ddc7e..d63db65ef8b2 100644
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

Both info and div can be declared here. The patch otherwise looks good
to me, so I'll make this modification when applying it, unless you would
prefer resending it.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I however had a closer look at how bpp is used, and I think it would
make sense to actually drop usage of this field. There's a usage in
uvc_video.c that is easy to replace (I will send a patch and CC you),
and I think the other two usages in uvc_driver.c and uvc_v4l2.c to
compute the image size and line size respectively should eventually be
replaced by calculation based on the format info.

> +			info = v4l2_format_info(format->fcc);
> +			if (info) {
> +				div = info->hdiv * info->vdiv;
> +				n = info->bpp[0] * div;
> +				for (i = 1; i < info->comp_planes; i++)
> +					n += info->bpp[i];
> +				format->bpp = DIV_ROUND_UP(8 * n, div);
> +			}
> +		}
> +
>  		if (buffer[2] == UVC_VS_FORMAT_UNCOMPRESSED) {
>  			ftype = UVC_VS_FRAME_UNCOMPRESSED;
>  		} else {
> @@ -2860,6 +2874,15 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= (kernel_ulong_t)&uvc_quirk_force_y8 },
> +	/* GEO Semiconductor GC6500 */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x29fe,
> +	  .idProduct		= 0x4d53,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_FORCE_BPP) },
>  	/* Intel RealSense D4M */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
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
