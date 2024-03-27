Return-Path: <linux-media+bounces-7918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4C688DA81
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 10:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6C671F24A9E
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 09:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C762C1AC;
	Wed, 27 Mar 2024 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RJG0iEHV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03562CCA0
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711533118; cv=none; b=iBe8vM75vkG5oejHKYhyepXLDSeGwYOw1C9VcZg1gNKuRaR31GSbeuK0UMPDQhrRR8OnHz6P5zwyFtCrcrFc9pJ7aPTkWJZLL4k1twU6kGgz3hKp0HpwSMxqWtf/cbMw7MmEJ41KNNaPk9nvYAjVZmgmD99sZkOmMoDj/H4qyAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711533118; c=relaxed/simple;
	bh=IpZMI7tUWwGy4N+DmhRjdTb4W6r0RFTqTWZ0FvLVll0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4hNIJOifSrTWVqrbATAOEzp529WedRcRjaEDFH3SHi/OPDyum3kQ4hW2xQCfnSImtVdqIT95vJs6LNiJXixM1r+pSDuxqKtxi8456kRt4XyKku+Sy4QjDjE1Zn2+KNUKDrGUE3c9E68ZCR6R+J8/Q6m9+2uGBPcrNOqgddL4oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RJG0iEHV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64933505;
	Wed, 27 Mar 2024 10:51:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711533081;
	bh=IpZMI7tUWwGy4N+DmhRjdTb4W6r0RFTqTWZ0FvLVll0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RJG0iEHVisPtTWdw1L7BLQEHVviYukhs/bmhKfPeBhDTs7Kxrd/43Pn/eFq0KI9zw
	 ZFcW1njqlSvVOqWHuEwipEbjdEABPzyfKSohjvaLoaZjOdypumXrf5cY1gcsQgJ0Nu
	 cT12/gIhMa9VYdrZmW+ti8ImY5vib0BR+OwezRaw=
Message-ID: <887c8055-245c-4768-abe6-29d17472b06c@ideasonboard.com>
Date: Wed, 27 Mar 2024 11:51:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/15] media: i2c: imx219: Add internal image sink pad
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Naushir Patuck <naush@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, kernel-list@raspberrypi.com,
 linux-rpi-kernel@lists.infradead.org,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com
References: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
 <20240324220854.15010-3-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240324220854.15010-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/03/2024 00:08, Laurent Pinchart wrote:
> Use the newly added internal pad API to expose the internal
> configuration of the sensor to userspace in a standard manner. This also
> paves the way for adding support for embedded data with an additional
> internal pad.
> 
> To maintain compatibility with existing userspace that may operate on
> pad 0 unconditionally, keep the source pad numbered 0 and number the
> internal image pad 1.

If I remember right, we discussed that this (internal pads after 
external pads) would be the approach also for totally new drivers.

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/i2c/imx219.c | 169 +++++++++++++++++++++++++++++--------
>   1 file changed, 133 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 3878da50860e..817bf192e4d9 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -140,6 +140,7 @@
>   #define IMX219_DEFAULT_LINK_FREQ_4LANE	363000000
>   
>   /* IMX219 native and active pixel array size. */
> +#define IMX219_NATIVE_FORMAT		MEDIA_BUS_FMT_SRGGB10_1X10
>   #define IMX219_NATIVE_WIDTH		3296U
>   #define IMX219_NATIVE_HEIGHT		2480U
>   #define IMX219_PIXEL_ARRAY_LEFT		8U
> @@ -312,9 +313,15 @@ static const struct imx219_mode supported_modes[] = {
>   	},
>   };
>   
> +enum imx219_pad_ids {
> +	IMX219_PAD_SOURCE,
> +	IMX219_PAD_IMAGE,
> +	IMX219_NUM_PADS,
> +};

Nitpick, but if the numbering of the values is important, I always mark 
the first one "= 0", to make it clear(er) for the reader.

