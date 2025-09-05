Return-Path: <linux-media+bounces-41882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE44B46683
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 00:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F055A7B3A24
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 22:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E674A269CF0;
	Fri,  5 Sep 2025 22:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fInz86f/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340E81EB9E1;
	Fri,  5 Sep 2025 22:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757110588; cv=none; b=CUWLZ7TVvFFjaevIrxHAo3MKG+tdZffmFrCXl7kZGnw+CrAlpQaLOs0te4ERs8wjt41LJsTICh+bcvHpRJbHqCvHuMzJF12sJonuCjakSoXDJhVtEJ/0T407eQ8ahwqKpdq0GVGxm8/SoX1W++qdEMrJfQQWq23GXfb0uLSsZio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757110588; c=relaxed/simple;
	bh=HjHZjLYFVG1kv5QdC9YvCQW2fcZUSo+Hwb6bGQguV98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYjiLxzQyJcHrY5iWrOqw15GLy8ROtr1e4xuo40PX6kRY9ILlkm7F0IZ+ZBaZ4hM4Hm9OKEKR+nGkB7AqU/I8Kx6Ku6suyFOPjNz3hvBudvfKn3+WhSJjZt/GEpG+u02iApU0Liu/qAo6fEvmSmWV+np3yay9d2wrqp3/MDc7O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fInz86f/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757110586; x=1788646586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HjHZjLYFVG1kv5QdC9YvCQW2fcZUSo+Hwb6bGQguV98=;
  b=fInz86f/ueDEU7QporzFY4FoGXGOggyzybb+1qv1XxdEVjhesT/ptk25
   vn6F8RYeh9H5/YsJv8O5ExHrXqZnMEpq2bH3B1IH+J4wvEaYYjBYxTKyA
   XvCBUqaZDzpC/TUL7/V1Rmm9J20Mizsh1PsoOXdEnKYDZ4FDT2sLE7BRx
   ztFsq5qQWsG0KDUzlDRncCkXCxQ8VVtc7UWdxqpKU0kDVUKsRNLGFN3yc
   GsLLMx2mKj5/bUsx/eV0Dt6kwa8httYUEpxSTVkbLgBAX90SuZQdfh/e+
   Dxp+YcV2JB7t9uokWcLx1TOiNdkglk0xijt+Ij64ggv+stk9w8n2eU+Bs
   Q==;
X-CSE-ConnectionGUID: nryDLIzdRiO2Y1Zl/dBd9g==
X-CSE-MsgGUID: tMEfwDQQQz2eWE2FFsYmlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59404328"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="59404328"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 15:16:24 -0700
X-CSE-ConnectionGUID: ZnLmeu2zSdm/eQ5jrEUNbg==
X-CSE-MsgGUID: PqTP1HJ5QU6qkZjMenQ16w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="176596325"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.91])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 15:16:21 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E9FA2121F4E;
	Sat, 06 Sep 2025 01:16:17 +0300 (EEST)
Date: Sat, 6 Sep 2025 01:16:17 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH v3 2/4] media: i2c: imx355: Support devicetree and power
 management
Message-ID: <aLthMWJsEDd829UR@kekkonen.localdomain>
References: <20250905215516.289998-6-mailingradian@gmail.com>
 <20250905215516.289998-8-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905215516.289998-8-mailingradian@gmail.com>

Hi Richard,

