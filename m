Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56497344EC7
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 19:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbhCVSpe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 14:45:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47060 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbhCVSp2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 14:45:28 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B5783F;
        Mon, 22 Mar 2021 19:45:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616438725;
        bh=znmOzNR8bkA1AVoq8a4pIwFCi+KPXukQq2bE6IIjndQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZDJFsWtCkhO0lTbgDY965Cz47XcYAnq/JUbTvmVOKTjzhOZwvRkyQvxymiXuK+dHB
         z/J1Tcc4s6KdFja3DLf9Tqsgcoq50aHF2bEW1Uu2CM5RPet0lJc7lgJfBgGd/iX2oC
         KNyvP0fQkHTZ0d6kBHUuI0+Vk12h5LeAE52aGtWc=
Date:   Mon, 22 Mar 2021 20:44:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Edgar Thier <info@edgarthier.net>
Subject: Re: [PATCHv2 3/3] uvc: don't set description in ENUM_FMT
Message-ID: <YFjlnFe7CTlXxh44@pendragon.ideasonboard.com>
References: <20210322154658.1409391-1-hverkuil-cisco@xs4all.nl>
 <20210322154658.1409391-4-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210322154658.1409391-4-hverkuil-cisco@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Mon, Mar 22, 2021 at 04:46:58PM +0100, Hans Verkuil wrote:
> Leave it to the V4L2 core to set the description. In fact, that was
> already the case for a long time since v4l_fill_fmtdesc() overwrites
> the description.
> 
> So remove all description strings from the driver.
> 
> uvc_ioctl_enum_fmt() was also cleaned up a bit since zeroed the
> v4l2_fmtdesc struct, when all fields after 'type' are already zeroed
> by the V4L2 core.

I have written a very similar patch (which I think I've shared with
Ricardo before). You can find it at

https://git.linuxtv.org/pinchartl/media.git/commit/?h=uvc/dev&id=16a7d79d67cdd06a448d8c4c20e270d1c21828b1

It has two additions compared to yours:

- Compacting the format array
- Keeping the debug message in uvc_parse_format() (I'd like if the
  message could use a nicer format name than printing the raw 4CC)

But it's missing the cleanup in uvc_ioctl_enum_fmt().

Would you have time to merge the two together and submit a v3 ? If so,
we can get it merged in v5.13.

> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 57 ------------------------------
>  drivers/media/usb/uvc/uvc_v4l2.c   |  9 -----
>  drivers/media/usb/uvc/uvcvideo.h   |  3 --
>  3 files changed, 69 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 7ecd26be6353..9bf066460699 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -41,202 +41,162 @@ unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
>  
>  static struct uvc_format_desc uvc_fmts[] = {
>  	{
> -		.name		= "YUV 4:2:2 (YUYV)",
>  		.guid		= UVC_GUID_FORMAT_YUY2,
>  		.fcc		= V4L2_PIX_FMT_YUYV,
>  	},
>  	{
> -		.name		= "YUV 4:2:2 (YUYV)",
>  		.guid		= UVC_GUID_FORMAT_YUY2_ISIGHT,
>  		.fcc		= V4L2_PIX_FMT_YUYV,
>  	},
>  	{
> -		.name		= "YUV 4:2:0 (NV12)",
>  		.guid		= UVC_GUID_FORMAT_NV12,
>  		.fcc		= V4L2_PIX_FMT_NV12,
>  	},
>  	{
> -		.name		= "MJPEG",
>  		.guid		= UVC_GUID_FORMAT_MJPEG,
>  		.fcc		= V4L2_PIX_FMT_MJPEG,
>  	},
>  	{
> -		.name		= "YVU 4:2:0 (YV12)",
>  		.guid		= UVC_GUID_FORMAT_YV12,
>  		.fcc		= V4L2_PIX_FMT_YVU420,
>  	},
>  	{
> -		.name		= "YUV 4:2:0 (I420)",
>  		.guid		= UVC_GUID_FORMAT_I420,
>  		.fcc		= V4L2_PIX_FMT_YUV420,
>  	},
>  	{
> -		.name		= "YUV 4:2:0 (M420)",
>  		.guid		= UVC_GUID_FORMAT_M420,
>  		.fcc		= V4L2_PIX_FMT_M420,
>  	},
>  	{
> -		.name		= "YUV 4:2:2 (UYVY)",
>  		.guid		= UVC_GUID_FORMAT_UYVY,
>  		.fcc		= V4L2_PIX_FMT_UYVY,
>  	},
>  	{
> -		.name		= "Greyscale 8-bit (Y800)",
>  		.guid		= UVC_GUID_FORMAT_Y800,
>  		.fcc		= V4L2_PIX_FMT_GREY,
>  	},
>  	{
> -		.name		= "Greyscale 8-bit (Y8  )",
>  		.guid		= UVC_GUID_FORMAT_Y8,
>  		.fcc		= V4L2_PIX_FMT_GREY,
>  	},
>  	{
> -		.name		= "Greyscale 8-bit (D3DFMT_L8)",
>  		.guid		= UVC_GUID_FORMAT_D3DFMT_L8,
>  		.fcc		= V4L2_PIX_FMT_GREY,
>  	},
>  	{
> -		.name		= "IR 8-bit (L8_IR)",
>  		.guid		= UVC_GUID_FORMAT_KSMEDIA_L8_IR,
>  		.fcc		= V4L2_PIX_FMT_GREY,
>  	},
>  	{
> -		.name		= "Greyscale 10-bit (Y10 )",
>  		.guid		= UVC_GUID_FORMAT_Y10,
>  		.fcc		= V4L2_PIX_FMT_Y10,
>  	},
>  	{
> -		.name		= "Greyscale 12-bit (Y12 )",
>  		.guid		= UVC_GUID_FORMAT_Y12,
>  		.fcc		= V4L2_PIX_FMT_Y12,
>  	},
>  	{
> -		.name		= "Greyscale 16-bit (Y16 )",
>  		.guid		= UVC_GUID_FORMAT_Y16,
>  		.fcc		= V4L2_PIX_FMT_Y16,
>  	},
>  	{
> -		.name		= "BGGR Bayer (BY8 )",
>  		.guid		= UVC_GUID_FORMAT_BY8,
>  		.fcc		= V4L2_PIX_FMT_SBGGR8,
>  	},
>  	{
> -		.name		= "BGGR Bayer (BA81)",
>  		.guid		= UVC_GUID_FORMAT_BA81,
>  		.fcc		= V4L2_PIX_FMT_SBGGR8,
>  	},
>  	{
> -		.name		= "GBRG Bayer (GBRG)",
>  		.guid		= UVC_GUID_FORMAT_GBRG,
>  		.fcc		= V4L2_PIX_FMT_SGBRG8,
>  	},
>  	{
> -		.name		= "GRBG Bayer (GRBG)",
>  		.guid		= UVC_GUID_FORMAT_GRBG,
>  		.fcc		= V4L2_PIX_FMT_SGRBG8,
>  	},
>  	{
> -		.name		= "RGGB Bayer (RGGB)",
>  		.guid		= UVC_GUID_FORMAT_RGGB,
>  		.fcc		= V4L2_PIX_FMT_SRGGB8,
>  	},
>  	{
> -		.name		= "RGB565",
>  		.guid		= UVC_GUID_FORMAT_RGBP,
>  		.fcc		= V4L2_PIX_FMT_RGB565,
>  	},
>  	{
> -		.name		= "BGR 8:8:8 (BGR3)",
>  		.guid		= UVC_GUID_FORMAT_BGR3,
>  		.fcc		= V4L2_PIX_FMT_BGR24,
>  	},
>  	{
> -		.name		= "H.264",
>  		.guid		= UVC_GUID_FORMAT_H264,
>  		.fcc		= V4L2_PIX_FMT_H264,
>  	},
>  	{
> -		.name		= "Greyscale 8 L/R (Y8I)",
>  		.guid		= UVC_GUID_FORMAT_Y8I,
>  		.fcc		= V4L2_PIX_FMT_Y8I,
>  	},
>  	{
> -		.name		= "Greyscale 12 L/R (Y12I)",
>  		.guid		= UVC_GUID_FORMAT_Y12I,
>  		.fcc		= V4L2_PIX_FMT_Y12I,
>  	},
>  	{
> -		.name		= "Depth data 16-bit (Z16)",
>  		.guid		= UVC_GUID_FORMAT_Z16,
>  		.fcc		= V4L2_PIX_FMT_Z16,
>  	},
>  	{
> -		.name		= "Bayer 10-bit (SRGGB10P)",
>  		.guid		= UVC_GUID_FORMAT_RW10,
>  		.fcc		= V4L2_PIX_FMT_SRGGB10P,
>  	},
>  	{
> -		.name		= "Bayer 12-bit linear packed (SBGGR12LP)",
>  		.guid		= UVC_GUID_FORMAT_BGCP,
>  		.fcc		= V4L2_PIX_FMT_SBGGR12LP,
>  	},
>  	{
> -		.name		= "Bayer 12-bit linear packed (SGBRG12LP)",
>  		.guid		= UVC_GUID_FORMAT_GBCP,
>  		.fcc		= V4L2_PIX_FMT_SGBRG12LP,
>  	},
>  	{
> -		.name		= "Bayer 12-bit linear packed (SRGGB12LP)",
>  		.guid		= UVC_GUID_FORMAT_RGCP,
>  		.fcc		= V4L2_PIX_FMT_SRGGB12LP,
>  	},
>  	{
> -		.name		= "Bayer 12-bit linear packed (SGRBG12LP)",
>  		.guid		= UVC_GUID_FORMAT_GRCP,
>  		.fcc		= V4L2_PIX_FMT_SGRBG12LP,
>  	},
>  	{
> -		.name		= "Bayer 16-bit (SBGGR16)",
>  		.guid		= UVC_GUID_FORMAT_BG16,
>  		.fcc		= V4L2_PIX_FMT_SBGGR16,
>  	},
>  	{
> -		.name		= "Bayer 16-bit (SGBRG16)",
>  		.guid		= UVC_GUID_FORMAT_GB16,
>  		.fcc		= V4L2_PIX_FMT_SGBRG16,
>  	},
>  	{
> -		.name		= "Bayer 16-bit (SRGGB16)",
>  		.guid		= UVC_GUID_FORMAT_RG16,
>  		.fcc		= V4L2_PIX_FMT_SRGGB16,
>  	},
>  	{
> -		.name		= "Bayer 16-bit (SGRBG16)",
>  		.guid		= UVC_GUID_FORMAT_GR16,
>  		.fcc		= V4L2_PIX_FMT_SGRBG16,
>  	},
>  	{
> -		.name		= "Depth data 16-bit (Z16)",
>  		.guid		= UVC_GUID_FORMAT_INVZ,
>  		.fcc		= V4L2_PIX_FMT_Z16,
>  	},
>  	{
> -		.name		= "Greyscale 10-bit (Y10 )",
>  		.guid		= UVC_GUID_FORMAT_INVI,
>  		.fcc		= V4L2_PIX_FMT_Y10,
>  	},
>  	{
> -		.name		= "IR:Depth 26-bit (INZI)",
>  		.guid		= UVC_GUID_FORMAT_INZI,
>  		.fcc		= V4L2_PIX_FMT_INZI,
>  	},
>  	{
> -		.name		= "4-bit Depth Confidence (Packed)",
>  		.guid		= UVC_GUID_FORMAT_CNF4,
>  		.fcc		= V4L2_PIX_FMT_CNF4,
>  	},
>  	{
> -		.name		= "HEVC",
>  		.guid		= UVC_GUID_FORMAT_HEVC,
>  		.fcc		= V4L2_PIX_FMT_HEVC,
>  	},
> @@ -551,14 +511,10 @@ static int uvc_parse_format(struct uvc_device *dev,
>  		fmtdesc = uvc_format_by_guid(&buffer[5]);
>  
>  		if (fmtdesc != NULL) {
> -			strscpy(format->name, fmtdesc->name,
> -				sizeof(format->name));
>  			format->fcc = fmtdesc->fcc;
>  		} else {
>  			dev_info(&streaming->intf->dev,
>  				 "Unknown video format %pUl\n", &buffer[5]);
> -			snprintf(format->name, sizeof(format->name), "%pUl\n",
> -				&buffer[5]);
>  			format->fcc = 0;
>  		}
>  
> @@ -569,8 +525,6 @@ static int uvc_parse_format(struct uvc_device *dev,
>  		 */
>  		if (dev->quirks & UVC_QUIRK_FORCE_Y8) {
>  			if (format->fcc == V4L2_PIX_FMT_YUYV) {
> -				strscpy(format->name, "Greyscale 8-bit (Y8  )",
> -					sizeof(format->name));
>  				format->fcc = V4L2_PIX_FMT_GREY;
>  				format->bpp = 8;
>  				width_multiplier = 2;
> @@ -611,7 +565,6 @@ static int uvc_parse_format(struct uvc_device *dev,
>  			return -EINVAL;
>  		}
>  
> -		strscpy(format->name, "MJPEG", sizeof(format->name));
>  		format->fcc = V4L2_PIX_FMT_MJPEG;
>  		format->flags = UVC_FMT_FLAG_COMPRESSED;
>  		format->bpp = 0;
> @@ -629,13 +582,8 @@ static int uvc_parse_format(struct uvc_device *dev,
>  
>  		switch (buffer[8] & 0x7f) {
>  		case 0:
> -			strscpy(format->name, "SD-DV", sizeof(format->name));
> -			break;
>  		case 1:
> -			strscpy(format->name, "SDL-DV", sizeof(format->name));
> -			break;
>  		case 2:
> -			strscpy(format->name, "HD-DV", sizeof(format->name));
>  			break;
>  		default:
>  			uvc_dbg(dev, DESCR,
> @@ -645,9 +593,6 @@ static int uvc_parse_format(struct uvc_device *dev,
>  			return -EINVAL;
>  		}
>  
> -		strlcat(format->name, buffer[8] & (1 << 7) ? " 60Hz" : " 50Hz",
> -			sizeof(format->name));
> -
>  		format->fcc = V4L2_PIX_FMT_DV;
>  		format->flags = UVC_FMT_FLAG_COMPRESSED | UVC_FMT_FLAG_STREAM;
>  		format->bpp = 0;
> @@ -674,8 +619,6 @@ static int uvc_parse_format(struct uvc_device *dev,
>  		return -EINVAL;
>  	}
>  
> -	uvc_dbg(dev, DESCR, "Found format %s\n", format->name);
> -
>  	buflen -= buffer[0];
>  	buffer += buffer[0];
>  
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 252136cc885c..1cfd081c2004 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -632,22 +632,13 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
>  			      struct v4l2_fmtdesc *fmt)
>  {
>  	struct uvc_format *format;
> -	enum v4l2_buf_type type = fmt->type;
> -	u32 index = fmt->index;
>  
>  	if (fmt->type != stream->type || fmt->index >= stream->nformats)
>  		return -EINVAL;
>  
> -	memset(fmt, 0, sizeof(*fmt));
> -	fmt->index = index;
> -	fmt->type = type;
> -
>  	format = &stream->format[fmt->index];
> -	fmt->flags = 0;
>  	if (format->flags & UVC_FMT_FLAG_COMPRESSED)
>  		fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
> -	strscpy(fmt->description, format->name, sizeof(fmt->description));
> -	fmt->description[sizeof(fmt->description) - 1] = 0;
>  	fmt->pixelformat = format->fcc;
>  	return 0;
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 51cda67946d5..8fff8b93def2 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -292,7 +292,6 @@ struct uvc_control {
>  };
>  
>  struct uvc_format_desc {
> -	char *name;
>  	u8 guid[16];
>  	u32 fcc;
>  };
> @@ -416,8 +415,6 @@ struct uvc_format {
>  	u32 fcc;
>  	u32 flags;
>  
> -	char name[32];
> -
>  	unsigned int nframes;
>  	struct uvc_frame *frame;
>  };

-- 
Regards,

Laurent Pinchart
