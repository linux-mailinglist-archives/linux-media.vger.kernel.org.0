Return-Path: <linux-media+bounces-25459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A123A23CD0
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 12:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC8E43A5BE8
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 11:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C091BFDFC;
	Fri, 31 Jan 2025 11:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMdEVcTW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5841BD4E5;
	Fri, 31 Jan 2025 11:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322546; cv=none; b=i256s6rPCe4RZNNQlnNWmXd8PfaVnMKmj7TtewH/SbhM1C6px0bEttK7u2qr+tViVgodiJzuoZ2hB9HaKeB5m7EXFOgyyHh9DFjAPf0AQYvk3fNJGH4kXMsLHOaArdh4M3k+h8B4TLbDhCveP9LJ+/J6n+n4QlBQSmLEcLRikZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322546; c=relaxed/simple;
	bh=+aNDvopup7SOQ9DkcO0GAXvXgjlKI20T9Nmv76XHuGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3qI6TI94NhIYLsibtwvv2agTz09nAxSjmKcuKRSfV+BQ6yXBm+J3ZAu3NziZp6N8b9+e6kc83XisdPInBSIoWMwyA6fx8oawY2UhwWkPoO/5LVEidiKKKmniablOhZjzQJB9+DkEeM9RgQaWx4uGPWVdIngx8r+UOneY1Eof5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMdEVcTW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738322545; x=1769858545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+aNDvopup7SOQ9DkcO0GAXvXgjlKI20T9Nmv76XHuGU=;
  b=KMdEVcTW84mzMm5S1O1SrrPlTW/4WFEjbOWHgtI73KXmXeOR2CAuDnBB
   ij9Lrq59oT2b/M0/cViO6HSO9QMu3jBc7eBoMjn8zzwWnmpCZeMcwUYwa
   0S4Jzu0bTlcUucDX//qZDUbW4zgXA8PtMVzlcOrXTr2g0NH/7KTICW28W
   qdb/stDQ4NgICj46pB5LKWubVhTTOZQ5/NA6Lwmx3inoq+WQavFqDhUU7
   43eiNAMbV8RbbfmrcwY55Kz+WVqrgI8YK2Fp4sMgaRMDa6P3WyxZImPOb
   eGAJPWFXPnFAkD/32VGk6vKXM58oKORN5dXk4NikKMa83Qpgwdu2ddrL5
   w==;
X-CSE-ConnectionGUID: WEoDvUNcTAmF8aFE1Ta7gw==
X-CSE-MsgGUID: bsMz3GxETYy5sIbj0dwheQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="50273914"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="50273914"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 03:22:24 -0800
X-CSE-ConnectionGUID: CoJJaMNbTUilyDNtdOuO6g==
X-CSE-MsgGUID: mqODEGIiS86rVQ0wnOBzPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113628313"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 03:22:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tdp6J-00000006wxE-2BFB;
	Fri, 31 Jan 2025 13:22:19 +0200
Date: Fri, 31 Jan 2025 13:22:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 2/3] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
Message-ID: <Z5yya8BIK9GBtVEM@smile.fi.intel.com>
References: <20250131073707.1082931-1-sakari.ailus@linux.intel.com>
 <20250131073707.1082931-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131073707.1082931-3-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 31, 2025 at 09:37:06AM +0200, Sakari Ailus wrote:
> The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
> documentation) but the int3472 indiscriminately provides this as a "reset"
> GPIO to sensor drivers. Take this into account by assigning it as "enable"
> with active high polarity for INT347E devices, i.e. ov7251. "reset" with
> active low polarity remains the default GPIO name for other devices.

...

> +static void int3472_get_func_and_polarity(struct acpi_device *adev, u8 *type,
> +					  const char **func, unsigned long *gpio_flags)
>  {
> -	switch (type) {
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(int3472_gpio_map); i++) {

> +		if (*type != int3472_gpio_map[i].type_from ||
> +		    !acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
> +			continue;

I think in a split form it is easier to read and maintain:

		if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
			continue;

		if (*type != int3472_gpio_map[i].type_from)
			continue;

> +		*type = int3472_gpio_map[i].type_to;

> +		*gpio_flags = int3472_gpio_map[i].polarity_low ?
> +			GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;

Still can be one line (100 characters). But in this case I have no strong
preference. Up to Hans.

> +		*func = int3472_gpio_map[i].func;
> +		return;
> +	}

-- 
With Best Regards,
Andy Shevchenko



