Return-Path: <linux-media+bounces-26069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D269A32765
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 14:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21A2B162737
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 13:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E1520E6E1;
	Wed, 12 Feb 2025 13:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UOIei+Tx"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC67020E6E8
	for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 13:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739367817; cv=none; b=kMC9IydIGDZ3Xd4MATS7txtcPRrSD25IRCaiMC33a+EgQM9VbP/tuvRRsqcOOTpKTBXeHgP+egAtsTBBYtOTozJgwkhrCNtCT/eCwgMOKfbWGbN6+sI1bClqkpaBwWKgyeqgzbtK/YD7QaFr0nSYzk3ASs+3Vrb1hG7Q5Lv2F9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739367817; c=relaxed/simple;
	bh=ZF6Os/9/HkxMxLVHxzfMxJMzjY7zD+STQUFdVRdU2us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/LE0WjYeYg9Lx0tgy4RRkbD3+QlVONl2jjG9fbw4vF1/Y3xtLW8t8M9ce2z8vdqqVSMBht/McApLI27xc77d8qAO1XjBaw1GRW2iT0hDFPDEUiWUBavxxslVS9MdphkFnd5yBbc3GGVBHdyAnDG8y2NMBa0mx6vpCjeHWulSbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UOIei+Tx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739367813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6XL2VqK708q1RpeyxyTAedTefYYtYIkvE/n1QVoj/1U=;
	b=UOIei+TxS7u3SHWGQmiFvZ0NJSQMKQJSiBffoQb6sqSnfRiXEdessILt95w6KATw5R4VXp
	5pigWMHhlr7j9snACutKBNO0bzhqNRiBgHkHNmkQNp+l9gF1NQKEB6L5KJECieRY9G2H5t
	QH5qErLaUuPi85BcvZ1yAj4xuPOix4s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-61s3nhPWP-O4r3lAdwbv-A-1; Wed, 12 Feb 2025 08:43:32 -0500
X-MC-Unique: 61s3nhPWP-O4r3lAdwbv-A-1
X-Mimecast-MFC-AGG-ID: 61s3nhPWP-O4r3lAdwbv-A
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ab7f0964bc3so102209766b.2
        for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 05:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739367811; x=1739972611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6XL2VqK708q1RpeyxyTAedTefYYtYIkvE/n1QVoj/1U=;
        b=ZQTgK8K2eTc5C9KoVgwRXG+Z7bIYDjECOxaUo2Hba8NgRhIqZShtqtTamsAzsn1Q52
         JgwjS7oSdUzKSiG1atloWrihV0EqzhBCn+uWQcRrwfIEUuqDcwS+9gboWcDlKZEc9CdH
         0Y2665WpK2WxFU7ZRLFRiH/2+OnnpuxhgUvQKMDFl7rtKVRFCCkcLUhXFQr4W44EEK4q
         yiYvJikdYccIUSVtUaZv8cx1lcAMYEG/XL3tvgQ3kPcij79qtZ9gW1Z0fFr2ZJdyodsS
         4J0xgW26CIbd4G04tB5+KO+XbV5jgCKs1r4/6Gy9KncHgUrnRkUJDcRhlP1wzLb6aNOL
         KNKw==
X-Gm-Message-State: AOJu0YxzvX9HivcC/s2FvERk5YYRnDNOYZrTFaSw6iWtg2Z88YFDWwwQ
	z4lWuPO4YmDWD50VSC0WBQoNOOinQFRJh0rHHvaHtaxak4N5rzknapRIEqAJSdAZeeJzUd8bHtj
	mX3dpkj5WaJoyk18auuEubOuVYqFb1gbX7s4zsUHbPnoKqpjW6/v7nGh7F8jO8J9kOywdY5I=
X-Gm-Gg: ASbGncv6vUEklqC2kcIxWZsMAgt8QyalVvLUqfUWr1nVBp1OwJ6CL2CfGrBGodtO3QA
	IvL8gI/prdzU+LO4OD1CIxTHn9TdToCGHN0sYyXP4mR9thA15wbR8TOGOh9VmuhBfInSuWOSArS
	/pH/2GcQ9eRyvjVi5dviqviWeDJJWr0kD3sBSD0VqSVj75Kx2tWWcHAC2/XxPkQNa+8aKHGkjDt
	xq/qWys8z4A1TJs4VIFmvnGfotgNvIaPEWhl4rm1s/NInlxH6fFOn2ICut/P6utkTsb+lscDVxd
	gKow3MkBfZXxntENQHR805txAnF8D8xa4qnPYZxCNDefP7tLnbQKU/V5Y6n1L1GP7Et5HxIY5JC
	P1SIcmYoHUI/7LKo/w4c7uGbne1JuZ1SO15bP8gLIHNTEkrRFFrZ5ybg=
