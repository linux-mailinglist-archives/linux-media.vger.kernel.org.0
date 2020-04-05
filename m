Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17B4419ECC9
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 19:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgDERFN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Apr 2020 13:05:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58280 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbgDERFM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Apr 2020 13:05:12 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85455312;
        Sun,  5 Apr 2020 19:05:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586106310;
        bh=6U6dUNOtBw9PQlk5VNPM3cu+YuCSXUD1gNSBOYc0MsU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XtJpdZsmJBCdZH4pndYmvjybxWkBeuyK+wsy7hnfA8g1TwwR5N8CitZprurX5QJI8
         Rcx7Zs6/fvooAhwnmeejm9YTh6HE1aRRqlAov7x9sfxaL2VxerDqd/K27Rz/zuU1aM
         N9LX/73ARbMPQM62i/IH5MXp7M1mu5HEsmy0jgKM=
Date:   Sun, 5 Apr 2020 20:05:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH v6 06/11] media: imx: utils: Introduce PIXFMT_SEL_IPU
Message-ID: <20200405170501.GC5846@pendragon.ideasonboard.com>
References: <20200404224130.23118-1-slongerbeam@gmail.com>
 <20200404224130.23118-7-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200404224130.23118-7-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

Thank you for the patch.

On Sat, Apr 04, 2020 at 03:41:25PM -0700, Steve Longerbeam wrote:
> Add a PIXFMT_SEL_IPU selection flag, to select only the IPU-internal
> pixel formats, and move the single-entry IPU-internal pixel format
> arrays into pixel_formats[]. imx_media_find_ipu_format() and
> imx_media_enum_ipu_format() can now simply call find_format() and
> enum_format().
> 
> The RGB32 format is both an IPU-internal format, and an in-memory format
> via idmac channels that is supported by the IPUv3 driver, so it appears
> twice in pixel_formats[], one with ipufmt=false for the in-memory format,
> and again with ipufmt=true for the IPU-internal format.

