Return-Path: <linux-media+bounces-23824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C78AD9F8290
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 18:53:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83CBE189A97A
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 17:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE95B1CCEC8;
	Thu, 19 Dec 2024 17:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCeck/rT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CE01AAA0B
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 17:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734630053; cv=none; b=QasF8QhwSiSrJe8y6VHfrxhqae3sm9SO+apYSvgHn28lP0a78R3Kr9DYmPfRcS0l/GjtvplsnV2swqHqS0sN/HWey3JauzjPPGMuNQaWYsInyT4TdY4YV7yQHLNvcyyIHoHlbP3AiWHopjv4fqM+hkFaVxa0sTPaCGVGt7crKkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734630053; c=relaxed/simple;
	bh=p/grWiF8MGunVuBdBoJptw6mYy6Tgs94Dy12JLPXyJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRkA0gr4cGVozL6AGI9O5RqLWrQ5QLbIdjuMKU7RsAQdc4X6HRMV15SPcAihp4aCy4NwZjv1rsCuKS6FAocFMf8Dv7exwjoa2NqpI7KESiEY/fxaZEDUpEyk9jwSawOmwO5LslnMTMmhlQpNDYeg7DCyn8tOsmGLsf/oBdUC3uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCeck/rT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734630051; x=1766166051;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p/grWiF8MGunVuBdBoJptw6mYy6Tgs94Dy12JLPXyJA=;
  b=NCeck/rTuXOdmgU9UX+l9Cz2CM0Ik7eqIlRzTbvNd/A4ZVt9nX+h6rVN
   GbEjt030DzXOMD0XrmmtgUEFhFq9udF193ubYLNL3qxvI+YXcA8a0wxS3
   cpSrsvOhQ0OnizqP1AO1CchlNrIRTxDQWqeiFZbh97hDZv3AwhJH4ZC1/
   zOrcsl0FtmnE98AA/9UC3DnteQYHv8BylN0eZ00zC7MuJ/pBKJ/S7mR2y
   285v6iOZZMOul0CNrkY5R+H3Zu42XRTPQ86vcwkPYZmqwaCy8x2jPuY2G
   r7B8TAZSkc+BVGD1x0/EyECfu67KTNcxb0cn3989AvgAYc/FvtzcTAHh/
   A==;
X-CSE-ConnectionGUID: D7mYU1gDTBKlkUQ+SJPbOg==
X-CSE-MsgGUID: QyIwB2T+ShSB4maSO+d1YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35188115"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="35188115"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 09:40:50 -0800
X-CSE-ConnectionGUID: fN/yKTsCSrC6S2VrPq6jHA==
X-CSE-MsgGUID: ih4wWgoRRjuikLHtQuq8cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="98657752"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 09:40:49 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 54AFC11FA2A;
	Thu, 19 Dec 2024 19:40:46 +0200 (EET)
Date: Thu, 19 Dec 2024 17:40:46 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: Add driver for AD5823 VCM
Message-ID: <Z2RanjxTR-Km8qCW@kekkonen.localdomain>
References: <20241105204246.30097-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105204246.30097-1-hdegoede@redhat.com>

Hi Hans,

Thanks for the patch. Please see my comments below.

