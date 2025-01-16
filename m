Return-Path: <linux-media+bounces-24849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B98D2A13CB1
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 15:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8BF216AD82
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 14:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A5922CBF9;
	Thu, 16 Jan 2025 14:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMMN5isR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE75222BAA1;
	Thu, 16 Jan 2025 14:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737038898; cv=none; b=PXFDF+SETyL/DnT7n3tqfctNg6SWMU8rjGnXTMtrzD8A7QymHDnDJkZd2U1MQxVpIdYLvx1hdQL7vQnRribCIZ7DUZ2qklrJB7QUI7y8HvwWium1yDOsie0S6Oi/WEsfRK5QSFmf1NeSIoQ6UKoWFlJGHI+Ebpb7olcquAHpjJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737038898; c=relaxed/simple;
	bh=vu6VY43w9uelYlT+YWzb5FZTc3iHcTsj9hbX9L9io5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eiN1Amt1GCfgy6bDf7FMInvZaNal8zzLzdtfZIKqt9TGIHC6wjvZffmxLy9GXSalVdsVwSqmySuBuk+3CdXyWUS3upNpiHpMQCHJgokRom4vROQSrUXo5DMCbhBr24Fu7sf85uah9OfRZosTBu6hYWsdEIG8XJ1Sfy5vRMoPB34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMMN5isR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737038897; x=1768574897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vu6VY43w9uelYlT+YWzb5FZTc3iHcTsj9hbX9L9io5Q=;
  b=fMMN5isR2mynzdLWqEIANdT77ljErzraOUtLP9+psqssJi4FtSb4Rx9l
   9pPsLVcpfdC4IdRxy4S9dp/c1FVmbe7/zlAywIdGPK+TKAbGgESKkToyj
   qsKjOHY6vYzs9HIEodso9lwHkIC/fzyJSXa8QirNsutaqN4eWnXHDWnTV
   gQvpfRNOho09Ujj4Rny3A120Vy3O1o13mOGCN0Egbr0UAcJDCufST/Vny
   s5fYzACfBCKP9JVh8s9sL8/NZ/hvoRZsrRwCK79wqbxuXMk59zzbCAq54
   Y7rZu0P/bFCgyc5PubBaAQF1Ya/EY1uAsghCp7IEz6/9mvOsszr6osZvg
   A==;
X-CSE-ConnectionGUID: yn0kwUb8SPikDsBYFb90Ow==
X-CSE-MsgGUID: ta7N7vFwSNqnEVJR7v4Xnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="41104182"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="41104182"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 06:48:17 -0800
X-CSE-ConnectionGUID: 3JzoO5rWTGCOIu/gxTI5hg==
X-CSE-MsgGUID: Axx47gWiS3e28AKKN6n1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110621287"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 06:48:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tYRAK-00000001hgG-2fWt;
	Thu, 16 Jan 2025 16:48:12 +0200
Date: Thu, 16 Jan 2025 16:48:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: ov7251: Remap "reset" to "enable" for
 OV7251
Message-ID: <Z4kcLFlmp51QQAFZ@smile.fi.intel.com>
References: <20241108145024.1490536-1-andriy.shevchenko@linux.intel.com>
 <Zy43D7wAZLrBDtiX@kekkonen.localdomain>
 <Zy48Fc_nUceCs3PK@smile.fi.intel.com>
 <Zy4_hR9AsDhmK5MK@kekkonen.localdomain>
 <2957d1f6-f846-4916-980d-4346bc2b9d64@redhat.com>
 <ZzG4ekFKe25Ws0D7@kekkonen.localdomain>
 <20b988cb-603a-4c1f-8a6e-76a4cb98baa0@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20b988cb-603a-4c1f-8a6e-76a4cb98baa0@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 11, 2024 at 10:46:32AM +0100, Hans de Goede wrote:
