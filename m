Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6627E4DE3FE
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 23:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241280AbiCRWaE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 18:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbiCRWaC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 18:30:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846DF15DAA1
        for <linux-media@vger.kernel.org>; Fri, 18 Mar 2022 15:28:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70C3DEE;
        Fri, 18 Mar 2022 23:28:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647642520;
        bh=CZm9+KtCqRzF82evfswF9p7licExG5jJRZf2RhXfK3s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YyurKF3zKxlDh70ZI5q7Rac6fP7KxULpU/J3QRRLi47XlY1fWyX+bDb1nGsYr8IuE
         pYG3gLqx6aKAHY0EGD/Y0papT/bIcesyfxRnXr8jl/RiBhaDbhwXu76hOunIco1Kf1
         PfUdSquP0zZj5TPd97QqNBdvGJ7sRCktkLe6ha0c=
Date:   Sat, 19 Mar 2022 00:28:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Shawn Tu <shawnx.tu@intel.com>, Arec Kao <arec.kao@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Martin Kepplinger <martink@posteo.de>,
        Daniel Scally <djrscally@gmail.com>,
        Jacopo Mondi <jmondi@jmondi.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: ov5640: Use runtime PM
Message-ID: <YjUHhp0lYqQG5rgs@pendragon.ideasonboard.com>
References: <20220311111259.3220718-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220311111259.3220718-1-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Thank you for the patch.

