Return-Path: <linux-media+bounces-25451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 782B1A23B32
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 10:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA5DC164ADD
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 09:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B35017C225;
	Fri, 31 Jan 2025 09:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XRbAIo3z"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66891509A0
	for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 09:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738315237; cv=none; b=OAxKGqeflV/RWRd4EpdgG/h3tnXlUA3EaT6pfIuApFEH4AByvVQS3sui0kKxP9GKmg46XZY/JcF451kYfsi5ouBb073+rYBLxIaSGg+nEt7Ku5rk90aaKTP+zONlt1ZOwKXUXfOy2KkDGE8Vh8sb9m7ltSR19TvurNBlFhiwBm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738315237; c=relaxed/simple;
	bh=CR6FcP/5wlKQ5MVClJvgxzfyUrPa61FY031/iANPRLI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Xr4ampORhCQgx+RS0l87HKeb3Ugczdiyodu4H3xRtM/zCHCCdEYNfomWhDxxxos0vI6ux8G3g14Ie+ylOEQzekBxLmNFRMwn77PYxGBS17ncQZVxsZEuRWdF0Jhf2TbfQ+FfSrgzxuBByviR38WJBt/Dm+H+W14y4IUWqlkckhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XRbAIo3z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738315234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZdewNyQreii2Kp8xHOI0wM4v+bwm/DeR8UvcuPNaXXQ=;
	b=XRbAIo3zyt98oSMnPVL3EuNDimV1zJYqFPA5vGkOOsL3vyP7rj/maW+gq4pMNIRK9T5i6u
	dfPC1LVWT43R7+fUFB9qWgmpLVLvL6VGAEA+cHJJHbXHms0U00R5EDA1PIhmlePmDEGRFG
	h9uWWffmIQQu2FaA1+tmqOEN25NLWkA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-pkGITUEbOHeaz0X53Kjqig-1; Fri, 31 Jan 2025 04:20:32 -0500
X-MC-Unique: pkGITUEbOHeaz0X53Kjqig-1
X-Mimecast-MFC-AGG-ID: pkGITUEbOHeaz0X53Kjqig
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-436289a570eso14855745e9.0
        for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 01:20:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738315231; x=1738920031;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdewNyQreii2Kp8xHOI0wM4v+bwm/DeR8UvcuPNaXXQ=;
        b=grSQjGjsbkEdle0FDaaen1R7XQJPIStuhcUaCZJEpo3KUftXv4IhUC+Ji0BZGfF+Oe
         /lIimk/YbJgBE7tyoLsXgGtl1mwTqjWTC66uI21Xdhu0nJZp+rmnoQd/kiHyv3FSEMNQ
         2G2DaTsOPyxt7LeeuEVCdiAfREDhO5kwncxDKSNxb8hYNfGVSt9ItPSKdR/bkw9/3GCd
         y0jpiP6hPb47+kzxKxCiYejRWF9OlPDePGd2xG5/WjGCVkEasmBIkM9ZoVs/NalpUd4J
         ySEAE2Uyo/bwWuN3B7jYeaeXvuYjJOD0kkBi9ec6u5NgW7U1rewXISEDleHVDWHlRsrO
         AMVw==
X-Gm-Message-State: AOJu0Yzt7uw/Ny/zOpkt0sEn/QV+NKxuwvw+nBQrChQSlCPG+j52/yMN
	EE+5tiJrMxqEib0CKkdBhjHch+V3Qg10gvJZWGeNbk8YpAMWJTY7u4cVRmRZnIHR3Lm1ITRqI01
	Tff4Pa7D3rWemnHHvyNynQIeVkWHJ5tbzBoY5ksNFlNb8TQMZiJqUsgsrBcIY
