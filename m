Return-Path: <linux-media+bounces-50169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 494DACFF9BC
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 20:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF4F330024C8
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 19:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D2036A026;
	Wed,  7 Jan 2026 18:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIrPrKE5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02DD36997A;
	Wed,  7 Jan 2026 18:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767811738; cv=none; b=HkFJykhG+32PajZWrvalmOEbWhWG3VCYFnm21aBVtEsI01YxbT+x+RLSitQ6giT64y1MaV9SVyfdR6NzLD4oVMvvgTOp/6r5ABvZtPPO694jamhNeOYoAToMnsbuakyOhQfg7n/lUMwdeHI8DkWwZ5oX1aKZjNuhifi/9F2F9FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767811738; c=relaxed/simple;
	bh=vaeG3xc6jCP6hjj49N80j1QcDpc1ofD6MRUXdytVnD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZrYNFsYI5Y5osRasjV3troV91J2ybYuYmn1mLmaIpf/q+SvJ9/OED20Ljth9zoGlhCWY962o1X5L2/Vu1l3wkESggO3L0hC8tv1fcqAXuhVWUrzUldUhVVOqItm0rLts15JKPbpwQXDzvyjr0I19ZxJrqoBNWK7Y6r+Bo/ecq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIrPrKE5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767811734; x=1799347734;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vaeG3xc6jCP6hjj49N80j1QcDpc1ofD6MRUXdytVnD8=;
  b=IIrPrKE5qSGgmXGsJhIb2QxVAB+iZpHqV2H+GdRpiPYWAFNg8sAlcn75
   TAaqyiuvao2M3I2Lb2mtHsnzw9g66WjuLZyZsDwl5QA6p9sZJgptWSIrp
   bHQj5J9qTgl2TZm0Ed1FUBn1dVqVj4pPsGwUAjLGLL/EyRaXjgBu3VCkV
   5Ji/xLF6QO9jGa6Y7nDY9S1MVcLdZwd6khsqWLLpAnO4pXhE7qGkACu6W
   y89mjA7d/0v/f7uZJdcNdksRMIMexIHxjXhRL4Wahi52Qs/nZ3XICCVc8
   EJQ2fH2bSkEMvMKIWRYY+EraYrb199UdJ39Tb5QcXCUPtCiPm0pYyv9/T
   w==;
X-CSE-ConnectionGUID: TjBNkFjKQAG2buNYaI57yw==
X-CSE-MsgGUID: FMFgA6yJTOCHsnTHcfF8lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69264750"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="69264750"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 10:48:52 -0800
X-CSE-ConnectionGUID: 3NtLCHnfQO+JJ91zg81Veg==
X-CSE-MsgGUID: U/m8+RsGTIS39SOnLa+i+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="202907090"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.174])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 10:48:49 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B84D612020E;
	Wed, 07 Jan 2026 20:49:02 +0200 (EET)
Date: Wed, 7 Jan 2026 20:49:02 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] media: i2c: imx355: Support devicetree and power
 management
Message-ID: <aV6qnjyXV-yTLqVl@kekkonen.localdomain>
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <20260107043044.92485-3-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107043044.92485-3-mailingradian@gmail.com>

Hi Richard,

On Tue, Jan 06, 2026 at 11:30:41PM -0500, Richard Acayan wrote:
> A device tree compatible makes it possible for this driver to be used on
> Open Firmware devices. Initialization of power-managed resources such as
> the reset GPIO and voltage regulators can be specified in the device
> tree and handled by the driver. Add support for this so the Pixel 3a can
> use the driver.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Nacked-by: Krzysztof Kozlowski <krzk@kernel.org>

Uh-oh.

