Return-Path: <linux-media+bounces-25495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E2BA241C8
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 18:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4C297A1AAE
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61331EE7CD;
	Fri, 31 Jan 2025 17:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtOEM78l"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A10853368;
	Fri, 31 Jan 2025 17:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738343942; cv=none; b=VPwiG17Mh3kGF28G+PY3/o1blJvUItSDAZKJ6FyBceiMgX+xfbXC7ockW+/RUJ37EU8QNhE4sbEOa00TthJHFGk2zc1JQvnCDzgFYG3sjvkgqZDzm1Koodx/uCfQaDNxEJV3XiY0JrHxdDoGuFal7joBkLZFoDMNF2oTygaS+NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738343942; c=relaxed/simple;
	bh=8SqP5oc3slazrnkRaZhn0ZvFJesMu90J4yr50Se4p6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OyWD1+ZcmczWMPZBGn2GYhrq+ywyuZgkMT1Ga7zBZmAAUYQrV/ckhOfGxBZEnFjJt0b633G/NvwHocBwKv7BuGUvByimOpDYiv5J9zvYoZ+F/6p4qxTvyYIaDxJ2qm9KslKv1xSYuMjwf3jD75MxwXkD3CpljFnWPAEJyFPzdos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtOEM78l; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738343941; x=1769879941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8SqP5oc3slazrnkRaZhn0ZvFJesMu90J4yr50Se4p6k=;
  b=MtOEM78l8aX00TEvZIWoyJnzenNXPO3tZ2f6dOb1l5Wr6ll1/gGmwcHN
   N+0W+ikduwCREWknKltbicsMhI7JcQMpk0nwkPNuR4g8imlzxi+weq+iU
   WjgTY4C5wvs9C+snsCVtVM1v2yBNIqhb3xwqwwKbrcq1NJxA0qhDs4IVJ
   6zQhWo96abtjUJMkxSr37DHNrniapMH4ghuQdQWMSQdCL2+JvajJNhxPI
   lMrtxK/HWPCIdA4ZrC0lqNY+OXdabqsAx1Tn2qxUCg3dOX2m4zF6ysboo
   F+7tSZCscZk8TVZZfxJpIHH90j0SxboedS8lt/oMSNhCL4K2h5+hZe/10
   A==;
X-CSE-ConnectionGUID: 8nDwo9DESBCvBoajD3iOlQ==
X-CSE-MsgGUID: jl//8fAoRIu19h31+ALx7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="56347067"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="56347067"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 09:19:00 -0800
X-CSE-ConnectionGUID: SBB0QSrnS0mPungUfAjODg==
X-CSE-MsgGUID: brRs/rGAR4ievt6C5GSDFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="140564710"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 09:18:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tdufO-000000071O0-2fME;
	Fri, 31 Jan 2025 19:18:54 +0200
Date: Fri, 31 Jan 2025 19:18:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5 2/3] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
Message-ID: <Z50F_hUKMn3W98ur@smile.fi.intel.com>
References: <20250131120152.1109476-1-sakari.ailus@linux.intel.com>
 <20250131120152.1109476-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131120152.1109476-3-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 31, 2025 at 02:01:51PM +0200, Sakari Ailus wrote:
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
> +		if (*type != int3472_gpio_map[i].type_from)
> +			continue;

> +		if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
> +			continue;

Hmm... But why? It's more natural to test if the device even present before
continue to check the details of the quirk. This order looks suspicious
and unusual. At bare minimum it needs a comment. I.o.w. the Q here is "Why is
the type_from check superior to the device?"

> +		*type = int3472_gpio_map[i].type_to;
> +		*gpio_flags = int3472_gpio_map[i].polarity_low ?
> +			GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
> +		*func = int3472_gpio_map[i].func;
> +		return;
> +	}

-- 
With Best Regards,
Andy Shevchenko