X-Received: by 2002:a17:907:2d2a:b0:ab3:a18f:fe7f with SMTP id a640c23a62f3a-ab7f33dadc2mr254220566b.28.1739367810836;
        Wed, 12 Feb 2025 05:43:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4pVGIvEW4krZZLNwY+pNxas6npnISCSzgIfefrH3mE3lQHFc9kxtqcSEQYoBD8tiCCNQTgQ==
X-Received: by 2002:a17:907:2d2a:b0:ab3:a18f:fe7f with SMTP id a640c23a62f3a-ab7f33dadc2mr254217066b.28.1739367810240;
        Wed, 12 Feb 2025 05:43:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7e9fcd99csm261202466b.89.2025.02.12.05.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 05:43:28 -0800 (PST)
Message-ID: <4b87a956-a767-48dc-b98b-f80d9a44adc8@redhat.com>
Date: Wed, 12 Feb 2025 14:43:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: How to deal with the INT3472 handshake GPIO found on Intel
 IPU6 MTL?
To: Bingbu Cao <bingbu.cao@linux.intel.com>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 Dan Scally <djrscally@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Alan Stern <stern@rowland.harvard.edu>, "duanek@chorus.net"
 <duanek@chorus.net>, "Yao, Hao" <hao.yao@intel.com>
References: <59f672c3-6d87-4ec7-9b7f-f44fe2cce934@redhat.com>
 <Z5c6Yef3KBS6VbTC@kekkonen.localdomain>
 <ef5a8144-d60b-4719-926d-35e9fea5a435@redhat.com>
 <Z5y3XuKbdJqR_W-T@kekkonen.localdomain>
 <2796d5a8-7c52-ef3e-f274-e3f5af2991ef@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2796d5a8-7c52-ef3e-f274-e3f5af2991ef@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bingbu,

On 12-Feb-25 5:08 AM, Bingbu Cao wrote:
> 
> Hans and Sakari,
> 
> Sorry for the late reply, I am just back from holiday and take several
> days sick leave then.

NP, I hope you are feeling better now.

