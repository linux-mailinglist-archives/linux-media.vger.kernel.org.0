Return-Path: <linux-media+bounces-24997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 122C6A170F4
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 18:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B9A1160C72
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 17:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D49A1EBFFA;
	Mon, 20 Jan 2025 17:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgNm7Xgm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB851494CC;
	Mon, 20 Jan 2025 17:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737392646; cv=none; b=qDaxSU4Hn3KLgWu80bF7gzwbrym4UBi3/Mkp4ZBZE+nMX8h0RgHK2BpRETq3VV1JA6JjKVPndJ97TZnm50MOGG9y2cTHQuZ+ukztCLi3KKRf+4U7FrD8Eeiz9Y/vBO0q2RGnTcNjx4gZ3c8jvi/wnbUuCVm1z5+H6de/mGLN0Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737392646; c=relaxed/simple;
	bh=sx1p8srHlaOl0kP2Ny7BFL5PkVrfto7vfjcx2odyKf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g77hnwFSTrJA+kRtyEJiMH6z2T425pDOeQRc4CK4feBMsyUW46uEbHGKo4YNiwfLisn6EWjHinOnWlV7iFKLtP/nb9pSG4kkTCd9oQWko1HTyXeOHePpxRqUHAB5QUZQV+ZMpqZewYheF49Q1zxQaYOU2yxn8AhPFzFUwhnwtL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgNm7Xgm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737392644; x=1768928644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sx1p8srHlaOl0kP2Ny7BFL5PkVrfto7vfjcx2odyKf0=;
  b=hgNm7XgmamZ7hxV6/Dt/XThU6sYk9yvoZ8kp60fReONOPnyVTVQcvvMd
   N4c2USCqwei2ofKEMt0TCgatQJKK7dW5mM5+fIHoP7iKC71C6Xe41hZdj
   ANT7PIY/+Z/qmd2BVUwD5SuRo8Azf7MxfsJBqj3OGA7CExyvCMNk67nfA
   gDWcjqqLX50U4SDE7TRjKwFat19ccUVQo6OszycbZZJT6fx3Ben59NWdb
   a4do1KOxk6wK3NNrAMgc6gU2V7NgibUi5Olu4UFdysxmZAHD+MgchNHbN
   8YdhMPjCkbfoFUWrJeZAA1dNkJQpGLygQBIMy1FL3rzYImdSULHYElkJo
   A==;
X-CSE-ConnectionGUID: 4Ynip/dtQvmlfYuAmNcgeA==
X-CSE-MsgGUID: yuwtY+U4RLWP7dQ8KwTdwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49212392"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49212392"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 09:04:03 -0800
X-CSE-ConnectionGUID: sqnaerCXTl+Rl5xlzxPWUw==
X-CSE-MsgGUID: 9EbgUBTERsm8MPOkiVELmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="106700308"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 09:04:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tZvBv-00000003V43-1T96;
	Mon, 20 Jan 2025 19:03:59 +0200
Date: Mon, 20 Jan 2025 19:03:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] media: ov7251: Remap "reset" to "enable" for
 OV7251
Message-ID: <Z46B_xG8aYujLeDM@smile.fi.intel.com>
References: <Zy43D7wAZLrBDtiX@kekkonen.localdomain>
 <Zy48Fc_nUceCs3PK@smile.fi.intel.com>
 <Zy4_hR9AsDhmK5MK@kekkonen.localdomain>
 <2957d1f6-f846-4916-980d-4346bc2b9d64@redhat.com>
 <ZzG4ekFKe25Ws0D7@kekkonen.localdomain>
 <20b988cb-603a-4c1f-8a6e-76a4cb98baa0@redhat.com>
 <Z4kcLFlmp51QQAFZ@smile.fi.intel.com>
 <Z44Z3kedl2I0i9Z5@kekkonen.localdomain>
 <0a0b765e-b342-4433-9c6c-07da78f0f63b@redhat.com>
 <20250120160505.GA21978@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120160505.GA21978@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 20, 2025 at 06:05:05PM +0200, Laurent Pinchart wrote:
