Return-Path: <linux-media+bounces-42224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4433B51AEB
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 17:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D9C5A06A5E
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 15:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0119932BF24;
	Wed, 10 Sep 2025 14:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvfhd2xx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C93C329F02;
	Wed, 10 Sep 2025 14:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757516113; cv=none; b=FOvvHcF4gahTD9RfnFeX9RUqZgnlpsgWUyDVV7TR0fjS0/BQnU2F8RTwUYren85C87c2G48nTViIZHifFOS4HyykQW/TvoZ+h/kTJIL4wu0Bx3vVy1tgec8bPWUgsfUYGPO5MQtUdCgdRvWvYgkR7vsPO43honlCe9HQj80r+KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757516113; c=relaxed/simple;
	bh=DcsCj+vRDdCFBxTBpCMaQTmIAL0H+emAj1ynhUDRc/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZ4e02Wbj9EVDuPgFl5o3vwLd+9NBWgZFa5xhJQkOnCCu4h+mragx/UnS0Wm25FIhE8w7MvGiWvOcEqTyrKtFCQLCD03MXslW+g11fnfZmYaq9Ov27ARUDnOHBXlsIKQSvD8GwYXNPSF6gb9+ptPqJlh/qd64pD0vL9zlxK4s2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jvfhd2xx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D459C4CEF0;
	Wed, 10 Sep 2025 14:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757516113;
	bh=DcsCj+vRDdCFBxTBpCMaQTmIAL0H+emAj1ynhUDRc/8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jvfhd2xxDTyzgWqILXkqawvNdKVR5xKEFSfos6KuAQwUT6DVIXRWFIhLvMZ9UXwL2
	 fvpNErIy/12D7RBSMZBMouwyLF9vu3b58Oy3OUfBJqlZ85E0GZJGaxA143xNkMkSkR
	 yebGVA97OWryv49uzHVTfTaKyADIFZMKGxaknEx32SADhXJ1u8USHE68UkSI++7aFM
	 BJKBWsUv0O1Ou+D4D/pm+6Geu/6Wu6EJqwEj39uSnO4GRNGjjVnJZhZfPZv9zUoZEP
	 ouF7nxu33LowzQf1WVjY+P5uKIKw1SjvywOqLhAUKOuRgmIh0qg9fgrseKjSkQoSXK
	 wYgDN+p5MzBFg==
Message-ID: <0682229e-22db-43be-b477-62427fefacea@kernel.org>
Date: Wed, 10 Sep 2025 16:55:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] media: Add t4ka3 camera sensor driver
To: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241108091844.151033-1-hpa@redhat.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20241108091844.151033-1-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kate,

Thank you for the new version and sorry for letting this sit on
the list for so long.

In the mean time there have been some new developments wrt
what we expect from a mainline driver so some small changes
will be necessary to make this match the latest and greatest
expectations.

I've put remarks about this below.

On 8-Nov-24 10:18 AM, Kate Hsuan wrote:
> Add the t4ka3 driver from:
> https://github.com/kitakar5525/surface3-atomisp-cameras.git
> 
> With many cleanups / changes (almost a full rewrite) to make it suitable
> for upstream:
> 
> * Remove the VCM and VCM-OTP support, the mainline kernel models VCMs and
>   calibration data eeproms as separate v4l2-subdev-s.
> 
> * Remove the integration-factor t4ka3_get_intg_factor() support and IOCTL,
>   this provided info to userspace through an atomisp private IOCTL.
> 
> * Turn atomisp specific exposure/gain IOCTL into standard v4l2 controls.
> 
> * Use normal ACPI power-management in combination with runtime-pm support
>   instead of atomisp specific GMIN power-management code.
> 
> * Turn into a standard V4L2 sensor driver using
>   v4l2_async_register_subdev_sensor().
> 
> * Add vblank, hblank, and link-freq controls; drop get_frame_interval().
> 
> * Use CCI register helpers.
> 
> * Calculate values for modes instead of using fixed register-value lists,
>   allowing arbritrary modes.
> 
> * Add get_selection() and set_selection() support
> 
> * Add a CSI2 bus configuration check
> 
> This been tested on a Xiaomi Mipad2 tablet which has a T4KA3 sensor with
> DW9761 VCM as back sensor.
> 
> Co-developed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Please replace these 2 lines with:

Co-developed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>



> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---

...

> diff --git a/drivers/media/i2c/t4ka3.c b/drivers/media/i2c/t4ka3.c
> new file mode 100644
> index 000000000000..ec0fcccf93b7
> --- /dev/null
> +++ b/drivers/media/i2c/t4ka3.c
> @@ -0,0 +1,1110 @@

