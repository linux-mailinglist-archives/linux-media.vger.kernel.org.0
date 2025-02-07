Return-Path: <linux-media+bounces-25814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ACEA2C72D
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 16:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02E4A18822A3
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 15:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50F223ED69;
	Fri,  7 Feb 2025 15:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkMss3CM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED341EB1B7;
	Fri,  7 Feb 2025 15:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738942248; cv=none; b=NaDQa8kjEh5CnAnfReH0jy0c5IlNXCZ8x21zu3mtzHodW/orEE+9g3ycxfnm5QMoKFPQTKps+5dBw8MEjgldkoP1/oa3sdYRgsUrNhhntSeMXciAkXKK3wC/+KpwSc8e7Xg1FfHO0856H5Db26n3a7lbzaDVNBYNAjtdtAwTzlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738942248; c=relaxed/simple;
	bh=33UvXvLxL9OwUW3HcEGi9jwWfVDI+fdzoULLBVvaa1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XgeaBqgluuVxEfMaWYlsVNbKSwB668Gi6nF/typyX/Pr16gRpg503vMmwjq6N26H4d/UcRO8QZ5+tPIbgZExBVLfoD2WEtClH9v1SF/H5bzJk9c76/wO8DjGmhCyGJMsbvfZWrSDEHoG9crjmrBnDT1j8Poo4w1wyXLO3m/VKYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkMss3CM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738942247; x=1770478247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=33UvXvLxL9OwUW3HcEGi9jwWfVDI+fdzoULLBVvaa1Y=;
  b=ZkMss3CMduaYZWPDZmkuPk0gtQzwkRbRxW8XU869r3UtYk4aWuJmqp6O
   O1cScvE14VULYbtgTPehR6+Dka7ldjcCGhPP/V4aJ6051vLfe7c3RalEp
   TvdnMS10cPwt2cw9CBUBVZAkwfM6jx1xfsAUvJMmTevfPXmHELj6EkUc9
   BlMLBdmRZ7Hos/EaTzHHUOGwB6Bj9+9+VZIUGiN0HUBVYy8LnxbKyYlRb
   5W9whBR1/KzOjJDXtn0wcqAvQxdhhuRdzkB9maMeIw5hyNnTvoHLdCJ69
   hdkD76xp4r9GGUVfKMPeGCd2VZ7DMM0cVx/gzwcn/qIkoMoNESkNE2QTu
   A==;
X-CSE-ConnectionGUID: qfdU2OBhSE2ZgTjDhgP7kw==
X-CSE-MsgGUID: uqG5TzQXRzipCnpmLQKJVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="42427073"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="42427073"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:30:46 -0800
X-CSE-ConnectionGUID: SbOOhTJYSkePUfFim8DKOw==
X-CSE-MsgGUID: AqevHr+ES1+Cbl1dREyWSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="111333749"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:30:44 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tgQJU-000000097ZY-1CZV;
	Fri, 07 Feb 2025 17:30:40 +0200
Date: Fri, 7 Feb 2025 17:30:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v6 2/3] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
Message-ID: <Z6YnIJWmZpjolOda@smile.fi.intel.com>
References: <20250207134126.1769183-1-sakari.ailus@linux.intel.com>
 <20250207134126.1769183-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207134126.1769183-3-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 07, 2025 at 03:41:25PM +0200, Sakari Ailus wrote:
> The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
> documentation) but the int3472 indiscriminately provides this as a "reset"
> GPIO to sensor drivers. Take this into account by assigning it as "enable"
> with active high polarity for INT347E devices, i.e. ov7251. "reset" with
> active low polarity remains the default GPIO name for other devices.

...

> +static const struct int3472_gpio_map int3472_gpio_map[] = {
> +	{ "INT347E", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, false, "enable" },
> +};
> +
> +static void int3472_get_func_and_polarity(struct acpi_device *adev, u8 *type,
> +					  const char **func, unsigned long *gpio_flags)
>  {
> -	switch (type) {
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(int3472_gpio_map); i++) {
> +		/*
> +		 * Map the firmware-provided GPIO to whatever a driver expects
> +		 * (as in DT bindings). First check if the requested GPIO name

What name?

> +		 * matches the GPIO map, then see that the device _HID matches.
> +		 */
> +		if (*type != int3472_gpio_map[i].type_from)
> +			continue;
> +
> +		if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
> +			continue;

I still think this is unusual and confusing order of checks.

At the end, it is up to the PDx86 maintainers.

> +		*type = int3472_gpio_map[i].type_to;
> +		*gpio_flags = int3472_gpio_map[i].polarity_low ?
> +			      GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
> +		*func = int3472_gpio_map[i].func;
> +		return;
> +	}

-- 
With Best Regards,
Andy Shevchenko



