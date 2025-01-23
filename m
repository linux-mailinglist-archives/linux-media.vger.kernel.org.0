Return-Path: <linux-media+bounces-25192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AF7A1A0AB
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 10:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B03DD3AA86D
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 09:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43AB21BC3F;
	Thu, 23 Jan 2025 09:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMbG7nvZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5FB20C48D;
	Thu, 23 Jan 2025 09:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737623712; cv=none; b=cZ7n/4/hUgvhRT3IvlFk4xHQghipm5ICN8lpSssKSou8m6nyu8oiPUbgCNpHnlcnIbAKpBp6F6Z8Z4PRg4JNjRsFTCAEvXMycr0o+PVW2dBEdagWkbFaqes3R95wfCNpneucVE3YWrBWwTscyXKxNihvSgE/BM4BTJqLNJ3SRFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737623712; c=relaxed/simple;
	bh=br1qOtun5ZYpn6sBRr7pUxADpF7mEIyTMABAtVohy5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhg4lxt+JKVYokEsYiX2yQu/GbdcjA1sKycrVgzsO2Tw1raJmd5KNsZgsMqp62qmt6hQjATnj0QMoDwOgWiSeo4gA3Bhq9EgBXfrSfnvJ3JsXRubHaD5X8tNOxoabFLJtDFsYHPES7HGVdENou/Ss3eydu0ziIZtK+IrUaRb7WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMbG7nvZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737623711; x=1769159711;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=br1qOtun5ZYpn6sBRr7pUxADpF7mEIyTMABAtVohy5Q=;
  b=YMbG7nvZcmvR1f5dtufAg958t1baXihUKr17SUXSBusuHgBOW3X4rVZZ
   qw+3iuxdPQ4ECCpU7jIuAZhzLVo5aFE8xQyE6JK5LYstbQ92WLYeoVOsq
   y8xCQotADYpLj/8o8/OiSiFPEDABXRP0Gf7ujfz44JFxAS37QMlQIHvz/
   +tEOXLmIbvObtRRrKcxI1WWJ7UygA/h9hoBOTIWs2R9d1yC/RQrO52NpR
   AMqEb0iViHizme4SPuvbDO3jdgLzmzdN8/Ckr4wLF+RoI5lDkSyqiRwVf
   kJavU6LeIDO8n6EGGmSJ2adRliH6JqFbmglbKxVdHmuaH5pi/rCRrK/65
   g==;
X-CSE-ConnectionGUID: S1v3PU8mQxWjUwbjWaJiTg==
X-CSE-MsgGUID: 2bUNCV+UQVSAzvupGSvv1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="41779445"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="41779445"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 01:15:01 -0800
X-CSE-ConnectionGUID: B6j0xih2SBK1ET81VpeCEQ==
X-CSE-MsgGUID: ZQajuqpPQsCmg/Eqs4rulA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="107219850"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 01:14:59 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4865711F95E;
	Thu, 23 Jan 2025 11:14:56 +0200 (EET)
Date: Thu, 23 Jan 2025 09:14:56 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 1/1] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
Message-ID: <Z5IIkM1i1MV42uvh@kekkonen.localdomain>
References: <20250122104344.245128-1-sakari.ailus@linux.intel.com>
 <Z5Eh-mX-RiWw9giI@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5Eh-mX-RiWw9giI@smile.fi.intel.com>

Hi Andy,

On Wed, Jan 22, 2025 at 06:51:06PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 22, 2025 at 12:43:44PM +0200, Sakari Ailus wrote:
> > The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
> > documentation) but the int3472 indiscriminately provides this as a "reset"
> > GPIO to sensor drivers. Take this into account by assigning it as "enable"
> > with active high polarity for INT347E devices, i.e. ov7251. "reset" with
> > active low polarity remains the default GPIO name for other devices.
> 
> ...
> 
> > +/**
> > + * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
> > + * sensor driver (as in DT bindings)
> > + * @hid: The ACPI HID of the device without the instance number e.g. i2c-INT347E
> 
> W/o "i2c-" part.
> 
> > + * @type_from: The GPIO type from ACPI ?SDT
> > + * @type_to: The assigned GPIO type, typically same as type_from
> 
> @type_from

Agreed.

> 
> > + * @func: The function, e.g. "enable"
> 
> Should we speak in terms of GPIOLIB, like connection ID ?

That rename should be done in the entire driver probably then. I can post a
patch if Hans agrees, after this one.

> 
> > + * @polarity: GPIO_ACTIVE_{HIGH,LOW}
> 
> Please, avoid using patterns with the defined constants. It's better to have
> this written as
> 
>  * @polarity: One of %GPIO_ACTIVE_HIGH, %GPIO_ACTIVE_LOW

Sounds good.

> 
> > + */
> 
> > +	const char *hid;
> > +	u8 type_from;
> > +	u8 type_to;
> > +	const char *func;
> > +	unsigned int polarity;
> 
> Hmm... In other cases we usually use
> 
> 	bool active_low;
> 
> Can we do the same here?

This goes to the flags field of struct gpiod_lookup. Bool is a poor choice
for that (but u32 isn't correct either). We can put polarity here but pass
GPIO_ACTIVE_{HIGH,LOW} to GPIO_LOOKUP().

Putting polarity before function would same some bytes, too. Hans, any
thoughts?

> 
> > +};
> 
> ...
> 
> > -	int3472_get_func_and_polarity(type, &func, &polarity);
> > +	int3472_get_func_and_polarity(int3472->sensor, &type, &func,
> > +				      &polarity);
> 
> AFAIK, we don't have hard attachment to the 80-[character limit rule, please
> use more room on the previous line.

There's no reason for the line to be above 80 characters.

-- 
Regards,

Sakari Ailus

