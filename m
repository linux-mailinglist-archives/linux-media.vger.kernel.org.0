Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD9F4A9279
	for <lists+linux-media@lfdr.de>; Fri,  4 Feb 2022 03:55:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348956AbiBDCzN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Feb 2022 21:55:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39002 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbiBDCzN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Feb 2022 21:55:13 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8296D472;
        Fri,  4 Feb 2022 03:55:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643943311;
        bh=U/hteRTGxcdB5ipOaRT8RZ8pS9XOARxbIStomha2s0I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FAFBXDmIddRoJbWbr6MLRJCcXLgD6ihTFYvoma/W6fsKdEK2RgQsYhqOHZeOZVg5G
         3CLw/Rm9dum6TslWKzfawhiqmoxOOnnp1wZbRlXXkgcqcXHNtQXPzn4hENWSEPeR4i
         EZiKkPI7lWsIUjwiX60y/Gjo3fxjoQMx89GkisVs=
Date:   Fri, 4 Feb 2022 04:54:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Cc:     dave.stevenson@raspberrypi.com, devicetree@vger.kernel.org,
        kernel-list@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, lukasz@jany.st,
        mchehab@kernel.org, naush@raspberrypi.com, robh@kernel.org,
        tomi.valkeinen@ideasonboard.com, nsaenz@kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Subject: Re: [RFC PATCH v4 08/12] media: imx219: Switch from open to init_cfg
Message-ID: <YfyVdxH3mvDDJhGb@pendragon.ideasonboard.com>
References: <20220203175009.558868-1-jeanmichel.hautbois@ideasonboard.com>
 <20220203175009.558868-9-jeanmichel.hautbois@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220203175009.558868-9-jeanmichel.hautbois@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jean-Michel,

Thank you for the patch.

On Thu, Feb 03, 2022 at 06:50:05PM +0100, Jean-Michel Hautbois wrote:
> Use the init_cfg pad level operation instead of the internal subdev
> open operation to set default formats on the pads.
> While at it, make the imx219_pad_ops more easier to read.
> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 138 +++++++++++++++++++++----------------
>  1 file changed, 80 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 74dba5e61201..b68d35046725 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -118,6 +118,10 @@
>  #define IMX219_PIXEL_ARRAY_WIDTH	3280U
>  #define IMX219_PIXEL_ARRAY_HEIGHT	2464U
>  
> +/* Embedded metadata stream structure */
> +#define IMX219_EMBEDDED_LINE_WIDTH 16384
> +#define IMX219_NUM_EMBEDDED_LINES 1

Align the values like done for the previous macros.