...

+struct t4ka3_mode {
+	struct v4l2_rect		crop;
+	struct v4l2_mbus_framefmt	fmt;
+	int				binning;
+	u16				win_x;
+	u16				win_y;
+};

...

crop and fmt can be dropped here, see below.

> +static struct v4l2_rect *
> +__t4ka3_get_pad_crop(struct t4ka3_data *sensor,
> +		     struct v4l2_subdev_state *state,
> +		     unsigned int pad,
> +		     enum v4l2_subdev_format_whence which)
> +{
> +	if (which == V4L2_SUBDEV_FORMAT_TRY)
> +		return v4l2_subdev_state_get_crop(state, pad);
> +
> +	return &sensor->mode.crop;
> +}
> +
> +static struct v4l2_mbus_framefmt *
> +__t4ka3_get_pad_format(struct t4ka3_data *sensor,
> +		       struct v4l2_subdev_state *sd_state, unsigned int pad,
> +		       enum v4l2_subdev_format_whence which)
> +{
> +	if (which == V4L2_SUBDEV_FORMAT_TRY)
> +		return v4l2_subdev_state_get_format(sd_state, pad);
> +
> +	return &sensor->mode.fmt;
> +}

Instead of having these helpers, we should use the subdev active
state to store the framefmt and crop and then use the standard
v4l2_subdev helpers. This also requires dropping the driver's
own lock and instead switching to initializing:

	sensor->sd.state_lock = sensor->ctrl_handler.lock;

Using a single lock for all ioctls and letting the v4l2-core 
fully handle all locking, see:

https://lore.kernel.org/linux-media/20250313184314.91410-14-hdegoede@redhat.com/

which makes the same changes for the ov02c10 driver (as an incremental
change during review).

The linked patch is mostly about locking but it also adds calls to

v4l2_subdev_init_finalize() at probe() time and v4l2_subdev_cleanup()

With v4l2_subdev_init_finalize() doing:

        state = __v4l2_subdev_state_alloc(sd, name, key);
        sd->active_state = state;

Where __v4l2_subdev_state_alloc() will alloc a v4l2_subdev_state
and pass that to t4ka3_init_state() to set the initial state.

After which we can use v4l2_subdev_state_get_format() for
the non which == V4L2_SUBDEV_FORMAT_TRY case.

Once the driver calls v4l2_subdev_init_finalize() (+cleanup())
we can:

1. Replace all __t4ka3_get_pad_format() calls with v4l2_subdev_state_get_format()
   and drop __t4ka3_get_pad_format()
2. Replace all __t4ka3_get_pad_crop() calls with v4l2_subdev_state_get_crop()
   and drop __t4ka3_get_pad_crop()


> +
> +static void t4ka3_fill_format(struct t4ka3_data *sensor,
> +			      struct v4l2_mbus_framefmt *fmt,
> +			      unsigned int width, unsigned int height)
> +{
> +	memset(fmt, 0, sizeof(*fmt));
> +	fmt->width = width;
> +	fmt->height = height;
> +	fmt->field = V4L2_FIELD_NONE;
> +	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> +	t4ka3_set_bayer_order(sensor, fmt);
> +}
> +
> +static void t4ka3_calc_mode(struct t4ka3_data *sensor)
> +{
> +	int width = sensor->mode.fmt.width;
> +	int height = sensor->mode.fmt.height;
> +	int binning;
> +
> +	if (width  <= (sensor->mode.crop.width / 2) &&
> +	    height <= (sensor->mode.crop.height / 2))
> +		binning = 2;
> +	else
> +		binning = 1;
> +
> +	width *= binning;
> +	height *= binning;
> +
> +	sensor->mode.binning = binning;
> +	sensor->mode.win_x = (sensor->mode.crop.left +
> +				(sensor->mode.crop.width - width) / 2) & ~1;
> +	sensor->mode.win_y = (sensor->mode.crop.top +
> +				(sensor->mode.crop.height - height) / 2) & ~1;
> +	/*
> +	 * t4ka's window is done after binning, but must still be a multiple of 2 ?
> +	 * Round up to avoid top 2 black lines in 1640x1230 (quarter res) case.
> +	 */
> +	sensor->mode.win_x = DIV_ROUND_UP(sensor->mode.win_x, binning);
> +	sensor->mode.win_y = DIV_ROUND_UP(sensor->mode.win_y, binning);
> +}
> +
> +static void t4ka3_get_vblank_limits(struct t4ka3_data *sensor, int *min, int *max, int *def)
> +{
> +	*min = T4KA3_MIN_VBLANK + (sensor->mode.binning - 1) * sensor->mode.fmt.height;
> +	*max = T4KA3_MAX_VBLANK - sensor->mode.fmt.height;
> +	*def = T4KA3_LINES_PER_FRAME_30FPS - sensor->mode.fmt.height;
> +}
> +
> +static int t4ka3_set_pad_format(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_format *format)
> +{
> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
> +	struct v4l2_mbus_framefmt *try_fmt;
> +	const struct v4l2_rect *crop;
> +	unsigned int width, height;
> +	int min, max, def, ret = 0;
> +
> +	crop = __t4ka3_get_pad_crop(sensor, sd_state, format->pad, format->which);
> +
> +	/* Limit set_fmt max size to crop width / height */
> +	width = clamp_val(ALIGN(format->format.width, 2),
> +			  T4KA3_MIN_CROP_WIDTH, crop->width);
> +	height = clamp_val(ALIGN(format->format.height, 2),
> +			   T4KA3_MIN_CROP_HEIGHT, crop->height);
> +	t4ka3_fill_format(sensor, &format->format, width, height);
> +

With the previous locking + active-state changes, we can simplify
things here a bit, replace these lines:

> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		try_fmt = v4l2_subdev_state_get_format(sd_state, 0);
> +		*try_fmt = format->format;
> +		return 0;
> +	}
> +
> +	mutex_lock(&sensor->lock);
> +
> +	if (sensor->streaming) {
> +		ret = -EBUSY;
> +		goto unlock;
> +	}
> +
> +	sensor->mode.fmt = format->format;

