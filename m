Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39CFE1EE138
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 11:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgFDJ00 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 05:26:26 -0400
Received: from mga02.intel.com ([134.134.136.20]:29530 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726444AbgFDJ0Z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 05:26:25 -0400
IronPort-SDR: 4sZ/FVOfvZ6LGBAKoE00XPVc546n01l/sEZZlbX0KtFjX+BGHHI025QDQg0jJwWVJzWD5RHw0o
 WH9R3ajpBl1g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 02:26:23 -0700
IronPort-SDR: iLMKRTyDd8MVlIqZB/DE1RmSK17qEEbhZRbs5822lFW5LgFqxmRaxZHWG0EQzqEY7MNrRM1Tfr
 irPv5g4QKiTQ==
X-IronPort-AV: E=Sophos;i="5.73,471,1583222400"; 
   d="scan'208";a="294269374"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 02:26:18 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id C931820859; Thu,  4 Jun 2020 12:26:16 +0300 (EEST)
Date:   Thu, 4 Jun 2020 12:26:16 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V9, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
Message-ID: <20200604092616.GJ16711@paasikivi.fi.intel.com>
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-3-dongchun.zhu@mediatek.com>
 <1591236845.8804.547.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591236845.8804.547.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Thu, Jun 04, 2020 at 10:14:05AM +0800, Dongchun Zhu wrote:
> Hi Tomasz, Sakari, and sirs,
> 
> Could anyone help to review this patch?
> 
> On Sat, 2020-05-23 at 16:41 +0800, Dongchun Zhu wrote:
> > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  MAINTAINERS                 |    1 +
> >  drivers/media/i2c/Kconfig   |   13 +
> >  drivers/media/i2c/Makefile  |    1 +
> >  drivers/media/i2c/ov02a10.c | 1025 +++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 1040 insertions(+)
> >  create mode 100644 drivers/media/i2c/ov02a10.c
> > 
> 
> [snip]
> 
> > +static int ov02a10_probe(struct i2c_client *client)
> > +{
> > +	struct device *dev = &client->dev;
> > +	struct ov02a10 *ov02a10;
> > +	unsigned int rotation;
> > +	unsigned int clock_lane_tx_speed;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	ov02a10 = devm_kzalloc(dev, sizeof(*ov02a10), GFP_KERNEL);
> > +	if (!ov02a10)
> > +		return -ENOMEM;
> > +
> > +	ret = ov02a10_check_hwcfg(dev, ov02a10);
> > +	if (ret) {
> > +		dev_err(dev, "failed to check HW configuration: %d", ret);
> > +		return ret;
> > +	}
> > +
> > +	v4l2_i2c_subdev_init(&ov02a10->subdev, client, &ov02a10_subdev_ops);
> > +	ov02a10->mipi_clock_tx_speed = OV02A10_MIPI_TX_SPEED_DEFAULT;
> > +	ov02a10->fmt.code = MEDIA_BUS_FMT_SBGGR10_1X10;
> > +
> > +	/* Optional indication of physical rotation of sensor */
> > +	ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);
> > +	if (!ret && rotation == 180) {
> > +		ov02a10->upside_down = true;
> > +		ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> > +	}
> > +
> > +	/* Optional indication of mipi TX speed */
> > +	ret = fwnode_property_read_u32(dev_fwnode(dev), "ovti,mipi-tx-speed",
> > +				       &clock_lane_tx_speed);
> > +
> > +	if (!ret)
> > +		ov02a10->mipi_clock_tx_speed = clock_lane_tx_speed;
> > +
> > +	/* Get system clock (eclk) */
> > +	ov02a10->eclk = devm_clk_get(dev, "eclk");
> > +	if (IS_ERR(ov02a10->eclk)) {
> > +		ret = PTR_ERR(ov02a10->eclk);
> > +		dev_err(dev, "failed to get eclk %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> > +				       &ov02a10->eclk_freq);
> > +	if (ret) {
> > +		dev_err(dev, "failed to get eclk frequency\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = clk_set_rate(ov02a10->eclk, ov02a10->eclk_freq);
> > +	if (ret) {
> > +		dev_err(dev, "failed to set eclk frequency (24MHz)\n");
> > +		return ret;
> > +	}
> > +
> > +	if (clk_get_rate(ov02a10->eclk) != OV02A10_ECLK_FREQ) {
> > +		dev_warn(dev, "wrong eclk frequency %d Hz, expected: %d Hz\n",
> > +			 ov02a10->eclk_freq, OV02A10_ECLK_FREQ);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ov02a10->pd_gpio = devm_gpiod_get(dev, "powerdown", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(ov02a10->pd_gpio)) {
> > +		ret = PTR_ERR(ov02a10->pd_gpio);
> > +		dev_err(dev, "failed to get powerdown-gpios %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ov02a10->n_rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > +	if (IS_ERR(ov02a10->n_rst_gpio)) {
> > +		ret = PTR_ERR(ov02a10->n_rst_gpio);
> > +		dev_err(dev, "failed to get reset-gpios %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	for (i = 0; i < ARRAY_SIZE(ov02a10_supply_names); i++)
> > +		ov02a10->supplies[i].supply = ov02a10_supply_names[i];
> > +
> > +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov02a10_supply_names),
> > +				      ov02a10->supplies);
> > +	if (ret) {
> > +		dev_err(dev, "failed to get regulators\n");
> > +		return ret;
> > +	}
> > +
> > +	mutex_init(&ov02a10->mutex);
> > +	ov02a10->cur_mode = &supported_modes[0];
> > +	ret = ov02a10_initialize_controls(ov02a10);
> > +	if (ret) {
> > +		dev_err(dev, "failed to initialize controls\n");
> > +		goto err_destroy_mutex;
> > +	}
> > +
> > +	ov02a10->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	ov02a10->subdev.entity.ops = &ov02a10_subdev_entity_ops;
> > +	ov02a10->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +	ov02a10->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +	ret = media_entity_pads_init(&ov02a10->subdev.entity, 1, &ov02a10->pad);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to init entity pads: %d", ret);
> > +		goto err_free_handler;
> > +	}
> > +
> > +	pm_runtime_enable(dev);
> > +	if (!pm_runtime_enabled(dev)) {
> > +		ret = ov02a10_power_on(dev);
> > +		if (ret < 0) {
> > +			dev_err(dev, "failed to power on: %d\n", ret);
> > +			goto err_free_handler;
> > +		}
> > +	}
> > +
> > +	ret = v4l2_async_register_subdev(&ov02a10->subdev);
> > +	if (ret) {
> > +		dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> > +		if (!pm_runtime_enabled(dev))
> > +			ov02a10_power_off(dev);

This should be moved to error handling section below.

> > +		goto err_clean_entity;
> > +	}
> 
> Tomasz, Sakari, is this ok?
> or coding like this:
> 
> ret = v4l2_async_register_subdev(&ov02a10->subdev);
> if (!pm_runtime_enabled(dev))
> 	ov02a10_power_off(dev);
> if (ret) {
> 	dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> 	goto err_clean_entity;
> }
> 
> What's your opinions about the change?

This turns power off if runtime PM is disabled. I'd keep it as-is, as it'd
require re-implementing what runtime PM is used for now --- and that's not
a sensor driver's job.

> 
> > +
> > +	return 0;
> > +
> > +err_clean_entity:
> > +	media_entity_cleanup(&ov02a10->subdev.entity);
> > +err_free_handler:
> > +	v4l2_ctrl_handler_free(ov02a10->subdev.ctrl_handler);
> > +err_destroy_mutex:
> > +	mutex_destroy(&ov02a10->mutex);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ov02a10_remove(struct i2c_client *client)
> > +{
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > +
> > +	v4l2_async_unregister_subdev(sd);
> > +	media_entity_cleanup(&sd->entity);
> > +	v4l2_ctrl_handler_free(sd->ctrl_handler);
> > +	pm_runtime_disable(&client->dev);
> > +	if (!pm_runtime_status_suspended(&client->dev))
> > +		ov02a10_power_off(&client->dev);
> > +	pm_runtime_set_suspended(&client->dev);
> > +	mutex_destroy(&ov02a10->mutex);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id ov02a10_of_match[] = {
> > +	{ .compatible = "ovti,ov02a10" },
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(of, ov02a10_of_match);
> > +
> > +static struct i2c_driver ov02a10_i2c_driver = {
> > +	.driver = {
> > +		.name = "ov02a10",
> > +		.pm = &ov02a10_pm_ops,
> > +		.of_match_table = ov02a10_of_match,
> > +	},
> > +	.probe_new	= &ov02a10_probe,
> > +	.remove		= &ov02a10_remove,
> > +};
> > +
> > +module_i2c_driver(ov02a10_i2c_driver);
> > +
> > +MODULE_AUTHOR("Dongchun Zhu <dongchun.zhu@mediatek.com>");
> > +MODULE_DESCRIPTION("OmniVision OV02A10 sensor driver");
> > +MODULE_LICENSE("GPL v2");
> > +
> 

-- 
Sakari Ailus
