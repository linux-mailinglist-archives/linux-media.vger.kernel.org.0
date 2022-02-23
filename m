Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10B9D4C127D
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 13:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240348AbiBWMKw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 07:10:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240425AbiBWMKi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 07:10:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3F3A0BE8
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 04:09:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A368BDD;
        Wed, 23 Feb 2022 13:09:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645618188;
        bh=4U7N9mmMH8rSE4Y2fOyFXGVjR5TzsPe5p3Kltmjmavw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BbZaJPSFQSc72jzOFxdWHlJMT7J/iaAl6AqG4MalfzPZ/xbLsKqmQL1+mfXCNEphM
         VsvT0NRXVSnCdVOp3IVsj4tSqumOKwpEFPBHdMW7NPeLUQtXCQ6tWXyLhMHcShKPbv
         jar7M3iUxuzgt2B5JzlY/t1NbR2Pp5JG4Eorpd54=
Date:   Wed, 23 Feb 2022 14:09:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 27/27] media: ov5640: Move format mux config in format
Message-ID: <YhYkArPK+To6rXqD@pendragon.ideasonboard.com>
References: <20220223104034.91550-1-jacopo@jmondi.org>
 <20220223104034.91550-28-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220223104034.91550-28-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Feb 23, 2022 at 11:40:34AM +0100, Jacopo Mondi wrote:
