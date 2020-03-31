Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9D3219A23D
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2020 01:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731457AbgCaXGd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 19:06:33 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:52534 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731259AbgCaXGd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 19:06:33 -0400
Received: by mail-pj1-f67.google.com with SMTP id ng8so1793188pjb.2
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2020 16:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NGbCHomjls2OLBtydMn+UmRGAx4pEx3MBS52+6Hwwbw=;
        b=D0nd2DI2djZjv/TrlCXh3vTpnYeKKlneBzntHXjJKCDVbVO5Vi2j9DZhbCfcxG3yjR
         8NfVYxbte3Y08k1YaQYJNRj3FSbp21eQGOKOlCFxBd50mOg00vtkv1+saueF25EgBE/6
         gi+X8ZG9Vh9Z9r2FeyUoPLA0we8ZefFiuZ4D5cpZgND1vaE2tMQoBObwaLYJk1BOxcHd
         LIZmykM2jQfqkjCaDlWZIS+OSskihC45gk3PQIFzAnzsK6aTk02LJi+bHpjEp3e9C7G+
         mqLLEsnW0jtuPLp4anQK+4sKPkZatByufSxD2Pxc5kwLwzNmDqcPrTlGFt/UA9/FwVDt
         /+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=NGbCHomjls2OLBtydMn+UmRGAx4pEx3MBS52+6Hwwbw=;
        b=PkNyBiEtzCvfmTPd8WUFBUhhQ2EA65l6qeuZnMCNKFTAscCsupyYedMQBUYOBN4Gbr
         /lSGGMZCBMjOCFNLDWJ5UMS+K+1LWqoHI8XWHBR0Cy9z9QsACXiGm/3Sm5PxbHdIAtg/
         mzVi2xy6VzFNn98eORKLn4CF6LqmGOcwsDKQixD/j/bvfai2fvpUzeXdvMihkoXrkdvq
         fXP5KmsXCkdIrMQiX6mGhT92QQ2nWFmx78f4cUVdTIgLVcO2JVOyJCzN95p32lb3xMVo
         nABaFV1sA51YhdLWdJChSetINVdIBhUglVqVOis54MJRAHd0fwFeZhRf2fuMQj4fUBJq
         KeXw==
X-Gm-Message-State: ANhLgQ0hg3RmioxLxSJHqQxMLGNfMORIeJ2WhUMOg+VN9mAA6nHIFbsy
        TU/h7zKQ0A9fQNv+r0jA0Qc=
X-Google-Smtp-Source: ADFU+vsj9Z+mSP/IR89sGHE/dGSP2wzyrv0hYdcu6NG60RsWjwYNv2qwmn5m1XOfiBGdaf+4oce2Tg==
X-Received: by 2002:a17:902:a9cc:: with SMTP id b12mr19555926plr.177.1585695990694;
        Tue, 31 Mar 2020 16:06:30 -0700 (PDT)
Received: from [172.30.88.96] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id r70sm164313pfr.116.2020.03.31.16.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 16:06:29 -0700 (PDT)
Subject: Re: [PATCH v4 06/11] media: imx: utils: Make imx_media_pixfmt handle
 variable number of codes
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20200329205920.20118-1-slongerbeam@gmail.com>
 <20200329205920.20118-7-slongerbeam@gmail.com>
 <911bd2c6-e409-07e9-8521-b1febd6bb58e@xs4all.nl>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <02063ed3-e2de-8f15-bd08-84d3c319f79c@gmail.com>
Date:   Tue, 31 Mar 2020 16:04:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <911bd2c6-e409-07e9-8521-b1febd6bb58e@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 3/31/20 6:45 AM, Hans Verkuil wrote:
> On 3/29/20 10:59 PM, Steve Longerbeam wrote:
>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> The imx_media_pixfmt structures includes a codes member that stores
>> media bus codes as a fixed array of 4 integers. The functions dealing
>> with the imx_media_pixfmt structures assume that the array of codes is
>> terminated by a 0 elements. This mechanism is fragile, as demonstrated
> elements -> element
>
>> by several instances of the structure contained 4 non-zero codes.
> contained -> that contained

