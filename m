Return-Path: <linux-media+bounces-25461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AD6A23D42
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 12:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 648DC1883F8F
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 11:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950A51C1AC7;
	Fri, 31 Jan 2025 11:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/FxKNgG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C6A1BF7E8;
	Fri, 31 Jan 2025 11:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738323814; cv=none; b=VspQP1i4m4EKz9Z1J6pu5ASTGxlYS4fMLhVEJtyumFMS6BFhe+RprrvTAeZNRotwu2/PTgLGf3BSuGUo5qyaooVT8mBKjGM0nkmd9IMD2Uc3gx2SVmgeyFZbW8eHtS1x2B3ExRgZ/mXdDQTDwLZ+kr/ZAcxk4wPfyYDOIGkLZQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738323814; c=relaxed/simple;
	bh=76EHXIFjz8bY9gtV3xjFx/ZAKzjnNNH3xfI3Wfl6lhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSKxeVPMV3c0RPjJec1WbtEDAIU3YOHqXm/70FmM/0P+VWipWpwU1vfkmISZWDz6LA2540FG773SEh/p2cNz1A8q/e1yiLGvzSg4/AqDhFvGyT0Jj60a8XTSQmjs7MF9ZCijAKlPEvwm45Jw7mhfZHaHwEyz9QzOrBdW9rO2Om0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/FxKNgG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738323812; x=1769859812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=76EHXIFjz8bY9gtV3xjFx/ZAKzjnNNH3xfI3Wfl6lhk=;
  b=H/FxKNgGpXzzuUuplRvWoZTklYN0AfYn/siFmgHlwGAoRl+7ar2f0oI1
   I+RN3xIMFuvVhg7AWkiZd+zk3vufBWeFZ/MSC2O32h3IeY8PYILKiOi5Y
   l7TwopWtS5R930yMZLeouxbv9LJTrJBXcJySGOgiuS7fR7uu3gypfRz5G
   TJ83Jo2gH6J4UxMHvP9CSfQU2Lgb1lFXQeLutaJoJYbp5o8ezSuE5lQ4X
   Kq4YyS6kW4CSTCg7MNnvINV0qpGKhNra+hdqOaN0jtmL25x9pUxdcYWCr
   xnpUY7K0mPOcoeHU/m2LDK4c/Dv1eJXO12fQQ9CK0XtbjnpsXPsMRGPn+
   A==;
X-CSE-ConnectionGUID: +oiS9xsoS9+y+U3TKZCllQ==
X-CSE-MsgGUID: rxMRzV/GQGKGvu+OtPrJDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="50276037"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="50276037"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 03:43:32 -0800
X-CSE-ConnectionGUID: TeEUEXnZQKmgQYri0K+7ew==
X-CSE-MsgGUID: dPic6bDyTGKhHgUa+vjd+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113631948"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 03:43:29 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9708A11F7E2;
	Fri, 31 Jan 2025 13:43:26 +0200 (EET)
Date: Fri, 31 Jan 2025 11:43:26 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	Dan Scally <djrscally@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	"duanek@chorus.net" <duanek@chorus.net>
Subject: Re: RFC: How to deal with the INT3472 handshake GPIO found on Intel
 IPU6 MTL?
Message-ID: <Z5y3XuKbdJqR_W-T@kekkonen.localdomain>
References: <59f672c3-6d87-4ec7-9b7f-f44fe2cce934@redhat.com>
 <Z5c6Yef3KBS6VbTC@kekkonen.localdomain>
 <ef5a8144-d60b-4719-926d-35e9fea5a435@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef5a8144-d60b-4719-926d-35e9fea5a435@redhat.com>

Hi Hans,

