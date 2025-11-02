Return-Path: <linux-media+bounces-46139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 203F0C28D96
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 11:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7B690347176
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 10:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1476825C80E;
	Sun,  2 Nov 2025 10:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WDgaq7I6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F61B1B7F4;
	Sun,  2 Nov 2025 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762080643; cv=none; b=TTFbJCpHG3VBbnuJG4c8xWSZnwRdjXx9C1riSmos5/oNQ5X6FAYDutnH+Cypg2WPhRuBv0UxoT2Sa8XgBaS02y70siLwjE21f1HygsChn5ERpziap3tqjVtSQRRcygIG4rOsBYmAmbyGCbc448897K5N2NSRwHSIl5HVMvZCFr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762080643; c=relaxed/simple;
	bh=kGnhyXlPO9tQkb2bJdZH88fwFj8jhrFQ7uxuO75RUtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GF1XDiwCzoEfzJQkQds7hdC36pBBu89l8mCWWTWmq3gmy3LBt53j75DYrrqQAQPjmuOBotYoK7O5dOBZhGRX9xZLh6efX3ltij0cYc4db1t1ivk6kdhxe9zNegJjPPb+SLRv2AmW/WlgBL4I7dWrRQwT7SkvKgTey4qyRKpNeS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WDgaq7I6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-50-232.net.vodafone.it [5.90.50.232])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B95FB3;
	Sun,  2 Nov 2025 11:48:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762080527;
	bh=kGnhyXlPO9tQkb2bJdZH88fwFj8jhrFQ7uxuO75RUtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDgaq7I6lrUbxYCqboHCOdckY9VIJGJ94cSG2IMRNDD0jqlTJ8ZJOSUWA8ndBIjS5
	 g3vCPTO0nr9Rq/nIE6YPfKi8OlSqHlLJO4T0QCUtlIA/cI4hn4D20uZl30IU+fllIN
	 yG38LF3J+HQU8It8lXC+AjtFgDYR3ceTweS0ykLk=
Date: Sun, 2 Nov 2025 11:50:36 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
	"Ivan T. Ivanov" <iivanov@suse.de>
Subject: Re: [PATCH 06/13] media: i2c: ov5647: Support HFLIP and VFLIP
Message-ID: <u5wdva6kk5n6q5myj3wuy4bxqhaqyhk2ngentrj4p3v5447y2a@3kujjl3nnwea>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
 <20251028-b4-rpi-ov5647-v1-6-098413454f5e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028-b4-rpi-ov5647-v1-6-098413454f5e@ideasonboard.com>

Hi Jai

