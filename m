Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9098EE5619
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2019 23:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbfJYVn2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Oct 2019 17:43:28 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51536 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbfJYVn2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Oct 2019 17:43:28 -0400
Received: by mail-wm1-f66.google.com with SMTP id q70so3679049wme.1
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2019 14:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8Uk2t6eV23xi3exVixk+pwagP2ScHihngGCqVNC+7oY=;
        b=FEaZ8Vchi/GlXplk0unkefZnCe/jcnO+oDGvOvS6XalwkyV9FnpIfnXTEDJ/QvjmU5
         dC6SbxILJczL7C2PpsgwfiCM4mYVbANxhSJfLbN38WBr2NOt4e9sYKZlmfCYUNTnJO8c
         GppTat+Q9JQWK6N6hS+ovFYiXbBEve8QFmIJWefFqRBq4PyXNOPbywZfXi3MFHtLUQRJ
         VzOFCHX7CznbJqQEFEJ4c3vqxLltXwRI02u9bDWBR+A3VRB7lEs4y+S+n8o8a1IXC8Qe
         603b+RUypRErNuh8k2ytwWsH6UoEzZHj6LcZnWxULYkWPfHa7+qYajr+LNTuJfNManlB
         jk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8Uk2t6eV23xi3exVixk+pwagP2ScHihngGCqVNC+7oY=;
        b=K6aa6Gef7hSWQhzZlDiSE1u2BjJfCy6COuEVqqAiI6Wk7M9dgBtFWS2RjU1WN02zaA
         0thUESPrEIHcWOs1Fp0K5h07kkSyU3ixOF94P0aY71SjK4FoTPQD6w1vpJ4bvc8hFOM0
         arHhFaXrTJlUvArucGEuex208nJHkPzOTBW3ViiomPMjenmdSyuxlzB4PIrjjovmP/sx
         s2tUGhx82vLgtknUY9Ihi8ReQrwEO+IArwP36YpWiesudrayw0ETy6KV6orNu69EfO+U
         rHN6anNWUgYo1h508QFitzPCxW4k3fbZ+UNPwjoOad81vA0RQ0IDinglvvzsQwbdNVtR
         dj3Q==
X-Gm-Message-State: APjAAAUHDE0KRuG8UXEREb/K5fp2IxEkqfsxZayOR5hgDEK9V5bfd310
        9lnB0tdxDaqXkULwwv57L3A=
X-Google-Smtp-Source: APXvYqy/0fdDRG9yqBfHPKvhsW2hojlMiiPRciX2qovVcCic7z7lvCJDffBXEc2RVbYnaoOudOHY7A==
X-Received: by 2002:a7b:cbc5:: with SMTP id n5mr5405852wmi.65.1572039805066;
        Fri, 25 Oct 2019 14:43:25 -0700 (PDT)
Received: from [172.30.90.16] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id u1sm2848986wmc.38.2019.10.25.14.43.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 14:43:24 -0700 (PDT)
Subject: Re: [PATCH 2/3] media: imx: fix and simplify pixel format enumeration
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de
References: <20190912160122.5545-1-p.zabel@pengutronix.de>
 <20190912160122.5545-2-p.zabel@pengutronix.de>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <71d87165-e649-a477-d2b8-fdb11b201962@gmail.com>
Date:   Fri, 25 Oct 2019 14:43:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912160122.5545-2-p.zabel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

Thanks for this patch and the next. I agree it simplifies the code.

Besides the compile warning caught by Hans and the kbuild test robot, I 
have only one other suggestion. Can you change the name of the index j 
(which becomes k in the next patch), to something like "match_index", 
which makes it more clear that this is a count of the pixel_formats[] 
entries that match the requested search criteria.

For testing I made this change in my github fork of the media-tree:

git@github.com:slongerbeam/mediatree.git, branch imx/philipp-pixfmts-cleanup

In that branch I also fixed the compile warnings.

Finally, I added a patch that also moves the IPU-internal formats (YUV4 
and BX24) into pixel_formats[] that results in similar simplifications, 
with an additional search parameter to find_format() and enum_format() 
to search only for IPU-internal formats or only non-IPU-internal formats.

Let me know if you agree with those changes, and if so please include 
them in next version of this series.

I tested on i.MX6Q SabreSD and all is good.

Steve


