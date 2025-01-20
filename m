Return-Path: <linux-media+bounces-24994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 878EDA16FCE
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 17:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B46B7167C72
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 16:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492E91E990A;
	Mon, 20 Jan 2025 16:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UmPLvnzO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAE410F9;
	Mon, 20 Jan 2025 16:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737389117; cv=none; b=PL4/o9s9WOMk7qv3pzBFpzE59Igi4vl+XE5neFkLMFZCypc5gID/zO6cpuZSBtWv7fC7aA22kYtHyqcFIHxCWMfDwYaTL2KH6bthKw8FCUMatwd0W4OW1N0D2Y05BnTkphDDd+aq2I2GQFpzB8I45Atd0RttaDc2PzUQEohXRdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737389117; c=relaxed/simple;
	bh=BchMBmmkg4hyEbz27FTrr5BAhxDTrhyicpFimrKlODI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bobn9XjTXfEka0cvIGL2TmzqyKBiuBZpdiFGtT5DwNZRkSaQDDtKvyIlYxGzFAt61w5qEItCKGiASjCY0UIuLkA/zCOlQWsRv4lU8q87WWEycGFglGKEvQ2bz/doF+Z9iHB8kyk97ZFc5jQIhB2a3HG0HPvrOUTK+IDR3ZsmzC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UmPLvnzO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FB4D594;
	Mon, 20 Jan 2025 17:04:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737389051;
	bh=BchMBmmkg4hyEbz27FTrr5BAhxDTrhyicpFimrKlODI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UmPLvnzOuNYv4bG8n9ZFX8mfIdM4p7Izi1t+lXBa+i9JqW8uMB640qn9JGGzJnP2m
	 fOT/+LpqqU6GXA2iabgTOVo/frZEwoiDrzLVutcJp4f7frCUBQw7e3eWJf5EBTcfNY
	 xKiBwpnagfaNfMGX4MIdeO4sABDIDhnK/5DMV43w=
Date: Mon, 20 Jan 2025 18:05:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] media: ov7251: Remap "reset" to "enable" for
 OV7251
Message-ID: <20250120160505.GA21978@pendragon.ideasonboard.com>
References: <20241108145024.1490536-1-andriy.shevchenko@linux.intel.com>
 <Zy43D7wAZLrBDtiX@kekkonen.localdomain>
 <Zy48Fc_nUceCs3PK@smile.fi.intel.com>
 <Zy4_hR9AsDhmK5MK@kekkonen.localdomain>
 <2957d1f6-f846-4916-980d-4346bc2b9d64@redhat.com>
 <ZzG4ekFKe25Ws0D7@kekkonen.localdomain>
 <20b988cb-603a-4c1f-8a6e-76a4cb98baa0@redhat.com>
 <Z4kcLFlmp51QQAFZ@smile.fi.intel.com>
 <Z44Z3kedl2I0i9Z5@kekkonen.localdomain>
 <0a0b765e-b342-4433-9c6c-07da78f0f63b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0a0b765e-b342-4433-9c6c-07da78f0f63b@redhat.com>

