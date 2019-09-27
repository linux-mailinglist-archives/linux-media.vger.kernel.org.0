Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8F5C0015
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 09:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbfI0Hdt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 03:33:49 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:34885 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725820AbfI0Hdt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 03:33:49 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Dkl5iK34r9D4hDkl9iAn9x; Fri, 27 Sep 2019 09:33:47 +0200
Subject: Re: [PATCH 3/3] media: imx: fix media bus format enumeration
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, kernel@pengutronix.de
References: <20190912160122.5545-1-p.zabel@pengutronix.de>
 <20190912160122.5545-3-p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d30091d5-5e45-9682-7c23-813eff2b42c5@xs4all.nl>
Date:   Fri, 27 Sep 2019 09:33:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912160122.5545-3-p.zabel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfK6niBdUR9w4Zxoae6NUozH3E8qRHmOmn9klNYu/23l0mGEyd033o+v7f4vGs2yN/NbKvoes7WSTEGJ42BMM/n6+rAqF9CDcvE7/1RXnis2oU33ht3ed
 +racY83shwxhJu35m4vPtr+7gTyvPbIHE9jTbxhT18kPKJAXMez8rHH7XyHH9XCvs8gzpTUiMfD8+5ZZVvsYajDzhtODCq+jdz8SoCPibQWEzR896TZjpow4
 MHhbRo1NKZO7J60POfe+a5ipNZiK9Nkku0PuA/CvkKc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/12/19 6:01 PM, Philipp Zabel wrote:
> Iterate over all media bus formats, not just over the first format in
> each imx_media_pixfmt entry.
> 
> Before:
> 
>   $ v4l2-ctl -d $(media-ctl -e ipu1_csi0) --list-subdev-mbus-codes 0
>   ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=0)
> 	0x2006: MEDIA_BUS_FMT_UYVY8_2X8
> 	0x2008: MEDIA_BUS_FMT_YUYV8_2X8
> 	0x1008: MEDIA_BUS_FMT_RGB565_2X8_LE
> 	0x100a: MEDIA_BUS_FMT_RGB888_1X24
> 	0x100d: MEDIA_BUS_FMT_ARGB8888_1X32
> 	0x3001: MEDIA_BUS_FMT_SBGGR8_1X8
> 	0x3013: MEDIA_BUS_FMT_SGBRG8_1X8
> 	0x3002: MEDIA_BUS_FMT_SGRBG8_1X8
> 	0x3014: MEDIA_BUS_FMT_SRGGB8_1X8
> 	0x3007: MEDIA_BUS_FMT_SBGGR10_1X10
> 	0x300e: MEDIA_BUS_FMT_SGBRG10_1X10
> 	0x300a: MEDIA_BUS_FMT_SGRBG10_1X10
> 	0x300f: MEDIA_BUS_FMT_SRGGB10_1X10
> 	0x2001: MEDIA_BUS_FMT_Y8_1X8
> 	0x200a: MEDIA_BUS_FMT_Y10_1X10
> 
> After:
> 
>   $ v4l2-ctl -d $(media-ctl -e ipu1_csi0) --list-subdev-mbus-codes 0
>   ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=0)
> 	0x2006: MEDIA_BUS_FMT_UYVY8_2X8
> 	0x200f: MEDIA_BUS_FMT_UYVY8_1X16
> 	0x2008: MEDIA_BUS_FMT_YUYV8_2X8
> 	0x2011: MEDIA_BUS_FMT_YUYV8_1X16
> 	0x1008: MEDIA_BUS_FMT_RGB565_2X8_LE
> 	0x100a: MEDIA_BUS_FMT_RGB888_1X24
> 	0x100c: MEDIA_BUS_FMT_RGB888_2X12_LE
> 	0x100d: MEDIA_BUS_FMT_ARGB8888_1X32
> 	0x3001: MEDIA_BUS_FMT_SBGGR8_1X8
> 	0x3013: MEDIA_BUS_FMT_SGBRG8_1X8
> 	0x3002: MEDIA_BUS_FMT_SGRBG8_1X8
> 	0x3014: MEDIA_BUS_FMT_SRGGB8_1X8
> 	0x3007: MEDIA_BUS_FMT_SBGGR10_1X10
> 	0x3008: MEDIA_BUS_FMT_SBGGR12_1X12
> 	0x3019: MEDIA_BUS_FMT_SBGGR14_1X14
> 	0x301d: MEDIA_BUS_FMT_SBGGR16_1X16
> 	0x300e: MEDIA_BUS_FMT_SGBRG10_1X10
> 	0x3010: MEDIA_BUS_FMT_SGBRG12_1X12
> 	0x301a: MEDIA_BUS_FMT_SGBRG14_1X14
> 	0x301e: MEDIA_BUS_FMT_SGBRG16_1X16
> 	0x300a: MEDIA_BUS_FMT_SGRBG10_1X10
> 	0x3011: MEDIA_BUS_FMT_SGRBG12_1X12
> 	0x301b: MEDIA_BUS_FMT_SGRBG14_1X14
> 	0x301f: MEDIA_BUS_FMT_SGRBG16_1X16
> 	0x300f: MEDIA_BUS_FMT_SRGGB10_1X10
> 	0x3012: MEDIA_BUS_FMT_SRGGB12_1X12
> 	0x301c: MEDIA_BUS_FMT_SRGGB14_1X14
> 	0x3020: MEDIA_BUS_FMT_SRGGB16_1X16
> 	0x2001: MEDIA_BUS_FMT_Y8_1X8
> 	0x200a: MEDIA_BUS_FMT_Y10_1X10
> 	0x2013: MEDIA_BUS_FMT_Y12_1X12
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/staging/media/imx/imx-media-utils.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index d61a8f4533dc..5f8604db4dd4 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -254,7 +254,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
>  		       bool allow_bayer)
>  {

This function is becoming confusing. I think you should add some comments explaining
what the function does. Specifically the fourcc and code arguments.

Can both be non-NULL? Or only one of the two? I think that if fourcc is non-NULL you
enumerate over the V4L2 pixelformats, if code is non-NULL, then you enumerate over
the mediabus codes.

If so, then I think it would be easier to understand if you just make two functions:
enum_formats and enum_codes, rather than trying to merge them into one.

Patches 1 and 2 of this series look good, so I'll take those.

Regards,

	Hans

>  	const struct imx_media_pixfmt *fmt;
> -	unsigned int i, j = 0;
> +	unsigned int i, j, k = 0;
>  
>  	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
>  		fmt = &pixel_formats[i];
> @@ -264,18 +264,29 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
>  		    (!allow_bayer && fmt->bayer))
>  			continue;
>  
> -		if (index == j)
> +		if (fourcc && index == k)
>  			break;
>  
> -		j++;
> +		if (!code) {
> +			k++;
> +			continue;
> +		}
> +
> +		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
> +			if (index == k)
> +				goto out;
> +
> +			k++;
> +		}
>  	}
>  	if (i == ARRAY_SIZE(pixel_formats))
>  		return -EINVAL;
>  
> +out:
>  	if (fourcc)
>  		*fourcc = fmt->fourcc;
>  	if (code)
> -		*code = fmt->codes[0];
> +		*code = fmt->codes[j];
>  
>  	return 0;
>  }
> 