> On 1/31/25 7:43 PM, sakari.ailus@linux.intel.com wrote:
>> Hi Hans,
>>
>> On Thu, Jan 30, 2025 at 04:34:53PM +0100, Hans de Goede wrote:
>>> Hi Sakari,
>>>
>>> On 27-Jan-25 8:48 AM, sakari.ailus@linux.intel.com wrote:
>>>> Hi Hans,
>>>>
>>>> Thanks for your e-mail.
>>>>
>>>> On Wed, Jan 22, 2025 at 06:19:47PM +0100, Hans de Goede wrote:
>>>>> Hi All,
>>>>>
>>>>> Background / analysis:
>>>>> ----------------------
>>>>>
>>>>> New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
>>>>> pin defined in the INT3472 sensor companion device which describes
>>>>> the sensor's GPIOs.
>>>>>
>>>>> Based on what I know about this now, this pin seems to be used in at least
>>>>> 3 different scenarios:
>>>>>
>>>>> 1. To power-up / activate some unknown auxiliary IC on HP laptop designs
>>>>> where the sensor is directly connected to the main Meteor Lake SoC for
>>>>> I2C and GPIOs (no USB io-expander used). Example dyndbg int3472 output:
>>>>>
>>>>> HP Spectre x360 2-in-1 Laptop 16t-aa000/8C17, BIOS F.11 08/14/2024 (ov08x40):
>>>>> [    4.908016] int3472-discrete INT3472:01: unknown \_SB.GPI0 pin 65 active-high
>>>>> [    4.908019] int3472-discrete INT3472:01: GPIO type 0x12 unknown; the sensor may not work
>>>>> [    4.908100] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin 107 active-high
>>>>> (and lsusb shows no Lattice NX## / Synaptics Sabre USB-io expander)
>>>>>
>>>>> 2. To make the Lattice chip in designs with the Lattice chip is used run
>>>>> the power-on sequence of the sensor which is handled by the Lattice chip
>>>>> firmware itself running the entire power-on/-down sequence when changing
>>>>> the GPIO value. Example dyndbg int3472 output:
>>>>>
>>>>> Dell Latitude 7450 (with patch to map handshake in INT3472) (ov02e10):
>>>>> [    5.110920] int3472-discrete INT3472:01: Sensor name OVTI02E1:00
>>>>> [    5.111908] int3472-discrete INT3472:01: Sensor module id: 'CIFNE24'
>>>>> [    5.113653] int3472-discrete INT3472:01: handshake \_SB.PC00.XHCI.RHUB.HS05.VGPO pin 0 active-high
>>>>> [    5.113676] int3472-discrete INT3472:01: privacy-led \_SB.PC00.XHCI.RHUB.HS05.VGPO pin 2 active-high
>>>>> (with 2ac1:20c9 Lattice NX33 USB IO-expander)
>>>>
>>>> The good thing is that there's a datasheet
>>>> <URL:https://mm.digikey.com/Volume0/opasdata/d220001/medias/docus/5726/FPGA-DS-02104-0-92-CrossLink-NX-33-and-CrossLink-NX-33U.pdf>
>>>> so we don't need to guess.
>>>>
>>>> Lattice NX-33 is more than an USB IO expenader. Most likely it acts as a
>>>> CSI-2 RX and CSI-2 TX and does something in between, like IVSC. It should
>>>> have its own driver, even if all it does is toggle GPIOs and sleep a
>>>> little.
>>>
>>> I guess that what you mean is having something similar to:
>>>
>>> drivers/media/pci/intel/ivsc/mei_csi.c
>>>
>>> which just toggles the handshake GPIO on the s_stream() callback ?
>>>
>>> That would require injecting the Lattice NX33 into the media fwnode
>>> graph similar to how we are doing this for the ivsc. But where
>>> the ivsc triggers this on there being an ACPI fwnode, there does
>>> not appear to be any ACPI fwnode for the NX33 at least not
>>> on Alan's laptop where we know the handshake signal is necessary.
>>
>> I presume not all systems come with CVS/CVF but they could still use USB
>> I/O expanders.
>>
>>>
>>> https://github.com/intel/vision-drivers
>>>
>>> suggests that the new chip shows up as an i2c device when it
>>> actually is mitm-ing the sensor and here is "ls /sys/bus/i2c/devices"
>>> output for Alan's laptop with the usbio-i2c driver loaded:
>>>
>>> $ ls -l /sys/bus/i2c/devices
>>> total 0
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-0 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-0/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-1 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-1/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-10 -> ../../../devices/pci0000:00/0000:00:02.0/drm/card0/card0-DP-1/i2c-10/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-11 -> ../../../devices/pci0000:00/0000:00:02.0/drm/card0/card0-DP-2/i2c-11/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-12 -> ../../../devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-12/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-13 -> ../../../devices/pci0000:00/0000:00:15.3/i2c_designware.1/i2c-13/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-14 -> ../../../devices/pci0000:00/0000:00:1f.4/i2c-14/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-15 -> ../../../devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5:1.0/usbio-i2c.2.auto/i2c-15/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-16 -> ../../../devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5:1.0/usbio-i2c.3.auto/i2c-16/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-2 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-2/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-3 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-3/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-4 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-4/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-5 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-5/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-6 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-6/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-7 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-7/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-8 -> ../../../devices/pci0000:00/0000:00:02.0/i2c-8/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-9 -> ../../../devices/pci0000:00/0000:00:02.0/drm/card0/card0-eDP-1/i2c-9/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-HIMX1092:00 -> ../../../devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5:1.0/usbio-i2c.2.auto/i2c-15/i2c-HIMX1092:00/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-OVTI02E1:00 -> ../../../devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5:1.0/usbio-i2c.3.auto/i2c-16/i2c-OVTI02E1:00/
>>> lrwxrwxrwx. 1 root root 0 Jan  6 08:46 i2c-VEN_0488:00 -> ../../../devices/pci0000:00/0000:00:15.3/i2c_designware.1/i2c-13/i2c-VEN_0488:00/
>>>
>>> Notice there is no i2c device matching the devices expected by
>>> the vision-drivers.
>>
>> This gets interesting. This page under dell.com suggests Windows Hello is
>> supported on Latitude 7450:
>> <URL:https://www.dell.com/support/kbdoc/en-us/000225822/windows-hello-facial-recognition-may-not-work-on-dell-computers-with-mipi-cameras>.
>>
>>>
>>> I have heard that the X1 carbon gen 13 (lunar lake) does have
>>> such an i2c device.
>>>
>>> So I think that the CSI pass-through functionality is not used
>>> on Alan's laptop.
>>>
>>> Also the ivcs needed to be configured for number of CSI lanes +
>>> CSI frequency. That is not the case here. It is a fully opaque
>>> black box and Windows seems to treat it mostly as if it is
>>> not there at all.
>>>
>>> I believe that it would be best to do the same as Windows and
>>> just make sure we toggle the handshake pin and otherwise forget
>>> about the chip being there. In my many years if experience with
>>> x86 hw primarily designed for Windows trying to behave differently
>>> from Windows only causes trouble.
>>>
>>> If we were to try and model this as a separate v4l2-subdev
>>> in the media graph then then the questions become:
>>>
>>> 1. When to inject such a node. The ivsc model of going by
>>> ACPI HID's very likely does not work (or maybe it does and
>>> we simply have not seen hw yet which actually uses the vision
>>> parts? That is what the vision-drivers git repo suggests).
>>>
>>> Going by the presence of a handshake pin in the INT3472 device
>>> is riddled with problems:
>>>
>>> a. It requires digging into the ACPI resources of a device
>>> not owned by the ipu-bridge code.
>>>
>>> b. Given the HP laptop example, likely also Alan's laptop
>>> the presence of a handshake pin on meteor lake laptops does
>>> not seem to guarantee the CSI signals are actually MITM-ed
>>> by a chip, so we will likely create false-positives.
>>>
>>> c. Some previous (alder/raptor lake) HP laptops advertise
>>> a handshake pin but already work since they seem to not use it,
>>> so more false-postive matches.
>>>
>>> 2. Without an ACPI hid we have no struct-device/fwnode
>>> to use as parent for the extra v4l2-subdev, so what do we
>>> use for this ?
>>>
>>> 3. What about models where the fwnode-s for the media graph
>>> come from ACPI MIPI discovery? We skip the ipu-bridge code
>>> there ...
>>>
>>> Combining these issues with the fact that the interface
>>> is now just a single GPIO of which we do not exactly know
>>> what it does, where as with the ivsc we actually needed
>>> to program a CSI2 lane-count + link-freq I do not believe
>>> that modelling this unknown hw controlled by the handshake
>>> pin as an extra node on the media graph is the right thing
>>> to do.
>>
>> As I noted in my previous e-mail, I need to find more information on this
>> first. But when we have a device that is on the pixel data path, we likely
>> should have a driver for it, possibly also in cases there's less need for
>> control than with IVSC (CVF).
>>
>>>
>>> ATM this feels much more like some power-sequencing thing,
>>> just one more regulator / clk / reset-pin which we need
>>> to set during power-up / -down.
>>>
>>> If in the future we get models where the ACPI HIDs claimed by:
>>> https://github.com/intel/vision-drivers/blob/main/drivers/misc/icvs/intel_cvs.c#L720
>>> actually show up then we can revisit this. It might make
>>> sense to treat things like the ivsc setup in that case and
>>> then if those too use the type 0x12 GPIO on the INT3472
>>> device we can use the same code as used by the ipu-bridge
>>> to create the extra media graph nodes to opt out of mapping
>>> type 0x12 to a vdd supply.
>>>
>>> Another solution would be to move even closer to what Windows
>>> does and switch the driver for the INT3472 ACPI device from
>>> mapping pins to gpio-lookups / clks / regulators to it controlling
>>> all the GPIOs listed in the INT3472 _DSM directly from runtime
>>> suspend/resume functions, using a runtime pm device link from
>>> the sensor to ensure that the INT3472 device is suspended / resumed
>>> at the right time.
>>>
>>> This would also solve all of the mapping issues discussed in relation
>>> to the ov7251 driver expecting an "enable" pin. I believe that this
>>> would be the closest mirror of what Windows actually does and thus
>>> is what will work without issues / quirks on the most laptop models.
>>>
>>>> Any thoughts, Bingbu?
> 
> I have not dug into the Lattice device ever, but AFAIK it is more simple
> than IVSC. From the sensor driver perspective, it looks more like a
> gpio/regulator. So I don't perfer the first solution.

Ok, so this sounds like my original "Proposed solution" from the email
stating this thread, which is to model the handshake pin as a GPIO driven
"dvdd" regulator with a 25 ms enable-time is the best solution.

Sakari, I know you are not enthusiastic about this solution, we can always
opt out certain configs from treating the handshake pin this way later in
case we do want to model the Lattice NX-33 as being in the sensor data
path later.

I already have a set of old patches for the int3472/discrete.c code to
allow it to register more then one regulator per sensor which I wrote to
fix an issue on a tablet which eventually turned out to be a misdiagnosis
of that issue. I saved those patches and I think they will be useful now :)

> All these io devices are not under the scope of our IPU/Camera, but we
> have to unblock the dependencies. I also add Hao here as he made more
> communications with these devices owner.

Bingbu and or Hao, do either of you know what is going on on some of
the HP designs where there is a type 0x12 / handshake pin in the INT3472
ACPI device, but there is no Lattice IO-chip involved ?

(The sensor is directly connected to I2C-busses and GPIOs coming from
the main Alder Lake / Meteor Lake SoC on these HP laptops)

Regards,

Hans



