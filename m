Return-Path: <linux-media+bounces-42226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E0CB51B21
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 17:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 671381899FD3
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 15:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94182D0C9D;
	Wed, 10 Sep 2025 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caZLGcFl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86354288CA6;
	Wed, 10 Sep 2025 15:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757516969; cv=none; b=lNYw0BCKEwlQfLIYeGmJr6wXiIbmMaY/OXSklMDmAZ9RhN5jd5FyrHIt/YqrMokamwXeRhMIJsQ4oSNmxmCGUwsVHxLrN8dZhzaXWkCTksE/DCnqgA3O0O3zhQCrJhrvu1I9tThWdRbc0HPvDgLf0V2//R3gtKTYLqmqjgYgFmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757516969; c=relaxed/simple;
	bh=wawCm47tQJBctrLsLUW7QnEXOAxd4ujDxpv0UNB7h38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oh6VlN/Q+sgNmHfc9pH7AALwChUv8XrAx0lj/3IjGO2+C0h9orghGlIJ09OCsGMH8/0gCTTt3Ixl4qU8e8knPfRcMYugkyxhNN8gtpfAp+cinzH8Zd0eWI7h9uIu2NAKqceOGJZgXqRp+wB9IcM8/TN6FiPz8waSHVzbLZ7tG0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caZLGcFl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757516968; x=1789052968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wawCm47tQJBctrLsLUW7QnEXOAxd4ujDxpv0UNB7h38=;
  b=caZLGcFlyIZnfoUAlYQeku0fvPlm6tXeOKUYv+aIE/aBl0atxDdMsrUV
   QMddD2ADJ1rirPyGjvW8PVYMYXVfxCVnq0DpRkGgxOpgTNyScV2Ka5xTo
   yQJ/f+un6ZbG65hMgxpaFMsap2Pz+7daNn5+5JUKGI8Z1psl5Senx7VaT
   VSuRnnf0zMZis3ICpduHZ/CkKpNqvZqyq6M768SQH6LcGQGCasN/mcmgY
   jyf6yA1LqAn8F2TP+dU3UYaj4ETcFhRDkBIvZ4YdUTzvkZUX9u45clYmS
   lcpW1grAE+b8VVLoMfSEDWchpTpfrUjFUrSg+kLfXqHe3SFOUk0sn/x/F
   Q==;
X-CSE-ConnectionGUID: JihdRDf/SdaGoBgL8PYF2g==
X-CSE-MsgGUID: UBYYc7U/RBKQmHGwIj9+1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59906634"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="59906634"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 08:09:27 -0700
X-CSE-ConnectionGUID: 6H1iWBa7S4K3AUOFEg4AZA==
X-CSE-MsgGUID: kDJnGkHHS9OCcgobw9oQBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="210537380"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 08:09:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A57CE1201B4;
	Wed, 10 Sep 2025 18:09:21 +0300 (EEST)
Date: Wed, 10 Sep 2025 18:09:21 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Martin Hecht <mhecht73@gmail.com>
Cc: linux-media@vger.kernel.org, michael.roeder@avnet.eu,
	martin.hecht@avnet.eu, Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: alvium: Accelerated alvium_set_power
Message-ID: <aMGUoQMGZ12oBnpa@kekkonen.localdomain>
References: <20250909112252.2577949-1-mhecht73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909112252.2577949-1-mhecht73@gmail.com>

Hi Martin,

On Tue, Sep 09, 2025 at 01:22:51PM +0200, Martin Hecht wrote:
> Now alvium_set_power tests if Alvium is up and running already
> instead of waiting for the period of a full reboot. This safes
> about 5-7 seconds delay for each connected camera what is already
> booted especially when using multiple Alvium cameras or using
> camera arrays.
> The new function alvium_check is used by read_poll_timeout to check
> whether a camera is connected on I2C and if it responds already.
> 
> Signed-off-by: Martin Hecht <mhecht73@gmail.com>
> ---
> v2:
> - added alvium_check to be used by read_poll_timeout as
>   suggested by Sakari
> ---
>  drivers/media/i2c/alvium-csi2.c | 32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
> index 5c1bab574394..c63af96d3b31 100644
> --- a/drivers/media/i2c/alvium-csi2.c
> +++ b/drivers/media/i2c/alvium-csi2.c
> @@ -443,10 +443,8 @@ static int alvium_is_alive(struct alvium_dev *alvium)
>  
>  	alvium_read(alvium, REG_BCRM_MINOR_VERSION_R, &bcrm, &ret);
>  	alvium_read(alvium, REG_BCRM_HEARTBEAT_RW, &hbeat, &ret);
> -	if (ret)
> -		return ret;
>  
> -	return hbeat;
> +	return ret;
>  }
>  
>  static void alvium_print_avail_mipi_fmt(struct alvium_dev *alvium)
> @@ -2364,8 +2362,25 @@ static int alvium_get_dt_data(struct alvium_dev *alvium)
>  	return -EINVAL;
>  }
>  
> +static int alvium_check(struct alvium_dev *alvium, u64 *bcrm_major)
> +{
> +	struct device *dev = &alvium->i2c_client->dev;
> +	int ret = 0;

No need to assign ret here.

> +
> +	ret = alvium_read(alvium, REG_BCRM_MAJOR_VERSION_R, bcrm_major, NULL);
> +

No need for an empty line here.

But see below...

> +	if (ret)
> +		return ret;
> +
> +	if (*bcrm_major != 0)
> +		return 0;
> +
> +	return -ENODEV;
> +}
> +
>  static int alvium_set_power(struct alvium_dev *alvium, bool on)
>  {
> +	u64 bcrm_major = 0;
>  	int ret;
>  
>  	if (!on)
> @@ -2375,9 +2390,12 @@ static int alvium_set_power(struct alvium_dev *alvium, bool on)
>  	if (ret)
>  		return ret;
>  
> -	/* alvium boot time 7s */
> -	msleep(7000);
> -	return 0;
> +	/* alvium boot time is up to 7.5s but test if its available already */
> +	read_poll_timeout(alvium_check, bcrm_major, (bcrm_major == 0),
> +		250000, 7500000, false,
> +		alvium, &bcrm_major);

I presume bcrm_major needs to be non-zero to proceed rather than zero?

I think you could also do:

	read_poll_timeout(alvium_read, ret, !ret && brcm_major, 250000, 7500000,
			  false, alvium, REG_BCRM_MAJOR_VERSION_R, bcrm_major,
			  NULL);

	return ret ?: brcm_major ? 0 : -ENODEV;

> +
> +	return ret;
>  }
>  
>  static int alvium_runtime_resume(struct device *dev)
> @@ -2442,7 +2460,7 @@ static int alvium_probe(struct i2c_client *client)
>  	if (ret)
>  		goto err_powerdown;
>  
> -	if (!alvium_is_alive(alvium)) {
> +	if (alvium_is_alive(alvium)) {

If you prefer to change this, then I'd assign the return value to ret, as
returned by alvium_read() and use it as the error code here, too. But this
should be a separate patch.

>  		ret = -ENODEV;
>  		dev_err_probe(dev, ret, "Device detection failed\n");
>  		goto err_powerdown;

-- 
Kind regards,

Sakari Ailus