On Mon, Jan 20, 2025 at 02:30:46PM +0100, Hans de Goede wrote:
> +Cc platform-driver-x86@vger.kernel.org
> 
> Hi Sakari,
> 
> On 20-Jan-25 10:39 AM, Sakari Ailus wrote:
> > Hi Andy,
> > 
> > On Thu, Jan 16, 2025 at 04:48:12PM +0200, Andy Shevchenko wrote:
> >> On Mon, Nov 11, 2024 at 10:46:32AM +0100, Hans de Goede wrote:
> >>> On 11-Nov-24 8:55 AM, Sakari Ailus wrote:
> >>>> On Fri, Nov 08, 2024 at 07:19:05PM +0100, Hans de Goede wrote:
> >>>>> On 8-Nov-24 5:42 PM, Sakari Ailus wrote:
> >>>>>> On Fri, Nov 08, 2024 at 06:28:05PM +0200, Andy Shevchenko wrote:
> >>>>>>> On Fri, Nov 08, 2024 at 04:06:39PM +0000, Sakari Ailus wrote:
> >>>>>>>> On Fri, Nov 08, 2024 at 04:50:24PM +0200, Andy Shevchenko wrote:
> >>>>>>>>> The driver of OmniVision OV7251 expects "enable" pin instead of "reset".
> >>>>>>>>> Remap "reset" to "enable" and update polarity.
> >>>>>>>>>
> >>>>>>>>> In particular, the Linux kernel can't load the camera sensor
> >>>>>>>>> driver on Microsoft Surface Book without this change:
> >>>>>>>>>
> >>>>>>>>>  ov7251 i2c-INT347E:00: supply vdddo not found, using dummy regulator
> >>>>>>>>>  ov7251 i2c-INT347E:00: supply vddd not found, using dummy regulator
> >>>>>>>>>  ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
> >>>>>>>>>  ov7251 i2c-INT347E:00: cannot get enable gpio
> >>>>>>>>>  ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -2
> >>
> >> ...
> >>
> >>>>>>>> Should this be cc'd to stable? I guess it's not exactly a fix in the driver
> >>>>>>>> but a BIOS bug, but it can be worked around in the driver. :-)
> >>>>>>>
> >>>>>>> It's everything, but a BIOS bug, it's DT bug and whoever first introduced that
> >>>>>>> GPIO in the driver. Even in the DT present in kernel the pin was referred as
> >>>>>>
> >>>>>> How is that a DT (binding?) bug?
> >>>>>
> >>>>> Since it is not following the datasheet name for the pin,
> >>>>> it arguably is a DT binding bug
> >>>>>
> >>>>> But whatever, the whole discussion about if it is a bug and whose
> >>>>> bug it is is not useful. Since we cannot go back in time and change
> >>>>> the DT binding DT and ACPI are simply going to disagree on the name
> >>>>> and we will need something like this patch.
> >>>>>
> >>>>>>> CAM_RST_N, which is exactly how this patch names it.
> >>>>>>>
> >>>>>>> OTOH it's a fix to the driver that never worked for ACPI case, so there never
> >>>>>>> was a regression to fix.
> >>>>>>
> >>>>>> It probably worked just fine, just not with that Surface Book.
> >>>>>>
> >>>>>> The polarity of the enable gpio appears to be set wrong in devm_gpiod_get()
> >>>>>> call. I can post a patch but cannot test it.
> >>>>>
> >>>>> That is on purpose, at least the polarity if the devm_gpiod_get(..., "reset",
> >>>>> ...) is inverted from the existing one for "enable" because reset needs
> >>>>> to be inactive/disabled to enable the sensor.
> >>>>>
> >>>>>> Similarly, you should actually set the flags to GPIOD_OUT_HIGH as reset
> >>>>>> should be enabled here -- it's disabled only in power_on() as part of the
> >>>>>> power-on sequence.
> >>>>>
> >>>>> This seems to be a pre-existing bug in this driver, which currently
> >>>>> starts driving enable high, enabling the sensor at gpiod_get() time.
> >>>>>
> >>>>> Note that fixing this is tricky-ish, if the pin was already high at
> >>>>> gpiod_get() time then changing the gpiod_get() to drive it low
> >>>>> will result in it only being driven low for a very short time since
> >>>>> ov7251_set_power_on() will get called almost immediately after this
> >>>>> and it will drive the pin high again without any delays.
> >>>>
> >>>> The question here is not about how long the hard reset is applied, but
> >>>> whether or not the sensor's power-on sequence is followed. Currently it is
> >>>> not.
> >>>
> >>> Right / agreed. The 2 points which I am trying to make are:
> >>>
> >>> 1. This is a pre-existing problem unrelated to this patch.
> >>>
> >>> So this should be fixed in a separate patch.
> >>>
> >>> 2. That separate patch should put a delay after requesting the GPIO
> >>> to enforce that it is (logically) low (for "enable") for a minimum
> >>> amount of time.
> >>
> >> Sakari, what's the status on this, please?
> >> We have non-working camera just because of this small patch is absent.
> > 
> > Thanks for the ping.
> > 
> > I took a closer look at the problem, indeed the GPIO name comes from the
> > int3472 driver and it's much better to work around this there than to ram
> > Windows ACPI table specifics to sensor drivers. I'll post a patch for that
> > shortly. Testing would be appreciated as the Surface Go 2 doesn't have a
> > GPIO connected to this sensor.
> 
> Actually Andy wrote this patch after first writing a similar quirk patch
> as yours from:
> 
> https://lore.kernel.org/platform-driver-x86/1cf93f61-9285-f2fe-fb92-8fb8a3f44201@linux.intel.com/T/#t
> 
> because I asked him to fix this in the sensor driver instead.
> 
> The problem is that we cannot fix this in the INT3472 driver without
> that becoming one big mess of driver specific quirks.
> 
> The Windows code seems to have separate power-ctrl/sequence drivers
> for the INT3472 device vs the rest of the sensor driver and this
> power-sequence driver happily consumes whatever GPIOs the INT3472
> device provides independent of the sensor.
> 
> So e.g. on some designs we are going to see a reset pin and on others
> a powerdown pin.
> 
> But in this specific case things are actually more simple,
> the datasheet describes the pin as:
> 
> XSHUTDOWN input reset (active low with internal pull down resistor)
> 
> So the devicetree binding calling it "enable" is just wrong and in
> this case it is actually the DT binding which is buggy (there is no
> "enable" pin anywhere in the datasheet) and not the ACPI tables.

There has never been a requirement for the GPIO in DT to match the pin
name from the datasheet. It's actually quite the contrary, DT
maintainers request GPIO names to be standardized. Using
"xshutdown-gpios" wouldn't be appreciated, instead DT bindings are
encouraged to use standard names such as "reset", "enable" and
"powerdown". As the pin is called "XSHUTDOWN", "enable" is not
necessarily a bad match. "reset" could have been picked too, but that
wasn't the case and we can't change that.

The core of the issue here is that we have two firmware representations,
DT and ACPI, and no coordination between the two. I don't expect that to
change, and until Windows OEMs collaborate to standardize ACPI bindings,
I'll consider this as a Windows-specific hack that I don't want to see
being pushed to indidividual sensor drivers. This would be better
handled in my opinion in the INT3472 driver.

> Also since you match on the sensor-type for the remapping this clearly
> is a per sensor thing and per sensor handling should be in the sensor
> drivers, which gives us the per sensor mapping for free.
> 
> Yes needing to handle this in the sensor driver makes the sensor
> driver slightly less pretty. But dealing with platform specifics
> in drivers is done all over the kernel and I don't see why camera
> sensor drivers are so special that they get to be excluded from
> sometimes needing to deal with platform specifics.

The whole point of having standardized firmware descriptions is to avoid
board-specific code in drivers. INT3472 is meant to handle board
specificities.

-- 
Regards,

Laurent Pinchart

