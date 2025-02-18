Return-Path: <linux-media+bounces-26275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 916BDA39BAF
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 13:04:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA721175DA4
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 12:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C67241136;
	Tue, 18 Feb 2025 12:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5/Bd0Ms"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7AF22CBFA;
	Tue, 18 Feb 2025 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739880120; cv=none; b=BrxupNuOdyRBOjk5UuiUP3fovjTHdozXWs0pdeuzSGNv0eB3kGHA1q5NgZNdf1QB4SIAKZnXTfrEyPOz35wOuIGGcsKjOrLDnfL8wBWwuKnOUsp/+LwkAMIeiV1to1N6xZOWSOvXhzX0EPjgHjTSVApa164vkC9Pllg8xwwskXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739880120; c=relaxed/simple;
	bh=U5qHM8mo6NaMAcwU9wDI8S8bd20xruSV4c5qu0B8cbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6AzDqhArz2gGwgsI+QVAX9v45+hmp1olotVoGJYRIdftlVwsSeNCJDaU4uKA6wYc3uirg2dzfA52La7NM0kKIlPVIAb0Rs5LQoyej1GTHvQlhswOy0K/4CZG2TL0zmzxfDnVtOgl4+2rmlw7csrzlSWlKg6FJQBywBSOFgDa+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5/Bd0Ms; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739880118; x=1771416118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U5qHM8mo6NaMAcwU9wDI8S8bd20xruSV4c5qu0B8cbI=;
  b=I5/Bd0MsbSnJb5ceFgiH5FKxibpl+izHeVmkqUHXqR+jZvPZLB+QpP0j
   kmNy/PsUzJ1vr/PE2utmfQTdPW+YLXoSwLCxTr2hVbzswUUJ9GsDCnqeR
   RWswHQOxinuzvtDpbx/G+kTqbRZi8XUbQ1I9Hr5E7g1bzXecqg5qCyneh
   528A2pCPYqQATSKbr4A7PNUICXIOSN0rnAm2w5eoj+HFqNBJVwEhgqSZe
   iVGU1+nnQv6tfgV2JsYZREOTeDAd1JZHmxCLVRnrPkHd7KnhWfKYu001J
   PSvISCxDdW0vJUlLOkfiG8MejrlFA4omq5iZMWaTfiJ9Wo7amcEtBWVtG
   g==;
X-CSE-ConnectionGUID: UXkAO+O2TGywrkHVnSr00A==
X-CSE-MsgGUID: xzk5ajxTQzK1WtszHM9t2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="28172096"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="28172096"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 04:01:56 -0800
X-CSE-ConnectionGUID: TmCIEWJRS2KMHQC5ius2Lw==
X-CSE-MsgGUID: vfv+oDdGR728yWwMTIhn0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118504080"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 04:01:53 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C1DDE120B45;
	Tue, 18 Feb 2025 14:01:50 +0200 (EET)
Date: Tue, 18 Feb 2025 12:01:50 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Bingbu Cao <bingbu.cao@linux.intel.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	Dan Scally <djrscally@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	"duanek@chorus.net" <duanek@chorus.net>,
	"Yao, Hao" <hao.yao@intel.com>, siddartha.reddy.kare@intel.com,
	israel.a.cepeda.lopez@intel.com, alla.srinivas@intel.com
Subject: Re: RFC: How to deal with the INT3472 handshake GPIO found on Intel
 IPU6 MTL?
Message-ID: <Z7R2rkR8VBLPg0Rr@kekkonen.localdomain>
References: <59f672c3-6d87-4ec7-9b7f-f44fe2cce934@redhat.com>
 <Z5c6Yef3KBS6VbTC@kekkonen.localdomain>
 <ef5a8144-d60b-4719-926d-35e9fea5a435@redhat.com>
 <Z5y3XuKbdJqR_W-T@kekkonen.localdomain>
 <2796d5a8-7c52-ef3e-f274-e3f5af2991ef@linux.intel.com>
 <4b87a956-a767-48dc-b98b-f80d9a44adc8@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b87a956-a767-48dc-b98b-f80d9a44adc8@redhat.com>

Hi Hans,