> On Mon, Jan 20, 2025 at 02:30:46PM +0100, Hans de Goede wrote:
> > On 20-Jan-25 10:39 AM, Sakari Ailus wrote:
> > > On Thu, Jan 16, 2025 at 04:48:12PM +0200, Andy Shevchenko wrote:
> > >> On Mon, Nov 11, 2024 at 10:46:32AM +0100, Hans de Goede wrote:
> > >>> On 11-Nov-24 8:55 AM, Sakari Ailus wrote:
> > >>>> On Fri, Nov 08, 2024 at 07:19:05PM +0100, Hans de Goede wrote:
> > >>>>> On 8-Nov-24 5:42 PM, Sakari Ailus wrote:
> > >>>>>> On Fri, Nov 08, 2024 at 06:28:05PM +0200, Andy Shevchenko wrote:
> > >>>>>>> On Fri, Nov 08, 2024 at 04:06:39PM +0000, Sakari Ailus wrote:
> > >>>>>>>> On Fri, Nov 08, 2024 at 04:50:24PM +0200, Andy Shevchenko wrote:
> > >>>>>>>>> The driver of OmniVision OV7251 expects "enable" pin instead of "reset".
> > >>>>>>>>> Remap "reset" to "enable" and update polarity.
> > >>>>>>>>>
> > >>>>>>>>> In particular, the Linux kernel can't load the camera sensor
> > >>>>>>>>> driver on Microsoft Surface Book without this change:
> > >>>>>>>>>
> > >>>>>>>>>  ov7251 i2c-INT347E:00: supply vdddo not found, using dummy regulator
> > >>>>>>>>>  ov7251 i2c-INT347E:00: supply vddd not found, using dummy regulator
> > >>>>>>>>>  ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
> > >>>>>>>>>  ov7251 i2c-INT347E:00: cannot get enable gpio
> > >>>>>>>>>  ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -2

...