with:

	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE && sensor->streaming)
		return -EBUSY;

	*v4l2_subdev_state_get_format(sd_state, 0) = format->format;

	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
		return 0;

> +	t4ka3_calc_mode(sensor);
> +
> +	/* vblank range is height dependent adjust and reset to default */
> +	t4ka3_get_vblank_limits(sensor, &min, &max, &def);
> +	ret = __v4l2_ctrl_modify_range(sensor->ctrls.vblank, min, max, 1, def);
> +	if (ret)
> +		goto unlock;
> +
> +	ret = __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, def);
> +	if (ret)
> +		goto unlock;
> +
> +	def = T4KA3_ACTIVE_WIDTH - sensor->mode.fmt.width;
> +	ret = __v4l2_ctrl_modify_range(sensor->ctrls.hblank, def, def, 1, def);
> +	if (ret)
> +		goto unlock;
> +	ret = __v4l2_ctrl_s_ctrl(sensor->ctrls.hblank, def);
> +	if (ret)
> +		goto unlock;
> +
> +	/* exposure range depends on vts which may have changed */
> +	ret = t4ka3_update_exposure_range(sensor);
> +	if (ret)
> +		goto unlock;
> +
> +unlock:
> +	mutex_unlock(&sensor->lock);
> +	return ret;
> +}
> +
> +/* Horizontal flip the image. */
> +static int t4ka3_t_hflip(struct v4l2_subdev *sd, int value)
> +{
> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
> +	int ret;
> +	u64 val;
> +
> +	if (sensor->streaming)
> +		return -EBUSY;
> +
> +	val = value ? T4KA3_HFLIP_BIT : 0;
> +
> +	ret = cci_update_bits(sensor->regmap, T4KA3_REG_IMG_ORIENTATION,
> +			      T4KA3_HFLIP_BIT, val, NULL);
> +	if (ret)
> +		return ret;
> +
> +	t4ka3_set_bayer_order(sensor, &sensor->mode.fmt);
> +	return 0;
> +}
> +
> +/* Vertically flip the image */
> +static int t4ka3_t_vflip(struct v4l2_subdev *sd, int value)
> +{
> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
> +	int ret;
> +	u64 val;
> +
> +	if (sensor->streaming)
> +		return -EBUSY;
> +
> +	val = value ? T4KA3_VFLIP_BIT : 0;
> +
> +	ret = cci_update_bits(sensor->regmap, T4KA3_REG_IMG_ORIENTATION,
> +			      T4KA3_VFLIP_BIT, val, NULL);
> +	if (ret)
> +		return ret;
> +
> +	t4ka3_set_bayer_order(sensor, &sensor->mode.fmt);
> +	return 0;
> +}
> +
> +static int t4ka3_test_pattern(struct t4ka3_data *sensor, s32 value)
> +{
> +	return cci_write(sensor->regmap, T4KA3_REG_TEST_PATTERN_MODE, value, NULL);
> +}
> +
> +static int t4ka3_detect(struct t4ka3_data *sensor, u16 *id)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
> +	struct i2c_adapter *adapter = client->adapter;
> +	u64 high, low;
> +	int ret = 0;
> +
> +	/* i2c check */
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
> +		return -ENODEV;
> +
> +	/* check sensor chip ID	 */
> +	cci_read(sensor->regmap, T4KA3_REG_PRODUCT_ID_HIGH, &high, &ret);
> +	cci_read(sensor->regmap, T4KA3_REG_PRODUCT_ID_LOW, &low, &ret);
> +	if (ret)
> +		return ret;
> +
> +	*id = (((u8)high) << 8) | (u8)low;
> +	if (*id != T4KA3_PRODUCT_ID) {
> +		dev_err(sensor->dev, "main sensor t4ka3 ID error\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static int t4ka3_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct t4ka3_data *sensor = ctrl_to_t4ka3(ctrl);
> +	int ret;
> +
> +	/* Update exposure range on vblank changes */
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		ret = t4ka3_update_exposure_range(sensor);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Only apply changes to the controls if the device is powered up */
> +	if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
> +		t4ka3_set_bayer_order(sensor, &sensor->mode.fmt);
> +		return 0;
> +	}
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = t4ka3_test_pattern(sensor, ctrl->val);
> +		break;
> +	case V4L2_CID_VFLIP:
> +		ret = t4ka3_t_vflip(&sensor->sd, ctrl->val);
> +		break;
> +	case V4L2_CID_HFLIP:
> +		ret = t4ka3_t_hflip(&sensor->sd, ctrl->val);
> +		break;
> +	case V4L2_CID_VBLANK:
> +		ret = cci_write(sensor->regmap, T4KA3_REG_FRAME_LENGTH_LINES,
> +				sensor->mode.fmt.height + ctrl->val, NULL);
> +		break;
> +	case V4L2_CID_EXPOSURE:
> +		ret = cci_write(sensor->regmap, T4KA3_REG_COARSE_INTEGRATION_TIME,
> +				ctrl->val, NULL);
> +		break;
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret = cci_write(sensor->regmap, T4KA3_REG_GLOBAL_GAIN,
> +				ctrl->val, NULL);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	pm_runtime_put(sensor->sd.dev);
> +	return ret;
> +}
> +
> +static int t4ka3_set_mode(struct t4ka3_data *sensor)
> +{
> +	int ret = 0;
> +
> +	cci_write(sensor->regmap, T4KA3_REG_HORZ_OUTPUT_SIZE, sensor->mode.fmt.width, &ret);
> +	/* Write mode-height - 2 otherwise things don't work, hw-bug ? */
> +	cci_write(sensor->regmap, T4KA3_REG_VERT_OUTPUT_SIZE, sensor->mode.fmt.height - 2, &ret);
> +	/* Note overwritten by __v4l2_ctrl_handler_setup() based on vblank ctrl */
> +	cci_write(sensor->regmap, T4KA3_REG_FRAME_LENGTH_LINES, T4KA3_LINES_PER_FRAME_30FPS, &ret);
> +	cci_write(sensor->regmap, T4KA3_REG_PIXELS_PER_LINE, T4KA3_PIXELS_PER_LINE, &ret);
> +	/* Always use the full sensor, using window to crop */
> +	cci_write(sensor->regmap, T4KA3_REG_HORZ_START, 0, &ret);
> +	cci_write(sensor->regmap, T4KA3_REG_VERT_START, 0, &ret);
> +	cci_write(sensor->regmap, T4KA3_REG_HORZ_END, T4KA3_NATIVE_WIDTH - 1, &ret);
> +	cci_write(sensor->regmap, T4KA3_REG_VERT_END, T4KA3_NATIVE_HEIGHT - 1, &ret);
> +	/* Set window */
> +	cci_write(sensor->regmap, T4KA3_REG_WIN_START_X, sensor->mode.win_x, &ret);
> +	cci_write(sensor->regmap, T4KA3_REG_WIN_START_Y, sensor->mode.win_y, &ret);
> +	cci_write(sensor->regmap, T4KA3_REG_WIN_WIDTH, sensor->mode.fmt.width, &ret);
> +	cci_write(sensor->regmap, T4KA3_REG_WIN_HEIGHT, sensor->mode.fmt.height, &ret);
> +	/* Write 1 to unknown register 0x0900 */
> +	cci_write(sensor->regmap, T4KA3_REG_0900, 1, &ret);
> +	cci_write(sensor->regmap, T4KA3_REG_BINNING, T4KA3_BINNING_VAL(sensor->mode.binning), &ret);
> +
> +	return ret;
> +}
> +
> +static int t4ka3_s_stream(struct v4l2_subdev *sd, int enable)

