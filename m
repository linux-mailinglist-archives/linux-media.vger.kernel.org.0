Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B69F512D206
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2019 17:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbfL3QdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Dec 2019 11:33:20 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38404 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfL3QdU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Dec 2019 11:33:20 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D5E4C28DAE0
Message-ID: <5be4728254c820bfaf99f385dc7b7ecb4f65d795.camel@collabora.com>
Subject: Re: [PATCH v2 2/2] media: i2c: Add driver for Sony IMX219 sensor
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>, mchehab@kernel.org,
        robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        peter.griffin@linaro.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 30 Dec 2019 13:33:07 -0300
In-Reply-To: <20191227122114.23075-3-andrey.konovalov@linaro.org>
References: <20191227122114.23075-1-andrey.konovalov@linaro.org>
         <20191227122114.23075-3-andrey.konovalov@linaro.org>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2019-12-27 at 15:21 +0300, Andrey Konovalov wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Adds a driver for the 8MPix Sony IMX219 CSI2 sensor.
> Whilst the sensor supports 2 or 4 CSI2 data lanes, this driver
> currently only supports 2 lanes.
> 8MPix @ 15fps, 1080P @ 30fps (cropped FOV), and 1640x1232 (2x2 binned)
> @ 30fps are currently supported.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  drivers/media/i2c/Kconfig  |   12 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/imx219.c | 1240 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1253 insertions(+)
>  create mode 100644 drivers/media/i2c/imx219.c
> 
> 
[..]
> +
> +static int imx219_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct fwnode_handle *endpoint;
> +	struct imx219 *imx219;
> +	int ret;
> +
> +	imx219 = devm_kzalloc(&client->dev, sizeof(*imx219), GFP_KERNEL);
> +	if (!imx219)
> +		return -ENOMEM;
> +
> +	imx219->dev = dev;
> +
> +	v4l2_i2c_subdev_init(&imx219->sd, client, &imx219_subdev_ops);
> +
> +	/* Get CSI2 bus config */
> +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> +						  NULL);
> +	if (!endpoint) {
> +		dev_err(dev, "endpoint node not found\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = v4l2_fwnode_endpoint_parse(endpoint, &imx219->ep);
> +	fwnode_handle_put(endpoint);
> +	if (ret) {
> +		dev_err(dev, "Could not parse endpoint\n");
> +		return ret;
> +	}
> +
> +	/* Get system clock (xclk) */
> +	imx219->xclk = devm_clk_get(dev, "xclk");
> +	if (IS_ERR(imx219->xclk)) {
> +		dev_err(dev, "failed to get xclk\n");
> +		return PTR_ERR(imx219->xclk);
> +	}
> +
> +	imx219->xclk_freq = clk_get_rate(imx219->xclk);
> +	if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
> +		dev_err(dev, "xclk frequency not supported: %d Hz\n",
> +			imx219->xclk_freq);
> +		return -EINVAL;
> +	}
> +
> +	ret = imx219_get_regulators(imx219);
> +	if (ret)
> +		return ret;
> +

I think printing an error if you can't regulators
(as the core will stay silent), is a good idea.

Just got bitten by this while trying the driver with
a RPI camera module v2, and the RKISP1 patches that
we recently posted on this mailing list.

(did _very_ limited testing, but working nicely so far).

> +	/* Request optional enable pin */
> +	imx219->xclr_gpio = devm_gpiod_get_optional(dev, "xclr",
> +						    GPIOD_OUT_HIGH);
> +
> +	/*
> +	 * The sensor must be powered for imx219_identify_module()
> +	 * to be able to read the CHIP_ID register
> +	 */
> +	ret = imx219_power_on(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = imx219_identify_module(imx219);
> +	if (ret)
> +		goto error_power_off;
> +
> +	/* Set default mode to max resolution */
> +	imx219->mode = &supported_modes[0];
> +
> +	ret = imx219_init_controls(imx219);
> +	if (ret)
> +		goto error_power_off;
> +
> +	/* Initialize subdev */
> +	imx219->sd.internal_ops = &imx219_internal_ops;
> +	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	/* Initialize source pad */
> +	imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
> +	if (ret)
> +		goto error_handler_free;
> +
> +	ret = v4l2_async_register_subdev_sensor_common(&imx219->sd);
> +	if (ret < 0)
> +		goto error_media_entity;
> +

Ditto on these last two, it's possible to get silent
failures here, which are a bit annoying to debug.

Thanks,
Ezequiel

