Return-Path: <linux-media+bounces-34497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE569AD4FF0
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 11:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64152162339
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 09:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D81263F2D;
	Wed, 11 Jun 2025 09:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ja/yeB9p"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259932236E9;
	Wed, 11 Jun 2025 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634423; cv=none; b=NHNl6qW939PTxz/+esH3mV+YaVYb58+no2g7mLGJ57QCKLM2PbccZgyMNOq3li1/VNYrVRU79iCcNyMp7aQINB2jh2mTqhvJT5yeR+KUA+4zQWM6oJOyW0ere+vyWW1k8XYAPuPkVAzILnst4mH7qikn4ld9funkMc4j38q5muY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634423; c=relaxed/simple;
	bh=94L3NDzk1PuVU6OC22j44uOdZdn4jd8PZe73OGT0oYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FXT72DDeyU6sl0M8bcnF5gl/s+H9CHqfkFjO55RPh7R3YsexTLah+enqYca+MR46roydVqp+uA3uMT7m6lOskw+r2GODAxM1ou6OaH/59qnquCraBWMetlBqZNNZxbLkAKTaq45ZU5kj2GqJPh0mthkOjxdZpfuJX7Et19RQLuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ja/yeB9p; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749634421; x=1781170421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=94L3NDzk1PuVU6OC22j44uOdZdn4jd8PZe73OGT0oYk=;
  b=Ja/yeB9pIa7wx04+fspVRTYe5oUhzDQcYN1CMxhDFTE6cYqycYZU7wO9
   5ob8AITXOK0BFXHs4GHsVvkABb6pieN/rtcZDXaMpWIhfibkiGKPLa4RE
   WmHntFIaPnzVCr8KIMdxoFo+Ui3rYmSMk9gz22v/UI/RNQA1Cli4TiXqy
   qFX2v5Jb/SAVkijDhlX80L1QMUOe7jMfssKdIPkW6WZDl9I88w8bL4YNz
   YWp1XDsPo+uWbIcSqzgZdgiml9UmWl46e3QJKpE/ms0npy5UepbgUqz9+
   Wq6Bnd1UL+Y8Gq4YNowUJSGBwuaAw7hNsZ9bYUxOpmbtGC2xTWpz/xzUC
   w==;
X-CSE-ConnectionGUID: 8CEaoBmURG250XK66JFmPQ==
X-CSE-MsgGUID: Dy5AmAuXQL6lCVJEhazwQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51631265"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="51631265"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 02:33:41 -0700
X-CSE-ConnectionGUID: 7O3v5GAmRVuG4RnS3dqV1Q==
X-CSE-MsgGUID: Mwnx/+5jTDuJ/lSAWJ05lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="147500583"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.148])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 02:33:39 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4833211FBA0;
	Wed, 11 Jun 2025 12:33:36 +0300 (EEST)
Date: Wed, 11 Jun 2025 09:33:36 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH] media: dw9714: add support for powerdown pin
Message-ID: <aElNcDTLEJTcJs2s@kekkonen.localdomain>
References: <20250611-dw9714-sd-v1-1-fb47ef5e736c@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-dw9714-sd-v1-1-fb47ef5e736c@emfend.at>

Hi Matthias,

Thanks for the patch.

On Wed, Jun 11, 2025 at 09:13:33AM +0200, Matthias Fend wrote:
> Add support for the powerdown pin (xSD), which can be used to put the VCM
> driver into power down mode. This is useful, for example, if the VCM
> driver's power supply cannot be controlled.
> The use of the powerdown pin is optional.

Please rewrap. Most editors can do it for you.

