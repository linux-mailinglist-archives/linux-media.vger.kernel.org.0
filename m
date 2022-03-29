Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95A4F4EAA95
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 11:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbiC2Jcw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 05:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234748AbiC2Jcs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 05:32:48 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F91123422
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 02:30:58 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 00DAD60010;
        Tue, 29 Mar 2022 09:30:52 +0000 (UTC)
Date:   Tue, 29 Mar 2022 11:30:51 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
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
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3] media: ov5640: Use runtime PM
Message-ID: <20220329093051.zjqoaxp5gla5hjoo@uno.localdomain>
References: <20220329075737.3051924-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220329075737.3051924-1-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul.

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

nit: the comment can now be changed with

        s/right after power-up/at start streaming time/

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

I think now s_stream could probably simplified, it now goes as

        if (enable) {
                pm_runtime_resume_and_get();
                ...
        }

        if (sensor->streaming != enable) {

                if (enable && sensor->pending_mode)
                        set_mode()

                if (enable && sensor->pending_fmt)
                        set_mode()

                if (csi)
                        set_stream_mipi(enable);
                else
                        set_stream_dvp(enable)

                sensor->streaming = enable;
        }

        if (!enable || ret)
                pm_runtime_put();


Feels like it might be much easier if

        if (!enable) {
                if (csi)
                        set_stream_mipi(false)
                else
                        set_stream_dvp(false);

                pm_runtime_put();

                return 0;
        }

        pm_runtime_resume_and_get();

        v4l2_ctrl_handler_setup();

        if (sensor->pending_mode)
                set_mode()
        if (sensor->pending_fmt)
                set_fmt()

        if (csi)
                set_stream_mipi(true)
        else
                set_stream_mipi(true)

        return 0;

It can be done on top of course.

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
>  	}
>
> -power_off:
> -	ov5640_set_power_off(sensor);
>  	return ret;
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

As you know depend on PM, and you cann runtime_get() below, is
manually enabling power required here ?

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

Having no idle callback I think you should use suspend ?
And probably before disabling runtime_pm too ?


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

Same suggestion

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
> --
> 2.30.2
>
