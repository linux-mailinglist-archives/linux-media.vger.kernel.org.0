Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90E343808E8
	for <lists+linux-media@lfdr.de>; Fri, 14 May 2021 13:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbhENLwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 May 2021 07:52:21 -0400
Received: from mga09.intel.com ([134.134.136.24]:63201 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229445AbhENLwU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 May 2021 07:52:20 -0400
IronPort-SDR: SoNGWOdsW3mMssEc5jZqatOGNDD1k912L9vBJUieh38k6QsCJ5C+/VDol5mUN3ZbBiHvLD6Juh
 hKzXAS3FTy3w==
X-IronPort-AV: E=McAfee;i="6200,9189,9983"; a="200214620"
X-IronPort-AV: E=Sophos;i="5.82,299,1613462400"; 
   d="scan'208";a="200214620"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2021 04:51:07 -0700
IronPort-SDR: 5TnQW4EWiEKIo7ubH3OCvuHpmTsRjkMqb0dYevrwtdIoLl75JfkCPguHc7xs2GVoeqsO61OOFN
 rBmc5mbg0iUQ==
X-IronPort-AV: E=Sophos;i="5.82,299,1613462400"; 
   d="scan'208";a="627114901"
Received: from mkrastex-mobl.ger.corp.intel.com (HELO mkrastexMOBL) ([10.104.84.2])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2021 04:51:05 -0700
From:   "Martina Krasteva" <martinax.krasteva@linux.intel.com>
To:     "'Sakari Ailus'" <sakari.ailus@linux.intel.com>
Cc:     <linux-media@vger.kernel.org>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <daniele.alessandrelli@linux.intel.com>,
        <paul.j.murphy@linux.intel.com>,
        <gjorgjix.rosikopulos@linux.intel.com>
References: <20210330142023.141-1-martinax.krasteva@linux.intel.com> <20210330142023.141-3-martinax.krasteva@linux.intel.com> <20210429215150.GA3@paasikivi.fi.intel.com>
In-Reply-To: <20210429215150.GA3@paasikivi.fi.intel.com>
Subject: RE: [PATCH 2/6] media: i2c: Add imx335 camera sensor driver
Date:   Fri, 14 May 2021 12:50:48 +0100
Message-ID: <000001d748b7$6ce65b50$46b311f0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQMGgl+zuelOrAO8/f9lWDH85rRoUgGmaB/RAz0eolGoXUuZEA==
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for your review. I will address both your and Rob's comments.

I have a question regarding the switch from pm_runtime_get_sync() to pm_runtime_resume_and_get()
In my understanding get_sync() is fine to use in case the error handling is correct, but for convenience resume_and_get() is
recommended.
So should I do this change in my drivers as well? 

Best Regards,
Martina

> 
> Hi Martina,
> 
> Thanks for the a of new drivers. Also my apologies for reviewing them so
> late.
> 
> On Tue, Mar 30, 2021 at 03:20:19PM +0100, Martina Krasteva wrote:
> 
> ...
> > +static int imx335_probe(struct i2c_client *client)
> > +{
> > +	struct imx335 *imx335;
> > +	int ret;
> > +
> > +	imx335 = devm_kzalloc(&client->dev, sizeof(*imx335), GFP_KERNEL);
> > +	if (!imx335)
> > +		return -ENOMEM;
> > +
> > +	imx335->dev = &client->dev;
> > +
> > +	/* Initialize subdev */
> > +	v4l2_i2c_subdev_init(&imx335->sd, client, &imx335_subdev_ops);
> > +
> > +	ret = imx335_parse_hw_config(imx335);
> > +	if (ret) {
> > +		dev_err(imx335->dev, "HW configuration is not supported");
> > +		return ret;
> > +	}
> > +
> > +	mutex_init(&imx335->mutex);
> > +
> > +	ret = imx335_power_on(imx335->dev);
> > +	if (ret) {
> > +		dev_err(imx335->dev, "failed to power-on the sensor");
> > +		goto error_mutex_destroy;
> > +	}
> > +
> > +	/* Check module identity */
> > +	ret = imx335_detect(imx335);
> > +	if (ret) {
> > +		dev_err(imx335->dev, "failed to find sensor: %d", ret);
> > +		goto error_power_off;
> > +	}
> > +
> > +	/* Set default mode to max resolution */
> > +	imx335->cur_mode = &supported_mode;
> > +	imx335->vblank = imx335->cur_mode->vblank;
> > +
> > +	ret = imx335_init_controls(imx335);
> > +	if (ret) {
> > +		dev_err(imx335->dev, "failed to init controls: %d", ret);
> > +		goto error_power_off;
> > +	}
> > +
> > +	/* Initialize subdev */
> > +	imx335->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	imx335->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +	/* Initialize source pad */
> > +	imx335->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +	ret = media_entity_pads_init(&imx335->sd.entity, 1, &imx335->pad);
> > +	if (ret) {
> > +		dev_err(imx335->dev, "failed to init entity pads: %d", ret);
> > +		goto error_handler_free;
> > +	}
> > +
> > +	ret = v4l2_async_register_subdev_sensor_common(&imx335->sd);
> > +	if (ret < 0) {
> > +		dev_err(imx335->dev,
> > +			"failed to register async subdev: %d", ret);
> > +		goto error_media_entity;
> > +	}
> > +
> > +	pm_runtime_set_active(imx335->dev);
> > +	pm_runtime_enable(imx335->dev);
> > +	pm_runtime_idle(imx335->dev);
> > +
> > +	return 0;
> > +
> > +error_media_entity:
> > +	media_entity_cleanup(&imx335->sd.entity);
> > +error_handler_free:
> > +	v4l2_ctrl_handler_free(imx335->sd.ctrl_handler);
> > +error_power_off:
> > +	imx335_power_off(imx335->dev);
> > +error_mutex_destroy:
> > +	mutex_destroy(&imx335->mutex);
> > +
> > +	return ret;
> > +}
> > +
> > +/**
> > + * imx335_remove() - I2C client device unbinding
> > + * @client: pointer to I2C client device
> > + *
> > + * Return: 0 if successful, error code otherwise.
> > + */
> > +static int imx335_remove(struct i2c_client *client)
> > +{
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct imx335 *imx335 = to_imx335(sd);
> > +
> > +	v4l2_async_unregister_subdev(sd);
> > +	media_entity_cleanup(&sd->entity);
> > +	v4l2_ctrl_handler_free(sd->ctrl_handler);
> > +
> > +	pm_runtime_disable(&client->dev);
> > +	pm_runtime_suspended(&client->dev);
> 
> The sensor will be powered off here only if runtime PM is enabled.
> 
> Could you use pm_runtime_status_suspended() to check whether the device is
> still powered on, as e.g. the CCS driver (drivers/media/i2c/ccs/ccs-core.c)
> does?
> 
> I think I'll merge these when this and Rob's comments have been addressed.
> 
> > +
> > +	mutex_destroy(&imx335->mutex);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct dev_pm_ops imx335_pm_ops = {
> > +	SET_RUNTIME_PM_OPS(imx335_power_off, imx335_power_on, NULL)
> > +};
> > +
> > +static const struct of_device_id imx335_of_match[] = {
> > +	{ .compatible = "sony,imx335" },
> > +	{ }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, imx335_of_match);
> > +
> > +static struct i2c_driver imx335_driver = {
> > +	.probe_new = imx335_probe,
> > +	.remove = imx335_remove,
> > +	.driver = {
> > +		.name = "imx335",
> > +		.pm = &imx335_pm_ops,
> > +		.of_match_table = imx335_of_match,
> > +	},
> > +};
> > +
> > +module_i2c_driver(imx335_driver);
> > +
> > +MODULE_DESCRIPTION("Sony imx335 sensor driver");
> > +MODULE_LICENSE("GPL");
> 
> --
> Kind regards,
> 
> Sakari Ailus