On Tue, Oct 28, 2025 at 12:57:17PM +0530, Jai Luthra wrote:
> From: David Plowman <david.plowman@raspberrypi.com>
>
> Add missing controls for horizontal and vertical flipping.
>
> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5647.c | 77 ++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 71 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 977b878b0d4b8cd5f39f510ebd8b33c9163f7da2..a33e2d8edc114d302e830639cb7cb161f16a6208 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -54,6 +54,8 @@
>  #define OV5647_REG_GAIN_LO		0x350b
>  #define OV5647_REG_VTS_HI		0x380e
>  #define OV5647_REG_VTS_LO		0x380f
> +#define OV5647_REG_VFLIP		0x3820
> +#define OV5647_REG_HFLIP		0x3821
>  #define OV5647_REG_FRAME_OFF_NUMBER	0x4202
>  #define OV5647_REG_MIPI_CTRL00		0x4800
>  #define OV5647_REG_MIPI_CTRL14		0x4814
> @@ -109,6 +111,8 @@ struct ov5647 {
>  	struct v4l2_ctrl		*hblank;
>  	struct v4l2_ctrl		*vblank;
>  	struct v4l2_ctrl		*exposure;
> +	struct v4l2_ctrl		*hflip;
> +	struct v4l2_ctrl		*vflip;
>  };
>
>  static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> @@ -150,7 +154,7 @@ static struct regval_list ov5647_2592x1944_10bpp[] = {
>  	{0x3036, 0x69},
>  	{0x303c, 0x11},
>  	{0x3106, 0xf5},
> -	{0x3821, 0x06},
> +	{0x3821, 0x00},
>  	{0x3820, 0x00},

That's interesting, as the datasheet says that by default

        3820 = 0x40
        3821 = 0x00

And
- BIT[2] = flip ISP
- BIT[1] = flip SNR

The implementation of ov5647_s_flip() toggles BIT(1) and ignores
BIT(2) while the modes definition have both (BIT(2) | BIT(1)) set

More interestingly the datasheet says:

In flip mode, the OV5647 does not need additional settings because the
ISP block will auto-detect whether the pixel is in the red line or
blue line and make the necessary adjustments

Might this suggest that if we flip using BIT(2) we don't need to
change the bayer pattern ordering ?

Now, I admit I'm not sure what are the ISP functions on the ov5647 and
this patch is super-duper-tested as it comes from the RPi BSP, so if
you don't have answers to the above questions, I'm fine with this
patch!

>  	{0x3827, 0xec},
>  	{0x370c, 0x03},
> @@ -239,7 +243,7 @@ static struct regval_list ov5647_1080p30_10bpp[] = {
>  	{0x3036, 0x62},
>  	{0x303c, 0x11},
>  	{0x3106, 0xf5},
> -	{0x3821, 0x06},
> +	{0x3821, 0x00},
>  	{0x3820, 0x00},
>  	{0x3827, 0xec},
>  	{0x370c, 0x03},
> @@ -403,7 +407,7 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
>  	{0x4800, 0x24},
>  	{0x3503, 0x03},
>  	{0x3820, 0x41},
> -	{0x3821, 0x07},
> +	{0x3821, 0x01},
>  	{0x350a, 0x00},
>  	{0x350b, 0x10},
>  	{0x3500, 0x00},
> @@ -419,7 +423,7 @@ static struct regval_list ov5647_640x480_10bpp[] = {
>  	{0x3035, 0x11},
>  	{0x3036, 0x46},
>  	{0x303c, 0x11},
> -	{0x3821, 0x07},
> +	{0x3821, 0x01},
>  	{0x3820, 0x41},
>  	{0x370c, 0x03},
>  	{0x3612, 0x59},
> @@ -935,6 +939,26 @@ static const struct v4l2_subdev_video_ops ov5647_subdev_video_ops = {
>  	.s_stream =		ov5647_s_stream,
>  };
>
> +/*
> + * This function returns the mbus code for the current settings of the HFLIP
> + * and VFLIP controls.
> + */
> +static u32 ov5647_get_mbus_code(struct v4l2_subdev *sd)
> +{
> +	struct ov5647 *sensor = to_sensor(sd);
> +	/* The control values are only 0 or 1. */
> +	int index =  sensor->hflip->val | (sensor->vflip->val << 1);
> +
> +	static const u32 codes[4] = {
> +		MEDIA_BUS_FMT_SGBRG10_1X10,
> +		MEDIA_BUS_FMT_SBGGR10_1X10,
> +		MEDIA_BUS_FMT_SRGGB10_1X10,
> +		MEDIA_BUS_FMT_SGRBG10_1X10
> +	};
> +
> +	return codes[index];
> +}
> +
>  static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
> @@ -942,7 +966,7 @@ static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
>  	if (code->index > 0)
>  		return -EINVAL;
>
> -	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> +	code->code = ov5647_get_mbus_code(sd);
>
>  	return 0;
>  }
> @@ -953,7 +977,7 @@ static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
>  {
>  	const struct v4l2_mbus_framefmt *fmt;
>
> -	if (fse->code != MEDIA_BUS_FMT_SBGGR10_1X10 ||
> +	if (fse->code != ov5647_get_mbus_code(sd) ||
>  	    fse->index >= ARRAY_SIZE(ov5647_modes))
>  		return -EINVAL;
>
> @@ -986,6 +1010,8 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
>  	}
>
>  	*fmt = *sensor_format;
> +	/* The code we pass back must reflect the current h/vflips. */
> +	fmt->code = ov5647_get_mbus_code(sd);
>  	mutex_unlock(&sensor->lock);
>
>  	return 0;
> @@ -1033,6 +1059,8 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
>  					 exposure_def);
>  	}
>  	*fmt = mode->format;
> +	/* The code we pass back must reflect the current h/vflips. */
> +	fmt->code = ov5647_get_mbus_code(sd);
>  	mutex_unlock(&sensor->lock);
>
>  	return 0;
> @@ -1208,6 +1236,25 @@ static int ov5647_s_exposure(struct v4l2_subdev *sd, u32 val)
>  	return ov5647_write(sd, OV5647_REG_EXP_LO, (val & 0xf) << 4);
>  }
>
> +static int ov5647_s_flip(struct v4l2_subdev *sd, u16 reg, u32 ctrl_val)
> +{
> +	int ret;
> +	u8 reg_val;
> +
> +	/* Set or clear bit 1 and leave everything else alone. */
> +	ret = ov5647_read(sd, reg, &reg_val);
> +	if (ret == 0) {
> +		if (ctrl_val)
> +			reg_val |= 2;
> +		else
> +			reg_val &= ~2;
> +
> +		ret = ov5647_write(sd, reg, reg_val);
> +	}
> +
> +	return ret;
> +}
> +
>  static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct ov5647 *sensor = container_of(ctrl->handler,
> @@ -1270,6 +1317,14 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>  		/* Read-only, but we adjust it based on mode. */
>  		break;
>
> +	case V4L2_CID_HFLIP:
> +		/* There's an in-built hflip in the sensor, so account for that here. */
> +		ov5647_s_flip(sd, OV5647_REG_HFLIP, !ctrl->val);
> +		break;
> +	case V4L2_CID_VFLIP:
> +		ov5647_s_flip(sd, OV5647_REG_VFLIP, ctrl->val);
> +		break;

The modes definition used to set

        0x3820 = 0x00
        0x3821 = 0x06

Is this the built-in hflip ?

Or does it mean that setting the registers value to 1 'disabled' flips ?

> +
>  	default:
>  		dev_info(&client->dev,
>  			 "Control (id:0x%x, val:0x%x) not supported\n",
> @@ -1341,6 +1396,16 @@ static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
>  				     ARRAY_SIZE(ov5647_test_pattern_menu) - 1,
>  				     0, 0, ov5647_test_pattern_menu);
>
> +	sensor->hflip = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> +					  V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	if (sensor->hflip)
> +		sensor->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;

I wonder if hflip is enabled by default we shouldn't register the
control with default value of 1 ?

> +
> +	sensor->vflip = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> +					  V4L2_CID_VFLIP, 0, 1, 1, 0);
> +	if (sensor->vflip)
> +		sensor->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +
>  	v4l2_fwnode_device_parse(dev, &props);
>
>  	v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,
>
> --
> 2.51.0
>