On Thu, Jan 30, 2025 at 04:34:53PM +0100, Hans de Goede wrote:
> Hi Sakari,
> 
> On 27-Jan-25 8:48 AM, sakari.ailus@linux.intel.com wrote:
> > Hi Hans,
> > 
> > Thanks for your e-mail.
> > 
> > On Wed, Jan 22, 2025 at 06:19:47PM +0100, Hans de Goede wrote:
> >> Hi All,
> >>
> >> Background / analysis:
> >> ----------------------
> >>
> >> New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
> >> pin defined in the INT3472 sensor companion device which describes
> >> the sensor's GPIOs.
> >>
> >> Based on what I know about this now, this pin seems to be used in at least
> >> 3 different scenarios:
> >>
> >> 1. To power-up / activate some unknown auxiliary IC on HP laptop designs
> >> where the sensor is directly connected to the main Meteor Lake SoC for
> >> I2C and GPIOs (no USB io-expander used). Example dyndbg int3472 output:
> >>
> >> HP Spectre x360 2-in-1 Laptop 16t-aa000/8C17, BIOS F.11 08/14/2024 (ov08x40):
> >> [    4.908016] int3472-discrete INT3472:01: unknown \_SB.GPI0 pin 65 active-high
> >> [    4.908019] int3472-discrete INT3472:01: GPIO type 0x12 unknown; the sensor may not work
> >> [    4.908100] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin 107 active-high
> >> (and lsusb shows no Lattice NX## / Synaptics Sabre USB-io expander)
> >>
> >> 2. To make the Lattice chip in designs with the Lattice chip is used run
> >> the power-on sequence of the sensor which is handled by the Lattice chip
> >> firmware itself running the entire power-on/-down sequence when changing
> >> the GPIO value. Example dyndbg int3472 output:
> >>
> >> Dell Latitude 7450 (with patch to map handshake in INT3472) (ov02e10):
> >> [    5.110920] int3472-discrete INT3472:01: Sensor name OVTI02E1:00
> >> [    5.111908] int3472-discrete INT3472:01: Sensor module id: 'CIFNE24'
> >> [    5.113653] int3472-discrete INT3472:01: handshake \_SB.PC00.XHCI.RHUB.HS05.VGPO pin 0 active-high
> >> [    5.113676] int3472-discrete INT3472:01: privacy-led \_SB.PC00.XHCI.RHUB.HS05.VGPO pin 2 active-high
> >> (with 2ac1:20c9 Lattice NX33 USB IO-expander)
> > 
> > The good thing is that there's a datasheet
> > <URL:https://mm.digikey.com/Volume0/opasdata/d220001/medias/docus/5726/FPGA-DS-02104-0-92-CrossLink-NX-33-and-CrossLink-NX-33U.pdf>
> > so we don't need to guess.
> > 
> > Lattice NX-33 is more than an USB IO expenader. Most likely it acts as a
> > CSI-2 RX and CSI-2 TX and does something in between, like IVSC. It should
> > have its own driver, even if all it does is toggle GPIOs and sleep a
> > little.
> 
> I guess that what you mean is having something similar to:
> 
> drivers/media/pci/intel/ivsc/mei_csi.c
> 
> which just toggles the handshake GPIO on the s_stream() callback ?
> 
> That would require injecting the Lattice NX33 into the media fwnode
> graph similar to how we are doing this for the ivsc. But where
> the ivsc triggers this on there being an ACPI fwnode, there does
> not appear to be any ACPI fwnode for the NX33 at least not
> on Alan's laptop where we know the handshake signal is necessary.

I presume not all systems come with CVS/CVF but they could still use USB
I/O expanders.

> 
> https://github.com/intel/vision-drivers
> 
> suggests that the new chip shows up as an i2c device when it
> actually is mitm-ing the sensor and here is "ls /sys/bus/i2c/devices"
> output for Alan's laptop with the usbio-i2c driver loaded:
> 
> $ ls -l /sys/bus/i2c/devices
> total 0
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-0 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-0/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-1 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-1/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-10 -> ../../../devices/pci0000:00/0000:00:02.0/drm/card0/card0-DP-1/i2c-10/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-11 -> ../../../devices/pci0000:00/0000:00:02.0/drm/card0/card0-DP-2/i2c-11/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-12 -> ../../../devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-12/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-13 -> ../../../devices/pci0000:00/0000:00:15.3/i2c_designware.1/i2c-13/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-14 -> ../../../devices/pci0000:00/0000:00:1f.4/i2c-14/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-15 -> ../../../devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5:1.0/usbio-i2c.2.auto/i2c-15/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-16 -> ../../../devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5:1.0/usbio-i2c.3.auto/i2c-16/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-2 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-2/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-3 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-3/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-4 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-4/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-5 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-5/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-6 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-6/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-7 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-7/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-8 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-8/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-9 -> ../../../devices/pci0000:00/0000:00:02.0/drm/card0/card0-eDP-1/i2c-9/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-HIMX1092:00 -> ../../../devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5:1.0/usbio-i2c.2.auto/i2c-15/i2c-HIMX1092:00/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-OVTI02E1:00 -> ../../../devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5:1.0/usbio-i2c.3.auto/i2c-16/i2c-OVTI02E1:00/
> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-VEN_0488:00 -> ../../../devices/pci0000:00/0000:00:15.3/i2c_designware.1/i2c-13/i2c-VEN_0488:00/
> 
> Notice there is no i2c device matching the devices expected by
> the vision-drivers.

This gets interesting. This page under dell.com suggests Windows Hello is
supported on Latitude 7450:
<URL:https://www.dell.com/support/kbdoc/en-us/000225822/windows-hello-facial-recognition-may-not-work-on-dell-computers-with-mipi-cameras>.

> 
> I have heard that the X1 carbon gen 13 (lunar lake) does have
> such an i2c device.
> 
> So I think that the CSI pass-through functionality is not used
> on Alan's laptop.
> 
> Also the ivcs needed to be configured for number of CSI lanes +
> CSI frequency. That is not the case here. It is a fully opaque
> black box and Windows seems to treat it mostly as if it is
> not there at all.
> 
> I believe that it would be best to do the same as Windows and
> just make sure we toggle the handshake pin and otherwise forget
> about the chip being there. In my many years if experience with
> x86 hw primarily designed for Windows trying to behave differently
> from Windows only causes trouble.
> 
> If we were to try and model this as a separate v4l2-subdev
> in the media graph then then the questions become:
> 
> 1. When to inject such a node. The ivsc model of going by
> ACPI HID's very likely does not work (or maybe it does and
> we simply have not seen hw yet which actually uses the vision
> parts? That is what the vision-drivers git repo suggests).
> 
> Going by the presence of a handshake pin in the INT3472 device
> is riddled with problems:
> 
> a. It requires digging into the ACPI resources of a device
> not owned by the ipu-bridge code.
> 
> b. Given the HP laptop example, likely also Alan's laptop
> the presence of a handshake pin on meteor lake laptops does
> not seem to guarantee the CSI signals are actually MITM-ed
> by a chip, so we will likely create false-positives.
> 
> c. Some previous (alder/raptor lake) HP laptops advertise
> a handshake pin but already work since they seem to not use it,
> so more false-postive matches.
> 
> 2. Without an ACPI hid we have no struct-device/fwnode
> to use as parent for the extra v4l2-subdev, so what do we
> use for this ?
> 
> 3. What about models where the fwnode-s for the media graph
> come from ACPI MIPI discovery? We skip the ipu-bridge code
> there ...
> 
> Combining these issues with the fact that the interface
> is now just a single GPIO of which we do not exactly know
> what it does, where as with the ivsc we actually needed
> to program a CSI2 lane-count + link-freq I do not believe
> that modelling this unknown hw controlled by the handshake
> pin as an extra node on the media graph is the right thing
> to do.

