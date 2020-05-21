Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9FA1DD745
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 21:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729321AbgEUTcJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 15:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728635AbgEUTcI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 15:32:08 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD8AC061A0E
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 12:32:08 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k13so7835582wrx.3
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 12:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a90q3gtZryR+aSjiPxJ9znwi/ptOM2Jdst8Zj3xqT8w=;
        b=b/6z6uPsvvhmGMlFUA9g4bXdNpGl4hJPqDU6lo+ajZNYW4c6pajzo/qn8O3V1LZzvl
         Q3d3Zqm+Ow4W4275mWpkNX12X4l90FqJkE00ALuZQc2mF/IUltlbMqMzaxiXOTH050ow
         jqP/VAxPw6Mf458tYgifDcnyU+hEukBfHeIQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a90q3gtZryR+aSjiPxJ9znwi/ptOM2Jdst8Zj3xqT8w=;
        b=C6VGSt4EfDt3cIQCRmKyT1mGcH+CX6SGrVAbsoNKFXA5KocrDkDRXY5l7yQquhFK9n
         MHWVqQnTqKNh+pXwISGDwdAG5datqK8koh0kENpn7CVG42KaNvqxxuS2HcG9WEdE0BfG
         Pk9ZrGRXJSoawEiy6x9xPR6Dya4bfOShrWZvl6UPNdKufqqIrtkmg4afZw5aak1zaVb3
         xxxLCGKRzrCX11hgDT3QvDDXB0xGilRuoQykKo/Sm0bt2oyPWal+TBEPtNB5nVnlclmC
         GHYR41ZnLmx3M7ReX3Jj72PtM3OqTdqzn6TnUBn+3OF6BIXym2KJ3MUxgcF5AoSXRjC0
         S4KA==
X-Gm-Message-State: AOAM532mU4SWQBiN0FnmisLtrpc9nPAKwdult3ySEyi06IAdlpTiBgvs
        3/EetJrTO8yco2z0+ZL6VX5dYQMnDcWAIQ==
X-Google-Smtp-Source: ABdhPJzMMo1ZQ2Yc+zTutUhQfRcPsSlQSt6d+cA5+7Mf70Nb+NZxzr9lVodMXvTY0p4/UqZvVb7xPQ==
X-Received: by 2002:a5d:444c:: with SMTP id x12mr138312wrr.406.1590089526931;
        Thu, 21 May 2020 12:32:06 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id a21sm7198579wmm.7.2020.05.21.12.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 12:32:06 -0700 (PDT)
Date:   Thu, 21 May 2020 19:32:04 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V8, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
Message-ID: <20200521193204.GA14214@chromium.org>
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
 <20200509080627.23222-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509080627.23222-3-dongchun.zhu@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Sat, May 09, 2020 at 04:06:27PM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for OV02A10 image sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  MAINTAINERS                 |    1 +
>  drivers/media/i2c/Kconfig   |   13 +
>  drivers/media/i2c/Makefile  |    1 +
>  drivers/media/i2c/ov02a10.c | 1094 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 1109 insertions(+)
>  create mode 100644 drivers/media/i2c/ov02a10.c
> 

Thank you for the patch. Please see my comments inline.

