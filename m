Return-Path: <linux-media+bounces-45224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3CFBFB8DE
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 13:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B56AE5655B7
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 11:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F4E328B54;
	Wed, 22 Oct 2025 11:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlhxHTXv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABE0321441;
	Wed, 22 Oct 2025 11:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131350; cv=none; b=TMbVBNaCI+frMfahJeOEUNntO+uRQ9OjPat8mqULyykhWakn1QyBbQZB6TSTefCx0YssOTSdNUlZz+NzDYOP11IaNHPrw/dL97xuX3nRZVRMBOInPqBkF5MC32IsddNRjFpujcMpSZ69zdmOiyycg8JBw4BSvn2QnErCCi8qbtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131350; c=relaxed/simple;
	bh=uIzMuG2AzO6aliumJjQ7zIrKFBUIxk8ibG2d7kpfrMM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=elV7JKcy3ub/zvFzhx7YPeQaCetiFuWIYOtDdOZyW8QZpvXzcuv05/00CIlJPNGRIf/1tmmvc+8r2XLQSDTxGx7u0KCFdr50E4l1qhaFOjRNa5RFExzA98RVhmR8pAj7yXksgebEHI4f5Ou8XE4JWIebsnmHEDNX3FbkU1pHWAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlhxHTXv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC4DC4CEF5;
	Wed, 22 Oct 2025 11:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761131350;
	bh=uIzMuG2AzO6aliumJjQ7zIrKFBUIxk8ibG2d7kpfrMM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=YlhxHTXv3tX16u0vIHmm816Z8w3XFk2QpvDAgmwxj9MVKwFiNEqOECda4my0rxt2G
	 CpyhrQhsckyXNJNezYPaoe5db/vS1MWM+/1uNXuWIOMDNYd5eZzsn9bnNs/Gnk67A7
	 j9DxpQesPdt6ZrsgCRDIUZX+RKR/bjw3/DIBpnnN8KCoskFkp2X3teJcjT2BOh3Ml9
	 b3embCx8WpmMUs/Tt121eQkQhuS/Wxyloq4wWLD97J5UlePsLAVOWjEu1oGFl79gRU
	 dR5JfROlRh0ZpKCN6KQ60TGoGe0GRR25zdDdI59zZ5JlgL5mFcoWUCPjMZWDvV8MN0
	 T4bLhXTowPnAA==
Message-ID: <0ff4c0e0-be18-4e76-adbb-c4f3736edd1d@kernel.org>
Date: Wed, 22 Oct 2025 13:09:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v9] media: Add t4ka3 camera sensor driver
To: kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251021080325.141435-1-hpa@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <20251021080325.141435-1-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 21-Oct-25 10:03, kate Hsuan wrote:
> From: Kate Hsuan <hpa@redhat.com>
> 
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
> Co-developed-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
> Changes in v9:
> 1. Apply Hans' fix patch to fix the lock issue and squash it into this
>    patch.
> https://lore.kernel.org/linux-media/33dd5660-efb6-47e0-9672-f3ae65751185@kernel.org/

Thank you for the new version. Some small review remarks below.

...

> +static void t4ka3_fill_format(struct t4ka3_data *sensor,
> +			      struct v4l2_mbus_framefmt *fmt,
> +			      unsigned int width, unsigned int height)
> +{
> +	memset(fmt, 0, sizeof(*fmt));
> +	fmt->width = width;
> +	fmt->height = height;
> +	fmt->field = V4L2_FIELD_NONE;
> +	fmt->colorspace = V4L2_COLORSPACE_SRGB;

Since the sensor gives raw uncalibrated color data this should be:

	fmt->colorspace = V4L2_COLORSPACE_RAW;

> +	t4ka3_set_bayer_order(sensor, fmt);
> +}

...

> +static int t4ka3_set_pad_format(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_format *format)
> +{
> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
> +	struct v4l2_mbus_framefmt *try_fmt;
> +	struct v4l2_mbus_framefmt *fmt;
> +	const struct v4l2_rect *crop;
> +	unsigned int width, height;
> +	int min, max, def, ret = 0;
> +
> +	crop = t4ka3_get_active_crop(sensor);
> +	fmt = t4ka3_get_active_format(sensor);
> +
> +	/* Limit set_fmt max size to crop width / height */
> +	width = clamp_val(ALIGN(format->format.width, 2),
> +			  T4KA3_MIN_CROP_WIDTH, crop->width);
> +	height = clamp_val(ALIGN(format->format.height, 2),
> +			   T4KA3_MIN_CROP_HEIGHT, crop->height);
> +	t4ka3_fill_format(sensor, &format->format, width, height);
> +
> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		try_fmt = v4l2_subdev_state_get_format(sd_state, 0);
> +		*try_fmt = format->format;
> +		return 0;
> +	}
> +
> +	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE && sensor->streaming)
> +		return -EBUSY;
> +
> +	*v4l2_subdev_state_get_format(sd_state, 0) = format->format;
> +
> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> +		return 0;
> +
> +	t4ka3_calc_mode(sensor);
> +
> +	/* vblank range is height dependent adjust and reset to default */
> +	t4ka3_get_vblank_limits(sensor, &min, &max, &def);
> +	ret = __v4l2_ctrl_modify_range(sensor->ctrls.vblank, min, max, 1, def);
> +	if (ret)
> +		return ret;
> +
> +	ret = __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, def);
> +	if (ret)
> +		return ret;
> +
> +	def = T4KA3_ACTIVE_WIDTH - fmt->width;

