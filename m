Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87D89EDFF4
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 13:26:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728648AbfKDM0Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 07:26:16 -0500
Received: from mga02.intel.com ([134.134.136.20]:60244 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727838AbfKDM0P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Nov 2019 07:26:15 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 04:26:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; 
   d="scan'208";a="212305217"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2019 04:26:10 -0800
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iRbQv-0002El-IO; Mon, 04 Nov 2019 14:26:09 +0200
Date:   Mon, 4 Nov 2019 14:26:09 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V5, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
Message-ID: <20191104122609.GI32742@smile.fi.intel.com>
References: <20191104105713.24311-1-dongchun.zhu@mediatek.com>
 <20191104105713.24311-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104105713.24311-3-dongchun.zhu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 04, 2019 at 06:57:13PM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for OV02A10 image sensor.
> The OV02A10 is a 1/5" CMOS sensor from Omnivision, supporting
> output format: 10-bit RAW.
> 
> This chip has a single MIPI lane interface and use the I2C bus
> for control and the CSI-2 bus for data.

> +/* Bit[7] clock HS mode enable
> + * 0: Clock continue
> + * 1: Clock HS
> + * Bit[6:2] HS VOD adjust
> + * Bit[1:0] P VHI adjust
> + */
> +#define REG_HS_MODE_BLC					0x9d
> +
> +#define CLOCK_HS_MODE_ENABLE				BIT(7)

> +#define CLOCK_HS_VOD_ADJUST	(BIT(6) | BIT(5) | BIT(4) | BIT(3) | BIT(2))

GENMASK()

> +#define OV02A10_MASK_8_BITS				0xff

GENMASK()

> +#define OV02A10_LINK_FREQ_390MHZ			390000000ULL

Can't we publish HZ_PER_MHZ for wider use (currently in phy-stm32-usbphyc.c and
hid-sensor-attributes.c) and use here something like (390 * HZ_PER_MHZ)?

> +#define OV02A10_ECLK_FREQ				24000000

Ditto.

> +static const s64 link_freq_menu_items[] = {

> +	OV02A10_LINK_FREQ_390MHZ

Better to keep comma here.

> +};

> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	int ret;
> +
> +	ret = i2c_smbus_read_byte_data(client, reg);
> +	if (ret >= 0) {
> +		*val = (unsigned char)ret;
> +		ret = 0;
> +	}

Why not to use classical pattern

	if (ret < 0)
		return ret;
	...
	return 0;

?

> +
> +	return ret;
> +}

> +static int ov02a10_mod_reg(struct ov02a10 *ov02a10, u8 reg, u8 mask, u8 val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	u8 readval;
> +	int ret;
> +
> +	ret = ov02a10_read_smbus(ov02a10, reg, &readval);
> +	if (ret)
> +		return ret;
> +

> +	readval &= ~mask;
> +	val &= mask;
> +	val |= readval;

Why not to use classical pattern
	val = (readval & ~mask) | (val & mask);
?

> +
> +	return i2c_smbus_write_byte_data(client, reg, val);
> +}

> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	u16 id;

> +	u8 pid = 0;
> +	u8 ver = 0;

Useless assignments.

> +	int ret;
> +
> +	/* Check sensor revision */
> +	ret = ov02a10_read_smbus(ov02a10, OV02A10_REG_CHIP_ID_H, &pid);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov02a10_read_smbus(ov02a10, OV02A10_REG_CHIP_ID_L, &ver);
> +	if (ret)
> +		return ret;
> +
> +	id = OV02A10_ID(pid, ver);
> +	if (id != CHIP_ID) {
> +		dev_err(&client->dev, "Unexpected sensor id(%04x)\n", id);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(&client->dev, "Detected OV%04X sensor\n", id);
> +
> +	return 0;
> +}

> +	int ret = 0;

Useless assignment...

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

...simple use
	return 0;
here.

> +
> +err_rpm_put:
> +	pm_runtime_put(&client->dev);
> +unlock_and_return:
> +	mutex_unlock(&ov02a10->mutex);
> +
> +	return ret;
> +}

> +static int ov02a10_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov02a10 *ov02a10 = container_of(ctrl->handler,
> +					       struct ov02a10, ctrl_handler);
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	s64 max_expo;

> +	int ret = 0;

