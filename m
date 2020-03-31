Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22CFE1997C1
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 15:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730933AbgCaNpi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 09:45:38 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:59379 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730366AbgCaNph (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 09:45:37 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id JHCuj8uTSfHuvJHCxjBNHM; Tue, 31 Mar 2020 15:45:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585662335; bh=L8G0g1BEjLXImClIKj5BVdCBZXNAMWS1weTdk5nFDBc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Mfmjfh8ANfj3dToZANXFH427CbfhedetHGmu1gW0000P4mXtNMMEHzasTyLuc1gSr
         M8/FzFimRNwlHvowTNauoJlYw/ZMr871T+HzHswC/ttdAhTZyumq5KraP3pFHr0knh
         ozgl1W84oKg1OtrORD13PDb3C1JzdSjBptT00XOBXQmqlQCWZnJsf63wHJsGgkmfsN
         Rs6qid2qpGCzX29UI52MQCgGVAo0DxjkXM4Mm4R/dA9v0k9LPsfHLR6EDs+eD7QHn/
         1jwYyNKtuKFlU0KnzrZN/Gr7mOjAaasznvIJq6iGy5TYCzKaDbGYmIH5cjzaRu/lVM
         ibb2a5uPB6uQQ==
Subject: Re: [PATCH v4 06/11] media: imx: utils: Make imx_media_pixfmt handle
 variable number of codes
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20200329205920.20118-1-slongerbeam@gmail.com>
 <20200329205920.20118-7-slongerbeam@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <911bd2c6-e409-07e9-8521-b1febd6bb58e@xs4all.nl>
Date:   Tue, 31 Mar 2020 15:45:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200329205920.20118-7-slongerbeam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLSpR9t8oDOA0pa7H6MYSY4VR79avBvi+AT+Iy2ZimyWfEIoiU3TjLs2FUhDmG27J4qqn531DVPQXKWcrSzlEVMaFPM8gwO5Bd5jMQx9J+L1BIjjBDW8
 Mq5C+XGEH2TNtkyWvEktpllOqGt8eM+D6QsXgbiC7EHidleXqm+5CQ9PqCW5YcYJzSDv7RcO/Yc1PPETJL+mfFXz3ZtM69E11fbfcNayZdBQjMYZepTsZDZm
 lsYuFG1MPMGXOMt1lVZDP+dSDjbJEXQ8Nfkpj6OV5EuFv286fqJVfHHRLgZ4s0F3uCvII40NWZXjL1MZZhYk+g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/29/20 10:59 PM, Steve Longerbeam wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> The imx_media_pixfmt structures includes a codes member that stores
> media bus codes as a fixed array of 4 integers. The functions dealing
> with the imx_media_pixfmt structures assume that the array of codes is
> terminated by a 0 elements. This mechanism is fragile, as demonstrated

elements -> element

> by several instances of the structure contained 4 non-zero codes.

contained -> that contained

> 
> Fix this by turning the array into a pointer, and providing an
> IMX_BUS_FMTS macro to initialize the codes member with a guaranteed 0
> element at the end.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> [Fix a NULL deref when derefencing a NULL cc->codes on return from
>  several calls to imx_media_find_format()]
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/staging/media/imx/imx-media-capture.c |  4 +-
>  drivers/staging/media/imx/imx-media-utils.c   | 88 +++++++++++--------
>  drivers/staging/media/imx/imx-media.h         |  2 +-
>  3 files changed, 53 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index d60b49ec4fa4..650c53289f6b 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -95,7 +95,7 @@ static int capture_enum_framesizes(struct file *file, void *fh,
>  	if (!cc)
>  		return -EINVAL;
>  
> -	fse.code = cc->codes[0];
> +	fse.code = cc->codes ? cc->codes[0] : 0;

I'm wondering: wouldn't it be better to have a format without codes point to
an empty code list containing just 0? That would avoid all the cc->codes checks,
which are a bit fragile IMHO.

It would be nice in that case if there is a WARN_ON or something during probe
time that checks that the codes field in pixel_formats[] is never NULL.

As an aside: 'cc'? The struct is called imx_media_pixfmt, so I don't offhand see
what 'cc' stands for.

Regards,

	Hans

>  
>  	ret = v4l2_subdev_call(priv->src_sd, pad, enum_frame_size, NULL, &fse);
>  	if (ret)
> @@ -137,7 +137,7 @@ static int capture_enum_frameintervals(struct file *file, void *fh,
>  	if (!cc)
>  		return -EINVAL;
>  
> -	fie.code = cc->codes[0];
> +	fie.code = cc->codes ? cc->codes[0] : 0;
>  
>  	ret = v4l2_subdev_call(priv->src_sd, pad, enum_frame_interval,
>  			       NULL, &fie);
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index 981a8b540a3c..da010eef0ae6 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -7,6 +7,12 @@
>  #include <linux/module.h>
>  #include "imx-media.h"
>  
> +#define IMX_BUS_FMTS(fmts...)	\
> +	(const u32[]) {		\
> +		fmts,		\
> +		0		\
> +	}
> +
>  /*
>   * List of supported pixel formats for the subdevs.
>   */
> @@ -14,18 +20,18 @@ static const struct imx_media_pixfmt pixel_formats[] = {
>  	/*** YUV formats start here ***/
>  	{
>  		.fourcc	= V4L2_PIX_FMT_UYVY,
> -		.codes  = {
> +		.codes  = IMX_BUS_FMTS(
>  			MEDIA_BUS_FMT_UYVY8_2X8,
>  			MEDIA_BUS_FMT_UYVY8_1X16
> -		},
> +		),
>  		.cs     = IPUV3_COLORSPACE_YUV,
>  		.bpp    = 16,
>  	}, {
>  		.fourcc	= V4L2_PIX_FMT_YUYV,
> -		.codes  = {
> +		.codes  = IMX_BUS_FMTS(
>  			MEDIA_BUS_FMT_YUYV8_2X8,
>  			MEDIA_BUS_FMT_YUYV8_1X16
> -		},
> +		),
>  		.cs     = IPUV3_COLORSPACE_YUV,
>  		.bpp    = 16,
>  	}, {
> @@ -57,16 +63,16 @@ static const struct imx_media_pixfmt pixel_formats[] = {
>  	/*** RGB formats start here ***/
>  	{
>  		.fourcc	= V4L2_PIX_FMT_RGB565,
> -		.codes  = {MEDIA_BUS_FMT_RGB565_2X8_LE},
> +		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_RGB565_2X8_LE),
>  		.cs     = IPUV3_COLORSPACE_RGB,
>  		.bpp    = 16,
>  		.cycles = 2,
>  	}, {
>  		.fourcc	= V4L2_PIX_FMT_RGB24,
> -		.codes  = {
> +		.codes  = IMX_BUS_FMTS(
>  			MEDIA_BUS_FMT_RGB888_1X24,
>  			MEDIA_BUS_FMT_RGB888_2X12_LE
> -		},
> +		),
>  		.cs     = IPUV3_COLORSPACE_RGB,
>  		.bpp    = 24,
>  	}, {
> @@ -75,7 +81,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
>  		.bpp    = 24,
>  	}, {
>  		.fourcc	= V4L2_PIX_FMT_XRGB32,
> -		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
> +		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_ARGB8888_1X32),
>  		.cs     = IPUV3_COLORSPACE_RGB,
>  		.bpp    = 32,
>  		.ipufmt = true,
> @@ -95,91 +101,91 @@ static const struct imx_media_pixfmt pixel_formats[] = {
>  	/*** raw bayer and grayscale formats start here ***/
>  	{
>  		.fourcc = V4L2_PIX_FMT_SBGGR8,
> -		.codes  = {MEDIA_BUS_FMT_SBGGR8_1X8},
> +		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SBGGR8_1X8),
>  		.cs     = IPUV3_COLORSPACE_RGB,
>  		.bpp    = 8,
>  		.bayer  = true,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGBRG8,
> -		.codes  = {MEDIA_BUS_FMT_SGBRG8_1X8},
> +		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGBRG8_1X8),
>  		.cs     = IPUV3_COLORSPACE_RGB,
>  		.bpp    = 8,
>  		.bayer  = true,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGRBG8,
> -		.codes  = {MEDIA_BUS_FMT_SGRBG8_1X8},
> +		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGRBG8_1X8),
>  		.cs     = IPUV3_COLORSPACE_RGB,
>  		.bpp    = 8,
>  		.bayer  = true,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SRGGB8,
> -		.codes  = {MEDIA_BUS_FMT_SRGGB8_1X8},
> +		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SRGGB8_1X8),
>  		.cs     = IPUV3_COLORSPACE_RGB,
>  		.bpp    = 8,
>  		.bayer  = true,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SBGGR16,
> -		.codes  = {
> +		.codes  = IMX_BUS_FMTS(
>  			MEDIA_BUS_FMT_SBGGR10_1X10,
>  			MEDIA_BUS_FMT_SBGGR12_1X12,
>  			MEDIA_BUS_FMT_SBGGR14_1X14,
>  			MEDIA_BUS_FMT_SBGGR16_1X16
> -		},
> +		),
>  		.cs     = IPUV3_COLORSPACE_RGB,
>  		.bpp    = 16,
>  		.bayer  = true,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGBRG16,
> -		.codes  = {
> +		.codes  = IMX_BUS_FMTS(
>  			MEDIA_BUS_FMT_SGBRG10_1X10,
>  			MEDIA_BUS_FMT_SGBRG12_1X12,
>  			MEDIA_BUS_FMT_SGBRG14_1X14,
> -			MEDIA_BUS_FMT_SGBRG16_1X16,
> -		},
> +			MEDIA_BUS_FMT_SGBRG16_1X16
> +		),
>  		.cs     = IPUV3_COLORSPACE_RGB,
>  		.bpp    = 16,
>  		.bayer  = true,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGRBG16,
> -		.codes  = {
> +		.codes  = IMX_BUS_FMTS(
>  			MEDIA_BUS_FMT_SGRBG10_1X10,
>  			MEDIA_BUS_FMT_SGRBG12_1X12,
>  			MEDIA_BUS_FMT_SGRBG14_1X14,
> -			MEDIA_BUS_FMT_SGRBG16_1X16,
> -		},
> +			MEDIA_BUS_FMT_SGRBG16_1X16
> +		),
>  		.cs     = IPUV3_COLORSPACE_RGB,
>  		.bpp    = 16,
>  		.bayer  = true,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SRGGB16,
> -		.codes  = {
> +		.codes  = IMX_BUS_FMTS(
>  			MEDIA_BUS_FMT_SRGGB10_1X10,
>  			MEDIA_BUS_FMT_SRGGB12_1X12,
>  			MEDIA_BUS_FMT_SRGGB14_1X14,
> -			MEDIA_BUS_FMT_SRGGB16_1X16,
> -		},
> +			MEDIA_BUS_FMT_SRGGB16_1X16
> +		),
>  		.cs     = IPUV3_COLORSPACE_RGB,
>  		.bpp    = 16,
>  		.bayer  = true,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_GREY,
> -		.codes = {
> +		.codes = IMX_BUS_FMTS(
>  			MEDIA_BUS_FMT_Y8_1X8,
>  			MEDIA_BUS_FMT_Y10_1X10,
> -			MEDIA_BUS_FMT_Y12_1X12,
> -		},
> +			MEDIA_BUS_FMT_Y12_1X12
> +		),
>  		.cs     = IPUV3_COLORSPACE_RGB,
>  		.bpp    = 8,
>  		.bayer  = true,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_Y10,
> -		.codes = {MEDIA_BUS_FMT_Y10_1X10},
> +		.codes = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y10_1X10),
>  		.cs     = IPUV3_COLORSPACE_RGB,
>  		.bpp    = 16,
>  		.bayer  = true,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_Y12,
> -		.codes = {MEDIA_BUS_FMT_Y12_1X12},
> +		.codes = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y12_1X12),
>  		.cs     = IPUV3_COLORSPACE_RGB,
>  		.bpp    = 16,
>  		.bayer  = true,
> @@ -203,16 +209,16 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
>  			 CS_SEL_YUV : CS_SEL_RGB);
>  
>  		if (!(fmt_cs_sel & cs_sel) ||
> -		    (!allow_non_mbus && !fmt->codes[0]))
> +		    (!allow_non_mbus && !fmt->codes))
>  			continue;
>  
>  		if (fourcc && fmt->fourcc == fourcc)
>  			return fmt;
>  
> -		if (!code)
> +		if (!code || !fmt->codes)
>  			continue;
>  
> -		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
> +		for (j = 0; fmt->codes[j]; j++) {
>  			if (code == fmt->codes[j])
>  				return fmt;
>  		}
> @@ -237,7 +243,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
>  			 CS_SEL_YUV : CS_SEL_RGB);
>  
>  		if (!(fmt_cs_sel & cs_sel) ||
> -		    (!allow_non_mbus && !fmt->codes[0]))
> +		    (!allow_non_mbus && !fmt->codes))
>  			continue;
>  
>  		if (fourcc && index == 0) {
> @@ -250,7 +256,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
>  			continue;
>  		}
>  
> -		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
> +		for (j = 0; fmt->codes[j]; j++) {
>  			if (index == 0) {
>  				*code = fmt->codes[j];
>  				return 0;
> @@ -296,13 +302,13 @@ EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
>  static const struct imx_media_pixfmt ipu_formats[] = {
>  	{
>  		.fourcc = V4L2_PIX_FMT_YUV32,
> -		.codes  = {MEDIA_BUS_FMT_AYUV8_1X32},
> +		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_AYUV8_1X32),
>  		.cs     = IPUV3_COLORSPACE_YUV,
>  		.bpp    = 32,
>  		.ipufmt = true,
>  	}, {
>  		.fourcc	= V4L2_PIX_FMT_XRGB32,
> -		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
> +		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_ARGB8888_1X32),
>  		.cs     = IPUV3_COLORSPACE_RGB,
>  		.bpp    = 32,
>  		.ipufmt = true,
> @@ -327,7 +333,10 @@ imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel)
>  		    (!accept_rgb && fmt->cs == IPUV3_COLORSPACE_RGB))
>  			continue;
>  
> -		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
> +		if (!fmt->codes)
> +			continue;
> +
> +		for (j = 0; fmt->codes[j]; j++) {
>  			if (code == fmt->codes[j])
>  				return fmt;
>  		}
> @@ -351,7 +360,10 @@ int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel)
>  		    (!accept_rgb && fmt->cs == IPUV3_COLORSPACE_RGB))
>  			continue;
>  
> -		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
> +		if (!fmt->codes)
> +			continue;
> +
> +		for (j = 0; fmt->codes[j]; j++) {
>  			if (index == 0) {
>  				*code = fmt->codes[j];
>  				return 0;
> @@ -567,7 +579,7 @@ int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
>  	const struct imx_media_pixfmt *fmt;
>  
>  	fmt = imx_media_find_format(image->pix.pixelformat, CS_SEL_ANY);
> -	if (!fmt)
> +	if (!fmt || !fmt->codes)
>  		return -EINVAL;
>  
>  	memset(mbus, 0, sizeof(*mbus));
> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> index 652673a703cd..917b4db02985 100644
> --- a/drivers/staging/media/imx/imx-media.h
> +++ b/drivers/staging/media/imx/imx-media.h
> @@ -69,7 +69,7 @@ enum {
>  
>  struct imx_media_pixfmt {
>  	u32     fourcc;
> -	u32     codes[4];
> +	const u32 *codes;
>  	int     bpp;     /* total bpp */
>  	/* cycles per pixel for generic (bayer) formats for the parallel bus */
>  	int	cycles;
> 

