Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D39B91B9421
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 23:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgDZVGG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Apr 2020 17:06:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48032 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgDZVGG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Apr 2020 17:06:06 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A4234F7;
        Sun, 26 Apr 2020 23:06:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587935163;
        bh=pNmEPDUTpB1M++wOk0f15xraBtP5GqzgQle0fAlKHQs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kK74bQMB4JRNoPLovX3ysxb6fNotR6Nm9dC4JvS/14A+wQSSHGfaq9G0ibfeY4Nlz
         eBW66j/0tguFrd3II3NrUUPxqUGcD7Y3Dr/Q31hjiS7n/rVSkinMVoXGDo6Tk2RH1K
         KyCW1vbZlMVenSxTADpMyIqhGPgYJa7Z6mBqnCS4=
Date:   Mon, 27 Apr 2020 00:05:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v2] media: i2c: imx219: Implement get_selection
Message-ID: <20200426210548.GD31313@pendragon.ideasonboard.com>
References: <20200426205250.305320-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200426205250.305320-1-jacopo@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Sun, Apr 26, 2020 at 10:52:50PM +0200, Jacopo Mondi wrote:
> Implement the get_selection pad operation for the IMX219 sensor driver.
> The supported targets report the sensor's native size, the crop default
> rectangle and the crop rectangle.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> ---
> v1->v2:
> - Add crop rectangle for 640x480 mode that was missing in v1
> - Rework get selection function as suggested by Laurent
> - Add Laurent's tag
> ---
>  drivers/media/i2c/imx219.c | 97 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index cb03bdec1f9c..2744669fb419 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -112,6 +112,14 @@
>  #define IMX219_TESTP_BLUE_DEFAULT	0
>  #define IMX219_TESTP_GREENB_DEFAULT	0
> 
> +/* IMX219 native and active pixel array size. */
> +#define IMX219_NATIVE_WIDTH		3296U
> +#define IMX219_NATIVE_HEIGHT		2480U
> +#define IMX219_PIXEL_ARRAY_LEFT		8U
> +#define IMX219_PIXEL_ARRAY_TOP		8U
> +#define IMX219_PIXEL_ARRAY_WIDTH	3280U
> +#define IMX219_PIXEL_ARRAY_HEIGHT	2464U
> +
>  struct imx219_reg {
>  	u16 address;
>  	u8 val;
> @@ -129,6 +137,9 @@ struct imx219_mode {
>  	/* Frame height */
>  	unsigned int height;
> 
> +	/* Analog crop rectangle. */
> +	struct v4l2_rect crop;
> +
>  	/* V-timing */
>  	unsigned int vts_def;
> 
> @@ -463,6 +474,12 @@ static const struct imx219_mode supported_modes[] = {
>  		/* 8MPix 15fps mode */
>  		.width = 3280,
>  		.height = 2464,
> +		.crop = {
> +			.top = 0,
> +			.left = 0,
> +			.width = 3280,
> +			.height = 2464
> +		},
>  		.vts_def = IMX219_VTS_15FPS,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
> @@ -473,6 +490,12 @@ static const struct imx219_mode supported_modes[] = {
>  		/* 1080P 30fps cropped */
>  		.width = 1920,
>  		.height = 1080,
> +		.crop = {
> +			.top = 692,
> +			.left = 680,
> +			.width = 1920,
> +			.height = 1080
> +		},
>  		.vts_def = IMX219_VTS_30FPS_1080P,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
> @@ -483,6 +506,12 @@ static const struct imx219_mode supported_modes[] = {
>  		/* 2x2 binned 30fps mode */
>  		.width = 1640,
>  		.height = 1232,
> +		.crop = {
> +			.top = 0,
> +			.left = 0,
> +			.width = 3280,
> +			.height = 2464
> +		},
>  		.vts_def = IMX219_VTS_30FPS_BINNED,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1640_1232_regs),
> @@ -654,6 +683,7 @@ static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  	struct imx219 *imx219 = to_imx219(sd);
>  	struct v4l2_mbus_framefmt *try_fmt =
>  		v4l2_subdev_get_try_format(sd, fh->pad, 0);
> +	struct v4l2_rect *try_crop;
> 
>  	mutex_lock(&imx219->mutex);
> 
> @@ -664,6 +694,13 @@ static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  					       MEDIA_BUS_FMT_SRGGB10_1X10);
>  	try_fmt->field = V4L2_FIELD_NONE;
> 
> +	/* Initialize try_crop rectangle. */
> +	try_crop = v4l2_subdev_get_try_crop(sd, fh->pad, 0);
> +	try_crop->top = IMX219_PIXEL_ARRAY_TOP;
> +	try_crop->left = IMX219_PIXEL_ARRAY_LEFT;
> +	try_crop->width = IMX219_PIXEL_ARRAY_WIDTH;
> +	try_crop->height = IMX219_PIXEL_ARRAY_HEIGHT;
> +
>  	mutex_unlock(&imx219->mutex);
> 
>  	return 0;
> @@ -928,6 +965,65 @@ static int imx219_set_framefmt(struct imx219 *imx219)
>  	return -EINVAL;
>  }
> 
> +static const struct v4l2_rect *
> +__imx219_get_pad_crop(struct imx219 *imx219, struct v4l2_subdev_pad_config *cfg,
> +		      unsigned int pad, enum v4l2_subdev_format_whence which)
> +{
> +	switch (which) {
> +	case V4L2_SUBDEV_FORMAT_TRY:
> +		return v4l2_subdev_get_try_crop(&imx219->sd, cfg, pad);
> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> +		return &imx219->mode->crop;
> +	default:
> +		return NULL;
> +	}
> +}
> +
> +static int imx219_get_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_pad_config *cfg,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	struct imx219 *imx219 = to_imx219(sd);
> +	const struct v4l2_rect *__crop;
> +
> +	if (sel->pad != 0)
> +		return -EINVAL;
> +
> +	mutex_lock(&imx219->mutex);
> +
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		sel->r.top = 0;
> +		sel->r.left = 0;
> +		sel->r.width = IMX219_NATIVE_WIDTH;
> +		sel->r.height = IMX219_NATIVE_HEIGHT;
> +		mutex_unlock(&imx219->mutex);
> +
> +		return 0;
> +
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
> +		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
> +		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
> +		sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
> +		mutex_unlock(&imx219->mutex);
> +
> +		return 0;
> +
> +	case V4L2_SEL_TGT_CROP:
> +		__crop = __imx219_get_pad_crop(imx219, cfg, sel->pad,
> +					       sel->which);
> +		sel->r = *__crop;
> +		mutex_unlock(&imx219->mutex);

I should have thought about it before, but only this case requires
locking. Maybe

		__crop = __imx219_get_pad_crop(imx219, cfg, sel->pad,
					       sel->which);
		mutex_lock(&imx219->mutex);
		sel->r = *__crop;
		mutex_unlock(&imx219->mutex);

and removing the mutex_lock() at the beginning ?

> +
> +		return 0;
> +	}
> +
> +	mutex_unlock(&imx219->mutex);
> +
> +	return -EINVAL;
> +}
> +
>  static int imx219_start_streaming(struct imx219 *imx219)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> @@ -1152,6 +1248,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
>  	.enum_mbus_code = imx219_enum_mbus_code,
>  	.get_fmt = imx219_get_pad_format,
>  	.set_fmt = imx219_set_pad_format,
> +	.get_selection = imx219_get_selection,
>  	.enum_frame_size = imx219_enum_frame_size,
>  };
> 
> --
> 2.26.1
> 

-- 
Regards,

Laurent Pinchart
