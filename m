Return-Path: <linux-media+bounces-25031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E737A17909
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 09:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAC191888301
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 08:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85B01B4144;
	Tue, 21 Jan 2025 08:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqMqaoNh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4149145A18;
	Tue, 21 Jan 2025 08:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737446892; cv=none; b=Aiboi4O3PQmrIlbVsT+d1u3RDSJ151Aa5wECSpWqaLILqH62RHTs84Y7LYfE/YMs0whRQZFRZ2RhlC9XfdhrWceGSBFdRKxwAzEm95shH5VmzzmIKpBm1axuQd9sAdIpcc3guRvVuprIa6v3/aVm/B0675gZQzsVRr/ptNNzfs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737446892; c=relaxed/simple;
	bh=aJ2FEae0DsJ9CLKWDDjP0hPV86k/8doVrHoGYQw4lHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ex/cCQMkAL89VU/Vu6B8IffUET18pxKnNp0joDGTB+mDVNNOaM6iCJFQflpbCuufltekFURvbQKbfrk5yWYpGedoAD3E4W80pXaacOFlOSgyrldvO3GLjUuRn4+1wXFWcIX1+7kSIwrIKF0BurHzG/zohYrp7T0D+ovylHPwGdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqMqaoNh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737446890; x=1768982890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aJ2FEae0DsJ9CLKWDDjP0hPV86k/8doVrHoGYQw4lHw=;
  b=hqMqaoNhfplN97oelQmC1zsx9K4C+JhC/9MmzcoSgiWBGshRkBN/4FTC
   XF1T/vbgdpPLOVXyJIppmbxgg3d5T7wH1Jvs9G4U0L5UzHH3ZeLUFPc2K
   SvX0NthRPppeDZITVTrLcDvBpjnfaA9P/ftJ/iAh0bQVkOIB/wrrbzdYr
   m/ZC6fLK4Tw7QKCbuQcC/6ykMsQxXyJBHD+oQCAEss+al/WaW+7OwzqaM
   wGHLktMXIpJbxSMGNv4pgISfovLDvm21WSr0QZL50ko4kJWCajeOY4bI2
   xIMB4kbrQymDWlGkY4VHXv4MXrC4LtVtcgD4xI1d4wRBp2SEJR8pdfTUV
   g==;
X-CSE-ConnectionGUID: uBcnKJrDRiW6GkJR4f3feA==
X-CSE-MsgGUID: j0WVgMWSRQS0NpIMjInEBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="41522564"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="41522564"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 00:08:09 -0800
X-CSE-ConnectionGUID: EcGLROX3RlWkzgXJtLNgew==
X-CSE-MsgGUID: iH59jZNsTyOZ564+ic+7hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111348871"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 00:08:07 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4676511F944;
	Tue, 21 Jan 2025 10:08:04 +0200 (EET)
Date: Tue, 21 Jan 2025 08:08:04 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
	hverkuil@xs4all.nl
Subject: Re: [PATCH v2 1/1] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
Message-ID: <Z49V5CqEt6H96LvJ@kekkonen.localdomain>
References: <20250120101743.149169-1-sakari.ailus@linux.intel.com>
 <06b5f424-52a5-4397-9d37-cbb628b98bb8@redhat.com>
 <Z45b03w7EV37yBeS@kekkonen.localdomain>
 <20dddcb7-2a5f-4af9-8169-4934aa91f55e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20dddcb7-2a5f-4af9-8169-4934aa91f55e@redhat.com>

Hi Hans,

On Mon, Jan 20, 2025 at 04:08:45PM +0100, Hans de Goede wrote:
> Hi Sakari,
> 
> On 20-Jan-25 3:21 PM, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Mon, Jan 20, 2025 at 02:39:39PM +0100, Hans de Goede wrote:
> >> Hi Sakari,
> >>
> >> On 20-Jan-25 11:17 AM, Sakari Ailus wrote:
> >>> The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
> >>> documentation) but the int3472 indiscriminately provides this as a "reset"
> >>> GPIO to sensor drivers. Take this into account by assigning it as "enable"
> >>> with active high polarity for INT347E devices, i.e. ov7251.
> >>>
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>
> >> Sorry but no this won't fly. If we go this route the amount of
> >> quirk code in the int3472 driver is going to get out of control.
> >>
> >> Since you are matching this mapping on the sensor-type, this
> >> should be handled in sensor specific code, IOW in the sensor driver.
> >>
> >> Also see my reply on the linux-media list here:
> >>
> >> https://lore.kernel.org/linux-media/0a0b765e-b342-4433-9c6c-07da78f0f63b@redhat.com/
> >>
> >> Sorry but I have to hard nack this. There has to be some line
> >> where the pdx86 glue code stops bending over backwards and
> >> where some of the burden of supporting more then just devicetree
> >> moves to the sensor drivers.
> >>
> >> *especially* since this mapping is going to be different per sensor-driver,
> >> with there being *no consistency at all* in the GPIO/pin names used in
> >> the sensor drivers just looking at drivers/media/i2c/ov*.c I see all of:
> > 
> > I beg you to reconsider as I have to disagree with your assessment, for the
> > following reasons:
> > 
> > The "reset" naming used by the int3472 driver comes from the int3472 driver
> > / Windows specific ACPI amendments, not from the ACPI standard nor sensor
> > datasheets.
> 
> Yet looking at the datasheet it is a more correct name then "enable".

