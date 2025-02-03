Return-Path: <linux-media+bounces-25528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58719A25380
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12BB9163817
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 08:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769001FBC9B;
	Mon,  3 Feb 2025 08:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlDEbS5q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249D81FA14E;
	Mon,  3 Feb 2025 08:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738569803; cv=none; b=TdPL+8xqPv8fpSF390F/ppqaFNZdvTdC1+1bnETNjZLsCByFLht2zN5WiwKYzxy/Z4gJv0gv7WXtlMeZ5r5lK+0Tqih2rVR0Y4ghre1b/nbYYtUiZmCAc/awjD3wVdJlGeKmr3iegCdWhEdCF75AYTWn5UmNfiMaoLuopA4/oU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738569803; c=relaxed/simple;
	bh=jvqogIBbhR40Bbe4v+7rOKg+WC2MKCVu1NzcZNpZxT0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iCeJJUuj1ph7r3taF8JdzaVRf4CoZIWCbPLM5aCniKRibsCAqk8BqY9PYxM34ePxGICt2BJNNm5PXDIPtYcS0dIF1LN3C5fOHFTASKmpIdWC0ONnWfr9cQu0Ni8yJkwMkXv3YP5MFW9A70cHgDdovIsSr85hieInLoRg3eRE4D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WlDEbS5q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738569803; x=1770105803;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jvqogIBbhR40Bbe4v+7rOKg+WC2MKCVu1NzcZNpZxT0=;
  b=WlDEbS5qUvUprCchkASo312A2RYg9yAD5dZiZ5ARdPWai/RDqfb0/Aww
   1Q3RpTe1B6tiOXCOvKV/0w5OBBJ1Z+J0YH47BlF1CW7sJKEkbuLwh1nPj
   VnbBrDqXKNjX9Yr8H7ohuyAPU6l3fUegB5SR0fFUzJHJqJkcPmhaYiO68
   SiK89c0YXpEDMONfzJjt3EpfTMwkJcpGypaZGV6m3olzJn5BEwIyqzPrl
   PwLuPQfB6hYatiD6bQp5xd/hrFdhCoz2liShKQTiGHN4c/O2RV9+/I1aN
   N4S7DOu3uejIJHVm0xNEavqj3yhc4vbO001HSm2u7UChyOSME3OYnUTH3
   g==;
X-CSE-ConnectionGUID: +u2SWATNRPigi31hdp3GtA==
X-CSE-MsgGUID: wgl3xTbzSeuD5dXclpYpUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="39193404"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39193404"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:03:22 -0800
X-CSE-ConnectionGUID: vcnCWhEqSDCSi/y7/yEHnA==
X-CSE-MsgGUID: tDmpM2RmS2mXwut71ZXa9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="141089496"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.194])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:03:18 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Feb 2025 10:03:14 +0200 (EET)
To: Sakari Ailus <sakari.ailus@linux.intel.com>
cc: Daniel Scally <djrscally@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl, 
    linux-media@vger.kernel.org
Subject: Re: [PATCH v5 2/3] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
In-Reply-To: <20250131120152.1109476-3-sakari.ailus@linux.intel.com>
Message-ID: <86489549-c34c-e6ba-e8f6-c96543d06541@linux.intel.com>
References: <20250131120152.1109476-1-sakari.ailus@linux.intel.com> <20250131120152.1109476-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 31 Jan 2025, Sakari Ailus wrote:

> The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
> documentation) but the int3472 indiscriminately provides this as a "reset"
> GPIO to sensor drivers. Take this into account by assigning it as "enable"
> with active high polarity for INT347E devices, i.e. ov7251. "reset" with
> active low polarity remains the default GPIO name for other devices.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 47 +++++++++++++++++--
>  1 file changed, 43 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 3f7624714869..529ea2d08a21 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -2,6 +2,7 @@
>  /* Author: Dan Scally <djrscally@gmail.com> */
>  
>  #include <linux/acpi.h>
> +#include <linux/array_size.h>
>  #include <linux/bitfield.h>
>  #include <linux/device.h>
>  #include <linux/gpio/consumer.h>
> @@ -122,10 +123,48 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
>  	return desc;
>  }
>  
> -static void int3472_get_func_and_polarity(u8 type, const char **func,
> -					  unsigned long *gpio_flags)
> +/**
> + * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
> + * sensor driver (as in DT bindings)
> + * @hid: The ACPI HID of the device without the instance number e.g. INT347E
> + * @type_from: The GPIO type from ACPI ?SDT
> + * @type_to: The assigned GPIO type, typically same as @type_from
> + * @func: The function, e.g. "enable"
> + * @polarity_low: GPIO_ACTIVE_LOW true if the @polarity_low is true,
> + * GPIO_ACTIVE_HIGH otherwise
> + */
> +struct int3472_gpio_map {
> +	const char *hid;
> +	u8 type_from;
> +	u8 type_to;
> +	bool polarity_low;
> +	const char *func;
> +};
> +
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
> +		if (*type != int3472_gpio_map[i].type_from)
> +			continue;
> +
> +		if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
> +			continue;
> +
> +		*type = int3472_gpio_map[i].type_to;
> +		*gpio_flags = int3472_gpio_map[i].polarity_low ?
> +			GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;

Don't start this continuation line left of = sign unless you really 
really have to do that, and it's not such a case here!

Either put GPIO_ACTIVE_LOW on the first line and align the defines, or 
align the second line as it is with int3472_gpio_map[...].

> +		*func = int3472_gpio_map[i].func;
> +		return;
> +	}
> +
> +	switch (*type) {
>  	case INT3472_GPIO_TYPE_RESET:
>  		*func = "reset";
>  		*gpio_flags = GPIO_ACTIVE_LOW;
> @@ -218,7 +257,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  
>  	type = FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
>  
> -	int3472_get_func_and_polarity(type, &func, &gpio_flags);
> +	int3472_get_func_and_polarity(int3472->sensor, &type, &func, &gpio_flags);
>  
>  	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
>  	if (pin != agpio->pin_table[0])
> 

-- 
 i.


