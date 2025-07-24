Return-Path: <linux-media+bounces-38428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A79B112EA
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 23:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26AD85A1EFC
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 21:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228DF2ECD24;
	Thu, 24 Jul 2025 21:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1AN0Bfc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2CB190664;
	Thu, 24 Jul 2025 21:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753391842; cv=none; b=EI8G9ON6Rjk39w2cs81Cujyo9NP9SSXqemHKkRZTeEXEm0Mdr6luVTd+wkA5eoZ0wZqxTSVZXkHnEWOcglKCyFlJv02hYWEPz8n4ddiZibsuruUh+i/Th+5ePz2jFvOjGZl6Ankf1BmvWmunEkfIC1FRke9rr4FwK61N/JqmuSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753391842; c=relaxed/simple;
	bh=dMcqNpYFvGiOeZS5D2G0TGmeaDlMP7iujjEM/KpLxNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRt4t9dKeKvRy5KGPa2/QxhWQCxcbhwLJo1NYFMhkmVfdWKLxru9kGd8Z0hEhXhf+NH023E8f69n+OWbp2aKWA+wP8AHibVeUL4WSwxGr3hGfTHnVuYJP3LksIHKKDV94C2401gIfOkETyQA5UVEeFxbObJoqWqs40Lid9D6/lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L1AN0Bfc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753391840; x=1784927840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dMcqNpYFvGiOeZS5D2G0TGmeaDlMP7iujjEM/KpLxNw=;
  b=L1AN0Bfc5WBWZ5JqMMR247ovWoYq/MgGF8itmk5dTDcTkrqGibqATONm
   2ZekkY2B5eZuxXRAQnDQMMdKzv7CzTRHUvn4qLY+0E1Lb1LQ1I0SvF/wa
   U9UW8NUEAFooylwgnEE11mKMPsvKX9L4/5IpPqY2Xi5Nr2sv03RbtNkvZ
   neAQruIDherh+vLopc+Kauby3+H1HXOBjfyG3ymzqVghtL8KvLPPmNE6v
   K4JgpOKD+YUzh/fCR7EA/eHRWp/UYW1qP4/gCNYNtAuBa85c1yzTZUVBB
   mRLf2SpMCMQKM7DldbxwrnkGjcpAKrRqjwpt5dQEApIDMbR+bYRaJZR/c
   A==;
X-CSE-ConnectionGUID: K8f+NltiR/SAITs9F7nO4Q==
X-CSE-MsgGUID: CPcFwzFuQwm+oMxjk3KW7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="54937777"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="54937777"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 14:17:17 -0700
X-CSE-ConnectionGUID: mjOlSJpRSXGDgZd6U/FW+w==
X-CSE-MsgGUID: VyuvgU6bRAmNGvEEtJ/jtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="184132675"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 14:17:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uf3JM-00000000fk1-49Uz;
	Fri, 25 Jul 2025 00:17:08 +0300
Date: Fri, 25 Jul 2025 00:17:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hans de Goede <hansg@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] media: i2c: add ov2735 image sensor driver
Message-ID: <aIKi1BkNzNvsf5Tr@smile.fi.intel.com>
References: <20250724104711.18764-1-hardevsinh.palaniya@siliconsignals.io>
 <20250724104711.18764-3-hardevsinh.palaniya@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724104711.18764-3-hardevsinh.palaniya@siliconsignals.io>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 24, 2025 at 04:17:05PM +0530, Hardevsinh Palaniya wrote:
> Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.
> 
> The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an
> active array size of 1920 x 1080.
> 
> The following features are supported:
> - Manual exposure an gain control support
> - vblank/hblank control support
> - Test pattern support control
> - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)

...

>  MAINTAINERS                |    9 +

This should be started as part of patch 1 as in between you will have a
dangling file, which is not recorded in MAINTAINERS.

...

> + * Inspired from ov8858, imx219, imx283 camera drivers

Missing period at the end.

...

> +#include <linux/array_size.h>

+ bitops.h

> +#include <linux/clk.h>
> +#include <linux/container_of.h>
> +#include <linux/delay.h>
> +#include <linux/device/devres.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/units.h>
> +#include <linux/types.h>

