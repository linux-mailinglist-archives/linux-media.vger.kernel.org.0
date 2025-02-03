Return-Path: <linux-media+bounces-25529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F0BA25448
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59BCC1885927
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 08:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2EE1FBEA3;
	Mon,  3 Feb 2025 08:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nW7/c8LH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00FD78F5D;
	Mon,  3 Feb 2025 08:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570848; cv=none; b=JeS/V8qNjBG1sLL9P7LgtJ0d6UPouNy0Vlmq40jnJuPGhAcxShzeMsX1FIXlse6wI6XmuECzTXC75jg/I9cEJoSWQTMqHk+0aof5+GRniPDXp3mm8lJfMqNiZZ1YflldAXFiDZCd/qdiXhTkc+8TFGR+G4TLFQjE1aMlbBYubvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570848; c=relaxed/simple;
	bh=kZTnVYWcxne2ZyXeYLX31cj4QTOxhh+PBQgVbn5v+i4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfJDO5+KnKA50kO9yuXrBBSemdRicRAwrKONNs89dKpWleBJfAQcduh1x+LlvJ31FcbIAh91a093w4mC2fPvmosCUJpj8G9/jbtzAyveRWp7r6SXDWs0XAMM3SxF2SybOokFXRfjiL7qLQeDQBCq8CUISgA31Ryzf52M0QAA0mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nW7/c8LH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738570847; x=1770106847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kZTnVYWcxne2ZyXeYLX31cj4QTOxhh+PBQgVbn5v+i4=;
  b=nW7/c8LHhWEVbTNV6awIkqFpIYDNcZDvz3S6E0KDIX5nEXeDGwd2eTV2
   cf6lSm7Ngu+9z8V3Us6OYS0QKPEnpSKuRM0kZrBNNKi6ldAWbIo0GGipG
   r4UuhYpJXGQ2EmgMBDKxk4XVfG0h1cTV3Oqz71XzP2aO8LAfzpLboiQ0+
   8jIsH1yNs+6suGiqad7JUcGmvi0Camac4nMwQMd4O1pl0r+gke/L5o7hk
   OgcX0PA8uAMcK1mljUzKZjGDk4DFuKff7iDKRz2u0uromN/lm7WOeBRcp
   WVFXtoRn18HdKgfJssg4Jmw414SJ/niWkwQybD4AuqQS6nBDyVxqkULlV
   g==;
X-CSE-ConnectionGUID: Hh5sLmLuRwiVNO/PVHkzvA==
X-CSE-MsgGUID: 7oA9l3/7Qj6HtMRLQYmJdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49710890"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="49710890"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:20:46 -0800
X-CSE-ConnectionGUID: gmonul/4Tie6ueTqLbO2nA==
X-CSE-MsgGUID: of4KRHd8QqCB1WUSfUUF+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115234059"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:20:44 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2163511F9C3;
	Mon,  3 Feb 2025 10:20:41 +0200 (EET)
Date: Mon, 3 Feb 2025 08:20:41 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5 2/3] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
Message-ID: <Z6B8WWwNwxS42ARa@kekkonen.localdomain>
References: <20250131120152.1109476-1-sakari.ailus@linux.intel.com>
 <20250131120152.1109476-3-sakari.ailus@linux.intel.com>
 <86489549-c34c-e6ba-e8f6-c96543d06541@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86489549-c34c-e6ba-e8f6-c96543d06541@linux.intel.com>

Hi Ilpo,

On Mon, Feb 03, 2025 at 10:03:14AM +0200, Ilpo Järvinen wrote:
> On Fri, 31 Jan 2025, Sakari Ailus wrote:
> 
> > The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
> > documentation) but the int3472 indiscriminately provides this as a "reset"
> > GPIO to sensor drivers. Take this into account by assigning it as "enable"
> > with active high polarity for INT347E devices, i.e. ov7251. "reset" with
> > active low polarity remains the default GPIO name for other devices.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/platform/x86/intel/int3472/discrete.c | 47 +++++++++++++++++--
> >  1 file changed, 43 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> > index 3f7624714869..529ea2d08a21 100644
> > --- a/drivers/platform/x86/intel/int3472/discrete.c
> > +++ b/drivers/platform/x86/intel/int3472/discrete.c
> > @@ -2,6 +2,7 @@
> >  /* Author: Dan Scally <djrscally@gmail.com> */
> >  
> >  #include <linux/acpi.h>
> > +#include <linux/array_size.h>
> >  #include <linux/bitfield.h>
> >  #include <linux/device.h>
> >  #include <linux/gpio/consumer.h>
> > @@ -122,10 +123,48 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
> >  	return desc;
> >  }
> >  
> > -static void int3472_get_func_and_polarity(u8 type, const char **func,
> > -					  unsigned long *gpio_flags)
> > +/**
> > + * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
> > + * sensor driver (as in DT bindings)
> > + * @hid: The ACPI HID of the device without the instance number e.g. INT347E
> > + * @type_from: The GPIO type from ACPI ?SDT
> > + * @type_to: The assigned GPIO type, typically same as @type_from
> > + * @func: The function, e.g. "enable"
> > + * @polarity_low: GPIO_ACTIVE_LOW true if the @polarity_low is true,
> > + * GPIO_ACTIVE_HIGH otherwise
> > + */
> > +struct int3472_gpio_map {
> > +	const char *hid;
> > +	u8 type_from;
> > +	u8 type_to;
> > +	bool polarity_low;
> > +	const char *func;
> > +};
> > +
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
> > +		if (*type != int3472_gpio_map[i].type_from)
> > +			continue;
> > +
> > +		if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
> > +			continue;
> > +
> > +		*type = int3472_gpio_map[i].type_to;
> > +		*gpio_flags = int3472_gpio_map[i].polarity_low ?
> > +			GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
> 
> Don't start this continuation line left of = sign unless you really 
> really have to do that, and it's not such a case here!

Why? The documentation says the subsequent lines should be aligned
"substantially" (I believe a tab stop qualifies), except in cases of
arguments in parentheses just right of the opening parenthesis but that's
not the case here.

I can submit v6 with that if others agree.

> 
> Either put GPIO_ACTIVE_LOW on the first line and align the defines, or 
> align the second line as it is with int3472_gpio_map[...].
> 
> > +		*func = int3472_gpio_map[i].func;
> > +		return;
> > +	}
> > +
> > +	switch (*type) {
> >  	case INT3472_GPIO_TYPE_RESET:
> >  		*func = "reset";
> >  		*gpio_flags = GPIO_ACTIVE_LOW;
> > @@ -218,7 +257,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
> >  
> >  	type = FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
> >  
> > -	int3472_get_func_and_polarity(type, &func, &gpio_flags);
> > +	int3472_get_func_and_polarity(int3472->sensor, &type, &func, &gpio_flags);
> >  
> >  	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
> >  	if (pin != agpio->pin_table[0])
> > 

-- 
Regards,

Sakari Ailus

