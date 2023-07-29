Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEEC7680B7
	for <lists+linux-media@lfdr.de>; Sat, 29 Jul 2023 19:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjG2RNB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jul 2023 13:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjG2RM6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jul 2023 13:12:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF77129
        for <linux-media@vger.kernel.org>; Sat, 29 Jul 2023 10:12:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 033D2B1;
        Sat, 29 Jul 2023 19:11:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690650715;
        bh=cRL3fcGDxs109g81/OtB5Y2I/pswe3wIf5+K5/YLgc8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tvg46fMPX6k1Zpz2LfBzShDML0ls5D+SZEGpSZBeA87WiNQMFT93MRCmOEOqWs+wC
         /bKjuXXZXci0sxaGJeDWtJz4vtgnuoE10JQr/aknhwhTVC3q6E1+Bx/qSsdzU6VNq6
         R9+R2MbbhnRxr/5N94XnlNqdfiFkT3EwNmmbWrP4=
Date:   Sat, 29 Jul 2023 20:13:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: Re: [PATCH v2 4/7] media: i2c: imx219: Fix colorspace info
Message-ID: <20230729171300.GC5094@pendragon.ideasonboard.com>
References: <20230710155203.92366-1-jacopo.mondi@ideasonboard.com>
 <20230710155203.92366-5-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230710155203.92366-5-jacopo.mondi@ideasonboard.com>
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


On Mon, Jul 10, 2023 at 05:52:00PM +0200, Jacopo Mondi wrote:
> The IMX219 is a RAW sensor. Fix the colorspace configuration by
> using V4L2_COLORSPACE_RAW and adjust the quantization and transfer
> function values. Drop ycbcr_enc as it doesn't apply to RAW sensors.

So this addresses part of my comments for 3/7, nice :-)

> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 26 +++++++++-----------------
>  1 file changed, 9 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index cd43a897391c..6963e24e1bc2 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -597,15 +597,12 @@ static void imx219_set_default_format(struct imx219 *imx219)
>  
>  	fmt = &imx219->fmt;
>  	fmt->code = MEDIA_BUS_FMT_SRGGB10_1X10;
> -	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> -	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> -	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> -							  fmt->colorspace,
> -							  fmt->ycbcr_enc);
> -	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> +	fmt->colorspace = V4L2_COLORSPACE_RAW;
> +	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>  	fmt->width = supported_modes[0].width;
>  	fmt->height = supported_modes[0].height;
>  	fmt->field = V4L2_FIELD_NONE;
> +	fmt->xfer_func = V4L2_XFER_FUNC_NONE;

Any reason to not group xfer_func with colorspace and quantization ?

>  }
>  
>  static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> @@ -714,12 +711,10 @@ static int imx219_init_cfg(struct v4l2_subdev *sd,
>  	format->code = imx219_get_format_code(imx219,
>  					      MEDIA_BUS_FMT_SRGGB10_1X10);
>  	format->field = V4L2_FIELD_NONE;
> -	format->colorspace = V4L2_COLORSPACE_SRGB;
> +	format->colorspace = V4L2_COLORSPACE_RAW;
>  	format->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(format->colorspace);

You're keeping ycbcr_enc here while you've dropped it in the two other
locations. Was that on purpose ?

While the encoding doesn't apply to raw formats, I think it should still
be set explicitly, or it will end up having a random value.

> -	format->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> -							     format->colorspace,
> -							     format->ycbcr_enc);
> -	format->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(format->colorspace);
> +	format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	format->xfer_func = V4L2_XFER_FUNC_NONE;
>  
>  	/* Initialize crop rectangle. */
>  	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
> @@ -775,12 +770,9 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
>  
>  static void imx219_reset_colorspace(struct v4l2_mbus_framefmt *fmt)
>  {
> -	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> -	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> -	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> -							  fmt->colorspace,
> -							  fmt->ycbcr_enc);
> -	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> +	fmt->colorspace = V4L2_COLORSPACE_RAW;
> +	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
>  }
>  
>  static void imx219_update_pad_format(struct imx219 *imx219,

-- 
Regards,

Laurent Pinchart