On Wed, Feb 12, 2025 at 02:43:28PM +0100, Hans de Goede wrote:
> Hi Bingbu,
> 
> On 12-Feb-25 5:08 AM, Bingbu Cao wrote:
> > 
> > Hans and Sakari,
> > 
> > Sorry for the late reply, I am just back from holiday and take several
> > days sick leave then.
> 
> NP, I hope you are feeling better now.
> 
> > On 1/31/25 7:43 PM, sakari.ailus@linux.intel.com wrote:
> >> Hi Hans,
> >>
> >> On Thu, Jan 30, 2025 at 04:34:53PM +0100, Hans de Goede wrote:
> >>> Hi Sakari,
> >>>
> >>> On 27-Jan-25 8:48 AM, sakari.ailus@linux.intel.com wrote:
> >>>> Hi Hans,
> >>>>
> >>>> Thanks for your e-mail.
> >>>>
> >>>> On Wed, Jan 22, 2025 at 06:19:47PM +0100, Hans de Goede wrote:
> >>>>> Hi All,
> >>>>>
> >>>>> Background / analysis:
> >>>>> ----------------------
> >>>>>
> >>>>> New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
> >>>>> pin defined in the INT3472 sensor companion device which describes
> >>>>> the sensor's GPIOs.
> >>>>>
> >>>>> Based on what I know about this now, this pin seems to be used in at least
> >>>>> 3 different scenarios:
> >>>>>
> >>>>> 1. To power-up / activate some unknown auxiliary IC on HP laptop designs
> >>>>> where the sensor is directly connected to the main Meteor Lake SoC for
> >>>>> I2C and GPIOs (no USB io-expander used). Example dyndbg int3472 output:
> >>>>>
> >>>>> HP Spectre x360 2-in-1 Laptop 16t-aa000/8C17, BIOS F.11 08/14/2024 (ov08x40):
> >>>>> [    4.908016] int3472-discrete INT3472:01: unknown \_SB.GPI0 pin 65 active-high
> >>>>> [    4.908019] int3472-discrete INT3472:01: GPIO type 0x12 unknown; the sensor may not work
> >>>>> [    4.908100] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin 107 active-high
> >>>>> (and lsusb shows no Lattice NX## / Synaptics Sabre USB-io expander)
> >>>>>
> >>>>> 2. To make the Lattice chip in designs with the Lattice chip is used run
> >>>>> the power-on sequence of the sensor which is handled by the Lattice chip
> >>>>> firmware itself running the entire power-on/-down sequence when changing
> >>>>> the GPIO value. Example dyndbg int3472 output:
> >>>>>
> >>>>> Dell Latitude 7450 (with patch to map handshake in INT3472) (ov02e10):
> >>>>> [    5.110920] int3472-discrete INT3472:01: Sensor name OVTI02E1:00
> >>>>> [    5.111908] int3472-discrete INT3472:01: Sensor module id: 'CIFNE24'
> >>>>> [    5.113653] int3472-discrete INT3472:01: handshake \_SB.PC00.XHCI.RHUB.HS05.VGPO pin 0 active-high
> >>>>> [    5.113676] int3472-discrete INT3472:01: privacy-led \_SB.PC00.XHCI.RHUB.HS05.VGPO pin 2 active-high
> >>>>> (with 2ac1:20c9 Lattice NX33 USB IO-expander)
> >>>>
> >>>> The good thing is that there's a datasheet
> >>>> <URL:https://mm.digikey.com/Volume0/opasdata/d220001/medias/docus/5726/FPGA-DS-02104-0-92-CrossLink-NX-33-and-CrossLink-NX-33U.pdf>
> >>>> so we don't need to guess.
> >>>>
> >>>> Lattice NX-33 is more than an USB IO expenader. Most likely it acts as a
> >>>> CSI-2 RX and CSI-2 TX and does something in between, like IVSC. It should
> >>>> have its own driver, even if all it does is toggle GPIOs and sleep a
> >>>> little.
> >>>
> >>> I guess that what you mean is having something similar to:
> >>>
> >>> drivers/media/pci/intel/ivsc/mei_csi.c
> >>>
> >>> which just toggles the handshake GPIO on the s_stream() callback ?
> >>>
> >>> That would require injecting the Lattice NX33 into the media fwnode
> >>> graph similar to how we are doing this for the ivsc. But where
> >>> the ivsc triggers this on there being an ACPI fwnode, there does
> >>> not appear to be any ACPI fwnode for the NX33 at least not
> >>> on Alan's laptop where we know the handshake signal is necessary.
> >>
> >> I presume not all systems come with CVS/CVF but they could still use USB
> >> I/O expanders.
> >>
> >>>
> >>> https://github.com/intel/vision-drivers
> >>>
> >>> suggests that the new chip shows up as an i2c device when it
> >>> actually is mitm-ing the sensor and here is "ls /sys/bus/i2c/devices"
> >>> output for Alan's laptop with the usbio-i2c driver loaded:
> >>>
> >>> $ ls -l /sys/bus/i2c/devices
> >>> total 0
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-0 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-0/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-1 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-1/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-10 -> ../../../devices/pci0000:00/0000:00:02.0/drm/card0/card0-DP-1/i2c-10/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-11 -> ../../../devices/pci0000:00/0000:00:02.0/drm/card0/card0-DP-2/i2c-11/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-12 -> ../../../devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-12/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-13 -> ../../../devices/pci0000:00/0000:00:15.3/i2c_designware.1/i2c-13/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-14 -> ../../../devices/pci0000:00/0000:00:1f.4/i2c-14/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-15 -> ../../../devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5:1.0/usbio-i2c.2.auto/i2c-15/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-16 -> ../../../devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5:1.0/usbio-i2c.3.auto/i2c-16/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-2 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-2/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-3 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-3/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-4 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-4/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-5 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-5/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-6 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-6/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-7 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-7/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-8 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-8/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-9 -> ../../../devices/pci0000:00/0000:00:02.0/drm/card0/card0-eDP-1/i2c-9/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-HIMX1092:00 -> ../../../devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5:1.0/usbio-i2c.2.auto/i2c-15/i2c-HIMX1092:00/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-OVTI02E1:00 -> ../../../devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5:1.0/usbio-i2c.3.auto/i2c-16/i2c-OVTI02E1:00/
> >>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-VEN_0488:00 -> ../../../devices/pci0000:00/0000:00:15.3/i2c_designware.1/i2c-13/i2c-VEN_0488:00/
> >>>
> >>> Notice there is no i2c device matching the devices expected by
> >>> the vision-drivers.
> >>
> >> This gets interesting. This page under dell.com suggests Windows Hello is
> >> supported on Latitude 7450:
> >> <URL:https://www.dell.com/support/kbdoc/en-us/000225822/windows-hello-facial-recognition-may-not-work-on-dell-computers-with-mipi-cameras>.
> >>
> >>>
> >>> I have heard that the X1 carbon gen 13 (lunar lake) does have
> >>> such an i2c device.
> >>>
> >>> So I think that the CSI pass-through functionality is not used
> >>> on Alan's laptop.
> >>>
> >>> Also the ivcs needed to be configured for number of CSI lanes +
> >>> CSI frequency. That is not the case here. It is a fully opaque
> >>> black box and Windows seems to treat it mostly as if it is
> >>> not there at all.
> >>>
> >>> I believe that it would be best to do the same as Windows and
> >>> just make sure we toggle the handshake pin and otherwise forget
> >>> about the chip being there. In my many years if experience with
> >>> x86 hw primarily designed for Windows trying to behave differently
> >>> from Windows only causes trouble.
> >>>
> >>> If we were to try and model this as a separate v4l2-subdev
> >>> in the media graph then then the questions become:
> >>>
> >>> 1. When to inject such a node. The ivsc model of going by
> >>> ACPI HID's very likely does not work (or maybe it does and
> >>> we simply have not seen hw yet which actually uses the vision
> >>> parts? That is what the vision-drivers git repo suggests).
> >>>
> >>> Going by the presence of a handshake pin in the INT3472 device
> >>> is riddled with problems:
> >>>
> >>> a. It requires digging into the ACPI resources of a device
> >>> not owned by the ipu-bridge code.
> >>>
> >>> b. Given the HP laptop example, likely also Alan's laptop
> >>> the presence of a handshake pin on meteor lake laptops does
> >>> not seem to guarantee the CSI signals are actually MITM-ed
> >>> by a chip, so we will likely create false-positives.
> >>>
> >>> c. Some previous (alder/raptor lake) HP laptops advertise
> >>> a handshake pin but already work since they seem to not use it,
> >>> so more false-postive matches.
> >>>
> >>> 2. Without an ACPI hid we have no struct-device/fwnode
> >>> to use as parent for the extra v4l2-subdev, so what do we
> >>> use for this ?
> >>>
> >>> 3. What about models where the fwnode-s for the media graph
> >>> come from ACPI MIPI discovery? We skip the ipu-bridge code
> >>> there ...
> >>>
> >>> Combining these issues with the fact that the interface
> >>> is now just a single GPIO of which we do not exactly know
> >>> what it does, where as with the ivsc we actually needed
> >>> to program a CSI2 lane-count + link-freq I do not believe
> >>> that modelling this unknown hw controlled by the handshake
> >>> pin as an extra node on the media graph is the right thing
> >>> to do.
> >>
> >> As I noted in my previous e-mail, I need to find more information on this
> >> first. But when we have a device that is on the pixel data path, we likely
> >> should have a driver for it, possibly also in cases there's less need for
> >> control than with IVSC (CVF).
> >>
> >>>
> >>> ATM this feels much more like some power-sequencing thing,
> >>> just one more regulator / clk / reset-pin which we need
> >>> to set during power-up / -down.
> >>>
> >>> If in the future we get models where the ACPI HIDs claimed by:
> >>> https://github.com/intel/vision-drivers/blob/main/drivers/misc/icvs/intel_cvs.c#L720
> >>> actually show up then we can revisit this. It might make
> >>> sense to treat things like the ivsc setup in that case and
> >>> then if those too use the type 0x12 GPIO on the INT3472
> >>> device we can use the same code as used by the ipu-bridge
> >>> to create the extra media graph nodes to opt out of mapping
> >>> type 0x12 to a vdd supply.
> >>>
> >>> Another solution would be to move even closer to what Windows
> >>> does and switch the driver for the INT3472 ACPI device from
> >>> mapping pins to gpio-lookups / clks / regulators to it controlling
> >>> all the GPIOs listed in the INT3472 _DSM directly from runtime
> >>> suspend/resume functions, using a runtime pm device link from
> >>> the sensor to ensure that the INT3472 device is suspended / resumed
> >>> at the right time.
> >>>
> >>> This would also solve all of the mapping issues discussed in relation
> >>> to the ov7251 driver expecting an "enable" pin. I believe that this
> >>> would be the closest mirror of what Windows actually does and thus
> >>> is what will work without issues / quirks on the most laptop models.
> >>>
> >>>> Any thoughts, Bingbu?
> > 
> > I have not dug into the Lattice device ever, but AFAIK it is more simple
> > than IVSC. From the sensor driver perspective, it looks more like a
> > gpio/regulator. So I don't perfer the first solution.
> 
> Ok, so this sounds like my original "Proposed solution" from the email
> stating this thread, which is to model the handshake pin as a GPIO driven
> "dvdd" regulator with a 25 ms enable-time is the best solution.
> 
> Sakari, I know you are not enthusiastic about this solution, we can always
> opt out certain configs from treating the handshake pin this way later in
> case we do want to model the Lattice NX-33 as being in the sensor data
> path later.
> 
> I already have a set of old patches for the int3472/discrete.c code to
> allow it to register more then one regulator per sensor which I wrote to
> fix an issue on a tablet which eventually turned out to be a misdiagnosis
> of that issue. I saved those patches and I think they will be useful now :)

