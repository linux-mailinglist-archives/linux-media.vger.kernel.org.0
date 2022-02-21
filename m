Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 007B94BD743
	for <lists+linux-media@lfdr.de>; Mon, 21 Feb 2022 08:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346106AbiBUH0a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Feb 2022 02:26:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345979AbiBUHZt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Feb 2022 02:25:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDFBB0;
        Sun, 20 Feb 2022 23:25:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 959B8482;
        Mon, 21 Feb 2022 08:25:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645428311;
        bh=QzrKYMGmSk41w9hmcPhoY/HYYkB0EivAExnARRS54CQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dy5yOrtuU2YAsiAuof4cmstmqwW8UJUidYNzgO2kWw0cHDhU9d+f1RPEaGKT3LaDf
         j1gByIsVX3HSTi12/WvNCyeChC6fdmLUzIztzsi9CyIRQa4skZgdeuO5wjn6WfV2wL
         V6/h7pTFsoHtfzN+z+SDwgNLSYFTrtDct/PJ1Q7M=
Date:   Mon, 21 Feb 2022 09:25:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Cc:     dave.stevenson@raspberrypi.com, devicetree@vger.kernel.org,
        kernel-list@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, lukasz@jany.st,
        mchehab@kernel.org, naush@raspberrypi.com, robh@kernel.org,
        tomi.valkeinen@ideasonboard.com,
        bcm-kernel-feedback-list@broadcom.com, stefan.wahren@i2se.com
Subject: Re: [PATCH v5 11/11] media: imx219: Add support for the V4L2 subdev
 active state
Message-ID: <YhM+TgcOgbyXgs/x@pendragon.ideasonboard.com>
References: <20220208155027.891055-1-jeanmichel.hautbois@ideasonboard.com>
 <20220208155027.891055-12-jeanmichel.hautbois@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220208155027.891055-12-jeanmichel.hautbois@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jean-Michel,

Thank you for the patch.

On Tue, Feb 08, 2022 at 04:50:27PM +0100, Jean-Michel Hautbois wrote:
> Now that we have multiplexed streams support in the V4L2 API, add
> support for the subdev active state in the sensor.
> 
> In order to use state to manage the active configuration, we need to
> initialize the subdevice state with a call to
> v4l2_subdev_init_finalize() before registering it. The call to
> v4l2_subdev_cleanup() is also required to release the resources before
> unregistering.
> 
> Accessing the configuration is then done after a call to
> v4l2_subdev_lock_state() and the set_fmt operation can then call
> v4l2_state_get_stream_format() directly.
> 
> The get_fmt operation does not need to be complex, and a simple call to
> v4l2_subdev_get_fmt will do the trick, as it will grab the configured
> format based on the state.
> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 151 +++++++++++++++++++------------------
>  1 file changed, 77 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index f005ad8d2124..f6322f39c3f1 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -887,78 +887,43 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_frame_size_enum *fse)
>  {
> -	struct imx219 *imx219 = to_imx219(sd);
> -	u32 code;
> -
> -	if (fse->index >= ARRAY_SIZE(supported_modes))
> -		return -EINVAL;
> -
> -	mutex_lock(&imx219->mutex);
> -	code = imx219_get_format_code(imx219, fse->code);
> -	mutex_unlock(&imx219->mutex);
> -	if (fse->code != code)
> -		return -EINVAL;
> -
> -	fse->min_width = supported_modes[fse->index].width;
> -	fse->max_width = fse->min_width;
> -	fse->min_height = supported_modes[fse->index].height;
> -	fse->max_height = fse->min_height;
> +	unsigned int i;
>  
> -	return 0;
> -}
> +	if (fse->stream == 0) {
> +		for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats); ++i) {
> +			if (imx219_mbus_formats[i] == fse->code)
> +				break;
> +		}
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
> +		if (i == ARRAY_SIZE(imx219_mbus_formats))
> +			return -EINVAL;
>  
> -static void imx219_update_pad_format(struct imx219 *imx219,
> -				     const struct imx219_mode *mode,
> -				     struct v4l2_subdev_format *fmt)
> -{
> -	fmt->format.width = mode->width;
> -	fmt->format.height = mode->height;
> -	fmt->format.field = V4L2_FIELD_NONE;
> -	imx219_reset_colorspace(&fmt->format);
> -}
> +		if (fse->index >= ARRAY_SIZE(supported_modes))
> +			return -EINVAL;
>  
> -static int __imx219_get_pad_format(struct imx219 *imx219,
> -				   struct v4l2_subdev_state *sd_state,
> -				   struct v4l2_subdev_format *fmt)
> -{
> -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		struct v4l2_mbus_framefmt *try_fmt =
> -			v4l2_subdev_get_try_format(&imx219->sd, sd_state,
> -						   fmt->pad);
> -		/* update the code which could change due to vflip or hflip: */
> -		try_fmt->code = imx219_get_format_code(imx219, try_fmt->code);
> -		fmt->format = *try_fmt;
> +		fse->min_width  = supported_modes[fse->index].width;
> +		fse->max_width  = fse->min_width;
> +		fse->max_height = supported_modes[fse->index].height;
> +		fse->min_height = fse->max_height;
>  	} else {
> -		imx219_update_pad_format(imx219, imx219->mode, fmt);
> -		fmt->format.code = imx219_get_format_code(imx219,
> -							  imx219->fmt.code);
> +		if (fse->code != MEDIA_BUS_FMT_METADATA_8)
> +			return -EINVAL;
> +
> +		fse->min_width = IMX219_EMBEDDED_LINE_WIDTH;
> +		fse->max_width = fse->min_width;
> +		fse->min_height = IMX219_NUM_EMBEDDED_LINES;
> +		fse->max_height = fse->min_height;
>  	}
>  
>  	return 0;
>  }
>  
> -static int imx219_get_pad_format(struct v4l2_subdev *sd,
> -				 struct v4l2_subdev_state *sd_state,
> -				 struct v4l2_subdev_format *fmt)
> +static void imx219_update_metadata_pad_format(struct v4l2_subdev_format *fmt)
>  {
> -	struct imx219 *imx219 = to_imx219(sd);
> -	int ret;
> -
> -	mutex_lock(&imx219->mutex);
> -	ret = __imx219_get_pad_format(imx219, sd_state, fmt);
> -	mutex_unlock(&imx219->mutex);
> -
> -	return ret;
> +	fmt->format.width = IMX219_EMBEDDED_LINE_WIDTH;
> +	fmt->format.height = IMX219_NUM_EMBEDDED_LINES;
> +	fmt->format.code = MEDIA_BUS_FMT_METADATA_8;
> +	fmt->format.field = V4L2_FIELD_NONE;
>  }
>  
>  static int imx219_set_pad_format(struct v4l2_subdev *sd,
> @@ -966,32 +931,58 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_format *fmt)
>  {
>  	struct imx219 *imx219 = to_imx219(sd);
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
>  	const struct imx219_mode *mode;
> -	struct v4l2_mbus_framefmt *framefmt;
> +	struct v4l2_mbus_framefmt *format;
>  	int exposure_max, exposure_def, hblank;
>  	unsigned int i;
> +	int ret = 0;
>  
>  	mutex_lock(&imx219->mutex);
>  
> +	if (fmt->pad != 0) {
> +		dev_err(&client->dev, "%s Could not get pad %d\n", __func__,
> +			fmt->pad);

Drop this message.

> +		ret = -EINVAL;
> +		goto done;
> +	}
> +
> +	if (fmt->stream == 1) {
> +		/* Only one embedded data mode is supported */
> +		imx219_update_metadata_pad_format(fmt);

		return v4l2_subdev_get_fmt(sd, sd_state, fmt);

will be simpler. You can drop the imx219_update_metadata_pad_format()
function. And move the mutex_lock() lower, after all the code that
doesn't touch fields of the imx219 structure.

> +		ret = 0;

Not needed.

> +		goto done;
> +	}
> +
>  	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats); i++)
>  		if (imx219_mbus_formats[i] == fmt->format.code)
>  			break;
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
> -	imx219_update_pad_format(imx219, mode, fmt);
> -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
> -		*framefmt = fmt->format;
> -	} else if (imx219->mode != mode ||
> -		   imx219->fmt.code != fmt->format.code) {
> +
> +	v4l2_subdev_lock_state(sd_state);
> +
> +	/* Update the stored format and return it. */
> +	format = v4l2_state_get_stream_format(sd_state, fmt->pad, fmt->stream);
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE && imx219->streaming) {
> +		ret = -EBUSY;
> +		goto err_state;
> +	}
> +
> +	/* Bayer order varies with flips */
> +	format->code = imx219_get_format_code(imx219, imx219_mbus_formats[i]);
> +	format->width = mode->width;
> +	format->height = mode->height;
> +	/* Bayer order varies with flips */
> +	fmt->format = *format;
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		imx219->fmt = fmt->format;