> > >>>>>>>> Should this be cc'd to stable? I guess it's not exactly a fix in the driver
> > >>>>>>>> but a BIOS bug, but it can be worked around in the driver. :-)
> > >>>>>>>
> > >>>>>>> It's everything, but a BIOS bug, it's DT bug and whoever first introduced that
> > >>>>>>> GPIO in the driver. Even in the DT present in kernel the pin was referred as
> > >>>>>>
> > >>>>>> How is that a DT (binding?) bug?
> > >>>>>
> > >>>>> Since it is not following the datasheet name for the pin,
> > >>>>> it arguably is a DT binding bug
> > >>>>>
> > >>>>> But whatever, the whole discussion about if it is a bug and whose
> > >>>>> bug it is is not useful. Since we cannot go back in time and change
> > >>>>> the DT binding DT and ACPI are simply going to disagree on the name
> > >>>>> and we will need something like this patch.
> > >>>>>
> > >>>>>>> CAM_RST_N, which is exactly how this patch names it.
> > >>>>>>>
> > >>>>>>> OTOH it's a fix to the driver that never worked for ACPI case, so there never
> > >>>>>>> was a regression to fix.
> > >>>>>>
> > >>>>>> It probably worked just fine, just not with that Surface Book.
> > >>>>>>
> > >>>>>> The polarity of the enable gpio appears to be set wrong in devm_gpiod_get()
> > >>>>>> call. I can post a patch but cannot test it.
> > >>>>>
> > >>>>> That is on purpose, at least the polarity if the devm_gpiod_get(..., "reset",
> > >>>>> ...) is inverted from the existing one for "enable" because reset needs
> > >>>>> to be inactive/disabled to enable the sensor.
> > >>>>>
> > >>>>>> Similarly, you should actually set the flags to GPIOD_OUT_HIGH as reset
> > >>>>>> should be enabled here -- it's disabled only in power_on() as part of the
> > >>>>>> power-on sequence.
> > >>>>>
> > >>>>> This seems to be a pre-existing bug in this driver, which currently
> > >>>>> starts driving enable high, enabling the sensor at gpiod_get() time.
> > >>>>>
> > >>>>> Note that fixing this is tricky-ish, if the pin was already high at
> > >>>>> gpiod_get() time then changing the gpiod_get() to drive it low
> > >>>>> will result in it only being driven low for a very short time since
> > >>>>> ov7251_set_power_on() will get called almost immediately after this
> > >>>>> and it will drive the pin high again without any delays.
> > >>>>
> > >>>> The question here is not about how long the hard reset is applied, but
> > >>>> whether or not the sensor's power-on sequence is followed. Currently it is
> > >>>> not.
> > >>>
> > >>> Right / agreed. The 2 points which I am trying to make are:
> > >>>
> > >>> 1. This is a pre-existing problem unrelated to this patch.
> > >>>
> > >>> So this should be fixed in a separate patch.
> > >>>
> > >>> 2. That separate patch should put a delay after requesting the GPIO
> > >>> to enforce that it is (logically) low (for "enable") for a minimum
> > >>> amount of time.
> > >>
> > >> Sakari, what's the status on this, please?
> > >> We have non-working camera just because of this small patch is absent.
> > > 
> > > Thanks for the ping.
> > > 
> > > I took a closer look at the problem, indeed the GPIO name comes from the
> > > int3472 driver and it's much better to work around this there than to ram
> > > Windows ACPI table specifics to sensor drivers. I'll post a patch for that
> > > shortly. Testing would be appreciated as the Surface Go 2 doesn't have a
> > > GPIO connected to this sensor.
> > 
> > Actually Andy wrote this patch after first writing a similar quirk patch
> > as yours from:
> > 
> > https://lore.kernel.org/platform-driver-x86/1cf93f61-9285-f2fe-fb92-8fb8a3f44201@linux.intel.com/T/#t
> > 
> > because I asked him to fix this in the sensor driver instead.
> > 
> > The problem is that we cannot fix this in the INT3472 driver without
> > that becoming one big mess of driver specific quirks.
> > 
> > The Windows code seems to have separate power-ctrl/sequence drivers
> > for the INT3472 device vs the rest of the sensor driver and this
> > power-sequence driver happily consumes whatever GPIOs the INT3472
> > device provides independent of the sensor.
> > 
> > So e.g. on some designs we are going to see a reset pin and on others
> > a powerdown pin.
> > 
> > But in this specific case things are actually more simple,
> > the datasheet describes the pin as:
> > 
> > XSHUTDOWN input reset (active low with internal pull down resistor)
> > 
> > So the devicetree binding calling it "enable" is just wrong and in
> > this case it is actually the DT binding which is buggy (there is no
> > "enable" pin anywhere in the datasheet) and not the ACPI tables.
> 
> There has never been a requirement for the GPIO in DT to match the pin
> name from the datasheet. It's actually quite the contrary, DT
> maintainers request GPIO names to be standardized. Using
> "xshutdown-gpios" wouldn't be appreciated, instead DT bindings are
> encouraged to use standard names such as "reset", "enable" and
> "powerdown". As the pin is called "XSHUTDOWN", "enable" is not
> necessarily a bad match. "reset" could have been picked too, but that
> wasn't the case and we can't change that.

This is very strange. I always thought that DT is about describing _hardware_
and not some abstractions like Linux ones. The HW is pretty much clear that
the pin is "reset" by semantics (if you want standardization), and not
"enable".

> The core of the issue here is that we have two firmware representations,
> DT and ACPI, and no coordination between the two. I don't expect that to
> change, and until Windows OEMs collaborate to standardize ACPI bindings,
> I'll consider this as a Windows-specific hack that I don't want to see
> being pushed to indidividual sensor drivers. This would be better
> handled in my opinion in the INT3472 driver.

Yeah and to me it's clearly the bug in DT schema for this pin. It had to be
"reset" from day 1 in accordance with datasheet.

> > Also since you match on the sensor-type for the remapping this clearly
> > is a per sensor thing and per sensor handling should be in the sensor
> > drivers, which gives us the per sensor mapping for free.
> > 
> > Yes needing to handle this in the sensor driver makes the sensor
> > driver slightly less pretty. But dealing with platform specifics
> > in drivers is done all over the kernel and I don't see why camera
> > sensor drivers are so special that they get to be excluded from
> > sometimes needing to deal with platform specifics.
> 
> The whole point of having standardized firmware descriptions is to avoid
> board-specific code in drivers. INT3472 is meant to handle board
> specificities.

Yes, but world is not ideal and people made mistakes...

-- 
With Best Regards,
Andy Shevchenko