On Tue, Nov 05, 2024 at 09:42:46PM +0100, Hans de Goede wrote:
> Add a driver for the AD5823 VCM. The driver creates a v4l2 subdevice
> and registers a control to set the desired focus.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/Kconfig  |   8 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/ad5823.c | 312 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 321 insertions(+)
>  create mode 100644 drivers/media/i2c/ad5823.c
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 0e0c7cfdee26..dd81de88e1e2 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -763,6 +763,14 @@ config VIDEO_AD5820
>  	  This is a driver for the AD5820 camera lens voice coil.
>  	  It is used for example in Nokia N900 (RX-51).
>  
> +config VIDEO_AD5823
> +	tristate "AD5823 lens voice coil support"
> +	select V4L2_CCI_I2C
> +	help
> +	  This is a driver for the AD5823 camera lens voice coil / VCM.
> +	  This is designed for linear control of voice coil motors,
> +	  controlled via I2C serial interface.
> +
>  config VIDEO_AK7375
>  	tristate "AK7375 lens voice coil support"
>  	depends on I2C && VIDEO_DEV
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 4ce92b8b0683..2518ac751117 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -4,6 +4,7 @@ msp3400-objs	:=	msp3400-driver.o msp3400-kthreads.o
>  
>  obj-$(CONFIG_SDR_MAX2175) += max2175.o
>  obj-$(CONFIG_VIDEO_AD5820) += ad5820.o
> +obj-$(CONFIG_VIDEO_AD5823) += ad5823.o
>  obj-$(CONFIG_VIDEO_ADP1653) += adp1653.o
>  obj-$(CONFIG_VIDEO_ADV7170) += adv7170.o
>  obj-$(CONFIG_VIDEO_ADV7175) += adv7175.o
> diff --git a/drivers/media/i2c/ad5823.c b/drivers/media/i2c/ad5823.c
> new file mode 100644
> index 000000000000..96e7ff3a8583
> --- /dev/null
> +++ b/drivers/media/i2c/ad5823.c
> @@ -0,0 +1,312 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Analog Devices AD5823 VCM driver
> + * Copyright 2023 - 2024 Hans de Goede <hansg@kernel.org>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/types.h>
> +
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define AD5823_MAX_FOCUS_POS		1023
> +
> +#define AD5823_RESET			CCI_REG8(1)
> +#define AD5823_RESET_RESET		BIT(0)
> +
> +#define AD5823_MODE			CCI_REG8(2)
> +#define AD5823_ARC_RES1			0x01
> +
> +#define AD5823_VCM_MOVE_TIME		CCI_REG8(3)
> +#define AD5823_VCM_MOVE_TIME_DEFAULT	0x80
> +#define AD5823_RESONANCE_PERIOD		100000	/* in 0.1 us units */
> +#define AD5823_RESONANCE_COEF		512	/* in 0.1 us units */
> +
> +#define AD5823_RESONANCE_OFFSET		0x80	/* for reg 0x02 bit 5 == 0 */
> +
> +#define AD5823_VCM_CODE			CCI_REG16(4)
> +#define AD5823_VCM_CODE_RING_CTRL	BIT(10)
> +
> +#define AD5823_VCM_THRESHOLD		CCI_REG16(6)
> +#define AD5823_VCM_THRESHOLD_DEFAULT	0x10
> +
> +#define to_ad5823_device(x) container_of(x, struct ad5823_device, sd)

container_of_const()?

> +
> +struct ad5823_device {
> +	struct v4l2_subdev sd;
> +	struct regmap *regmap;
> +	struct regulator *regulator;
> +	u32 arc_mode;
> +	u32 resonance_period;	/* in 0.1 us units */
> +
> +	struct ad5823_v4l2_ctrls {
> +		struct v4l2_ctrl_handler handler;
> +		struct v4l2_ctrl *focus;
> +	} ctrls;
> +};
> +
> +static int ad5823_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ad5823_device *ad5823 = container_of(ctrl->handler,
> +						    struct ad5823_device,
> +						    ctrls.handler);

Ditto.

> +	int ret;
> +
> +	/* Only apply changes to the controls if the device is powered up */
> +	if (!pm_runtime_get_if_in_use(ad5823->sd.dev))

I'd suggest to use pm_runtime_get_if_active() as it also proceeds when
there are no users but the device is still powered on. Otherwise setting
focus won't be updated to the device.

> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_FOCUS_ABSOLUTE:
> +		ret = cci_write(ad5823->regmap, AD5823_VCM_CODE,
> +				AD5823_VCM_CODE_RING_CTRL | ctrl->val, NULL);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	pm_runtime_put(ad5823->sd.dev);
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops ad5823_ctrl_ops = {
> +	.s_ctrl = ad5823_set_ctrl,
> +};
> +
> +static int ad5823_power_down(struct ad5823_device *ad5823)
> +{
> +	return regulator_disable(ad5823->regulator);
> +}
> +
> +static int ad5823_power_up(struct ad5823_device *ad5823, bool detect)
> +{
> +	u64 vcm_move_time, vcm_threshold;
> +	int ret;
> +
> +	ret = regulator_enable(ad5823->regulator);
> +	if (ret)
> +		return ret;
> +

Is there no power-up delay at all? Even the regulator supplied voltage may
take some time to rise.

> +	cci_write(ad5823->regmap, AD5823_RESET, BIT(0), &ret);
> +
> +	if (detect) {
> +		/* There is no id register, check for default reg values. */
> +		cci_read(ad5823->regmap, AD5823_VCM_MOVE_TIME, &vcm_move_time, &ret);
> +		cci_read(ad5823->regmap, AD5823_VCM_THRESHOLD, &vcm_threshold, &ret);
> +
> +		if (!ret && (vcm_move_time != AD5823_VCM_MOVE_TIME_DEFAULT ||
> +			     vcm_threshold != AD5823_VCM_THRESHOLD_DEFAULT)) {
> +			dev_err(ad5823->sd.dev, "Failed to detect AD5823 got move-time 0x%02llx vcm-threshold 0x%02llx\n",
> +				vcm_move_time, vcm_threshold);
> +			ret = -ENXIO;
> +		}
> +	}
> +
> +	vcm_move_time = ad5823->resonance_period / AD5823_RESONANCE_COEF -
> +			AD5823_RESONANCE_OFFSET;
> +
> +	dev_dbg(ad5823->sd.dev, "mode 0x%02x move-time 0x%02llx\n",
> +		ad5823->arc_mode, vcm_move_time);
> +
> +	cci_write(ad5823->regmap, AD5823_MODE, ad5823->arc_mode, &ret);
> +	cci_write(ad5823->regmap, AD5823_VCM_MOVE_TIME, vcm_move_time, &ret);
> +	if (ret)
> +		ad5823_power_down(ad5823);
> +
> +	return ret;
> +}
> +
> +static int ad5823_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ad5823_device *ad5823 = to_ad5823_device(sd);
> +
> +	return ad5823_power_down(ad5823);
> +}
> +
> +static int ad5823_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ad5823_device *ad5823 = to_ad5823_device(sd);
> +	int ret;
> +
> +	ret = ad5823_power_up(ad5823, false);
> +	if (ret)
> +		return ret;
> +
> +	/* Restore value of ctrls */
> +	ret = v4l2_ctrl_handler_setup(&ad5823->ctrls.handler);
> +	if (ret < 0)
> +		dev_warn(dev, "Failed to restore focus ctrl value: %d\n", ret);

Shouldn't resume fail in this case? The register writes in power_up()
function will have that effect.

> +
> +	return 0;
> +}

See comment in probe(), too.

I'd try to with a single set of power on/off functions. Using the device as
an argument is mandatory of course.

