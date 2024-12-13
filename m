Return-Path: <linux-media+bounces-23359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A459F072A
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 10:04:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35B3C188B7FA
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 09:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F65A1A01BE;
	Fri, 13 Dec 2024 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hO81pcGS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE6C187849
	for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734080663; cv=none; b=F5+F8K7wZHG3Ce4CpFkoPBbFfhmpmEOTcPHPlLLrnNWk/PRPxQoL79Qdz1VC/cP3cCP7MZ3IUDLeQe/ixQS2iCy3yIYUCZ67fAU5V0JIeHC/sWYb+wXwE6zXkhQVwHGJmDxfZaG49GvvvQJt7s2X4U+m9g//+IB3u2fbPegWoy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734080663; c=relaxed/simple;
	bh=3TOCyj+/rB93VtSYfw+yV0SE1aANQV82QMO9ws39g9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0C8lMUcjH2zCTiAu9hcZnFbvmuymmrlR6k3ZCKO6n4/7XyLbtBEBRV0ua7wYUPoiaCC5AjZ+drOlb5rICln69OJfLuXp4gLbOV60e8ixYL2nKuDTlXuL0E+t1Yutp9mcGf+ccfnFMFwAn3UN97CwsgZ1ZtcMWpiYyhXqd7M3es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hO81pcGS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734080662; x=1765616662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3TOCyj+/rB93VtSYfw+yV0SE1aANQV82QMO9ws39g9w=;
  b=hO81pcGSUooc23wpatb72QSBa8j53dNuMyyB8Q4tRc5u7Mvjb1iQRjnh
   E1bHya9CCWeu932WJ786CEfmQmKWcM1PCrxgiOBWTyVGu65hLP+Ta5+Ze
   aYX813UQ81vKA7A5NssGiPX+VywsNXpUZE9OV/O9R2x8XBaOY0+exXnsZ
   HF86A6Q0MGmBkP5jtnD1frg7+0KH3vYA1Yg78+LOBqE4jiQlcEE/q5T+P
   3uHXBYueDws6PQG7bj8/0wZVsvQX62Ig5rv8ehxMu81mtQaB6o9oGM29a
   hR+g0G5tlpcJHRCmhHeXMrJX2c6MS7xJ9edxgs6zPtjBu7AmooqPjDb5N
   w==;
X-CSE-ConnectionGUID: ScO1yXaDQuyeWuJFgO4qwA==
X-CSE-MsgGUID: Nmt9tDmrShWgPQhDRMaeGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34659810"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="34659810"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 01:04:21 -0800
X-CSE-ConnectionGUID: 8gjTiqypQMecapICctTmZg==
X-CSE-MsgGUID: n20oiTfZSrahQOIlsSaMUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133863136"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 01:04:19 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2AF6812034A;
	Fri, 13 Dec 2024 11:04:17 +0200 (EET)
Date: Fri, 13 Dec 2024 09:04:17 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 4/4] media: ov2740: Add regulator support
Message-ID: <Z1v4kRgTtWbi8u6r@kekkonen.localdomain>
References: <20241128152338.4583-1-hdegoede@redhat.com>
 <20241128152338.4583-5-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128152338.4583-5-hdegoede@redhat.com>

Hi Hans,

Thanks for the set.

On Thu, Nov 28, 2024 at 04:23:38PM +0100, Hans de Goede wrote:
> On some designs the regulators for the AVDD / DOVDD / DVDD power rails
> are controlled by Linux.
> 
> Add support to the driver for getting regulators for these 3 rails and
> for enabling these regulators when necessary.
> 
> The datasheet specifies a delay of 0ns between enabling the regulators,
> IOW they can all 3 be enabled at the same time. This allows using the bulk
> regulator API.
> 
> The regulator core will provide dummy regulators for the 3 power-rails
> when necessary.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov2740.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 14d0a0588cc2..c766c1f83e12 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -11,6 +11,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/nvmem-provider.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -76,6 +77,14 @@
>  /* OTP registers from sensor */
>  #define OV2740_REG_OTP_CUSTOMER		0x7010
>  
> +static const char * const ov2740_supply_name[] = {
> +	"AVDD",
> +	"DOVDD",
> +	"DVDD",
> +};
> +
> +#define OV2740_NUM_SUPPLIES ARRAY_SIZE(ov2740_supply_name)
> +
>  struct nvm_data {
>  	struct nvmem_device *nvmem;
>  	struct regmap *regmap;
> @@ -523,10 +532,11 @@ struct ov2740 {
>  	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *exposure;
>  
> -	/* GPIOs, clocks */
> +	/* GPIOs, clocks, regulators */
>  	struct gpio_desc *reset_gpio;
>  	struct gpio_desc *powerdown_gpio;
>  	struct clk *clk;
> +	struct regulator_bulk_data supplies[OV2740_NUM_SUPPLIES];

This would be cleaner with plain ARRAY_SIZE(). Same below. I.e. the macro
is redundant.

>  
>  	/* Current mode */
>  	const struct ov2740_mode *cur_mode;
> @@ -1309,6 +1319,7 @@ static int ov2740_suspend(struct device *dev)
>  	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
>  	gpiod_set_value_cansleep(ov2740->powerdown_gpio, 1);
>  	clk_disable_unprepare(ov2740->clk);
> +	regulator_bulk_disable(OV2740_NUM_SUPPLIES, ov2740->supplies);
>  	return 0;
>  }
>  
> @@ -1318,10 +1329,16 @@ static int ov2740_resume(struct device *dev)
>  	struct ov2740 *ov2740 = to_ov2740(sd);
>  	int ret;
>  
> -	ret = clk_prepare_enable(ov2740->clk);
> +	ret = regulator_bulk_enable(OV2740_NUM_SUPPLIES, ov2740->supplies);
>  	if (ret)
>  		return ret;
>  
> +	ret = clk_prepare_enable(ov2740->clk);
> +	if (ret) {
> +		regulator_bulk_disable(OV2740_NUM_SUPPLIES, ov2740->supplies);
> +		return ret;
> +	}
> +
>  	gpiod_set_value_cansleep(ov2740->powerdown_gpio, 0);
>  	gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
>  	msleep(20);
> @@ -1334,7 +1351,7 @@ static int ov2740_probe(struct i2c_client *client)
>  	struct device *dev = &client->dev;
>  	struct ov2740 *ov2740;
>  	bool full_power;
> -	int ret;
> +	int i, ret;

unsigned int i

>  
>  	ov2740 = devm_kzalloc(&client->dev, sizeof(*ov2740), GFP_KERNEL);
>  	if (!ov2740)
> @@ -1372,6 +1389,13 @@ static int ov2740_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(ov2740->clk),
>  				     "failed to get clock\n");
>  
> +	for (i = 0; i < OV2740_NUM_SUPPLIES; i++)
> +		ov2740->supplies[i].supply = ov2740_supply_name[i];
> +
> +	ret = devm_regulator_bulk_get(dev, OV2740_NUM_SUPPLIES, ov2740->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> +
>  	full_power = acpi_dev_state_d0(&client->dev);
>  	if (full_power) {
>  		/* ACPI does not always clear the reset GPIO / enable the clock */

-- 
Kind regards,

Sakari Ailus