This should be:

	def = T4KA3_PIXELS_PER_LINE - fmt->width;

> +	ret = __v4l2_ctrl_modify_range(sensor->ctrls.hblank, def, def, 1, def);
> +	if (ret)
> +		return ret;

Add a blank line here please.

> +	ret = __v4l2_ctrl_s_ctrl(sensor->ctrls.hblank, def);
> +	if (ret)
> +		return ret;
> +
> +	/* exposure range depends on vts which may have changed */
> +	ret = t4ka3_update_exposure_range(sensor);

This is not necessary as the t4ka3_s_ctrl(vblank) call above
calls t4ka3_s_ctrl(VBLANK) which already does this, so the comment
and the call can be dropped and then the "return ret" here:

> +	return ret;

can be replaced by a simple "return 0;"

> +}

...

> +static int t4ka3_enable_stream(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> +			       u32 pad, u64 streams_mask)
> +{
> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(sensor->sd.dev);
> +	if (ret < 0) {
> +		dev_err(sensor->dev, "power-up err.\n");
> +		goto error_exit;

This is wrong even on failure pm_runtime_get...() still
increases the pm-counter, so this should be goto error_powerdown; and
then the unused error_exit label can be removed.

> +	}
> +
> +	cci_multi_reg_write(sensor->regmap, t4ka3_init_config,
> +			    ARRAY_SIZE(t4ka3_init_config), &ret);
> +	/* enable group hold */
> +	cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 1, &ret);
> +	cci_multi_reg_write(sensor->regmap, t4ka3_pre_mode_set_regs,
> +			    ARRAY_SIZE(t4ka3_pre_mode_set_regs), &ret);
> +	if (ret)
> +		goto error_powerdown;
> +
> +	ret = t4ka3_set_mode(sensor);
> +	if (ret)
> +		goto error_powerdown;
> +
> +	ret = cci_multi_reg_write(sensor->regmap, t4ka3_post_mode_set_regs,
> +				  ARRAY_SIZE(t4ka3_post_mode_set_regs), NULL);
> +	if (ret)
> +		goto error_powerdown;
> +
> +	/* Restore value of all ctrls */
> +	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> +	if (ret)
> +		goto error_powerdown;
> +
> +	/* disable group hold */
> +	cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 0, &ret);
> +	cci_write(sensor->regmap, T4KA3_REG_STREAM, 1, &ret);
> +	if (ret)
> +		goto error_powerdown;
> +
> +	sensor->streaming = 1;
> +
> +	return ret;

Please use return 0 here.

> +
> +error_powerdown:
> +	pm_runtime_put(sensor->sd.dev);
> +error_exit:
> +	return ret;
> +}

...

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

It is better to replace these 2 clamps:

> +	rect.width = clamp_val(ALIGN(sel->r.width, 2),
> +			       T4KA3_MIN_CROP_WIDTH, T4KA3_NATIVE_WIDTH);
> +	rect.height = clamp_val(ALIGN(sel->r.height, 2),
> +				T4KA3_MIN_CROP_HEIGHT, T4KA3_NATIVE_HEIGHT);

with:

	rect.width = clamp_val(ALIGN(sel->r.width, 2), T4KA3_MIN_CROP_WIDTH,
			       T4KA3_NATIVE_WIDTH - rect.left);
	rect.height = clamp_val(ALIGN(sel->r.height, 2), T4KA3_MIN_CROP_HEIGHT,
				T4KA3_NATIVE_HEIGHT - rect.top);

then this first clamp for width / height also makes sure width / height
are not too large and then this comment + 2 more "clamps":

> +	/* Make sure the crop rectangle isn't outside the bounds of the array */
> +	rect.width = min_t(unsigned int, rect.width,
> +			   T4KA3_NATIVE_WIDTH - rect.left);
> +	rect.height = min_t(unsigned int, rect.height,
> +			    T4KA3_NATIVE_HEIGHT - rect.top);