> +
> +static int ad5823_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	return pm_runtime_resume_and_get(sd->dev);
> +}
> +
> +static int ad5823_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	pm_runtime_put(sd->dev);
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_internal_ops ad5823_internal_ops = {
> +	.open = ad5823_open,
> +	.close = ad5823_close,
> +};
> +
> +static const struct v4l2_subdev_ops ad5823_ops = { };
> +
> +static int ad5823_init_controls(struct ad5823_device *ad5823)
> +{
> +	const struct v4l2_ctrl_ops *ops = &ad5823_ctrl_ops;
> +	int ret;
> +
> +	v4l2_ctrl_handler_init(&ad5823->ctrls.handler, 1);
> +
> +	ad5823->ctrls.focus = v4l2_ctrl_new_std(&ad5823->ctrls.handler, ops,
> +						V4L2_CID_FOCUS_ABSOLUTE, 0,
> +						AD5823_MAX_FOCUS_POS, 1, 0);
> +
> +	if (ad5823->ctrls.handler.error) {
> +		dev_err(ad5823->sd.dev, "Error initialising v4l2 ctrls\n");
> +		ret = ad5823->ctrls.handler.error;
> +		goto err_free_handler;
> +	}
> +
> +	ad5823->sd.ctrl_handler = &ad5823->ctrls.handler;
> +	return 0;
> +
> +err_free_handler:
> +	v4l2_ctrl_handler_free(&ad5823->ctrls.handler);
> +	return ret;
> +}
> +
> +static int ad5823_probe(struct i2c_client *client)
> +{
> +	struct ad5823_device *ad5823;
> +	int ret;
> +
> +	ad5823 = devm_kzalloc(&client->dev, sizeof(*ad5823), GFP_KERNEL);
> +	if (!ad5823)
> +		return -ENOMEM;
> +
> +	ad5823->regmap = devm_cci_regmap_init_i2c(client, 8);
> +	if (IS_ERR(ad5823->regmap))
> +		return PTR_ERR(ad5823->regmap);
> +
> +	ad5823->arc_mode = AD5823_ARC_RES1;
> +	ad5823->resonance_period = AD5823_RESONANCE_PERIOD;
> +
> +	/* Optional indication of ARC mode select */
> +	device_property_read_u32(&client->dev, "adi,arc-mode",
> +				 &ad5823->arc_mode);
> +
> +	/* Optional indication of VCM resonance period */
> +	device_property_read_u32(&client->dev, "adi,resonance-period",
> +				 &ad5823->resonance_period);
> +
> +	ad5823->regulator = devm_regulator_get(&client->dev, "vdd");
> +	if (IS_ERR(ad5823->regulator))
> +		return dev_err_probe(&client->dev, PTR_ERR(ad5823->regulator),
> +				     "getting regulator\n");
> +
> +	v4l2_i2c_subdev_init(&ad5823->sd, client, &ad5823_ops);
> +	ad5823->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ad5823->sd.internal_ops = &ad5823_internal_ops;
> +
> +	ret = ad5823_init_controls(ad5823);
> +	if (ret)
> +		return ret;
> +
> +	ret = media_entity_pads_init(&ad5823->sd.entity, 0, NULL);
> +	if (ret < 0)
> +		goto err_free_ctrl_handler;
> +
> +	ad5823->sd.entity.function = MEDIA_ENT_F_LENS;
> +
> +	/*
> +	 * We need the driver to work in the event that pm runtime is disable in
> +	 * the kernel, so power up and verify the chip now. In the event that
> +	 * runtime pm is disabled this will leave the chip on, so that the lens
> +	 * will work.
> +	 */
> +
> +	ret = ad5823_power_up(ad5823, true);

The control handler setup should be run here, too.

> +	if (ret)
> +		goto err_cleanup_media;
> +
> +	pm_runtime_set_active(&client->dev);
> +	pm_runtime_get_noresume(&client->dev);
> +	pm_runtime_enable(&client->dev);
> +
> +	ret = v4l2_async_register_subdev(&ad5823->sd);
> +	if (ret < 0)
> +		goto err_pm_runtime;
> +
> +	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> +	pm_runtime_use_autosuspend(&client->dev);
> +	pm_runtime_put_autosuspend(&client->dev);
> +
> +	return ret;
> +
> +err_pm_runtime:
> +	pm_runtime_disable(&client->dev);
> +	pm_runtime_put_noidle(&client->dev);
> +	ad5823_power_down(ad5823);
> +err_cleanup_media:
> +	media_entity_cleanup(&ad5823->sd.entity);
> +err_free_ctrl_handler:
> +	v4l2_ctrl_handler_free(&ad5823->ctrls.handler);
> +
> +	return ret;
> +}
> +
> +static void ad5823_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ad5823_device *ad5823 =
> +		container_of(sd, struct ad5823_device, sd);

		to_ad5823_device(...);

> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_ctrl_handler_free(&ad5823->ctrls.handler);
> +	media_entity_cleanup(&ad5823->sd.entity);
> +
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		ad5823_power_down(ad5823);
> +	pm_runtime_set_suspended(&client->dev);
> +}
> +
> +static const struct i2c_device_id ad5823_id_table[] = {
> +	{ "ad5823" },

Where is the device used, in a DT or ACPI based system? Or is this to be
used with the IPU bridge?

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ad5823_id_table);
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(ad5823_pm_ops, ad5823_suspend, ad5823_resume,
> +				 NULL);
> +
> +static struct i2c_driver ad5823_i2c_driver = {
> +	.driver = {
> +		.name = "ad5823",
> +		.pm = pm_sleep_ptr(&ad5823_pm_ops),
> +	},
> +	.probe = ad5823_probe,
> +	.remove = ad5823_remove,
> +	.id_table = ad5823_id_table,
> +};
> +module_i2c_driver(ad5823_i2c_driver);
> +
> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
> +MODULE_DESCRIPTION("AD5823 VCM Driver");
> +MODULE_LICENSE("GPL");

-- 
Kind regards,

Sakari Ailus

