Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 482684A5E3D
	for <lists+linux-media@lfdr.de>; Tue,  1 Feb 2022 15:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239246AbiBAO2K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Feb 2022 09:28:10 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:36088 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233570AbiBAO2J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Feb 2022 09:28:09 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8C97332;
        Tue,  1 Feb 2022 15:28:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643725688;
        bh=k5LKeZ/XslWExSvtlkn/l8oX8y/xq5u4d/tB2j4p+V0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v63YnPeuWAr4t+vzo4e2JCtyhtw6EK4jjM6GPswQBVWhEXnavYzmhO6xCBsfJpa8U
         bjKOJJaYbv4UZSMdKvpMfzIdy/+Xj9j/soaUhDv0LHuhL6gx9P3JeLw0mF0LKDliIr
         E+9K34LLljaPhdpNtzl372/9/Id959DyCGmnWRbg=
Date:   Tue, 1 Feb 2022 16:27:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 04/21] media: ov5640: Associate bpp with formats
Message-ID: <YflDYLjZXw1T/Dcz@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131143245.128089-5-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131143245.128089-5-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Jan 31, 2022 at 03:32:28PM +0100, Jacopo Mondi wrote:
> Associate the bit depth to each format supported by the sensor.
> 
> The bpp will be used to calculate the line length.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 39 ++++++++++++++++++++++++--------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index fc3e4f61709c..8322b99eb2b7 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -165,24 +165,35 @@ enum ov5640_format_mux {
>  	OV5640_FMT_MUX_RAW_CIP,
>  };
>  
> -struct ov5640_pixfmt {
> +static const struct ov5640_pixfmt {
>  	u32 code;
>  	u32 colorspace;
> +	u8 bpp;
> +} ov5640_formats[] = {
> +	{ MEDIA_BUS_FMT_JPEG_1X8, V4L2_COLORSPACE_JPEG, 16},

s/}/ }/

and possibly

	{
		.code = MEDIA_BUS_FMT_JPEG_1X8,
		.colorspace = V4L2_COLORSPACE_JPEG,
		.bpp = 16,
	},

One day we'll have centralized data...

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	{ MEDIA_BUS_FMT_UYVY8_2X8, V4L2_COLORSPACE_SRGB, 16},
> +	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_COLORSPACE_SRGB, 16},
> +	{ MEDIA_BUS_FMT_YUYV8_2X8, V4L2_COLORSPACE_SRGB, 16},
> +	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_COLORSPACE_SRGB, 16,},
> +	{ MEDIA_BUS_FMT_RGB565_2X8_LE, V4L2_COLORSPACE_SRGB, 16},
> +	{ MEDIA_BUS_FMT_RGB565_2X8_BE, V4L2_COLORSPACE_SRGB, 16},
> +	{ MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_COLORSPACE_SRGB, 8},
> +	{ MEDIA_BUS_FMT_SGBRG8_1X8, V4L2_COLORSPACE_SRGB, 8},
> +	{ MEDIA_BUS_FMT_SGRBG8_1X8, V4L2_COLORSPACE_SRGB, 8},
> +	{ MEDIA_BUS_FMT_SRGGB8_1X8, V4L2_COLORSPACE_SRGB, 8},
>  };
>  
> -static const struct ov5640_pixfmt ov5640_formats[] = {
> -	{ MEDIA_BUS_FMT_JPEG_1X8, V4L2_COLORSPACE_JPEG, },
> -	{ MEDIA_BUS_FMT_UYVY8_2X8, V4L2_COLORSPACE_SRGB, },
> -	{ MEDIA_BUS_FMT_UYVY8_1X16, V4L2_COLORSPACE_SRGB, },
> -	{ MEDIA_BUS_FMT_YUYV8_2X8, V4L2_COLORSPACE_SRGB, },
> -	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_COLORSPACE_SRGB, },
> -	{ MEDIA_BUS_FMT_RGB565_2X8_LE, V4L2_COLORSPACE_SRGB, },
> -	{ MEDIA_BUS_FMT_RGB565_2X8_BE, V4L2_COLORSPACE_SRGB, },
> -	{ MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_COLORSPACE_SRGB, },
> -	{ MEDIA_BUS_FMT_SGBRG8_1X8, V4L2_COLORSPACE_SRGB, },
> -	{ MEDIA_BUS_FMT_SGRBG8_1X8, V4L2_COLORSPACE_SRGB, },
> -	{ MEDIA_BUS_FMT_SRGGB8_1X8, V4L2_COLORSPACE_SRGB, },
> -};
> +static u32 ov5640_code_to_bpp(u32 code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ov5640_formats); ++i) {
> +		if (ov5640_formats[i].code == code)
> +			return ov5640_formats[i].bpp;
> +	}
> +
> +	return 0;
> +}
>  
>  /*
>   * FIXME: remove this when a subdev API becomes available

-- 
Regards,

Laurent Pinchart
