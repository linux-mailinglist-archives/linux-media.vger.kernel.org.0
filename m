Return-Path: <linux-media+bounces-25042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2DEA17CB6
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 12:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E87E73A2E77
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 11:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA5B1F12F7;
	Tue, 21 Jan 2025 11:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfoE8eNI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4F71B4137;
	Tue, 21 Jan 2025 11:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737457894; cv=none; b=O6Ke2OiL6KB2bl8K2NAX8vARV+cc5kJ8XXn7zxtkxDusicgCV+bDkfYAKgb9r3o457FTHi3pQgkH031IZo31uVyJ0PGYenrQhVriF9mBd1n0tXPfwHNFS9ls7YU4QCF7J7cVK3C7aHFJ5b6X3BlyIlEmbVrQdmA51l8HZxXMzKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737457894; c=relaxed/simple;
	bh=cysbe4FY1tp0bS9+9uTv8FBGhHAHmN0OtDkm1ws2DYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/69CAnLjp/rsd6kVp28schFB6Fc44RIMbThiY3yJPa8yVhmlQZ0qsseOPZsf2U8sBBY4DfhdhCCG4ZKgwHDezqZp9DalsYHcwL3t/eaJVwsdjGzZhO6C0Ys7HF5CzQ+g+nwP429DZtXR42M+hhoYtNNds+voKUa/a72w2D0Vzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfoE8eNI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737457894; x=1768993894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cysbe4FY1tp0bS9+9uTv8FBGhHAHmN0OtDkm1ws2DYw=;
  b=XfoE8eNI8mumJ4nCTJrAkcBwnZnIQj96YWanpxWbdHIsJCFOdj1+4bD6
   8lCz6mFOjrzm91wPJzSsnRhfUoCYOLrcQhISfqi4h9GcJn6o5Hw7NiEhx
   +1oBX2KWSvBCoeE1lC2bM6jAwib8HP92/w+dmVa8ixLQ3DB8xByqr8YQ1
   obWsIUj2Q/2gRUiwOecZU98IW5dwewdUOEw1A5TzCcwAaTGlTP5dIIRqL
   iWIQF5zWDwbLM+3Gq3kXSPqsiMjClYrC/WjR7e6gb6U7RjF/tweDximTg
   RCQhSMe9OQezO4VfIW7Usp2hv9i39MvIMEqO7+WwaMYIiqXZiZF9vgoXt
   g==;
X-CSE-ConnectionGUID: xhFeuIQITlS30fSx5CqXFw==
X-CSE-MsgGUID: SK7w1q+GRyycvqqlTJQELA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="38015849"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="38015849"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 03:11:33 -0800
X-CSE-ConnectionGUID: 1ZqydIITTo2RJG2nu295lQ==
X-CSE-MsgGUID: Byyayb3jTcm4GudZUQbaCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="137614808"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 03:11:31 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7DC7011F944;
	Tue, 21 Jan 2025 13:11:27 +0200 (EET)
Date: Tue, 21 Jan 2025 11:11:27 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/1] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
Message-ID: <Z4-A3znM3sNMA9Li@kekkonen.localdomain>
References: <20250120101743.149169-1-sakari.ailus@linux.intel.com>
 <94978806-e077-4f45-a1a1-f4dd0cf07fad@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94978806-e077-4f45-a1a1-f4dd0cf07fad@redhat.com>

Hi Hans,

Thanks for the review.

On Tue, Jan 21, 2025 at 10:42:41AM +0100, Hans de Goede wrote:
> Hi Sakari,
> 
> On 20-Jan-25 11:17 AM, Sakari Ailus wrote:
> > The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
> > documentation) but the int3472 indiscriminately provides this as a "reset"
> > GPIO to sensor drivers. Take this into account by assigning it as "enable"
> > with active high polarity for INT347E devices, i.e. ov7251.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > since v1:
> > 
> > - Fixed device name string.
> > 
> >  drivers/platform/x86/intel/int3472/discrete.c | 45 ++++++++++++++++---
> >  1 file changed, 40 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> > index d881b2cfcdfc..6404ef1eb4a7 100644
> > --- a/drivers/platform/x86/intel/int3472/discrete.c
> > +++ b/drivers/platform/x86/intel/int3472/discrete.c
> > @@ -122,13 +122,47 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
> >  	return desc;
> >  }
> >  
> > -static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
> > +/**
> > + * struct int3472_reset_gpio_map - Map "reset" GPIO to whatever is expected by
> > + * the sensor driver (as in DT bindings)
> > + * @devname: The name of the device without the instance number e.g. i2c-INT347E
> > + * @func: The function, e.g. "enable"
> > + * @polarity: GPIO_ACTIVE_{HIGH,LOW}
> > + */
> > +static const struct int3472_reset_gpio_map {
> > +	const char *devname;
> 
> Instead of using a devname match this should be changed to using
> proper ACPI HID matching.
> 
> Instead of passing int3472->sensor_name as extra argument to
> int3472_get_func_and_polarity(), pass int3472->sensor which
> is a "struct acpi_device *" and then use e.g. :
> 
> 	acpi_dev_hid_uid_match(int3472->sensor, "INT347E", NULL)
> 
> but then with the new sensor function argument
> 
> > +	const char *func;
> > +	unsigned int polarity;
> > +} int3472_reset_gpio_map[] = {
> > +	{ "i2c-INT347E", "enable", GPIO_ACTIVE_HIGH },
> > +};
> 
> Rather then having a mechanism for just the reset pin, I would prefer
> to be able to remap any type to any type.
> 
> So I would like to see this struct changed to e.g. :
> 
> static struct int3472_gpio_map {
> 	const char *hid;
> 	u8 type_from;
> 	u8 type_to;
> 	const char *func;

I'll place func before the u8 fields for fewer holes.

> 	unsigned int polarity;
> };
> 
> static const struct int3472_gpio_map[] = {
> 	{ "INT347E", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, "enable", GPIO_ACTIVE_HIGH },
> };
> 
> > +
> > +static void int3472_get_func_and_polarity(const char *sensor_name, u8 type,
> 
> And change type to a * here ("u8 *type) so that its contents can be
> overwritten by the mapping code
> 
> > +					  const char **func, u32 *polarity)
> 
> So the new function prototype would become:
> 
> static void int3472_get_func_and_polarity(struct acpi_device *sensor, u8 *type,
> 					  const char **func, u32 *polarity)
> 
> 
> >  {
> 
> and do the for loop here before the (now) "switch (*type)":
> 
> 	for (i = 0; i < ARRAY_SIZE(int3472_gpio_map); i++) {
> 		if (*type != int3472_reset_gpio_map[i].type_from ||
> 		    !acpi_dev_hid_uid_match(sensor, int3472_reset_gpio_map[i].hid, NULL))
> 			continue;
> 
> 		*type = int3472_reset_gpio_map[i].type_to;
> 		*func = int3472_reset_gpio_map[i].func;
> 		*polarity = int3472_reset_gpio_map[i].polarity;
> 		return;
> 	}
> 
> This should give us a lot more flexibility for future mappings.

I'll address these in v3 along with Ilpo's comments.

-- 
Kind regards,

Sakari Ailus

