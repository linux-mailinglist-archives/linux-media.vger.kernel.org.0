Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 788C936F251
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 23:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234631AbhD2VxV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 17:53:21 -0400
Received: from mga09.intel.com ([134.134.136.24]:58865 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232441AbhD2VxU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 17:53:20 -0400
IronPort-SDR: GeosTOk14O0h+EkRSOTyPhoavMjN0cBiTX4f7+K5KTVdjqwkcQqrxXS+XPc1QUyLK8x7f/1AzU
 IT8aZVL78QwQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="197224489"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; 
   d="scan'208";a="197224489"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2021 14:52:25 -0700
IronPort-SDR: 46V0asdCDALhPllsOsHbz05WtwjuoFslPyG8AhGxHPrmVFYAGVcUrKTnGC19t17ztSxD4OPxam
 i5GS7KDHP5RQ==
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; 
   d="scan'208";a="466516486"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2021 14:52:22 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 460F7201A6;
        Fri, 30 Apr 2021 00:51:50 +0300 (EEST)
Date:   Fri, 30 Apr 2021 00:51:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com, gjorgjix.rosikopulos@linux.intel.com
Subject: Re: [PATCH 2/6] media: i2c: Add imx335 camera sensor driver
Message-ID: <20210429215150.GA3@paasikivi.fi.intel.com>
References: <20210330142023.141-1-martinax.krasteva@linux.intel.com>
 <20210330142023.141-3-martinax.krasteva@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330142023.141-3-martinax.krasteva@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martina,

Thanks for the a of new drivers. Also my apologies for reviewing them so
late.

On Tue, Mar 30, 2021 at 03:20:19PM +0100, Martina Krasteva wrote:

...
> +static int imx335_probe(struct i2c_client *client)
> +{
> +	struct imx335 *imx335;
> +	int ret;
> +
> +	imx335 = devm_kzalloc(&client->dev, sizeof(*imx335), GFP_KERNEL);
> +	if (!imx335)
> +		return -ENOMEM;
> +
> +	imx335->dev = &client->dev;
> +
> +	/* Initialize subdev */
> +	v4l2_i2c_subdev_init(&imx335->sd, client, &imx335_subdev_ops);
> +
> +	ret = imx335_parse_hw_config(imx335);
> +	if (ret) {
> +		dev_err(imx335->dev, "HW configuration is not supported");
> +		return ret;
> +	}
> +
> +	mutex_init(&imx335->mutex);
> +
> +	ret = imx335_power_on(imx335->dev);
> +	if (ret) {
> +		dev_err(imx335->dev, "failed to power-on the sensor");
> +		goto error_mutex_destroy;
> +	}
> +
> +	/* Check module identity */
> +	ret = imx335_detect(imx335);
> +	if (ret) {
> +		dev_err(imx335->dev, "failed to find sensor: %d", ret);
> +		goto error_power_off;
> +	}
> +
> +	/* Set default mode to max resolution */
> +	imx335->cur_mode = &supported_mode;
> +	imx335->vblank = imx335->cur_mode->vblank;
> +
> +	ret = imx335_init_controls(imx335);
> +	if (ret) {
> +		dev_err(imx335->dev, "failed to init controls: %d", ret);
> +		goto error_power_off;
> +	}
> +
> +	/* Initialize subdev */
> +	imx335->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	imx335->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	/* Initialize source pad */
> +	imx335->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&imx335->sd.entity, 1, &imx335->pad);
> +	if (ret) {
> +		dev_err(imx335->dev, "failed to init entity pads: %d", ret);
> +		goto error_handler_free;
> +	}
> +
> +	ret = v4l2_async_register_subdev_sensor_common(&imx335->sd);
> +	if (ret < 0) {
> +		dev_err(imx335->dev,
> +			"failed to register async subdev: %d", ret);
> +		goto error_media_entity;
> +	}
> +
> +	pm_runtime_set_active(imx335->dev);
> +	pm_runtime_enable(imx335->dev);
> +	pm_runtime_idle(imx335->dev);
> +
> +	return 0;
> +
> +error_media_entity:
> +	media_entity_cleanup(&imx335->sd.entity);
> +error_handler_free:
> +	v4l2_ctrl_handler_free(imx335->sd.ctrl_handler);
> +error_power_off:
> +	imx335_power_off(imx335->dev);
> +error_mutex_destroy:
> +	mutex_destroy(&imx335->mutex);
> +
> +	return ret;
> +}
> +
> +/**
> + * imx335_remove() - I2C client device unbinding
> + * @client: pointer to I2C client device
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx335_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx335 *imx335 = to_imx335(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(sd->ctrl_handler);
> +
> +	pm_runtime_disable(&client->dev);
> +	pm_runtime_suspended(&client->dev);

The sensor will be powered off here only if runtime PM is enabled.

Could you use pm_runtime_status_suspended() to check whether the device is
still powered on, as e.g. the CCS driver (drivers/media/i2c/ccs/ccs-core.c)
does?

I think I'll merge these when this and Rob's comments have been addressed.

> +
> +	mutex_destroy(&imx335->mutex);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops imx335_pm_ops = {
> +	SET_RUNTIME_PM_OPS(imx335_power_off, imx335_power_on, NULL)
> +};
> +
> +static const struct of_device_id imx335_of_match[] = {
> +	{ .compatible = "sony,imx335" },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, imx335_of_match);
> +
> +static struct i2c_driver imx335_driver = {
> +	.probe_new = imx335_probe,
> +	.remove = imx335_remove,
> +	.driver = {
> +		.name = "imx335",
> +		.pm = &imx335_pm_ops,
> +		.of_match_table = imx335_of_match,
> +	},
> +};
> +
> +module_i2c_driver(imx335_driver);
> +
> +MODULE_DESCRIPTION("Sony imx335 sensor driver");
> +MODULE_LICENSE("GPL");

-- 
Kind regards,

Sakari Ailus
