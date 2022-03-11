Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2712C4D6177
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 13:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347514AbiCKMZD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 07:25:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238228AbiCKMZC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 07:25:02 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476BC19BE7A
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 04:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647001439; x=1678537439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pZWD1rNmJLfszAyp3DGFagoUXZe7dl9CbWB5VfWRPY4=;
  b=E7q5bhBMg+OgBy2nAlwVfEC3bw4FVpTb5mwVqkrPCkUOq0rfAS4xuIH0
   RM2/q/tiAJW/5g3Vxwk+0+hGJbJXkyfxy/qBA/L+m2Ds7VipzT2pXTkSz
   1iXGfGbBgj8CP+GwuabjwvLyzq7+3srRCN0QBHTWLDqLjrbmYS1kXvmOk
   UIWxAD3wmgM02tFYIYVsJ1RssSn2RkDk9VH0Dc9/YlOjItCAqwmiicMd3
   zJII++C6rTWQvnUb74nyZ4/GH+EOn+saOOupY/kPTWYycu/eSYwHBIWWG
   rSfC/fbQRa+UHaJuuQ79n9hyny+PcnRRF+IHWFj01gbCZUQdmj/5RT46S
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="253125553"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="253125553"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 04:23:58 -0800
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="689049281"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 04:23:55 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 3C97920375;
        Fri, 11 Mar 2022 14:23:53 +0200 (EET)
Date:   Fri, 11 Mar 2022 14:23:53 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Shawn Tu <shawnx.tu@intel.com>, Arec Kao <arec.kao@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Martin Kepplinger <martink@posteo.de>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jmondi@jmondi.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: ov5640: Use runtime PM
Message-ID: <Yis/WZFBC49uoRg6@paasikivi.fi.intel.com>
References: <20220311111259.3220718-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311111259.3220718-1-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Thanks for the update.

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

I think this is not needed as the sensor is powered on explicitly in probe.

You should similarly power it off explicitly in remove, set the runtime PM
status suspended and disable runtime PM. See e.g. imx319 driver for an
example. It doesn't have resume callback but that doesn't really matter ---
it's just ACPI-only.

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
Kind regards,

Sakari Ailus
