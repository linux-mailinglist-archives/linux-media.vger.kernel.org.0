Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBDF65115E0
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 13:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbiD0LKE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 07:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232750AbiD0LIM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 07:08:12 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C453C9D72
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 04:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651057401; x=1682593401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G8q+P5bhRM2Hz6Oe+FT+nn4qnr/b+AMdZklpGnivBRg=;
  b=MEVWeOKd6AChuEuDDMJSIZDCfk6w8lexGsQtOR9PCrILKELfn6bURsOE
   n57znShtIqOsp1rOTQw9TNIxwjDrLDs5GLgm3ZspwElfPr+vfe8xjaCa7
   KiYSHvaG8aQ7hzJCKhQWVnD9wqt9fqpnGw3egcH5UmQg1158gjASnjMRt
   /QMNai48UzuP5XeNLMYgT+lAFbl3LOkR43bYoC2BU4i/Ct9zFg+1Sa0w6
   eCuc1mvlpzOYix36e9TzU70RdxweaXlsyITzs03p510ayZTaoMrKTuKwA
   Fo+Avn9PMM7WsmTZBHuFyceOu0tPilnd8B2xYeiEXJowWBUCjgoasWV1L
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="328825545"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="328825545"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 03:06:06 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="539814253"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 03:06:02 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id B227E203C9;
        Wed, 27 Apr 2022 13:06:00 +0300 (EEST)
Date:   Wed, 27 Apr 2022 13:06:00 +0300
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
        Jacopo Mondi <jacopo@jmondi.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5] media: ov5640: Use runtime PM
Message-ID: <YmkViDEEDxMx8S4S@paasikivi.fi.intel.com>
References: <20220425061022.1569480-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425061022.1569480-1-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Mon, Apr 25, 2022 at 03:10:22PM +0900, Paul Elder wrote:
> Switch to using runtime PM for power management.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> ---
> Changes in v5:
> - fix compilation warning
> 
> Changes in v4:
> - replace pm_runtime_put* with pm_runtime_put_autosuspend
> - remove the manual initial call to ov5640_set_power()
> 
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
>  drivers/media/i2c/ov5640.c | 120 +++++++++++++++++++++----------------
>  2 files changed, 71 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index fae2baabb773..0bd53f8198f1 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -433,6 +433,7 @@ config VIDEO_OV5640
>  	tristate "OmniVision OV5640 sensor support"
>  	depends on OF
>  	depends on GPIOLIB && VIDEO_DEV && I2C
> +	depends on PM
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select V4L2_FWNODE
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index db5a19babe67..e8e53e954db0 100644
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
> @@ -2692,9 +2665,9 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>  	/*
>  	 * If the device is not powered up by the host driver do
>  	 * not apply any controls to H/W at this time. Instead
> -	 * the controls will be restored right after power-up.
> +	 * the controls will be restored at start streaming time.
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
> +		pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
> +
>  	return ret;
>  }
>  
>  static const struct v4l2_subdev_core_ops ov5640_core_ops = {
> -	.s_power = ov5640_s_power,
>  	.log_status = v4l2_ctrl_subdev_log_status,
>  	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>  	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> @@ -3019,26 +3010,20 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
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
>  		dev_err(&client->dev, "%s: wrong chip identifier, expected 0x5640, got 0x%x\n",
>  			__func__, chip_id);
> -		ret = -ENXIO;
> +		return -ENXIO;
>  	}
>  
> -power_off:
> -	ov5640_set_power_off(sensor);
> -	return ret;
> +	return 0;
>  }
>  
>  static int ov5640_probe(struct i2c_client *client)
> @@ -3158,21 +3143,31 @@ static int ov5640_probe(struct i2c_client *client)
>  
>  	mutex_init(&sensor->lock);
>  
> -	ret = ov5640_check_chip_id(sensor);
> +	ret = ov5640_init_controls(sensor);
>  	if (ret)
>  		goto entity_cleanup;
>  
> -	ret = ov5640_init_controls(sensor);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_get(dev);

You could on DT but the driver but the driver could be used on ACPI systems
as well.

Please see drivers/media/i2c/ccs/ccs-core.c for an example. You'll still
need explicit callbacks powering on and off the sensor in probe and remove.

> +
> +	ret = ov5640_check_chip_id(sensor);
>  	if (ret)
> -		goto entity_cleanup;
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
> -free_ctrls:
> +err_pm_runtime:
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_autosuspend(dev);
>  	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>  entity_cleanup:
>  	media_entity_cleanup(&sensor->sd.entity);
> @@ -3184,6 +3179,10 @@ static int ov5640_remove(struct i2c_client *client)
>  {
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> +	struct device *dev = &client->dev;
> +
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_autosuspend(dev);
>  
>  	v4l2_async_unregister_subdev(&sensor->sd);
>  	media_entity_cleanup(&sensor->sd.entity);
> @@ -3193,6 +3192,26 @@ static int ov5640_remove(struct i2c_client *client)
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
> @@ -3209,6 +3228,7 @@ static struct i2c_driver ov5640_i2c_driver = {
>  	.driver = {
>  		.name  = "ov5640",
>  		.of_match_table	= ov5640_dt_ids,
> +		.pm = &ov5640_pm_ops,
>  	},
>  	.id_table = ov5640_id,
>  	.probe_new = ov5640_probe,

-- 
Regards,

Sakari Ailus