> +
>  struct imx219_reg {
>  	u16 address;
>  	u8 val;
> @@ -668,51 +672,6 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
>  	return imx219_mbus_formats[i];
>  }
>  
> -static void imx219_set_default_format(struct imx219 *imx219)
> -{
> -	struct v4l2_mbus_framefmt *fmt;
> -
> -	fmt = &imx219->fmt;
> -	fmt->code = MEDIA_BUS_FMT_SRGGB10_1X10;
> -	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> -	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> -	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> -							  fmt->colorspace,
> -							  fmt->ycbcr_enc);
> -	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> -	fmt->width = supported_modes[0].width;
> -	fmt->height = supported_modes[0].height;
> -	fmt->field = V4L2_FIELD_NONE;
> -}
> -
> -static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> -{
> -	struct imx219 *imx219 = to_imx219(sd);
> -	struct v4l2_mbus_framefmt *try_fmt =
> -		v4l2_subdev_get_try_format(sd, fh->state, 0);
> -	struct v4l2_rect *try_crop;
> -
> -	mutex_lock(&imx219->mutex);
> -
> -	/* Initialize try_fmt */
> -	try_fmt->width = supported_modes[0].width;
> -	try_fmt->height = supported_modes[0].height;
> -	try_fmt->code = imx219_get_format_code(imx219,
> -					       MEDIA_BUS_FMT_SRGGB10_1X10);
> -	try_fmt->field = V4L2_FIELD_NONE;
> -
> -	/* Initialize try_crop rectangle. */
> -	try_crop = v4l2_subdev_get_try_crop(sd, fh->state, 0);
> -	try_crop->top = IMX219_PIXEL_ARRAY_TOP;
> -	try_crop->left = IMX219_PIXEL_ARRAY_LEFT;
> -	try_crop->width = IMX219_PIXEL_ARRAY_WIDTH;
> -	try_crop->height = IMX219_PIXEL_ARRAY_HEIGHT;
> -
> -	mutex_unlock(&imx219->mutex);
> -
> -	return 0;
> -}
> -
>  static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct imx219 *imx219 =
> @@ -802,6 +761,76 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops = {
>  	.s_ctrl = imx219_set_ctrl,
>  };
>  
> +static void imx219_init_formats(struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_mbus_framefmt *format;
> +
> +	format = v4l2_state_get_stream_format(state, 0, 0);
> +	format->code = imx219_mbus_formats[0];
> +	format->width = supported_modes[0].width;
> +	format->height = supported_modes[0].height;
> +	format->field = V4L2_FIELD_NONE;
> +	format->colorspace = V4L2_COLORSPACE_RAW;
> +
> +	if (state->routing.routes[1].flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE) {
> +		format = v4l2_state_get_stream_format(state, 0, 1);
> +		format->code = MEDIA_BUS_FMT_METADATA_8;
> +		format->width = IMX219_EMBEDDED_LINE_WIDTH;
> +		format->height = 1;
> +		format->field = V4L2_FIELD_NONE;
> +		format->colorspace = V4L2_COLORSPACE_DEFAULT;
> +	}
> +}
> +
> +static int _imx219_set_routing(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_route routes[] = {
> +		{
> +			.source_pad = 0,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
> +				 V4L2_SUBDEV_ROUTE_FL_SOURCE |
> +				 V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +		{
> +			.source_pad = 0,
> +			.source_stream = 1,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_SOURCE |
> +				 V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		}
> +	};
> +
> +	struct v4l2_subdev_krouting routing = {
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
> +
> +	int ret;
> +
> +	ret = v4l2_subdev_set_routing(sd, state, &routing);
> +	if (ret)
> +		return ret;
> +
> +	imx219_init_formats(state);
> +
> +	return 0;
> +}
> +
> +static int imx219_init_cfg(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *state)
> +{
> +	int ret;
> +
> +	v4l2_subdev_lock_state(state);
> +
> +	ret = _imx219_set_routing(sd, state);

Adding routing support isn't mentioned in the commit message. Stick to
switching to .init_cfg() in this patch, and add routing support
separately.

> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
>  static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
> @@ -1255,11 +1284,12 @@ static const struct v4l2_subdev_video_ops imx219_video_ops = {
>  };
>  
>  static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
> -	.enum_mbus_code = imx219_enum_mbus_code,
> -	.get_fmt = imx219_get_pad_format,
> -	.set_fmt = imx219_set_pad_format,
> -	.get_selection = imx219_get_selection,
> -	.enum_frame_size = imx219_enum_frame_size,
> +	.init_cfg		= imx219_init_cfg,
> +	.enum_mbus_code		= imx219_enum_mbus_code,
> +	.get_fmt		= imx219_get_pad_format,
> +	.set_fmt		= imx219_set_pad_format,
> +	.get_selection		= imx219_get_selection,
> +	.enum_frame_size	= imx219_enum_frame_size,
>  };
>  
>  static const struct v4l2_subdev_ops imx219_subdev_ops = {
> @@ -1268,10 +1298,6 @@ static const struct v4l2_subdev_ops imx219_subdev_ops = {
>  	.pad = &imx219_pad_ops,
>  };
>  
> -static const struct v4l2_subdev_internal_ops imx219_internal_ops = {
> -	.open = imx219_open,
> -};
> -
>  /* Initialize control handlers */
>  static int imx219_init_controls(struct imx219 *imx219)
>  {
> @@ -1520,7 +1546,6 @@ static int imx219_probe(struct i2c_client *client)
>  		goto error_power_off;
>  
>  	/* Initialize subdev */
> -	imx219->sd.internal_ops = &imx219_internal_ops;
>  	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>  			    V4L2_SUBDEV_FL_HAS_EVENTS;
>  	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> @@ -1528,9 +1553,6 @@ static int imx219_probe(struct i2c_client *client)
>  	/* Initialize source pad */
>  	imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
>  
> -	/* Initialize default format */
> -	imx219_set_default_format(imx219);

This isn't right, you're removing initialization of the default
format. Patch 11/12 fixes it, but this one breaks bisection, which isn't
good.

> -
>  	ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
>  	if (ret) {
>  		dev_err(dev, "failed to init entity pads: %d\n", ret);

-- 
Regards,

Laurent Pinchart
