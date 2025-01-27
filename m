Return-Path: <linux-media+bounces-25304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6DBA1D1C0
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 08:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D50A4163CEB
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 07:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0F01FCCE2;
	Mon, 27 Jan 2025 07:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frQ6bhNR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CDA1FC7EE;
	Mon, 27 Jan 2025 07:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737964136; cv=none; b=P1VfbGSabkJMWQOZl/kzn5w4N9jyC6Av/uEu8Iz8HCVwVwJfxJ+87d8SDdHbly2wCkpw3yrfsBr9WvnA1cEGqdJyUnCvgWKk56SIs1pvZbaZot/D2a9nR8nyPaJ0wCI3u5CnWxiE9P1wWtXb7l7Rd/FDAOgp12IADmfQw7/z9iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737964136; c=relaxed/simple;
	bh=cADX+hKDzKF3QXKs0c8r+00ncO/EmagMa6UzvTASXFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iaj5c1EE9+ru/4b3DUaaYdU0V8tOK5aWQqdnPBVfMuy4zTsJZ3i6W3U36Sezc7zUPeFHTBtm6t13Sy2SWccyxTQxk42r8wGL4eZQTJMIZUCVzpPHk8netFmGFuO2GGrj6hZUpWbSAEDClGU8d0gG3cu+YjnW5OCKChNPll7AfqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frQ6bhNR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737964135; x=1769500135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cADX+hKDzKF3QXKs0c8r+00ncO/EmagMa6UzvTASXFo=;
  b=frQ6bhNRvevouBmDlTlcgqXK5RgX6NpnaPjtX2cRWGf9ctNjpV1z9WZk
   2Crc2yZFmXvzSz+Ba7dFm+vXbBRwO93Bd6TVZRlTn415SSgb3I0XuoeAx
   6VTT+DJui/+HXoPQJWGKOxuFxlpKfCsjb2r50YOrv5EkefjA+xykUlR+s
   wm5ohAM7ti68+wm928Mjvh6TQX+hrItXaCkRqOfn7ceCBRBKnDKl/OON9
   9+hzOqkVLIi8nCsPt06+9afu5TK+YB/05PRWEx836PbwBhvAp8CNmmn95
   wLH11JOS6binFe2RiWDGMizS1alABLC/sKddIQK2Hg8ztyHjKnpKfpUUm
   g==;
X-CSE-ConnectionGUID: 7gK8c18bSZm+mgfoC1fhyg==
X-CSE-MsgGUID: zNnSzhhAQwuNxq18v+pf+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38444639"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="38444639"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 23:48:54 -0800
X-CSE-ConnectionGUID: duugkzl/TwuIUWuXw6boOg==
X-CSE-MsgGUID: oowDAE0OToWWNQ4WlYT0pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="113357946"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 23:48:52 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9A49011F7E7;
	Mon, 27 Jan 2025 09:48:49 +0200 (EET)
Date: Mon, 27 Jan 2025 07:48:49 +0000
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
Message-ID: <Z5c6Yef3KBS6VbTC@kekkonen.localdomain>
References: <59f672c3-6d87-4ec7-9b7f-f44fe2cce934@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59f672c3-6d87-4ec7-9b7f-f44fe2cce934@redhat.com>

Hi Hans,

Thanks for your e-mail.