Wouldn't be better to have this under `default` case below?

> +
> +	/* Propagate change of current control to all related controls */
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		/* Update max exposure while meeting expected vblanking */
> +		max_expo = ov02a10->cur_mode->height + ctrl->val -
> +			   OV02A10_EXPOSURE_MAX_MARGIN;
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
> +		ret = ov02a10_set_exposure(ov02a10, ctrl->val);
> +		break;
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret = ov02a10_set_gain(ov02a10, ctrl->val);
> +		break;
> +	case V4L2_CID_VBLANK:
> +		ret = ov02a10_set_vblank(ov02a10, ctrl->val);
> +		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = ov02a10_set_test_pattern(ov02a10, ctrl->val);
> +		break;
> +	};
> +
> +	pm_runtime_put(&client->dev);
> +
> +	return ret;
> +}

> +{
> +	struct fwnode_handle *ep;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	unsigned int i, j;
> +	int ret;
> +

I would rather expect fwnode assignment here to understand immediately from
where it has been derived. Though it's up to maintainers.

> +	if (!fwnode)
> +		return -ENXIO;
> +
> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep)
> +		return -ENXIO;
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
> +	/* Optional indication of mipi clock lane mode */
> +	if (bus_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)
> +		ov02a10->mipi_clock_hs_mode_enable = true;
> +

> +	if (!bus_cfg.nr_of_link_frequencies) {
> +		dev_err(dev, "no link frequencies defined");
> +		ret = -EINVAL;
> +		goto check_hwcfg_error;
> +	}

This is redundant check. You have done the similar below when comparing j to
nr_of_link_frequencies.

> +
> +	for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
> +		for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
> +			if (link_freq_menu_items[i] ==
> +				bus_cfg.link_frequencies[j])
> +				break;
> +		}
> +
> +		if (j == bus_cfg.nr_of_link_frequencies) {
> +			dev_err(dev, "no link frequency %lld supported",
> +				link_freq_menu_items[i]);
> +			ret = -EINVAL;
> +			goto check_hwcfg_error;
> +		}
> +	}
> +
> +check_hwcfg_error:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}

> +static int ov02a10_probe(struct i2c_client *client)
> +{


> +	/* Optional indication of physical rotation of sensor */
> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation",
> +				       &rotation);

It's perfectly one line.

> +	if (!ret) {

I would rather do two things here:
1/ use the similar pattern as below with messaging
	if (!ret) {
		...
	} else {
		dev_dbg(...);
	}
2/ Actually use positive conditionals
	if (ret) {
		...
	} else {
		...
	}

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
> +	/* Optional indication of HS VOD adjust */
> +	ret = fwnode_property_read_u32(dev_fwnode(dev),
> +				       "ovti,hs-vod-adjust",
> +				       &hs_vod_adjust_cnt);
> +	if (!ret)
> +		ov02a10->mipi_clock_hs_vod_adjust_cnt = hs_vod_adjust_cnt;
> +	else
> +		dev_warn(dev, "failed to get hs vod adjust, using default\n");
> +
> +	/* Optional indication of mipi tx speed */
> +	ret = fwnode_property_read_u32(dev_fwnode(dev),
> +				       "ovti,mipi-tx-speed",
> +				       &clock_lane_tx_speed);
> +
> +	if (!ret)
> +		ov02a10->mipi_clock_tx_speed = clock_lane_tx_speed;
> +	else
> +		dev_warn(dev, "failed to get mipi tx speed, using default\n");

> +	/* Get system clock (eclk) */
> +	ov02a10->eclk = devm_clk_get(dev, "eclk");
> +	if (IS_ERR(ov02a10->eclk)) {
> +		dev_err(dev, "failed to get eclk\n");

> +		return -EINVAL;

Why shadow error code?

> +	}

> +	ov02a10->pd_gpio = devm_gpiod_get(dev, "powerdown", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ov02a10->pd_gpio)) {
> +		dev_err(dev, "failed to get powerdown-gpios\n");

> +		return -EINVAL;

Ditto.

> +	}

> +	ov02a10->n_rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ov02a10->n_rst_gpio)) {
> +		dev_err(dev, "failed to get reset-gpios\n");

> +		return -EINVAL;

Ditto.

> +	}

> +}

-- 
With Best Regards,
Andy Shevchenko


