Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6934264C616
	for <lists+linux-media@lfdr.de>; Wed, 14 Dec 2022 10:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237737AbiLNJiT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 04:38:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237342AbiLNJiN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 04:38:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2AEBB493;
        Wed, 14 Dec 2022 01:38:09 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EEE549C;
        Wed, 14 Dec 2022 10:38:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671010687;
        bh=4x1w5h8K2lseKhTugtkDjYHjrVk9/RdUrRw0x6gArqo=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=E9quzEQ2iLRbglFGKPX3jaN/CDrqvgXyfyAAjgoLVzhLoC6i/XdA26fvTbBnOhcCc
         QW5xzFx10reImypsErSHXaINjlxANrJHcjmSatGfLqTgUzLBS1wR7m0sNlTI+7VIRw
         ERx/jQ+JlJzL6Z309+OcSlc7mHhCEAoh6Ss5XK6w=
Message-ID: <6286e69b-4882-c75a-d3bd-44c88f421bfc@ideasonboard.com>
Date:   Wed, 14 Dec 2022 09:38:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        laurent.pinchart@ideasonboard.com
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de
References: <20221212194716.2995569-1-m.grzeschik@pengutronix.de>
 <20221212194716.2995569-6-m.grzeschik@pengutronix.de>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 5/5] usb: uvc: use v4l2_fill_fmtdesc instead of open coded
 format name
In-Reply-To: <20221212194716.2995569-6-m.grzeschik@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael

On 12/12/2022 19:47, Michael Grzeschik wrote:
> Since we have the helper function v4l2_fill_fmtdesc, we can use this to
> get the corresponding descriptive string for the pixelformat and set the
> compressed flag. This patch is removing the redundant name field in
> uvc_format_desc and makes use of v4l2_fill_fmtdesc instead.
>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---


The only thing that makes me wary about this one is that it will change 
the format names reported by the uvcvideo driver to userspace, since 
those returned by v4l2_fill_fmtdesc() are not the same as the ones being 
dropped from uvc_format_desc[]...are we sure that's not going to matter?

