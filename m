Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE5714EA9EB
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 10:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234340AbiC2I7i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 04:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231963AbiC2I7f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 04:59:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 850761BBF49
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 01:57:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 060D0F8;
        Tue, 29 Mar 2022 10:57:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648544270;
        bh=gKcVfRSOoLpcbG/arUygjQzaN1x6X0rPFv1ilE2Ctg4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XY0aRRMrZ+/SU5oQShoBffe9ZT6MX0WwvmW0+1ThAKj7/LCU3y2v7gEwSsFlyiTSk
         Xprtl1V6MmObFsjoneFlWNG5TQJd8GZmrSvwz03E9esZkkmRICQM/D5cvEy+E7rI9u
         P/uKI1WJYF+iSC7lSLLl0b5FURDd/3tyu+BntGB8=
Date:   Tue, 29 Mar 2022 11:57:46 +0300
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
        Jacopo Mondi <jacopo@jmondi.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3] media: ov5640: Use runtime PM
Message-ID: <YkLKCqOqtO+Trwv+@pendragon.ideasonboard.com>
References: <20220329075737.3051924-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220329075737.3051924-1-paul.elder@ideasonboard.com>
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

On Tue, Mar 29, 2022 at 04:57:37PM +0900, Paul Elder wrote:
> Switch to using runtime PM for power management.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
> Changes in v3:
> - Move v4l2_ctrl_handler_setup() from ov5640_sensor_resume to
>   ov5640_s_stream()
> 
> Changes in v2:
> - replace manual tracking of power status with pm_runtime_get_if_in_use
> - power on the sensor before reading the checking the chip id
> - add dependency on PM to Kconfig
> ---
>  drivers/media/i2c/Kconfig  |   1 +
>  drivers/media/i2c/ov5640.c | 117 ++++++++++++++++++++++---------------
>  2 files changed, 72 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 69c56e24a612..8a038337c679 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -976,6 +976,7 @@ config VIDEO_OV5640
>  	tristate "OmniVision OV5640 sensor support"
>  	depends on OF
>  	depends on GPIOLIB && VIDEO_V4L2 && I2C
> +	depends on PM
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select V4L2_FWNODE
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index ddbd71394db3..fe2aacc74cbb 100644
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
> @@ -240,8 +241,6 @@ struct ov5640_dev {
>  	/* lock to protect all members below */
>  	struct mutex lock;
>  
> -	int power_count;
> -
>  	struct v4l2_mbus_framefmt fmt;
>  	bool pending_fmt_change;
>  
> @@ -2157,37 +2156,6 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
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
> @@ -2663,6 +2631,9 @@ static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>  
>  	/* v4l2_ctrl_lock() locks our own mutex */
>  
> +	if (!pm_runtime_get_if_in_use(&sensor->i2c_client->dev))
> +		return 0;
> +
>  	switch (ctrl->id) {
>  	case V4L2_CID_AUTOGAIN:
>  		val = ov5640_get_gain(sensor);
> @@ -2678,6 +2649,8 @@ static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> +	pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
> +
>  	return 0;
>  }
>  
> @@ -2694,7 +2667,7 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>  	 * not apply any controls to H/W at this time. Instead
>  	 * the controls will be restored right after power-up.
>  	 */
> -	if (sensor->power_count == 0)
> +	if (!pm_runtime_get_if_in_use(&sensor->i2c_client->dev))
>  		return 0;
>  
>  	switch (ctrl->id) {
> @@ -2733,6 +2706,8 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> +	pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
> +
>  	return ret;
>  }
>  
> @@ -2945,6 +2920,18 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>  	int ret = 0;
>  
> +	if (enable) {
> +		ret = pm_runtime_resume_and_get(&sensor->i2c_client->dev);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> +		if (ret) {
> +			pm_runtime_put(&sensor->i2c_client->dev);
> +			return ret;
> +		}
> +	}
> +
>  	mutex_lock(&sensor->lock);
>  
>  	if (sensor->streaming == !enable) {
> @@ -2969,13 +2956,17 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>  		if (!ret)
>  			sensor->streaming = enable;
>  	}
> +
>  out:
>  	mutex_unlock(&sensor->lock);
> +
> +	if (!enable || ret)
> +		pm_runtime_put(&sensor->i2c_client->dev);

This should be pm_runtime_put_autosuspend().

> +
>  	return ret;
>  }
>  
>  static const struct v4l2_subdev_core_ops ov5640_core_ops = {
> -	.s_power = ov5640_s_power,
>  	.log_status = v4l2_ctrl_subdev_log_status,
>  	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>  	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> @@ -3019,15 +3010,11 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
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
> @@ -3036,8 +3023,6 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
>  		ret = -ENXIO;

You can return -ENXIO here.

>  	}
>  
> -power_off:
> -	ov5640_set_power_off(sensor);
>  	return ret;

And return 0 here.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  }
>  
> @@ -3158,20 +3143,35 @@ static int ov5640_probe(struct i2c_client *client)
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
> @@ -3184,6 +3184,10 @@ static int ov5640_remove(struct i2c_client *client)
>  {
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> +	struct device *dev = &client->dev;
> +
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);
>  
>  	v4l2_async_unregister_subdev(&sensor->sd);
>  	media_entity_cleanup(&sensor->sd.entity);
> @@ -3193,6 +3197,26 @@ static int ov5640_remove(struct i2c_client *client)
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
> +
> +	return ov5640_set_power(ov5640, true);
> +}
> +
> +static const struct dev_pm_ops ov5640_pm_ops = {
> +	SET_RUNTIME_PM_OPS(ov5640_sensor_suspend, ov5640_sensor_resume, NULL)
> +};
> +
>  static const struct i2c_device_id ov5640_id[] = {
>  	{"ov5640", 0},
>  	{},
> @@ -3209,6 +3233,7 @@ static struct i2c_driver ov5640_i2c_driver = {
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
