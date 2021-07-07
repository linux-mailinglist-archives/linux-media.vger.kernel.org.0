Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB693BF0CE
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 22:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232384AbhGGUkG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 16:40:06 -0400
Received: from mga07.intel.com ([134.134.136.100]:58887 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232238AbhGGUkF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Jul 2021 16:40:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="273221895"
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; 
   d="scan'208";a="273221895"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2021 13:37:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; 
   d="scan'208";a="411053186"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2021 13:37:20 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 5D1EB201A2;
        Wed,  7 Jul 2021 23:37:18 +0300 (EEST)
Date:   Wed, 7 Jul 2021 23:37:18 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Raag Jadav <raagjadav@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 01/11] media: ov5640: Use runtime PM to control sensor
 power
Message-ID: <20210707203718.GX3@paasikivi.fi.intel.com>
References: <20210624192200.22559-1-p.yadav@ti.com>
 <20210624192200.22559-2-p.yadav@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624192200.22559-2-p.yadav@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pratyush,

Thanks for the patch.

On Fri, Jun 25, 2021 at 12:51:50AM +0530, Pratyush Yadav wrote:
> Calling s_power subdev callback is discouraged. Instead, the subdevs
> should use runtime PM to control its power. Use runtime PM callbacks to
> control sensor power. The pm counter is incremented when the stream is
> started and decremented when the stream is stopped.
> 
> Refactor s_stream() a bit to make this new control flow easier. Add a
> helper to choose whether mipi or dvp set_stream needs to be called. The
> logic flow is also changed to make it a bit clearer.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> 
> ---
> 
> Changes in v3:
> - Clean up the logic in ov5640_s_stream() a bit.
> - Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync().
> - Rename the label error_pm to disable_pm.
> 
> Changes in v2:
> - New in v2.
> 
>  drivers/media/i2c/Kconfig  |   2 +-
>  drivers/media/i2c/ov5640.c | 127 +++++++++++++++++++++++--------------
>  2 files changed, 79 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 588f8eb95984..8f43a4d7bcc1 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -929,7 +929,7 @@ config VIDEO_OV2740
>  
>  config VIDEO_OV5640
>  	tristate "OmniVision OV5640 sensor support"
> -	depends on OF
> +	depends on OF && PM

Could you add support for runtime PM without requiring CONFIG_PM?

Essentially you'll need to power on the device in probe and power it off in
probe, and make sure the runtime PM nop variant functions return the value
you'd expect.

The ov5640_check_chip_id() function also calls ov5640_set_power() directly.
That needs to be changed, too.

>  	depends on GPIOLIB && VIDEO_V4L2 && I2C
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index f6e1e51e0375..2b7fd8631ad1 100644
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
> @@ -238,8 +239,6 @@ struct ov5640_dev {
>  	/* lock to protect all members below */
>  	struct mutex lock;
>  
> -	int power_count;
> -
>  	struct v4l2_mbus_framefmt fmt;
>  	bool pending_fmt_change;
>  
> @@ -1277,6 +1276,14 @@ static int ov5640_set_stream_mipi(struct ov5640_dev *sensor, bool on)
>  				on ? 0x00 : 0x0f);
>  }
>  
> +static int ov5640_set_stream(struct ov5640_dev *sensor, bool on)
> +{
> +	if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
> +		return ov5640_set_stream_mipi(sensor, on);
> +	else
> +		return ov5640_set_stream_dvp(sensor, on);
> +}
> +
>  static int ov5640_get_sysclk(struct ov5640_dev *sensor)
>  {
>  	 /* calculate sysclk */
> @@ -2155,37 +2162,6 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
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
> @@ -2681,6 +2657,7 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
>  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> +	struct device *dev = &sensor->i2c_client->dev;
>  	int ret;
>  
>  	/* v4l2_ctrl_lock() locks our own mutex */
> @@ -2690,7 +2667,7 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>  	 * not apply any controls to H/W at this time. Instead
>  	 * the controls will be restored right after power-up.
>  	 */
> -	if (sensor->power_count == 0)
> +	if (pm_runtime_suspended(dev))

The problem with this is that it does not prevent powering the device off
while you're here. Please use pm_runtime_get_if_active() instead (see other
drivers for examples).

