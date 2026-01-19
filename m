Return-Path: <linux-media+bounces-51045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1708D3A6FA
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 12:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBE00308D4A7
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 11:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7D931352D;
	Mon, 19 Jan 2026 11:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbOQ7WyO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAE4313277;
	Mon, 19 Jan 2026 11:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768822502; cv=none; b=HoQ38A3N9lftEIAtZbOObQpd7O4oP+MTabqY3h2+sM+WXmkUU7bOn4TrgE/b9IVhDrTnBBAJ0dLrW9TqVD4ZdLAzA8MLDc/RCDuPe3c3eiHQSYPb8jYrtEqEPKWE/r1Ezc/rVkmArhHcgMmA0mm88QzbBOiNSLOcdn7mmwBCeNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768822502; c=relaxed/simple;
	bh=PJKbdk0rFgyPsIWdSnlMN+7yOfP4iY73QEHeVHM3Fx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEyz6eoYQLZCgT9J56hKp0ZbAQKYMZONIaewmNmC9Q8bX23SwJaihHBr6N6p+JgLUaidn5MD7QYaH81exAkF1Xo9KHAap5Av0jHZG4+oKjqKoqDHUGiJSvWO8ERQwYdVdbl5mfk8Vz5ePX77wAW+Iq1sGVHi+zndap6o0Lk1z7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbOQ7WyO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768822501; x=1800358501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PJKbdk0rFgyPsIWdSnlMN+7yOfP4iY73QEHeVHM3Fx0=;
  b=fbOQ7WyOFXDjQX6SosV1/iuNJXk5wFYxd7JO6/RqhYAy7/fc+f1/HwES
   MPPlQX+mM1RummS06fHgGaWhJ+RePVgIZoenuJSKI80i+639hfz4mtl/Y
   2amEBoKlxzK9MqMJLa+tcSAlVjUbFX+L5VLcYX/oqFkkgG3GvRsV96gqi
   Q3BoTGwVTgQrhUeAOMnSvhGJumAkh0H9Qrj3MN/y3mczuX2S7pOmRL4nB
   v6C6KTa3vgRvRgt4Vznj1JS0D5y68Coc9UhFzDI9tVF4lt047MiBajjNZ
   lByIcVm7ZdzDcWVrW8nTXQc3msaoX7zhad+IFqgLAWN+2yef3XaXqFAeu
   g==;
X-CSE-ConnectionGUID: +uBqENAMQu6iUuGxW8zXaA==
X-CSE-MsgGUID: Arxovd9VR7C96Jk2StOPPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70195185"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70195185"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 03:34:59 -0800
X-CSE-ConnectionGUID: ww9biOvFT1qhy8NLq+bF8A==
X-CSE-MsgGUID: NilVnCpsSYKxuiYLZfQNJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="206196642"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 03:34:57 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E73B511F765;
	Mon, 19 Jan 2026 13:35:00 +0200 (EET)
Date: Mon, 19 Jan 2026 13:35:00 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: i2c: imx412: fix sensor power-on timing
Message-ID: <aW4W5C6hkNIkzH70@kekkonen.localdomain>
References: <20260119-imx412-v3-0-8b46929af773@oss.qualcomm.com>
 <20260119-imx412-v3-1-8b46929af773@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119-imx412-v3-1-8b46929af773@oss.qualcomm.com>

Hi Wenmeng,

On Mon, Jan 19, 2026 at 06:15:01PM +0800, Wenmeng Liu wrote:
> Assert the reset GPIO at the start of power-on, enable regulators and the
> clock, then deassert reset. This avoids a mismatch where the first
> power-up (when the reset GPIO defaults deasserted) differs from subsequent
> cycles.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  drivers/media/i2c/imx412.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index b3826f80354703b17b416dc233854da3f5736e38..ebc2fb706442365f541540bf4ce9d307d42e0061 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -1022,6 +1022,8 @@ static int imx412_power_on(struct device *dev)
>  	struct imx412 *imx412 = to_imx412(sd);
>  	int ret;
>  
> +	gpiod_set_value_cansleep(imx412->reset_gpio, 1);

I'd assert reset in probe() so you can drop this line.

> +
>  	ret = regulator_bulk_enable(ARRAY_SIZE(imx412_supply_names),
>  				    imx412->supplies);
>  	if (ret < 0) {
> @@ -1029,20 +1031,19 @@ static int imx412_power_on(struct device *dev)
>  		return ret;
>  	}
>  
> -	gpiod_set_value_cansleep(imx412->reset_gpio, 0);
> -
>  	ret = clk_prepare_enable(imx412->inclk);
>  	if (ret) {
>  		dev_err(imx412->dev, "fail to enable inclk\n");
>  		goto error_reset;
>  	}
>  
> +	gpiod_set_value_cansleep(imx412->reset_gpio, 0);
> +
>  	usleep_range(1000, 1200);
>  
>  	return 0;
>  
>  error_reset:
> -	gpiod_set_value_cansleep(imx412->reset_gpio, 1);
>  	regulator_bulk_disable(ARRAY_SIZE(imx412_supply_names),
>  			       imx412->supplies);
>  
> 

-- 
Regards,

Sakari Ailus

