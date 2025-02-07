Return-Path: <linux-media+bounces-25822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38812A2CD7D
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 21:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 813E816DAF5
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 20:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94EE21BCA0A;
	Fri,  7 Feb 2025 20:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEVWRcY7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E361B415C;
	Fri,  7 Feb 2025 20:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738958584; cv=none; b=G1HtTS0qbWfAkBFouX7bAHpqC7O5AOtwfTM5O6xNIScTsPRs3Zk+37d9CJgnHaUJ7t30l7qDN7oXihAg3Y/H/1tZaHiciskTzSFkUJ9vPety618vHqWlz+J2AU2L21gCgzAD6y2tJJWl5s0nVRZ35KVF36xkUTkz8IG/bfbtvqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738958584; c=relaxed/simple;
	bh=u4zVraTyuGvK4Z0Swz4Xx8h7XQdjp7S93iHbSrvP6S8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMCrLErMrj7Oa0ps6AklNFNpEBAcwTY8XcW8u5+JnPQbhIrj97x4LCFKL+iHO8LNSekLWfTA1kVd5NFyISADiX4BHgaHbG/TBhPqYElhhH730CvLZa026dJIsJGaLkGdrqf7o9A2aWPBfAzM9Jc2/8rA0ksrSBHLVKyW/gdfN1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEVWRcY7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738958582; x=1770494582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u4zVraTyuGvK4Z0Swz4Xx8h7XQdjp7S93iHbSrvP6S8=;
  b=SEVWRcY7HBlu0P03FpBV/ABBT3WeYOg5kOOVIUaFvp1eE9tZuAKT1h2x
   FlKcaRO3151zjoH5LLaUsI6stzFhmDCXy9jbnXmLNVxaxbsidES+EMLV5
   KpX9tWNS/S3c1Awnf8OORs2wNMeCiuBJsjoKB117L/AJtCR1IbC3P2cpM
   qIP9rZj1vSbyQac8v9WVCA2fXkOtlVHCvp5b7+Ax1r/UZetQpXIJv6/3z
   eHshRYOHCixh/If0RZcNT+7XFAXpmwApzVlVRdDI4oD3anwNk4F/8gEkW
   Zab8DFmCaaSS28RnJh/sWwRnJDPbcxef4MPr93HJHQxHC7/1aLOqpPfyY
   A==;
X-CSE-ConnectionGUID: r0/AzyEJTGGbL1cfLhdkVw==
X-CSE-MsgGUID: 66RPgvYIQ2yf4Ic5EQ8Zlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39765567"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="39765567"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 12:03:01 -0800
X-CSE-ConnectionGUID: Bdxix+M2QL6AZzVjEoTyLw==
X-CSE-MsgGUID: nlp2W7G7Saelv/jbYxT6iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="111831783"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 12:02:59 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E21BB1202DE;
	Fri,  7 Feb 2025 22:02:56 +0200 (EET)
Date: Fri, 7 Feb 2025 20:02:56 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v6 2/3] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
Message-ID: <Z6Zm8GaCqIZe27Nt@kekkonen.localdomain>
References: <20250207134126.1769183-1-sakari.ailus@linux.intel.com>
 <20250207134126.1769183-3-sakari.ailus@linux.intel.com>
 <Z6YnIJWmZpjolOda@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6YnIJWmZpjolOda@smile.fi.intel.com>

Hi Andy,

On Fri, Feb 07, 2025 at 05:30:40PM +0200, Andy Shevchenko wrote:
> On Fri, Feb 07, 2025 at 03:41:25PM +0200, Sakari Ailus wrote:
> > The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
> > documentation) but the int3472 indiscriminately provides this as a "reset"
> > GPIO to sensor drivers. Take this into account by assigning it as "enable"
> > with active high polarity for INT347E devices, i.e. ov7251. "reset" with
> > active low polarity remains the default GPIO name for other devices.
> 
> ...
> 
> > +static const struct int3472_gpio_map int3472_gpio_map[] = {
> > +	{ "INT347E", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, false, "enable" },
> > +};
> > +
> > +static void int3472_get_func_and_polarity(struct acpi_device *adev, u8 *type,
> > +					  const char **func, unsigned long *gpio_flags)
> >  {
> > -	switch (type) {
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(int3472_gpio_map); i++) {
> > +		/*
> > +		 * Map the firmware-provided GPIO to whatever a driver expects
> > +		 * (as in DT bindings). First check if the requested GPIO name
> 
> What name?

Right, I was accidentally thinking of a driver here. How about:

Map the firmware-provided GPIO type to whatever a driver expects (as in DT
bindings). First check if the type matches with the GPIO map, then further
check that the device _HID matches.

> 
> > +		 * matches the GPIO map, then see that the device _HID matches.
> > +		 */
> > +		if (*type != int3472_gpio_map[i].type_from)
> > +			continue;
> > +
> > +		if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
> > +			continue;
> 
> I still think this is unusual and confusing order of checks.
> 
> At the end, it is up to the PDx86 maintainers.
> 
> > +		*type = int3472_gpio_map[i].type_to;
> > +		*gpio_flags = int3472_gpio_map[i].polarity_low ?
> > +			      GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
> > +		*func = int3472_gpio_map[i].func;
> > +		return;
> > +	}
> 

-- 
Regards,

Sakari Ailus

