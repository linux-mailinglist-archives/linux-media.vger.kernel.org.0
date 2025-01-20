Return-Path: <linux-media+bounces-24929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F7CA169B8
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 10:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBDDC1667B5
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 09:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2061A8F93;
	Mon, 20 Jan 2025 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6SMUWqR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590CA191489;
	Mon, 20 Jan 2025 09:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737365989; cv=none; b=S/smlpB8qpVGQBehlHjkz8OPWVpjUO+qCPn6ojgHuEA5YPoEL/myWwhJLqmoIw2otboE1uUmAgD9iMUp2GIv4e2mdSh+858qpEVPBLaNYRsIX5s2S5lfB2nrhX9eXeIQpAqdKR/5nAiMK7E6+tw/yCLUdHbmSlxYviW/F6WIrTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737365989; c=relaxed/simple;
	bh=Fz2HianXJeqIaOO0y4/SOL6iK2aVT3JCiLitFELWwK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pd/KwtcPNcOJUe7ujPAbUfIdnwqnFkR6qY56spXtHDcLWqjTI0XqyyUplT6li0ouiI0ghLRF8sJktv5nzQ/KittiLacO6nWc6uXWhnpn7meRbA5q1C/xwA8IxHwE7idDV+bA0JTJBFNTPB4uQeozK+RBlcy1QxcWCczPPEugOL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f6SMUWqR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737365987; x=1768901987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fz2HianXJeqIaOO0y4/SOL6iK2aVT3JCiLitFELWwK8=;
  b=f6SMUWqRZZdStoWCEBWpl3q4HhJ0sQy4mlHRVBsGzvggvLj6otKW+OfQ
   RXWtlXl1gd1UU6mTKuufe4NRtsY3APZZCoJOqtG0oDrZHfOGcbxCXQJji
   HVcoy7RxX9fzO4BIgz2bIPiB2KlGtIK+A+L3Bp7qWX1ph6+q6e/Tu2buJ
   cBrZGNqNrVfgvwetWVdjS6CixtCmZbtZ7Ejw5G7RcAuwYZ6wO0WTjcE76
   zJ0Q4Gwb+yEb1+TWX1J5gN0pD/+hWL74OdglW5p4W4lCRPgkmLZXBc0eK
   qliRL5qV2njz8AjGcdt6aTAWmDQ/bfnQVqpAGRTY+0qfsMtNfuZc/wwiH
   Q==;
X-CSE-ConnectionGUID: L67/ShYjRC6AzJ95xw9rGA==
X-CSE-MsgGUID: pxZ2CfHDTe2mXYdFQCO4fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="60209423"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="60209423"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 01:39:47 -0800
X-CSE-ConnectionGUID: xQ9krA5zQ2iIAtZkX8HseA==
X-CSE-MsgGUID: Rqn+1tGCT8WKNSjKyQRGxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="111420026"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 01:39:45 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AE34D11F94F;
	Mon, 20 Jan 2025 11:39:42 +0200 (EET)
Date: Mon, 20 Jan 2025 09:39:42 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: ov7251: Remap "reset" to "enable" for
 OV7251
Message-ID: <Z44Z3kedl2I0i9Z5@kekkonen.localdomain>
References: <20241108145024.1490536-1-andriy.shevchenko@linux.intel.com>
 <Zy43D7wAZLrBDtiX@kekkonen.localdomain>
 <Zy48Fc_nUceCs3PK@smile.fi.intel.com>
 <Zy4_hR9AsDhmK5MK@kekkonen.localdomain>
 <2957d1f6-f846-4916-980d-4346bc2b9d64@redhat.com>
 <ZzG4ekFKe25Ws0D7@kekkonen.localdomain>
 <20b988cb-603a-4c1f-8a6e-76a4cb98baa0@redhat.com>
 <Z4kcLFlmp51QQAFZ@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4kcLFlmp51QQAFZ@smile.fi.intel.com>

Hi Andy,

