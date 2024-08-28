Return-Path: <linux-media+bounces-16995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FFB962204
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 10:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BF971C22A5D
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 08:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DCE15AD83;
	Wed, 28 Aug 2024 08:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9KeYfR7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190B9B67A
	for <linux-media@vger.kernel.org>; Wed, 28 Aug 2024 08:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724832576; cv=none; b=IzdTOMQEUMDuQvJBIP6tFwF7hj11luksijJR0QosHs3WMpNXG999/jZjAjxWsHCs4uFwLp4VJpl1pOAE8BXyemv/QOuO9GbHPWDDQNjPdVT400AGX1ZOire8XB/phm2mK4KDXlQxybMM8qFQwmr7I9j80+sR/DWL8fPXRz+EJ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724832576; c=relaxed/simple;
	bh=+8gZ+NwpOA0nxNDTGCN/zjyXXMBMoxXMsepCUaWvI50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TO2c7P0rC/t/5SIpHIr+G18R/hfgWY9f/HnuYsN5LTghmhdugINg+f5ZBIeHoSHjxo3pr2MN3Ac6BR1ztzkExHR2gcPQzoWRgt2kLoZKrpCMqyFERoM+yd3D+7+1v9cPkipk10YBAv9iUQzz1HO6UxySBLvhcjS4ieJjHNfn4ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9KeYfR7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724832575; x=1756368575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+8gZ+NwpOA0nxNDTGCN/zjyXXMBMoxXMsepCUaWvI50=;
  b=A9KeYfR7hs0qD7XzKrGv+QwbkTEefNHIh5nq7izTz2vUKVVv4kRv3+CQ
   2dRbVizb1YeUIOMHvbbC1Y0QAK0LkjcPdWGoeuZVq2hPoKo6HOV4remuJ
   CLsLsogN5Oqjzecaob64WSnt49Zl8+vxnqZzP5LNgN7UnRvjQuK95KzVg
   1J4e1Dy4TUE2JLpE/GsYEX3UN/NgZrdIGMQf85+NatO8B40jjKvHhxXVY
   69zJTQT3uFjEmwiAbZ++wy3XPEjgWHk5OVIBbjCF5GoUYdL5aNZvxGByt
   h9YDUplAOSRiHHZ1mVGRPqai7STqRRRv9iGPTh6UnEKQlDIdUhZkYcSsX
   w==;
X-CSE-ConnectionGUID: PPbPlVM8SYWU9huZTDqK2w==
X-CSE-MsgGUID: pFiyi5cHQ9+qGCZtKfr4SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23213805"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="23213805"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 01:09:35 -0700
X-CSE-ConnectionGUID: xKFhKdCHSSaL+RK5ILmxaQ==
X-CSE-MsgGUID: TnlqciwqR2WneUpMquX/EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="67513527"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 01:09:33 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 69B3811F95D;
	Wed, 28 Aug 2024 11:09:30 +0300 (EEST)
Date: Wed, 28 Aug 2024 08:09:30 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 6/6] media: i2c: og01a1b: Add management of optional
 sensor supply lines
Message-ID: <Zs7bOr3hbrd2gG60@kekkonen.localdomain>
References: <20240823102731.2240857-1-vladimir.zapolskiy@linaro.org>
 <20240823102731.2240857-7-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240823102731.2240857-7-vladimir.zapolskiy@linaro.org>

Hi Vladimir,

Thanks for the update.