Possibly in this instance, but whether it is or not is still besides the
point: this may not be the name on the datasheet.

> 
> > Also in a proper ACPI implementation we wouldn't be dealing
> > with such GPIOs at all, instead this would simply work through ACPI power
> > resources.
> 
> GPIOs being handles as ACPI power-resources is not something which is
> typically done.
> 
> This was actually done correct for the atomisp devices, clks and regulators
> are power-resources there, but the GPIOs are listed as plain ACPI GPIO
> resources under the sensor ACPI-fwnode. And ACPI GPIO resources do not
> have a name/label only an index. So drivers which need GPIOs and want 
> to work on ACPI platforms need an index -> label map, see for example:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/input/touchscreen/goodix.c#n811
> 
> note how this is handled in the driver, and is not expected to be
> handled by some platform specific code.

The power resources do contain GPIO handling when it is required for
implementing the device's power on / off sequences. FWIW, on Chromebooks
this "just works" without the IPU bridge and without .

> 
> > There generally isn't a single datasheet name used for such signals across
> > sensor vendors (or even sensors from a single vendor). Thus the assumption
> > made in the int3472 driver isn't correct, even if DT bindings were using
> > the vendor-provided GPIO signal name from datasheets as-is.
> > 
> > We've done quite a bit of work to make the system firmware (including
> > design differences or outright bugs) invisible to the drivers elsewhere, I
> > don't see why we should make an exception here. To add to that, mapping the
> > GPIO name / function to what the driver expects is trivially done in the
> > int3472 driver, as this patch shows.
> 
> IMHO it is not so trivial done, you are assuming a 1:1 mapping for all
> laptop/tablet models this is not necessarily true. E.g. on atomisp tablets
> there typically is a standard camera connector with both reset and powerdown
> signals and the atomisp _DSM equivalent of the INT3472 GPIO map _DSM
> typically contains both signals. But on sensors with only 1 reset pin
> it is unclear which of the 2 is actually used. One model camera module
> with sensor X may connect the sensor's single xshutdown pin to
> the powerdown signal on the standard camera connector, while another
> camera module may use the reset signal on the standard connector.
> 
> There are 2 ways to handle this:
> 
> 1. Make the driver deal with the fact that there may be 2 GPIOs,
> treating both as optional and driving both low/high at the same time
> since only 1 will actually be used. This is somewhat ugly on the driver
> side, but then fixes things for all tablets/laptops out there using
> this sensor model.
> 
> 2. Make this the platform glue's problem and require the platform code
> to have per laptop/tablet model quirks using DMI matching meaning that
> instead of things just working OOTB for models not added to the quirk
> table, we now need users to report an issue and then manually fix
> that for every model under the sun. Which is very much sub optimal.

In our case here there's really no difference DMI-wise, is there? In both
cases the GPIO handling is determined based on the device. Besides, my
patch is technically better in the sense that it is explicitly using an
existing firmware interface instead of adding driver support for a firmware
interface that doesn't exist (neither as a firmware interface definition
nor an implementation of one).

> 
> See e.g.:
> 
> https://github.com/jwrdegoede/linux-sunxi/commit/e43be8f19b5913a2e4bd715e7eef88fd909a2d1d

I guess we don't have DT bindings for a (virtual) device that would allow
controlling one or more actual GPIOs using a single virtual one?

> 
> (which I have not posted upstream yet since I don't have the mt9m114
> driver working on atomisp models yet)
> 
> I foresee similar problems with the INT3472 stuff. On Andy's device
> we need to map reset to enable, but maybe next time it is powerdown ?
> 
> Multiply these kinda per laptop/tablet model issues by the amount
> of different sensors which there are and this becomes a big 
> mess of per-sensor + per-laptop-model quirks in the int3472 code,
> where as these things can typically be handled reasonable well
> inside the sensor driver.

Again, I don't want to add DMI checks in client drivers if that can
be reasonably handled elsewhere.

> 
> > The naming used in Devicetree bindings is an ABI, we cannot change that.
> 
> Right and Andy's patch does not try to change, nor break the ABI,
> Andy's patch merely adds a fallback to look for a "reset" pin if
> there is no "enable" pin which is nice and simple and clean and
> really not much of a burden to carry inside the sensor driver.
> 
> Drivers outside of drivers/media/i2c have much bigger kludges to
> deal with interfacing with ACPI tables.