> 
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  drivers/media/i2c/Kconfig  |  2 +-
>  drivers/media/i2c/dw9714.c | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index e45ba127069fc0848f1a06ceb789efd3c222c008..e923daeec9c574c5b8c7014b9e83fcbad47866c0 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -748,7 +748,7 @@ config VIDEO_AK7375
>  
>  config VIDEO_DW9714
>  	tristate "DW9714 lens voice coil support"
> -	depends on I2C && VIDEO_DEV
> +	depends on GPIOLIB && I2C && VIDEO_DEV
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select V4L2_ASYNC
> diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
> index 2ddd7daa79e28a2cde915b4173fa27e60d5a2b57..5b78c1848f80bc3e32df13d149f3865ff8defe6e 100644
> --- a/drivers/media/i2c/dw9714.c
> +++ b/drivers/media/i2c/dw9714.c
> @@ -2,6 +2,7 @@
>  // Copyright (c) 2015--2017 Intel Corporation.
>  
>  #include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> @@ -38,6 +39,7 @@ struct dw9714_device {
>  	struct v4l2_subdev sd;
>  	u16 current_val;
>  	struct regulator *vcc;
> +	struct gpio_desc *powerdown_gpio;
>  };
>  
>  static inline struct dw9714_device *to_dw9714_vcm(struct v4l2_ctrl *ctrl)
> @@ -151,11 +153,20 @@ static int dw9714_probe(struct i2c_client *client)
>  	if (IS_ERR(dw9714_dev->vcc))
>  		return PTR_ERR(dw9714_dev->vcc);
>  
> +	dw9714_dev->powerdown_gpio = devm_gpiod_get_optional(&client->dev,
> +							     "powerdown",
> +							     GPIOD_OUT_LOW);
> +	if (IS_ERR(dw9714_dev->powerdown_gpio))
> +		return dev_err_probe(&client->dev,
> +				     PTR_ERR(dw9714_dev->powerdown_gpio),
> +				     "could not get powerdown gpio\n");
> +
>  	rval = regulator_enable(dw9714_dev->vcc);
>  	if (rval < 0) {
>  		dev_err(&client->dev, "failed to enable vcc: %d\n", rval);
>  		return rval;
>  	}
> +	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 0);

This seems to be redundant, you're already setting the GPIO low when
acquiring it. Typically the order is different, though: the regulator is
enabled first. Also related to the following comment.

>  
>  	usleep_range(1000, 2000);
>  
> @@ -185,6 +196,7 @@ static int dw9714_probe(struct i2c_client *client)
>  	return 0;
>  
>  err_cleanup:
> +	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 1);
>  	regulator_disable(dw9714_dev->vcc);

It'd be nice to have a single implementation of the power-on and power-off
sequences. Now there are two.

>  	v4l2_ctrl_handler_free(&dw9714_dev->ctrls_vcm);
>  	media_entity_cleanup(&dw9714_dev->sd.entity);
> @@ -200,6 +212,7 @@ static void dw9714_remove(struct i2c_client *client)
>  
>  	pm_runtime_disable(&client->dev);
>  	if (!pm_runtime_status_suspended(&client->dev)) {
> +		gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 1);
>  		ret = regulator_disable(dw9714_dev->vcc);
>  		if (ret) {
>  			dev_err(&client->dev,
> @@ -234,6 +247,7 @@ static int __maybe_unused dw9714_vcm_suspend(struct device *dev)
>  		usleep_range(DW9714_CTRL_DELAY_US, DW9714_CTRL_DELAY_US + 10);
>  	}
>  
> +	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 1);
>  	ret = regulator_disable(dw9714_dev->vcc);
>  	if (ret)
>  		dev_err(dev, "Failed to disable vcc: %d\n", ret);
> @@ -262,6 +276,8 @@ static int  __maybe_unused dw9714_vcm_resume(struct device *dev)
>  		dev_err(dev, "Failed to enable vcc: %d\n", ret);
>  		return ret;
>  	}
> +	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 0);
> +
>  	usleep_range(1000, 2000);
>  
>  	for (val = dw9714_dev->current_val % DW9714_CTRL_STEPS;
> 

-- 
Regards,

Sakari Ailus