On Fri, Aug 23, 2024 at 01:27:31PM +0300, Vladimir Zapolskiy wrote:
> Omnivision OG01A1B camera sensor is supplied by three power rails,
> if supplies are present as device properties, include them into
> the sensor power up sequence.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/media/i2c/og01a1b.c | 86 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 85 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
> index 90a68201f43f..0150fdd2f424 100644
> --- a/drivers/media/i2c/og01a1b.c
> +++ b/drivers/media/i2c/og01a1b.c
> @@ -9,6 +9,7 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -422,6 +423,9 @@ static const struct og01a1b_mode supported_modes[] = {
>  struct og01a1b {
>  	struct clk *xvclk;
>  	struct gpio_desc *reset_gpio;
> +	struct regulator *avdd;
> +	struct regulator *dovdd;
> +	struct regulator *dvdd;
>  
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
> @@ -982,11 +986,46 @@ static int og01a1b_power_on(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct og01a1b *og01a1b = to_og01a1b(sd);
> +	int ret;
> +
> +	if (og01a1b->avdd) {
> +		ret = regulator_enable(og01a1b->avdd);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (og01a1b->dovdd) {
> +		ret = regulator_enable(og01a1b->dovdd);
> +		if (ret)
> +			goto avdd_disable;
> +	}
> +
> +	if (og01a1b->dvdd) {
> +		ret = regulator_enable(og01a1b->dvdd);
> +		if (ret)
> +			goto dovdd_disable;
> +	}
>  
>  	gpiod_set_value_cansleep(og01a1b->reset_gpio, 0);
>  	usleep_range(USEC_PER_MSEC, 2 * USEC_PER_MSEC);
>  
> -	return clk_prepare_enable(og01a1b->xvclk);
> +	ret = clk_prepare_enable(og01a1b->xvclk);
> +	if (ret)
> +		goto dvdd_disable;

Virtually all sensors require some delay between lifting the reset (which
typically comes after enabling the regulators and the clock) and the first
I²C access. This one appears to require 8192 XCLK cycles.

> +
> +	return 0;
> +
> +dvdd_disable:
> +	if (og01a1b->dvdd)
> +		regulator_disable(og01a1b->dvdd);
> +dovdd_disable:
> +	if (og01a1b->dovdd)
> +		regulator_disable(og01a1b->dovdd);
> +avdd_disable:
> +	if (og01a1b->avdd)
> +		regulator_disable(og01a1b->avdd);
> +
> +	return ret;
>  }
>  
>  static int og01a1b_power_off(struct device *dev)
> @@ -998,6 +1037,15 @@ static int og01a1b_power_off(struct device *dev)
>  
>  	gpiod_set_value_cansleep(og01a1b->reset_gpio, 1);
>  
> +	if (og01a1b->dvdd)
> +		regulator_disable(og01a1b->dvdd);
> +
> +	if (og01a1b->dovdd)
> +		regulator_disable(og01a1b->dovdd);
> +
> +	if (og01a1b->avdd)
> +		regulator_disable(og01a1b->avdd);
> +
>  	return 0;
>  }
>  
> @@ -1045,6 +1093,42 @@ static int og01a1b_probe(struct i2c_client *client)
>  		return PTR_ERR(og01a1b->reset_gpio);
>  	}
>  
> +	og01a1b->avdd = devm_regulator_get_optional(&client->dev, "avdd");
> +	if (IS_ERR(og01a1b->avdd)) {
> +		ret = PTR_ERR(og01a1b->avdd);
> +		if (ret != -ENODEV) {
> +			dev_err_probe(&client->dev, ret,
> +				      "Failed to get 'avdd' regulator\n");
> +			return ret;
> +		}
> +
> +		og01a1b->avdd = NULL;
> +	}
> +
> +	og01a1b->dovdd = devm_regulator_get_optional(&client->dev, "dovdd");
> +	if (IS_ERR(og01a1b->dovdd)) {
> +		ret = PTR_ERR(og01a1b->dovdd);
> +		if (ret != -ENODEV) {
> +			dev_err_probe(&client->dev, ret,
> +				      "Failed to get 'dovdd' regulator\n");
> +			return ret;
> +		}
> +
> +		og01a1b->dovdd = NULL;
> +	}
> +
> +	og01a1b->dvdd = devm_regulator_get_optional(&client->dev, "dvdd");
> +	if (IS_ERR(og01a1b->dvdd)) {
> +		ret = PTR_ERR(og01a1b->dvdd);
> +		if (ret != -ENODEV) {
> +			dev_err_probe(&client->dev, ret,
> +				      "Failed to get 'dvdd' regulator\n");
> +			return ret;
> +		}
> +
> +		og01a1b->dvdd = NULL;
> +	}
> +
>  	/* The sensor must be powered on to read the CHIP_ID register */
>  	ret = og01a1b_power_on(&client->dev);
>  	if (ret)

-- 
Kind regards,

Sakari Ailus