That may well be. One of the reasons we have tried to avoid this in drivers
is that a large portion of any driver's code would consist of handling
firmware interface differences if we didn't. And most of that code would be
quite buggy.

Proving the point: the patch inverting GPIO polarity in a driver based on
the GPIO's name is much more complicated (a practice I'd expect to spread
across some number of drivers) than centrally connecting what int3472 digs
from Windows specific ACPI tables to what a sensor driver expects. Now, I'm
not claiming this will be always an easier, cleaner or even possible way to
do things but in this case it is IMHO.

> 
> > For drivers it's an authoritative reference, even if the naming is not
> > aligned with hardware datasheets. DT binding authors are within their
> > rights in naming things differently form datasheets, too. I object drivers
> > having to assume GPIO naming imposed by the int3472 driver when it
> > conflicts with the naming (and functionality) used in DT bindings. Camera
> > sensors are a bit special as they require less trivial resources (GPIOs,
> > regulators and clocks) than most other devices while they are similarly
> > used in both DT and ACPI based systems.
> >   
> >>
> >> "enable"
> >> "powerdown"
> >> "pwdn"
> >> "reset"
> >> "resetb"
> >> "Camera power"
> >> "Camera reset"
> >>
> >> being used. Given this total lack of consistent pin naming this really
> >> needs to be fixed in the sensor drivers.
> > 
> > FWIW, the int3472 driver uses "power-enable" for a GPIO that powers on a
> > device. Do you expect drivers to support that as-is? Currently the int3472
> > driver appears to be the only one using that string in the kernel.
> 
> Finding that pin actually results in the INT3472 code registering
> an avdd regulator, not a GPIO lookup, in this case the "power-enable"
> label is something purely internal to the INT3472 code.

Many sensors also have a power-down GPIO control besides reset.

> 
> This is all part of the INT3472 code already bending itself over
> backwards to make things "invisible to the drivers" but IMHO we
> need to draw the line somewhere.
> 
> For me the main reason for saying no to this is that it is
> a per sensor thing and we already have a place to handle
> per sensor things and that is in the sensor driver.
> 
> I've not seen any convincing arguments from you why this
> sensor specific handling does not belong in the sensor
> specific driver code.

Let's try to discuss today where that code lands on #linux-media, and
hopefully each some conclusion.

> 
> Regards,
> 
> Hans
> 
> 
> 
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
> >>> +	const char *func;
> >>> +	unsigned int polarity;
> >>> +} int3472_reset_gpio_map[] = {
> >>> +	{ "i2c-INT347E", "enable", GPIO_ACTIVE_HIGH },
> >>> +};
> >>> +
> >>> +static void int3472_get_func_and_polarity(const char *sensor_name, u8 type,
> >>> +					  const char **func, u32 *polarity)
> >>>  {
> >>>  	switch (type) {
> >>> -	case INT3472_GPIO_TYPE_RESET:
> >>> -		*func = "reset";
> >>> -		*polarity = GPIO_ACTIVE_LOW;
> >>> +	case INT3472_GPIO_TYPE_RESET: {
> >>> +		const struct int3472_reset_gpio_map *map = NULL;
> >>> +		unsigned int i;
> >>> +
> >>> +		for (i = 0; i < ARRAY_SIZE(int3472_reset_gpio_map); i++) {
> >>> +			if (strncmp(sensor_name, int3472_reset_gpio_map[i].devname,
> >>> +				    strlen(int3472_reset_gpio_map[i].devname)))
> >>> +				continue;
> >>> +
> >>> +			map = &int3472_reset_gpio_map[i];
> >>> +			break;
> >>> +		}
> >>> +
> >>> +		if (map) {
> >>> +			*func = map->func;
> >>> +			*polarity = map->polarity;
> >>> +		} else {
> >>> +			*func = "reset";
> >>> +			*polarity = GPIO_ACTIVE_LOW;
> >>> +		}
> >>>  		break;
> >>> +	}
> >>>  	case INT3472_GPIO_TYPE_POWERDOWN:
> >>>  		*func = "powerdown";
> >>>  		*polarity = GPIO_ACTIVE_LOW;
> >>> @@ -217,7 +251,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
> >>>  
> >>>  	type = FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
> >>>  
> >>> -	int3472_get_func_and_polarity(type, &func, &polarity);
> >>> +	int3472_get_func_and_polarity(int3472->sensor_name, type, &func,
> >>> +				      &polarity);
> >>>  
> >>>  	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
> >>>  	if (pin != agpio->pin_table[0])
> >>
> > 
> 

-- 
Kind regards,

Sakari Ailus

