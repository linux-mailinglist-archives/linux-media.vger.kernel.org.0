Return-Path: <linux-media+bounces-580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 900647F0B37
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 05:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52BEF280C36
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 04:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0980223A2;
	Mon, 20 Nov 2023 04:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jAuhrTjV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8194E5
	for <linux-media@vger.kernel.org>; Sun, 19 Nov 2023 20:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700453323; x=1731989323;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=0moWTnllxfgtGhnQVlqmE4ArxJjEv227qXGcVuo5mdc=;
  b=jAuhrTjVDFFPEfJyJIRbtQIkl6PcBaE7yI//6tc5TSI3QPXjyqIT2iwZ
   97MWfwyPp+761vKep3Q8LfpZWxapCMzmQ5l2sIFsBP3OCGaQjAnXv5mB0
   +wIbZnCLalteoiABJlbQ1IoEaKe9PoSXIQ1dz2il1D/iiDy/OfoeJrD/v
   HPZlRS45lbkgI6Yc+ewBCSuJBjyHEY1cq/0mJSXOuiJ/IRAiJg7oG4m0M
   DlRjCw9jurvwP1LmoC9Hf3ieeSLGFM/w6CpaobIQOpVF/Jf5cUXqT/lPf
   fivORvxbJtrchzWg7T80T9XtbnzSrSKl7CgUhrYLBcCHEgchddhp409Vt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="381935998"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="381935998"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 20:08:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="716101186"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="716101186"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orsmga003.jf.intel.com with ESMTP; 19 Nov 2023 20:08:40 -0800
Subject: Re: [PATCH 1/2] media: ov2740: Add support for reset GPIO
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 linux-media@vger.kernel.org
References: <20231115123817.196252-1-hdegoede@redhat.com>
 <20231115123817.196252-2-hdegoede@redhat.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <8a2988c5-e01d-1515-b908-2e28a6545120@linux.intel.com>
Date: Mon, 20 Nov 2023 12:04:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231115123817.196252-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Hans,

Thanks for your patch.

On 11/15/23 8:38 PM, Hans de Goede wrote:
> On some ACPI platforms, such as Chromebooks the ACPI methods to
> change the power-state (_PS0 and _PS3) fully take care of powering
> on/off the sensor.
> 
> On other ACPI platforms, such as e.g. various ThinkPad models with
> IPU6 + ov2740 sensor, the sensor driver must control the reset GPIO
> and the sensor's clock itself.
> 
> Add support for having the driver control an optional reset GPIO.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov2740.c | 48 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 24e468485fbf..e5f9569a229d 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -4,6 +4,7 @@
>  #include <asm/unaligned.h>
>  #include <linux/acpi.h>
>  #include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> @@ -333,6 +334,9 @@ struct ov2740 {
>  	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *exposure;
>  
> +	/* GPIOs, clocks */

It looks like the 'clock' should be in another one (2/2), :).

> +	struct gpio_desc *reset_gpio;
> +
>  	/* Current mode */
>  	const struct ov2740_mode *cur_mode;
>  
> @@ -1058,6 +1062,26 @@ static int ov2740_register_nvmem(struct i2c_client *client,
>  	return 0;
>  }
>  
> +static int ov2740_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov2740 *ov2740 = to_ov2740(sd);
> +
> +	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
> +	return 0;
> +}
> +
> +static int ov2740_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov2740 *ov2740 = to_ov2740(sd);
> +
> +	gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
> +	msleep(20);

I remember that usleep_range() is prefered for <=20ms.

> +
> +	return 0;
> +}
> +
>  static int ov2740_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> @@ -1073,12 +1097,24 @@ static int ov2740_probe(struct i2c_client *client)
>  	if (!ov2740)
>  		return -ENOMEM;
>  
> +	ov2740->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ov2740->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
> +				     "failed to get reset GPIO\n");
> +
>  	v4l2_i2c_subdev_init(&ov2740->sd, client, &ov2740_subdev_ops);
>  	full_power = acpi_dev_state_d0(&client->dev);
>  	if (full_power) {
> -		ret = ov2740_identify_module(ov2740);
> +		/* ACPI does not always clear the reset GPIO / enable the clock */
> +		ret = ov2740_resume(dev);
>  		if (ret)
> -			return dev_err_probe(dev, ret, "failed to find sensor\n");
> +			return dev_err_probe(dev, ret, "failed to power on sensor\n");
> +
> +		ret = ov2740_identify_module(ov2740);
> +		if (ret) {
> +			dev_err_probe(dev, ret, "failed to find sensor\n");
> +			goto probe_error_power_off;
> +		}
>  	}
>  
>  	ov2740->cur_mode = &supported_modes[0];
> @@ -1132,9 +1168,16 @@ static int ov2740_probe(struct i2c_client *client)
>  probe_error_v4l2_ctrl_handler_free:
>  	v4l2_ctrl_handler_free(ov2740->sd.ctrl_handler);
>  
> +probe_error_power_off:
> +	if (full_power)
> +		ov2740_suspend(dev);
> +
>  	return ret;
>  }
>  
> +static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
> +				 NULL);
> +
>  static const struct acpi_device_id ov2740_acpi_ids[] = {
>  	{"INT3474"},
>  	{}
> @@ -1146,6 +1189,7 @@ static struct i2c_driver ov2740_i2c_driver = {
>  	.driver = {
>  		.name = "ov2740",
>  		.acpi_match_table = ov2740_acpi_ids,
> +		.pm = pm_sleep_ptr(&ov2740_pm_ops),
>  	},
>  	.probe = ov2740_probe,
>  	.remove = ov2740_remove,
>

Except the minor comment.

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>




-- 
Best regards,
Bingbu Cao