[snip]
> +struct ov02a10 {
> +	u32			eclk_freq;
> +	u32                     mipi_clock_tx_speed;
> +
> +	struct clk		*eclk;
> +	struct gpio_desc	*pd_gpio;
> +	struct gpio_desc	*n_rst_gpio;
> +	struct regulator_bulk_data supplies[OV02A10_NUM_SUPPLIES];
> +
> +	bool			streaming;
> +	bool			upside_down;
> +	bool			mipi_clock_tx_speed_select_enable;
> +	bool			mipi_clock_hs_mode_enable;
> +
> +	/*
> +	 * Serialize control access, get/set format, get selection
> +	 * and start streaming.
> +	 */
> +	struct mutex		mutex;
> +	struct v4l2_subdev	subdev;
> +	struct media_pad	pad;
> +	struct v4l2_ctrl	*anal_gain;
> +	struct v4l2_ctrl	*exposure;
> +	struct v4l2_ctrl	*hblank;
> +	struct v4l2_ctrl	*vblank;
> +	struct v4l2_ctrl	*test_pattern;
> +	struct v4l2_mbus_framefmt	fmt;

nit: Remove the tabs between types and names and use single spaces. As you
can see above, even tabs don't guarantee equal alignment. And they actually
make adding fields more difficult, because if a longer field is added, the
alignment breaks.

[snip]
> +static int ov02a10_read_smbus(struct ov02a10 *ov02a10, unsigned char reg,
> +			      unsigned char *val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	int ret;
> +
> +	ret = i2c_smbus_read_byte_data(client, reg);
> +

nit: Unnecessary blank line.

> +	if (ret < 0)
> +		return ret;
> +
> +	*val = (unsigned char)ret;
> +
> +	return 0;
> +}
[snip]
> +static int __maybe_unused ov02a10_power_on(struct device *dev)

How is it possible that this function may be unused? If this driver allows
disabling runtime PM, then there is still a need to configure the clock,
regulator and GPIO. If not, there shouldn't be a case where this function
is unused.

> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> +	int ret;
> +
> +	gpiod_set_value_cansleep(ov02a10->n_rst_gpio, 0);
> +	gpiod_set_value_cansleep(ov02a10->pd_gpio, 0);
> +
> +	ret = clk_prepare_enable(ov02a10->eclk);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable eclk\n");
> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable regulators\n");
> +		goto disable_clk;
> +	}
> +	usleep_range(5000, 6000);
> +
> +	gpiod_set_value_cansleep(ov02a10->pd_gpio, 1);

This is a "powerdown" GPIO. It must be set to 0 if the sensor is to be
powered on.

> +	usleep_range(5000, 6000);
> +
> +	gpiod_set_value_cansleep(ov02a10->n_rst_gpio, 1);
> +	usleep_range(5000, 6000);
> +
> +	ret = ov02a10_check_sensor_id(ov02a10);
> +	if (ret)
> +		goto disable_regulator;
> +
> +	return 0;
> +
> +disable_regulator:
> +	regulator_bulk_disable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> +disable_clk:
> +	clk_disable_unprepare(ov02a10->eclk);
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused ov02a10_power_off(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> +
> +	gpiod_set_value_cansleep(ov02a10->n_rst_gpio, 0);
> +	clk_disable_unprepare(ov02a10->eclk);
> +	gpiod_set_value_cansleep(ov02a10->pd_gpio, 0);

Similar comment as above. To power off the sensor, the "powerdown" GPIO
needs to be active, i.e. 1.

[snip]
> +/*
> + * ov02a10_set_exposure - Function called when setting exposure time
> + * @priv: Pointer to device structure
> + * @val: Variable for exposure time, in the unit of micro-second
> + *
> + * Set exposure time based on input value.
> + *
> + * Return: 0 on success
> + */
> +static int ov02a10_set_exposure(struct ov02a10 *ov02a10, int val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
> +	if (ret < 0)
> +		return ret;

How does this page switch work? According to the documentation I have, the
register allows selecting between a few different pages. However, there
should be two page pointers - one for the AP and the other for the sensor,
so that when the AP is programming page X, the sensor can have consistent
settings from page Y. But here we only set one register and always with
page 1.

> +
> +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_EXPOSURE_H,
> +					val >> OV02A10_EXP_SHIFT);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_EXPOSURE_L, val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> +					 REG_ENABLE);

This patch defines REG_GLOBAL_EFFECTIVE to 0x01. I don't see such register
mentioned in the documentation.

> +}
> +
> +static int ov02a10_set_gain(struct ov02a10 *ov02a10, int val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_GAIN, val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> +					 REG_ENABLE);
> +}
> +
> +static int ov02a10_set_vblank(struct ov02a10 *ov02a10, int val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	u32 vts = val + ov02a10->cur_mode->height - OV02A10_BASIC_LINE;
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_H,
> +					vts >> OV02A10_VTS_SHIFT);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_L, vts);
> +	if (ret < 0)
> +		return ret;
> +
> +	return i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> +					 REG_ENABLE);
> +}
> +
> +static int ov02a10_set_test_pattern(struct ov02a10 *ov02a10, int pattern)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	int ret;
> +
> +	if (pattern)
> +		pattern = OV02A10_TEST_PATTERN_ENABLE;