>   drivers/media/common/uvc.c             | 37 --------------------------
>   drivers/media/usb/uvc/uvc_driver.c     |  8 +++++-
>   drivers/usb/gadget/function/uvc_v4l2.c |  6 +----
>   include/linux/usb/uvc.h                |  1 -
>   4 files changed, 8 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> index a6787f1999becd..02de0dcad0f088 100644
> --- a/drivers/media/common/uvc.c
> +++ b/drivers/media/common/uvc.c
> @@ -11,187 +11,150 @@
>   
>   static const struct uvc_format_desc uvc_fmts[] = {
>   	{
> -		.name		= "YUV 4:2:2 (YUYV)",
>   		.guid		= UVC_GUID_FORMAT_YUY2,
>   		.fcc		= V4L2_PIX_FMT_YUYV,
>   	},
>   	{
> -		.name		= "YUV 4:2:2 (YUYV)",
>   		.guid		= UVC_GUID_FORMAT_YUY2_ISIGHT,
>   		.fcc		= V4L2_PIX_FMT_YUYV,
>   	},
>   	{
> -		.name		= "YUV 4:2:0 (NV12)",
>   		.guid		= UVC_GUID_FORMAT_NV12,
>   		.fcc		= V4L2_PIX_FMT_NV12,
>   	},
>   	{
> -		.name		= "MJPEG",
>   		.guid		= UVC_GUID_FORMAT_MJPEG,
>   		.fcc		= V4L2_PIX_FMT_MJPEG,
>   	},
>   	{
> -		.name		= "YVU 4:2:0 (YV12)",
>   		.guid		= UVC_GUID_FORMAT_YV12,
>   		.fcc		= V4L2_PIX_FMT_YVU420,
>   	},
>   	{
> -		.name		= "YUV 4:2:0 (I420)",
>   		.guid		= UVC_GUID_FORMAT_I420,
>   		.fcc		= V4L2_PIX_FMT_YUV420,
>   	},
>   	{
> -		.name		= "YUV 4:2:0 (M420)",
>   		.guid		= UVC_GUID_FORMAT_M420,
>   		.fcc		= V4L2_PIX_FMT_M420,
>   	},
>   	{
> -		.name		= "YUV 4:2:2 (UYVY)",
>   		.guid		= UVC_GUID_FORMAT_UYVY,
>   		.fcc		= V4L2_PIX_FMT_UYVY,
>   	},
>   	{
> -		.name		= "Greyscale 8-bit (Y800)",
>   		.guid		= UVC_GUID_FORMAT_Y800,
>   		.fcc		= V4L2_PIX_FMT_GREY,
>   	},
>   	{
> -		.name		= "Greyscale 8-bit (Y8  )",
>   		.guid		= UVC_GUID_FORMAT_Y8,
>   		.fcc		= V4L2_PIX_FMT_GREY,
>   	},
>   	{
> -		.name		= "Greyscale 8-bit (D3DFMT_L8)",
>   		.guid		= UVC_GUID_FORMAT_D3DFMT_L8,
>   		.fcc		= V4L2_PIX_FMT_GREY,
>   	},
>   	{
> -		.name		= "IR 8-bit (L8_IR)",
>   		.guid		= UVC_GUID_FORMAT_KSMEDIA_L8_IR,
>   		.fcc		= V4L2_PIX_FMT_GREY,
>   	},
>   	{
> -		.name		= "Greyscale 10-bit (Y10 )",
>   		.guid		= UVC_GUID_FORMAT_Y10,
>   		.fcc		= V4L2_PIX_FMT_Y10,
>   	},
>   	{
> -		.name		= "Greyscale 12-bit (Y12 )",
>   		.guid		= UVC_GUID_FORMAT_Y12,
>   		.fcc		= V4L2_PIX_FMT_Y12,
>   	},
>   	{
> -		.name		= "Greyscale 16-bit (Y16 )",
>   		.guid		= UVC_GUID_FORMAT_Y16,
>   		.fcc		= V4L2_PIX_FMT_Y16,
>   	},
>   	{
> -		.name		= "BGGR Bayer (BY8 )",
>   		.guid		= UVC_GUID_FORMAT_BY8,
>   		.fcc		= V4L2_PIX_FMT_SBGGR8,
>   	},
>   	{
> -		.name		= "BGGR Bayer (BA81)",
>   		.guid		= UVC_GUID_FORMAT_BA81,
>   		.fcc		= V4L2_PIX_FMT_SBGGR8,
>   	},
>   	{
> -		.name		= "GBRG Bayer (GBRG)",
>   		.guid		= UVC_GUID_FORMAT_GBRG,
>   		.fcc		= V4L2_PIX_FMT_SGBRG8,
>   	},
>   	{
> -		.name		= "GRBG Bayer (GRBG)",
>   		.guid		= UVC_GUID_FORMAT_GRBG,
>   		.fcc		= V4L2_PIX_FMT_SGRBG8,
>   	},
>   	{
> -		.name		= "RGGB Bayer (RGGB)",
>   		.guid		= UVC_GUID_FORMAT_RGGB,
>   		.fcc		= V4L2_PIX_FMT_SRGGB8,
>   	},
>   	{
> -		.name		= "RGB565",
>   		.guid		= UVC_GUID_FORMAT_RGBP,
>   		.fcc		= V4L2_PIX_FMT_RGB565,
>   	},
>   	{
> -		.name		= "BGR 8:8:8 (BGR3)",
>   		.guid		= UVC_GUID_FORMAT_BGR3,
>   		.fcc		= V4L2_PIX_FMT_BGR24,
>   	},
>   	{
> -		.name		= "H.264",
>   		.guid		= UVC_GUID_FORMAT_H264,
>   		.fcc		= V4L2_PIX_FMT_H264,
>   	},
>   	{
> -		.name		= "H.265",
>   		.guid		= UVC_GUID_FORMAT_H265,
>   		.fcc		= V4L2_PIX_FMT_HEVC,
>   	},
>   	{
> -		.name		= "Greyscale 8 L/R (Y8I)",
>   		.guid		= UVC_GUID_FORMAT_Y8I,
>   		.fcc		= V4L2_PIX_FMT_Y8I,
>   	},
>   	{
> -		.name		= "Greyscale 12 L/R (Y12I)",
>   		.guid		= UVC_GUID_FORMAT_Y12I,
>   		.fcc		= V4L2_PIX_FMT_Y12I,
>   	},
>   	{
> -		.name		= "Depth data 16-bit (Z16)",
>   		.guid		= UVC_GUID_FORMAT_Z16,
>   		.fcc		= V4L2_PIX_FMT_Z16,
>   	},
>   	{
> -		.name		= "Bayer 10-bit (SRGGB10P)",
>   		.guid		= UVC_GUID_FORMAT_RW10,
>   		.fcc		= V4L2_PIX_FMT_SRGGB10P,
>   	},
>   	{
> -		.name		= "Bayer 16-bit (SBGGR16)",
>   		.guid		= UVC_GUID_FORMAT_BG16,
>   		.fcc		= V4L2_PIX_FMT_SBGGR16,
>   	},
>   	{
> -		.name		= "Bayer 16-bit (SGBRG16)",
>   		.guid		= UVC_GUID_FORMAT_GB16,
>   		.fcc		= V4L2_PIX_FMT_SGBRG16,
>   	},
>   	{
> -		.name		= "Bayer 16-bit (SRGGB16)",
>   		.guid		= UVC_GUID_FORMAT_RG16,
>   		.fcc		= V4L2_PIX_FMT_SRGGB16,
>   	},
>   	{
> -		.name		= "Bayer 16-bit (SGRBG16)",
>   		.guid		= UVC_GUID_FORMAT_GR16,
>   		.fcc		= V4L2_PIX_FMT_SGRBG16,
>   	},
>   	{
> -		.name		= "Depth data 16-bit (Z16)",
>   		.guid		= UVC_GUID_FORMAT_INVZ,
>   		.fcc		= V4L2_PIX_FMT_Z16,
>   	},
>   	{
> -		.name		= "Greyscale 10-bit (Y10 )",
>   		.guid		= UVC_GUID_FORMAT_INVI,
>   		.fcc		= V4L2_PIX_FMT_Y10,
>   	},
>   	{
> -		.name		= "IR:Depth 26-bit (INZI)",
>   		.guid		= UVC_GUID_FORMAT_INZI,
>   		.fcc		= V4L2_PIX_FMT_INZI,
>   	},
>   	{
> -		.name		= "4-bit Depth Confidence (Packed)",
>   		.guid		= UVC_GUID_FORMAT_CNF4,
>   		.fcc		= V4L2_PIX_FMT_CNF4,
>   	},
>   	{
> -		.name		= "HEVC",
>   		.guid		= UVC_GUID_FORMAT_HEVC,
>   		.fcc		= V4L2_PIX_FMT_HEVC,
>   	},
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 12b6ad0966d94a..af92e730bde7c7 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -251,7 +251,13 @@ static int uvc_parse_format(struct uvc_device *dev,
>   		fmtdesc = uvc_format_by_guid(&buffer[5]);
>   
>   		if (fmtdesc != NULL) {
> -			strscpy(format->name, fmtdesc->name,
> +			struct v4l2_fmtdesc fmt;
> +
> +			fmt.pixelformat = fmtdesc->fcc;
> +
> +			v4l2_fill_fmtdesc(&fmt);
> +
> +			strscpy(format->name, fmt.description,
>   				sizeof(format->name));
>   			format->fcc = fmtdesc->fcc;
>   		} else {
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index 21e573e628f4e7..6e46fa1695f212 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -374,14 +374,10 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>   	if (!uformat)
>   		return -EINVAL;
>   
> -	if (uformat->type != UVCG_UNCOMPRESSED)
> -		f->flags |= V4L2_FMT_FLAG_COMPRESSED;
> -
>   	fmtdesc = to_uvc_format(uformat);
>   	f->pixelformat = fmtdesc->fcc;
>   
> -	strscpy(f->description, fmtdesc->name, sizeof(f->description));
> -	f->description[strlen(fmtdesc->name) - 1] = 0;
> +	v4l2_fill_fmtdesc(f);
>   
>   	return 0;
>   }
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> index 227a03f252a5c0..e407a7b8a91c70 100644
> --- a/include/linux/usb/uvc.h
> +++ b/include/linux/usb/uvc.h
> @@ -146,7 +146,6 @@
>   	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>   
>   struct uvc_format_desc {
> -	char *name;
>   	u8 guid[16];
>   	u32 fcc;
>   };
