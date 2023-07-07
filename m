Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F30374B4A4
	for <lists+linux-media@lfdr.de>; Fri,  7 Jul 2023 17:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbjGGPxA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jul 2023 11:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjGGPw7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jul 2023 11:52:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5258211B
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 08:52:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-100-11-nat.elisa-mobile.fi [85.76.100.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D41B56D;
        Fri,  7 Jul 2023 17:52:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688745130;
        bh=1y8/KeXPvLjvZKkoZlKq1+iD11J0fZj/idSdRnlDJXg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NJKEgNpJ7e8E2VSdWJ4wuXO9215fgFHKg/h0IdB/b3BFIgtSi9zScW4A823LfvZ8c
         MWuzfT3kltM5eJesv5vTgRcZw8jhf05KFQ93UxEPBkW/Vw6Ja2ru9KHiTf1O85lJ6U
         vn/yWV+7tUDbaqeB19LMtmFhEMdWoC9+LMfcXtqc=
Date:   Fri, 7 Jul 2023 18:52:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: Re: [PATCH 4/5] media: i2c: imx219: Simplify format assignment
Message-ID: <20230707155253.GH15801@pendragon.ideasonboard.com>
References: <20230704103611.149631-1-jacopo.mondi@ideasonboard.com>
 <20230704104057.149837-1-jacopo.mondi@ideasonboard.com>
 <20230704104057.149837-5-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230704104057.149837-5-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Jul 04, 2023 at 12:40:56PM +0200, Jacopo Mondi wrote:
> The set_fmt and init_cfg functions both fills a v4l2_mbus_framefmt
> instance, passing in the mode and the media bus code. While set_fmt
> uses function helpers, init_cfg open-codes the assignments.
> 
> Simplify the format initialization by moving it to a common helper.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 56 ++++++++++++++------------------------
>  1 file changed, 21 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 127ecee3643d..c1246bd23b0d 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -670,6 +670,23 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops = {
>  	.s_ctrl = imx219_set_ctrl,
>  };
>  
> +static void imx219_update_pad_format(struct imx219 *imx219,
> +				     const struct imx219_mode *mode,
> +				     struct v4l2_mbus_framefmt *fmt, u32 code)
> +{
> +	/* Bayer order varies with flips */
> +	fmt->code = imx219_get_format_code(imx219, code);
> +	fmt->width = mode->width;
> +	fmt->height = mode->height;
> +	fmt->field = V4L2_FIELD_NONE;
> +	fmt->colorspace = V4L2_COLORSPACE_SRGB;

Candidate for a separate fix: use V4L2_COLORSPACE_RAW.

> +	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> +	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> +							  fmt->colorspace,
> +							  fmt->ycbcr_enc);

And this can then be V4L2_QUANTIZATION_FULL_RANGE.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> +}
> +
>  static int imx219_init_cfg(struct v4l2_subdev *sd,
>  			   struct v4l2_subdev_state *state)
>  {
> @@ -679,17 +696,8 @@ static int imx219_init_cfg(struct v4l2_subdev *sd,
>  
>  	/* Initialize try_fmt */
>  	format = v4l2_subdev_get_pad_format(sd, state, 0);
> -	format->width = supported_modes[0].width;
> -	format->height = supported_modes[0].height;
> -	format->code = imx219_get_format_code(imx219,
> -					      MEDIA_BUS_FMT_SRGGB10_1X10);
> -	format->field = V4L2_FIELD_NONE;
> -	format->colorspace = V4L2_COLORSPACE_SRGB;
> -	format->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(format->colorspace);
> -	format->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> -							  format->colorspace,
> -							  format->ycbcr_enc);
> -	format->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(format->colorspace);
> +	imx219_update_pad_format(imx219, &supported_modes[0], format,
> +				 MEDIA_BUS_FMT_SRGGB10_1X10);
>  
>  	/* Initialize try_crop rectangle. */
>  	try_crop = v4l2_subdev_get_pad_crop(sd, state, 0);
> @@ -737,26 +745,6 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -static void imx219_reset_colorspace(struct v4l2_mbus_framefmt *fmt)
> -{
> -	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> -	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> -	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> -							  fmt->colorspace,
> -							  fmt->ycbcr_enc);
> -	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> -}
> -
> -static void imx219_update_pad_format(struct imx219 *imx219,
> -				     const struct imx219_mode *mode,
> -				     struct v4l2_subdev_format *fmt)
> -{
> -	fmt->format.width = mode->width;
> -	fmt->format.height = mode->height;
> -	fmt->format.field = V4L2_FIELD_NONE;
> -	imx219_reset_colorspace(&fmt->format);
> -}
> -
>  static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_format *fmt)
> @@ -772,15 +760,13 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	if (i >= ARRAY_SIZE(imx219_mbus_formats))
>  		i = 0;
>  
> -	/* Bayer order varies with flips */
> -	fmt->format.code = imx219_get_format_code(imx219, imx219_mbus_formats[i]);
> -
>  	mode = v4l2_find_nearest_size(supported_modes,
>  				      ARRAY_SIZE(supported_modes),
>  				      width, height,
>  				      fmt->format.width, fmt->format.height);
>  
> -	imx219_update_pad_format(imx219, mode, fmt);
> +	imx219_update_pad_format(imx219, mode, &fmt->format,
> +				 imx219_mbus_formats[i]);
>  
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		imx219->mode = mode;

-- 
Regards,

Laurent Pinchart