s_stream is deprecated this should be replaced with enable_streams() + disable_streams()
callbacks, see:

https://lore.kernel.org/linux-media/20250313184314.91410-12-hdegoede@redhat.com/

for an example how to do this.

> +{
> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
> +	int ret;
> +
> +	mutex_lock(&sensor->lock);
> +
> +	if (sensor->streaming == enable) {
> +		dev_warn(sensor->dev, "Stream already %s\n", enable ? "started" : "stopped");
> +		ret = -EBUSY;
> +		goto error_unlock;
> +	}
> +
> +	if (enable) {
> +		ret = pm_runtime_get_sync(sensor->sd.dev);
> +		if (ret < 0) {
> +			dev_err(sensor->dev, "power-up err.\n");
> +			goto error_unlock;
> +		}
> +
> +		cci_multi_reg_write(sensor->regmap, t4ka3_init_config,
> +				    ARRAY_SIZE(t4ka3_init_config), &ret);
> +		/* enable group hold */
> +		cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 1, &ret);
> +		cci_multi_reg_write(sensor->regmap, t4ka3_pre_mode_set_regs,
> +				    ARRAY_SIZE(t4ka3_pre_mode_set_regs), &ret);
> +		if (ret)
> +			goto error_powerdown;
> +
> +		ret = t4ka3_set_mode(sensor);
> +		if (ret)
> +			goto error_powerdown;
> +
> +		ret = cci_multi_reg_write(sensor->regmap, t4ka3_post_mode_set_regs,
> +					  ARRAY_SIZE(t4ka3_post_mode_set_regs), NULL);
> +		if (ret)
> +			goto error_powerdown;
> +
> +		/* Restore value of all ctrls */
> +		ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> +		if (ret)
> +			goto error_powerdown;
> +
> +		/* disable group hold */
> +		cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 0, &ret);
> +		cci_write(sensor->regmap, T4KA3_REG_STREAM, 1, &ret);
> +		if (ret)
> +			goto error_powerdown;
> +
> +		sensor->streaming = 1;
> +	} else {
> +		ret = cci_write(sensor->regmap, T4KA3_REG_STREAM, 0, NULL);
> +		if (ret)
> +			goto error_powerdown;
> +
> +		ret = pm_runtime_put(sensor->sd.dev);
> +		if (ret)
> +			goto error_unlock;
> +
> +		sensor->streaming = 0;
> +	}
> +
> +	mutex_unlock(&sensor->lock);
> +	return ret;
> +
> +error_powerdown:
> +	pm_runtime_put(sensor->sd.dev);
> +error_unlock:
> +	mutex_unlock(&sensor->lock);
> +	return ret;
> +}
> +
> +static int t4ka3_get_selection(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *state,
> +			       struct v4l2_subdev_selection *sel)
> +{
> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
> +
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP:
> +		mutex_lock(&sensor->lock);
> +		sel->r = *__t4ka3_get_pad_crop(sensor, state, sel->pad,
> +					       sel->which);
> +		mutex_unlock(&sensor->lock);
> +		break;
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +		sel->r.top = 0;
> +		sel->r.left = 0;
> +		sel->r.width = T4KA3_NATIVE_WIDTH;
> +		sel->r.height = T4KA3_NATIVE_HEIGHT;
> +		break;
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +		sel->r = t4ka3_default_crop;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int t4ka3_set_selection(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *state,
> +			       struct v4l2_subdev_selection *sel)
> +{
> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
> +	struct v4l2_mbus_framefmt *format;
> +	struct v4l2_rect *crop;
> +	struct v4l2_rect rect;
> +
> +	if (sel->target != V4L2_SEL_TGT_CROP)
> +		return -EINVAL;
> +
> +	/*
> +	 * Clamp the boundaries of the crop rectangle to the size of the sensor
> +	 * pixel array. Align to multiples of 2 to ensure Bayer pattern isn't
> +	 * disrupted.
> +	 */
> +	rect.left = clamp_val(ALIGN(sel->r.left, 2),
> +			      T4KA3_NATIVE_START_LEFT, T4KA3_NATIVE_WIDTH);
> +	rect.top = clamp_val(ALIGN(sel->r.top, 2),
> +			     T4KA3_NATIVE_START_TOP, T4KA3_NATIVE_HEIGHT);
> +	rect.width = clamp_val(ALIGN(sel->r.width, 2),
> +			       T4KA3_MIN_CROP_WIDTH, T4KA3_NATIVE_WIDTH);
> +	rect.height = clamp_val(ALIGN(sel->r.height, 2),
> +				T4KA3_MIN_CROP_HEIGHT, T4KA3_NATIVE_HEIGHT);
> +
> +	/* Make sure the crop rectangle isn't outside the bounds of the array */
> +	rect.width = min_t(unsigned int, rect.width,
> +			   T4KA3_NATIVE_WIDTH - rect.left);
> +	rect.height = min_t(unsigned int, rect.height,
> +			    T4KA3_NATIVE_HEIGHT - rect.top);
> +
> +	crop = __t4ka3_get_pad_crop(sensor, state, sel->pad, sel->which);
> +
> +	mutex_lock(&sensor->lock);
> +
> +	*crop = rect;
> +
> +	if (rect.width != crop->width || rect.height != crop->height) {
> +		/*
> +		 * Reset the output image size if the crop rectangle size has
> +		 * been modified.
> +		 */
> +		format = __t4ka3_get_pad_format(sensor, state, sel->pad,
> +						sel->which);
> +		format->width = rect.width;
> +		format->height = rect.height;
> +		if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> +			t4ka3_calc_mode(sensor);
> +	}
> +
> +	mutex_unlock(&sensor->lock);
> +
> +	sel->r = rect;
> +
> +	return 0;
> +}
> +
> +static int
> +t4ka3_enum_mbus_code(struct v4l2_subdev *sd,
> +		     struct v4l2_subdev_state *sd_state,
> +		     struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->index)
> +		return -EINVAL;
> +
> +	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +	return 0;
> +}
> +
> +static int t4ka3_enum_frame_size(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
> +	struct v4l2_rect *crop;
> +
> +	if (fse->index >= T4KA3_FRAME_SIZES)
> +		return -EINVAL;
> +
> +	crop = __t4ka3_get_pad_crop(sensor, sd_state, fse->pad, fse->which);
> +	if (!crop)
> +		return -EINVAL;
> +
> +	fse->min_width = crop->width / (fse->index + 1);
> +	fse->min_height = crop->height / (fse->index + 1);
> +	fse->max_width = fse->min_width;
> +	fse->max_height = fse->min_height;
> +
> +	return 0;
> +}
> +

