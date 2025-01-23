Return-Path: <linux-media+bounces-25197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D409A1A22C
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 11:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADE02188DDEB
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 10:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BEB420DD7E;
	Thu, 23 Jan 2025 10:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VkFFdcJc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2451C1CAA75;
	Thu, 23 Jan 2025 10:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737629262; cv=none; b=UrNOGBUuBtdFRww1lTRppJlcY0ponEqAe8OQBtUXvURBGc3vX8w6xwILVONgUKhWJhG9pOvPvCMvSdJYw9PIMFRvUz8d9sB3WKgl3f2+4xuNJCaqf64baaPqkC/Hbgz4kuae5R8uxwlj2sQGZ7kWQYKm27RIuqB37HwIM64IIJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737629262; c=relaxed/simple;
	bh=rYqOtU5oiT/GISXaL4/15iZ56RIPpVSZYDj0zuQOxCA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=toa5M1HZ0TXrHVSKllKjXqNBV0xkqF8eoRX88BiHaJk2pLvuNEnCwNwsExU8B7azR0Qz8EPec9DXWjWxsobVcaLhypgDcI8iiLRB7Qw9rN1wQqPCqutri3TjHnRSCoTk2cPiqUGafKhWVyd4hmkicWmLo8Nh4rUncxmNOl9UUaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VkFFdcJc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737629260; x=1769165260;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rYqOtU5oiT/GISXaL4/15iZ56RIPpVSZYDj0zuQOxCA=;
  b=VkFFdcJcHL25Fro7Qbcis+PPxc1KQzqlaMiqlJa6Jajh+lw3pCcVvect
   cv+1yhzVXF/vAtF7NT+9OE+NOgjYpPw5r1pfD5DyhckGqOAujFV0bkHaw
   aLMnHEh9blZWoa1BnJIFVZsuKKW7wS8UPV2alLKz/bSqql6fGE9Bq5zl8
   5y7V0viUvz0swIhiOvLlfW+98e1Qig1C6kkPzmmMLUdPH47dQjLic7vcH
   hODcnIlW5Yp0j4P3RPeAD02iiUu6ko9GG9IYairzau0TlVawl/QwpWJxO
   hKvkOuOgL7ArEafo7M18EVeznQTKtRlYsKkhuFbLc7hlhQsz6nX9D5EsH
   w==;
X-CSE-ConnectionGUID: N8XaZSqzToiO1VJzasQNQg==
X-CSE-MsgGUID: PHwrcOjkQoGs8bNRWHd2iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38285972"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="38285972"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 02:47:39 -0800
X-CSE-ConnectionGUID: bOC92L0NRMmb7yJAVvZRPA==
X-CSE-MsgGUID: xGA1PJBCS7utL99cp3jviQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="112417012"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.22])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 02:47:37 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 23 Jan 2025 12:47:34 +0200 (EET)
To: Sakari Ailus <sakari.ailus@linux.intel.com>
cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Daniel Scally <djrscally@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
    hverkuil@xs4all.nl, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 1/1] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
In-Reply-To: <Z5IIkM1i1MV42uvh@kekkonen.localdomain>
Message-ID: <279b9682-ac78-bfa0-6e2f-08a22f76d867@linux.intel.com>
References: <20250122104344.245128-1-sakari.ailus@linux.intel.com> <Z5Eh-mX-RiWw9giI@smile.fi.intel.com> <Z5IIkM1i1MV42uvh@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Jan 2025, Sakari Ailus wrote:

> Hi Andy,
> 
> On Wed, Jan 22, 2025 at 06:51:06PM +0200, Andy Shevchenko wrote:
> > On Wed, Jan 22, 2025 at 12:43:44PM +0200, Sakari Ailus wrote:
> > > The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
> > > documentation) but the int3472 indiscriminately provides this as a "reset"
> > > GPIO to sensor drivers. Take this into account by assigning it as "enable"
> > > with active high polarity for INT347E devices, i.e. ov7251. "reset" with
> > > active low polarity remains the default GPIO name for other devices.
> > 
> > ...
> > 
> > > +/**
> > > + * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
> > > + * sensor driver (as in DT bindings)
> > > + * @hid: The ACPI HID of the device without the instance number e.g. i2c-INT347E
> > 
> > W/o "i2c-" part.
> > 
> > > + * @type_from: The GPIO type from ACPI ?SDT
> > > + * @type_to: The assigned GPIO type, typically same as type_from
> > 
> > @type_from
> 
> Agreed.
> 
> > 
> > > + * @func: The function, e.g. "enable"
> > 
> > Should we speak in terms of GPIOLIB, like connection ID ?
> 
> That rename should be done in the entire driver probably then. I can post a
> patch if Hans agrees, after this one.
> 
> > 
> > > + * @polarity: GPIO_ACTIVE_{HIGH,LOW}
> > 
> > Please, avoid using patterns with the defined constants. It's better to have
> > this written as
> > 
> >  * @polarity: One of %GPIO_ACTIVE_HIGH, %GPIO_ACTIVE_LOW
> 
> Sounds good.
> 
> > 
> > > + */
> > 
> > > +	const char *hid;
> > > +	u8 type_from;
> > > +	u8 type_to;
> > > +	const char *func;
> > > +	unsigned int polarity;
> > 
> > Hmm... In other cases we usually use
> > 
> > 	bool active_low;
> > 
> > Can we do the same here?
> 
> This goes to the flags field of struct gpiod_lookup. Bool is a poor choice
> for that (but u32 isn't correct either). We can put polarity here but pass
> GPIO_ACTIVE_{HIGH,LOW} to GPIO_LOOKUP().
> 
> Putting polarity before function would same some bytes, too. Hans, any
> thoughts?
> 
> > 
> > > +};
> > 
> > ...
> > 
> > > -	int3472_get_func_and_polarity(type, &func, &polarity);
> > > +	int3472_get_func_and_polarity(int3472->sensor, &type, &func,
> > > +				      &polarity);
> > 
> > AFAIK, we don't have hard attachment to the 80-[character limit rule, please
> > use more room on the previous line.
> 
> There's no reason for the line to be above 80 characters.

Do you mean that on a single line it would not exceed 80 characters (or 
that you just did not count at all)? :-)

I'm like 'What?' ...I don't know why you guys are arguing about breaking 
the 80 chars limit. :-D

-- 
 i.


