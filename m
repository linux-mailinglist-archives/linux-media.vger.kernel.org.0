Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77E964B8D45
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 17:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235934AbiBPQHR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 11:07:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235942AbiBPQHR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 11:07:17 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921FC2B25F
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 08:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645027624; x=1676563624;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EDIRvZwev9VnsosoDWZYQTgVlGZ2l0XRGdA0wmy1MNU=;
  b=Tt6jHvmSmNMAC750A9xhGu4WBcvNIsviTkkDGBcY68+0OOUN04Naz34k
   MsAfHMbe/V9vKtPaLfmCN6suW0zarwhLiQDbIUlNb8P8YzhUuYi0LDlBv
   9YIGptYKAhlTO5QzwO8ue1GtYYXnEMe70xarymULRJgFSUnJlizSKSfTf
   1mezIFIg/FZPqLIeX8lm9EJjLhnxKXpAzbU7Zs0MQ6pHHmLlw1XFxIcnj
   Rks255u27J6JU2Bv0QKy4+0hIczRhgXNCVk9S3z19exvswFN2ZypJwW0B
   z3kfxnEGfOB7afyQ/8UWj9puBxp3b6yqwzII8AkjGn1NLYPvr4AiSG4vk
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="238057605"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="238057605"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 08:05:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="681571408"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 08:05:02 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 67DFB201DB;
        Wed, 16 Feb 2022 18:05:00 +0200 (EET)
Date:   Wed, 16 Feb 2022 18:05:00 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH 08/10] media: i2c: Add pm_runtime support to ov7251
Message-ID: <Yg0grHE1MlxF0tFw@paasikivi.fi.intel.com>
References: <20220215230737.1870630-1-djrscally@gmail.com>
 <20220215230737.1870630-9-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215230737.1870630-9-djrscally@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Tue, Feb 15, 2022 at 11:07:35PM +0000, Daniel Scally wrote:
> Add pm_runtime support to the ov7251 driver.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/media/i2c/ov7251.c | 78 ++++++++++++++++++++++++++++++--------
>  1 file changed, 63 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
> index f137a1e87537..d620ed6a4e42 100644
> --- a/drivers/media/i2c/ov7251.c
> +++ b/drivers/media/i2c/ov7251.c
> @@ -15,6 +15,7 @@
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> @@ -884,6 +885,24 @@ static void ov7251_set_power_off(struct ov7251 *ov7251)
>  	ov7251_regulators_disable(ov7251);
>  }
>  
> +static int __maybe_unused ov7251_sensor_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov7251 *ov7251 = to_ov7251(sd);
> +
> +	ov7251_set_power_off(ov7251);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused ov7251_sensor_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov7251 *ov7251 = to_ov7251(sd);
> +
> +	return ov7251_set_power_on(ov7251);

Could you change the argument type of ov7251_set_power_o{n,ff}() to struct
device * so you'd have just one set of these functions?

