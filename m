Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6866861B59
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2019 09:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729487AbfGHHpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 03:45:46 -0400
Received: from mga17.intel.com ([192.55.52.151]:1429 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726015AbfGHHpq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jul 2019 03:45:46 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jul 2019 00:45:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,465,1557212400"; 
   d="scan'208";a="340375852"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.193]) ([10.238.232.193])
  by orsmga005.jf.intel.com with ESMTP; 08 Jul 2019 00:45:39 -0700
Subject: Re: [RFC,V2,2/2] media: i2c: Add Omnivision OV02A10 camera sensor
 driver
To:     dongchun.zhu@mediatek.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, sakari.ailus@linux.intel.com,
        --to=drinkcat@chromium.org, tfiga@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com
Cc:     srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
References: <20190704084651.3105-1-dongchun.zhu@mediatek.com>
 <20190704084651.3105-3-dongchun.zhu@mediatek.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <a18d0cd6-ab6d-bc63-d818-188d5e54dd4d@linux.intel.com>
Date:   Mon, 8 Jul 2019 15:52:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190704084651.3105-3-dongchun.zhu@mediatek.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/4/19 4:46 PM, dongchun.zhu@mediatek.com wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> 
> This patch adds a V4L2 sub-device driver for OV02A10 image sensor.
> The OV02A10 is a 1/5" CMOS sensor from Omnivision.
> Supports output format: 10-bit Raw.
> The OV02A10 has a single MIPI lane interface and use the I2C bus for control and the CSI-2 bus for data.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> 
snip
> +
> +/* MIPI color bar enable output */
> +static const struct regval ov02a10_test_pattern_enable_regs[] = {
> +	{0xfd, 0x01},
> +	{0x0d, 0x00},
> +	{0xb6, 0x01},
> +	{0x01, 0x01},
> +	{0xfd, 0x01},
> +	{0xac, 0x01},
> +	{REG_NULL, 0x00}
Actually, you can use ARRAY_SIZE to write the regs, the REG_NULL can be
removed. However, it is not a problem.
...
snip...
> +static int ov02a10_set_fmt(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_pad_config *cfg,
> +			   struct v4l2_subdev_format *fmt)
> +{
> +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> +	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> +	int ret = 0;
> +
> +	mutex_lock(&ov02a10->mutex);
> +
> +	if (ov02a10->streaming) {
> +		ret = -EBUSY;
> +		goto unlock;
I like return -EBUSY directly after mutex_unlock here and return 0 below.
> +	}
> +
> +	/* only one mode supported */
> +	mbus_fmt->code = ov02a10->fmt.code;
> +	ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> +	ov02a10->fmt = fmt->format;
> +
> +unlock:
> +	mutex_unlock(&ov02a10->mutex);
> +
> +	return ret;
> +}
> +
> +static int ov02a10_get_fmt(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_pad_config *cfg,
> +			   struct v4l2_subdev_format *fmt)
> +{
> +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> +	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> +
> +	mutex_lock(&ov02a10->mutex);
> +
> +	fmt->format = ov02a10->fmt;
> +	mbus_fmt->code = ov02a10->fmt.code;
> +	ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> +
> +	mutex_unlock(&ov02a10->mutex);
> +
> +	return 0;
> +}
> +
> +static int ov02a10_enum_mbus_code(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_pad_config *cfg,
> +				  struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> +
> +	if (code->index >= ARRAY_SIZE(supported_modes) || !(code->index))
> +		return -EINVAL;
> +
> +	code->code = ov02a10->fmt.code;
> +
> +	return 0;
> +}
> +
> +static int ov02a10_enum_frame_sizes(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_pad_config *cfg,
> +				    struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	if (fse->index >= ARRAY_SIZE(supported_modes) || !(fse->index))
> +		return -EINVAL;
> +
> +	fse->min_width  = supported_modes[fse->index].width;
> +	fse->max_width  = supported_modes[fse->index].width;
> +	fse->max_height = supported_modes[fse->index].height;
> +	fse->min_height = supported_modes[fse->index].height;
> +
> +	return 0;
> +}
> +
> +static int __ov02a10_power_on(struct ov02a10 *ov02a10)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	struct device *dev = &client->dev;
> +	int ret;
> +
> +	ret = clk_prepare_enable(ov02a10->xvclk);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable xvclk\n");
> +		return ret;
> +	}
> +
> +	/* note: set 0 is high, set 1 is low */
> +	gpiod_set_value_cansleep(ov02a10->reset_gpio, 1);
> +	gpiod_set_value_cansleep(ov02a10->pwdn_gpio, 0);
> +
> +	ret = regulator_bulk_enable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators\n");
> +		goto disable_clk;
> +	}
> +	msleep_range(7);
> +
> +	gpiod_set_value_cansleep(ov02a10->pwdn_gpio, 1);
> +	msleep_range(10);
> +
> +	gpiod_set_value_cansleep(ov02a10->reset_gpio, 0);
> +	msleep_range(10);
> +
> +	return 0;
> +
> +disable_clk:
> +	clk_disable_unprepare(ov02a10->xvclk);
> +
> +	return ret;
> +}
> +
> +static void __ov02a10_power_off(struct ov02a10 *ov02a10)
> +{
> +	clk_disable_unprepare(ov02a10->xvclk);
> +	gpiod_set_value_cansleep(ov02a10->reset_gpio, 1);
> +	gpiod_set_value_cansleep(ov02a10->pwdn_gpio, 1);
> +	regulator_bulk_disable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> +}
> +
> +static int __ov02a10_start_stream(struct ov02a10 *ov02a10)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	int ret;
> +
> +	/* Apply default values of current mode */
> +	ret = ov02a10_write_array(ov02a10, ov02a10->cur_mode->reg_list);
> +	if (ret)
> +		return ret;
> +
> +	/* Apply customized values from user */
> +	ret = __v4l2_ctrl_handler_setup(ov02a10->subdev.ctrl_handler);
> +	if (ret)
> +		return ret;
> +
> +	/* Set Orientation be 180 degree */
Set orientation to 180 degree
> +	if (ov02a10->upside_down) {
> +		ret = ov02a10_write_reg(ov02a10, REG_MIRROR_FLIP_CONTROL,
> +					REG_CONFIG_MIRROR_FLIP);
> +		if (ret) {
> +			dev_err(&client->dev, "%s failed to set orientation\n",
> +				__func__);
> +			return ret;
> +		}
> +		ret = ov02a10_write_reg(ov02a10, REG_GLOBAL_EFFECTIVE,
> +					REG_ENABLE);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/* set stream on register */
> +	return ov02a10_write_reg(ov02a10,
> +				 REG_SC_CTRL_MODE, SC_CTRL_MODE_STREAMING);
> +}
> +
> +static int __ov02a10_stop_stream(struct ov02a10 *ov02a10)
> +{
> +	return ov02a10_write_reg(ov02a10,
> +				 REG_SC_CTRL_MODE, SC_CTRL_MODE_STANDBY);
> +}
> +
> +static int ov02a10_entity_init_cfg(struct v4l2_subdev *subdev,
> +				   struct v4l2_subdev_pad_config *cfg)
> +{
> +	struct v4l2_subdev_format fmt = { 0 };
> +
> +	fmt.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> +	fmt.format.width = 1600;
> +	fmt.format.height = 1200;
> +
> +	ov02a10_set_fmt(subdev, cfg, &fmt);
> +
> +	return 0;
> +}
> +
> +static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
> +{
> +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	int ret = 0;
> +
> +	dev_dbg(&client->dev, "ov02a10 s_stream (%d)\n", on);
> +	mutex_lock(&ov02a10->mutex);
> +
> +	if (ov02a10->streaming == on)
> +		goto unlock_and_return;
> +
> +	if (on) {
> +		ret = pm_runtime_get_sync(&client->dev);
> +		if (ret < 0) {
> +			pm_runtime_put_noidle(&client->dev);
> +			goto unlock_and_return;
> +		}
> +
> +		ret = __ov02a10_start_stream(ov02a10);
> +		if (ret) {
> +			__ov02a10_stop_stream(ov02a10);
> +			ov02a10->streaming = !on;
> +			goto err_rpm_put;
> +		}
> +	} else {
> +		__ov02a10_stop_stream(ov02a10);
> +		pm_runtime_put(&client->dev);
> +	}
> +
> +	ov02a10->streaming = on;
> +	mutex_unlock(&ov02a10->mutex);
> +
> +	return ret;
> +
> +err_rpm_put:
> +	pm_runtime_put(&client->dev);
> +unlock_and_return:
> +	mutex_unlock(&ov02a10->mutex);
> +
> +	return ret;
> +}
> +
> +static int ov02a10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> +	struct v4l2_mbus_framefmt *try_fmt = v4l2_subdev_get_try_format(sd,
> +									fh->pad,
> +									0);
> +
> +	mutex_lock(&ov02a10->mutex);
> +	/* Initialize try_fmt */
> +	try_fmt->code = ov02a10->fmt.code;
> +	ov02a10_fill_fmt(&supported_modes[0], try_fmt);
> +
> +	mutex_unlock(&ov02a10->mutex);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused ov02a10_runtime_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> +
> +	return __ov02a10_power_on(ov02a10);
> +}
> +
> +static int __maybe_unused ov02a10_runtime_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> +
> +	__ov02a10_power_off(ov02a10);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops ov02a10_pm_ops = {
> +	SET_RUNTIME_PM_OPS(ov02a10_runtime_suspend,
> +			   ov02a10_runtime_resume, NULL)
> +};
> +
> +static int ov02a10_set_test_pattern(struct ov02a10 *ov02a10, s32 value)
> +{
> +	if (value)
> +		return ov02a10_write_array(ov02a10,
> +					   ov02a10_test_pattern_enable_regs);
> +
> +	return ov02a10_write_array(ov02a10,
> +		ov02a10_test_pattern_disable_regs);
> +}
> +
> +static int ov02a10_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov02a10 *ov02a10 = container_of(ctrl->handler,
> +					     struct ov02a10, ctrl_handler);
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	s64 max_expo;
> +	int ret;
> +
> +	/* Propagate change of current control to all related controls */
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		/* Update max exposure while meeting expected vblanking */
> +		max_expo = ov02a10->cur_mode->height + ctrl->val - 4;
> +		__v4l2_ctrl_modify_range(ov02a10->exposure,
> +					 ov02a10->exposure->minimum, max_expo,
> +					 ov02a10->exposure->step,
> +					 ov02a10->exposure->default_value);
> +	}
> +
> +	/* V4L2 controls values will be applied only when power is already up */
> +	if (!pm_runtime_get_if_in_use(&client->dev))
> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
> +		ret = ov02a10_write_reg(ov02a10, REG_PAGE_SWITCH, REG_ENABLE);
> +		if (ret < 0)
> +			return ret;
> +		ret = ov02a10_write_reg(ov02a10, OV02A10_REG_EXPOSURE_H,
> +					((ctrl->val >> 8) & 0xFF));
> +		if (!ret) {
> +			ret = ov02a10_write_reg(ov02a10, OV02A10_REG_EXPOSURE_L,
> +						(ctrl->val & 0xFF));
> +			if (ret < 0)
> +				return ret;
> +		}
> +		ret = ov02a10_write_reg(ov02a10, REG_GLOBAL_EFFECTIVE,
> +					REG_ENABLE);
> +		if (ret < 0)
> +			return ret;
> +		break;
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret = ov02a10_write_reg(ov02a10, REG_PAGE_SWITCH, REG_ENABLE);
> +		if (ret < 0)
> +			return ret;
> +		ret = ov02a10_write_reg(ov02a10, OV02A10_REG_GAIN,
> +					(ctrl->val & 0xFF));
> +		if (ret < 0)
> +			return ret;
> +		ret = ov02a10_write_reg(ov02a10, REG_GLOBAL_EFFECTIVE,
> +					REG_ENABLE);
> +		if (ret < 0)
> +			return ret;
> +		break;
> +	case V4L2_CID_VBLANK:
> +		ret = ov02a10_write_reg(ov02a10, REG_PAGE_SWITCH, REG_ENABLE);
> +		if (ret < 0)
> +			return ret;
> +		ret = ov02a10_write_reg(ov02a10, OV02A10_REG_VTS_H,
> +					(((ctrl->val +
> +					ov02a10->cur_mode->height - 1224) >> 8)
> +					& 0xFF));
1224 is hard-coded here, could you add some comments? Is it a sensor
setting sensitive value?
> +		if (!ret) {
> +			ret = ov02a10_write_reg(ov02a10, OV02A10_REG_VTS_L,
> +						((ctrl->val +
> +						ov02a10->cur_mode->height -
> +						1224) & 0xFF));
ditto.
> +			if (ret < 0)
> +				return ret;
> +		}
> +		ret = ov02a10_write_reg(ov02a10, REG_GLOBAL_EFFECTIVE,
> +					REG_ENABLE);
> +		if (ret < 0)
> +			return ret;
> +		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = ov02a10_set_test_pattern(ov02a10, ctrl->val);
> +		if (ret < 0)
> +			return ret;
> +		break;
> +	default:
> +		dev_warn(&client->dev, "%s Unhandled id:0x%x, val:0x%x\n",
> +			 __func__, ctrl->id, ctrl->val);
> +		ret = -EINVAL;
> +		break;
> +	};
> +
> +	pm_runtime_put(&client->dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_video_ops ov02a10_video_ops = {
> +	.s_stream = ov02a10_s_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops ov02a10_pad_ops = {
> +	.init_cfg = ov02a10_entity_init_cfg,
> +	.enum_mbus_code = ov02a10_enum_mbus_code,
> +	.enum_frame_size = ov02a10_enum_frame_sizes,
> +	.get_fmt = ov02a10_get_fmt,
> +	.set_fmt = ov02a10_set_fmt,
> +};
> +
> +static const struct v4l2_subdev_ops ov02a10_subdev_ops = {
> +	.video	= &ov02a10_video_ops,
> +	.pad	= &ov02a10_pad_ops,
> +};
> +
> +static const struct media_entity_operations ov02a10_subdev_entity_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +static const struct v4l2_subdev_internal_ops ov02a10_internal_ops = {
> +	.open = ov02a10_open,
> +};
> +
> +static const struct v4l2_ctrl_ops ov02a10_ctrl_ops = {
> +	.s_ctrl = ov02a10_set_ctrl,
> +};
> +
> +static int ov02a10_initialize_controls(struct ov02a10 *ov02a10)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	const struct ov02a10_mode *mode;
> +	struct v4l2_ctrl_handler *handler;
> +	struct v4l2_ctrl *ctrl;
> +	u64 exposure_max;
> +	u32 pixel_rate, h_blank;
> +	int ret;
> +
> +	handler = &ov02a10->ctrl_handler;
> +	mode = ov02a10->cur_mode;
> +	ret = v4l2_ctrl_handler_init(handler, 10);
> +	if (ret)
> +		return ret;
> +	handler->lock = &ov02a10->mutex;
> +
> +	ctrl = v4l2_ctrl_new_int_menu(handler, NULL, V4L2_CID_LINK_FREQ,
> +				      0, 0, link_freq_menu_items);
> +	if (ctrl)
> +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	pixel_rate = (link_freq_menu_items[0] * 2 * OV02A10_LANES) /
> +		     OV02A10_BITS_PER_SAMPLE;
> +	v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE,
> +			  0, pixel_rate, 1, pixel_rate);
> +
> +	h_blank = mode->hts_def - mode->width;
> +	ov02a10->hblank = v4l2_ctrl_new_std(handler, NULL, V4L2_CID_HBLANK,
> +					    h_blank, h_blank, 1, h_blank);
> +	if (ov02a10->hblank)
> +		ov02a10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	ov02a10->vblank = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
> +					    V4L2_CID_VBLANK, mode->vts_def -
> +					    mode->height,
> +					    OV02A10_VTS_MAX - mode->height, 1,
> +					    mode->vts_def - mode->height);
> +
> +	exposure_max = mode->vts_def - 4;
> +	ov02a10->exposure = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
> +					      V4L2_CID_EXPOSURE,
> +					      OV02A10_EXPOSURE_MIN,
> +					      exposure_max,
> +					      OV02A10_EXPOSURE_STEP,
> +					      mode->exp_def);
> +
> +	ov02a10->anal_gain = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
> +					       V4L2_CID_ANALOGUE_GAIN,
> +					       OV02A10_GAIN_MIN,
> +					       OV02A10_GAIN_MAX,
> +					       OV02A10_GAIN_STEP,
> +					       OV02A10_GAIN_DEFAULT);
> +
> +	ov02a10->test_pattern =
> +	   v4l2_ctrl_new_std_menu_items(handler,
> +					&ov02a10_ctrl_ops,
> +					V4L2_CID_TEST_PATTERN,
> +					ARRAY_SIZE(ov02a10_test_pattern_menu) -
> +					1, 0, 0, ov02a10_test_pattern_menu);
> +
> +	if (handler->error) {
> +		ret = handler->error;
> +		dev_err(&client->dev,
> +			"Failed to init controls(%d)\n", ret);
> +		goto err_free_handler;
> +	}
> +
> +	ov02a10->subdev.ctrl_handler = handler;
> +
> +	return 0;
> +
> +err_free_handler:
> +	v4l2_ctrl_handler_free(handler);
> +
> +	return ret;
> +}
> +
> +static int ov02a10_check_sensor_id(struct ov02a10 *ov02a10)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	u16 id;
> +	u8 pid = 0;
> +	u8 ver = 0;
> +	int ret;
> +
> +	/* Check sensor revision */
> +	ret = ov02a10_read_reg(ov02a10, OV02A10_REG_CHIP_ID_H, &pid);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov02a10_read_reg(ov02a10, OV02A10_REG_CHIP_ID_L, &ver);
> +	if (ret)
> +		return ret;
> +
> +	id = OV02A10_ID(pid, ver);
> +	if (id != CHIP_ID) {
> +		dev_err(&client->dev, "Unexpected sensor id(%04x)\n", id);
> +		return ret;
> +	}
> +	dev_dbg(&client->dev, "Detected OV%04X sensor\n", id);
> +
> +	return 0;
> +}
> +
> +static int ov02a10_configure_regulators(struct ov02a10 *ov02a10)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	unsigned int i;
> +
> +	for (i = 0; i < OV02A10_NUM_SUPPLIES; i++)
> +		ov02a10->supplies[i].supply = ov02a10_supply_names[i];
> +
> +	return devm_regulator_bulk_get(&client->dev,
> +				       OV02A10_NUM_SUPPLIES,
> +				       ov02a10->supplies);
> +}
> +
> +static int ov02a10_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct ov02a10 *ov02a10;
> +	u32 rotation;
> +	u32 xclk_freq;
> +	int ret;
> +
> +	dev_dbg(dev, "ov02a10 probe\n");
I think this line is not needed at all.
> +	ov02a10 = devm_kzalloc(dev, sizeof(*ov02a10), GFP_KERNEL);
> +	if (!ov02a10)
> +		return -ENOMEM;
> +
> +	v4l2_i2c_subdev_init(&ov02a10->subdev, client, &ov02a10_subdev_ops);
> +	ov02a10->fmt.code = MEDIA_BUS_FMT_SBGGR10_1X10;
> +
> +	/* optional indication of physical rotation of sensor */
> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation",
> +				       &rotation);
> +	if (!ret) {
> +		switch (rotation) {
> +		case 180:
> +			ov02a10->upside_down = true;
> +			ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> +			break;
> +		case 0:
> +			break;
> +		default:
> +			dev_warn(dev, "%u degrees rotation is not supported, ignoring...\n",
> +				 rotation);
> +		}
> +	}
> +
> +	/* get system clock (xvclk) */
> +	ov02a10->xvclk = devm_clk_get(dev, "xvclk");
> +	if (IS_ERR(ov02a10->xvclk)) {
> +		dev_err(dev, "Failed to get xvclk\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
> +	if (ret) {
> +		dev_err(dev, "Failed to get xclk frequency\n");
> +		return ret;
> +	}
> +
> +	/* external clock must be 24MHz, allow 1% tolerance */
> +	if (xclk_freq < 23760000 || xclk_freq > 24240000) {
> +		dev_err(dev, "external clock frequency %u is not supported\n",
> +			xclk_freq);
> +		return -EINVAL;
> +	}
> +	dev_dbg(dev, "external clock frequency %u\n", xclk_freq);
> +
> +	ret = clk_set_rate(ov02a10->xvclk, xclk_freq);
> +	if (ret) {
> +		dev_err(dev, "Failed to set xvclk frequency (24MHz)\n");
> +		return ret;
> +	}
> +
> +	ov02a10->pwdn_gpio = devm_gpiod_get(dev, "pwdn", GPIOD_OUT_LOW);
> +	if (IS_ERR(ov02a10->pwdn_gpio)) {
> +		dev_err(dev, "Failed to get powerdown-gpios\n");
> +		return -EINVAL;
> +	}
> +
> +	ov02a10->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ov02a10->reset_gpio)) {
> +		dev_err(dev, "Failed to get reset-gpios\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = ov02a10_configure_regulators(ov02a10);
> +	if (ret) {
> +		dev_err(dev, "Failed to get power regulators\n");
> +		return ret;
> +	}
> +
> +	mutex_init(&ov02a10->mutex);
> +	ov02a10->cur_mode = &supported_modes[0];
> +	ret = ov02a10_initialize_controls(ov02a10);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize controls\n");
> +		goto err_destroy_mutex;
> +	}
> +
> +	ret = __ov02a10_power_on(ov02a10);
> +	if (ret)
> +		goto err_free_handler;
> +
> +	ret = ov02a10_check_sensor_id(ov02a10);
> +	if (ret)
> +		goto err_power_off;
> +
> +	ov02a10->subdev.internal_ops = &ov02a10_internal_ops;
> +	ov02a10->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov02a10->subdev.entity.ops = &ov02a10_subdev_entity_ops;
> +	ov02a10->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	ov02a10->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&ov02a10->subdev.entity, 1, &ov02a10->pad);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to init entity pads: %d", ret);
> +		goto err_power_off;
> +	}
> +
> +	ret = v4l2_async_register_subdev(&ov02a10->subdev);
> +	if (ret) {
> +		dev_err(dev, "failed to register V4L2 subdev: %d",
> +			ret);
> +		goto err_clean_entity;
> +	}
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
> +	return 0;
> +
> +err_clean_entity:
> +	media_entity_cleanup(&ov02a10->subdev.entity);
> +err_power_off:
> +	__ov02a10_power_off(ov02a10);
> +err_free_handler:
> +	v4l2_ctrl_handler_free(ov02a10->subdev.ctrl_handler);
> +err_destroy_mutex:
> +	mutex_destroy(&ov02a10->mutex);
> +
> +	return ret;
> +}
> +
> +static int ov02a10_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(sd->ctrl_handler);
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		__ov02a10_power_off(ov02a10);
> +	pm_runtime_set_suspended(&client->dev);
> +	mutex_destroy(&ov02a10->mutex);
> +
> +	return 0;
> +}
> +
> +#if IS_ENABLED(CONFIG_OF)
> +static const struct of_device_id ov02a10_of_match[] = {
> +	{ .compatible = "ovti,ov02a10" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ov02a10_of_match);
> +#endif
> +
> +static struct i2c_driver ov02a10_i2c_driver = {
> +	.driver = {
> +		.name = "ov02a10",
> +		.pm = &ov02a10_pm_ops,
> +		.of_match_table = ov02a10_of_match,
> +	},
> +	.probe_new	= &ov02a10_probe,
> +	.remove		= &ov02a10_remove,
> +};
> +
> +module_i2c_driver(ov02a10_i2c_driver);
> +
> +MODULE_AUTHOR("Dongchun Zhu <dongchun.zhu@mediatek.com>");
> +MODULE_DESCRIPTION("OmniVision OV02A10 sensor driver");
> +MODULE_LICENSE("GPL v2");
> +
> 
Other part looks good to me.
