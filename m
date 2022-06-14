Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 163D354B2B2
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 16:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232988AbiFNOC1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 10:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231223AbiFNOC0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 10:02:26 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F9F38A9
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 07:02:21 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 83BDF20000F;
        Tue, 14 Jun 2022 14:02:18 +0000 (UTC)
Date:   Tue, 14 Jun 2022 16:02:16 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2 2/2] media: i2c: Add driver for onsemi MT9M114 camera
 sensor
Message-ID: <20220614140216.d5jzwn7cutdflixp@uno.localdomain>
References: <20220207012055.15158-1-laurent.pinchart@ideasonboard.com>
 <20220207012055.15158-3-laurent.pinchart@ideasonboard.com>
 <20220513102716.q4ugg7uvyq4fzkkp@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220513102716.q4ugg7uvyq4fzkkp@uno.localdomain>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
   one more comment, mostly for the record if anyone else will
encounter the same problem I found

On Fri, May 13, 2022 at 12:27:16PM +0200, Jacopo Mondi wrote:
> Hi Laurent,
>

[snip]

> > +#define MT9M114_CAM_SENSOR_CONTROL_Y_READ_OUT_AVERAGE		(2 << 8)

The version of the datasheet I have documents this bit as "RESERVED"

[snip]

> > +
> > +static int mt9m114_configure(struct mt9m114 *sensor)
> > +{
> > +	u32 value;
> > +	int ret = 0;
> > +
> > +	/*
> > +	 * Pixel array crop and binning. The CAM_SENSOR_CFG_CPIPE_LAST_ROW
> > +	 * register isn't clearly documented, but is always set to the number
> > +	 * of output rows minus 4 in all example sensor modes.
> > +	 */
> > +	mt9m114_write(sensor, MT9M114_CAM_SENSOR_CFG_X_ADDR_START,
> > +		      sensor->pa.crop.left, &ret);
> > +	mt9m114_write(sensor, MT9M114_CAM_SENSOR_CFG_Y_ADDR_START,
> > +		      sensor->pa.crop.top, &ret);
> > +	mt9m114_write(sensor, MT9M114_CAM_SENSOR_CFG_X_ADDR_END,
> > +		      sensor->pa.crop.width + sensor->pa.crop.left - 1, &ret);
> > +	mt9m114_write(sensor, MT9M114_CAM_SENSOR_CFG_Y_ADDR_END,
> > +		      sensor->pa.crop.height + sensor->pa.crop.top - 1, &ret);
> > +	mt9m114_write(sensor, MT9M114_CAM_SENSOR_CFG_CPIPE_LAST_ROW,
> > +		      sensor->pa.format.height - 4 - 1, &ret);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = mt9m114_read(sensor, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
> > +			   &value);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	value &= ~(MT9M114_CAM_SENSOR_CONTROL_X_READ_OUT_MASK |
> > +		   MT9M114_CAM_SENSOR_CONTROL_Y_READ_OUT_MASK);
> > +
> > +	if (sensor->pa.crop.width != sensor->pa.format.width)
> > +		value |= MT9M114_CAM_SENSOR_CONTROL_X_READ_OUT_SUMMING;
> > +	if (sensor->pa.crop.height != sensor->pa.format.height)
> > +		value |= MT9M114_CAM_SENSOR_CONTROL_Y_READ_OUT_SUMMING;

While applying 2x2 subsampling, I found SUMMING to mangle the color
output possibly because the gains should be adjusted accordingly to
the fact the SUMMING:
"will add the charge or voltage values of the neighboring pixels
together"

I have found the combination that works better for me out of the box
to be:

	if (sensor->pa.crop.width != sensor->pa.format.width)
		value |= MT9M114_CAM_SENSOR_CONTROL_X_READ_OUT_AVERAGE;
	if (sensor->pa.crop.height != sensor->pa.format.height)
		value |= MT9M114_CAM_SENSOR_CONTROL_Y_READ_OUT_SKIPPING;

Have you tested 2x2 binning with CSI-2 ?

Thanks
   j

> > +
> > +	mt9m114_write(sensor, MT9M114_CAM_SENSOR_CONTROL_READ_MODE, value,
> > +		      &ret);
> > +
> > +	/*
> > +	 * Color pipeline (IFP) cropping and scaling. Subtract 4 from the left
> > +	 * and top coordinates to compensate for the lines and columns removed
> > +	 * by demosaicing that are taken into account in the crop rectangle but
> > +	 * not in the hardware.
> > +	 */
> > +	mt9m114_write(sensor, MT9M114_CAM_CROP_WINDOW_XOFFSET,
> > +		      sensor->ifp.crop.left - 4, &ret);
> > +	mt9m114_write(sensor, MT9M114_CAM_CROP_WINDOW_YOFFSET,
> > +		      sensor->ifp.crop.top - 4, &ret);
> > +	mt9m114_write(sensor, MT9M114_CAM_CROP_WINDOW_WIDTH,
> > +		      sensor->ifp.crop.width, &ret);
> > +	mt9m114_write(sensor, MT9M114_CAM_CROP_WINDOW_HEIGHT,
> > +		      sensor->ifp.crop.height, &ret);
> > +
> > +	mt9m114_write(sensor, MT9M114_CAM_OUTPUT_WIDTH,
> > +		      sensor->ifp.compose.width, &ret);
> > +	mt9m114_write(sensor, MT9M114_CAM_OUTPUT_HEIGHT,
> > +		      sensor->ifp.compose.height, &ret);
> > +
> > +	/* AWB and AE windows, use the full frame. */
> > +	mt9m114_write(sensor, MT9M114_CAM_STAT_AWB_CLIP_WINDOW_XSTART, 0, &ret);
> > +	mt9m114_write(sensor, MT9M114_CAM_STAT_AWB_CLIP_WINDOW_YSTART, 0, &ret);
> > +	mt9m114_write(sensor, MT9M114_CAM_STAT_AWB_CLIP_WINDOW_XEND,
> > +		      sensor->ifp.compose.width - 1, &ret);
> > +	mt9m114_write(sensor, MT9M114_CAM_STAT_AWB_CLIP_WINDOW_YEND,
> > +		      sensor->ifp.compose.height - 1, &ret);
> > +
> > +	mt9m114_write(sensor, MT9M114_CAM_STAT_AE_INITIAL_WINDOW_XSTART,
> > +		      0, &ret);
> > +	mt9m114_write(sensor, MT9M114_CAM_STAT_AE_INITIAL_WINDOW_YSTART,
> > +		      0, &ret);
> > +	mt9m114_write(sensor, MT9M114_CAM_STAT_AE_INITIAL_WINDOW_XEND,
> > +		      sensor->ifp.compose.width / 5 - 1, &ret);
> > +	mt9m114_write(sensor, MT9M114_CAM_STAT_AE_INITIAL_WINDOW_YEND,
> > +		      sensor->ifp.compose.height / 5 - 1, &ret);
> > +
> > +	mt9m114_write(sensor, MT9M114_CAM_CROP_CROPMODE,
> > +		      MT9M114_CAM_CROP_MODE_AWB_AUTO_CROP_EN |
> > +		      MT9M114_CAM_CROP_MODE_AE_AUTO_CROP_EN, &ret);
> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* Set the media bus code. */
> > +	ret = mt9m114_read(sensor, MT9M114_CAM_OUTPUT_FORMAT, &value);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	value &= ~(MT9M114_CAM_OUTPUT_FORMAT_RGB_FORMAT_MASK |
> > +		   MT9M114_CAM_OUTPUT_FORMAT_BAYER_FORMAT_MASK |
> > +		   MT9M114_CAM_OUTPUT_FORMAT_FORMAT_MASK |
> > +		   MT9M114_CAM_OUTPUT_FORMAT_SWAP_BYTES |
> > +		   MT9M114_CAM_OUTPUT_FORMAT_SWAP_RED_BLUE);
> > +	value |= sensor->ifp.info->output_format;
> > +
> > +	mt9m114_write(sensor, MT9M114_CAM_OUTPUT_FORMAT, value, &ret);
> > +	return ret;
> > +}
> > +
> > +/* Wait for a command to complete. */
> > +static int mt9m114_poll_command(struct mt9m114 *sensor, u32 command)
> > +{
> > +	unsigned int i;
> > +	u32 value;
> > +	int ret;
> > +
> > +	for (i = 0; i < 100; ++i) {
> > +		ret = mt9m114_read(sensor, MT9M114_COMMAND_REGISTER, &value);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		if (!(value & command))
> > +			break;
> > +
> > +		usleep_range(5000, 6000);
> > +	}
> > +
> > +	if (value & command) {
> > +		dev_err(&sensor->client->dev, "Command %u completion timeout\n",
> > +			command);
> > +		return -ETIMEDOUT;
> > +	}
> > +
> > +	if (!(value & MT9M114_COMMAND_REGISTER_OK)) {
> > +		dev_err(&sensor->client->dev, "Command %u failed\n", command);
> > +		return -EIO;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/* Wait for a state to be entered. */
> > +static int mt9m114_poll_state(struct mt9m114 *sensor, u32 state)
> > +{
> > +	unsigned int i;
> > +	u32 value;
> > +	int ret;
> > +
> > +	for (i = 0; i < 100; ++i) {
> > +		ret = mt9m114_read(sensor, MT9M114_SYSMGR_CURRENT_STATE,
> > +				   &value);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		if (value == state)
> > +			return 0;
> > +
> > +		usleep_range(1000, 1500);
> > +	}
> > +
> > +	dev_err(&sensor->client->dev, "Timeout waiting for state 0x%02x\n",
> > +		state);
> > +	return -ETIMEDOUT;
> > +}
> > +
> > +static int mt9m114_set_state(struct mt9m114 *sensor, u8 next_state)
> > +{
> > +	int ret = 0;
> > +
> > +	/* Set the next desired state and start the state transition. */
> > +	mt9m114_write(sensor, MT9M114_SYSMGR_NEXT_STATE, next_state, &ret);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	mt9m114_write(sensor, MT9M114_COMMAND_REGISTER,
> > +		      MT9M114_COMMAND_REGISTER_OK |
> > +		      MT9M114_COMMAND_REGISTER_SET_STATE, &ret);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* Wait for the state transition to complete. */
> > +	ret = mt9m114_poll_command(sensor, MT9M114_COMMAND_REGISTER_SET_STATE);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt9m114_power_on(struct mt9m114 *sensor)
>
> No runtime_pm support ? :(
>
> > +{
> > +	int ret;
> > +
> > +	/* Enable power and clocks. */
> > +	ret = regulator_bulk_enable(ARRAY_SIZE(sensor->supplies),
> > +				    sensor->supplies);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = clk_prepare_enable(sensor->clk);
> > +	if (ret < 0)
> > +		goto error_regulator;
> > +
> > +	/* Perform a hard reset if available, or a soft reset otherwise. */
> > +	if (sensor->reset) {
> > +		long freq = clk_get_rate(sensor->clk);
> > +		unsigned int duration;
> > +
> > +		/*
> > +		 * The minimum duration is 50 clock cycles, thus typically
> > +		 * around 2µs. Double it to be safe.
> > +		 */
> > +		duration = DIV_ROUND_UP(2 * 50 * 1000000, freq);
> > +
> > +		gpiod_set_value(sensor->reset, 1);
> > +		udelay(duration);
> > +		gpiod_set_value(sensor->reset, 0);
> > +	} else {
> > +		/*
> > +		 * The power may have just been turned on, we need to wait for
> > +		 * the sensor to be ready to accept I2C commands.
> > +		 */
> > +		usleep_range(44500, 50000);
> > +
> > +		mt9m114_write(sensor, MT9M114_RESET_AND_MISC_CONTROL,
> > +			      MT9M114_RESET_SOC, &ret);
> > +		if (ret < 0) {
> > +			dev_err(&sensor->client->dev, "Soft reset failed\n");
> > +			goto error_clock;
> > +		}
> > +
> > +		mt9m114_write(sensor, MT9M114_RESET_AND_MISC_CONTROL, 0, &ret);
> > +		if (ret < 0)
> > +			goto error_clock;
> > +	}
> > +
> > +	/*
> > +	 * Wait for the sensor to be ready to accept I2C commands by polling the
> > +	 * command register to wait for initialization to complete.
> > +	 */
> > +	usleep_range(44500, 50000);
> > +
> > +	ret = mt9m114_poll_command(sensor, MT9M114_COMMAND_REGISTER_SET_STATE);
> > +	if (ret < 0)
> > +		goto error_clock;
> > +
> > +	if (sensor->bus_cfg.bus_type == V4L2_MBUS_PARALLEL) {
> > +		/*
> > +		 * In parallel mode (OE set to low), the sensor will enter the
> > +		 * streaming state after initialization. Enter the standby
> > +		 * manually to stop streaming.
> > +		 */
> > +		ret = mt9m114_set_state(sensor,
> > +					MT9M114_SYS_STATE_ENTER_STANDBY);
> > +		if (ret < 0)
> > +			goto error_clock;
> > +	}
> > +
> > +	/*
> > +	 * Before issuing any Set-State command, we must ensure that the sensor
> > +	 * reaches the standby mode (either initiated manually above in
> > +	 * parallel mode, or automatically after reset in MIPI mode).
> > +	 */
> > +	ret = mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);
> > +	if (ret < 0)
> > +		goto error_clock;
> > +
> > +	return 0;
> > +
> > +error_clock:
> > +	clk_disable_unprepare(sensor->clk);
> > +error_regulator:
> > +	regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supplies);
> > +	return ret;
> > +}
> > +
> > +static void mt9m114_power_off(struct mt9m114 *sensor)
> > +{
> > +	clk_disable_unprepare(sensor->clk);
> > +	regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supplies);
> > +}
> > +
> > +static int mt9m114_initialize(struct mt9m114 *sensor)
> > +{
> > +	unsigned int pll_m = 32;
> > +	unsigned int pll_n = 1;
> > +	unsigned int pll_p = 7;
> > +	u32 value;
> > +	int ret;
> > +
> > +	ret = mt9m114_writeregs(sensor, mt9m114_init, ARRAY_SIZE(mt9m114_init));
> > +	if (ret < 0) {
> > +		dev_err(&sensor->client->dev,
> > +			"Failed to initialize the sensor\n");
> > +		return ret;
> > +	}
> > +
> > +	/* Configure the PLL with hardcoded multiplier and dividers. */
> > +	sensor->pixrate = clk_get_rate(sensor->clk) * pll_m
> > +			/ ((pll_n + 1) * (pll_p + 1));
> > +	mt9m114_write(sensor, MT9M114_CAM_SYSCTL_PLL_ENABLE,
> > +		      MT9M114_CAM_SYSCTL_PLL_ENABLE_VALUE, &ret);
> > +	mt9m114_write(sensor, MT9M114_CAM_SYSCTL_PLL_DIVIDER_M_N,
> > +		      MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(pll_m, pll_n), &ret);
> > +	mt9m114_write(sensor, MT9M114_CAM_SYSCTL_PLL_DIVIDER_P,
> > +		      MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(pll_p), &ret);
> > +	mt9m114_write(sensor, MT9M114_CAM_SENSOR_CFG_PIXCLK, sensor->pixrate,
> > +		      &ret);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* Configure the output mode. */
> > +	if (sensor->bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY) {
> > +		value = MT9M114_CAM_PORT_PORT_SELECT_MIPI
> > +		      | MT9M114_CAM_PORT_CHAN_NUM(0);
> > +		if (sensor->bus_cfg.bus.mipi_csi2.flags &
> > +		    V4L2_MBUS_CSI2_CONTINUOUS_CLOCK)
> > +			value |= MT9M114_CAM_PORT_CONT_MIPI_CLK;
> > +	} else {
> > +		value = MT9M114_CAM_PORT_PORT_SELECT_PARALLEL
> > +		      | MT9M114_CAM_PORT_CONT_MIPI_CLK
>
> This bit does not apply to parallel, although it seems harmless
>
> > +		      | 0x8000;
>
> The MSB is set to be reserved and == 1. Does this apply to MIPI too ?
>
> > +	}
> > +	mt9m114_write(sensor, MT9M114_CAM_PORT_OUTPUT_CONTROL, value, &ret);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_SUSPEND);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +/* -----------------------------------------------------------------------------
> > + * Common Subdev Operations
> > + */
> > +
> > +static const struct media_entity_operations mt9m114_entity_ops = {
> > +	.link_validate = v4l2_subdev_link_validate,
> > +};
> > +
> > +/* -----------------------------------------------------------------------------
> > + * Pixel Array Control Operations
> > + */
> > +
> > +static inline struct mt9m114 *pa_ctrl_to_mt9m114(struct v4l2_ctrl *ctrl)
> > +{
> > +	return container_of(ctrl->handler, struct mt9m114, pa.hdl);
> > +}
> > +
> > +static int mt9m114_pa_g_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct mt9m114 *sensor = pa_ctrl_to_mt9m114(ctrl);
> > +	u32 value;
> > +	int ret = 0;
> > +
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_EXPOSURE:
> > +		ret = mt9m114_read(sensor,
> > +				   MT9M114_CAM_SENSOR_CONTROL_COARSE_INTEGRATION_TIME,
> > +				   &value);
> > +		if (ret < 0)
> > +			break;
> > +
> > +		ctrl->val = value;
> > +		break;
> > +
> > +	case V4L2_CID_ANALOGUE_GAIN:
> > +		ret = mt9m114_read(sensor,
> > +				   MT9M114_CAM_SENSOR_CONTROL_ANALOG_GAIN,
> > +				   &value);
> > +		if (ret < 0)
> > +			break;
> > +
> > +		ctrl->val = value;
> > +		break;
> > +
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct mt9m114 *sensor = pa_ctrl_to_mt9m114(ctrl);
> > +	int ret = 0;
> > +
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_EXPOSURE:
> > +		mt9m114_write(sensor,
> > +			      MT9M114_CAM_SENSOR_CONTROL_COARSE_INTEGRATION_TIME,
> > +			      ctrl->val, &ret);
> > +		break;
> > +
> > +	case V4L2_CID_ANALOGUE_GAIN:
> > +		/*
> > +		 * The CAM_SENSOR_CONTROL_ANALOG_GAIN contains linear analog
> > +		 * gain values that are mapped to the GLOBAL_GAIN register
> > +		 * values by the sensor firmware.
> > +		 */
> > +		mt9m114_write(sensor, MT9M114_CAM_SENSOR_CONTROL_ANALOG_GAIN,
> > +			      ctrl->val, &ret);
> > +		break;
> > +
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops mt9m114_pa_ctrl_ops = {
> > +	.g_volatile_ctrl = mt9m114_pa_g_ctrl,
> > +	.s_ctrl = mt9m114_pa_s_ctrl,
> > +};
> > +
> > +static void mt9m114_pa_update_controls(struct mt9m114 *sensor, bool manual)
> > +{
> > +	mutex_lock(sensor->pa.hdl.lock);
> > +
> > +	/*
> > +	 * Update the volatile flag on the manual exposure and gain controls.
> > +	 * If the controls have switched to manual, read their current value
> > +	 * from the hardware to ensure that control read and write operations
> > +	 * will behave correctly
> > +	 */
> > +	if (manual) {
> > +		mt9m114_pa_g_ctrl(sensor->pa.exposure);
> > +		sensor->pa.exposure->cur.val = sensor->pa.exposure->val;
> > +		sensor->pa.exposure->flags &= ~V4L2_CTRL_FLAG_VOLATILE;
> > +
> > +		mt9m114_pa_g_ctrl(sensor->pa.gain);
> > +		sensor->pa.gain->cur.val = sensor->pa.gain->val;
> > +		sensor->pa.gain->flags &= ~V4L2_CTRL_FLAG_VOLATILE;
> > +	} else {
> > +		sensor->pa.exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
> > +		sensor->pa.gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
> > +	}
> > +
> > +	mutex_unlock(sensor->pa.hdl.lock);
> > +}
> > +
> > +/* -----------------------------------------------------------------------------
> > + * Pixel Array Subdev Operations
> > + */
> > +
> > +static inline struct mt9m114 *pa_to_mt9m114(struct v4l2_subdev *sd)
> > +{
> > +	return container_of(sd, struct mt9m114, pa.sd);
> > +}
> > +
> > +static struct v4l2_mbus_framefmt *
> > +__mt9m114_pa_get_pad_format(struct mt9m114 *sensor,
> > +			    struct v4l2_subdev_state *state,
> > +			    unsigned int pad, u32 which)
> > +{
> > +	switch (which) {
> > +	case V4L2_SUBDEV_FORMAT_TRY:
> > +		return v4l2_subdev_get_try_format(&sensor->pa.sd, state, pad);
> > +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > +		return &sensor->pa.format;
> > +	default:
> > +		return NULL;
> > +	}
> > +}
> > +
> > +static struct v4l2_rect *
> > +__mt9m114_pa_get_pad_crop(struct mt9m114 *sensor,
> > +			  struct v4l2_subdev_state *state,
> > +			  unsigned int pad, u32 which)
> > +{
> > +	switch (which) {
> > +	case V4L2_SUBDEV_FORMAT_TRY:
> > +		return v4l2_subdev_get_try_crop(&sensor->pa.sd, state, pad);
> > +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > +		return &sensor->pa.crop;
> > +	default:
> > +		return NULL;
> > +	}
> > +}
> > +
> > +static int mt9m114_pa_init_cfg(struct v4l2_subdev *sd,
> > +			       struct v4l2_subdev_state *state)
> > +{
> > +	u32 which = state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> > +	struct mt9m114 *sensor = pa_to_mt9m114(sd);
> > +	struct v4l2_mbus_framefmt *format;
> > +	struct v4l2_rect *crop;
> > +
> > +	crop = __mt9m114_pa_get_pad_crop(sensor, state, 0, which);
> > +
> > +	crop->left = 0;
> > +	crop->top = 0;
> > +	crop->width = MT9M114_PIXEL_ARRAY_WIDTH;
> > +	crop->height = MT9M114_PIXEL_ARRAY_HEIGHT;
> > +
> > +	format = __mt9m114_pa_get_pad_format(sensor, state, 0, which);
> > +	memset(format, 0, sizeof(*format));
> > +
> > +	format->width = MT9M114_PIXEL_ARRAY_WIDTH;
> > +	format->height = MT9M114_PIXEL_ARRAY_HEIGHT;
> > +	format->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> > +	format->field = V4L2_FIELD_NONE;
> > +	format->colorspace = V4L2_COLORSPACE_SRGB;
> > +	format->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > +	format->quantization = V4L2_QUANTIZATION_DEFAULT;
> > +	format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt9m114_pa_enum_mbus_code(struct v4l2_subdev *sd,
> > +				     struct v4l2_subdev_state *state,
> > +				     struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +	if (code->index > 0)
> > +		return -EINVAL;
> > +
> > +	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt9m114_pa_enum_framesizes(struct v4l2_subdev *sd,
> > +				      struct v4l2_subdev_state *state,
> > +				      struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +	if (fse->index > 1)
> > +		return -EINVAL;
> > +
> > +	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
> > +		return -EINVAL;
> > +
> > +	/* Report binning capability through frame size enumeration. */
> > +	fse->min_width = MT9M114_PIXEL_ARRAY_WIDTH / (fse->index + 1);
> > +	fse->max_width = MT9M114_PIXEL_ARRAY_WIDTH / (fse->index + 1);
> > +	fse->min_height = MT9M114_PIXEL_ARRAY_HEIGHT / (fse->index + 1);
> > +	fse->max_height = MT9M114_PIXEL_ARRAY_HEIGHT / (fse->index + 1);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt9m114_pa_get_fmt(struct v4l2_subdev *sd,
> > +			      struct v4l2_subdev_state *state,
> > +			      struct v4l2_subdev_format *fmt)
> > +{
> > +	struct mt9m114 *sensor = pa_to_mt9m114(sd);
> > +	const struct v4l2_mbus_framefmt *format;
> > +
> > +	format = __mt9m114_pa_get_pad_format(sensor, state, fmt->pad,
> > +					     fmt->which);
> > +
> > +	mutex_lock(&sensor->lock);
> > +	fmt->format = *format;
> > +	mutex_unlock(&sensor->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt9m114_pa_set_fmt(struct v4l2_subdev *sd,
> > +			      struct v4l2_subdev_state *state,
> > +			      struct v4l2_subdev_format *fmt)
> > +{
> > +	struct mt9m114 *sensor = pa_to_mt9m114(sd);
> > +	struct v4l2_mbus_framefmt *format;
> > +	struct v4l2_rect *crop;
> > +	unsigned int hscale;
> > +	unsigned int vscale;
> > +
> > +	crop = __mt9m114_pa_get_pad_crop(sensor, state, fmt->pad, fmt->which);
> > +	format = __mt9m114_pa_get_pad_format(sensor, state, fmt->pad,
> > +					     fmt->which);
> > +
> > +	mutex_lock(&sensor->lock);
> > +
> > +	/* The sensor can bin horizontally and vertically. */
> > +	hscale = DIV_ROUND_CLOSEST(crop->width, fmt->format.width ? : 1);
> > +	vscale = DIV_ROUND_CLOSEST(crop->height, fmt->format.height ? : 1);
> > +	format->width = crop->width / clamp(hscale, 1U, 2U);
> > +	format->height = crop->height / clamp(vscale, 1U, 2U);
> > +
> > +	fmt->format = *format;
> > +
> > +	mutex_unlock(&sensor->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt9m114_pa_get_selection(struct v4l2_subdev *sd,
> > +				    struct v4l2_subdev_state *state,
> > +				    struct v4l2_subdev_selection *sel)
> > +{
> > +	struct mt9m114 *sensor = pa_to_mt9m114(sd);
> > +	const struct v4l2_rect *crop;
> > +
> > +	switch (sel->target) {
> > +	case V4L2_SEL_TGT_CROP:
> > +		crop = __mt9m114_pa_get_pad_crop(sensor, state, sel->pad,
> > +						 sel->which);
> > +		mutex_lock(&sensor->lock);
> > +		sel->r = *crop;
> > +		mutex_unlock(&sensor->lock);
> > +		return 0;
> > +
> > +	case V4L2_SEL_TGT_CROP_DEFAULT:
>
> Does the sensor have dummies? Should them be skipped by the DEFAUL
> target ?
>
> > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > +	case V4L2_SEL_TGT_NATIVE_SIZE:
> > +		sel->r.left = 0;
> > +		sel->r.top = 0;
> > +		sel->r.width = MT9M114_PIXEL_ARRAY_WIDTH;
> > +		sel->r.height = MT9M114_PIXEL_ARRAY_HEIGHT;
> > +		return 0;
> > +
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
> > +				    struct v4l2_subdev_state *state,
> > +				    struct v4l2_subdev_selection *sel)
> > +{
> > +	struct mt9m114 *sensor = pa_to_mt9m114(sd);
> > +	struct v4l2_mbus_framefmt *format;
> > +	struct v4l2_rect *crop;
> > +
> > +	if (sel->target != V4L2_SEL_TGT_CROP)
> > +		return -EINVAL;
> > +
> > +	crop = __mt9m114_pa_get_pad_crop(sensor, state, sel->pad, sel->which);
> > +	format = __mt9m114_pa_get_pad_format(sensor, state, sel->pad,
> > +					     sel->which);
> > +
> > +	mutex_lock(&sensor->lock);
> > +
> > +	/*
> > +	 * Clamp the crop rectangle. The vertical coordinates must be even, and
> > +	 * the horizontal coordinates must be a multiple of 4.
> > +	 *
> > +	 * FIXME: The horizontal coordinates must be a multiple of 8 when
> > +	 * binning, but binning is configured after setting the selection, so
> > +	 * we can't know tell here if it will be used.
> > +	 */
> > +	crop->left = ALIGN(sel->r.left, 4);
> > +	crop->top = ALIGN(sel->r.top, 2);
> > +	crop->width = clamp_t(unsigned int, ALIGN(sel->r.width, 4),
> > +			      MT9M114_PIXEL_ARRAY_MIN_OUTPUT_WIDTH,
> > +			      MT9M114_PIXEL_ARRAY_WIDTH - crop->left);
> > +	crop->height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
> > +			       MT9M114_PIXEL_ARRAY_MIN_OUTPUT_HEIGHT,
> > +			       MT9M114_PIXEL_ARRAY_HEIGHT - crop->top);
> > +
> > +	sel->r = *crop;
> > +
> > +	/* Reset the format. */
> > +	format->width = crop->width;
> > +	format->height = crop->height;
> > +
> > +	mutex_unlock(&sensor->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_pad_ops mt9m114_pa_pad_ops = {
> > +	.init_cfg = mt9m114_pa_init_cfg,
> > +	.enum_mbus_code = mt9m114_pa_enum_mbus_code,
> > +	.enum_frame_size = mt9m114_pa_enum_framesizes,
> > +	.get_fmt = mt9m114_pa_get_fmt,
> > +	.set_fmt = mt9m114_pa_set_fmt,
> > +	.get_selection = mt9m114_pa_get_selection,
> > +	.set_selection = mt9m114_pa_set_selection,
> > +};
> > +
> > +static const struct v4l2_subdev_ops mt9m114_pa_ops = {
> > +	.pad = &mt9m114_pa_pad_ops,
> > +};
> > +
> > +static int mt9m114_pa_init(struct mt9m114 *sensor)
> > +{
> > +	struct v4l2_ctrl_handler *hdl = &sensor->pa.hdl;
> > +	struct v4l2_subdev *sd = &sensor->pa.sd;
> > +	struct media_pad *pads = &sensor->pa.pad;
> > +	int ret;
> > +
> > +	/* Initialize the subdev. */
> > +	v4l2_subdev_init(sd, &mt9m114_pa_ops);
> > +	v4l2_i2c_subdev_set_name(sd, sensor->client, "mt9m114", " pixel array");
> > +
> > +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	sd->owner = THIS_MODULE;
> > +	sd->dev = &sensor->client->dev;
> > +	v4l2_set_subdevdata(sd, sensor->client);
> > +
> > +	/* Initialize the media entity. */
> > +	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +	sd->entity.ops = &mt9m114_entity_ops;
> > +	pads[0].flags = MEDIA_PAD_FL_SOURCE;
> > +	ret = media_entity_pads_init(&sd->entity, 1, pads);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* Initialize the control handler. */
> > +	v4l2_ctrl_handler_init(hdl, 3);
> > +
> > +	/*
> > +	 * The maximum corse integratime is MT9M114_FRAME_LENGTH - 2 lines. The
> > +	 * default is taken directly from the datasheet, but makes little sense
> > +	 * as auto-exposure is enabled by default.
> > +	 */
> > +	sensor->pa.exposure =
> > +		v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
> > +				  V4L2_CID_EXPOSURE,
> > +				  1, MT9M114_FRAME_LENGTH - 2, 1, 16);
> > +	if (!sensor->pa.exposure)
> > +		return hdl->error;
>
> Isn't it easier to check check for hdl->error after having created all
> controls ? (and set flags later too)
>
> > +	sensor->pa.exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
> > +
> > +	sensor->pa.gain =
> > +		v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
> > +				  V4L2_CID_ANALOGUE_GAIN,
> > +				  1, 511, 1, 32);
> > +	if (!sensor->pa.gain)
> > +		return hdl->error;
> > +	sensor->pa.gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
> > +
> > +	v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
> > +			  V4L2_CID_PIXEL_RATE,
> > +			  sensor->pixrate, sensor->pixrate, 1,
> > +			  sensor->pixrate);
> > +
> > +	ret = v4l2_ctrl_handler_setup(hdl);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	sd->ctrl_handler = hdl;
> > +
> > +	/* Initialize the pads formats and selection rectangles. */
> > +	mt9m114_pa_init_cfg(sd, NULL);
> > +
> > +	return 0;
> > +}
> > +
> > +static void mt9m114_pa_cleanup(struct mt9m114 *sensor)
> > +{
> > +	media_entity_cleanup(&sensor->pa.sd.entity);
> > +}
> > +
> > +/* -----------------------------------------------------------------------------
> > + * Image Flow Processor Control Operations
> > + */
> > +
> > +static const char * const mt9m114_test_pattern_menu[] = {
> > +	"Disabled",
> > +	"Solid Color",
> > +	"100% Color Bars",
> > +	"Pseudo-Random",
> > +	"Fade-to-Gray Color Bars",
> > +	"Walking Ones 10-bit",
> > +	"Walking Ones 8-bit",
> > +};
> > +
> > +/* Keep in sync with mt9m114_test_pattern_menu */
> > +static const unsigned int mt9m114_test_pattern_value[] = {
> > +	MT9M114_CAM_MODE_TEST_PATTERN_SELECT_SOLID,
> > +	MT9M114_CAM_MODE_TEST_PATTERN_SELECT_SOLID_BARS,
> > +	MT9M114_CAM_MODE_TEST_PATTERN_SELECT_RANDOM,
> > +	MT9M114_CAM_MODE_TEST_PATTERN_SELECT_FADING_BARS,
> > +	MT9M114_CAM_MODE_TEST_PATTERN_SELECT_WALKING_1S_10B,
> > +	MT9M114_CAM_MODE_TEST_PATTERN_SELECT_WALKING_1S_8B,
> > +};
> > +
> > +static inline struct mt9m114 *ifp_ctrl_to_mt9m114(struct v4l2_ctrl *ctrl)
> > +{
> > +	return container_of(ctrl->handler, struct mt9m114, ifp.hdl);
> > +}
> > +
> > +static int mt9m114_ifp_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct mt9m114 *sensor = ifp_ctrl_to_mt9m114(ctrl);
> > +	u32 value;
> > +	int ret = 0;
> > +
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_AUTO_WHITE_BALANCE:
> > +		/* Control both the AWB mode and the CCM algorithm. */
> > +		if (ctrl->val)
> > +			value = MT9M114_CAM_AWB_MODE_AUTO
> > +			      | MT9M114_CAM_AWB_MODE_EXCLUSIVE_AE;
> > +		else
> > +			value = 0;
> > +
> > +		mt9m114_write(sensor, MT9M114_CAM_AWB_AWBMODE, value, &ret);
> > +
> > +		if (ctrl->val)
> > +			value = MT9M114_CCM_EXEC_CALC_CCM_MATRIX
> > +			      | 0x22;
> > +		else
> > +			value = 0;
> > +
> > +		mt9m114_write(sensor, MT9M114_CCM_ALGO, value, &ret);
> > +		break;
> > +
> > +	case V4L2_CID_HFLIP:
> > +		mt9m114_read(sensor, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
> > +			     &value);
> > +		if (ctrl->val)
> > +			value |= MT9M114_CAM_SENSOR_CONTROL_HORZ_MIRROR_EN;
> > +		else
> > +			value &= ~MT9M114_CAM_SENSOR_CONTROL_HORZ_MIRROR_EN;
> > +		mt9m114_write(sensor, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
> > +			      value, &ret);
> > +		break;
> > +
> > +	case V4L2_CID_VFLIP:
> > +		mt9m114_read(sensor, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
> > +			     &value);
> > +		if (ctrl->val)
> > +			value |= MT9M114_CAM_SENSOR_CONTROL_VERT_FLIP_EN;
> > +		else
> > +			value &= ~MT9M114_CAM_SENSOR_CONTROL_VERT_FLIP_EN;
> > +		mt9m114_write(sensor, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
> > +			      value, &ret);
> > +		break;
> > +
> > +	case V4L2_CID_EXPOSURE_AUTO:
> > +		if (ctrl->val == V4L2_EXPOSURE_AUTO)
> > +			value = MT9M114_AE_TRACK_EXEC_AUTOMATIC_EXPOSURE
> > +			      | 0x00fe;
> > +		else
> > +			value = 0;
> > +
> > +		mt9m114_write(sensor, MT9M114_AE_TRACK_ALGO, value, &ret);
> > +		if (ret)
> > +			break;
> > +
> > +		mt9m114_pa_update_controls(sensor,
> > +					   ctrl->val != V4L2_EXPOSURE_AUTO);
> > +		break;
> > +
> > +	case V4L2_CID_TEST_PATTERN:
> > +	case V4L2_CID_TEST_PATTERN_RED:
> > +	case V4L2_CID_TEST_PATTERN_GREENR:
> > +	case V4L2_CID_TEST_PATTERN_BLUE: {
> > +		unsigned int pattern = sensor->ifp.tpg[MT9M114_TPG_PATTERN]->val;
> > +
> > +		if (pattern) {
> > +			mt9m114_write(sensor, MT9M114_CAM_MODE_SELECT,
> > +				      MT9M114_CAM_MODE_SELECT_TEST_PATTERN,
> > +				      &ret);
> > +			mt9m114_write(sensor,
> > +				      MT9M114_CAM_MODE_TEST_PATTERN_SELECT,
> > +				      mt9m114_test_pattern_value[pattern - 1],
> > +				      &ret);
> > +			mt9m114_write(sensor,
> > +				      MT9M114_CAM_MODE_TEST_PATTERN_RED,
> > +				      sensor->ifp.tpg[MT9M114_TPG_RED]->val,
> > +				      &ret);
> > +			mt9m114_write(sensor,
> > +				      MT9M114_CAM_MODE_TEST_PATTERN_GREEN,
> > +				      sensor->ifp.tpg[MT9M114_TPG_GREEN]->val,
> > +				      &ret);
> > +			mt9m114_write(sensor,
> > +				      MT9M114_CAM_MODE_TEST_PATTERN_BLUE,
> > +				      sensor->ifp.tpg[MT9M114_TPG_BLUE]->val,
> > +				      &ret);
> > +		} else {
> > +			mt9m114_write(sensor, MT9M114_CAM_MODE_SELECT,
> > +				      MT9M114_CAM_MODE_SELECT_NORMAL, &ret);
> > +		}
> > +
> > +		/*
> > +		 * A Config-Change needs to be issued for the change to take
> > +		 * effect. If we're not streaming ignore this, the change will
> > +		 * be applied when the stream is started.
> > +		 */
> > +		if (ret || !sensor->streaming)
> > +			break;
> > +
> > +		ret = mt9m114_set_state(sensor,
> > +					MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
> > +		break;
> > +	}
> > +
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops mt9m114_ifp_ctrl_ops = {
> > +	.s_ctrl = mt9m114_ifp_s_ctrl,
> > +};
> > +
> > +/* -----------------------------------------------------------------------------
> > + * Image Flow Processor Subdev Operations
> > + */
> > +
> > +static inline struct mt9m114 *ifp_to_mt9m114(struct v4l2_subdev *sd)
> > +{
> > +	return container_of(sd, struct mt9m114, ifp.sd);
> > +}
> > +
> > +static int mt9m114_ifp_s_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> > +	int ret;
> > +
> > +	mutex_lock(sensor->ifp.hdl.lock);
> > +
> > +	if (!enable) {
> > +		ret = mt9m114_set_state(sensor,
> > +					MT9M114_SYS_STATE_ENTER_SUSPEND);
> > +		sensor->streaming = false;
> > +		goto done;
> > +	}
> > +
> > +	mutex_lock(&sensor->lock);
> > +	ret = mt9m114_configure(sensor);
>
> Can't mt9m114_configure() lock sensor->lock by itself ?
>
> > +	mutex_unlock(&sensor->lock);
> > +	if (ret < 0)
>
> Should you release sensor->ipf.hdl.lock by jumping to done ?
>
> > +		return ret;
> > +
> > +	/*
> > +	 * The Change-Config state is transient and moves to the streaming
> > +	 * state automatically.
> > +	 */
> > +	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
> > +	if (ret < 0)
> > +		goto done;
> > +
> > +	sensor->streaming = true;
> > +
> > +done:
> > +	mutex_unlock(sensor->ifp.hdl.lock);
> > +	return ret;
> > +}
> > +
> > +static int mt9m114_ifp_g_frame_interval(struct v4l2_subdev *sd,
> > +					struct v4l2_subdev_frame_interval *interval)
> > +{
> > +	struct v4l2_fract *ival = &interval->interval;
> > +	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> > +
> > +	ival->numerator = 1;
> > +	ival->denominator = sensor->ifp.frame_rate;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt9m114_ifp_s_frame_interval(struct v4l2_subdev *sd,
> > +					struct v4l2_subdev_frame_interval *interval)
>
> For new drivers it would be nice to move to control framerate by
> explicitely control the blankings. I assume this would be done on the
> PA not IFP, right ?
>
> > +{
> > +	struct v4l2_fract *ival = &interval->interval;
> > +	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> > +	u16 frame_rate;
> > +	int ret = 0;
>
> No need to intialize ret
>
> > +
> > +	if (ival->numerator != 0 && ival->denominator != 0)
> > +		sensor->ifp.frame_rate = min_t(unsigned int,
> > +					       ival->denominator / ival->numerator,
> > +					       MT9M114_MAX_FRAME_RATE);
> > +	else
> > +		sensor->ifp.frame_rate = MT9M114_MAX_FRAME_RATE;
> > +
> > +	ival->numerator = 1;
> > +	ival->denominator = sensor->ifp.frame_rate;
> > +
> > +	frame_rate = sensor->ifp.frame_rate << 8;
> > +	mt9m114_write(sensor, MT9M114_CAM_AET_MIN_FRAME_RATE, frame_rate, &ret);
> > +	mt9m114_write(sensor, MT9M114_CAM_AET_MAX_FRAME_RATE, frame_rate, &ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static struct v4l2_mbus_framefmt *
> > +__mt9m114_ifp_get_pad_format(struct mt9m114 *sensor,
> > +			     struct v4l2_subdev_state *state,
> > +			     unsigned int pad, u32 which)
> > +{
> > +	switch (which) {
> > +	case V4L2_SUBDEV_FORMAT_TRY:
> > +		return v4l2_subdev_get_try_format(&sensor->ifp.sd, state, pad);
> > +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > +		return &sensor->ifp.formats[pad];
> > +	default:
> > +		return NULL;
> > +	}
> > +}
> > +
> > +static struct v4l2_rect *
> > +__mt9m114_ifp_get_pad_crop(struct mt9m114 *sensor,
> > +			   struct v4l2_subdev_state *state,
> > +			   unsigned int pad, u32 which)
> > +{
> > +	switch (which) {
> > +	case V4L2_SUBDEV_FORMAT_TRY:
> > +		return v4l2_subdev_get_try_crop(&sensor->ifp.sd, state, pad);
> > +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > +		return &sensor->ifp.crop;
> > +	default:
> > +		return NULL;
> > +	}
> > +}
> > +
> > +static struct v4l2_rect *
> > +__mt9m114_ifp_get_pad_compose(struct mt9m114 *sensor,
> > +			      struct v4l2_subdev_state *state,
> > +			      unsigned int pad, u32 which)
> > +{
> > +	switch (which) {
> > +	case V4L2_SUBDEV_FORMAT_TRY:
> > +		return v4l2_subdev_get_try_compose(&sensor->ifp.sd, state, pad);
> > +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > +		return &sensor->ifp.compose;
> > +	default:
> > +		return NULL;
> > +	}
> > +}
> > +
> > +static int mt9m114_ifp_init_cfg(struct v4l2_subdev *sd,
> > +				struct v4l2_subdev_state *state)
> > +{
> > +	u32 which = state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> > +	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> > +	struct v4l2_mbus_framefmt *format;
> > +	struct v4l2_rect *crop;
> > +	struct v4l2_rect *compose;
> > +
> > +	format = __mt9m114_ifp_get_pad_format(sensor, state, 0, which);
> > +	memset(format, 0, sizeof(*format));
> > +
> > +	format->width = MT9M114_PIXEL_ARRAY_WIDTH;
> > +	format->height = MT9M114_PIXEL_ARRAY_HEIGHT;
> > +	format->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> > +	format->field = V4L2_FIELD_NONE;
> > +	format->colorspace = V4L2_COLORSPACE_SRGB;
> > +	format->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > +	format->quantization = V4L2_QUANTIZATION_DEFAULT;
> > +	format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> > +
> > +	crop = __mt9m114_ifp_get_pad_crop(sensor, state, 0, which);
> > +
> > +	crop->left = 4;
> > +	crop->top = 4;
> > +	crop->width = format->width - 8;
> > +	crop->height = format->height - 8;
> > +
> > +	compose = __mt9m114_ifp_get_pad_compose(sensor, state, 0, which);
> > +
> > +	compose->left = 0;
> > +	compose->top = 0;
> > +	compose->width = crop->width;
> > +	compose->height = crop->height;
> > +
> > +	format = __mt9m114_ifp_get_pad_format(sensor, state, 1, which);
> > +	memset(format, 0, sizeof(*format));
> > +
> > +	format->width = compose->width;
> > +	format->height = compose->height;
> > +	format->code = mt9m114_default_format_info(sensor)->code;
> > +	format->field = V4L2_FIELD_NONE;
> > +	format->colorspace = V4L2_COLORSPACE_SRGB;
> > +	format->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > +	format->quantization = V4L2_QUANTIZATION_DEFAULT;
> > +	format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt9m114_ifp_enum_mbus_code(struct v4l2_subdev *sd,
> > +				      struct v4l2_subdev_state *state,
> > +				      struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +	const unsigned int num_formats = ARRAY_SIZE(mt9m114_format_infos);
> > +	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> > +	unsigned int index = 0;
> > +	unsigned int flag;
> > +	unsigned int i;
> > +
> > +	switch (code->pad) {
> > +	case 0:
> > +		if (code->index != 0)
> > +			return -EINVAL;
> > +
> > +		code->code = mt9m114_format_infos[num_formats - 1].code;
> > +		return 0;
> > +
> > +	case 1:
> > +		if (sensor->bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY)
> > +			flag = MT9M114_FMT_FLAG_CSI2;
> > +		else
> > +			flag = MT9M114_FMT_FLAG_PARALLEL;
> > +
> > +		for (i = 0; i < num_formats; ++i) {
> > +			const struct mt9m114_format_info *info =
> > +				&mt9m114_format_infos[i];
> > +
> > +			if (info->flags & flag) {
> > +				if (index == code->index) {
> > +					code->code = info->code;
> > +					return 0;
> > +				}
> > +
> > +				index++;
> > +			}
> > +		}
> > +
> > +		return -EINVAL;
> > +
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +static int mt9m114_ifp_enum_framesizes(struct v4l2_subdev *sd,
> > +				       struct v4l2_subdev_state *state,
> > +				       struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> > +	const struct mt9m114_format_info *info;
> > +
> > +	if (fse->index > 0)
> > +		return -EINVAL;
> > +
> > +	info = mt9m114_format_info(sensor, fse->pad, fse->code);
> > +	if (!info || info->code != fse->code)
> > +		return -EINVAL;
> > +
> > +	if (fse->pad == 0) {
> > +		fse->min_width = MT9M114_PIXEL_ARRAY_MIN_OUTPUT_WIDTH;
> > +		fse->max_width = MT9M114_PIXEL_ARRAY_WIDTH;
> > +		fse->min_height = MT9M114_PIXEL_ARRAY_MIN_OUTPUT_HEIGHT;
> > +		fse->max_height = MT9M114_PIXEL_ARRAY_HEIGHT;
> > +	} else {
> > +		const struct v4l2_rect *crop;
> > +
> > +		crop = __mt9m114_ifp_get_pad_crop(sensor, state, 0,
> > +						  V4L2_SUBDEV_FORMAT_TRY);
> > +
> > +		mutex_lock(&sensor->lock);
> > +		fse->max_width = crop->width;
> > +		fse->max_height = crop->height;
> > +		mutex_unlock(&sensor->lock);
> > +
> > +		fse->min_width = fse->max_width / 4;
> > +		fse->min_height = fse->max_height / 4;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt9m114_ifp_enum_frameintervals(struct v4l2_subdev *sd,
> > +					   struct v4l2_subdev_state *state,
> > +					   struct v4l2_subdev_frame_interval_enum *fie)
> > +{
> > +	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> > +	const struct mt9m114_format_info *info;
> > +
> > +	if (fie->index > 0)
> > +		return -EINVAL;
> > +
> > +	info = mt9m114_format_info(sensor, fie->pad, fie->code);
> > +	if (!info || info->code != fie->code)
> > +		return -EINVAL;
> > +
> > +	fie->interval.numerator = 1;
> > +	fie->interval.denominator = MT9M114_MAX_FRAME_RATE;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt9m114_ifp_get_fmt(struct v4l2_subdev *sd,
> > +			       struct v4l2_subdev_state *state,
> > +			       struct v4l2_subdev_format *fmt)
> > +{
> > +	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> > +	struct v4l2_mbus_framefmt *format;
> > +
> > +	format = __mt9m114_ifp_get_pad_format(sensor, state, fmt->pad,
> > +					      fmt->which);
> > +
> > +	mutex_lock(&sensor->lock);
> > +	fmt->format = *format;
> > +	mutex_unlock(&sensor->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
> > +			       struct v4l2_subdev_state *state,
> > +			       struct v4l2_subdev_format *fmt)
> > +{
> > +	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> > +	struct v4l2_mbus_framefmt *format;
> > +
> > +	format = __mt9m114_ifp_get_pad_format(sensor, state, fmt->pad,
> > +					      fmt->which);
> > +
> > +	mutex_lock(&sensor->lock);
> > +
> > +	if (fmt->pad == 0) {
> > +		/* Only the size can be changed on the sink pad. */
> > +		format->width = clamp(ALIGN(fmt->format.width, 8),
> > +				      MT9M114_PIXEL_ARRAY_MIN_OUTPUT_WIDTH,
> > +				      MT9M114_PIXEL_ARRAY_WIDTH);
> > +		format->height = clamp(ALIGN(fmt->format.height, 8),
> > +				       MT9M114_PIXEL_ARRAY_MIN_OUTPUT_HEIGHT,
> > +				       MT9M114_PIXEL_ARRAY_HEIGHT);
> > +	} else {
> > +		const struct mt9m114_format_info *info;
> > +
> > +		/* Only the media bus code can be changed on the source pad. */
> > +		info = mt9m114_format_info(sensor, 1, fmt->format.code);
> > +
> > +		format->code = info->code;
> > +		if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> > +			sensor->ifp.info = info;
> > +
> > +		/* If the output format is RAW10, bypass the scaler. */
> > +		if (format->code == MEDIA_BUS_FMT_SGRBG10_1X10)
> > +			*format = *__mt9m114_ifp_get_pad_format(sensor, state,
> > +								0, fmt->which);
> > +	}
> > +
> > +	fmt->format = *format;
> > +
> > +	mutex_unlock(&sensor->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt9m114_ifp_get_selection(struct v4l2_subdev *sd,
> > +				     struct v4l2_subdev_state *state,
> > +				     struct v4l2_subdev_selection *sel)
> > +{
> > +	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> > +	const struct v4l2_mbus_framefmt *format;
> > +	const struct v4l2_rect *crop;
> > +	int ret = 0;
> > +
> > +	/* Crop and compose are only supported on the sink pad. */
> > +	if (sel->pad != 0)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&sensor->lock);
> > +
> > +	switch (sel->target) {
> > +	case V4L2_SEL_TGT_CROP:
> > +		sel->r = *__mt9m114_ifp_get_pad_crop(sensor, state, 0,
> > +						     sel->which);
> > +		break;
> > +
> > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > +		/*
> > +		 * The crop default and bounds are equal to the sink
> > +		 * format size minus 4 pixels on each side for demosaicing.
> > +		 */
> > +		format = __mt9m114_ifp_get_pad_format(sensor, state, 0,
> > +						      sel->which);
> > +
> > +		sel->r.left = 4;
> > +		sel->r.top = 4;
> > +		sel->r.width = format->width - 8;
> > +		sel->r.height = format->height - 8;
> > +		break;
> > +
> > +	case V4L2_SEL_TGT_COMPOSE:
> > +		sel->r = *__mt9m114_ifp_get_pad_compose(sensor, state, 0,
> > +							sel->which);
> > +		break;
> > +
> > +	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> > +	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> > +		/*
> > +		 * The compose default and bounds sizes are equal to the sink
> > +		 * crop rectangle size.
> > +		 */
> > +		crop = __mt9m114_ifp_get_pad_crop(sensor, state, 0, sel->which);
> > +		sel->r.left = 0;
> > +		sel->r.top = 0;
> > +		sel->r.width = crop->width;
> > +		sel->r.height = crop->height;
> > +		break;
> > +
> > +	default:
> > +		ret = -EINVAL;
> > +		break;
> > +	}
> > +
> > +	mutex_unlock(&sensor->lock);
> > +	return ret;
> > +}
> > +
> > +static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
> > +				     struct v4l2_subdev_state *state,
> > +				     struct v4l2_subdev_selection *sel)
> > +{
> > +	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> > +	struct v4l2_mbus_framefmt *format;
> > +	struct v4l2_rect *crop;
> > +	struct v4l2_rect *compose;
> > +
> > +	if (sel->target != V4L2_SEL_TGT_CROP &&
> > +	    sel->target != V4L2_SEL_TGT_COMPOSE)
> > +		return -EINVAL;
> > +
> > +	/* Crop and compose are only supported on the sink pad. */
> > +	if (sel->pad != 0)
> > +		return -EINVAL;
> > +
> > +	format = __mt9m114_ifp_get_pad_format(sensor, state, 0, sel->which);
> > +	crop = __mt9m114_ifp_get_pad_crop(sensor, state, 0, sel->which);
> > +	compose = __mt9m114_ifp_get_pad_compose(sensor, state, 0, sel->which);
> > +
> > +	mutex_lock(&sensor->lock);
> > +
> > +	if (sel->target == V4L2_SEL_TGT_CROP) {
> > +		/*
> > +		 * Clamp the crop rectangle. Demosaicing removes 4 pixels on
> > +		 * each side of the image.
> > +		 */
> > +		crop->left = clamp_t(unsigned int, ALIGN(sel->r.left, 2), 4,
> > +				     format->width - 4 -
> > +				     MT9M114_SCALER_CROPPED_INPUT_WIDTH);
> > +		crop->top = clamp_t(unsigned int, ALIGN(sel->r.top, 2), 4,
> > +				    format->height - 4 -
> > +				    MT9M114_SCALER_CROPPED_INPUT_HEIGHT);
> > +		crop->width = clamp_t(unsigned int, ALIGN(sel->r.width, 2),
> > +				      MT9M114_SCALER_CROPPED_INPUT_WIDTH,
> > +				      format->width - 4 - crop->left);
> > +		crop->height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
> > +				       MT9M114_SCALER_CROPPED_INPUT_HEIGHT,
> > +				       format->height - 4 - crop->top);
> > +
> > +		sel->r = *crop;
> > +
> > +		/* Propagate to the compose rectangle. */
> > +		compose->width = crop->width;
> > +		compose->height = crop->height;
> > +	} else {
> > +		/*
> > +		 * Clamp the compose rectangle. The scaler can only downscale.
> > +		 */
> > +		compose->left = 0;
> > +		compose->top = 0;
> > +		compose->width = clamp_t(unsigned int, ALIGN(sel->r.width, 2),
> > +					 MT9M114_SCALER_CROPPED_INPUT_WIDTH,
> > +					 crop->width);
> > +		compose->height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
> > +					  MT9M114_SCALER_CROPPED_INPUT_HEIGHT,
> > +					  crop->height);
> > +
> > +		sel->r = *compose;
> > +	}
> > +
> > +	/* Propagate the compose rectangle to the source format. */
> > +	format = __mt9m114_ifp_get_pad_format(sensor, state, 1, sel->which);
> > +	format->width = compose->width;
> > +	format->height = compose->height;
> > +
> > +	mutex_unlock(&sensor->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static void mt9m114_ifp_unregistered(struct v4l2_subdev *sd)
> > +{
> > +	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> > +
> > +	v4l2_device_unregister_subdev(&sensor->pa.sd);
> > +}
> > +
> > +static int mt9m114_ifp_registered(struct v4l2_subdev *sd)
> > +{
> > +	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> > +	int ret;
> > +
> > +	ret = v4l2_device_register_subdev(sd->v4l2_dev, &sensor->pa.sd);
> > +	if (ret < 0) {
> > +		dev_err(&sensor->client->dev,
> > +			"Failed to register pixel array subdev\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = media_create_pad_link(&sensor->pa.sd.entity, 0,
> > +				    &sensor->ifp.sd.entity, 0,
> > +				    MEDIA_LNK_FL_ENABLED |
> > +				    MEDIA_LNK_FL_IMMUTABLE);
> > +	if (ret < 0) {
> > +		dev_err(&sensor->client->dev,
> > +			"Failed to link pixel array to ifp\n");
> > +		v4l2_device_unregister_subdev(&sensor->pa.sd);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_video_ops mt9m114_ifp_video_ops = {
> > +	.s_stream = mt9m114_ifp_s_stream,
> > +	.g_frame_interval = mt9m114_ifp_g_frame_interval,
> > +	.s_frame_interval = mt9m114_ifp_s_frame_interval,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops mt9m114_ifp_pad_ops = {
> > +	.init_cfg = mt9m114_ifp_init_cfg,
> > +	.enum_mbus_code = mt9m114_ifp_enum_mbus_code,
> > +	.enum_frame_size = mt9m114_ifp_enum_framesizes,
> > +	.enum_frame_interval = mt9m114_ifp_enum_frameintervals,
> > +	.get_fmt = mt9m114_ifp_get_fmt,
> > +	.set_fmt = mt9m114_ifp_set_fmt,
> > +	.get_selection = mt9m114_ifp_get_selection,
> > +	.set_selection = mt9m114_ifp_set_selection,
> > +};
> > +
> > +static const struct v4l2_subdev_ops mt9m114_ifp_ops = {
> > +	.video = &mt9m114_ifp_video_ops,
> > +	.pad = &mt9m114_ifp_pad_ops,
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops mt9m114_ifp_internal_ops = {
> > +	.registered = mt9m114_ifp_registered,
> > +	.unregistered = mt9m114_ifp_unregistered,
> > +};
> > +
> > +static int mt9m114_ifp_init(struct mt9m114 *sensor)
> > +{
> > +	struct v4l2_subdev *sd = &sensor->ifp.sd;
> > +	struct media_pad *pads = sensor->ifp.pads;
> > +	struct v4l2_ctrl_handler *hdl = &sensor->ifp.hdl;
> > +	int ret;
> > +
> > +	/* Initialize the subdev. */
> > +	v4l2_i2c_subdev_init(sd, sensor->client, &mt9m114_ifp_ops);
> > +	v4l2_i2c_subdev_set_name(sd, sensor->client, "mt9m114", " ifp");
> > +
> > +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	sd->internal_ops = &mt9m114_ifp_internal_ops;
> > +
> > +	/* Initialize the media entity. */
> > +	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
> > +	sd->entity.ops = &mt9m114_entity_ops;
> > +	pads[0].flags = MEDIA_PAD_FL_SINK;
> > +	pads[1].flags = MEDIA_PAD_FL_SOURCE;
> > +	ret = media_entity_pads_init(&sd->entity, 2, pads);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* Initialize the control handler. */
> > +	v4l2_ctrl_handler_init(hdl, 8);
>
> Seems like you register 9 controls to me :)
>
> > +	v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
> > +			  V4L2_CID_AUTO_WHITE_BALANCE,
> > +			  0, 1, 1, 1);
> > +	v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
> > +			  V4L2_CID_HFLIP,
> > +			  0, 1, 1, 0);
> > +	v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
> > +			  V4L2_CID_VFLIP,
> > +			  0, 1, 1, 0);
> > +	v4l2_ctrl_new_std_menu(hdl, &mt9m114_ifp_ctrl_ops,
> > +			       V4L2_CID_EXPOSURE_AUTO,
> > +			       V4L2_EXPOSURE_MANUAL, 0,
> > +			       V4L2_EXPOSURE_AUTO);
> > +	v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
> > +			  V4L2_CID_PIXEL_RATE,
> > +			  sensor->pixrate, sensor->pixrate, 1,
> > +			  sensor->pixrate);
> > +
> > +	sensor->ifp.tpg[MT9M114_TPG_PATTERN] =
> > +		v4l2_ctrl_new_std_menu_items(hdl, &mt9m114_ifp_ctrl_ops,
> > +					     V4L2_CID_TEST_PATTERN,
> > +					     ARRAY_SIZE(mt9m114_test_pattern_menu) - 1,
> > +					     0, 0, mt9m114_test_pattern_menu);
> > +	sensor->ifp.tpg[MT9M114_TPG_RED] =
> > +		v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
> > +				  V4L2_CID_TEST_PATTERN_RED,
> > +				  0, 1023, 1, 1023);
> > +	sensor->ifp.tpg[MT9M114_TPG_GREEN] =
> > +		v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
> > +				  V4L2_CID_TEST_PATTERN_GREENR,
> > +				  0, 1023, 1, 1023);
> > +	sensor->ifp.tpg[MT9M114_TPG_BLUE] =
> > +		v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
> > +				  V4L2_CID_TEST_PATTERN_BLUE,
> > +				  0, 1023, 1, 1023);
> > +
> > +	v4l2_ctrl_cluster(ARRAY_SIZE(sensor->ifp.tpg), sensor->ifp.tpg);
> > +
> > +	if (hdl->error)
> > +		return hdl->error;
> > +
> > +	ret = v4l2_ctrl_handler_setup(hdl);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	sd->ctrl_handler = hdl;
> > +
> > +	/* Initialize the pads formats and selection rectangles. */
> > +	mt9m114_ifp_init_cfg(sd, NULL);
> > +
> > +	sensor->ifp.frame_rate = MT9M114_MAX_FRAME_RATE;
> > +
> > +	return 0;
> > +}
> > +
> > +static void mt9m114_ifp_cleanup(struct mt9m114 *sensor)
> > +{
> > +	v4l2_ctrl_handler_free(&sensor->ifp.hdl);
> > +	media_entity_cleanup(&sensor->ifp.sd.entity);
> > +}
> > +
> > +/* -----------------------------------------------------------------------------
> > + * Probe & Remove
> > + */
> > +
> > +static int mt9m114_identify(struct mt9m114 *sensor)
> > +{
> > +	u32 major, minor, release, customer;
> > +	u32 value;
> > +	int ret;
> > +
> > +	ret = mt9m114_read(sensor, MT9M114_CHIP_ID, &value);
> > +	if (ret < 0) {
> > +		dev_err(&sensor->client->dev, "Failed to read chip ID\n");
> > +		return -ENXIO;
> > +	}
> > +
> > +	if (value != 0x2481) {
> > +		dev_err(&sensor->client->dev, "Invalid chip ID 0x%04x\n",
> > +			value);
> > +		return -ENXIO;
> > +	}
> > +
> > +	ret = mt9m114_read(sensor, MT9M114_MON_MAJOR_VERSION, &major);
> > +	ret |= mt9m114_read(sensor, MT9M114_MON_MINOR_VERSION, &minor);
> > +	ret |= mt9m114_read(sensor, MT9M114_MON_RELEASE_VERSION, &release);
> > +	ret |= mt9m114_read(sensor, MT9M114_CUSTOMER_REV, &customer);
> > +	if (ret) {
> > +		dev_err(&sensor->client->dev, "Failed to read version\n");
> > +		return -ENXIO;
> > +	}
> > +
> > +	dev_dbg(&sensor->client->dev,
> > +		"monitor v%u.%u.%04x customer rev 0x%04x\n",
> > +		major, minor, release, customer);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt9m114_parse_dt(struct mt9m114 *sensor)
> > +{
> > +	struct fwnode_handle *fwnode = dev_fwnode(&sensor->client->dev);
> > +	struct fwnode_handle *ep;
> > +	int ret;
> > +
> > +	if (!fwnode)
> > +		return -ENXIO;
>
> Can this happen ?
>
> > +
> > +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> > +	if (!ep) {
> > +		dev_err(&sensor->client->dev, "No endpoint found\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	sensor->bus_cfg.bus_type = V4L2_MBUS_UNKNOWN;
>
> Isn't bus autodiscovery deprecated, or at least discouraged ?
> The alternative is not nice if my understanding is correct, as you
> would need to try to parse 3 different bus types one after the other :/
>
> > +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &sensor->bus_cfg);
> > +	fwnode_handle_put(ep);
> > +	if (ret < 0) {
> > +		dev_err(&sensor->client->dev, "Failed to parse endpoint\n");
> > +		goto error;
> > +	}
> > +
> > +	switch (sensor->bus_cfg.bus_type) {
> > +	case V4L2_MBUS_CSI2_DPHY:
> > +	case V4L2_MBUS_PARALLEL:
> > +		break;
> > +
> > +	default:
> > +		dev_err(&sensor->client->dev, "unsupported bus type %u\n",
> > +			sensor->bus_cfg.bus_type);
> > +		ret = -EINVAL;
> > +		goto error;
> > +	}
> > +
> > +	return 0;
> > +
> > +error:
> > +	v4l2_fwnode_endpoint_free(&sensor->bus_cfg);
> > +	return ret;
> > +}
> > +
> > +static int mt9m114_probe(struct i2c_client *client,
> > +			 const struct i2c_device_id *id)
> > +{
> > +	struct mt9m114 *sensor;
> > +	int ret;
> > +
> > +	/* Check if the adapter supports the needed features. */
> > +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> > +		return -EIO;
> > +
> > +	sensor = devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL);
> > +	if (!sensor)
> > +		return -ENOMEM;
> > +
> > +	mutex_init(&sensor->lock);
> > +	sensor->client = client;
> > +
> > +	ret = mt9m114_parse_dt(sensor);
> > +	if (ret < 0)
> > +		goto error_mutex;
> > +
> > +	/* Acquire clocks, GPIOs and regulators. */
> > +	sensor->clk = devm_clk_get(&client->dev, NULL);
> > +	if (IS_ERR(sensor->clk)) {
> > +		if (PTR_ERR(sensor->clk) != -EPROBE_DEFER)
> > +			dev_err(&client->dev, "Failed to get clock: %ld\n",
> > +				PTR_ERR(sensor->clk));
>
> Could dev_err_probe() help here ?
>
> > +
> > +		ret = PTR_ERR(sensor->clk);
> > +		goto error_ep_free;
> > +	}
> > +
> > +	sensor->reset = devm_gpiod_get_optional(&client->dev, "reset",
> > +						GPIOD_OUT_LOW);
> > +	if (IS_ERR(sensor->reset)) {
> > +		if (PTR_ERR(sensor->reset) != -EPROBE_DEFER)
> > +			dev_err(&client->dev, "Failed to get reset GPIO: %ld\n",
> > +				PTR_ERR(sensor->reset));
> > +
> > +		ret = PTR_ERR(sensor->reset);
> > +		goto error_ep_free;
> > +	}
> > +
> > +	sensor->supplies[0].supply = "vddio";
> > +	sensor->supplies[1].supply = "vdd";
> > +	sensor->supplies[2].supply = "vaa";
> > +
> > +	ret = devm_regulator_bulk_get(&client->dev,
> > +				      ARRAY_SIZE(sensor->supplies),
> > +				      sensor->supplies);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "Failed to get regulators: %d\n", ret);
> > +		goto error_ep_free;
> > +	}
> > +
> > +	/* Identify the sensor. */
> > +	ret = mt9m114_power_on(sensor);
> > +	if (ret < 0)
> > +		goto error_ep_free;
> > +
> > +	ret = mt9m114_identify(sensor);
> > +	if (ret < 0)
> > +		goto error_power_off;
> > +
> > +	/* Reset and initialize sensor. */
> > +	ret = mt9m114_initialize(sensor);
> > +	if (ret < 0)
> > +		goto error_power_off;
> > +
> > +	/* Initialize the subdevices. */
> > +	ret = mt9m114_pa_init(sensor);
> > +	if (ret < 0)
> > +		goto error_power_off;
> > +
> > +	ret = mt9m114_ifp_init(sensor);
> > +	if (ret < 0)
> > +		goto error_subdevs;
> > +
> > +	ret = v4l2_async_register_subdev(&sensor->ifp.sd);
> > +	if (ret < 0)
> > +		goto error_subdevs;
> > +
> > +	dev_info(&sensor->client->dev, "MT9M114 initialized\n");
>
> Is this necessary ? Can be demoted to _dbg maybe ?
>
> Most comments are indeed minors, happy the driver works well :)
>
> Thanks
>    j
>
> > +
> > +	return 0;
> > +
> > +error_subdevs:
> > +	mt9m114_ifp_cleanup(sensor);
> > +	mt9m114_pa_cleanup(sensor);
> > +error_power_off:
> > +	mt9m114_power_off(sensor);
> > +error_ep_free:
> > +	v4l2_fwnode_endpoint_free(&sensor->bus_cfg);
> > +error_mutex:
> > +	mutex_destroy(&sensor->lock);
> > +	return ret;
> > +}
> > +
> > +static int mt9m114_remove(struct i2c_client *client)
> > +{
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> > +
> > +	mt9m114_ifp_cleanup(sensor);
> > +	mt9m114_pa_cleanup(sensor);
> > +	v4l2_async_unregister_subdev(&sensor->ifp.sd);
> > +	mt9m114_power_off(sensor);
> > +	v4l2_fwnode_endpoint_free(&sensor->bus_cfg);
> > +	mutex_destroy(&sensor->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id mt9m114_of_ids[] = {
> > +	{ .compatible = "onnn,mt9m114" },
> > +	{ /* sentinel */ },
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, mt9m114_of_ids);
> > +
> > +static struct i2c_driver mt9m114_driver = {
> > +	.driver = {
> > +		.owner	= THIS_MODULE,
> > +		.of_match_table = mt9m114_of_ids,
> > +		.name	= "mt9m114",
> > +	},
> > +	.probe		= mt9m114_probe,
> > +	.remove		= mt9m114_remove,
> > +};
> > +
> > +module_i2c_driver(mt9m114_driver);
> > +
> > +MODULE_DESCRIPTION("onsemi MT9M114 Sensor Driver");
> > +MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
> > +MODULE_LICENSE("GPL v2");
> > --
> > Regards,
> >
> > Laurent Pinchart
> >