On Wed, Jan 22, 2025 at 06:19:47PM +0100, Hans de Goede wrote:
> Hi All,
> 
> Background / analysis:
> ----------------------
> 
> New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
> pin defined in the INT3472 sensor companion device which describes
> the sensor's GPIOs.
> 
> Based on what I know about this now, this pin seems to be used in at least
> 3 different scenarios:
> 
> 1. To power-up / activate some unknown auxiliary IC on HP laptop designs
> where the sensor is directly connected to the main Meteor Lake SoC for
> I2C and GPIOs (no USB io-expander used). Example dyndbg int3472 output:
> 
> HP Spectre x360 2-in-1 Laptop 16t-aa000/8C17, BIOS F.11 08/14/2024 (ov08x40):
> [    4.908016] int3472-discrete INT3472:01: unknown \_SB.GPI0 pin 65 active-high
> [    4.908019] int3472-discrete INT3472:01: GPIO type 0x12 unknown; the sensor may not work
> [    4.908100] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin 107 active-high
> (and lsusb shows no Lattice NX## / Synaptics Sabre USB-io expander)
> 
> 2. To make the Lattice chip in designs with the Lattice chip is used run
> the power-on sequence of the sensor which is handled by the Lattice chip
> firmware itself running the entire power-on/-down sequence when changing
> the GPIO value. Example dyndbg int3472 output:
> 
> Dell Latitude 7450 (with patch to map handshake in INT3472) (ov02e10):
> [    5.110920] int3472-discrete INT3472:01: Sensor name OVTI02E1:00
> [    5.111908] int3472-discrete INT3472:01: Sensor module id: 'CIFNE24'
> [    5.113653] int3472-discrete INT3472:01: handshake \_SB.PC00.XHCI.RHUB.HS05.VGPO pin 0 active-high
> [    5.113676] int3472-discrete INT3472:01: privacy-led \_SB.PC00.XHCI.RHUB.HS05.VGPO pin 2 active-high
> (with 2ac1:20c9 Lattice NX33 USB IO-expander)

The good thing is that there's a datasheet
<URL:https://mm.digikey.com/Volume0/opasdata/d220001/medias/docus/5726/FPGA-DS-02104-0-92-CrossLink-NX-33-and-CrossLink-NX-33U.pdf>
so we don't need to guess.

Lattice NX-33 is more than an USB IO expenader. Most likely it acts as a
CSI-2 RX and CSI-2 TX and does something in between, like IVSC. It should
have its own driver, even if all it does is toggle GPIOs and sleep a
little.

Any thoughts, Bingbu?

> 
> 3. For unknown reason (ACPI table bug? / not actually used) there is
> a handshake type pin in the INT3472 device on some older HP models with
> a hi556 sensor connected directly to the Alder Lake or Raptor Lake SoC,
> see e.g. the dmesg from: https://linux-hardware.org/?probe=a9a2e2ab03 :
> 
> [    9.077107] int3472-discrete INT3472:01: reset \_SB.GPI0 pin number mismatch _DSM 141 resource 301
> [    9.077170] int3472-discrete INT3472:01: power-enable \_SB.GPI0 pin number mismatch _DSM 142 resource 302
> [    9.086727] int3472-discrete INT3472:01: GPIO type 0x12 unknown; the sensor may not work
> 
> which is from a model where it has been confirmed that the FOSS stack
> works already even though we have no handshake GPIO support yet.
> 
> Testing has shown that for things to work in scenario 1. and 2. the 0x12 /
> handshake type pin needs to be driven high, followed by a msleep of 25 ms.
> 
> The 25 ms was taken from the out of tree drivers which specify this as
> minimum sleep for the Lattice case. For the HP without Lattice, the default
> 1 ms post reset delay also is not enough see:
> https://lore.kernel.org/linux-media/1664997903.107383327.1734874558698.JavaMail.zimbra@chorus.net/

Maybe that 25 ms is required for booting whatever runs on NX-33?

> 
> This applies to both the HP Spectre x360 16t without Lattice chip and
> the Dell Latitude 7450 with Lattice chip.
> 
> I suspect that there might be some micro-controller or something running
> the power-on sequence in the HP Spectre x360 16t case too, but there it
> is just a standalone chip responding to the GPIO, not an USB attached chip
> also offering, e.g. an I2C + GPIO controller like the Lattice chip.

So there's nothing unusual there in terms of USB devices there?

Would you be able to dump the ACPI tables from the HP machine? (I don't
mind Dell either.)

> 
> 
> Proposed solution:
> ------------------
> 
> I have been thinking about how to solve this without needing to modify
> sensor drivers. I think the best solution is to model the handshake
> pin as a GPIO driven "dvdd" regulator, configuring a 25 ms delay on
> enable by setting regulator_desc.enable_time to 25 ms.
> 
> The reasons for modelling this as a regulator are 3 fold:
> 
> 1. sensor chips don't have a handshake pin, so we need to abstract this
>    in some way which does not require modification to the sensor drivers,
>    sensor drivers using the bulk-regulator API to get avdd + vddio + dvdd
>    is normal. So this will work to get the right value set to the handshake
>    pin without requiring sensor driver modifications.
> 
> 2. sensors typically wait only a small time for the sensor to power-on
>    after de-asserting reset. Not the 25ms the Lattice chip requires
>    according to the out-of-tree drivers. Using the regulator framework's
>    enable_time allows hiding the need for this delay from the sensor
>    drivers.
> 
> 3. Looking at the out of tree drivers from:
>    https://github.com/intel/ipu6-drivers/tree/master/drivers/media/i2c
> 
>    They set the handshake line before de-asserting reset and sensor.
> 
>    Drivers should normally enable regulators before de-asserting reset,
>    so using a regulator will mirror the order the out of tree drivers use.
> 
>    Except that they do the 25 ms delay after setting both GPIOs,
>    arguably doing the delay to let whatever magic the handshake signal
>    does happen before de-asserting reset is better though.
> 
>    (also it seems with the exception of the pre Meteor Lake HP models
>    where handshake appears to be unused that either reset or handshake
>    is used and not both)
> 
> Please let me know what you think of this proposal. If there are
> no objections then I will start working on implementing this soon.

I'll need to dig a bit further, hoping to find out what that special GPIO
0x12 is.

-- 
Kind regards,

Sakari Ailus