:-)

I had a chat with Bingbu and Hao. I can confirm the handshake GPIO indeed
has multiple functions: to power the sensor on (and off) and pass the
ownership of the sensor to the host. I presume it also covers configuring
the CSI-2 transmitter in the translator and passing the data to the host as
well.

Then there seem to be cases with GPIO 0x12 without CVS or even USBIO. It's
not clear to me yet which entity is implementing sensor power sequences
there.

Either way, your approach should work here and it does have a favourable
property of not being visible to sensor drivers. I was thinking of a new
driver handling both GPIOs and the delay but it seems we can do with fewer
changes with the regulator approach.

The Altek chip does require a 250 ms delay and this suggests that at least
in some cases the GPIO 0x12 is related to USBIO / CVS. I haven't checked if
the sensor with that 0x12 has a _DEP to the USBIO device so you could check
whether you have that or not.

> 
> > All these io devices are not under the scope of our IPU/Camera, but we
> > have to unblock the dependencies. I also add Hao here as he made more
> > communications with these devices owner.
> 
> Bingbu and or Hao, do either of you know what is going on on some of
> the HP designs where there is a type 0x12 / handshake pin in the INT3472
> ACPI device, but there is no Lattice IO-chip involved ?
> 
> (The sensor is directly connected to I2C-busses and GPIOs coming from
> the main Alder Lake / Meteor Lake SoC on these HP laptops)

Also cc'd Siddartha, Israel and Alla.

-- 
Kind regards,

Sakari Ailus