As I noted in my previous e-mail, I need to find more information on this
first. But when we have a device that is on the pixel data path, we likely
should have a driver for it, possibly also in cases there's less need for
control than with IVSC (CVF).

> 
> ATM this feels much more like some power-sequencing thing,
> just one more regulator / clk / reset-pin which we need
> to set during power-up / -down.
> 
> If in the future we get models where the ACPI HIDs claimed by:
> https://github.com/intel/vision-drivers/blob/main/drivers/misc/icvs/intel_cvs.c#L720
> actually show up then we can revisit this. It might make
> sense to treat things like the ivsc setup in that case and
> then if those too use the type 0x12 GPIO on the INT3472
> device we can use the same code as used by the ipu-bridge
> to create the extra media graph nodes to opt out of mapping
> type 0x12 to a vdd supply.
> 
> Another solution would be to move even closer to what Windows
> does and switch the driver for the INT3472 ACPI device from
> mapping pins to gpio-lookups / clks / regulators to it controlling
> all the GPIOs listed in the INT3472 _DSM directly from runtime
> suspend/resume functions, using a runtime pm device link from
> the sensor to ensure that the INT3472 device is suspended / resumed
> at the right time.
> 
> This would also solve all of the mapping issues discussed in relation
> to the ov7251 driver expecting an "enable" pin. I believe that this
> would be the closest mirror of what Windows actually does and thus
> is what will work without issues / quirks on the most laptop models.
> 
> > Any thoughts, Bingbu?
> > 
> >>
> >> 3. For unknown reason (ACPI table bug? / not actually used) there is
> >> a handshake type pin in the INT3472 device on some older HP models with
> >> a hi556 sensor connected directly to the Alder Lake or Raptor Lake SoC,
> >> see e.g. the dmesg from: https://linux-hardware.org/?probe=a9a2e2ab03 :
> >>
> >> [    9.077107] int3472-discrete INT3472:01: reset \_SB.GPI0 pin number mismatch _DSM 141 resource 301
> >> [    9.077170] int3472-discrete INT3472:01: power-enable \_SB.GPI0 pin number mismatch _DSM 142 resource 302
> >> [    9.086727] int3472-discrete INT3472:01: GPIO type 0x12 unknown; the sensor may not work
> >>
> >> which is from a model where it has been confirmed that the FOSS stack
> >> works already even though we have no handshake GPIO support yet.
> >>
> >> Testing has shown that for things to work in scenario 1. and 2. the 0x12 /
> >> handshake type pin needs to be driven high, followed by a msleep of 25 ms.
> >>
> >> The 25 ms was taken from the out of tree drivers which specify this as
> >> minimum sleep for the Lattice case. For the HP without Lattice, the default
> >> 1 ms post reset delay also is not enough see:
> >> https://lore.kernel.org/linux-media/1664997903.107383327.1734874558698.JavaMail.zimbra@chorus.net/
> > 
> > Maybe that 25 ms is required for booting whatever runs on NX-33?
> 
> Yes the comments in the out of tree driver refer to this being
> related to the Lattice fw.
> 
> >> This applies to both the HP Spectre x360 16t without Lattice chip and
> >> the Dell Latitude 7450 with Lattice chip.
> >>
> >> I suspect that there might be some micro-controller or something running
> >> the power-on sequence in the HP Spectre x360 16t case too, but there it
> >> is just a standalone chip responding to the GPIO, not an USB attached chip
> >> also offering, e.g. an I2C + GPIO controller like the Lattice chip.
> > 
> > So there's nothing unusual there in terms of USB devices there?
> > 
> > Would you be able to dump the ACPI tables from the HP machine? (I don't
> > mind Dell either.)
> 
> I have attached an acpidump from a HP Spectre x360 14-eu0xxx where
> the handshake pin appears to be necessary but there is no lattice chip here:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2333331
> 
> Alan can you send Sakari an acpidump of your laptop ?
> 
> <snip>
> 
> > I'll need to dig a bit further, hoping to find out what that special GPIO
> > 0x12 is.
> 
> Between this and the pin mapping discussion before I'm more and more
> convinced that we are going all wrong about this.
> 
> The INT3472 device seems to purely be a power-sequencing device which
> I believe has its own driver separate from the sensor drivers under
> Windows and the ACPI _DEP link ensures that it gets powered-up before
> the sensor device does.
> 
> We really should use this fw API as intended and simply have
> the INT3472 driver directly control the GPIOs from its own runtime
> suspend/resume methods and use a runtime-pm link to ensure
> the INT3472 device gets runtime-resumed before the sensor device
> gets runtime-resumed.
> 
> This requires basically rewriting:
> drivers/platform/x86/intel/int3472/discrete.c
> but I believe that the end result will be cleaner / smaller and this
> should solve most problems surrounding this code once and for all
> avoiding us to have to revisit things all the time to work around
> the mismatch in expectations between the ACPI tables on Windows
> laptops and the devicetree-like setup the sensor drivers expect.

If I understand you correctly, you're suggesting implementing sensor's
power on / power off sequences in the int3472 driver? The INT3472 HID
really represents TPS68470 but it indeed is used for other purposes as well
in practice.

WFIW, my understanding is that in Windows the sensor drivers are
responsible for the power sequences, too, as they are device specific,
unless something changed recently. Moving them to int3472 doesn't sound
like a great idea to me, neither from Linux specific reasons (they're
already implemented in the drivers themselves) or for aligning the
implementation with Windows (I don't think that being is done on Windows
either).

The problem we have is really that the way cameras are described in Windows
specific ACPI tables today only contains partial information for these
devices and we have to keep the rest somewhere else. Luckily without a
somewhat complicated PMIC chip like the TPS67480 this is relatively simple.
The approach we currently have should minimise extra code that is required
to make these devices function as we only amend things where they are
lacking.

I wonder what Bingbu thinks.

-- 
Regards,

Sakari Ailus