On Fri, Sep 05, 2025 at 05:55:19PM -0400, Richard Acayan wrote:
> A device tree compatible makes it possible for this driver to be used on
> Open Firmware devices. Initialization of power-managed resources such as
> the reset GPIO and voltage regulators can be specified in the device
> tree and handled by the driver. Add support for this so the Pixel 3a can
> use the driver.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/media/i2c/imx355.c | 135 +++++++++++++++++++++++++++++++++----
>  1 file changed, 122 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index b2dce67c0b6b..f7c51e50113e 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -3,9 +3,14 @@
>  
>  #include <linux/unaligned.h>
>  #include <linux/acpi.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> @@ -121,6 +126,16 @@ struct imx355 {
>  	 * Protect access to sensor v4l2 controls.
>  	 */
>  	struct mutex mutex;
> +
> +	struct clk *mclk;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[3];
> +};
> +
> +static const char * const imx355_supply_names[] = {
> +	"avdd",
> +	"dvdd",
> +	"dovdd",
>  };
>  
>  static const struct imx355_reg imx355_global_regs[] = {
> @@ -1516,6 +1531,57 @@ static const struct v4l2_subdev_internal_ops imx355_internal_ops = {
>  	.open = imx355_open,
>  };
>  
> +static int imx355_power_off(struct device *dev)
> +{
> +	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx355 *imx355 = to_imx355(sd);
> +
> +	if (imx355->reset_gpio)
> +		gpiod_set_value_cansleep(imx355->reset_gpio, 0);

The gpiod framework can work with NULL descriptor so I don't think you need
to check for non-NULL before the calls. Same elsewhere.

> +
> +	regulator_bulk_disable(ARRAY_SIZE(imx355->supplies), imx355->supplies);
> +	clk_disable_unprepare(imx355->mclk);
> +
> +	return 0;
> +}
> +
> +static int imx355_power_on(struct device *dev)
> +{
> +	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx355 *imx355 = to_imx355(sd);
> +	int ret;
> +
> +	ret = clk_prepare_enable(imx355->mclk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(imx355->supplies),
> +				    imx355->supplies);
> +	if (ret) {
> +		dev_err(dev, "failed to enable regulators: %d\n", ret);
> +		goto error_disable_clocks;
> +	}
> +
> +	if (imx355->reset_gpio) {
> +		usleep_range(5000, 5100);
> +		gpiod_set_value_cansleep(imx355->reset_gpio, 1);
> +		usleep_range(8000, 8100);
> +	}
> +
> +	return 0;
> +
> +error_disable_clocks:
> +	clk_disable_unprepare(imx355->mclk);
> +	return ret;
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx355_pm_ops, imx355_power_off,
> +				 imx355_power_on, NULL);
> +
>  /* Initialize control handlers */
>  static int imx355_init_controls(struct imx355 *imx355)
>  {
> @@ -1623,7 +1689,7 @@ static int imx355_init_controls(struct imx355 *imx355)
>  	return ret;
>  }
>  
> -static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
> +static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev, struct imx355 *imx355)
>  {
>  	struct imx355_hwcfg *cfg;
>  	struct v4l2_fwnode_endpoint bus_cfg = {
> @@ -1648,12 +1714,7 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
>  	if (!cfg)
>  		goto out_err;
>  
> -	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> -				       &cfg->ext_clk);
> -	if (ret) {
> -		dev_err(dev, "can't get clock frequency");
> -		goto out_err;
> -	}
> +	cfg->ext_clk = clk_get_rate(imx355->mclk);
>  
>  	dev_dbg(dev, "ext clk: %d", cfg->ext_clk);
>  	if (cfg->ext_clk != IMX355_EXT_CLK) {
> @@ -1683,6 +1744,7 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
>  static int imx355_probe(struct i2c_client *client)
>  {
>  	struct imx355 *imx355;
> +	size_t i;
>  	int ret;
>  
>  	imx355 = devm_kzalloc(&client->dev, sizeof(*imx355), GFP_KERNEL);
> @@ -1694,27 +1756,59 @@ static int imx355_probe(struct i2c_client *client)
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
>  
> -	/* Check module identity */
> -	ret = imx355_identify_module(imx355);
> +	for (i = 0; i < ARRAY_SIZE(imx355_supply_names); i++)
> +		imx355->supplies[i].supply = imx355_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(&client->dev,
> +				      ARRAY_SIZE(imx355->supplies),
> +				      imx355->supplies);
>  	if (ret) {
> -		dev_err(&client->dev, "failed to find sensor: %d", ret);
> +		dev_err_probe(&client->dev, ret, "could not get regulators");
> +		goto error_probe;
> +	}
> +
> +	imx355->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> +						     GPIOD_OUT_LOW);
> +	if (IS_ERR(imx355->reset_gpio)) {
> +		ret = dev_err_probe(&client->dev, PTR_ERR(imx355->reset_gpio),
> +				    "failed to get gpios");
> +		goto error_probe;
> +	}
> +
> +	imx355->mclk = devm_v4l2_sensor_clk_get(&client->dev, "mclk");
> +	if (IS_ERR(imx355->mclk)) {
> +		ret = dev_err_probe(&client->dev, PTR_ERR(imx355->mclk),
> +				    "failed to get mclk");
>  		goto error_probe;
>  	}
>  
> -	imx355->hwcfg = imx355_get_hwcfg(&client->dev);
> +	imx355->hwcfg = imx355_get_hwcfg(&client->dev, imx355);
>  	if (!imx355->hwcfg) {
>  		dev_err(&client->dev, "failed to get hwcfg");
>  		ret = -ENODEV;
>  		goto error_probe;
>  	}
>  
> +	ret = imx355_power_on(&client->dev);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to power on sensor: %d", ret);
> +		goto error_probe;
> +	}
> +
> +	/* Check module identity */
> +	ret = imx355_identify_module(imx355);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to find sensor: %d", ret);
> +		goto error_power_off;
> +	}
> +
>  	/* Set default mode to max resolution */
>  	imx355->cur_mode = &supported_modes[0];
>  
>  	ret = imx355_init_controls(imx355);
>  	if (ret) {
>  		dev_err(&client->dev, "failed to init controls: %d", ret);
> -		goto error_probe;
> +		goto error_power_off;
>  	}
>  
>  	/* Initialize subdev */
> @@ -1754,6 +1848,9 @@ static int imx355_probe(struct i2c_client *client)
>  error_handler_free:
>  	v4l2_ctrl_handler_free(imx355->sd.ctrl_handler);
>  
> +error_power_off:
> +	imx355_power_off(&client->dev);
> +
>  error_probe:
>  	mutex_destroy(&imx355->mutex);
>  
> @@ -1770,7 +1867,11 @@ static void imx355_remove(struct i2c_client *client)
>  	v4l2_ctrl_handler_free(sd->ctrl_handler);
>  
>  	pm_runtime_disable(&client->dev);
> -	pm_runtime_set_suspended(&client->dev);
> +
> +	if (!pm_runtime_status_suspended(&client->dev)) {
> +		imx355_power_off(&client->dev);
> +		pm_runtime_set_suspended(&client->dev);
> +	}
>  
>  	mutex_destroy(&imx355->mutex);
>  }
> @@ -1781,10 +1882,18 @@ static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {
>  };
>  MODULE_DEVICE_TABLE(acpi, imx355_acpi_ids);
>  
> +static const struct of_device_id imx355_match_table[] __maybe_unused = {
> +	{ .compatible = "sony,imx355", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx355_match_table);
> +
>  static struct i2c_driver imx355_i2c_driver = {
>  	.driver = {
>  		.name = "imx355",
>  		.acpi_match_table = ACPI_PTR(imx355_acpi_ids),
> +		.of_match_table = of_match_ptr(imx355_match_table),

Please don't use of_match_ptr() on drivers that can also be used on ACPI --
it renders the pointer NULL if OF is disabled.

> +		.pm = &imx355_pm_ops,
>  	},
>  	.probe = imx355_probe,
>  	.remove = imx355_remove,

-- 
Kind regards,

Sakari Ailus

