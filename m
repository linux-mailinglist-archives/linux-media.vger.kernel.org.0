Return-Path: <linux-media+bounces-42228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADA1B51BB1
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 17:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CCF048009B
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 15:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6AD7263C8A;
	Wed, 10 Sep 2025 15:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W515TOgs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A0525EFB6;
	Wed, 10 Sep 2025 15:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757518343; cv=none; b=DdloSoi/GRc0HXwGXdbITfnFDCmWml6VCYTosPL27yn8nIExb9LAQGrnIBJ2I5OM2R3/8qLQktLaBPkdfNZBRZxeIj+lGpcdeIagxD/ktubKSSNDRPN2Mt50ywIc3phiQIPeoUHib3YrYKYznsBpRmiO7uQxfdHP9kBG7mq6OQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757518343; c=relaxed/simple;
	bh=0Kox1K9IKUaALUELg3xZMWgC5uhixVkV10wNqJ3TmbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m3bZym1wevm1JDcVjy2CAKRuJulXC31bUKCHOacxIA1CfoafquE1osAnSv7q/lfsS6Yw7F58PZA/n6yICx0vVdJdlcyHpdlXex/n/0yL8HYoWa3KTJ8CXF2p0XU9C3Fk47rpxJJtBS7XeKCqBMR7symkYAyJDjeR0y1cWQGEYrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W515TOgs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B0EC4CEEB;
	Wed, 10 Sep 2025 15:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757518341;
	bh=0Kox1K9IKUaALUELg3xZMWgC5uhixVkV10wNqJ3TmbQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W515TOgsoauVP18anwqFy3WrY9gVIGoJrXRr2nvIvKDLfJWpjbnEngE971mkIGvXC
	 hdI7G32iehc0ML43gkMv1SsF/u6LGNm+JhwgE/fJQStONfbU27vyqfjfyTu/CCyXH9
	 uu7MgTTHDZmQS4yRAMnTDvP3w3Rl/93G3INI8Zk8H1TDoKqrTL/91QFEHuxrpSL56C
	 andKxwazaVhHceXjcLOYNB6aUOlEbO/88iPPCFYt2Rhga/rdXS8hwFm+nvHYqULkCF
	 hKHHrFW5XsSV98N5MZ3k8vo3oWR2VivwDnNZkT/pTygxmrSeBy+H5HQi9/iDOQdvN1
	 r58nxF4pG+ZvA==
Message-ID: <9d73a955-e242-42c6-804b-a11d8e8d24ed@kernel.org>
Date: Wed, 10 Sep 2025 17:32:18 +0200
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

p.s.

On 8-Nov-24 10:18 AM, Kate Hsuan wrote:

...

> diff --git a/drivers/media/i2c/t4ka3.c b/drivers/media/i2c/t4ka3.c
> new file mode 100644
> index 000000000000..ec0fcccf93b7
> --- /dev/null
> +++ b/drivers/media/i2c/t4ka3.c
> +static int t4ka3_update_exposure_range(struct t4ka3_data *sensor)
> +{
> +	int exp_max = sensor->mode.fmt.height + sensor->ctrls.vblank->val -
> +		      T4KA3_COARSE_INTEGRATION_TIME_MARGIN;

The sensor->mode.fmt.height on the line above will no longer work

Instead you will need something like this:

	struct v4l2_subdev_state *active_state =
		v4l2_subdev_get_locked_active_state(&sensor->sd);
	struct v4l2_mbus_framefmt *active_fmt =
		v4l2_subdev_state_get_format(active_state, 0);
	int exp_max = active_fmt->height + sensor->ctrls.vblank->val -
		      T4KA3_COARSE_INTEGRATION_TIME_MARGIN;

> +
> +	return __v4l2_ctrl_modify_range(sensor->ctrls.exposure, 0, exp_max,
> +					1, exp_max);
> +}

...

> +static void t4ka3_calc_mode(struct t4ka3_data *sensor)
> +{
> +	int width = sensor->mode.fmt.width;
> +	int height = sensor->mode.fmt.height;

And a similar change here, ...

Except that this one is also going to need active_crop.

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

and here.

> +	*min = T4KA3_MIN_VBLANK + (sensor->mode.binning - 1) * sensor->mode.fmt.height;
> +	*max = T4KA3_MAX_VBLANK - sensor->mode.fmt.height;
> +	*def = T4KA3_LINES_PER_FRAME_30FPS - sensor->mode.fmt.height;
> +}

...

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

and here you will also need to get the active_fmt and
pass that to t4ka3_set_bayer_order()

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

Idem.

> +	return 0;
> +}

Note t4ka3_t_vflip() + t4ka3_t_hflip() should be merged
into 1: t4ka3_set_vflip() helper which takes an "u8 flip_bit"
as extra arg. These 2 are identical other then using
T4KA3_HFLIP_BIT vs T4KA3_VFLIP_BIT so just make that an arch
and merge the 2.


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

Again pass active format here.

It seems that a t4ka3_get_active_fmt(struct t4ka3_data *sensor)
helper would be good, instead of writing this out everywhere.




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

idem.


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

And another place where we will need active_fmt.
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
> +	t4ka3_get_vblank_limits(sensor, &min, &max, &def);
> +	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK, min, max, 1, def);
> +
> +	def = T4KA3_PIXELS_PER_LINE - sensor->mode.fmt.width;
> +	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
> +					  def, def, 1, def);

Here you can just use T4KA3_ACTIVE_WIDTH instead.

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

These 2 lines:

> +	sensor->mode.crop = t4ka3_default_crop;
> +	t4ka3_fill_format(sensor, &sensor->mode.fmt, T4KA3_ACTIVE_WIDTH, T4KA3_ACTIVE_HEIGHT);

can be dropped.

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

Regards,

Hans