can be dropped.

> +
> +	crop = v4l2_subdev_state_get_crop(state, sel->pad);
> +
> +	*crop = rect;

This assignment needs to be moved to after the check below if the crop
size has changed. When doing this assignment first then the below check
for changed size will always fail because crop and rect are now the same.

(after moving down please group the assingment with the "sel->r = rect"
assignment)

> +
> +	if (rect.width != crop->width || rect.height != crop->height) {
> +		/*
> +		 * Reset the output image size if the crop rectangle size has
> +		 * been modified.
> +		 */
> +		format = v4l2_subdev_state_get_format(state, sel->pad);
> +		format->width = rect.width;
> +		format->height = rect.height;
> +		if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> +			t4ka3_calc_mode(sensor);
> +	}
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
> +	struct v4l2_rect *crop;
> +
> +	if (fse->index >= T4KA3_FRAME_SIZES)
> +		return -EINVAL;
> +
> +	crop = v4l2_subdev_state_get_crop(sd_state, fse->pad);
> +	if (!crop)
> +		return -EINVAL;

There is no need to check for !crop. Now that the active-state
from the subdev is used there will always be a crop rect.

> +
> +	fse->min_width = crop->width / (fse->index + 1);
> +	fse->min_height = crop->height / (fse->index + 1);
> +	fse->max_width = fse->min_width;
> +	fse->max_height = fse->min_height;
> +
> +	return 0;
> +}

...

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
> +	v4l2_subdev_lock_state(sensor->sd.active_state);
> +	t4ka3_calc_mode(sensor);
> +	t4ka3_get_vblank_limits(sensor, &min, &max, &def);
> +	v4l2_subdev_unlock_state(sensor->sd.active_state);
> +
> +	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK, min, max, 1, def);
> +
> +	def = T4KA3_ACTIVE_WIDTH;

This should be :

	def = T4KA3_PIXELS_PER_LINE - T4KA3_ACTIVE_WIDTH;

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

...

> +static void t4ka3_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
> +
> +	v4l2_async_unregister_subdev(&sensor->sd);

You are missing a v4l2_subdev_cleanup(sd); here (this is the
cleanup for the recently added v4l2_subdev_init_finalize() call.

> +	media_entity_cleanup(&sensor->sd.entity);
> +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);

Also lets move media_entity_cleanup() last so that things
are in the exact reverse order of probe(), so that will
result in:

	v4l2_async_unregister_subdev(&sensor->sd);
	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
	v4l2_subdev_cleanup(sd);
	media_entity_cleanup(&sensor->sd.entity);


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
> +	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
> +	if (ret)
> +		goto err_media_entity;

If functions fail, there matching cleanup function should not be
called, so this should be a "goto err_pm_disable;"

> +
> +	sensor->sd.state_lock = sensor->ctrls.handler.lock;
> +	ret = v4l2_subdev_init_finalize(&sensor->sd);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to init subdev: %d", ret);
> +		goto err_subdev_entry;

and this should be a "goto err_media_entity_cleanup;"

> +	}
> +
> +	ret = t4ka3_init_controls(sensor);
> +	if (ret)
> +		goto err_controls;

controls are special and do need have v4l2_ctrl_handler_free()
called on error to init, so this is correct,

> +
> +	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
> +	if (ret)
> +		goto err_subdev_entry;

But this should also be "goto err_controls;"

> +
> +	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> +	pm_runtime_use_autosuspend(&client->dev);
> +	pm_runtime_put_autosuspend(&client->dev);
> +
> +	return 0;
> +
> +err_subdev_entry:
> +	v4l2_subdev_cleanup(&sensor->sd);
> +
> +err_controls:
> +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);

and the order of these 2 is wrong, now if t4ka3_init_controls()
fails, the v4l2_subdev_cleanup() is skipped even though
v4l2_subdev_init_finalize() has run.

> +
> +err_media_entity:
> +	media_entity_cleanup(&sensor->sd.entity);
> +	pm_runtime_disable(&client->dev);
> +	pm_runtime_put_noidle(&client->dev);

probe() has done a t4ka3_pm_resume() before it gets
here, so this needs a t4ka3_pm_suspend() to match.

After all this is fixed, the error exit paths
with the gotos should look like this:

err_controls:
	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
	v4l2_subdev_cleanup(&sensor->sd);

err_media_entity:
	media_entity_cleanup(&sensor->sd.entity);

err_pm_disable:
	pm_runtime_disable(&client->dev);
	pm_runtime_put_noidle(&client->dev);
	t4ka3_pm_suspend(&client->dev);

> +
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
> +MODULE_AUTHOR("Kate Hsuan <hpa@redhat.com>");
> +MODULE_LICENSE("GPL");

Regards,

Hans