On Thu, Jan 16, 2025 at 04:48:12PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 11, 2024 at 10:46:32AM +0100, Hans de Goede wrote:
> > On 11-Nov-24 8:55 AM, Sakari Ailus wrote:
> > > On Fri, Nov 08, 2024 at 07:19:05PM +0100, Hans de Goede wrote:
> > >> On 8-Nov-24 5:42 PM, Sakari Ailus wrote:
> > >>> On Fri, Nov 08, 2024 at 06:28:05PM +0200, Andy Shevchenko wrote:
> > >>>> On Fri, Nov 08, 2024 at 04:06:39PM +0000, Sakari Ailus wrote:
> > >>>>> On Fri, Nov 08, 2024 at 04:50:24PM +0200, Andy Shevchenko wrote:
> > >>>>>> The driver of OmniVision OV7251 expects "enable" pin instead of "reset".
> > >>>>>> Remap "reset" to "enable" and update polarity.
> > >>>>>>
> > >>>>>> In particular, the Linux kernel can't load the camera sensor
> > >>>>>> driver on Microsoft Surface Book without this change:
> > >>>>>>
> > >>>>>>  ov7251 i2c-INT347E:00: supply vdddo not found, using dummy regulator
> > >>>>>>  ov7251 i2c-INT347E:00: supply vddd not found, using dummy regulator
> > >>>>>>  ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
> > >>>>>>  ov7251 i2c-INT347E:00: cannot get enable gpio
> > >>>>>>  ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -2
> 
> ...
> 
> > >>>>> Should this be cc'd to stable? I guess it's not exactly a fix in the driver
> > >>>>> but a BIOS bug, but it can be worked around in the driver. :-)
> > >>>>
> > >>>> It's everything, but a BIOS bug, it's DT bug and whoever first introduced that
> > >>>> GPIO in the driver. Even in the DT present in kernel the pin was referred as
> > >>>
> > >>> How is that a DT (binding?) bug?
> > >>
> > >> Since it is not following the datasheet name for the pin,
> > >> it arguably is a DT binding bug
> > >>
> > >> But whatever, the whole discussion about if it is a bug and whose
> > >> bug it is is not useful. Since we cannot go back in time and change
> > >> the DT binding DT and ACPI are simply going to disagree on the name
> > >> and we will need something like this patch.
> > >>
> > >>>> CAM_RST_N, which is exactly how this patch names it.
> > >>>>
> > >>>> OTOH it's a fix to the driver that never worked for ACPI case, so there never
> > >>>> was a regression to fix.
> > >>>
> > >>> It probably worked just fine, just not with that Surface Book.
> > >>>
> > >>> The polarity of the enable gpio appears to be set wrong in devm_gpiod_get()
> > >>> call. I can post a patch but cannot test it.
> > >>
> > >> That is on purpose, at least the polarity if the devm_gpiod_get(..., "reset",
> > >> ...) is inverted from the existing one for "enable" because reset needs
> > >> to be inactive/disabled to enable the sensor.
> > >>
> > >>> Similarly, you should actually set the flags to GPIOD_OUT_HIGH as reset
> > >>> should be enabled here -- it's disabled only in power_on() as part of the
> > >>> power-on sequence.
> > >>
> > >> This seems to be a pre-existing bug in this driver, which currently
> > >> starts driving enable high, enabling the sensor at gpiod_get() time.
> > >>
> > >> Note that fixing this is tricky-ish, if the pin was already high at
> > >> gpiod_get() time then changing the gpiod_get() to drive it low
> > >> will result in it only being driven low for a very short time since
> > >> ov7251_set_power_on() will get called almost immediately after this
> > >> and it will drive the pin high again without any delays.
> > > 
> > > The question here is not about how long the hard reset is applied, but
> > > whether or not the sensor's power-on sequence is followed. Currently it is
> > > not.
> > 
> > Right / agreed. The 2 points which I am trying to make are:
> > 
> > 1. This is a pre-existing problem unrelated to this patch.
> > 
> > So this should be fixed in a separate patch.
> > 
> > 2. That separate patch should put a delay after requesting the GPIO
> > to enforce that it is (logically) low (for "enable") for a minimum
> > amount of time.
> 
> Sakari, what's the status on this, please?
> We have non-working camera just because of this small patch is absent.

Thanks for the ping.

I took a closer look at the problem, indeed the GPIO name comes from the
int3472 driver and it's much better to work around this there than to ram
Windows ACPI table specifics to sensor drivers. I'll post a patch for that
shortly. Testing would be appreciated as the Surface Go 2 doesn't have a
GPIO connected to this sensor.

Maybe backporting would be reasonable even though this isn't a fix as such?

-- 
Regards,

Sakari Ailus