> +}
> +
>  static int ov7251_s_power(struct v4l2_subdev *sd, int on)
>  {
>  	struct ov7251 *ov7251 = to_ov7251(sd);
> @@ -985,7 +1004,7 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
>  
>  	/* v4l2_ctrl_lock() locks our mutex */
>  
> -	if (!ov7251->power_on)
> +	if (!pm_runtime_get_if_in_use(ov7251->dev))
>  		return 0;
>  
>  	switch (ctrl->id) {
> @@ -1009,6 +1028,8 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> +	pm_runtime_put(ov7251->dev);
> +
>  	return ret;
>  }
>  
> @@ -1261,10 +1282,15 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
>  	mutex_lock(&ov7251->lock);
>  
>  	if (enable) {
> +		ret = pm_runtime_get_sync(ov7251->dev);
> +		if (ret < 0)
> +			return ret;
> +
>  		ret = ov7251_pll_configure(ov7251);
> -		if (ret)
> -			return dev_err_probe(ov7251->dev, ret,
> -					     "error configuring PLLs\n");
> +		if (ret) {
> +			dev_err(ov7251->dev, "error configuring PLLs\n");
> +			goto err_power_down;
> +		}
>  
>  		ret = ov7251_set_register_array(ov7251,
>  					ov7251->current_mode->data,
> @@ -1273,23 +1299,29 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
>  			dev_err(ov7251->dev, "could not set mode %dx%d\n",
>  				ov7251->current_mode->width,
>  				ov7251->current_mode->height);
> -			goto exit;
> +			goto err_power_down;
>  		}
>  		ret = __v4l2_ctrl_handler_setup(&ov7251->ctrls);
>  		if (ret < 0) {
>  			dev_err(ov7251->dev, "could not sync v4l2 controls\n");
> -			goto exit;
> +			goto err_power_down;
>  		}
>  		ret = ov7251_write_reg(ov7251, OV7251_SC_MODE_SELECT,
>  				       OV7251_SC_MODE_SELECT_STREAMING);
> +		if (ret)
> +			goto err_power_down;
>  	} else {
>  		ret = ov7251_write_reg(ov7251, OV7251_SC_MODE_SELECT,
>  				       OV7251_SC_MODE_SELECT_SW_STANDBY);
> +		pm_runtime_put(ov7251->dev);
>  	}
>  
> -exit:
>  	mutex_unlock(&ov7251->lock);
> +	return ret;
>  
> +err_power_down:
> +	pm_runtime_put_noidle(ov7251->dev);
> +	mutex_unlock(&ov7251->lock);
>  	return ret;
>  }
>  
> @@ -1604,23 +1636,24 @@ static int ov7251_probe(struct i2c_client *client)
>  		goto free_ctrl;
>  	}
>  
> -	ret = ov7251_s_power(&ov7251->sd, true);
> -	if (ret < 0) {
> -		dev_err(dev, "could not power up OV7251\n");
> +	ret = ov7251_set_power_on(ov7251);
> +	if (ret)
>  		goto free_entity;
> -	}
>  
>  	ret = ov7251_detect_chip(ov7251);
>  	if (ret)
>  		goto power_down;
>  
> +	pm_runtime_set_active(&client->dev);
> +	pm_runtime_get_noresume(&client->dev);
> +	pm_runtime_enable(&client->dev);
>  
>  	ret = ov7251_read_reg(ov7251, OV7251_PRE_ISP_00,
>  			      &ov7251->pre_isp_00);
>  	if (ret < 0) {
>  		dev_err(dev, "could not read test pattern value\n");
>  		ret = -ENODEV;
> -		goto power_down;
> +		goto err_pm_runtime;
>  	}
>  
>  	ret = ov7251_read_reg(ov7251, OV7251_TIMING_FORMAT1,
> @@ -1628,7 +1661,7 @@ static int ov7251_probe(struct i2c_client *client)
>  	if (ret < 0) {
>  		dev_err(dev, "could not read vflip value\n");
>  		ret = -ENODEV;
> -		goto power_down;
> +		goto err_pm_runtime;
>  	}
>  
>  	ret = ov7251_read_reg(ov7251, OV7251_TIMING_FORMAT2,
> @@ -1636,10 +1669,12 @@ static int ov7251_probe(struct i2c_client *client)
>  	if (ret < 0) {
>  		dev_err(dev, "could not read hflip value\n");
>  		ret = -ENODEV;
> -		goto power_down;
> +		goto err_pm_runtime;
>  	}
>  
> -	ov7251_s_power(&ov7251->sd, false);
> +	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> +	pm_runtime_use_autosuspend(&client->dev);
> +	pm_runtime_put_autosuspend(&client->dev);
>  
>  	ret = v4l2_async_register_subdev(&ov7251->sd);
>  	if (ret < 0) {
> @@ -1651,6 +1686,9 @@ static int ov7251_probe(struct i2c_client *client)
>  
>  	return 0;
>  
> +err_pm_runtime:
> +	pm_runtime_disable(ov7251->dev);
> +	pm_runtime_put_noidle(ov7251->dev);
>  power_down:
>  	ov7251_s_power(&ov7251->sd, false);
>  free_entity:
> @@ -1672,9 +1710,18 @@ static int ov7251_remove(struct i2c_client *client)
>  	v4l2_ctrl_handler_free(&ov7251->ctrls);
>  	mutex_destroy(&ov7251->lock);
>  
> +	pm_runtime_disable(ov7251->dev);
> +	if (!pm_runtime_status_suspended(ov7251->dev))
> +		ov7251_set_power_off(ov7251);
> +	pm_runtime_set_suspended(ov7251->dev);
> +
>  	return 0;
>  }
>  
> +static const struct dev_pm_ops ov7251_pm_ops = {
> +	SET_RUNTIME_PM_OPS(ov7251_sensor_suspend, ov7251_sensor_resume, NULL)
> +};
> +
>  static const struct of_device_id ov7251_of_match[] = {
>  	{ .compatible = "ovti,ov7251" },
>  	{ /* sentinel */ }
> @@ -1692,6 +1739,7 @@ static struct i2c_driver ov7251_i2c_driver = {
>  		.of_match_table = ov7251_of_match,
>  		.acpi_match_table = ov7251_acpi_match,
>  		.name  = "ov7251",
> +		.pm = &ov7251_pm_ops,
>  	},
>  	.probe_new  = ov7251_probe,
>  	.remove = ov7251_remove,

-- 
Kind regards,

Sakari Ailus
