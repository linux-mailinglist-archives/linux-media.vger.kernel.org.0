Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B57614058F
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2020 09:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729530AbgAQIkB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jan 2020 03:40:01 -0500
Received: from retiisi.org.uk ([95.216.213.190]:60810 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729255AbgAQIkB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jan 2020 03:40:01 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 725CC634C8A;
        Fri, 17 Jan 2020 10:39:50 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1isNAV-0000Q9-4v; Fri, 17 Jan 2020 10:39:51 +0200
Date:   Fri, 17 Jan 2020 10:39:51 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        peter.griffin@linaro.org, ezequiel@collabora.com,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 2/2] media: i2c: Add driver for Sony IMX219 sensor
Message-ID: <20200117083951.GF793@valkosipuli.retiisi.org.uk>
References: <20191227122114.23075-1-andrey.konovalov@linaro.org>
 <20191227122114.23075-3-andrey.konovalov@linaro.org>
 <20191227145547.GE861@valkosipuli.retiisi.org.uk>
 <d3f1591b-1a98-e876-b977-96e1210e9c49@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3f1591b-1a98-e876-b977-96e1210e9c49@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey,

On Mon, Jan 13, 2020 at 10:16:21PM +0300, Andrey Konovalov wrote:
> Hi Sakari,
> 
> Sorry for delayed reply..
> (your email got into a wrong folder, and I might not find it there if Ezequiel
> did not warn me that I didn't address the comments from your review)

No worries.

> 
> On 27.12.2019 17:55, Sakari Ailus wrote:
> > Hi Andrey,
> > 
> > On Fri, Dec 27, 2019 at 03:21:14PM +0300, Andrey Konovalov wrote:
> > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > 
> > > Adds a driver for the 8MPix Sony IMX219 CSI2 sensor.
> > > Whilst the sensor supports 2 or 4 CSI2 data lanes, this driver
> > > currently only supports 2 lanes.
> > > 8MPix @ 15fps, 1080P @ 30fps (cropped FOV), and 1640x1232 (2x2 binned)
> > > @ 30fps are currently supported.
> > > 
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> > > ---
> > >   drivers/media/i2c/Kconfig  |   12 +
> > >   drivers/media/i2c/Makefile |    1 +
> > >   drivers/media/i2c/imx219.c | 1240 ++++++++++++++++++++++++++++++++++++
> > >   3 files changed, 1253 insertions(+)
> > >   create mode 100644 drivers/media/i2c/imx219.c
> 
> <snip>
> 
> > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > new file mode 100644
> > > index 000000000000..28b55c61cd77
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/imx219.c
> 
> <snip>
> 
> > > +/* Power/clock management functions */
> > > +static int imx219_power_on(struct device *dev)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct imx219 *imx219 = to_imx219(sd);
> > > +	int ret;
> > > +
> > > +	ret = regulator_bulk_enable(IMX219_NUM_SUPPLIES,
> > > +				    imx219->supplies);
> > > +	if (ret) {
> > > +		dev_err(&client->dev, "%s: failed to enable regulators\n",
> > > +			__func__);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = clk_prepare_enable(imx219->xclk);
> > > +	if (ret) {
> > > +		dev_err(&client->dev, "%s: failed to enable clock\n",
> > > +			__func__);
> > > +		goto reg_off;
> > > +	}
> > > +
> > > +	gpiod_set_value_cansleep(imx219->xclr_gpio, 1);
> > > +	msleep(IMX219_XCLR_DELAY_MS);
> > 
> > I guess 10 ms is ok albeit it'd be nicer if you calculated the required
> > delay instead.
> 
> I think this 10 ms delay actually serves two purposes here. It is
> not only the delay after XCLR pin is set high (reset de-asserted),
> but it also lets the camera power supplies voltages to settle after
> regulator_bulk_enable() called few lines above.
> 
> So I would make the delay a sum of 1) the value which depends on
> input clock frequency (the driver currently supports 24MHz only)
> and 2) a fixed value of 8 ms or so to account for the power supplies
> settle time. So that the sum would be the same 10 ms for 24MHz input
> clock.
> Does it makes sense?

It does, agreed.