> The image format produced by the sensor is controlled by two registers,
> whose values computation is open coded in ov5640_set_framefmt().
> 
> As we have a list of formats already, move the OV5640_REG_FORMAT_CONTROL00
> and OV5640_REG_ISP_FORMAT_MUX_CTRL register values to the static list
> of formats instead of open coding it.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 232 ++++++++++++++++++-------------------
>  1 file changed, 115 insertions(+), 117 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index f35006bcea3a..ef2de8c6f044 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -192,86 +192,142 @@ struct ov5640_pixfmt {
>  	u32 code;
>  	u32 colorspace;
>  	u8 bpp;
> +	u8 ctrl00;
> +	enum ov5640_format_mux mux;
>  };
>  
>  static const struct ov5640_pixfmt ov5640_dvp_formats[] = {
>  	{
> -		.code = MEDIA_BUS_FMT_JPEG_1X8,
> -		.colorspace = V4L2_COLORSPACE_JPEG,
> -		.bpp = 16,
> +		/* YUV422, YUYV */
> +		.code		= MEDIA_BUS_FMT_JPEG_1X8,
> +		.colorspace	= V4L2_COLORSPACE_JPEG,
> +		.bpp		= 16,
> +		.ctrl00		= 0x30,
> +		.mux		= OV5640_FMT_MUX_YUV422,
>  	}, {
> -		.code = MEDIA_BUS_FMT_UYVY8_2X8,
> -		.colorspace = V4L2_COLORSPACE_SRGB,
> -		.bpp = 16,
> +		/* YUV422, UYVY */
> +		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.bpp		= 16,
> +		.ctrl00		= 0x3f,
> +		.mux		= OV5640_FMT_MUX_YUV422,
>  	}, {
> -		.code = MEDIA_BUS_FMT_YUYV8_2X8,
> -		.colorspace = V4L2_COLORSPACE_SRGB,
> -		.bpp = 16,
> +		/* YUV422, YUYV */
> +		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.bpp		= 16,
> +		.ctrl00		= 0x30,
> +		.mux		= OV5640_FMT_MUX_YUV422,
>  	}, {
> -		.code = MEDIA_BUS_FMT_RGB565_2X8_LE,
> -		.colorspace = V4L2_COLORSPACE_SRGB,
> -		.bpp = 16,
> +		/* RGB565 {g[2:0],b[4:0]},{r[4:0],g[5:3]} */
> +		.code		= MEDIA_BUS_FMT_RGB565_2X8_LE,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.bpp		= 16,
> +		.ctrl00		= 0x6f,
> +		.mux		= OV5640_FMT_MUX_RGB,
>  	}, {
> -		.code = MEDIA_BUS_FMT_RGB565_2X8_BE,
> -		.colorspace = V4L2_COLORSPACE_SRGB,
> -		.bpp = 16,
> +		/* RGB565 {r[4:0],g[5:3]},{g[2:0],b[4:0]} */
> +		.code		= MEDIA_BUS_FMT_RGB565_2X8_BE,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.bpp		= 16,
> +		.ctrl00		= 0x61,
> +		.mux		= OV5640_FMT_MUX_RGB,
>  	}, {
> -		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> -		.colorspace = V4L2_COLORSPACE_SRGB,
> -		.bpp = 8,
> +		/* Raw, BGBG... / GRGR... */
> +		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.bpp		= 8,
> +		.ctrl00		= 0x00,
> +		.mux		= OV5640_FMT_MUX_RAW_DPC,
>  	}, {
> -		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> -		.colorspace = V4L2_COLORSPACE_SRGB,
> -		.bpp = 8
> +		/* Raw bayer, GBGB... / RGRG... */
> +		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.bpp		= 8,
> +		.ctrl00		= 0x01,
> +		.mux		= OV5640_FMT_MUX_RAW_DPC,
>  	}, {
> -		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> -		.colorspace = V4L2_COLORSPACE_SRGB,
> -		.bpp = 8,
> +		/* Raw bayer, GRGR... / BGBG... */
> +		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.bpp		= 8,
> +		.ctrl00		= 0x02,
> +		.mux		= OV5640_FMT_MUX_RAW_DPC,
>  	}, {
> -		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> -		.colorspace = V4L2_COLORSPACE_SRGB,
> -		.bpp = 8,
> +		/* Raw bayer, RGRG... / GBGB... */
> +		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.bpp		= 8,
> +		.ctrl00		= 0x03,
> +		.mux		= OV5640_FMT_MUX_RAW_DPC,
>  	},
>  	{ /* sentinel */ }
>  };
>  
>  static const struct ov5640_pixfmt ov5640_csi2_formats[] = {
>  	{
> -		.code = MEDIA_BUS_FMT_JPEG_1X8,
> -		.colorspace = V4L2_COLORSPACE_JPEG,
> -		.bpp = 16,
> +		/* YUV422, YUYV */
> +		.code		= MEDIA_BUS_FMT_JPEG_1X8,
> +		.colorspace	= V4L2_COLORSPACE_JPEG,
> +		.bpp		= 16,
> +		.ctrl00		= 0x30,
> +		.mux		= OV5640_FMT_MUX_YUV422,
>  	}, {
> -		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> -		.colorspace = V4L2_COLORSPACE_SRGB,
> -		.bpp = 16,
> +		/* YUV422, UYVY */
> +		.code		= MEDIA_BUS_FMT_UYVY8_1X16,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.bpp		= 16,
> +		.ctrl00		= 0x3f,
> +		.mux		= OV5640_FMT_MUX_YUV422,
>  	}, {
> -		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> -		.colorspace = V4L2_COLORSPACE_SRGB,
> -		.bpp = 16,
> +		/* YUV422, YUYV */
> +		.code		= MEDIA_BUS_FMT_YUYV8_1X16,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.bpp		= 16,
> +		.ctrl00		= 0x30,
> +		.mux		= OV5640_FMT_MUX_YUV422,
>  	}, {
> -		.code = MEDIA_BUS_FMT_RGB565_1X16,
> -		.colorspace = V4L2_COLORSPACE_SRGB,
> -		.bpp = 16,
> +		/* RGB565 {g[2:0],b[4:0]},{r[4:0],g[5:3]} */
> +		.code		= MEDIA_BUS_FMT_RGB565_1X16,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.bpp		= 16,
> +		.ctrl00		= 0x6f,
> +		.mux		= OV5640_FMT_MUX_RGB,
>  	}, {
> -		.code = MEDIA_BUS_FMT_BGR888_1X24,
> -		.colorspace = V4L2_COLORSPACE_SRGB,
> -		.bpp = 24,
> +		/* BGR888: RGB */
> +		.code		= MEDIA_BUS_FMT_BGR888_1X24,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.bpp		= 24,
> +		.ctrl00		= 0x23,
> +		.mux		= OV5640_FMT_MUX_RGB,
>  	}, {
> -		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> -		.colorspace = V4L2_COLORSPACE_SRGB,
> -		.bpp = 8,
> +		/* Raw, BGBG... / GRGR... */
> +		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.bpp		= 8,
> +		.ctrl00		= 0x00,
> +		.mux		= OV5640_FMT_MUX_RAW_DPC,
>  	}, {
> -		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> -		.colorspace = V4L2_COLORSPACE_SRGB,
> -		.bpp = 8
> +		/* Raw bayer, GBGB... / RGRG... */
> +		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.bpp		= 8,
> +		.ctrl00		= 0x01,
> +		.mux		= OV5640_FMT_MUX_RAW_DPC,
>  	}, {
> -		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> -		.colorspace = V4L2_COLORSPACE_SRGB,
> -		.bpp = 8,
> +		/* Raw bayer, GRGR... / BGBG... */
> +		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.bpp		= 8,
> +		.ctrl00		= 0x02,
> +		.mux		= OV5640_FMT_MUX_RAW_DPC,
>  	}, {
> -		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> -		.colorspace = V4L2_COLORSPACE_SRGB,
> -		.bpp = 8,
> +		/* Raw bayer, RGRG... / GBGB... */
> +		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.bpp		= 8,
> +		.ctrl00		= 0x03,
> +		.mux		= OV5640_FMT_MUX_RAW_DPC,
>  	},
>  	{ /* sentinel */ }
>  };
> @@ -2940,76 +2996,18 @@ static int ov5640_get_selection(struct v4l2_subdev *sd,
>  static int ov5640_set_framefmt(struct ov5640_dev *sensor,
>  			       struct v4l2_mbus_framefmt *format)
>  {
> +	const struct ov5640_pixfmt *pixfmt = ov5640_code_to_pixfmt(sensor,
> +								   format->code);
> +	bool is_jpeg = format->code == MEDIA_BUS_FMT_JPEG_1X8;
>  	int ret = 0;
> -	bool is_jpeg = false;
> -	u8 fmt, mux;
> -
> -	switch (format->code) {
> -	case MEDIA_BUS_FMT_UYVY8_1X16:
> -	case MEDIA_BUS_FMT_UYVY8_2X8:
> -		/* YUV422, UYVY */
> -		fmt = 0x3f;
> -		mux = OV5640_FMT_MUX_YUV422;
> -		break;
> -	case MEDIA_BUS_FMT_YUYV8_1X16:
> -	case MEDIA_BUS_FMT_YUYV8_2X8:
> -		/* YUV422, YUYV */
> -		fmt = 0x30;
> -		mux = OV5640_FMT_MUX_YUV422;
> -		break;
> -	case MEDIA_BUS_FMT_RGB565_2X8_LE:
> -	case MEDIA_BUS_FMT_RGB565_1X16:
> -		/* RGB565 {g[2:0],b[4:0]},{r[4:0],g[5:3]} */
> -		fmt = 0x6F;
> -		mux = OV5640_FMT_MUX_RGB;
> -		break;
> -	case MEDIA_BUS_FMT_RGB565_2X8_BE:
> -		/* RGB565 {r[4:0],g[5:3]},{g[2:0],b[4:0]} */
> -		fmt = 0x61;
> -		mux = OV5640_FMT_MUX_RGB;
> -		break;
> -	case MEDIA_BUS_FMT_BGR888_1X24:
> -		/* BGR888: RGB */
> -		fmt = 0x23;
> -		mux = OV5640_FMT_MUX_RGB;
> -		break;
> -	case MEDIA_BUS_FMT_JPEG_1X8:
> -		/* YUV422, YUYV */
> -		fmt = 0x30;
> -		mux = OV5640_FMT_MUX_YUV422;
> -		is_jpeg = true;
> -		break;
> -	case MEDIA_BUS_FMT_SBGGR8_1X8:
> -		/* Raw, BGBG... / GRGR... */
> -		fmt = 0x00;
> -		mux = OV5640_FMT_MUX_RAW_DPC;
> -		break;
> -	case MEDIA_BUS_FMT_SGBRG8_1X8:
> -		/* Raw bayer, GBGB... / RGRG... */
> -		fmt = 0x01;
> -		mux = OV5640_FMT_MUX_RAW_DPC;
> -		break;
> -	case MEDIA_BUS_FMT_SGRBG8_1X8:
> -		/* Raw bayer, GRGR... / BGBG... */
> -		fmt = 0x02;
> -		mux = OV5640_FMT_MUX_RAW_DPC;
> -		break;
> -	case MEDIA_BUS_FMT_SRGGB8_1X8:
> -		/* Raw bayer, RGRG... / GBGB... */
> -		fmt = 0x03;
> -		mux = OV5640_FMT_MUX_RAW_DPC;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
>  
>  	/* FORMAT CONTROL00: YUV and RGB formatting */
> -	ret = ov5640_write_reg(sensor, OV5640_REG_FORMAT_CONTROL00, fmt);
> +	ret = ov5640_write_reg(sensor, OV5640_REG_FORMAT_CONTROL00, pixfmt->ctrl00);

Line wrap ? Same below.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	if (ret)
>  		return ret;
>  
>  	/* FORMAT MUX CONTROL: ISP YUV or RGB */
> -	ret = ov5640_write_reg(sensor, OV5640_REG_ISP_FORMAT_MUX_CTRL, mux);
> +	ret = ov5640_write_reg(sensor, OV5640_REG_ISP_FORMAT_MUX_CTRL, pixfmt->mux);
>  	if (ret)
>  		return ret;
>  

-- 
Regards,

Laurent Pinchart