> On 11-Nov-24 8:55 AM, Sakari Ailus wrote:
> > On Fri, Nov 08, 2024 at 07:19:05PM +0100, Hans de Goede wrote:
> >> On 8-Nov-24 5:42 PM, Sakari Ailus wrote:
> >>> On Fri, Nov 08, 2024 at 06:28:05PM +0200, Andy Shevchenko wrote:
> >>>> On Fri, Nov 08, 2024 at 04:06:39PM +0000, Sakari Ailus wrote:
> >>>>> On Fri, Nov 08, 2024 at 04:50:24PM +0200, Andy Shevchenko wrote:
> >>>>>> The driver of OmniVision OV7251 expects "enable" pin instead of "reset".
> >>>>>> Remap "reset" to "enable" and update polarity.
> >>>>>>
> >>>>>> In particular, the Linux kernel can't load the camera sensor
> >>>>>> driver on Microsoft Surface Book without this change:
> >>>>>>
> >>>>>>  ov7251 i2c-INT347E:00: supply vdddo not found, using dummy regulator
> >>>>>>  ov7251 i2c-INT347E:00: supply vddd not found, using dummy regulator
> >>>>>>  ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
> >>>>>>  ov7251 i2c-INT347E:00: cannot get enable gpio
> >>>>>>  ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -2

...

> >>>>> Should this be cc'd to stable? I guess it's not exactly a fix in the driver
> >>>>> but a BIOS bug, but it can be worked around in the driver. :-)
> >>>>
> >>>> It's everything, but a BIOS bug, it's DT bug and whoever first introduced that
> >>>> GPIO in the driver. Even in the DT present in kernel the pin was referred as
> >>>
> >>> How is that a DT (binding?) bug?
> >>
> >> Since it is not following the datasheet name for the pin,
> >> it arguably is a DT binding bug
> >>
> >> But whatever, the whole discussion about if it is a bug and whose
> >> bug it is is not useful. Since we cannot go back in time and change
> >> the DT binding DT and ACPI are simply going to disagree on the name
> >> and we will need something like this patch.
> >>
> >>>> CAM_RST_N, which is exactly how this patch names it.
> >>>>
> >>>> OTOH it's a fix to the driver that never worked for ACPI case, so there never
> >>>> was a regression to fix.
> >>>
> >>> It probably worked just fine, just not with that Surface Book.
> >>>
> >>> The polarity of the enable gpio appears to be set wrong in devm_gpiod_get()
> >>> call. I can post a patch but cannot test it.
> >>
> >> That is on purpose, at least the polarity if the devm_gpiod_get(..., "reset",
> >> ...) is inverted from the existing one for "enable" because reset needs
> >> to be inactive/disabled to enable the sensor.
> >>
> >>> Similarly, you should actually set the flags to GPIOD_OUT_HIGH as reset
> >>> should be enabled here -- it's disabled only in power_on() as part of the
> >>> power-on sequence.
> >>
> >> This seems to be a pre-existing bug in this driver, which currently
> >> starts driving enable high, enabling the sensor at gpiod_get() time.
> >>
> >> Note that fixing this is tricky-ish, if the pin was already high at
> >> gpiod_get() time then changing the gpiod_get() to drive it low
> >> will result in it only being driven low for a very short time since
> >> ov7251_set_power_on() will get called almost immediately after this
> >> and it will drive the pin high again without any delays.
> > 
> > The question here is not about how long the hard reset is applied, but
> > whether or not the sensor's power-on sequence is followed. Currently it is
> > not.
> 
> Right / agreed. The 2 points which I am trying to make are:
> 
> 1. This is a pre-existing problem unrelated to this patch.
> 
> So this should be fixed in a separate patch.
> 
> 2. That separate patch should put a delay after requesting the GPIO
> to enforce that it is (logically) low (for "enable") for a minimum
> amount of time.

Sakari, what's the status on this, please?
We have non-working camera just because of this small patch is absent.

-- 
With Best Regards,
Andy Shevchenko