> +static int
> +t4ka3_get_pad_format(struct v4l2_subdev *sd,
> +		     struct v4l2_subdev_state *sd_state,
> +		     struct v4l2_subdev_format *fmt)
> +{
> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
> +	struct v4l2_mbus_framefmt *format =
> +		__t4ka3_get_pad_format(sensor, sd_state, fmt->pad, fmt->which);
> +
> +	fmt->format = *format;
> +	return 0;
> +}

This entire t4ka3_get_pad_format() function can be dropped.

> +
> +static int t4ka3_check_hwcfg(struct t4ka3_data *sensor)
> +{
> +	struct fwnode_handle *fwnode = dev_fwnode(sensor->dev);
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	struct fwnode_handle *endpoint;
> +	unsigned int i;
> +	int ret;
> +
> +	/*
> +	 * Sometimes the fwnode graph is initialized by the bridge driver.
> +	 * Bridge drivers doing this may also add GPIO mappings, wait for this.
> +	 */
> +	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!endpoint)
> +		return dev_err_probe(sensor->dev, -EPROBE_DEFER,
> +				     "waiting for fwnode graph endpoint\n");
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> +	fwnode_handle_put(endpoint);
> +	if (ret)
> +		return ret;
> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> +		dev_err(sensor->dev, "only a 4-lane CSI2 config is supported");
> +		ret = -EINVAL;
> +		goto out_free_bus_cfg;
> +	}