On 9/12/19 9:01 AM, Philipp Zabel wrote:
> Merge yuv_formats and rgb_formats into a single array. Always loop over
> all entries, skipping those that are incompatible with the requested
> enumeration. This simplifies the code, lets us get rid of the manual
> counting of array entries, and stops accidentally ignoring some non-mbus
> RGB formats.
>
> Before:
>
>    $ v4l2-ctl -d /dev/video14 --list-formats-out
>    ioctl: VIDIOC_ENUM_FMT
> 	Type: Video Output
>
> 	[0]: 'UYVY' (UYVY 4:2:2)
> 	[1]: 'YUYV' (YUYV 4:2:2)
> 	[2]: 'YU12' (Planar YUV 4:2:0)
> 	[3]: 'YV12' (Planar YVU 4:2:0)
> 	[4]: '422P' (Planar YUV 4:2:2)
> 	[5]: 'NV12' (Y/CbCr 4:2:0)
> 	[6]: 'NV16' (Y/CbCr 4:2:2)
> 	[7]: 'RGBP' (16-bit RGB 5-6-5)
> 	[8]: 'RGB3' (24-bit RGB 8-8-8)
> 	[9]: 'BX24' (32-bit XRGB 8-8-8-8)
>
> After:
>
>    $ v4l2-ctl -d /dev/video14 --list-formats-out
>    ioctl: VIDIOC_ENUM_FMT
> 	Type: Video Output
>
> 	[0]: 'UYVY' (UYVY 4:2:2)
> 	[1]: 'YUYV' (YUYV 4:2:2)
> 	[2]: 'YU12' (Planar YUV 4:2:0)
> 	[3]: 'YV12' (Planar YVU 4:2:0)
> 	[4]: '422P' (Planar YUV 4:2:2)
> 	[5]: 'NV12' (Y/CbCr 4:2:0)
> 	[6]: 'NV16' (Y/CbCr 4:2:2)
> 	[7]: 'RGBP' (16-bit RGB 5-6-5)
> 	[8]: 'RGB3' (24-bit RGB 8-8-8)
> 	[9]: 'BGR3' (24-bit BGR 8-8-8)
> 	[10]: 'BX24' (32-bit XRGB 8-8-8-8)
> 	[11]: 'XR24' (32-bit BGRX 8-8-8-8)
> 	[12]: 'RX24' (32-bit XBGR 8-8-8-8)
> 	[13]: 'XB24' (32-bit RGBX 8-8-8-8)
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   drivers/staging/media/imx/imx-media-utils.c | 170 ++++++--------------
>   1 file changed, 45 insertions(+), 125 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index 0788a1874557..d61a8f4533dc 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -9,12 +9,9 @@
>   
>   /*
>    * List of supported pixel formats for the subdevs.
> - *
> - * In all of these tables, the non-mbus formats (with no
> - * mbus codes) must all fall at the end of the table.
>    */
> -
> -static const struct imx_media_pixfmt yuv_formats[] = {
> +static const struct imx_media_pixfmt pixel_formats[] = {
> +	/*** YUV formats start here ***/
>   	{
>   		.fourcc	= V4L2_PIX_FMT_UYVY,
>   		.codes  = {
> @@ -31,12 +28,7 @@ static const struct imx_media_pixfmt yuv_formats[] = {
>   		},
>   		.cs     = IPUV3_COLORSPACE_YUV,
>   		.bpp    = 16,
> -	},
> -	/***
> -	 * non-mbus YUV formats start here. NOTE! when adding non-mbus
> -	 * formats, NUM_NON_MBUS_YUV_FORMATS must be updated below.
> -	 ***/
> -	{
> +	}, {
>   		.fourcc	= V4L2_PIX_FMT_YUV420,
>   		.cs     = IPUV3_COLORSPACE_YUV,
>   		.bpp    = 12,
> @@ -62,13 +54,7 @@ static const struct imx_media_pixfmt yuv_formats[] = {
>   		.bpp    = 16,
>   		.planar = true,
>   	},
> -};
> -
> -#define NUM_NON_MBUS_YUV_FORMATS 5
> -#define NUM_YUV_FORMATS ARRAY_SIZE(yuv_formats)
> -#define NUM_MBUS_YUV_FORMATS (NUM_YUV_FORMATS - NUM_NON_MBUS_YUV_FORMATS)
> -
> -static const struct imx_media_pixfmt rgb_formats[] = {
> +	/*** RGB formats start here ***/
>   	{
>   		.fourcc	= V4L2_PIX_FMT_RGB565,
>   		.codes  = {MEDIA_BUS_FMT_RGB565_2X8_LE},
> @@ -83,12 +69,28 @@ static const struct imx_media_pixfmt rgb_formats[] = {
>   		},
>   		.cs     = IPUV3_COLORSPACE_RGB,
>   		.bpp    = 24,
> +	}, {
> +		.fourcc	= V4L2_PIX_FMT_BGR24,
> +		.cs     = IPUV3_COLORSPACE_RGB,
> +		.bpp    = 24,
>   	}, {
>   		.fourcc	= V4L2_PIX_FMT_XRGB32,
>   		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
>   		.cs     = IPUV3_COLORSPACE_RGB,
>   		.bpp    = 32,
>   		.ipufmt = true,
> +	}, {
> +		.fourcc	= V4L2_PIX_FMT_XBGR32,
> +		.cs     = IPUV3_COLORSPACE_RGB,
> +		.bpp    = 32,
> +	}, {
> +		.fourcc	= V4L2_PIX_FMT_BGRX32,
> +		.cs     = IPUV3_COLORSPACE_RGB,
> +		.bpp    = 32,
> +	}, {
> +		.fourcc	= V4L2_PIX_FMT_RGBX32,
> +		.cs     = IPUV3_COLORSPACE_RGB,
> +		.bpp    = 32,
>   	},
>   	/*** raw bayer and grayscale formats start here ***/
>   	{
> @@ -175,33 +177,8 @@ static const struct imx_media_pixfmt rgb_formats[] = {
>   		.bpp    = 16,
>   		.bayer  = true,
>   	},
> -	/***
> -	 * non-mbus RGB formats start here. NOTE! when adding non-mbus
> -	 * formats, NUM_NON_MBUS_RGB_FORMATS must be updated below.
> -	 ***/
> -	{
> -		.fourcc	= V4L2_PIX_FMT_BGR24,
> -		.cs     = IPUV3_COLORSPACE_RGB,
> -		.bpp    = 24,
> -	}, {
> -		.fourcc	= V4L2_PIX_FMT_XBGR32,
> -		.cs     = IPUV3_COLORSPACE_RGB,
> -		.bpp    = 32,
> -	}, {
> -		.fourcc	= V4L2_PIX_FMT_BGRX32,
> -		.cs     = IPUV3_COLORSPACE_RGB,
> -		.bpp    = 32,
> -	}, {
> -		.fourcc	= V4L2_PIX_FMT_RGBX32,
> -		.cs     = IPUV3_COLORSPACE_RGB,
> -		.bpp    = 32,
> -	},
>   };
>   
> -#define NUM_NON_MBUS_RGB_FORMATS 2
> -#define NUM_RGB_FORMATS ARRAY_SIZE(rgb_formats)
> -#define NUM_MBUS_RGB_FORMATS (NUM_RGB_FORMATS - NUM_NON_MBUS_RGB_FORMATS)
> -
>   static const struct imx_media_pixfmt ipu_yuv_formats[] = {
>   	{
>   		.fourcc = V4L2_PIX_FMT_YUV32,
> @@ -240,20 +217,20 @@ static void init_mbus_colorimetry(struct v4l2_mbus_framefmt *mbus,
>   }
>   
>   static const
> -struct imx_media_pixfmt *__find_format(u32 fourcc,
> -				       u32 code,
> -				       bool allow_non_mbus,
> -				       bool allow_bayer,
> -				       const struct imx_media_pixfmt *array,
> -				       u32 array_size)
> +struct imx_media_pixfmt *find_format(u32 fourcc,
> +				     u32 code,
> +				     enum codespace_sel cs_sel,
> +				     bool allow_non_mbus,
> +				     bool allow_bayer)
>   {
>   	const struct imx_media_pixfmt *fmt;
>   	int i, j;
>   
> -	for (i = 0; i < array_size; i++) {
> -		fmt = &array[i];
> +	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
> +		fmt = &pixel_formats[i];
>   
> -		if ((!allow_non_mbus && !fmt->codes[0]) ||
> +		if ((cs_sel != CS_SEL_ANY && fmt->cs != cs_sel) ||
> +		    (!allow_non_mbus && !fmt->codes[0]) ||
>   		    (!allow_bayer && fmt->bayer))
>   			continue;
>   
> @@ -263,7 +240,7 @@ struct imx_media_pixfmt *__find_format(u32 fourcc,
>   		if (!code)
>   			continue;
>   
> -		for (j = 0; fmt->codes[j]; j++) {
> +		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
>   			if (code == fmt->codes[j])
>   				return fmt;
>   		}
> @@ -271,86 +248,29 @@ struct imx_media_pixfmt *__find_format(u32 fourcc,
>   	return NULL;
>   }
>   
> -static const struct imx_media_pixfmt *find_format(u32 fourcc,
> -						  u32 code,
> -						  enum codespace_sel cs_sel,
> -						  bool allow_non_mbus,
> -						  bool allow_bayer)
> -{
> -	const struct imx_media_pixfmt *ret;
> -
> -	switch (cs_sel) {
> -	case CS_SEL_YUV:
> -		return __find_format(fourcc, code, allow_non_mbus, allow_bayer,
> -				     yuv_formats, NUM_YUV_FORMATS);
> -	case CS_SEL_RGB:
> -		return __find_format(fourcc, code, allow_non_mbus, allow_bayer,
> -				     rgb_formats, NUM_RGB_FORMATS);
> -	case CS_SEL_ANY:
> -		ret = __find_format(fourcc, code, allow_non_mbus, allow_bayer,
> -				    yuv_formats, NUM_YUV_FORMATS);
> -		if (ret)
> -			return ret;
> -		return __find_format(fourcc, code, allow_non_mbus, allow_bayer,
> -				     rgb_formats, NUM_RGB_FORMATS);
> -	default:
> -		return NULL;
> -	}
> -}
> -
>   static int enum_format(u32 *fourcc, u32 *code, u32 index,
>   		       enum codespace_sel cs_sel,
>   		       bool allow_non_mbus,
>   		       bool allow_bayer)
>   {
>   	const struct imx_media_pixfmt *fmt;
> -	u32 mbus_yuv_sz = NUM_MBUS_YUV_FORMATS;
> -	u32 mbus_rgb_sz = NUM_MBUS_RGB_FORMATS;
> -	u32 yuv_sz = NUM_YUV_FORMATS;
> -	u32 rgb_sz = NUM_RGB_FORMATS;
> +	unsigned int i, j = 0;
>   
> -	switch (cs_sel) {
> -	case CS_SEL_YUV:
> -		if (index >= yuv_sz ||
> -		    (!allow_non_mbus && index >= mbus_yuv_sz))
> -			return -EINVAL;
> -		fmt = &yuv_formats[index];
> -		break;
> -	case CS_SEL_RGB:
> -		if (index >= rgb_sz ||
> -		    (!allow_non_mbus && index >= mbus_rgb_sz))
> -			return -EINVAL;
> -		fmt = &rgb_formats[index];
> -		if (!allow_bayer && fmt->bayer)
> -			return -EINVAL;
> -		break;
> -	case CS_SEL_ANY:
> -		if (!allow_non_mbus) {
> -			if (index >= mbus_yuv_sz) {
> -				index -= mbus_yuv_sz;
> -				if (index >= mbus_rgb_sz)
> -					return -EINVAL;
> -				fmt = &rgb_formats[index];
> -				if (!allow_bayer && fmt->bayer)
> -					return -EINVAL;
> -			} else {
> -				fmt = &yuv_formats[index];
> -			}
> -		} else {
> -			if (index >= yuv_sz + rgb_sz)
> -				return -EINVAL;
> -			if (index >= yuv_sz) {
> -				fmt = &rgb_formats[index - yuv_sz];
> -				if (!allow_bayer && fmt->bayer)
> -					return -EINVAL;
> -			} else {
> -				fmt = &yuv_formats[index];
> -			}
> -		}
> -		break;
> -	default:
> -		return -EINVAL;
> +	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
> +		fmt = &pixel_formats[i];
> +
> +		if ((cs_sel != CS_SEL_ANY && fmt->cs != cs_sel) ||
> +		    (!allow_non_mbus && !fmt->codes[0]) ||
> +		    (!allow_bayer && fmt->bayer))
> +			continue;
> +
> +		if (index == j)
> +			break;
> +
> +		j++;
>   	}
> +	if (i == ARRAY_SIZE(pixel_formats))
> +		return -EINVAL;
>   
>   	if (fourcc)
>   		*fourcc = fmt->fourcc;