> 
> <snip>
> 
> > > +static int imx219_probe(struct i2c_client *client,
> > > +			const struct i2c_device_id *id)
> > > +{
> > > +	struct device *dev = &client->dev;
> > > +	struct fwnode_handle *endpoint;
> > > +	struct imx219 *imx219;
> > > +	int ret;
> > > +
> > > +	imx219 = devm_kzalloc(&client->dev, sizeof(*imx219), GFP_KERNEL);
> > > +	if (!imx219)
> > > +		return -ENOMEM;
> > > +
> > > +	imx219->dev = dev;
> > 
> > Instead of putting a dev field to struct imx219, you can find the device in
> > struct i2c_client.dev, which you can get by:
> > 
> > 	v4l2_get_subdevdata(imx219->sd)
> > 
> > > +
> > > +	v4l2_i2c_subdev_init(&imx219->sd, client, &imx219_subdev_ops);
> > > +
> > > +	/* Get CSI2 bus config */
> > > +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> > > +						  NULL);
> > > +	if (!endpoint) {
> > > +		dev_err(dev, "endpoint node not found\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	ret = v4l2_fwnode_endpoint_parse(endpoint, &imx219->ep);
> > > +	fwnode_handle_put(endpoint);
> > > +	if (ret) {
> > > +		dev_err(dev, "Could not parse endpoint\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	/* Get system clock (xclk) */
> > > +	imx219->xclk = devm_clk_get(dev, "xclk");
> > > +	if (IS_ERR(imx219->xclk)) {
> > > +		dev_err(dev, "failed to get xclk\n");
> > > +		return PTR_ERR(imx219->xclk);
> > > +	}
> > > +
> > > +	imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > +	if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
> > > +		dev_err(dev, "xclk frequency not supported: %d Hz\n",
> > > +			imx219->xclk_freq);
> > > +		return -EINVAL;
> > > +	}
> > 
> > Could you also check the link frequencies (the link-frequencies property
> > that also should be added to DT bindings) matches with what is possible
> > with the given xclk frequency? Please see e.g. imx319 driver for an
> > example.
> 
> The driver only supports single xclk frequency and single link-frequency
> (hardcoded in the registers value tables). So the check will be more like
> the one in imx290 driver (error out if the link-frequency property isn't
> equal to the pre#define-d default value).

Right. The frequencies don't seem to be in DT bindings either; they should
be added there. The sensor supports multiple frequencies as in practice
every other sensor does.

The driver does not necessarily need to check for them if it supports a
single one only.

> 
> > > +
> > > +	ret = imx219_get_regulators(imx219);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* Request optional enable pin */
> > > +	imx219->xclr_gpio = devm_gpiod_get_optional(dev, "xclr",
> > > +						    GPIOD_OUT_HIGH);
> > > +
> > > +	/*
> > > +	 * The sensor must be powered for imx219_identify_module()
> > > +	 * to be able to read the CHIP_ID register
> > > +	 */
> > > +	ret = imx219_power_on(dev);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = imx219_identify_module(imx219);
> > > +	if (ret)
> > > +		goto error_power_off;
> > > +
> > > +	/* Set default mode to max resolution */
> > > +	imx219->mode = &supported_modes[0];
> > > +
> > > +	ret = imx219_init_controls(imx219);
> > > +	if (ret)
> > > +		goto error_power_off;
> > > +
> > > +	/* Initialize subdev */
> > > +	imx219->sd.internal_ops = &imx219_internal_ops;
> > > +	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > +	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > > +
> > > +	/* Initialize source pad */
> > > +	imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
> > > +
> > > +	ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
> > > +	if (ret)
> > > +		goto error_handler_free;
> > > +
> > > +	ret = v4l2_async_register_subdev_sensor_common(&imx219->sd);
> > > +	if (ret < 0)
> > > +		goto error_media_entity;
> > > +
> > > +	/* Enable runtime PM and turn off the device */
> > > +	pm_runtime_set_active(dev);
> > > +	pm_runtime_enable(dev);
> > > +	pm_runtime_idle(dev);
> > > +
> > > +	return 0;
> > > +
> > > +error_media_entity:
> > > +	media_entity_cleanup(&imx219->sd.entity);
> > > +
> > > +error_handler_free:
> > > +	imx219_free_controls(imx219);
> > > +
> > > +error_power_off:
> > > +	imx219_power_off(dev);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int imx219_remove(struct i2c_client *client)
> > > +{
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct imx219 *imx219 = to_imx219(sd);
> > > +
> > > +	v4l2_async_unregister_subdev(sd);
> > > +	media_entity_cleanup(&sd->entity);
> > > +	imx219_free_controls(imx219);
> > > +
> > > +	pm_runtime_disable(&client->dev);
> > > +	pm_runtime_set_suspended(&client->dev);
> > 
> > imx219_power_off(), if the sensor is powered on here. Please see e.g. the
> > smiapp driver regarding this.
> 
> It should be powered off here.
> 
> The sensor is powered on when streaming is started, and is powered off when
> it is stopped: if the enable argument is false, imx219_set_stream() calls
> pm_runtime_put().
> IOW, it follows the imx319 driver as the example of power management.

Well, yes, or rather maybe.

If you have a non-ACPI system and runtime PM is disabled, then the sensor
is powered on here.

The imx319 driver only works on ACPI based systems so it's not something
you can compare to directly. Check e.g. the smiapp driver which works on
both DT and ACPI systems.

> 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct of_device_id imx219_dt_ids[] = {
> > > +	{ .compatible = "sony,imx219" },
> > > +	{ /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, imx219_dt_ids);
> > > +
> > > +static const struct dev_pm_ops imx219_pm_ops = {
> > > +	SET_SYSTEM_SLEEP_PM_OPS(imx219_suspend, imx219_resume)
> > > +	SET_RUNTIME_PM_OPS(imx219_power_off, imx219_power_on, NULL)
> > > +};
> > > +
> > > +static struct i2c_driver imx219_i2c_driver = {
> > > +	.driver = {
> > > +		.name = "imx219",
> > > +		.of_match_table	= imx219_dt_ids,
> > > +		.pm = &imx219_pm_ops,
> > > +	},
> > > +	.probe = imx219_probe,
> > 
> > Could you use .probe_new, and remove the i2c_device_id argument?
> 
> I'll fix this and all the other issues I didn't comment on in this email
> in the v4 of the patch set.

Thanks!

-- 
Kind regards,

Sakari Ailus
