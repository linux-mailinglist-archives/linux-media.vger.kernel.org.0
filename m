Return-Path: <linux-media+bounces-25158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9A7A196E1
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 17:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2B373AC7D6
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 16:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C001C215048;
	Wed, 22 Jan 2025 16:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4Cnusl5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B021CEAA3;
	Wed, 22 Jan 2025 16:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564673; cv=none; b=iDPtNfrC4ua0bLej/PbAiszKo1kdWb3y2+bMMqosPvHsfwVqP4hZOuxVJCUgQBmcLN9QCfP7E9Uid5MJ1kk1RZVSd74+HA0sLO80G/Hi3zVwyQqj4nFfXnSvd75HVXdUJta7KIB7aU3J1noUI5I6ioVEZ4Un6gBuEhkhxx1f4Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564673; c=relaxed/simple;
	bh=YZF0gXS7Vo7ZUd0U8hikjsStSWyyTZbMnAirh6mKhsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+aSBrxoyd33x3Frn2KTxbZ2ZU6tVacJTuKfkUblVbmcXAfQu6SdiN9P2kg3t47E2RYClNJHoFM2bYiKpFM39Eo33iOWKXbAauS+NPgAtrQ9mnzPWINb2IPZHbyMGqPIJpqm+wvsCV0qFSJ7+eMncoHDXfyfo++5QIEt7y+gUaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4Cnusl5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737564672; x=1769100672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YZF0gXS7Vo7ZUd0U8hikjsStSWyyTZbMnAirh6mKhsI=;
  b=L4Cnusl5fGRwOlmb8sw6cBhrcpWoYNZGktHgeudhNOZNlXBgyi0oC18U
   C5+AomBHiKLFUNhcCk/+KSkIks0go4L/whjXZsB1LqlcrJWDxKuZI4pkQ
   4aFIW95TqYLDUZ/HKp4awo1FPaNxR6P29QkPmvuyemo8NS19NbkmVKiI7
   GCI/CLMIpBuUG8v+SFfosjGDD5JmnSwqsBd6ZuZ5DqrPtWNhbEPoPNSfm
   8AZIOG9RCFiCO2+h3XOmy/oS91q82Is+dWSfQtF35c3GB5/Z00XFqZ1V+
   CzucEpHOQ1aECV07aPcdLFVf0YZu4tvBKnUiESrzMK/KLFyTtXhW6HqLJ
   Q==;
X-CSE-ConnectionGUID: yiFIUHIlRoSSm9EMNL1Q8g==
X-CSE-MsgGUID: EZjGB85kQmyloZUT0ncv6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="48628149"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="48628149"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 08:51:11 -0800
X-CSE-ConnectionGUID: ApLOAvCOTOiw4umRm8G45A==
X-CSE-MsgGUID: WtEiSOH3S5CinIbeULAvGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="107122043"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 08:51:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tadwY-000000048uY-2Ot3;
	Wed, 22 Jan 2025 18:51:06 +0200
Date: Wed, 22 Jan 2025 18:51:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 1/1] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
Message-ID: <Z5Eh-mX-RiWw9giI@smile.fi.intel.com>
References: <20250122104344.245128-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122104344.245128-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jan 22, 2025 at 12:43:44PM +0200, Sakari Ailus wrote:
> The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
> documentation) but the int3472 indiscriminately provides this as a "reset"
> GPIO to sensor drivers. Take this into account by assigning it as "enable"
> with active high polarity for INT347E devices, i.e. ov7251. "reset" with
> active low polarity remains the default GPIO name for other devices.

...

> +/**
> + * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
> + * sensor driver (as in DT bindings)
> + * @hid: The ACPI HID of the device without the instance number e.g. i2c-INT347E

W/o "i2c-" part.

> + * @type_from: The GPIO type from ACPI ?SDT
> + * @type_to: The assigned GPIO type, typically same as type_from

@type_from

> + * @func: The function, e.g. "enable"

Should we speak in terms of GPIOLIB, like connection ID ?

> + * @polarity: GPIO_ACTIVE_{HIGH,LOW}

Please, avoid using patterns with the defined constants. It's better to have
this written as

 * @polarity: One of %GPIO_ACTIVE_HIGH, %GPIO_ACTIVE_LOW

> + */

> +	const char *hid;
> +	u8 type_from;
> +	u8 type_to;
> +	const char *func;
> +	unsigned int polarity;

Hmm... In other cases we usually use

	bool active_low;

Can we do the same here?

> +};

...

> -	int3472_get_func_and_polarity(type, &func, &polarity);
> +	int3472_get_func_and_polarity(int3472->sensor, &type, &func,
> +				      &polarity);

AFAIK, we don't have hard attachment to the 80-[character limit rule, please
use more room on the previous line.

-- 
With Best Regards,
Andy Shevchenko