Is this necessary? Our control can be 0 for disabled and 1 for color bars.
The latter is the same as the above macro.

[snip]
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
> +	ret = v4l2_ctrl_handler_init(handler, 7);
> +	if (ret)
> +		return ret;
> +
> +	handler->lock = &ov02a10->mutex;
> +
> +	ctrl = v4l2_ctrl_new_int_menu(handler, NULL, V4L2_CID_LINK_FREQ, 0, 0,
> +				      link_freq_menu_items);
> +	if (ctrl)
> +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	pixel_rate = to_pixel_rate(0);
> +	v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE, 0, pixel_rate, 1,
> +			  pixel_rate);
> +
> +	h_blank = mode->hts_def - mode->width;
> +	ov02a10->hblank = v4l2_ctrl_new_std(handler, NULL, V4L2_CID_HBLANK,
> +					    h_blank, h_blank, 1, h_blank);
> +	if (ov02a10->hblank)
> +		ov02a10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +

Do we need to hold a pointer to this control? We don't seem to ever access
it anywhere else in the driver.

> +	ov02a10->vblank = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
> +					    V4L2_CID_VBLANK, mode->vts_def -
> +					    mode->height,
> +					    OV02A10_VTS_MAX - mode->height, 1,
> +					    mode->vts_def - mode->height);
> +

Ditto.

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

Ditto.

> +
> +	ov02a10->test_pattern =
> +		v4l2_ctrl_new_std_menu_items(handler, &ov02a10_ctrl_ops,
> +					     V4L2_CID_TEST_PATTERN,
> +					     ARRAY_SIZE(ov02a10_test_pattern_menu) -
> +					     1, 0, 0,
> +					     ov02a10_test_pattern_menu);

Ditto.

[snip]
> +	ov02a10->pd_gpio = devm_gpiod_get(dev, "powerdown", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ov02a10->pd_gpio)) {
> +		ret = PTR_ERR(ov02a10->pd_gpio);
> +		dev_err(dev, "failed to get powerdown-gpios %d\n", ret);
> +		return ret;
> +	}
> +
> +	ov02a10->n_rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);

I've asked a question about the right convention to define active low pins,
but I don't remember seeing an answer. We need to clarify this to avoid
confusion. Especially since the current binding documentation doesn't
mention anything about the sensor being active low. Let me also post a
comment to the binding patch.

> +	if (IS_ERR(ov02a10->n_rst_gpio)) {
> +		ret = PTR_ERR(ov02a10->n_rst_gpio);
> +		dev_err(dev, "failed to get reset-gpios %d\n", ret);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < OV02A10_NUM_SUPPLIES; i++)
> +		ov02a10->supplies[i].supply = ov02a10_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, OV02A10_NUM_SUPPLIES,
> +				      ov02a10->supplies);
> +	if (ret) {
> +		dev_err(dev, "failed to get regulators\n");
> +		return ret;
> +	}
> +
> +	mutex_init(&ov02a10->mutex);
> +	ov02a10->cur_mode = &supported_modes[0];
> +	ret = ov02a10_initialize_controls(ov02a10);
> +	if (ret) {
> +		dev_err(dev, "failed to initialize controls\n");
> +		goto err_destroy_mutex;
> +	}
> +
> +	ov02a10->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov02a10->subdev.entity.ops = &ov02a10_subdev_entity_ops;
> +	ov02a10->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	ov02a10->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&ov02a10->subdev.entity, 1, &ov02a10->pad);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to init entity pads: %d", ret);
> +		goto err_free_handler;
> +	}
> +
> +	pm_runtime_enable(dev);
> +	if (!pm_runtime_enabled(dev)) {
> +		ret = ov02a10_power_on(dev);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to power on: %d\n", ret);
> +			goto err_clean_entity;
> +		}
> +	}
> +
> +	ret = v4l2_async_register_subdev(&ov02a10->subdev);
> +	if (ret) {
> +		dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> +		goto err_clean_entity;
> +	}
> +
> +	return 0;
> +
> +err_clean_entity:

Need to power off if !pm_runtime_enabled().

Best regards,
Tomasz