Will fix above language.

>
>> Fix this by turning the array into a pointer, and providing an
>> IMX_BUS_FMTS macro to initialize the codes member with a guaranteed 0
>> element at the end.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> [Fix a NULL deref when derefencing a NULL cc->codes on return from
>>   several calls to imx_media_find_format()]
>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>> ---
>>   drivers/staging/media/imx/imx-media-capture.c |  4 +-
>>   drivers/staging/media/imx/imx-media-utils.c   | 88 +++++++++++--------
>>   drivers/staging/media/imx/imx-media.h         |  2 +-
>>   3 files changed, 53 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
>> index d60b49ec4fa4..650c53289f6b 100644
>> --- a/drivers/staging/media/imx/imx-media-capture.c
>> +++ b/drivers/staging/media/imx/imx-media-capture.c
>> @@ -95,7 +95,7 @@ static int capture_enum_framesizes(struct file *file, void *fh,
>>   	if (!cc)
>>   		return -EINVAL;
>>   
>> -	fse.code = cc->codes[0];
>> +	fse.code = cc->codes ? cc->codes[0] : 0;
> I'm wondering: wouldn't it be better to have a format without codes point to
> an empty code list containing just 0? That would avoid all the cc->codes checks,
> which are a bit fragile IMHO.


I'll modify this patch to declare a const codes array 'no_bus_fmts', 
containing a single 0 value, that the in-memory-only imx_media_pixfmt 
entries can point to.

>
> It would be nice in that case if there is a WARN_ON or something during probe
> time that checks that the codes field in pixel_formats[] is never NULL.

I'm not so keen on that idea. How about a comment that the 
in-memory-only entries should point to no_bus_fmts ?


>
> As an aside: 'cc'? The struct is called imx_media_pixfmt, so I don't offhand see
> what 'cc' stands for.

It's an abbreviation of FourCC. I know, it's obscure and not really 
accurate. I will add a non-functional patch that makes the naming 
consistent, using 'fmt' for imx_media_pixfmt pointers throughout.

Steve


>>   
>>   	ret = v4l2_subdev_call(priv->src_sd, pad, enum_frame_size, NULL, &fse);
>>   	if (ret)
>> @@ -137,7 +137,7 @@ static int capture_enum_frameintervals(struct file *file, void *fh,
>>   	if (!cc)
>>   		return -EINVAL;
>>   
>> -	fie.code = cc->codes[0];
>> +	fie.code = cc->codes ? cc->codes[0] : 0;
>>   
>>   	ret = v4l2_subdev_call(priv->src_sd, pad, enum_frame_interval,
>>   			       NULL, &fie);
>> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
>> index 981a8b540a3c..da010eef0ae6 100644
>> --- a/drivers/staging/media/imx/imx-media-utils.c
>> +++ b/drivers/staging/media/imx/imx-media-utils.c
>> @@ -7,6 +7,12 @@
>>   #include <linux/module.h>
>>   #include "imx-media.h"
>>   
>> +#define IMX_BUS_FMTS(fmts...)	\
>> +	(const u32[]) {		\
>> +		fmts,		\
>> +		0		\
>> +	}
>> +
>>   /*
>>    * List of supported pixel formats for the subdevs.
>>    */
>> @@ -14,18 +20,18 @@ static const struct imx_media_pixfmt pixel_formats[] = {
>>   	/*** YUV formats start here ***/
>>   	{
>>   		.fourcc	= V4L2_PIX_FMT_UYVY,
>> -		.codes  = {
>> +		.codes  = IMX_BUS_FMTS(
>>   			MEDIA_BUS_FMT_UYVY8_2X8,
>>   			MEDIA_BUS_FMT_UYVY8_1X16
>> -		},
>> +		),
>>   		.cs     = IPUV3_COLORSPACE_YUV,
>>   		.bpp    = 16,
>>   	}, {
>>   		.fourcc	= V4L2_PIX_FMT_YUYV,
>> -		.codes  = {
>> +		.codes  = IMX_BUS_FMTS(
>>   			MEDIA_BUS_FMT_YUYV8_2X8,
>>   			MEDIA_BUS_FMT_YUYV8_1X16
>> -		},
>> +		),
>>   		.cs     = IPUV3_COLORSPACE_YUV,
>>   		.bpp    = 16,
>>   	}, {
>> @@ -57,16 +63,16 @@ static const struct imx_media_pixfmt pixel_formats[] = {
>>   	/*** RGB formats start here ***/
>>   	{
>>   		.fourcc	= V4L2_PIX_FMT_RGB565,
>> -		.codes  = {MEDIA_BUS_FMT_RGB565_2X8_LE},
>> +		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_RGB565_2X8_LE),
>>   		.cs     = IPUV3_COLORSPACE_RGB,
>>   		.bpp    = 16,
>>   		.cycles = 2,
>>   	}, {
>>   		.fourcc	= V4L2_PIX_FMT_RGB24,
>> -		.codes  = {
>> +		.codes  = IMX_BUS_FMTS(
>>   			MEDIA_BUS_FMT_RGB888_1X24,
>>   			MEDIA_BUS_FMT_RGB888_2X12_LE
>> -		},
>> +		),
>>   		.cs     = IPUV3_COLORSPACE_RGB,
>>   		.bpp    = 24,
>>   	}, {
>> @@ -75,7 +81,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
>>   		.bpp    = 24,
>>   	}, {
>>   		.fourcc	= V4L2_PIX_FMT_XRGB32,
>> -		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
>> +		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_ARGB8888_1X32),
>>   		.cs     = IPUV3_COLORSPACE_RGB,
>>   		.bpp    = 32,
>>   		.ipufmt = true,
>> @@ -95,91 +101,91 @@ static const struct imx_media_pixfmt pixel_formats[] = {
>>   	/*** raw bayer and grayscale formats start here ***/
>>   	{
>>   		.fourcc = V4L2_PIX_FMT_SBGGR8,
>> -		.codes  = {MEDIA_BUS_FMT_SBGGR8_1X8},
>> +		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SBGGR8_1X8),
>>   		.cs     = IPUV3_COLORSPACE_RGB,
>>   		.bpp    = 8,
>>   		.bayer  = true,
>>   	}, {
>>   		.fourcc = V4L2_PIX_FMT_SGBRG8,
>> -		.codes  = {MEDIA_BUS_FMT_SGBRG8_1X8},
>> +		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGBRG8_1X8),
>>   		.cs     = IPUV3_COLORSPACE_RGB,
>>   		.bpp    = 8,
>>   		.bayer  = true,
>>   	}, {
>>   		.fourcc = V4L2_PIX_FMT_SGRBG8,
>> -		.codes  = {MEDIA_BUS_FMT_SGRBG8_1X8},
>> +		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGRBG8_1X8),
>>   		.cs     = IPUV3_COLORSPACE_RGB,
>>   		.bpp    = 8,
>>   		.bayer  = true,
>>   	}, {
>>   		.fourcc = V4L2_PIX_FMT_SRGGB8,
>> -		.codes  = {MEDIA_BUS_FMT_SRGGB8_1X8},
>> +		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SRGGB8_1X8),
>>   		.cs     = IPUV3_COLORSPACE_RGB,
>>   		.bpp    = 8,
>>   		.bayer  = true,
>>   	}, {
>>   		.fourcc = V4L2_PIX_FMT_SBGGR16,
>> -		.codes  = {
>> +		.codes  = IMX_BUS_FMTS(
>>   			MEDIA_BUS_FMT_SBGGR10_1X10,
>>   			MEDIA_BUS_FMT_SBGGR12_1X12,
>>   			MEDIA_BUS_FMT_SBGGR14_1X14,
>>   			MEDIA_BUS_FMT_SBGGR16_1X16
>> -		},
>> +		),
>>   		.cs     = IPUV3_COLORSPACE_RGB,
>>   		.bpp    = 16,
>>   		.bayer  = true,
>>   	}, {
>>   		.fourcc = V4L2_PIX_FMT_SGBRG16,
>> -		.codes  = {
>> +		.codes  = IMX_BUS_FMTS(
>>   			MEDIA_BUS_FMT_SGBRG10_1X10,
>>   			MEDIA_BUS_FMT_SGBRG12_1X12,
>>   			MEDIA_BUS_FMT_SGBRG14_1X14,
>> -			MEDIA_BUS_FMT_SGBRG16_1X16,
>> -		},
>> +			MEDIA_BUS_FMT_SGBRG16_1X16
>> +		),
>>   		.cs     = IPUV3_COLORSPACE_RGB,
>>   		.bpp    = 16,
>>   		.bayer  = true,
>>   	}, {
>>   		.fourcc = V4L2_PIX_FMT_SGRBG16,
>> -		.codes  = {
>> +		.codes  = IMX_BUS_FMTS(
>>   			MEDIA_BUS_FMT_SGRBG10_1X10,
>>   			MEDIA_BUS_FMT_SGRBG12_1X12,
>>   			MEDIA_BUS_FMT_SGRBG14_1X14,
>> -			MEDIA_BUS_FMT_SGRBG16_1X16,
>> -		},
>> +			MEDIA_BUS_FMT_SGRBG16_1X16
>> +		),
>>   		.cs     = IPUV3_COLORSPACE_RGB,
>>   		.bpp    = 16,
>>   		.bayer  = true,
>>   	}, {
>>   		.fourcc = V4L2_PIX_FMT_SRGGB16,
>> -		.codes  = {
>> +		.codes  = IMX_BUS_FMTS(
>>   			MEDIA_BUS_FMT_SRGGB10_1X10,
>>   			MEDIA_BUS_FMT_SRGGB12_1X12,
>>   			MEDIA_BUS_FMT_SRGGB14_1X14,
>> -			MEDIA_BUS_FMT_SRGGB16_1X16,
>> -		},
>> +			MEDIA_BUS_FMT_SRGGB16_1X16
>> +		),
>>   		.cs     = IPUV3_COLORSPACE_RGB,
>>   		.bpp    = 16,
>>   		.bayer  = true,
>>   	}, {
>>   		.fourcc = V4L2_PIX_FMT_GREY,
>> -		.codes = {
>> +		.codes = IMX_BUS_FMTS(
>>   			MEDIA_BUS_FMT_Y8_1X8,
>>   			MEDIA_BUS_FMT_Y10_1X10,
>> -			MEDIA_BUS_FMT_Y12_1X12,
>> -		},
>> +			MEDIA_BUS_FMT_Y12_1X12
>> +		),
>>   		.cs     = IPUV3_COLORSPACE_RGB,
>>   		.bpp    = 8,
>>   		.bayer  = true,
>>   	}, {
>>   		.fourcc = V4L2_PIX_FMT_Y10,
>> -		.codes = {MEDIA_BUS_FMT_Y10_1X10},
>> +		.codes = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y10_1X10),
>>   		.cs     = IPUV3_COLORSPACE_RGB,
>>   		.bpp    = 16,
>>   		.bayer  = true,
>>   	}, {
>>   		.fourcc = V4L2_PIX_FMT_Y12,
>> -		.codes = {MEDIA_BUS_FMT_Y12_1X12},
>> +		.codes = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y12_1X12),
>>   		.cs     = IPUV3_COLORSPACE_RGB,
>>   		.bpp    = 16,
>>   		.bayer  = true,
>> @@ -203,16 +209,16 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
>>   			 CS_SEL_YUV : CS_SEL_RGB);
>>   
>>   		if (!(fmt_cs_sel & cs_sel) ||
>> -		    (!allow_non_mbus && !fmt->codes[0]))
>> +		    (!allow_non_mbus && !fmt->codes))
>>   			continue;
>>   
>>   		if (fourcc && fmt->fourcc == fourcc)
>>   			return fmt;
>>   
>> -		if (!code)
>> +		if (!code || !fmt->codes)
>>   			continue;
>>   
>> -		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
>> +		for (j = 0; fmt->codes[j]; j++) {
>>   			if (code == fmt->codes[j])
>>   				return fmt;
>>   		}
>> @@ -237,7 +243,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
>>   			 CS_SEL_YUV : CS_SEL_RGB);
>>   
>>   		if (!(fmt_cs_sel & cs_sel) ||
>> -		    (!allow_non_mbus && !fmt->codes[0]))
>> +		    (!allow_non_mbus && !fmt->codes))
>>   			continue;
>>   
>>   		if (fourcc && index == 0) {
>> @@ -250,7 +256,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
>>   			continue;
>>   		}
>>   
>> -		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
>> +		for (j = 0; fmt->codes[j]; j++) {
>>   			if (index == 0) {
>>   				*code = fmt->codes[j];
>>   				return 0;
>> @@ -296,13 +302,13 @@ EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
>>   static const struct imx_media_pixfmt ipu_formats[] = {
>>   	{
>>   		.fourcc = V4L2_PIX_FMT_YUV32,
>> -		.codes  = {MEDIA_BUS_FMT_AYUV8_1X32},
>> +		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_AYUV8_1X32),
>>   		.cs     = IPUV3_COLORSPACE_YUV,
>>   		.bpp    = 32,
>>   		.ipufmt = true,
>>   	}, {
>>   		.fourcc	= V4L2_PIX_FMT_XRGB32,
>> -		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
>> +		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_ARGB8888_1X32),
>>   		.cs     = IPUV3_COLORSPACE_RGB,
>>   		.bpp    = 32,
>>   		.ipufmt = true,
>> @@ -327,7 +333,10 @@ imx_media_find_ipu_format(u32 code, enum codespace_sel cs_sel)
>>   		    (!accept_rgb && fmt->cs == IPUV3_COLORSPACE_RGB))
>>   			continue;
>>   
>> -		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
>> +		if (!fmt->codes)
>> +			continue;
>> +
>> +		for (j = 0; fmt->codes[j]; j++) {
>>   			if (code == fmt->codes[j])
>>   				return fmt;
>>   		}
>> @@ -351,7 +360,10 @@ int imx_media_enum_ipu_format(u32 *code, u32 index, enum codespace_sel cs_sel)
>>   		    (!accept_rgb && fmt->cs == IPUV3_COLORSPACE_RGB))
>>   			continue;
>>   
>> -		for (j = 0; j < ARRAY_SIZE(fmt->codes) && fmt->codes[j]; j++) {
>> +		if (!fmt->codes)
>> +			continue;
>> +
>> +		for (j = 0; fmt->codes[j]; j++) {
>>   			if (index == 0) {
>>   				*code = fmt->codes[j];
>>   				return 0;
>> @@ -567,7 +579,7 @@ int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
>>   	const struct imx_media_pixfmt *fmt;
>>   
>>   	fmt = imx_media_find_format(image->pix.pixelformat, CS_SEL_ANY);
>> -	if (!fmt)
>> +	if (!fmt || !fmt->codes)
>>   		return -EINVAL;
>>   
>>   	memset(mbus, 0, sizeof(*mbus));
>> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
>> index 652673a703cd..917b4db02985 100644
>> --- a/drivers/staging/media/imx/imx-media.h
>> +++ b/drivers/staging/media/imx/imx-media.h
>> @@ -69,7 +69,7 @@ enum {
>>   
>>   struct imx_media_pixfmt {
>>   	u32     fourcc;
>> -	u32     codes[4];
>> +	const u32 *codes;
>>   	int     bpp;     /* total bpp */
>>   	/* cycles per pixel for generic (bayer) formats for the parallel bus */
>>   	int	cycles;
>>

