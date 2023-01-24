Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38AD86795CA
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 11:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233703AbjAXKxZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 05:53:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233639AbjAXKxW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 05:53:22 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A1DB13D6D
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 02:53:16 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="314169437"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="314169437"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:53:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="835921701"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="835921701"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 24 Jan 2023 02:53:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pKGvP-00EIfi-06;
        Tue, 24 Jan 2023 12:53:11 +0200
Date:   Tue, 24 Jan 2023 12:53:10 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 47/57] media: atomisp: ov2680: Add runtime-pm support
Message-ID: <Y8+4lkAbTiNXWank@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-48-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-48-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:55PM +0100, Hans de Goede wrote:
> Add runtime-pm support. This is a preparation patch for letting
> ACPI deal with the regulators and clocks instead of the DIY code
> in atomisp_gmin_platform.c.

Good one!
Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/i2c/atomisp-ov2680.c        | 57 ++++++++++++-------
>  drivers/staging/media/atomisp/i2c/ov2680.h    |  1 -
>  2 files changed, 36 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 2a8c4508cc66..881340d7466f 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -19,6 +19,7 @@
>  #include <linux/device.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/types.h>
>  #include <media/ovxxxx_16bit_addr_reg_helpers.h>
>  #include <media/v4l2-device.h>
> @@ -138,7 +139,8 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>  	struct ov2680_device *sensor = to_ov2680_sensor(sd);
>  	int ret;
>  
> -	if (!sensor->power_on) {
> +	/* Only apply changes to the controls if the device is powered up */
> +	if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
>  		ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
>  		return 0;
>  	}
> @@ -162,6 +164,8 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>  	default:
>  		ret = -EINVAL;
>  	}
> +
> +	pm_runtime_put(sensor->sd.dev);
>  	return ret;
>  }
>  
> @@ -244,9 +248,6 @@ static int power_up(struct v4l2_subdev *sd)
>  		return -ENODEV;
>  	}
>  
> -	if (dev->power_on)
> -		return 0; /* Already on */
> -
>  	/* power control */
>  	ret = power_ctrl(sd, 1);
>  	if (ret)
> @@ -275,7 +276,6 @@ static int power_up(struct v4l2_subdev *sd)
>  	if (ret)
>  		goto fail_init_registers;
>  
> -	dev->power_on = true;
>  	return 0;
>  
>  fail_init_registers:
> @@ -301,9 +301,6 @@ static int power_down(struct v4l2_subdev *sd)
>  		return -ENODEV;
>  	}
>  
> -	if (!dev->power_on)
> -		return 0; /* Already off */
> -
>  	ret = dev->platform_data->flisclk_ctrl(sd, 0);
>  	if (ret)
>  		dev_err(&client->dev, "flisclk failed\n");
> @@ -323,7 +320,6 @@ static int power_down(struct v4l2_subdev *sd)
>  		return ret;
>  	}
>  
> -	dev->power_on = false;
>  	return 0;
>  }
>  
> @@ -562,8 +558,8 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
>  	}
>  
>  	if (enable) {
> -		ret = power_up(sd);
> -		if (ret)
> +		ret = pm_runtime_get_sync(sensor->sd.dev);
> +		if (ret < 0)
>  			goto error_unlock;
>  
>  		ret = ov2680_set_mode(sensor);
> @@ -580,7 +576,7 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
>  			goto error_power_down;
>  	} else {
>  		ovxxxx_write_reg8(client, OV2680_SW_STREAM, OV2680_STOP_STREAMING);
> -		power_down(sd);
> +		pm_runtime_put(sensor->sd.dev);
>  	}
>  
>  	sensor->is_streaming = enable;
> @@ -591,7 +587,7 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
>  	return 0;
>  
>  error_power_down:
> -	power_down(sd);
> +	pm_runtime_put(sensor->sd.dev);
>  error_unlock:
>  	mutex_unlock(&sensor->input_lock);
>  	return ret;
> @@ -612,8 +608,8 @@ static int ov2680_s_config(struct v4l2_subdev *sd,
>  
>  	mutex_lock(&dev->input_lock);
>  
> -	ret = power_up(sd);
> -	if (ret) {
> +	ret = pm_runtime_get_sync(&client->dev);
> +	if (ret < 0) {
>  		dev_err(&client->dev, "ov2680 power-up err.\n");
>  		goto fail_power_on;
>  	}
> @@ -630,11 +626,7 @@ static int ov2680_s_config(struct v4l2_subdev *sd,
>  	}
>  
>  	/* turn off sensor, after probed */
> -	ret = power_down(sd);
> -	if (ret) {
> -		dev_err(&client->dev, "ov2680 power-off err.\n");
> -		goto fail_csi_cfg;
> -	}
> +	pm_runtime_put(&client->dev);
>  	mutex_unlock(&dev->input_lock);
>  
>  	return 0;
> @@ -642,7 +634,7 @@ static int ov2680_s_config(struct v4l2_subdev *sd,
>  fail_csi_cfg:
>  	dev->platform_data->csi_cfg(sd, 0);
>  fail_power_on:
> -	power_down(sd);
> +	pm_runtime_put(&client->dev);
>  	dev_err(&client->dev, "sensor power-gating failed\n");
>  	mutex_unlock(&dev->input_lock);
>  	return ret;
> @@ -787,6 +779,7 @@ static void ov2680_remove(struct i2c_client *client)
>  	v4l2_device_unregister_subdev(sd);
>  	media_entity_cleanup(&dev->sd.entity);
>  	v4l2_ctrl_handler_free(&dev->ctrls.handler);
> +	pm_runtime_disable(&client->dev);
>  	kfree(dev);
>  }
>  
> @@ -813,6 +806,11 @@ static int ov2680_probe(struct i2c_client *client)
>  		goto out_free;
>  	}
>  
> +	pm_runtime_set_suspended(&client->dev);
> +	pm_runtime_enable(&client->dev);
> +	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> +	pm_runtime_use_autosuspend(&client->dev);
> +
>  	ret = ov2680_s_config(&dev->sd, client->irq, pdata);
>  	if (ret)
>  		goto out_free;
> @@ -849,6 +847,22 @@ static int ov2680_probe(struct i2c_client *client)
>  	return ret;
>  }
>  
> +static int ov2680_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +
> +	return power_down(sd);
> +}
> +
> +static int ov2680_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +
> +	return power_up(sd);
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(ov2680_pm_ops, ov2680_suspend, ov2680_resume, NULL);
> +
>  static const struct acpi_device_id ov2680_acpi_match[] = {
>  	{"XXOV2680"},
>  	{"OVTI2680"},
> @@ -859,6 +873,7 @@ MODULE_DEVICE_TABLE(acpi, ov2680_acpi_match);
>  static struct i2c_driver ov2680_driver = {
>  	.driver = {
>  		.name = "ov2680",
> +		.pm = pm_sleep_ptr(&ov2680_pm_ops),
>  		.acpi_match_table = ov2680_acpi_match,
>  	},
>  	.probe_new = ov2680_probe,
> diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
> index f0641dd611c3..58593da50f6f 100644
> --- a/drivers/staging/media/atomisp/i2c/ov2680.h
> +++ b/drivers/staging/media/atomisp/i2c/ov2680.h
> @@ -120,7 +120,6 @@ struct ov2680_device {
>  	struct mutex input_lock;
>  	struct i2c_client *client;
>  	struct camera_sensor_platform_data *platform_data;
> -	bool power_on;
>  	bool is_streaming;
>  
>  	struct ov2680_mode {
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