I like code sharing, but I think the big pixel_formats array is starting
to mix unrelated information together. The fact that the
V4L2_PIX_FMT_YUV32 entry only exists as a .ipufmt == true variant
bothers me. Down the line I'll propose splitting the i.MX7 code out to a
separate driver, without using imx-media-utils.c. We'll then have an
opportunity to refactor this for IPU-based systems only. Until then,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/staging/media/imx/imx-media-utils.c | 118 +++++---------------
>  drivers/staging/media/imx/imx-media.h       |   1 +
>  2 files changed, 27 insertions(+), 92 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index beaa920d7ac7..873fdcee7d37 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -53,7 +53,13 @@ static const struct imx_media_pixfmt pixel_formats[] = {
>  		.cs     = IPUV3_COLORSPACE_YUV,
>  		.bpp    = 16,
>  		.planar = true,
> -	},
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_YUV32,
> +		.codes  = {MEDIA_BUS_FMT_AYUV8_1X32},
> +		.cs     = IPUV3_COLORSPACE_YUV,
> +		.bpp    = 32,
> +		.ipufmt = true,
> +        },
>  	/*** RGB formats start here ***/
>  	{
>  		.fourcc	= V4L2_PIX_FMT_RGB565,
> @@ -73,6 +79,11 @@ static const struct imx_media_pixfmt pixel_formats[] = {
>  		.fourcc	= V4L2_PIX_FMT_BGR24,
>  		.cs     = IPUV3_COLORSPACE_RGB,
>  		.bpp    = 24,
> +	}, {
> +		.fourcc	= V4L2_PIX_FMT_XRGB32,
> +		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
> +		.cs     = IPUV3_COLORSPACE_RGB,
> +		.bpp    = 32,
>  	}, {
>  		.fourcc	= V4L2_PIX_FMT_XRGB32,
>  		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
> @@ -186,42 +197,24 @@ static const struct imx_media_pixfmt pixel_formats[] = {
>  	},
>  };
>  
> -static const struct imx_media_pixfmt ipu_yuv_formats[] = {
> -	{
> -		.fourcc = V4L2_PIX_FMT_YUV32,
> -		.codes  = {MEDIA_BUS_FMT_AYUV8_1X32},
> -		.cs     = IPUV3_COLORSPACE_YUV,
> -		.bpp    = 32,
> -		.ipufmt = true,
> -	},
> -};
> -
> -#define NUM_IPU_YUV_FORMATS ARRAY_SIZE(ipu_yuv_formats)
> -
> -static const struct imx_media_pixfmt ipu_rgb_formats[] = {
> -	{
> -		.fourcc	= V4L2_PIX_FMT_XRGB32,
> -		.codes  = {MEDIA_BUS_FMT_ARGB8888_1X32},
> -		.cs     = IPUV3_COLORSPACE_RGB,
> -		.bpp    = 32,
> -		.ipufmt = true,
> -	},
> -};
> -
> -#define NUM_IPU_RGB_FORMATS ARRAY_SIZE(ipu_rgb_formats)
> -
>  static const struct imx_media_pixfmt *find_format(u32 fourcc,
>  						  u32 code,
>  						  enum imx_pixfmt_sel fmt_sel,
>  						  bool allow_non_mbus)
>  {
> +	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
>  	unsigned int i;
>  
> +	fmt_sel &= ~PIXFMT_SEL_IPU;
> +
>  	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
>  		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
>  		enum imx_pixfmt_sel sel;
>  		unsigned int j;
>  
> +		if (sel_ipu != fmt->ipufmt)
> +			continue;
> +
>  		sel = fmt->bayer ? PIXFMT_SEL_BAYER :
>  			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
>  			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
> @@ -249,13 +242,19 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
>  		       enum imx_pixfmt_sel fmt_sel,
>  		       bool allow_non_mbus)
>  {
> +	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
>  	unsigned int i;
>  
> +	fmt_sel &= ~PIXFMT_SEL_IPU;
> +
>  	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
>  		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
>  		enum imx_pixfmt_sel sel;
>  		unsigned int j;
>  
> +		if (sel_ipu != fmt->ipufmt)
> +			continue;
> +
>  		sel = fmt->bayer ? PIXFMT_SEL_BAYER :
>  			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
>  			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
> @@ -317,79 +316,14 @@ EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
>  const struct imx_media_pixfmt *
>  imx_media_find_ipu_format(u32 code, enum imx_pixfmt_sel fmt_sel)
>  {
> -	const struct imx_media_pixfmt *array, *fmt, *ret = NULL;
> -	u32 array_size;
> -	int i, j;
> -
> -	fmt_sel &= ~PIXFMT_SEL_BAYER;
> -
> -	switch (fmt_sel) {
> -	case PIXFMT_SEL_YUV:
> -		array_size = NUM_IPU_YUV_FORMATS;
> -		array = ipu_yuv_formats;
> -		break;
> -	case PIXFMT_SEL_RGB:
> -		array_size = NUM_IPU_RGB_FORMATS;
> -		array = ipu_rgb_formats;
> -		break;
> -	case PIXFMT_SEL_YUV_RGB:
> -		array_size = NUM_IPU_YUV_FORMATS + NUM_IPU_RGB_FORMATS;
> -		array = ipu_yuv_formats;
> -		break;
> -	default:
> -		return NULL;
> -	}
> -
> -	for (i = 0; i < array_size; i++) {
> -		if (fmt_sel == PIXFMT_SEL_YUV_RGB && i >= NUM_IPU_YUV_FORMATS)
> -			fmt = &ipu_rgb_formats[i - NUM_IPU_YUV_FORMATS];
> -		else
> -			fmt = &array[i];
> -
> -		for (j = 0; code && fmt->codes[j]; j++) {
> -			if (code == fmt->codes[j]) {
> -				ret = fmt;
> -				goto out;
> -			}
> -		}
> -	}
> -
> -out:
> -	return ret;
> +	return find_format(0, code, fmt_sel | PIXFMT_SEL_IPU, false);
>  }
>  EXPORT_SYMBOL_GPL(imx_media_find_ipu_format);
>  
>  int imx_media_enum_ipu_format(u32 *code, u32 index,
>  			      enum imx_pixfmt_sel fmt_sel)
>  {
> -	fmt_sel &= ~PIXFMT_SEL_BAYER;
> -
> -	switch (fmt_sel) {
> -	case PIXFMT_SEL_YUV:
> -		if (index >= NUM_IPU_YUV_FORMATS)
> -			return -EINVAL;
> -		*code = ipu_yuv_formats[index].codes[0];
> -		break;
> -	case PIXFMT_SEL_RGB:
> -		if (index >= NUM_IPU_RGB_FORMATS)
> -			return -EINVAL;
> -		*code = ipu_rgb_formats[index].codes[0];
> -		break;
> -	case PIXFMT_SEL_YUV_RGB:
> -		if (index >= NUM_IPU_YUV_FORMATS + NUM_IPU_RGB_FORMATS)
> -			return -EINVAL;
> -		if (index >= NUM_IPU_YUV_FORMATS) {
> -			index -= NUM_IPU_YUV_FORMATS;
> -			*code = ipu_rgb_formats[index].codes[0];
> -		} else {
> -			*code = ipu_yuv_formats[index].codes[0];
> -		}
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> +	return enum_format(NULL, code, index, fmt_sel | PIXFMT_SEL_IPU, false);
>  }
>  EXPORT_SYMBOL_GPL(imx_media_enum_ipu_format);
>  
> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> index ac7c521d8148..c61592750729 100644
> --- a/drivers/staging/media/imx/imx-media.h
> +++ b/drivers/staging/media/imx/imx-media.h
> @@ -83,6 +83,7 @@ enum imx_pixfmt_sel {
>  	PIXFMT_SEL_YUV   = BIT(0), /* select YUV formats */
>  	PIXFMT_SEL_RGB   = BIT(1), /* select RGB formats */
>  	PIXFMT_SEL_BAYER = BIT(2), /* select BAYER formats */
> +	PIXFMT_SEL_IPU   = BIT(3), /* select IPU-internal formats */
>  	PIXFMT_SEL_YUV_RGB = PIXFMT_SEL_YUV | PIXFMT_SEL_RGB,
>  	PIXFMT_SEL_ANY = PIXFMT_SEL_YUV | PIXFMT_SEL_RGB | PIXFMT_SEL_BAYER,
>  };

-- 
Regards,

Laurent Pinchart