> +#include <vdso/time64.h>

We do not include vdso in the (regular) drivers. Use linux/time.h.

...

> +struct ov2735 {
> +	struct device *dev;

Do you need this? Can't it be derived from regmap cci below?

> +	struct regmap *cci;
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;

> +	struct i2c_client *client;

Do you need this?

> +	struct clk *xclk;
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *enable_gpio;
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(ov2735_supply_name)];
> +
> +	/* V4L2 Controls */
> +	struct v4l2_ctrl_handler handler;
> +	struct v4l2_ctrl *link_freq;
> +	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_ctrl *hblank;
> +	struct v4l2_ctrl *vblank;
> +	struct v4l2_ctrl *gain;
> +	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *test_pattern;
> +
> +	u32 link_freq_index;
> +
> +	u8 current_page;
> +	struct mutex page_lock;
> +};

...

> +static int ov2735_page_access(struct ov2735 *ov2735,
> +			      u32 reg, void *val, int *err, bool is_read)
> +{
> +	u8 page = (reg >> CCI_REG_PRIVATE_SHIFT) & 0xff;

' & 0xff' part is redundant.

> +	u32 addr = reg & ~CCI_REG_PRIVATE_MASK;
> +	int ret = 0;

How is this assignment being used?

> +	if (err && *err)
> +		return *err;
> +
> +	mutex_lock(&ov2735->page_lock);
> +
> +	/* Perform page access before read/write */
> +	if (ov2735->current_page != page) {
> +		ret = cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, page, err);
> +		if (ret)
> +			goto err_mutex_unlock;
> +		ov2735->current_page = page;
> +	}
> +
> +	if (is_read)
> +		ret = cci_read(ov2735->cci, addr, (u64 *)val, err);
> +	else
> +		ret = cci_write(ov2735->cci, addr, *(u64 *)val, err);

Do you really need this castings?

> +
> +err_mutex_unlock:
> +	mutex_unlock(&ov2735->page_lock);
> +	return ret;

Hmm... Wouldn't be cleanup.h helpful here?

> +}

...

> +static int ov2735_write(struct ov2735 *ov2735, u32 reg, u64 val, int *err)
> +{
> +	return ov2735_page_access(ov2735, reg, (void *)&val, err, false);

Why casting?

> +}

...

> +static int ov2735_set_pll_ctrl(struct ov2735 *ov2735)
> +{
> +	struct ov2735_pll_parameters *pll_parameters;
> +	u8 pll_ctrl;
> +	u8 pll_outdiv;
> +	int ret = 0;
> +
> +	pll_parameters = &pll_configs[ov2735->link_freq_index];
> +
> +	/* BIT[7]: pll_clk_sel, BIT[6:2]: pll_nc, BIT[1:0]: pll_mc */
> +	pll_ctrl = ((pll_parameters->pll_nc << 2) |
> +		    (pll_parameters->pll_mc << 0)) & OV2735_REG_PLL_ENABLE;

Logically better to wrap like this (yes, I know that it's slightly longer than 80):

	pll_ctrl = ((pll_parameters->pll_nc << 2) | (pll_parameters->pll_mc << 0)) &
		   OV2735_REG_PLL_ENABLE;

> +	pll_outdiv = pll_parameters->pll_outdiv;
> +
> +	ov2735_write(ov2735, OV2735_REG_PLL_CTRL, pll_ctrl, &ret);

> +	ov2735_write(ov2735, OV2735_REG_PLL_OUTDIV, pll_outdiv, &ret);
> +
> +	return ret;
> +}

...

> +	/* Apply format settings. */

> +	/* Apply customized values from user */

Define a single style for one-line comments and use it everywhere consistently.

> +		goto error_power_off;

...

> +	devm_pm_runtime_set_active_enabled(ov2735->dev);
> +	devm_pm_runtime_get_noresume(ov2735->dev);

No error checks? What's the point to use devm and what will happen if the first
fails, for example?

-- 
With Best Regards,
Andy Shevchenko