> ---
>  drivers/media/i2c/imx355.c | 116 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 108 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 776107efe386..4ac8495d1a3d 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -3,9 +3,13 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/unaligned.h>
>  
>  #include <media/v4l2-ctrls.h>
> @@ -125,6 +129,15 @@ struct imx355 {
>  	 * Protect access to sensor v4l2 controls.
>  	 */
>  	struct mutex mutex;
> +
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data *supplies;
> +};
> +
> +static const struct regulator_bulk_data imx355_supplies[] = {
> +	{ .supply = "avdd" },
> +	{ .supply = "dvdd" },
> +	{ .supply = "dovdd" },
>  };
>  
>  static const struct imx355_reg imx355_global_regs[] = {
> @@ -1515,6 +1528,55 @@ static const struct v4l2_subdev_internal_ops imx355_internal_ops = {
>  	.open = imx355_open,
>  };
>  
> +static int imx355_power_off(struct device *dev)
> +{
> +	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx355 *imx355 = to_imx355(sd);
> +
> +	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(imx355_supplies), imx355->supplies);
> +	clk_disable_unprepare(imx355->clk);
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
> +	ret = clk_prepare_enable(imx355->clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(imx355_supplies),
> +				    imx355->supplies);
> +	if (ret) {
> +		dev_err(dev, "failed to enable regulators: %d\n", ret);
> +		goto error_disable_clocks;
> +	}
> +
> +	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
> +	usleep_range(5000, 5100);
> +	gpiod_set_value_cansleep(imx355->reset_gpio, 0);
> +	usleep_range(8000, 8100);

Where do these values come from? Apparently 1 ms is required (after lifting
xshutdown) before reading identification register and 10 ms is required
(from the same point of time) before streaming can be enabled.

> +
> +	return 0;
> +
> +error_disable_clocks:
> +	clk_disable_unprepare(imx355->clk);
> +	return ret;
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx355_pm_ops, imx355_power_off,
> +				 imx355_power_on, NULL);
> +
>  /* Initialize control handlers */
>  static int imx355_init_controls(struct imx355 *imx355)
>  {
> @@ -1689,16 +1751,26 @@ static int imx355_probe(struct i2c_client *client)
>  				     "external clock %lu is not supported\n",
>  				     freq);
>  
> -	/* Initialize subdev */
> -	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
> -
> -	/* Check module identity */
> -	ret = imx355_identify_module(imx355);
> +	ret = devm_regulator_bulk_get_const(imx355->dev,
> +				      ARRAY_SIZE(imx355_supplies),
> +				      imx355_supplies,
> +				      &imx355->supplies);
>  	if (ret) {
> -		dev_err(imx355->dev, "failed to find sensor: %d", ret);
> +		dev_err_probe(imx355->dev, ret, "could not get regulators");
>  		goto error_probe;
>  	}
>  
> +	imx355->reset_gpio = devm_gpiod_get_optional(imx355->dev, "reset",
> +						     GPIOD_OUT_LOW);

s/LOW/HIGH/

> +	if (IS_ERR(imx355->reset_gpio)) {
> +		ret = dev_err_probe(imx355->dev, PTR_ERR(imx355->reset_gpio),
> +				    "failed to get gpios");
> +		goto error_probe;
> +	}
> +
> +	/* Initialize subdev */
> +	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
> +
>  	imx355->hwcfg = imx355_get_hwcfg(imx355->dev);
>  	if (!imx355->hwcfg) {
>  		dev_err(imx355->dev, "failed to get hwcfg");
> @@ -1706,13 +1778,26 @@ static int imx355_probe(struct i2c_client *client)
>  		goto error_probe;
>  	}
>  
> +	ret = imx355_power_on(imx355->dev);
> +	if (ret) {
> +		dev_err(imx355->dev, "failed to power on sensor: %d", ret);
> +		goto error_probe;
> +	}
> +
> +	/* Check module identity */
> +	ret = imx355_identify_module(imx355);
> +	if (ret) {
> +		dev_err(imx355->dev, "failed to find sensor: %d", ret);
> +		goto error_power_off;
> +	}
> +
>  	/* Set default mode to max resolution */
>  	imx355->cur_mode = &supported_modes[0];
>  
>  	ret = imx355_init_controls(imx355);
>  	if (ret) {
>  		dev_err(imx355->dev, "failed to init controls: %d", ret);
> -		goto error_probe;
> +		goto error_power_off;
>  	}
>  
>  	/* Initialize subdev */
> @@ -1752,6 +1837,9 @@ static int imx355_probe(struct i2c_client *client)
>  error_handler_free:
>  	v4l2_ctrl_handler_free(imx355->sd.ctrl_handler);
>  
> +error_power_off:
> +	imx355_power_off(imx355->dev);
> +
>  error_probe:
>  	mutex_destroy(&imx355->mutex);
>  
> @@ -1768,7 +1856,11 @@ static void imx355_remove(struct i2c_client *client)
>  	v4l2_ctrl_handler_free(sd->ctrl_handler);
>  
>  	pm_runtime_disable(imx355->dev);
> -	pm_runtime_set_suspended(imx355->dev);
> +
> +	if (!pm_runtime_status_suspended(imx355->dev)) {
> +		imx355_power_off(imx355->dev);
> +		pm_runtime_set_suspended(imx355->dev);
> +	}
>  
>  	mutex_destroy(&imx355->mutex);
>  }
> @@ -1779,10 +1871,18 @@ static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {
>  };
>  MODULE_DEVICE_TABLE(acpi, imx355_acpi_ids);
>  
> +static const struct of_device_id imx355_match_table[] __maybe_unused = {

Please drop __maybe_unused; it's redundant.

> +	{ .compatible = "sony,imx355", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx355_match_table);
> +
>  static struct i2c_driver imx355_i2c_driver = {
>  	.driver = {
>  		.name = "imx355",
>  		.acpi_match_table = ACPI_PTR(imx355_acpi_ids),
> +		.of_match_table = imx355_match_table,
> +		.pm = &imx355_pm_ops,
>  	},
>  	.probe = imx355_probe,
>  	.remove = imx355_remove,

-- 
Kind regards,

Sakari Ailus