The whole point of using the active state is that you don't need to
store the format in the imx219 structure anymore.

This patch does too much. I'm tempted to ask you to first switch to
usage of the active state, even before adding routing support, then add
routing support without the embedded data stream, and finally add
embedded data support.

>  		imx219->mode = mode;
>  		/* Update limits and set FPS to default */
> @@ -1018,9 +1009,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  					 hblank);
>  	}
>  
> +err_state:
> +	v4l2_subdev_unlock_state(sd_state);
> +done:
>  	mutex_unlock(&imx219->mutex);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int imx219_set_framefmt(struct imx219 *imx219)
> @@ -1322,7 +1316,7 @@ static const struct v4l2_subdev_video_ops imx219_video_ops = {
>  static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
>  	.init_cfg		= imx219_init_cfg,
>  	.enum_mbus_code		= imx219_enum_mbus_code,
> -	.get_fmt		= imx219_get_pad_format,
> +	.get_fmt		= v4l2_subdev_get_fmt,
>  	.set_fmt		= imx219_set_pad_format,
>  	.get_selection		= imx219_get_selection,
>  	.set_routing		= imx219_set_routing,
> @@ -1602,10 +1596,16 @@ static int imx219_probe(struct i2c_client *client)
>  		goto error_handler_free;
>  	}
>  
> +	ret = v4l2_subdev_init_finalize(sd);
> +	if (ret) {
> +		dev_err(dev, "failed to finalize sensor init: %d\n", ret);
> +		goto error_media_entity;
> +	}
> +
>  	ret = v4l2_async_register_subdev_sensor(sd);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to register sensor sub-device: %d\n", ret);
> -		goto error_media_entity;
> +		goto error_free_state;
>  	}
>  
>  	/* Enable runtime PM and turn off the device */
> @@ -1615,6 +1615,8 @@ static int imx219_probe(struct i2c_client *client)
>  
>  	return 0;
>  
> +error_free_state:

error_subdev_cleanup:

> +	v4l2_subdev_cleanup(sd);
>  error_media_entity:
>  	media_entity_cleanup(&sd->entity);
>  
> @@ -1633,6 +1635,7 @@ static int imx219_remove(struct i2c_client *client)
>  	struct imx219 *imx219 = to_imx219(sd);
>  
>  	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
>  	media_entity_cleanup(&sd->entity);
>  	imx219_free_controls(imx219);
>  

-- 
Regards,

Laurent Pinchart
