Return-Path: <linux-media+bounces-25052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AFAA17EEE
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 14:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B42D93A868D
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 13:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB711F2C30;
	Tue, 21 Jan 2025 13:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IX4fh/SG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9241E4113;
	Tue, 21 Jan 2025 13:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737466525; cv=none; b=SPJCepVOtZ0GlKGY1Epha8I2eQ2AHmJu4UxJm730ouLp1K4BWsHnxIlW4cKKiuH3VedsX7ygxIXn+nm0ikXoco0cEPIYMJ+0VFxpeHMFJW/EEIu+/BIaC4jKejPaH2/pqfPoiZU7ovKT1NDYFSOWgMmnTIEgTBIfiJSRtr8rksg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737466525; c=relaxed/simple;
	bh=g0/quh0+pmOTi4h4XfHkMkXIn6nb+LX133mtkl+KEXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k5/xOVr95y/Uk96nCzX1XwI0c6e5q7p9p3gITIjccKjb1WSYBQ1/AlUlND1N3rmda8FlotQKLq8BRSo23foOBeDyWZ6sW5SMdu/7mp9CC0xavVhoPtefqQV8tGOsnP0/RlNjAKgxZuY1e41FZ6ROIMdYgECDHgBaAGqfbffVssI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IX4fh/SG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737466524; x=1769002524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g0/quh0+pmOTi4h4XfHkMkXIn6nb+LX133mtkl+KEXA=;
  b=IX4fh/SGDGeGhgEzWyCy8Brf4G0fNhb906ONaUhn8TtgxJmhtgF5+5uH
   hCxOLBMI7JlYXl4oVvYX+h1d90CoCLuqVQ/OtkQF9iN7iycnm5fKK/xn8
   JQC0E23jixNFKMuQ+R9cAJpiiBSgzMYWA0obG3DY8zduD34ztZVAaQ375
   hMkBMJIoH4utdL2+Ra8ZuBGzZKgtvvVvEQlwvV005ta11atqM0NnULdQJ
   OcekPAEsg2gUXeQSEU+n1RCYeVBx4FkXhlSqMYdtpjpwP3apdnz011Vy/
   ItI3c9Ai7JFoi4roEkn3wCC6DWzZ8XmDTISy9nI75SbfDV7XUmA7zFNrI
   A==;
X-CSE-ConnectionGUID: SgxsvmYATbuIqv6gSqjIPA==
X-CSE-MsgGUID: I7RWQ+2pQU+T/w1jnMS/xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38122199"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="38122199"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 05:35:23 -0800
X-CSE-ConnectionGUID: wYI0ik/mTcmbgckRTAr+aQ==
X-CSE-MsgGUID: u9lP8NESRXy54BhZ6+H28g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="106819960"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 05:35:20 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F054911F944;
	Tue, 21 Jan 2025 15:35:17 +0200 (EET)
Date: Tue, 21 Jan 2025 13:35:17 +0000
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
Message-ID: <Z4-ilZz5Lv_o90_K@kekkonen.localdomain>
References: <20250120101743.149169-1-sakari.ailus@linux.intel.com>
 <94978806-e077-4f45-a1a1-f4dd0cf07fad@redhat.com>
 <Z4-A3znM3sNMA9Li@kekkonen.localdomain>
 <5e786433-326d-4f81-a93c-2c1819a4b6db@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e786433-326d-4f81-a93c-2c1819a4b6db@redhat.com>

Hi Hans,

On Tue, Jan 21, 2025 at 01:35:49PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 21-Jan-25 12:11 PM, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > Thanks for the review.
> > 
> > On Tue, Jan 21, 2025 at 10:42:41AM +0100, Hans de Goede wrote:
> >> Hi Sakari,
> >>
> >> On 20-Jan-25 11:17 AM, Sakari Ailus wrote:
> >>> The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
> >>> documentation) but the int3472 indiscriminately provides this as a "reset"
> >>> GPIO to sensor drivers. Take this into account by assigning it as "enable"
> >>> with active high polarity for INT347E devices, i.e. ov7251.
> >>>
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> ---
> >>> since v1:
> >>>
> >>> - Fixed device name string.
> >>>
> >>>  drivers/platform/x86/intel/int3472/discrete.c | 45 ++++++++++++++++---
> >>>  1 file changed, 40 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> >>> index d881b2cfcdfc..6404ef1eb4a7 100644
> >>> --- a/drivers/platform/x86/intel/int3472/discrete.c
> >>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> >>> @@ -122,13 +122,47 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
> >>>  	return desc;
> >>>  }
> >>>  
> >>> -static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
> >>> +/**
> >>> + * struct int3472_reset_gpio_map - Map "reset" GPIO to whatever is expected by
> >>> + * the sensor driver (as in DT bindings)
> >>> + * @devname: The name of the device without the instance number e.g. i2c-INT347E
> >>> + * @func: The function, e.g. "enable"
> >>> + * @polarity: GPIO_ACTIVE_{HIGH,LOW}
> >>> + */
> >>> +static const struct int3472_reset_gpio_map {
> >>> +	const char *devname;
> >>
> >> Instead of using a devname match this should be changed to using
> >> proper ACPI HID matching.
> >>
> >> Instead of passing int3472->sensor_name as extra argument to
> >> int3472_get_func_and_polarity(), pass int3472->sensor which
> >> is a "struct acpi_device *" and then use e.g. :
> >>
> >> 	acpi_dev_hid_uid_match(int3472->sensor, "INT347E", NULL)
> >>
> >> but then with the new sensor function argument
> >>
> >>> +	const char *func;
> >>> +	unsigned int polarity;
> >>> +} int3472_reset_gpio_map[] = {
> >>> +	{ "i2c-INT347E", "enable", GPIO_ACTIVE_HIGH },
> >>> +};
> >>
> >> Rather then having a mechanism for just the reset pin, I would prefer
> >> to be able to remap any type to any type.
> >>
> >> So I would like to see this struct changed to e.g. :
> >>
> >> static struct int3472_gpio_map {
> >> 	const char *hid;
> >> 	u8 type_from;
> >> 	u8 type_to;
> >> 	const char *func;
> > 
> > I'll place func before the u8 fields for fewer holes.
> 
> Hmm, by itself that is a good idea, but ...
>  
> >> 	unsigned int polarity;
> >> };
> >>
> >> static const struct int3472_gpio_map[] = {
> >> 	{ "INT347E", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, "enable", GPIO_ACTIVE_HIGH },
> 
> ... that changes this line from the above to:
> 
>  	{ "INT347E", "enable", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, GPIO_ACTIVE_HIGH },
> 
> which IMHO is slightly less logical/readable. I would like to keep
> the ACPI-hid and the type_from next to each other. So I have a slight
> preference for keeping things as I suggested.

Works for me.

-- 
Sakari Ailus

