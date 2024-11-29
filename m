Return-Path: <linux-media+bounces-22347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 370459DE73C
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 14:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6CED162303
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 13:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB4819DF9E;
	Fri, 29 Nov 2024 13:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XqMskmIU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02BD19C566
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732886667; cv=none; b=OCcRp90idX25d8q7UdB/8oWTc0PlS0a8aPVytXMGbU1v7CGD1LU7ZKIUmaUQHg7+GFmdVMYze7Abn0sfMqj5k0m7ZfZavN+1umCq4F6ko8ljf1/ujN5YScwByfVnnF54ATA9MSgMbbUa6wIdRqL8kwgpGDwrz/vyVF/T6X+7jCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732886667; c=relaxed/simple;
	bh=YeadQdV6/pBwAx2sFjst/HQo7qhi9TxKzvMaTNjw4mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=On8kFJZfhyk1+P4BTqWnzNrtNGjv9/sEeDMRr5q8aCgYAK0rLNIiTPN+57IpC059z//MbyLzc///jQNSwWJRKhrk78+fTmL7skdve3VxV9VvOW3v5ZVfNCfcyqgN62jdvWZU+Az6734tCci4FF71BeurOq13YReSVlUoHRs36go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XqMskmIU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732886666; x=1764422666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YeadQdV6/pBwAx2sFjst/HQo7qhi9TxKzvMaTNjw4mk=;
  b=XqMskmIU31px0tZmtXl1eliwI+/xuKSRPYSUyjNe7sj20E62udwL36ly
   dfBRI0uJE+6rvcQp6NEsEGSca+XarvQIwdlOnIaMblkTAfVyR1rg0MedP
   EEYfvR7KLrg293i9q37JnMzJl02rTxCmLoHNjdv1QG8Sbg3LfgkZuoQ5Y
   Q0x6AucH5b5TYTwCid6Xaqycuio3X+37T0+UjDbyTdhxp6igbBStUzH7m
   meUJ+7HDDSU2rXdql4CEMKoyGduVNDn0iGWgxEyHCTF93/6Pjo/qcoQys
   RB6yAAkGMkoOUmVIOsdCpoJBUxkkxCPnknFAIR0hY2KFBgdeOzBFYP3O9
   A==;
X-CSE-ConnectionGUID: YwxZgyFZSvmaonj5x5Le7w==
X-CSE-MsgGUID: uBlzel2hSS+qsy7sRR5+EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="43793373"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="43793373"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 05:24:25 -0800
X-CSE-ConnectionGUID: FZdSM1kuSkWlO8JNn1Tuzw==
X-CSE-MsgGUID: GC134vsSR1qjSIY8BxkuSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="92597609"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.246.8.237])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 05:24:24 -0800
Date: Fri, 29 Nov 2024 14:24:20 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 4/4] media: ov2740: Add regulator support
Message-ID: <Z0nAhCl8pmaaUF60@linux.intel.com>
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
Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

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
> -- 
> 2.47.0
> 
> 