>   struct imx219 {
>   	struct v4l2_subdev sd;
> -	struct media_pad pad;
> +	struct media_pad pads[IMX219_NUM_PADS];
>   
>   	struct regmap *regmap;
>   	struct clk *xclk; /* system clock to IMX219 */
> @@ -374,7 +381,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>   	int ret = 0;
>   
>   	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
> -	format = v4l2_subdev_state_get_format(state, 0);
> +	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
>   
>   	if (ctrl->id == V4L2_CID_VBLANK) {
>   		int exposure_max, exposure_def;
> @@ -593,8 +600,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>   	u64 bin_h, bin_v;
>   	int ret = 0;
>   
> -	format = v4l2_subdev_state_get_format(state, 0);
> -	crop = v4l2_subdev_state_get_crop(state, 0);
> +	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
> +	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
>   
>   	switch (format->code) {
>   	case MEDIA_BUS_FMT_SRGGB8_1X8:
> @@ -764,10 +771,25 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
>   {
>   	struct imx219 *imx219 = to_imx219(sd);
>   
> -	if (code->index >= (ARRAY_SIZE(imx219_mbus_formats) / 4))
> -		return -EINVAL;
> +	if (code->pad == IMX219_PAD_IMAGE) {
> +		/* The internal image pad is hardwired to the native format. */
> +		if (code->index)
> +			return -EINVAL;
>   
> -	code->code = imx219_get_format_code(imx219, imx219_mbus_formats[code->index * 4]);
> +		code->code = IMX219_NATIVE_FORMAT;
> +	} else {
> +		/*
> +		 * On the source pad, the sensor supports multiple raw formats
> +		 * with different bit depths.
> +		 */
> +		u32 format;
> +
> +		if (code->index >= (ARRAY_SIZE(imx219_mbus_formats) / 4))
> +			return -EINVAL;
> +
> +		format = imx219_mbus_formats[code->index * 4];
> +		code->code = imx219_get_format_code(imx219, format);
> +	}
>   
>   	return 0;
>   }
> @@ -777,19 +799,25 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
>   				  struct v4l2_subdev_frame_size_enum *fse)
>   {
>   	struct imx219 *imx219 = to_imx219(sd);
> -	u32 code;
>   
> -	if (fse->index >= ARRAY_SIZE(supported_modes))
> -		return -EINVAL;
> +	if (fse->pad == IMX219_PAD_IMAGE) {
> +		if (fse->code != IMX219_NATIVE_FORMAT || fse->index > 0)
> +			return -EINVAL;
>   
> -	code = imx219_get_format_code(imx219, fse->code);
> -	if (fse->code != code)
> -		return -EINVAL;
> +		fse->min_width = IMX219_NATIVE_WIDTH;
> +		fse->max_width = IMX219_NATIVE_WIDTH;
> +		fse->min_height = IMX219_NATIVE_HEIGHT;
> +		fse->max_height = IMX219_NATIVE_HEIGHT;
> +	} else {
> +		if (fse->code != imx219_get_format_code(imx219, fse->code) ||
> +		    fse->index >= ARRAY_SIZE(supported_modes))
> +			return -EINVAL;
>   
> -	fse->min_width = supported_modes[fse->index].width;
> -	fse->max_width = fse->min_width;
> -	fse->min_height = supported_modes[fse->index].height;
> -	fse->max_height = fse->min_height;
> +		fse->min_width = supported_modes[fse->index].width;
> +		fse->max_width = fse->min_width;
> +		fse->min_height = supported_modes[fse->index].height;
> +		fse->max_height = fse->min_height;
> +	}
>   
>   	return 0;
>   }
> @@ -801,9 +829,17 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>   	struct imx219 *imx219 = to_imx219(sd);
>   	const struct imx219_mode *mode;
>   	struct v4l2_mbus_framefmt *format;
> +	struct v4l2_rect *compose;
>   	struct v4l2_rect *crop;
>   	unsigned int bin_h, bin_v;
>   
> +	/*
> +	 * The driver is mode-based, the format can be set on the source pad
> +	 * only.
> +	 */
> +	if (fmt->pad != IMX219_PAD_SOURCE)
> +		return v4l2_subdev_get_fmt(sd, state, fmt);
> +
>   	/*
>   	 * Adjust the requested format to match the closest mode. The Bayer
>   	 * order varies with flips.
> @@ -822,22 +858,51 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>   	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
>   	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
>   
> -	format = v4l2_subdev_state_get_format(state, 0);
> +	/* Propagate the format through the sensor. */
> +
> +	/* The image pad models the pixel array, and thus has a fixed size. */
> +	format = v4l2_subdev_state_get_format(state, IMX219_PAD_IMAGE);
>   	*format = fmt->format;
> +	format->code = IMX219_NATIVE_FORMAT;
> +	format->width = IMX219_NATIVE_WIDTH;
> +	format->height = IMX219_NATIVE_HEIGHT;

Isn't the image pad format always the same, and cannot be changed? The 
above hints otherwise. What fields can change in the image pad?

  Tomi

>   	/*
>   	 * Use binning to maximize the crop rectangle size, and centre it in the
>   	 * sensor.
>   	 */
> -	bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / format->width, 2U);
> -	bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
> +	bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / fmt->format.width, 2U);
> +	bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / fmt->format.height, 2U);
>   
> -	crop = v4l2_subdev_state_get_crop(state, 0);
> -	crop->width = format->width * bin_h;
> -	crop->height = format->height * bin_v;
> +	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
> +	crop->width = fmt->format.width * bin_h;
> +	crop->height = fmt->format.height * bin_v;
>   	crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
>   	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
>   
> +	/*
> +	 * The compose rectangle models binning, its size is the sensor output
> +	 * size.
> +	 */
> +	compose = v4l2_subdev_state_get_compose(state, IMX219_PAD_IMAGE);
> +	compose->left = 0;
> +	compose->top = 0;
> +	compose->width = fmt->format.width;
> +	compose->height = fmt->format.height;
> +
> +	/*
> +	 * No mode use digital crop, the source pad crop rectangle size and
> +	 * format are thus identical to the image pad compose rectangle.
> +	 */
> +	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_SOURCE);
> +	crop->left = 0;
> +	crop->top = 0;
> +	crop->width = fmt->format.width;
> +	crop->height = fmt->format.height;
> +
> +	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
> +	*format = fmt->format;
> +
>   	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>   		int exposure_max;
>   		int exposure_def;
> @@ -874,13 +939,13 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
>   				struct v4l2_subdev_state *state,
>   				struct v4l2_subdev_selection *sel)
>   {
> -	switch (sel->target) {
> -	case V4L2_SEL_TGT_CROP: {
> -		sel->r = *v4l2_subdev_state_get_crop(state, 0);
> -		return 0;
> -	}
> +	struct v4l2_rect *compose;
>   
> +	switch (sel->target) {
>   	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		if (sel->pad != IMX219_PAD_IMAGE)
> +			return -EINVAL;
> +
>   		sel->r.top = 0;
>   		sel->r.left = 0;
>   		sel->r.width = IMX219_NATIVE_WIDTH;
> @@ -890,11 +955,35 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
>   
>   	case V4L2_SEL_TGT_CROP_DEFAULT:
>   	case V4L2_SEL_TGT_CROP_BOUNDS:
> -		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
> -		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
> -		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
> -		sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
> +		switch (sel->pad) {
> +		case IMX219_PAD_IMAGE:
> +			sel->r.top = IMX219_PIXEL_ARRAY_TOP;
> +			sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
> +			sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
> +			sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
> +			return 0;
>   
> +		case IMX219_PAD_SOURCE:
> +			compose = v4l2_subdev_state_get_compose(state,
> +								IMX219_PAD_IMAGE);
> +			sel->r.top = 0;
> +			sel->r.left = 0;
> +			sel->r.width = compose->width;
> +			sel->r.height = compose->height;
> +			return 0;
> +		}
> +
> +		break;
> +
> +	case V4L2_SEL_TGT_CROP:
> +		sel->r = *v4l2_subdev_state_get_crop(state, sel->pad);
> +		return 0;
> +
> +	case V4L2_SEL_TGT_COMPOSE:
> +		if (sel->pad != IMX219_PAD_IMAGE)
> +			return -EINVAL;
> +
> +		sel->r = *v4l2_subdev_state_get_compose(state, sel->pad);
>   		return 0;
>   	}
>   
> @@ -906,7 +995,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
>   {
>   	struct v4l2_subdev_format fmt = {
>   		.which = V4L2_SUBDEV_FORMAT_TRY,
> -		.pad = 0,
> +		.pad = IMX219_PAD_SOURCE,
>   		.format = {
>   			.code = MEDIA_BUS_FMT_SRGGB10_1X10,
>   			.width = supported_modes[0].width,
> @@ -1174,10 +1263,18 @@ static int imx219_probe(struct i2c_client *client)
>   			    V4L2_SUBDEV_FL_HAS_EVENTS;
>   	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>   
> -	/* Initialize source pad */
> -	imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	/*
> +	 * Initialize the pads. To preserve backward compatibility with
> +	 * userspace that used the sensor before the introduction of the
> +	 * internal image pad, the external source pad is numbered 0 and the
> +	 * internal image pad numbered 1.
> +	 */
> +	imx219->pads[IMX219_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> +	imx219->pads[IMX219_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK
> +					     | MEDIA_PAD_FL_INTERNAL;
>   
> -	ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
> +	ret = media_entity_pads_init(&imx219->sd.entity,
> +				     ARRAY_SIZE(imx219->pads), imx219->pads);
>   	if (ret) {
>   		dev_err(dev, "failed to init entity pads: %d\n", ret);
>   		goto error_handler_free;