X-Gm-Gg: ASbGncugDun3FQc2t1UdVZShshIyF2ht5jTWAASOUiDpKv2eXzMfTH8NrcckFjobyJ0
	u17HOJmwfCIGH0QwTAtjhZYw+KqydSJJ6jqH2wGtnF4uA7tZHzvNHdf0iEYe7IkAcWtrNk1qUOq
	z7HsLn9xtUTg0FX8jaip5DV5dVVYX4v4FUCDiNnrczdRUsbPxsyolSt91SH8a/LTdFtPgxeDGKc
	id6uOl3BxcM8YjZxsrFcbET/Nfmz2mWk35qUWD4GO4BksetukdTZUNu1a62GSVVH3E9dJiLFLXq
	hgaY0tYT/Pcgbf4SMYk58xzj6vim/aNxC03S2G8a+c/zz77Bl5EgojbiqVvL7KGxmHU5joSHUsX
	URly4hnJzs3GaLRNg8NwZSGPtO2i70bcfdy47pJzwATljzcespJPjSKU=
X-Received: by 2002:a05:6000:1faa:b0:385:fb8d:865b with SMTP id ffacd0b85a97d-38c520a344emr11195655f8f.48.1738315231087;
        Fri, 31 Jan 2025 01:20:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHExTrcZzwenvAqJ1Ch0w0dA3kkVl7u270NoiKTXVmGWyCe+iZBQ4VU8tD057pJKRp6GR8r+g==
X-Received: by 2002:a05:6000:1faa:b0:385:fb8d:865b with SMTP id ffacd0b85a97d-38c520a344emr11195596f8f.48.1738315230542;
        Fri, 31 Jan 2025 01:20:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a567d3sm260072866b.169.2025.01.31.01.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:20:29 -0800 (PST)
Message-ID: <7530fc3f-7bd9-4375-b342-b6435bad9232@redhat.com>
Date: Fri, 31 Jan 2025 10:20:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: How to deal with the INT3472 handshake GPIO found on Intel
 IPU6 MTL?
From: Hans de Goede <hdegoede@redhat.com>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 Dan Scally <djrscally@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Alan Stern <stern@rowland.harvard.edu>, "duanek@chorus.net"
 <duanek@chorus.net>
References: <59f672c3-6d87-4ec7-9b7f-f44fe2cce934@redhat.com>
 <Z5c6Yef3KBS6VbTC@kekkonen.localdomain>
 <ef5a8144-d60b-4719-926d-35e9fea5a435@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <ef5a8144-d60b-4719-926d-35e9fea5a435@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 30-Jan-25 4:34 PM, Hans de Goede wrote:
> Hi Sakari,
> 
> On 27-Jan-25 8:48 AM, sakari.ailus@linux.intel.com wrote:
>> Hi Hans,
>>
>> Thanks for your e-mail.
>>
>> On Wed, Jan 22, 2025 at 06:19:47PM +0100, Hans de Goede wrote:
>>> Hi All,
>>>
>>> Background / analysis:
>>> ----------------------
>>>
>>> New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
>>> pin defined in the INT3472 sensor companion device which describes
>>> the sensor's GPIOs.
>>>
>>> Based on what I know about this now, this pin seems to be used in at least
>>> 3 different scenarios:
>>>
>>> 1. To power-up / activate some unknown auxiliary IC on HP laptop designs
>>> where the sensor is directly connected to the main Meteor Lake SoC for
>>> I2C and GPIOs (no USB io-expander used). Example dyndbg int3472 output:
>>>
>>> HP Spectre x360 2-in-1 Laptop 16t-aa000/8C17, BIOS F.11 08/14/2024 (ov08x40):
>>> [    4.908016] int3472-discrete INT3472:01: unknown \_SB.GPI0 pin 65 active-high
>>> [    4.908019] int3472-discrete INT3472:01: GPIO type 0x12 unknown; the sensor may not work
>>> [    4.908100] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin 107 active-high
>>> (and lsusb shows no Lattice NX## / Synaptics Sabre USB-io expander)
>>>
>>> 2. To make the Lattice chip in designs with the Lattice chip is used run
>>> the power-on sequence of the sensor which is handled by the Lattice chip
>>> firmware itself running the entire power-on/-down sequence when changing
>>> the GPIO value. Example dyndbg int3472 output:
>>>
>>> Dell Latitude 7450 (with patch to map handshake in INT3472) (ov02e10):
>>> [    5.110920] int3472-discrete INT3472:01: Sensor name OVTI02E1:00
>>> [    5.111908] int3472-discrete INT3472:01: Sensor module id: 'CIFNE24'
>>> [    5.113653] int3472-discrete INT3472:01: handshake \_SB.PC00.XHCI.RHUB.HS05.VGPO pin 0 active-high
>>> [    5.113676] int3472-discrete INT3472:01: privacy-led \_SB.PC00.XHCI.RHUB.HS05.VGPO pin 2 active-high
>>> (with 2ac1:20c9 Lattice NX33 USB IO-expander)
>>
>> The good thing is that there's a datasheet
>> <URL:https://mm.digikey.com/Volume0/opasdata/d220001/medias/docus/5726/FPGA-DS-02104-0-92-CrossLink-NX-33-and-CrossLink-NX-33U.pdf>
>> so we don't need to guess.
>>
>> Lattice NX-33 is more than an USB IO expenader. Most likely it acts as a
>> CSI-2 RX and CSI-2 TX and does something in between, like IVSC. It should
>> have its own driver, even if all it does is toggle GPIOs and sleep a
>> little.
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
>> Any thoughts, Bingbu?
>>
>>>
>>> 3. For unknown reason (ACPI table bug? / not actually used) there is
>>> a handshake type pin in the INT3472 device on some older HP models with
>>> a hi556 sensor connected directly to the Alder Lake or Raptor Lake SoC,
>>> see e.g. the dmesg from: https://linux-hardware.org/?probe=a9a2e2ab03 :
>>>
>>> [    9.077107] int3472-discrete INT3472:01: reset \_SB.GPI0 pin number mismatch _DSM 141 resource 301
>>> [    9.077170] int3472-discrete INT3472:01: power-enable \_SB.GPI0 pin number mismatch _DSM 142 resource 302
>>> [    9.086727] int3472-discrete INT3472:01: GPIO type 0x12 unknown; the sensor may not work
>>>
>>> which is from a model where it has been confirmed that the FOSS stack
>>> works already even though we have no handshake GPIO support yet.
>>>
>>> Testing has shown that for things to work in scenario 1. and 2. the 0x12 /
>>> handshake type pin needs to be driven high, followed by a msleep of 25 ms.
>>>
>>> The 25 ms was taken from the out of tree drivers which specify this as
>>> minimum sleep for the Lattice case. For the HP without Lattice, the default
>>> 1 ms post reset delay also is not enough see:
>>> https://lore.kernel.org/linux-media/1664997903.107383327.1734874558698.JavaMail.zimbra@chorus.net/
>>
>> Maybe that 25 ms is required for booting whatever runs on NX-33?
> 
> Yes the comments in the out of tree driver refer to this being
> related to the Lattice fw.
> 
>>> This applies to both the HP Spectre x360 16t without Lattice chip and
>>> the Dell Latitude 7450 with Lattice chip.
>>>
>>> I suspect that there might be some micro-controller or something running
>>> the power-on sequence in the HP Spectre x360 16t case too, but there it
>>> is just a standalone chip responding to the GPIO, not an USB attached chip
>>> also offering, e.g. an I2C + GPIO controller like the Lattice chip.
>>
>> So there's nothing unusual there in terms of USB devices there?
>>
>> Would you be able to dump the ACPI tables from the HP machine? (I don't
>> mind Dell either.)
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
>> I'll need to dig a bit further, hoping to find out what that special GPIO
>> 0x12 is.
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

One remark about my idea to turn the INT3472 discrete driver into
a power-sequencing driver and have it control all the GPIOs +
timing itself. Using runtime suspend/resume with runtime-pm
device links will not work since the i2c_client does not exist
yet when the INT3472 driver binds and adding the links later
is troublesome since as soon as the i2c_client is there
the sensor driver my bind and that may want to power-up
the sensor during probe().

So instead I think we should go with Sakari's suggestion from:
https://lore.kernel.org/platform-driver-x86/Z49V5CqEt6H96LvJ@kekkonen.localdomain/

to use a virtual GPIO controller offering a "reset" or
"enable" con_id GPIO to the sensor and then do the
power-sequencing based on that GPIO being set low/high by
the sensor driver.

Regards,

Hans