>  		return 0;
>  
>  	switch (ctrl->id) {
> @@ -2939,39 +2916,57 @@ static int ov5640_enum_mbus_code(struct v4l2_subdev *sd,
>  static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> +	struct device *dev = &sensor->i2c_client->dev;
>  	int ret = 0;
>  
>  	mutex_lock(&sensor->lock);
>  
> -	if (sensor->streaming == !enable) {
> -		if (enable && sensor->pending_mode_change) {
> +	if (sensor->streaming == enable) {
> +		mutex_unlock(&sensor->lock);
> +		return 0;
> +	}
> +
> +	if (enable) {
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret < 0)
> +			goto err;
> +
> +		if (sensor->pending_mode_change) {
>  			ret = ov5640_set_mode(sensor);
>  			if (ret)
> -				goto out;
> +				goto put_pm;
>  		}
>  
> -		if (enable && sensor->pending_fmt_change) {
> +		if (sensor->pending_fmt_change) {
>  			ret = ov5640_set_framefmt(sensor, &sensor->fmt);
>  			if (ret)
> -				goto out;
> +				goto put_pm;
>  			sensor->pending_fmt_change = false;
>  		}
>  
> -		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
> -			ret = ov5640_set_stream_mipi(sensor, enable);
> -		else
> -			ret = ov5640_set_stream_dvp(sensor, enable);
> +		ret = ov5640_set_stream(sensor, true);
> +		if (ret)
> +			goto put_pm;
> +	} else {
> +		ret = ov5640_set_stream(sensor, false);
> +		if (ret)
> +			goto err;
>  
> -		if (!ret)
> -			sensor->streaming = enable;
> +		pm_runtime_put(dev);
>  	}
> -out:
> +
> +	sensor->streaming = enable;
> +	mutex_unlock(&sensor->lock);
> +	return 0;
> +
> +put_pm:
> +	pm_runtime_put(dev);
> +err:
>  	mutex_unlock(&sensor->lock);
>  	return ret;
>  }
>  
>  static const struct v4l2_subdev_core_ops ov5640_core_ops = {
> -	.s_power = ov5640_s_power,

Nice!

>  	.log_status = v4l2_ctrl_subdev_log_status,
>  	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>  	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> @@ -3037,6 +3032,29 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
>  	return ret;
>  }
>  
> +static int ov5640_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> +	struct ov5640_dev *sensor = to_ov5640_dev(subdev);
> +
> +	return ov5640_set_power(sensor, false);
> +}
> +
> +static int ov5640_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> +	struct ov5640_dev *sensor = to_ov5640_dev(subdev);
> +	int ret = 0;
> +
> +	ret = ov5640_set_power(sensor, true);
> +	if (ret)
> +		return ret;
> +
> +	return __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);

This should be done by the ov5640_set_power() function --- there's no
guarantee the sensor will be powered off after probe before someone tries
to use it.

In fact, it would be nicer to split ov5640_set_power() in two. There's
little need for the convoluted calling of power management functions in
this driver. (Almost all sensor drivers have one to power the sensor off
and another to power it on.)

> +}
> +
>  static int ov5640_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> @@ -3162,13 +3180,17 @@ static int ov5640_probe(struct i2c_client *client)
>  	if (ret)
>  		goto entity_cleanup;
>  
> +	pm_runtime_enable(dev);
> +	pm_runtime_set_suspended(dev);

You could also do this after registering the subdev below --- less error
handling that way.

See e.g. the imx355 driver for an example in what to do at the end of
probe. The idea is runtime PM is used to turn the sensor off if it's
enabled while the driver turns it on independently of runtime PM.

> +
>  	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
>  	if (ret)
> -		goto free_ctrls;
> +		goto pm_disable;
>  
>  	return 0;
>  
> -free_ctrls:
> +pm_disable:
> +	pm_runtime_disable(dev);
>  	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>  entity_cleanup:
>  	media_entity_cleanup(&sensor->sd.entity);
> @@ -3178,17 +3200,23 @@ static int ov5640_probe(struct i2c_client *client)
>  
>  static int ov5640_remove(struct i2c_client *client)
>  {
> +	struct device *dev = &client->dev;
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>  
>  	v4l2_async_unregister_subdev(&sensor->sd);
>  	media_entity_cleanup(&sensor->sd.entity);
> +	pm_runtime_disable(dev);
>  	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>  	mutex_destroy(&sensor->lock);
>  
>  	return 0;
>  }
>  
> +static const struct dev_pm_ops ov5640_pm_ops = {
> +	SET_RUNTIME_PM_OPS(ov5640_suspend, ov5640_resume, NULL)
> +};
> +
>  static const struct i2c_device_id ov5640_id[] = {
>  	{"ov5640", 0},
>  	{},
> @@ -3205,6 +3233,7 @@ static struct i2c_driver ov5640_i2c_driver = {
>  	.driver = {
>  		.name  = "ov5640",
>  		.of_match_table	= ov5640_dt_ids,
> +		.pm = &ov5640_pm_ops,
>  	},
>  	.id_table = ov5640_id,
>  	.probe_new = ov5640_probe,

-- 
Kind regards,

Sakari Ailus