This:

> +
> +	if (!bus_cfg.nr_of_link_frequencies) {
> +		dev_err(sensor->dev, "no link frequencies defined\n");
> +		ret = -EINVAL;
> +		goto out_free_bus_cfg;
> +	}
> +
> +	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
> +		if (bus_cfg.link_frequencies[i] == T4KA3_LINK_FREQ)
> +			break;
> +	}
> +
> +	if (i == bus_cfg.nr_of_link_frequencies) {
> +		dev_err(sensor->dev, "supported link freq %llu not found\n",
> +			T4KA3_LINK_FREQ);
> +		ret = -EINVAL;
> +		goto out_free_bus_cfg;
> +	}

Should be rewritten to use the new v4l2_link_freq_to_bitmap() helper,
see drivers/media/i2c/ov02c10.c for an example.

> +
> +out_free_bus_cfg:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}
> +
> +static int t4ka3_init_state(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *sd_state)
> +{
> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
> +
> +	*v4l2_subdev_state_get_crop(sd_state, 0) = t4ka3_default_crop;
> +
> +	t4ka3_fill_format(sensor, v4l2_subdev_state_get_format(sd_state, 0),
> +			  T4KA3_ACTIVE_WIDTH, T4KA3_ACTIVE_HEIGHT);
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops t4ka3_ctrl_ops = {
> +	.s_ctrl = t4ka3_s_ctrl,
> +};
> +
> +static const struct v4l2_subdev_video_ops t4ka3_video_ops = {
> +	.s_stream = t4ka3_s_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops t4ka3_pad_ops = {
> +	.enum_mbus_code = t4ka3_enum_mbus_code,
> +	.enum_frame_size = t4ka3_enum_frame_size,
> +	.get_fmt = t4ka3_get_pad_format,

This can be replaced by:

	.get_fmt = v4l2_subdev_get_fmt,

> +	.set_fmt = t4ka3_set_pad_format,
> +	.get_selection = t4ka3_get_selection,
> +	.set_selection = t4ka3_set_selection,
> +};
> +
> +static const struct v4l2_subdev_ops t4ka3_ops = {
> +	.video = &t4ka3_video_ops,
> +	.pad = &t4ka3_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops t4ka3_internal_ops = {
> +	.init_state = t4ka3_init_state,
> +};
> +
> +static int t4ka3_init_controls(struct t4ka3_data *sensor)
> +{
> +	const struct v4l2_ctrl_ops *ops = &t4ka3_ctrl_ops;
> +	struct t4ka3_ctrls *ctrls = &sensor->ctrls;
> +	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> +	struct v4l2_fwnode_device_properties props;
> +	int ret, min, max, def;
> +	static const char * const test_pattern_menu[] = {
> +		"Disabled",
> +		"Solid White",
> +		"Color Bars",
> +		"Gradient",
> +		"Random Data",
> +	};
> +
> +	v4l2_ctrl_handler_init(hdl, 11);
> +
> +	hdl->lock = &sensor->lock;
> +
> +	ctrls->vflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
> +	ctrls->hflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
> +
> +	ctrls->test_pattern = v4l2_ctrl_new_std_menu_items(hdl, ops,
> +							   V4L2_CID_TEST_PATTERN,
> +							   ARRAY_SIZE(test_pattern_menu) - 1,
> +							   0, 0, test_pattern_menu);
> +	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_LINK_FREQ,
> +						  0, 0, sensor->link_freq);
> +	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PIXEL_RATE,
> +					      0, T4KA3_PIXEL_RATE,
> +					      1, T4KA3_PIXEL_RATE);
> +
> +	t4ka3_get_vblank_limits(sensor, &min, &max, &def);
> +	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK, min, max, 1, def);
> +
> +	def = T4KA3_PIXELS_PER_LINE - sensor->mode.fmt.width;
> +	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
> +					  def, def, 1, def);
> +
> +	max = T4KA3_LINES_PER_FRAME_30FPS - T4KA3_COARSE_INTEGRATION_TIME_MARGIN;
> +	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
> +					    0, max, 1, max);
> +
> +	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
> +					T4KA3_MIN_GLOBAL_GAIN_SUPPORTED,
> +					T4KA3_MAX_GLOBAL_GAIN_SUPPORTED,
> +					1, T4KA3_MIN_GLOBAL_GAIN_SUPPORTED);
> +
> +	ret = v4l2_fwnode_device_parse(sensor->dev, &props);
> +	if (ret)
> +		return ret;
> +
> +	v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
> +
> +	if (hdl->error)
> +		return hdl->error;
> +
> +	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	sensor->sd.ctrl_handler = hdl;
> +	return 0;
> +}
> +
> +static int t4ka3_pm_suspend(struct device *dev)
> +{
> +	struct t4ka3_data *sensor = dev_get_drvdata(dev);
> +
> +	gpiod_set_value_cansleep(sensor->powerdown_gpio, 1);
> +	gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> +
> +	return 0;
> +}
> +
> +static int t4ka3_pm_resume(struct device *dev)
> +{
> +	struct t4ka3_data *sensor = dev_get_drvdata(dev);
> +	u16 sensor_id;
> +	int ret;
> +
> +	usleep_range(5000, 6000);
> +
> +	gpiod_set_value_cansleep(sensor->powerdown_gpio, 0);
> +	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> +
> +	/* waiting for the sensor after powering up */
> +	msleep(20);
> +
> +	ret = t4ka3_detect(sensor, &sensor_id);
> +	if (ret) {
> +		dev_err(sensor->dev, "sensor detect failed\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(t4ka3_pm_ops, t4ka3_pm_suspend, t4ka3_pm_resume, NULL);
> +
> +static void t4ka3_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
> +
> +	v4l2_async_unregister_subdev(&sensor->sd);
> +	media_entity_cleanup(&sensor->sd.entity);
> +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> +
> +	/*
> +	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
> +	 * make sure to turn power off manually.
> +	 */
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		t4ka3_pm_suspend(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +}
> +
> +static int t4ka3_probe(struct i2c_client *client)
> +{
> +	struct t4ka3_data *sensor;
> +	int ret;
> +
> +	/* allocate sensor device & init sub device */
> +	sensor = devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL);
> +	if (!sensor)
> +		return -ENOMEM;
> +
> +	sensor->dev = &client->dev;
> +
> +	ret = t4ka3_check_hwcfg(sensor);
> +	if (ret)
> +		return ret;
> +
> +	mutex_init(&sensor->lock);
> +
> +	sensor->link_freq[0] = T4KA3_LINK_FREQ;
> +	sensor->mode.crop = t4ka3_default_crop;
> +	t4ka3_fill_format(sensor, &sensor->mode.fmt, T4KA3_ACTIVE_WIDTH, T4KA3_ACTIVE_HEIGHT);
> +	t4ka3_calc_mode(sensor);
> +
> +	v4l2_i2c_subdev_init(&sensor->sd, client, &t4ka3_ops);
> +	sensor->sd.internal_ops = &t4ka3_internal_ops;
> +
> +	sensor->powerdown_gpio = devm_gpiod_get(&client->dev, "powerdown",
> +						GPIOD_OUT_HIGH);
> +	if (IS_ERR(sensor->powerdown_gpio))
> +		return dev_err_probe(&client->dev, PTR_ERR(sensor->powerdown_gpio),
> +				     "getting powerdown GPIO\n");
> +
> +	sensor->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> +						     GPIOD_OUT_HIGH);
> +	if (IS_ERR(sensor->reset_gpio))
> +		return dev_err_probe(&client->dev, PTR_ERR(sensor->reset_gpio),
> +				     "getting reset GPIO\n");
> +
> +	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(sensor->regmap))
> +		return PTR_ERR(sensor->regmap);
> +
> +	ret = t4ka3_pm_resume(sensor->dev);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_set_active(&client->dev);
> +	pm_runtime_get_noresume(&client->dev);
> +	pm_runtime_enable(&client->dev);
> +
> +	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	ret = t4ka3_init_controls(sensor);
> +	if (ret)
> +		goto err_controls;
> +
> +	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
> +	if (ret)
> +		goto err_controls;
> +
> +	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
> +	if (ret)
> +		goto err_media_entity;
> +
> +	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> +	pm_runtime_use_autosuspend(&client->dev);
> +	pm_runtime_put_autosuspend(&client->dev);
> +
> +	return 0;
> +
> +err_media_entity:
> +	media_entity_cleanup(&sensor->sd.entity);
> +err_controls:
> +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> +	pm_runtime_disable(&client->dev);
> +	pm_runtime_put_noidle(&client->dev);
> +	return ret;
> +}
> +
> +static struct acpi_device_id t4ka3_acpi_match[] = {
> +	{ "XMCC0003" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, t4ka3_acpi_match);
> +
> +static struct i2c_driver t4ka3_driver = {
> +	.driver = {
> +		.name = "t4ka3",
> +		.acpi_match_table = ACPI_PTR(t4ka3_acpi_match),
> +		.pm = pm_sleep_ptr(&t4ka3_pm_ops),
> +	},
> +	.probe = t4ka3_probe,
> +	.remove = t4ka3_remove,
> +};
> +module_i2c_driver(t4ka3_driver)
> +
> +MODULE_DESCRIPTION("A low-level driver for T4KA3 sensor");
> +MODULE_AUTHOR("HARVEY LV <harvey.lv@intel.com>");

Maybe add a second MODULE_AUTHOR() line with yourself as author ?

> +MODULE_LICENSE("GPL");

Regards,

Hans


