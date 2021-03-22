Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039B43445C4
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 14:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbhCVNcN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 09:32:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42462 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbhCVNcI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 09:32:08 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1D37AD6;
        Mon, 22 Mar 2021 14:32:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616419927;
        bh=zw2TxXK6Nk7kTEeju7G3Ueoyf8aLmNofVcI0UxWkOsc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CkGZ7ixc9Kbr5eZ9c8GS26Cy9dRZj/RE+hCmjQ/hLI38SJDYw8cR9hj311CrOHu5j
         inC0I8Q+kqAtlPVw/gAqvNijiQJ2XaJuyFnpUbvuh6B0mxOJIQTX76j5P8sEVX+YS9
         q6Odib6kxSiUBXLKUuNO7IweNQ7LG7P1cJNgRemk=
Date:   Mon, 22 Mar 2021 15:31:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Edgar Thier <info@edgarthier.net>
Cc:     sakari.ailus@iki.fi,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] uvc: Add 12-bit raw bayer linear packed formats
Message-ID: <YFicLYz76uuW6gzE@pendragon.ideasonboard.com>
References: <20190708060225.5172-1-info@edgarthier.net>
 <20190708060431.5249-1-info@edgarthier.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190708060431.5249-1-info@edgarthier.net>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Edgar,

Thank you for the patch.

On Mon, Jul 08, 2019 at 08:04:31AM +0200, Edgar Thier wrote:
> These formats are compressed 12-bit raw bayer formats with four different
> pixel orders. The pixel follow one another without any padding,
> thus are packed in a 'linear' fashion.
> 
> Signed-off-by: Edgar Thier <info@edgarthier.net>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 21 ++++++++++++++++++++-
>  drivers/media/usb/uvc/uvcvideo.h   | 12 ++++++++++++
>  2 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 10cfe8e51626..d12298d18406 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -179,6 +179,26 @@ static struct uvc_format_desc uvc_fmts[] = {
>  		.guid		= UVC_GUID_FORMAT_RW10,
>  		.fcc		= V4L2_PIX_FMT_SRGGB10P,
>  	},
> +	{
> +		.name		= "Bayer 12-bit linear packed (SBGGR12LP)",
> +		.guid		= UVC_GUID_FORMAT_BGCP,
> +		.fcc		= V4L2_PIX_FMT_SBGGR12LP,
> +	},
> +	{
> +		.name		= "Bayer 12-bit linear packed (SGBRG12LP)",
> +		.guid		= UVC_GUID_FORMAT_GBCP,
> +		.fcc		= V4L2_PIX_FMT_SGBRG12LP,
> +	},
> +	{
> +		.name		= "Bayer 12-bit linear packed (SRGGB12LP)",
> +		.guid		= UVC_GUID_FORMAT_RGCP,
> +		.fcc		= V4L2_PIX_FMT_SRGGB12LP,
> +	},
> +	{
> +		.name		= "Bayer 12-bit linear packed (SGRBG12LP)",
> +		.guid		= UVC_GUID_FORMAT_GRCP,
> +		.fcc		= V4L2_PIX_FMT_SGRBG12LP,
> +	},
>  	{
>  		.name		= "Bayer 16-bit (SBGGR16)",
>  		.guid		= UVC_GUID_FORMAT_BG16,
> @@ -2924,4 +2944,3 @@ MODULE_AUTHOR(DRIVER_AUTHOR);
>  MODULE_DESCRIPTION(DRIVER_DESC);
>  MODULE_LICENSE("GPL");
>  MODULE_VERSION(DRIVER_VERSION);
> -

Unrelated change, but it's a good one, and not worth a separate patch.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index c7c1baa90dea..f5be00fb9a73 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -108,6 +108,18 @@
>  #define UVC_GUID_FORMAT_RGGB \
>  	{ 'R',  'G',  'G',  'B', 0x00, 0x00, 0x10, 0x00, \
>  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> +#define UVC_GUID_FORMAT_BGCP \
> +	{ 'B',  'G',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
> +	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> +#define UVC_GUID_FORMAT_GBCP \
> +	{ 'G',  'B',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
> +	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> +#define UVC_GUID_FORMAT_RGCP \
> +	{ 'R',  'G',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
> +	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> +#define UVC_GUID_FORMAT_GRCP \
> +	{ 'G',  'R',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
> +	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>  #define UVC_GUID_FORMAT_BG16 \
>  	{ 'B',  'G',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
>  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}

-- 
Regards,

Laurent Pinchart