On Fri, Mar 11, 2022 at 08:12:59PM +0900, Paul Elder wrote:
> Switch to using runtime PM for power management.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> 
> ---
> Changes in v2:
> - replace manual tracking of power status with pm_runtime_get_if_in_use
> - power on the sensor before reading the checking the chip id
> - add dependency on PM to Kconfig
> ---
>  drivers/media/i2c/Kconfig  |   1 +
>  drivers/media/i2c/ov5640.c | 112 ++++++++++++++++++++++---------------
>  2 files changed, 67 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index e7194c1be4d2..97c3611d9304 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1025,6 +1025,7 @@ config VIDEO_OV5640
>  	tristate "OmniVision OV5640 sensor support"
>  	depends on OF
>  	depends on GPIOLIB && VIDEO_V4L2 && I2C
> +	depends on PM
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select V4L2_FWNODE
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 4de83d0ef85d..454ffd3c6d59 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -15,6 +15,7 @@
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> @@ -445,8 +446,6 @@ struct ov5640_dev {
>  	/* lock to protect all members below */
>  	struct mutex lock;
>  
> -	int power_count;
> -
>  	struct v4l2_mbus_framefmt fmt;
>  	bool pending_fmt_change;
>  
> @@ -2693,37 +2692,6 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
>  
>  /* --------------- Subdev Operations --------------- */
>  
> -static int ov5640_s_power(struct v4l2_subdev *sd, int on)
> -{
> -	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> -	int ret = 0;
> -
> -	mutex_lock(&sensor->lock);
> -
> -	/*
> -	 * If the power count is modified from 0 to != 0 or from != 0 to 0,
> -	 * update the power state.
> -	 */
> -	if (sensor->power_count == !on) {
> -		ret = ov5640_set_power(sensor, !!on);
> -		if (ret)
> -			goto out;
> -	}
> -
> -	/* Update the power count. */
> -	sensor->power_count += on ? 1 : -1;
> -	WARN_ON(sensor->power_count < 0);
> -out:
> -	mutex_unlock(&sensor->lock);
> -
> -	if (on && !ret && sensor->power_count == 1) {
> -		/* restore controls */
> -		ret = v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> -	}
> -
> -	return ret;
> -}
> -
>  static int ov5640_try_frame_interval(struct ov5640_dev *sensor,
>  				     struct v4l2_fract *fi,
>  				     u32 width, u32 height)
> @@ -3288,6 +3256,9 @@ static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>  
>  	/* v4l2_ctrl_lock() locks our own mutex */
>  
> +	if (!pm_runtime_get_if_in_use(&sensor->i2c_client->dev))
> +		return 0;

I'm afraid this won't work as intended :-S This function is called by
v4l2_ctrl_handler_setup(), itself called from ov5640_sensor_resume(). At
that point, runtime PM isn't flagged as in use yet, we're still in the
process of resuming.

There are a few ways around this. The simplest one may be to move the
v4l2_ctrl_handler_setup() call from ov5640_sensor_resume() to
ov5640_s_stream(). Sakari, any opinion ?

> +
>  	switch (ctrl->id) {
>  	case V4L2_CID_AUTOGAIN:
>  		val = ov5640_get_gain(sensor);
> @@ -3303,6 +3274,8 @@ static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> +	pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
> +
>  	return 0;
>  }
>  
> @@ -3334,7 +3307,7 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>  	 * not apply any controls to H/W at this time. Instead
>  	 * the controls will be restored right after power-up.
>  	 */
> -	if (sensor->power_count == 0)
> +	if (!pm_runtime_get_if_in_use(&sensor->i2c_client->dev))
>  		return 0;
>  
>  	switch (ctrl->id) {
> @@ -3376,6 +3349,8 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> +	pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
> +
>  	return ret;
>  }
>  
> @@ -3657,6 +3632,12 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>  	int ret = 0;
>  
> +	if (enable) {
> +		ret = pm_runtime_resume_and_get(&sensor->i2c_client->dev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	mutex_lock(&sensor->lock);
>  
>  	if (sensor->streaming == !enable) {
> @@ -3681,8 +3662,13 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>  		if (!ret)
>  			sensor->streaming = enable;
>  	}
> +
>  out:
>  	mutex_unlock(&sensor->lock);
> +
> +	if (!enable || ret)
> +		pm_runtime_put(&sensor->i2c_client->dev);
> +
>  	return ret;
>  }
>  
> @@ -3704,7 +3690,6 @@ static int ov5640_init_cfg(struct v4l2_subdev *sd,
>  }
>  
>  static const struct v4l2_subdev_core_ops ov5640_core_ops = {
> -	.s_power = ov5640_s_power,
>  	.log_status = v4l2_ctrl_subdev_log_status,
>  	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>  	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> @@ -3750,15 +3735,11 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
>  	int ret = 0;
>  	u16 chip_id;
>  
> -	ret = ov5640_set_power_on(sensor);
> -	if (ret)
> -		return ret;
> -
>  	ret = ov5640_read_reg16(sensor, OV5640_REG_CHIP_ID, &chip_id);
>  	if (ret) {
>  		dev_err(&client->dev, "%s: failed to read chip identifier\n",
>  			__func__);
> -		goto power_off;
> +		return ret;
>  	}
>  
>  	if (chip_id != 0x5640) {
> @@ -3767,8 +3748,6 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
>  		ret = -ENXIO;
>  	}
>  
> -power_off:
> -	ov5640_set_power_off(sensor);
>  	return ret;
>  }
>  
> @@ -3863,20 +3842,35 @@ static int ov5640_probe(struct i2c_client *client)
>  
>  	mutex_init(&sensor->lock);
>  
> -	ret = ov5640_check_chip_id(sensor);
> +	ret = ov5640_init_controls(sensor);
>  	if (ret)
>  		goto entity_cleanup;
>  
> -	ret = ov5640_init_controls(sensor);
> +	ret = ov5640_set_power(sensor, true);
>  	if (ret)
> -		goto entity_cleanup;
> +		goto free_ctrls;
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_get(dev);
> +
> +	ret = ov5640_check_chip_id(sensor);
> +	if (ret)
> +		goto err_pm_runtime;
>  
>  	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
>  	if (ret)
> -		goto free_ctrls;
> +		goto err_pm_runtime;
> +
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_put_autosuspend(dev);
>  
>  	return 0;
>  
> +err_pm_runtime:
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);
>  free_ctrls:
>  	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>  entity_cleanup:
> @@ -3898,6 +3892,31 @@ static int ov5640_remove(struct i2c_client *client)
>  	return 0;
>  }
>  
> +static int __maybe_unused ov5640_sensor_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov5640_dev *ov5640 = to_ov5640_dev(sd);
> +
> +	return ov5640_set_power(ov5640, false);
> +}
> +
> +static int __maybe_unused ov5640_sensor_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov5640_dev *ov5640 = to_ov5640_dev(sd);
> +	int ret;
> +
> +	ret = ov5640_set_power(ov5640, true);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_ctrl_handler_setup(&ov5640->ctrls.handler);
> +}
> +
> +static const struct dev_pm_ops ov5640_pm_ops = {
> +	SET_RUNTIME_PM_OPS(ov5640_sensor_suspend, ov5640_sensor_resume, NULL)
> +};
> +
>  static const struct i2c_device_id ov5640_id[] = {
>  	{"ov5640", 0},
>  	{},
> @@ -3914,6 +3933,7 @@ static struct i2c_driver ov5640_i2c_driver = {
>  	.driver = {
>  		.name  = "ov5640",
>  		.of_match_table	= ov5640_dt_ids,
> +		.pm = &ov5640_pm_ops,
>  	},
>  	.id_table = ov5640_id,
>  	.probe_new = ov5640_probe,

-- 
Regards,

Laurent Pinchart
