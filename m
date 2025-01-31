Return-Path: <linux-media+bounces-25462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1120EA23D5F
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 12:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CF3B18875AC
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 11:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3E11C2DA2;
	Fri, 31 Jan 2025 11:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgDXTjxi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171022AD11;
	Fri, 31 Jan 2025 11:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738324647; cv=none; b=lbOS8BC8cRsJ2SrvfRK831bQYBwnStjUfjd5/9SXw/DWZgcIaXbk2oLnzkoJ7wylO6c99+Nvu2VW9IIHcMtDpH+0cPLBqYY2imQYrRxzAsP2D7nLeZ/dkVbP3z3ttnxcxNgtghmNm2iQrl3DP1pz4vLDIwhgdC+b0bnZeKmruHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738324647; c=relaxed/simple;
	bh=gEyWA6TbHV6a9Dsd1lVIKs7vct7bnRc2quwHIWyF+ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsF5DHb54XUILRaWlDidoOBt2T3AI5OSHIJoHElQhgj3AnAy8Z/qCtX3qvi/jsXip3ffcZXs5lL9qK8MHAEBYDANPTZpwhmu5ztAH/Rd0EDBS27GkpBWXuWWa+dRrWA19vR4QyumN2tPXc6HAzqdrL3vDmGUF+qJQ+8o3UgKVV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WgDXTjxi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738324646; x=1769860646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gEyWA6TbHV6a9Dsd1lVIKs7vct7bnRc2quwHIWyF+ow=;
  b=WgDXTjxim22wpiq+Horsqq5z1v5T634zB4bbYjsulO3+9AlG5gLBGVBN
   gEckPLnVWIDkwYz670bkNJGlJO3M8imTO5gWU6Rxru9jDHqT2b0QxHtfK
   9OQoW2QoRw0gLNq1q63qrBrxzmAVR+NpxTZ6uI1zSGQifO5Z8KtnhANnJ
   DDcDLP7Gk7X9bDG9gguUZoMDTP5y18zsn8Uj2mKh4GtDlPBQ7pC+8ycXE
   ts7fEdw5onT82pWgmsBISOUpU4CU3VdU1ZgO9XRbmNhQ7ufmzvxmLOG10
   tqFV7hmcn/kMFw6mKd1STIBrWL3DObPl25/fjv4lZV+5LdpbDdBRgN6Fc
   A==;
X-CSE-ConnectionGUID: 3RM7QyJ6SgyiIWVRviqwmQ==
X-CSE-MsgGUID: NtUYRsTQTMuHDroWBi6jgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="39049761"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="39049761"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 03:57:25 -0800
X-CSE-ConnectionGUID: 24+6sgXXQzGw71uSNMBFGg==
X-CSE-MsgGUID: F6bCgSmHRwyFxn4YyWTXXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="114607768"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 03:57:23 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 43C6611F7E2;
	Fri, 31 Jan 2025 13:57:20 +0200 (EET)
Date: Fri, 31 Jan 2025 11:57:20 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 2/3] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
Message-ID: <Z5y6oI9Z2ILqwu0B@kekkonen.localdomain>
References: <20250131073707.1082931-1-sakari.ailus@linux.intel.com>
 <20250131073707.1082931-3-sakari.ailus@linux.intel.com>
 <Z5yya8BIK9GBtVEM@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5yya8BIK9GBtVEM@smile.fi.intel.com>

Hi Andy,

On Fri, Jan 31, 2025 at 01:22:19PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 31, 2025 at 09:37:06AM +0200, Sakari Ailus wrote:
> > The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
> > documentation) but the int3472 indiscriminately provides this as a "reset"
> > GPIO to sensor drivers. Take this into account by assigning it as "enable"
> > with active high polarity for INT347E devices, i.e. ov7251. "reset" with
> > active low polarity remains the default GPIO name for other devices.
> 
> ...
> 
> > +static void int3472_get_func_and_polarity(struct acpi_device *adev, u8 *type,
> > +					  const char **func, unsigned long *gpio_flags)
> >  {
> > -	switch (type) {
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(int3472_gpio_map); i++) {
> 
> > +		if (*type != int3472_gpio_map[i].type_from ||
> > +		    !acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
> > +			continue;
> 
> I think in a split form it is easier to read and maintain:
> 
> 		if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
> 			continue;
> 
> 		if (*type != int3472_gpio_map[i].type_from)
> 			continue;

Works for me, with the order reverted. I'll send v5.

> 
> > +		*type = int3472_gpio_map[i].type_to;
> 
> > +		*gpio_flags = int3472_gpio_map[i].polarity_low ?
> > +			GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
> 
> Still can be one line (100 characters). But in this case I have no strong
> preference. Up to Hans.
> 
> > +		*func = int3472_gpio_map[i].func;
> > +		return;
> > +	}
> 

-- 
Regards,

Sakari Ailus

